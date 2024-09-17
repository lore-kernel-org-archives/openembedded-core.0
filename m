Return-Path: <pierreloupgosse@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87E2C35FF8
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 08:53:37 +0000 (UTC)
Subject: U-boot signed SPL dtb+pubkey discussion
To: openembedded-core@lists.openembedded.org
From: "Pierre-Loup Gosse" <pierreloupgosse@gmail.com>
X-Originating-Location: FR (195.68.54.115)
X-Originating-Platform: Linux Firefox 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Sep 2024 01:53:29 -0700
Message-ID: <fNs4.1726563209514202904.klOv@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XffoSd015eNwARXJpyVa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 08:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204619

--XffoSd015eNwARXJpyVa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

If SPL_SIGN_ENABLE is set to 1, the uboot-sign bbclass will sign the u-boot=
 fit image and add the public key to SPL dtb ('uboot_fitimage_assemble' fun=
ction).
Before deployment, the class concat the SPL no-dtb binary with SPL dtb+pubk=
ey to produce the SPL binary ('concat_spl_dtb_helper' function).

However, this approach may produce an unbootable SPL binary for some target=
 since SPL no-dtb binary may not include the magic number.
For my target, a STM32 MPU, the first 256 bytes are missing.

For me, a better approach is to rebuild the SPL binary with the updated SPL=
 dtb. Here's my suggestion:

- Disable the SPL concate function:
concat_spl_dtb_helper() {
:
}

- Adds a rebuild task, get the SPL dtb+pubkey from shared deploy directory =
and rebuild the SPL binary:
do_rebuild_uboot_spl_with_ signed_dtb() {
deployed_spl_dtb_binary=3D'${ DEPLOY_DIR_IMAGE}/${SPL_DTB_ IMAGE}'
cp $deployed_spl_dtb_binary ${B}/spl/${SPL_DTB_BINARY}
oe_runmake -C ${S} O=3D${B} spl/u-boot-spl all
}

- Task depends on kernel do_deploy (deploy the SPL dtb+pubkey) :
python () {
if ((d.getVar('UBOOT_SIGN_ENABLE' ) =3D=3D '1'
or d.getVar('UBOOT_FITIMAGE_ ENABLE') =3D=3D '1')
and d.getVar('PN') =3D=3D d.getVar('UBOOT_PN')
and d.getVar('UBOOT_DTB_BINARY')):

d.appendVarFlag('do_rebuild_ uboot_spl_with_signed_dtb', 'depends', ' %s:do=
_deploy' % d.getVar('KERNEL_PN'))
bb.build.addtask('do_rebuild_ uboot_spl_with_signed_dtb', 'do_deploy', 'do_=
uboot_assemble_fitimage', d)
}

Since I do not have a global view and this suggestion may not be a general =
solution, I did not submit a patch.

Best regards,

Pierre-Loup

--XffoSd015eNwARXJpyVa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div dir=3D"ltr">
<div>Hi,</div>
<div>&nbsp;</div>
<div>If <span style=3D"font-family: monospace;">SPL_SIGN_ENABLE</span> is s=
et to 1, the uboot-sign bbclass will sign the u-boot fit image and add the =
public key to SPL dtb ('uboot_fitimage_assemble' function).</div>
<div>Before deployment, the class concat the SPL no-dtb binary with SPL dtb=
+pubkey to produce the SPL binary ('concat_spl_dtb_helper' function).</div>
<div>&nbsp;</div>
<div>However, this approach may produce an unbootable SPL binary for some t=
arget since SPL no-dtb binary may not include the magic number.</div>
<div>For my target, a STM32 MPU, the first 256 bytes are missing.</div>
<div>&nbsp;</div>
<div>For me, a better approach is to rebuild the SPL binary with the update=
d SPL dtb. Here's my suggestion:</div>
<div>&nbsp;</div>
<div>- Disable the SPL concate function:</div>
<span style=3D"font-family: monospace;">concat_spl_dtb_helper() {<br />&nbs=
p; &nbsp; :<br />}<br /></span>
<div>&nbsp;</div>
<div>- Adds a rebuild task, get the SPL dtb+pubkey from shared deploy direc=
tory and rebuild the SPL binary:</div>
<span style=3D"font-family: monospace;">do_rebuild_uboot_spl_with_<wbr />si=
gned_dtb() {<br />&nbsp; &nbsp; deployed_spl_dtb_binary=3D'${<wbr />DEPLOY_=
DIR_IMAGE}/${SPL_DTB_<wbr />IMAGE}'<br />&nbsp; &nbsp; cp $deployed_spl_dtb=
_binary ${B}/spl/${SPL_DTB_BINARY}<br />&nbsp; &nbsp; oe_runmake -C ${S} O=
=3D${B} spl/u-boot-spl all<br />}<br /></span>
<div>&nbsp;</div>
<div>- Task depends on kernel do_deploy (deploy the SPL dtb+pubkey) :</div>
<span style=3D"font-family: monospace;">python () {<br />&nbsp; &nbsp; if (=
(d.getVar('UBOOT_SIGN_ENABLE'<wbr />) =3D=3D '1'<br />&nbsp; &nbsp; &nbsp; =
&nbsp; or d.getVar('UBOOT_FITIMAGE_<wbr />ENABLE') =3D=3D '1')<br />&nbsp; =
&nbsp; &nbsp; &nbsp; and d.getVar('PN') =3D=3D d.getVar('UBOOT_PN')<br />&n=
bsp; &nbsp; &nbsp; &nbsp; and d.getVar('UBOOT_DTB_BINARY')):<br /><br />&nb=
sp; &nbsp; &nbsp; &nbsp; d.appendVarFlag('do_rebuild_<wbr />uboot_spl_with_=
signed_dtb', 'depends', ' %s:do_deploy' % d.getVar('KERNEL_PN'))<br />&nbsp=
; &nbsp; &nbsp; &nbsp; bb.build.addtask('do_rebuild_<wbr />uboot_spl_with_s=
igned_dtb', 'do_deploy', 'do_uboot_assemble_fitimage', d)<br /></span>
<div><span style=3D"font-family: monospace;">}</span></div>
<div><span style=3D"font-family: monospace;">&nbsp;</span></div>
<div><span style=3D"font-family: arial,sans-serif;">Since I do not have a g=
lobal view and this suggestion may not be a general solution, I did not sub=
mit a patch.<br /></span></div>
<div><span style=3D"font-family: arial,sans-serif;">&nbsp;</span></div>
<div><span style=3D"font-family: arial,sans-serif;">Best regards,</span></d=
iv>
<div><span style=3D"font-family: arial,sans-serif;">&nbsp;</span></div>
<div><span style=3D"font-family: arial,sans-serif;">Pierre-Loup<br /></span=
></div>
<div>&nbsp;</div>
</div>
</div>

--XffoSd015eNwARXJpyVa--

