Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB86BC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 18:36:24 +0000 (UTC)
Subject: Broken FIT image signing since "u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled"
To: openembedded-core@lists.openembedded.org
From: "Rogerio Guerra Borin" <rogerio.borin@toradex.com>
X-Originating-Location: =?UTF-8?B?U8OjbyBQYXVsbywgU2FvIFBhdWxvLCBCUg==?= (189.33.122.79)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 10:36:23 -0800
Message-ID: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fDs55NpUKNX6TxUMsX2j"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211507

--fDs55NpUKNX6TxUMsX2j
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

At Toradex we're using class "kernel-fitimage" to produce our signed kernel=
 FIT images and we've found that the recent commit d7bd9c627661 ("u-boot: k=
ernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enab=
led") broke our builds. The logs of a failed build show the following messa=
ge that I found noteworthy:

log.do_uboot_assemble_fitimage.841485:
...
Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.key': No such f=
ile or directory

The odd thing was that the build was setting:

UBOOT_SIGN_KEYNAME =3D "dev"
UBOOT_SIGN_IMG_KEYNAME =3D "dev2"
FIT_SIGN_INDIVIDUAL =3D "0"
FIT_GENERATE_KEYS =3D "0"

From the above we see the individual images signing is disabled but the sys=
tem is trying to access the key file for the individual signing (dev2) rega=
rdless of that. Checking the code in uboot-sign.bbclass I found this line:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ubo=
ot-sign.bbclass?h=3Dscarthgap#n116

that is responsible for that access (inside function concat_dtb()). The cod=
e is always referencing variable UBOOT_SIGN_IMG_KEYNAME regardless of FIT_S=
IGN_INDIVIDUAL being set to "1" or "0" even though there's a condition a co=
uple lines above L116 where FIT_SIGN_INDIVIDUAL is tested to decide in whic=
h mode to run the signing tool. To better understand the behavior I created=
 dev2.{key,crt} files and retried a build which worked. However, checking t=
he contents of the final u-boot.dtb file I found that the "dev2" key node w=
as present but the "dev" key wasn't. Then, checking the contents of the fin=
al fitImage I noticed the configuration nodes were signed by the dev key wh=
ile the individual images were not signed (as expected). But that means suc=
h a system wouldn't boot since the required "dev" key is not present in the=
 U-Boot DTB, from what I conclude the FIT signing is broken at the moment.

So, first of all I wanted to let you guys know about this issue (hoping we'=
re not doing anything wrong with our builds).

As a second point, I wanted to confirm the expected behavior regarding vari=
able FIT_SIGN_INDIVIDUAL. According to the documentation:

https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-FIT_SIGN=
_INDIVIDUAL

when its value is "1" the individual images will be signed *in addition* to=
 the FIT image being signed. From that, I understand that the configuration=
s will be always signed and the individual images may or may not be signed =
depending on FIT_SIGN_INDIVIDUAL. I kind of confirmed this behavior by chec=
king our build artifacts on kirkstone: with FIT_SIGN_INDIVIDUAL=3D"0" the U=
-Boot DTB has only the "dev" key and the fit image is signed by that same k=
ey; with FIT_SIGN_INDIVIDUAL=3D"1" both keys are present in the DTB, the co=
nfigurations are signed by the "dev" key and the images by the "dev2" key. =
I understand this is the correct behavior, right?

I'm asking because looking at the comment at:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ubo=
ot-sign.bbclass?h=3Dscarthgap#n106

it gives me the impression that FIT_SIGN_INDIVIDUAL would select between ei=
ther signing individual images or signing the configurations, which doesn't=
 match the documented behavior. I believe the code in concat_dtb() also see=
ms to assume only one of the keys (dev/dev2) would need be present in the D=
TB. So the fix would involve a review on this as well I imagine.

--fDs55NpUKNX6TxUMsX2j
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hello,</div>
<div>&nbsp;</div>
<div>At Toradex we're using class "kernel-fitimage" to produce our signed k=
ernel FIT images and we've found that the recent commit d7bd9c627661 ("u-bo=
ot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV=
 enabled") broke our builds. The logs of a failed build show the following =
message that I found noteworthy:</div>
<div>&nbsp;</div>
<div style=3D"padding-left: 40px;">log.do_uboot_assemble_fitimage.841485:<b=
r />...<br />Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.ke=
y': No such file or directory</div>
<div style=3D"padding-left: 40px;">&nbsp;</div>
<div>The odd thing was that the build was setting:</div>
<div>&nbsp;</div>
<div style=3D"padding-left: 40px;">UBOOT_SIGN_KEYNAME =3D "dev"<br />UBOOT_=
SIGN_IMG_KEYNAME =3D "dev2"<br />FIT_SIGN_INDIVIDUAL =3D "0"<br />FIT_GENER=
ATE_KEYS =3D "0"</div>
<div style=3D"padding-left: 40px;">&nbsp;</div>
<div>From the above we see the individual images signing is disabled but th=
e system is trying to access the key file for the individual signing (dev2)=
 regardless of that. Checking the code in uboot-sign.bbclass I found this l=
ine:</div>
<div>&nbsp;</div>
<div>https://git.openembedded.org/openembedded-core/tree/meta/classes-recip=
e/uboot-sign.bbclass?h=3Dscarthgap#n116</div>
<div>&nbsp;</div>
<div>that is responsible for that access (inside function concat_dtb()). Th=
e code is always referencing variable UBOOT_SIGN_IMG_KEYNAME regardless of =
FIT_SIGN_INDIVIDUAL being set to "1" or "0" even though there's a condition=
 a couple lines above L116 where FIT_SIGN_INDIVIDUAL is tested to decide in=
 which mode to run the signing tool. To better understand the behavior I cr=
eated dev2.{key,crt} files and retried a build which worked. However, check=
ing the contents of the final u-boot.dtb file I found that the "dev2" key n=
ode was present but the "dev" key wasn't. Then, checking the contents of th=
e final fitImage I noticed the configuration nodes were signed by the dev k=
ey while the individual images were not signed (as expected). But that mean=
s such a system wouldn't boot since the required "dev" key is not present i=
n the U-Boot DTB, from what I conclude the FIT signing is broken at the mom=
ent.</div>
<div>&nbsp;</div>
<div>So, first of all I wanted to let you guys know about this issue (hopin=
g we're not doing anything wrong with our builds).</div>
<div>&nbsp;</div>
<div>As a second point, I wanted to confirm the expected behavior regarding=
 variable FIT_SIGN_INDIVIDUAL. According to the documentation:</div>
<div>&nbsp;</div>
<div><a href=3D"https://docs.yoctoproject.org/5.0.6/ref-manual/variables.ht=
ml#term-FIT_SIGN_INDIVIDUAL" target=3D"_blank" rel=3D"noopener">https://doc=
s.yoctoproject.org/5.0.6/ref-manual/variables.html#term-FIT_SIGN_INDIVIDUAL=
</a></div>
<div>&nbsp;</div>
<div>when its value is "1" the individual images will be signed *in additio=
n* to the FIT image being signed. From that, I understand that the configur=
ations will be always signed and the individual images may or may not be si=
gned depending on FIT_SIGN_INDIVIDUAL. I kind of confirmed this behavior by=
 checking our build artifacts on kirkstone: with FIT_SIGN_INDIVIDUAL=3D"0" =
the U-Boot DTB has only the "dev" key and the fit image is signed by that s=
ame key; with FIT_SIGN_INDIVIDUAL=3D"1" both keys are present in the DTB, t=
he configurations are signed by the "dev" key and the images by the "dev2" =
key. I understand this is the correct behavior, right?</div>
<div>&nbsp;</div>
<div>I'm asking because looking at the comment at:</div>
<div>&nbsp;</div>
<div><a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/cl=
asses-recipe/uboot-sign.bbclass?h=3Dscarthgap#n106" target=3D"_blank" rel=
=3D"noopener">https://git.openembedded.org/openembedded-core/tree/meta/clas=
ses-recipe/uboot-sign.bbclass?h=3Dscarthgap#n106</a></div>
<div>&nbsp;</div>
<div>it gives me the impression that FIT_SIGN_INDIVIDUAL would select betwe=
en either signing individual images or signing the configurations, which do=
esn't match the documented behavior. I believe the code in concat_dtb() als=
o seems to assume only one of the keys (dev/dev2) would need be present in =
the DTB. So the fix would involve a review on this as well I imagine.</div>
<div>&nbsp;</div>
</div>

--fDs55NpUKNX6TxUMsX2j--

