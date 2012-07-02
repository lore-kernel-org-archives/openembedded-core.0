Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Slh6c-0005gJ-U9
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 15:55:59 +0200
Received: by lbol5 with SMTP id l5so7218397lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=t3X6NyUUFxD5kSRbYHSQ1dUZCIeAPq9OXvSPzzoVZYk=;
	b=BTeiVriiXpSfzBwPHZ+M569jyWhhAu4FtQXb7wA6gqwKi2qJIe7U579qQ+Rnxo0Hbj
	9FPpUtFE8olW95aH+Hnh6tLO7J8eDAQpwPYFhYCryUW6Mb7SgaXLktyt0+DzFLIOi9SZ
	N6brfTMOzIaDYuq2jlNSvK19ky+uYupc/FHscZ+0maKA1Ec1uZwx5WXR9U8yMTsD3DXN
	ir/77NfD2ZLBTDeUu6odFTULa3yWZdcViCZKeYExGxxYQnSS4zzfJWCnaLJUoraVC/GV
	oTBbAb/YEq7t+PsV7KoyvCiJ7ytGBHZcRdu8qNIXOju4dxMVP2Q+7UH1BGkfxB5JhjF7
	wEaQ==
Received: by 10.112.100.234 with SMTP id fb10mr6280312lbb.12.1341236698234;
	Mon, 02 Jul 2012 06:44:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Mon, 2 Jul 2012 06:44:38 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207020939420.22071@oneiric>
References: <alpine.DEB.2.02.1207020939420.22071@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 2 Jul 2012 06:44:38 -0700
X-Google-Sender-Auth: BYe_OcHRPsPfbpUZ5edktlvTfDo
Message-ID: <CABcZANkvCek+Zg82a1aQK1XA1_jPB6EgrUEzqF8aOJYW0OLXaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: can i use bitbake to run an arbitrary python routine in a class file?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 13:55:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 6:40 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   i'm not even remotely a python expert (working on that, though) so
> there may be a trivial and documented answer to this -- can i use
> bitbake to run an arbitrary python routine to see what the output
> would be?
>
>   for example, here's qemu.bbclass:
>
> def qemu_target_binary(data):
>         import bb
>
>         target_arch = data.getVar("TARGET_ARCH", True)
>         if target_arch in ("i486", "i586", "i686"):
>                 target_arch = "i386"
>         elif target_arch == "powerpc":
>                 target_arch = "ppc"
>
>         return "qemu-" + target_arch
>
> what if i wanted to see what that would return given a current build?
> can i do that?  does that question even make sense?

An anonymous python function is one which is automatically run at the
end of the parsing process. Alternatively, you can register an event
handler which can be run at any number of points where bitbake events
are fired, including the end of the recipe parse.

python () {
    bb.warn("qemu_target_binary: %s" % qemu_target_binary(d))
}

python print_some_value () {
    if not isinstance(e, bb.event.RecipeParsed):
        return
    bb.warn("qemu_target_binary: %s" % qemu_target_binary(e.data))
}
addhandler print_some_value

Alternatively, just do:

FOO = "${@qemu_target_binary(d)}"

And then: bitbake -e | grep \^FOO=
-- 
Christopher Larson


