Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE2EC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 18:28:11 +0000 (UTC)
Subject: [Bug] virtual/kernel menuconfig disabled with multiple uboot configs
To: openembedded-core@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.195)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Jul 2024 11:28:09 -0700
Message-ID: <skoU.1721845689752134562.U1br@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="vnWeNzKmdug1tXcADgkJ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 18:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202477

--vnWeNzKmdug1tXcADgkJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I've found a bug in the kernel-fitimage.bbclass when it uses the uboot-=
config.bbclass. The Yocto bugzilla wouldn't let me create an account to rep=
ort it so I thought I would at least post it here.

On the Scarthgap 5.0.0 Yocto release, the kernel-fitimage.bbclass inherits =
the uboot-config.bbclass (both in openembedded-core/meta/classes-recipes). =
This is normally fine but if you are building multiple uboot configs then t=
he uboot-config.bbclass disables the menuconfig for the recipe. This is a g=
ood idea when you're building uboot since you don't know what menuconfig to=
 use, but since the kernel inherits this class too, the kernel menuconfig t=
ask gets disabled as well.

Steps to reproduce:
1. Set UBOOT_CONFIG to have multiple configs (I did this in my machine file=
).
UBOOT_CONFIG ??=3D "uboot-a uboot-b"
2. bitbake virtual/kernel -c menuconfig
ERROR: linux-fslc-imx-6.6.28+git-r0 do_menuconfig: do_menuconfig is disable=
d, please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.
ERROR: Logfile of failure stored in: /extra/temp/tlo-p700-seval-build/build=
/tmp/work/p700_quad-keysight-linux/linux-fslc-imx/6.6.28+git/temp/log.do_me=
nuconfig.995135
ERROR: Task (/extra/temp/tlo-p700-seval-build/build/../layers/meta-freescal=
e/recipes-kernel/linux/linux-fslc-imx_6.6.bb:do_menuconfig) failed with exi=
t code '1'

openembedded-core/meta-classes-recipes/uboot-config.bbclass lines 143 to 14=
7.
if len(ubootconfig) =3D=3D 1 :
d.setVar( 'KCONFIG_CONFIG_ROOTDIR' , os.path.join(d.getVar( "B" ), d.getVar=
( "UBOOT_MACHINE" ).strip()))
else :
# Disable menuconfig for multiple configs
d.setVar( 'KCONFIG_CONFIG_ENABLE_MENUCONFIG' , "false" )

openembedded-core/meta-classes-recipes/kernel-fitimage.bbclass line 7
inherit kernel-uboot kernel-artifact-names uboot-config

--vnWeNzKmdug1tXcADgkJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, I've found a bug in the kernel-fitimage.bbclass when it uses the u=
boot-config.bbclass. The Yocto bugzilla wouldn't let me create an account t=
o report it so I thought I would at least post it here.<br /><br />On the S=
carthgap 5.0.0 Yocto release, the kernel-fitimage.bbclass inherits the uboo=
t-config.bbclass (both in openembedded-core/meta/classes-recipes). This is =
normally fine but if you are building multiple uboot configs then the uboot=
-config.bbclass disables the menuconfig for the recipe. This is a good idea=
 when you're building uboot since you don't know what menuconfig to use, bu=
t since the kernel inherits this class too, the kernel menuconfig task gets=
 disabled as well.&nbsp;<br /><br />Steps to reproduce:<br />1. Set UBOOT_C=
ONFIG to have multiple configs (I did this in my machine file).<br />&nbsp;=
 &nbsp; &nbsp;<span style=3D"color: #d4d4d4;">UBOOT_CONFIG ??=3D </span><sp=
an style=3D"color: #ce9178;">"uboot-a uboot-b"</span><br />2. bitbake virtu=
al/kernel -c menuconfig<br />&nbsp; &nbsp; ERROR: linux-fslc-imx-6.6.28+git=
-r0 do_menuconfig: do_menuconfig is disabled, please check KCONFIG_CONFIG_E=
NABLE_MENUCONFIG variable.<br />&nbsp; &nbsp; ERROR: Logfile of failure sto=
red in: /extra/temp/tlo-p700-seval-build/build/tmp/work/p700_quad-keysight-=
linux/linux-fslc-imx/6.6.28+git/temp/log.do_menuconfig.995135<br />&nbsp; &=
nbsp; ERROR: Task (/extra/temp/tlo-p700-seval-build/build/../layers/meta-fr=
eescale/recipes-kernel/linux/linux-fslc-imx_6.6.bb:do_menuconfig) failed wi=
th exit code '1'</div>
<div><br />openembedded-core/meta-classes-recipes/uboot-config.bbclass line=
s 143 to 147.</div>
<div style=3D"color: #d4d4d4; background-color: #1e1e1e; font-family: Conso=
las, 'Courier New', monospace; font-weight: normal; font-size: 16px; line-h=
eight: 22px; white-space: pre;">
<div><span style=3D"color: #d4d4d4;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; </span><span style=3D"color: #569cd6;">if</span><span style=3D"color: #=
d4d4d4;"> len(ubootconfig) =3D=3D </span><span style=3D"color: #b5cea8;">1<=
/span><span style=3D"color: #d4d4d4;">:</span></div>
<div><span style=3D"color: #d4d4d4;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; d.setVar(</span><span style=3D"color: #ce9178;">'KCONFIG_=
CONFIG_ROOTDIR'</span><span style=3D"color: #d4d4d4;">, os.path.join(d.getV=
ar(</span><span style=3D"color: #ce9178;">"B"</span><span style=3D"color: #=
d4d4d4;">), d.getVar(</span><span style=3D"color: #ce9178;">"UBOOT_MACHINE"=
</span><span style=3D"color: #d4d4d4;">).strip()))</span></div>
<div><span style=3D"color: #d4d4d4;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; </span><span style=3D"color: #569cd6;">else</span><span style=3D"color:=
 #d4d4d4;">:</span></div>
<div><span style=3D"color: #d4d4d4;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; </span><span style=3D"color: #6a9955;"># Disable menuconf=
ig for multiple configs</span></div>
<div><span style=3D"color: #d4d4d4;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; d.setVar(</span><span style=3D"color: #ce9178;">'KCONFIG_=
CONFIG_ENABLE_MENUCONFIG'</span><span style=3D"color: #d4d4d4;">, </span><s=
pan style=3D"color: #ce9178;">"false"</span><span style=3D"color: #d4d4d4;"=
>)</span></div>
</div>
<div><br />openembedded-core/meta-classes-recipes/kernel-fitimage.bbclass l=
ine 7</div>
<div style=3D"color: #d4d4d4; background-color: #1e1e1e; font-family: Conso=
las, 'Courier New', monospace; font-weight: normal; font-size: 16px; line-h=
eight: 22px; white-space: pre;">
<div><span style=3D"color: #569cd6;">inherit</span><span style=3D"color: #d=
4d4d4;"> kernel-uboot kernel-artifact-names uboot-config</span></div>
</div>
<div>&nbsp;</div>

--vnWeNzKmdug1tXcADgkJ--

