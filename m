Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pv9K7-0001Q4-QZ
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:16:13 +0100
Received: by wwe15 with SMTP id 15so1230340wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 06:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=g329f2qucSQXGPgaoJB1kGkGtHgftu6I3Z/XLne3J7Q=;
	b=UuxCvLtyXaSg0qXYWurd2RXvq5Zr0J/mVo9WXzFb68OKK4YzqaJRZybydrAEDI6SAf
	o67Ku2zSVs5568pVTxwFQWp+r0zIu6JtI/hZHA7euoeplXaZtGOA2pAZYnD2pXY9gOMe
	SlbOT18t6xNh3wW5WxLDd02eJFTfvUgh1QqJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=nURNi4uJAR68arbwu/EuQd5puR//hQcTNNpL6YXRm/iN9J73998QNMP7mA8unrQTdx
	jnF/aZTBJcBd3eSrdyGpuolXzbwRXH8ecpVI3x9VUKn7ylN/PD61VBhDYYE/+IEirIrP
	bn8PcCDAYi7mBU1UB/ooNfEaAd6RxWgZIKe9o=
Received: by 10.216.28.19 with SMTP id f19mr885495wea.88.1299161670080; Thu,
	03 Mar 2011 06:14:30 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Thu, 3 Mar 2011 06:14:10 -0800 (PST)
In-Reply-To: <1299161111.2550.8.camel@scimitar>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
	<1299161111.2550.8.camel@scimitar>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 Mar 2011 07:14:10 -0700
X-Google-Sender-Auth: KvSiOVzvj4Zd0CmPGdQSuuQGtZA
Message-ID: <AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:16:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2011 at 7:05 AM, Joshua Lock <josh@linux.intel.com> wrote:
> I agree, in fact yesterday I discovered we have the beginnings of such a
> tool (bitbake-layers) written by Chris. Currently it prints out which
> recipes are being modified by a .bbappend and .bbappend files for which
> no recipe exists.
>
> I had to write a trivial patch (attached) to make it work but it's a
> good start. :-)

Note that "fixes the instantiation of the BBCooker to match recent
changes in the BitBake libraries." is not correct.  It's not a recent
change, it's a poky vs upstream difference at the moment, due to the
switch to the Process based server.  The change in that patch will
make it work with poky, which is good, but not with master.

This is the last somewhat large piece of the bitbake sync, as far as I
know -- we need to decide how best to resurrect the XML/RPC server in
master, but we haven't yet determined how the user should select their
server.  For the average user, they just want to run a UI, the server
is implementation details, so I'd argue that we let the UI instantiate
the server it needs, create a UI that spawns an xml/rpc server and
displays the connection info to stdout, and add an env var to let the
other UIs connect to a nondefault server, but there are other
possibilities that need to be considered.  In poky, you have to
comment/uncomment lines in bin/bitbake, which is .. not ideal :)

Do let me know if you come up with any good ideas for additional
commands for the bitbake-layers tool -- I'm sure there are plenty of
useful things we can add to assist in layer maintenance.  Thanks!
I'll apply the #! change to upstream right away.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


