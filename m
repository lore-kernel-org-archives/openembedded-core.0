Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6C6CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:20:18 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46018.1778491214730361791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=GKe8BLuO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=e7gK22rL;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C18791D000B4;
	Mon, 11 May 2026 05:20:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 11 May 2026 05:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778491213; x=1778577613; bh=D0BR/qAlh4
	O7+aapwdr6jjh6t6Fc+eauRX3jZItrhko=; b=GKe8BLuO6N4quADHqWBJ3vzf0k
	VGOGpXAxgzzi21RbYysY3HxuvPMVg71Ympgc1XXAeILp0bQ9c9ytLxwbNlwQgkJ4
	NKmmbAxHstxZouKYQkrA2k7eF4J9652FaJOvTZoMWIYmX1fZOlzdyWUqeMQ8dbV0
	S3k/xjI6rNfBPG2I4AvWO13ETM4cB8cgSXWh7Y+7h6gPY+Gg8jp6T6Ccssy20xdE
	QrzR4QEGv3OAlZtPDTTeldk/iOWPkKjTlavpUl+NiT2fOcTpCbj32Ugix53+3sZs
	+C7GXBVRZFAvSCUnbrhJXAVTk3QV3/uoc5VU2LLOdLNFaiNYtDklZ5clqGAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778491213; x=1778577613; bh=D0BR/qAlh4O7+aapwdr6jjh6t6Fc+eauRX3
	jZItrhko=; b=e7gK22rLJc9Rwa8RtGHBSup3AWHA8zQKkbxb7bAhlnOrQ0+1ymz
	2cRLvbmvuP0xKmbm1kAFpxLXxU3hWjaLy3eWpOkd0/HgjSUDDZj/yqAGRon1wWit
	aTc+ZQVdKeRJc0DU1GuqsT609FCwWN+/AIRDsIpignsByrw/XBHmLAyJ8Py77I+b
	lvrAmhJsAV4OmnVTDQrHFMRzEs78AF3JzXEWmRyz3l/dNNMDK5ahpIOGxXbsLgcu
	uwxesej8Tsa7P7AXZCwkf0CVgUN3z6StxbxyMQcp0i0QeB6IQfUEz1a4ghZsi7Yf
	yVf5z9UeiOgC+qZu8LIsvhL3MMBmzhJUtJQ==
X-ME-Sender: <xms:TJ8Bahas8MzQHRKoEeaTBuQ2O7UdL8GzfbK-KxpPY6qJ8HB4MuJSdA>
    <xme:TJ8BamMXfQ7yNzWAVl4GWxaSKp4Cddi5UkXgbjl_8-xl7YaxAFEkDkLJX0wmSPMCF
    8X5Sut1oAxI1sY4x0PHikX8yV6Z8WUkMD5YblFAgYqTZB3I3C2hNqI>
X-ME-Received: <xmr:TJ8BauYcy6SQRc6eyP-m8OTMhcV29scyq_lpLScdsdetqz_IhsYuzp29jhd8HWIBfbvSdu-wd21bEgFjajkMIIGDNURTZ1GIph6ZJAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epvdetiefhheetfeevkeevieejkeevtdetieefhfeivedtvdffhfegtdehleehhfehnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgpdhgihhthhhusgdrtghomhdptghhmhhougdrrhhsnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrd
    guvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegthhgrnhhgqhhinhhgrdhlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhope
    hrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdroh
    hrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdho
    phgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:TJ8Bas0_EA0GiAQVn3KTZbO2-C1ttPQ_ggSFRkkHiw8ASJwOf17DNA>
    <xmx:TJ8BasdrJEgPAAAzi1iQasnlD6RvrNcgyanYaHpLz61IRPLNNnXxFQ>
    <xmx:TJ8BalGU93j7bNQFqXxZVU7KTXPIWCJjNRSlLaKc_AblKwIijYJHag>
    <xmx:TJ8Bal1_aYzV2Kl44SftRyyy5KgYUGs2JoUZWNQOQiKupDsl-Ssc0A>
    <xmx:TZ8BatD70Cmbg_DRc873yS_N0KlARZ-yNEpBdcr0M2Ej97npWwto1bSa>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 05:20:12 -0400 (EDT)
Message-ID: <bea858ef1fc7f5e3307790a5cbe08eabd79b5bad.camel@pbarker.dev>
Subject: Re: [OE-core] Pseudo abort issue on ubuntu 26.04
From: Paul Barker <paul@pbarker.dev>
To: Changqing Li <changqing.li@windriver.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, "mark.hatle@kernel.crashing.org"
	 <mark.hatle@kernel.crashing.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2026 10:20:08 +0100
In-Reply-To: <ec3ffbf5-09b7-4176-a032-f0473f741be5@windriver.com>
References: 
	<DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
	 <0aa707e8222442434bf9361242653873931b9af3.camel@pbarker.dev>
	 <db7385e4-6c92-42d7-8526-ce6192b7f775@windriver.com>
	 <10dbe396971651a67f0dbe0056f7e8f3d4957620.camel@pbarker.dev>
	 <d9f3b4688610911f39708cf584da58b5be3e25fe.camel@pbarker.dev>
	 <ec3ffbf5-09b7-4176-a032-f0473f741be5@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HMgoeTMIJi1js2J/ZCSM"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236789


--=-HMgoeTMIJi1js2J/ZCSM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-11 at 16:47 +0800, Changqing Li wrote:
> On 5/11/26 16:09, Paul Barker wrote:
> > On Sun, 2026-05-10 at 16:37 +0100, Paul Barker wrote:
> > > On Sat, 2026-05-09 at 09:41 +0800, Changqing Li wrote:
> > > > On 5/8/26 22:58, Paul Barker via lists.openembedded.org wrote:
> > > > > CAUTION: This email comes from a non Wind River email account!
> > > > > Do not click links or open attachments unless you recognize the s=
ender and know the content is safe.
> > > > >=20
> > > > > On Fri, 2026-05-08 at 13:19 +0000, Changqing Li via
> > > > > lists.openembedded.org wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > I am trying to build project on ubuntu 26.04.  "bitbake postfix=
"  failed  at do_package since pseudo abort,   after doing  some search, it=
 is caused by ubtunu26.04's new change,  Ubuntu has officially begun transi=
tioning its core system utilities from the traditional GNU Coreutils (writt=
en in C) to uutils (a Rust-based rewrite).   I would like to seek some help=
,  could you give some advices about how we should handle this?  Thanks.
> > > > > >=20
> > > > > > Here is how  it happened:
> > > > > > * =E2=80=8E  In do_install stage:
> > > > > > There are  2 files target to installed under ${D}: (there are o=
ther files following this pattern)
> > > > > > ${D}/usr/libexec/postfix/smtp:     which is  mv from file under=
 {S}, and then chmod
> > > > > > ${D}/usr/libexec/postfix/lmtp:      hardlink to ${D}/usr/libexe=
c/postfix/smtp
> > > > > >=20
> > > > > > With the old gnu coreutils:
> > > > > > when install smtp,   mv will call renameat2, which will finally=
 calling real syscall since the oldpath is under {S} which is not in PSEUDO=
_INCLUDE_PATHS.
> > > > > > then chmod call fchmodat,   then fchmodat wrapper will save an =
entry with uid 0 in files.db.   install lmtp will also insert an entry with=
 uid 0 in files.db
> > > > > >=20
> > > > > > With the new rust coreutils:
> > > > > > when install smtp,    the behavior of chmod is different,   sta=
tx get current mode,  rust chmod check the current mode  is the same as the=
 target mode, then
> > > > > > fchmodat is never called, then smtp is not saved in files.db,  =
and this will also make install lmtp insert an entry with real uid like 256=
10  in files.db since smtp is not found in files.db
> > > > > >=20
> > > > > > * =E2=80=8E  in do_package stage:
> > > > > >=20
> > > > > > Exception: subprocess.CalledProcessError: Command 'tar --exclud=
e=3D./sysroot-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfi=
x/3.10.8/image -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-li=
nux/postfix/3.10.8/package' returned non-zero exit status 2.
> > > > > >=20
> > > > > > Subprocess output:
> > > > > > abort()ing pseudo client by server request. See https://wiki.yo=
ctoproject.org/wiki/Pseudo_Abort for more details on this.
> > > > > > Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3=
-oe-linux/postfix/3.10.8/pseudo//pseudo.log
> > > > > >=20
> > > > > > tar command may  call stat  for ${D}/usr/libexec/postfix/smtp, =
  since the  we have a same inode entry in files.db for lmtp, above error r=
eported.
> > > > > >=20
> > > > > >=20
> > > > > > The key  issue is ${D}/usr/libexec/postfix/smtp is not inserted=
 in files.db in do_install stage,  which will cause wrong uid for lmtp and =
 psedo abort in do_package stage.
> > > > > > I think we cannot change behavior of rust coreutils.   I am won=
dering even we patch postfix to not use hardlink, the pseudo abort issue ma=
y disappear,  but since
> > > > > > chmod not call fchmodat,   we don't insert entries for these fi=
les,   maybe the uid etc is wrong in final image.
> > > > > >=20
> > > > > > [1] https://github.com/uutils/coreutils/blob/main/src/uu/chmod/=
src/chmod.rs
> > > > > > [2] https://github.com/coreutils/coreutils/blob/master/src/chmo=
d.c
> > > > > > [3] https://lists.openembedded.org/g/openembedded-devel/topic/1=
19211397    // patch for build postfix with linux kernel 7.x
> > > > > Hi Changqing,
> > > > >=20
> > > > > The tar command failing with exit status 2 should be resolved by =
recent
> > > > > changes in pseudo. Which Yocto Project version are you using?
> > > > I use the latest master branch with pseudo 1.9.6.=C2=A0And this iss=
ue only
> > > > can reproduce with ubuntu26.04 with uutils installed.
> > > >=20
> > > > ubuntu24.04 with gnu-coreutils=C2=A0 works well.
> > > Hi Changqing,
> > >=20
> > > I looked into this as the chmod behaviour differences you described
> > > didn't sound like an issue to me.
> > >=20
> > > I think the actual issue is that files moved (instead of copied) into
> > > ${D} are not tracked by pseudo. For postfix, when using GNU coreutils
> > > this issue is hidden because chmod always sets the permissions of the
> > > file, which pseudo observes. When using uutils on Ubuntu 26.04, chmod
> > > may not set the permissions if they are already correct, so pseudo
> > > doesn't observe anything it can add to its database.
> > >=20
> > > A simple recipe can reproduce this issue on Debian 13 (where uutils i=
s
> > > not used) as well as Ubuntu 26.04:
> > >=20
> > >      LICENSE =3D "MIT"
> > >      LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D=
3da9cfbcb788c80a0384361b4de20420"
> > >=20
> > >      do_compile() {
> > >          echo hello > ${B}/hello.txt
> > >      }
> > >=20
> > >      do_install() {
> > >          mv ${B}/hello.txt ${D}/hello.txt
> > >          ln ${D}/hello.txt ${D}/hello2.txt
> > >      }
> > >=20
> > >      FILES:${PN} +=3D "/hello2.txt /hello.txt"
> > >=20
> > > Building this recipe fails with the same pseudo abort which you are
> > > seeing. If we use "cp" instead of "mv" in do_install then this works =
as
> > > expected.
> > >=20
> > > I'll discuss this with Mark and see how we want to handle it.
> > The recipe above also causes a pseudo abort on the initial Scarthgap
> > release (tag yocto-5.0) so this isn't a new issue, recent changes in
> > pseudo are not responsible.
>=20
> Hi, Paul
>=20
> Thanks for help.=C2=A0 You are right.=C2=A0 And I tried to patch pseudo l=
ocally to=20
> make renameat2/renameat only ignore
>=20
> when both oldpath and newpath are not in PSEUDO_INCLUDE_PATHS, and do a=
=20
> simple test,=C2=A0 at least
>=20
> bitbake postfix works well without pseudo abort.=C2=A0 =C2=A0After tidy u=
p the=20
> patch,=C2=A0 I=C2=A0 can send the patch to upstream pseudo
>=20
> for review.

Hi Changqing,

If you have a patch for pseudo which fixes this, that would be very
welcome!

Thanks,

--=20
Paul Barker


--=-HMgoeTMIJi1js2J/ZCSM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGfSBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bk+NAPwNJgyemTWR0SDBZ6uGp9b5uPdh3Kj6HgsO
ue0DHdqt9AEAoaGCKu98fWUsgyfNj3k5xHxf+5pkYhIvK0nHSNWKSgA=
=ip2O
-----END PGP SIGNATURE-----

--=-HMgoeTMIJi1js2J/ZCSM--

