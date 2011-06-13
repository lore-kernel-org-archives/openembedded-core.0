Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QW6iC-0008Cb-KD
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 14:57:48 +0200
Received: by yib18 with SMTP id 18so709303yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=0fajEuon4d4oj7GrEZBhnL3zsJvEAoPyu3aAnkylIZU=;
	b=MA3k2HSf6Vgn0XND9fSudtnEIbmlbtfdlXTRnRqZ7s1huXZBijRJYnXRFefsdL+vRM
	4gU4kyBiq3tpT5NO+iRX8C+jS1uNuoAyKsOn/z0pdqFGENog2VxpULF57Bmcl9c2wtGr
	wfGvb5hJPHi/j7x1/eLKFuVtUASANBbocrKJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JOQgJsnyyx+F0Bon4ya95DObBRSkqrKUXN2SQFqh3OOpALnRiqAw6/rEoBqu9D9Vbq
	h1Jl0guB1r4kUFV5lPGJQg4y/LeBVE3G6HG6YE4LFeA0hBbPOpl/O+hf5fXSpfELOKIP
	Jhikv4YTpdwfDk2PiFMpg3U/erw/muTBf6FsA=
MIME-Version: 1.0
Received: by 10.91.72.1 with SMTP id z1mr6112698agk.78.1307969663554; Mon, 13
	Jun 2011 05:54:23 -0700 (PDT)
Received: by 10.90.96.1 with HTTP; Mon, 13 Jun 2011 05:54:23 -0700 (PDT)
In-Reply-To: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 08:54:23 -0400
Message-ID: <BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] qemu* kernel configs
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
X-List-Received-Date: Mon, 13 Jun 2011 12:57:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 8:10 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Hi,
>
> After finding the bug Scott was running into with systemd-image (no DEVTM=
PFS support) I have a closer look at the qemarm kernel config and it looks =
dated to me. If we want to have tools like udev, powertop, iotop, latencyto=
p working we need to revisit the config. From a quick look I found the foll=
owing items missing/incomplete:
>
> * devtmpfs + devtmpfs automounting. Recent udev versions require it
> * cgroups, systemd requires it
> * process accounting, *top uses it
> * fuse, gvfs requires it
> * autofs4, systemd works a lot better with it
>
> So what are people's thoughts on enabling the items that weren't set befo=
re and moving modules to built-in were > needed? And if it's wanted, does a=
nyone have a quickstart on how these changes should be done properly? My 5 =
> minutes of google and 30 minutes of staring at the meta/ subdir didn't yi=
eld results.

Hi Koen,

The base configuration for the qemu* machines is kept as minimal as
possible by design. It is supposed to be used as a building block, not
cater to all the different image types we can throw at them by default.

So in this case, there may be some configs that we can turn on, but it
is not supposed to be a kitchen sink model, or have everything possible
we may need as a module module either. We can also create groups of
optional functionality, merge it into the kernel and enable it from the
various recipe appends. That way the base configuration does in
fact stay as the lowest common denominator, but other use cases can
enable what they need.

If you have changes required for other uses of qemu*, tossing them into
any file of the format <foo>.cfg and putting it in your SRC_URI will apply
those config fragments after the base configuration. Those changes
can then be sent and proposed as defaults, or kept in additional layers
that cater to particular image types and test scenarios.

Cheers,

Bruce

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


