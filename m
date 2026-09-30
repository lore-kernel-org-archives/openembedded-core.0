Return-Path: <WXbet@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9720ACA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 17:54:27 +0000 (UTC)
Subject: Re: [PATCH] kernel: use absolute paths in the kernel-image scripts
To: openembedded-core@lists.openembedded.org
From: "WXbet" <WXbet@proton.me>
X-Originating-Location: Brechen, Hesse, DE (94.31.114.216)
X-Originating-Platform: Windows Edge 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 10:54:20 -0700
References: <20260914182130.19543-1-wxbet.oe@gmail.com> <96d7662de4f754571942df16f9944fa8ce13a0f7.camel@pbarker.dev>
In-Reply-To: <96d7662de4f754571942df16f9944fa8ce13a0f7.camel@pbarker.dev>
Message-ID: <1329699.1790790860483693246@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UHK7jTpmDqdrfAKuJKiM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 17:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247000

--UHK7jTpmDqdrfAKuJKiM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sat, 2026-09-26, Paul Barker wrote:
> This describes two issues, we shouldn't just fix one of them. We should
> also fix the on-target postinst script relying on a command that is by
> default missing if you use busybox.
>
> I think should just enable CONFIG_INSTALL in the busybox defconfig.

Agreed, I'll include that in v2.

> I think the solution is to use an absolute path for this variable in
> kernel.bbclass. Then the rest of this patch becomes unnecessary

I looked into this. Changing the default alone breaks the build:
kernel.bbclass and kernel-devicetree.bbclass prefix the variable with
'/' in FILES:

kernel.bbclass:121 =C2=A0 =C2=A0'/' + imagedest + '/' + type + ...
kernel.bbclass:685 =C2=A0 =C2=A0/${KERNEL_IMAGEDEST}/System.map* ...
kernel.bbclass:686 =C2=A0 =C2=A0/${KERNEL_IMAGEDEST}/vmlinux-...
kernel-devicetree.bbclass:17-21 =C2=A0/${KERNEL_DTBDEST}/... (defaults to
${KERNEL_IMAGEDEST})

With "/boot" these become "//boot/...", which populate_packages rejects
with files-invalid. That check is in CHECKLAYER_REQUIRED_TESTS, so it
is an error by default.

We can drop the '/' prefix in oe-core, but BSP layers that write
"/${KERNEL_IMAGEDEST}" in their own FILES or do_install and keep the
default would then fail with the same QA error. That pattern is common
because it is what oe-core itself uses today.

So I see two options for v2:

1) Keep the fix in the postinst/postrm scripts as in v1, plus the
busybox patch. No change for layers.

2) KERNEL_IMAGEDEST ?=3D "/boot", drop the '/' prefix in the FILES
entries in oe-core, plus the busybox patch, and a migration note
for layers that use "/${KERNEL_IMAGEDEST}" in FILES.

Which one would you prefer?

Best regards,
WXbet

--UHK7jTpmDqdrfAKuJKiM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,<br /><br />On Sat, 2026-09-26, Paul Barker wrote:<br />&gt; T=
his describes two issues, we shouldn't just fix one of them. We should<br /=
>&gt; also fix the on-target postinst script relying on a command that is b=
y<br />&gt; default missing if you use busybox.<br />&gt;<br />&gt; I think=
 should just enable CONFIG_INSTALL in the busybox defconfig.<br /><br />Agr=
eed, I'll include that in v2.<br /><br />&gt; I think the solution is to us=
e an absolute path for this variable in<br />&gt; kernel.bbclass. Then the =
rest of this patch becomes unnecessary<br /><br />I looked into this. Chang=
ing the default alone breaks the build:<br />kernel.bbclass and kernel-devi=
cetree.bbclass prefix the variable with<br />'/' in FILES:<br /><br />&nbsp=
; kernel.bbclass:121 &nbsp; &nbsp;'/' + imagedest + '/' + type + ...<br />&=
nbsp; kernel.bbclass:685 &nbsp; &nbsp;/${KERNEL_IMAGEDEST}/System.map* ...<=
br />&nbsp; kernel.bbclass:686 &nbsp; &nbsp;/${KERNEL_IMAGEDEST}/vmlinux-..=
.<br />&nbsp; kernel-devicetree.bbclass:17-21 &nbsp;/${KERNEL_DTBDEST}/... =
(defaults to<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${KERNE=
L_IMAGEDEST})<br /><br />With "/boot" these become "//boot/...", which popu=
late_packages rejects<br />with files-invalid. That check is in CHECKLAYER_=
REQUIRED_TESTS, so it<br />is an error by default.<br /><br />We can drop t=
he '/' prefix in oe-core, but BSP layers that write<br />"/${KERNEL_IMAGEDE=
ST}" in their own FILES or do_install and keep the<br />default would then =
fail with the same QA error. That pattern is common<br />because it is what=
 oe-core itself uses today.<br /><br />So I see two options for v2:<br /><b=
r />&nbsp; 1) Keep the fix in the postinst/postrm scripts as in v1, plus th=
e<br />&nbsp; &nbsp; &nbsp;busybox patch. No change for layers.<br /><br />=
&nbsp; 2) KERNEL_IMAGEDEST ?=3D "/boot", drop the '/' prefix in the FILES<b=
r />&nbsp; &nbsp; &nbsp;entries in oe-core, plus the busybox patch, and a m=
igration note<br />&nbsp; &nbsp; &nbsp;for layers that use "/${KERNEL_IMAGE=
DEST}" in FILES.<br /><br />Which one would you prefer?<br /><br />Best reg=
ards,<br />WXbet</div>

--UHK7jTpmDqdrfAKuJKiM--

