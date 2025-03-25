Return-Path: <christoph-cordt.von-egidy@compleo-cs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CE3C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 16:40:49 +0000 (UTC)
Subject: eSDK: extra nativesdk binaries are not relocated
To: openembedded-core@lists.openembedded.org
From: christoph-cordt.von-egidy@compleo-cs.com
X-Originating-Location: Grevenbroich, North Rhine-Westphalia, DE (91.25.195.251)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 09:40:49 -0700
Message-ID: <88Lh.1742920849565347329.2cvL@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="K6esPU0MBF1VdRkcwuzG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 16:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213605

--K6esPU0MBF1VdRkcwuzG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

I am trying to add some native tools to the (bundled) extensible SDK. Unfor=
tunately, the executables don't seem to be relocated during installation an=
d setup of the eSDK, and thus cannot be run. To eliminate possible conflict=
s with our yocto setup, I tested again with the vanilla poky distribution a=
nd was able to reproduce the issue:

* clone and initialize poky ( *kirkstone* )
* add the desired package (e.g. socat) and the necessary dummies to local.c=
onf:
TOOLCHAIN_HOST_TASK_ESDK:append =3D " nativesdk-socat nativesdk-sdk-provide=
s-dummy"
* create the eSDK for core-image-sato:
bitbake -c populate_sdk_ext core-image-sato

After installing the resulting eSDK, socat's libraries and executables are =
copied to the eSDK's sysroot directly ("<sdkpath>/sysroots/x86_64-pokysdk-l=
inux/..."). However, their dynamic loader is still set to the placeholder "=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/lib/ld-=
linux-x86-64.so.2". Possible symlinks (as installed for e.g. nativesdk-file=
) also target a sysroot at "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/=
x86_64-pokysdk-linux/...". If python or a package requiring it is installed=
, it even breaks devtool, as it is found via PATH before the "<sdkpath>/bui=
ldtools/sysroots"'s python (which is relocated correctly).

When testing the scenario with *scarthgap* , the installed extra binaries r=
emain "unrelocated". But apparently devtool was moved away from "<sdkpath>/=
sysroots", and the environment-setup script no longer adds this sysroot to =
PATH.

So, how should tools that I want to run on the sdk machine be added to the =
eSDK? Should they somehow be added to the buildtools, for which the relocat=
ion is still performed?

Thanks and best regards
Cordt

--K6esPU0MBF1VdRkcwuzG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Dear all,</div>
<div>&nbsp;</div>
<div>I am trying to add some native tools to the (bundled) extensible SDK. =
Unfortunately, the executables don't seem to be relocated during installati=
on and setup of the eSDK, and thus cannot be run. To eliminate possible con=
flicts with our yocto setup, I tested again with the vanilla poky distribut=
ion and was able to reproduce the issue:</div>
<ul>
<li>clone and initialize poky (<strong>kirkstone</strong>)</li>
<li>add the desired package (e.g. socat) and the necessary dummies to local=
.conf:<br /><span style=3D"font-family: 'courier new', courier;">TOOLCHAIN_=
HOST_TASK_ESDK:append =3D " nativesdk-socat nativesdk-sdk-provides-dummy"</=
span></li>
<li>create the eSDK for core-image-sato:<br /><span style=3D"font-family: '=
courier new', courier;">bitbake -c populate_sdk_ext core-image-sato</span><=
/li>
</ul>
<div>After installing the resulting eSDK, socat's libraries and executables=
 are copied to the eSDK's sysroot directly ("&lt;sdkpath&gt;/sysroots/x86_6=
4-pokysdk-linux/..."). However, their dynamic loader is still set to the pl=
aceholder "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-li=
nux/lib/ld-linux-x86-64.so.2". Possible symlinks (as installed for e.g. nat=
ivesdk-file) also target a sysroot at "/usr/local/oe-sdk-hardcoded-buildpat=
h/sysroots/x86_64-pokysdk-linux/...". If python or a package requiring it i=
s installed, it even breaks devtool, as it is found via PATH before the "&l=
t;sdkpath&gt;/buildtools/sysroots"'s python (which is relocated correctly).=
</div>
<div>&nbsp;</div>
<div>When testing the scenario with <strong>scarthgap</strong>, the install=
ed extra binaries remain "unrelocated". But apparently devtool was moved aw=
ay from "&lt;sdkpath&gt;/sysroots", and the environment-setup script no lon=
ger adds this sysroot to PATH.</div>
<div>&nbsp;</div>
<div>So, how should tools that I want to run on the sdk machine be added to=
 the eSDK? Should they somehow be added to the buildtools, for which the re=
location is still performed?</div>
<div><br />Thanks and best regards<br />Cordt</div>
</div>

--K6esPU0MBF1VdRkcwuzG--

