Return-Path: <nicolas.heemeryck@devialet.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610A3EDA689
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:22:49 +0000 (UTC)
Subject: [scarthgap][PATCH] uboot-config: Fix devtool modify #scarthgap
To: openembedded-core@lists.openembedded.org
From: nicolas.heemeryck@devialet.com
X-Originating-Location: FR (149.232.202.21)
X-Originating-Platform: Linux Firefox 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 07:22:48 -0800
Message-ID: <NOkm.1772551368148819834.HwYd@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MmyoSeGuUQb7ObxEiUIa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 15:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232320

--MmyoSeGuUQb7ObxEiUIa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Is this possible to cherry-pick the patch attached that fixes the u-boot de=
vtool modify ?

commit 371ecef31872a611f34b2541a50ceed0c3ce06af
Author: Tom Hochstein <tom.hochstein@oss.nxp.com>
Date: =C2=A0 Wed Feb 5 16:18:55 2025 -0600
uboot-config: Fix devtool modify
Fix a problem with `devtool modify` as suggested by Marcus Flyckt on
the mailing list:
```
I encountered an issue with `do_config` when using `devtool modify`
on `u-boot-imx`.
```
[...]
| cp: cannot stat '[...]/u-boot-imx/2024.04/build/imx8mp_wl400s_defconfig/.=
config': No such file or directory
| WARNING: exit code 1 from a shell command.
ERROR: Task ([...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot=
-imx_2024.04.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 963 tasks of which 962 didn't need to be rer=
un and 1 failed.
Summary: 1 task failed:
[...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.04.=
bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code
```
The issue seems to originate from the following lines in
`workspace/appends/u-boot-imx_2024.04.bbappend`:
```
do_configure:append() {
if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"))} =3D=
 True ]; then
cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline
ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new
fi
}
```
For some reason `KCONFIG_CONFIG_ROOTDIR` does not point to the
correct directory. It gets its value in `uboot-config.bbclass`:
```
if len(ubootconfig) =3D=3D 1:
d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UB=
OOT_MACHINE").strip()))
```
So the main issue is that B gets expanded in this expression, and
then later B gets changed by `externalsrc.bbclass`.
`d.getVar("B", False)` does not solve the issue, however the
proposed change does.
```
- https://lists.yoctoproject.org/g/yocto/topic/109254298#msg64152]
Fixes [YOCTO #15603]
Suggested-by: Marcus Flyckt <marcus.flyckt@gmail.com>
(From OE-Core rev: 57b21065a25100c31515b32fd7c77bde3355d684)
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Best Regards,
Nicolas

--MmyoSeGuUQb7ObxEiUIa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>Is this possible to cherry-pick the patch attached that fixes the u-bo=
ot devtool modify ?</div>
<div>&nbsp;</div>
<div>
<div style=3D"padding-left: 40px;">commit 371ecef31872a611f34b2541a50ceed0c=
3ce06af<br />Author: Tom Hochstein &lt;tom.hochstein@oss.nxp.com&gt;<br />D=
ate: &nbsp; Wed Feb 5 16:18:55 2025 -0600</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; uboot-config: Fix devtool =
modify</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; Fix a problem with `devtoo=
l modify` as suggested by Marcus Flyckt on<br />&nbsp; &nbsp; the mailing l=
ist:<br />&nbsp; &nbsp; ```<br />&nbsp; &nbsp; &nbsp; &nbsp; I encountered =
an issue with `do_config` when using `devtool modify`<br />&nbsp; &nbsp; &n=
bsp; &nbsp; on `u-boot-imx`.</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; ```<br />&nb=
sp; &nbsp; &nbsp; &nbsp; [...]<br />&nbsp; &nbsp; &nbsp; &nbsp; | cp: canno=
t stat '[...]/u-boot-imx/2024.04/build/imx8mp_wl400s_defconfig/.config': No=
 such file or directory<br />&nbsp; &nbsp; &nbsp; &nbsp; | WARNING: exit co=
de 1 from a shell command.<br />&nbsp; &nbsp; &nbsp; &nbsp; ERROR: Task ([.=
..]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.04.bb=
:do_configure) failed with exit code '1'<br />&nbsp; &nbsp; &nbsp; &nbsp; N=
OTE: Tasks Summary: Attempted 963 tasks of which 962 didn't need to be reru=
n and 1 failed.<br />&nbsp; &nbsp; &nbsp; &nbsp; Summary: 1 task failed:<br=
 />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [...]/sources/poky/../meta-freescale/=
recipes-bsp/u-boot/u-boot-imx_2024.04.bb:do_configure<br />&nbsp; &nbsp; &n=
bsp; &nbsp; Summary: There was 1 ERROR message, returning a non-zero exit c=
ode<br />&nbsp; &nbsp; &nbsp; &nbsp; ```</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; The issue se=
ems to originate from the following lines in<br />&nbsp; &nbsp; &nbsp; &nbs=
p; `workspace/appends/u-boot-imx_2024.04.bbappend`:</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; ```<br />&nb=
sp; &nbsp; &nbsp; &nbsp; do_configure:append() {<br />&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENAB=
LE_MENUCONFIG"))} =3D True ]; then<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.base=
line<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ln -sfT $=
{KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new<br />&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; fi<br />&nbsp; &nbsp; &nbsp; &nbsp; }<br />&nbsp; &nb=
sp; &nbsp; &nbsp; ```</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; For some rea=
son `KCONFIG_CONFIG_ROOTDIR` does not point to the<br />&nbsp; &nbsp; &nbsp=
; &nbsp; correct directory. It gets its value in `uboot-config.bbclass`:</d=
iv>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; ```<br />&nb=
sp; &nbsp; &nbsp; &nbsp; if len(ubootconfig) =3D=3D 1:<br />&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d.setV=
ar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MA=
CHINE").strip()))<br />&nbsp; &nbsp; &nbsp; &nbsp; ```</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp; So the main =
issue is that B gets expanded in this expression, and<br />&nbsp; &nbsp; &n=
bsp; &nbsp; then later B gets changed by `externalsrc.bbclass`.<br />&nbsp;=
 &nbsp; &nbsp; &nbsp; `d.getVar("B", False)` does not solve the issue, howe=
ver the<br />&nbsp; &nbsp; &nbsp; &nbsp; proposed change does.<br />&nbsp; =
&nbsp; ```<br />&nbsp; &nbsp; - https://lists.yoctoproject.org/g/yocto/topi=
c/109254298#msg64152]</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; Fixes [YOCTO #15603]</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; Suggested-by: Marcus Flyck=
t &lt;marcus.flyckt@gmail.com&gt;<br />&nbsp; &nbsp; (From OE-Core rev: 57b=
21065a25100c31515b32fd7c77bde3355d684)</div>
<div style=3D"padding-left: 40px;">&nbsp; &nbsp; Signed-off-by: Tom Hochste=
in &lt;tom.hochstein@oss.nxp.com&gt;<br />&nbsp; &nbsp; Signed-off-by: Rich=
ard Purdie &lt;richard.purdie@linuxfoundation.org&gt;</div>
<div style=3D"padding-left: 40px;">&nbsp;</div>
<div style=3D"padding-left: 40px;">&nbsp;</div>
<div>Best Regards,<br />Nicolas</div>
</div>

--MmyoSeGuUQb7ObxEiUIa--

