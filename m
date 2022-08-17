Return-Path: <Awais_Belal@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1888BC32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:09:56 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web08.30784.1660752594427369297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 09:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,243,1654588800";
   d="scan'208,217";a="81462248"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Aug 2022 08:09:51 -0800
IronPort-SDR: 
 3+rk5fEKUmHhXhJsH9+MJKlW88M5lj5jWNgG5ukSl0BVSbnsFX0uZnSzyTVbDiaVnohVuDqdZx
 yFVzJsqZB6sKbQQhvf0qZVjiBcD59sOtFbDOTooaeRY1iK3c22fmDnniEg30FEb39hdH63hHxI
 Bp4/FqbJ+4wFmKDNBYPRJUrCBMxN8SuBH4MKpV8gDte5G4Ry0+C4qfXjcUAwM4W3khnRbPLlDr
 OADveo+dYLp7Jw/lJW3Vv+z2eMER1bLSYjMK8O1Iew9SMVBqMoV3jjgMxGDeIoZXDCWcvrMgCu
 DIk=
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package
 unique DTBs
Thread-Topic: [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package
 unique DTBs
Thread-Index: AQHYsXhnul1RB+dXikan6IT62T7lLq2zRHv/
Date: Wed, 17 Aug 2022 16:09:46 +0000
Message-ID: <e840813aa69c4b968e839da161d735c8@mentor.com>
References: <170BD7FB076CA188.19212@lists.openembedded.org>
In-Reply-To: <170BD7FB076CA188.19212@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.90]
Content-Type: multipart/alternative;
	boundary="_000_e840813aa69c4b968e839da161d735c8mentorcom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 16:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169493

--_000_e840813aa69c4b968e839da161d735c8mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Do I need to send an update here to align with https://git.openembedded.org=
/openembedded-core/commit/meta/classes-recipe/kernel-fitimage.bbclass?h=3Dm=
aster-next&id=3Df5c128008365e141082c129417eb72d2751e8045 ?


BR,
Awais
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Belal, Awais
Sent: Tuesday, August 16, 2022 6:58:55 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package unique=
 DTBs

The KERNEL_DEVICETREE and related variables could potentially have a device
tree listed multiple times and this works okay for most scenarios. However,
when we create FIT entries for these we get duplicate nodes and uboot-mkima=
ge
fails with

fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node n=
ame
fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node nam=
e
ERROR: Input tree has errors, aborting (use -f to force output)
uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or dir=
ectory

We fix this by tracking the DTBs we're compiling in the FIT and only pickin=
g
up unique ones.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass
index 7e09b075ff..56d71ba8fa 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -527,6 +527,10 @@ fitimage_assemble() {
                         fi

                         DTB=3D$(echo "$DTB" | tr '/' '_')
+
+                       # Skip DTB if we've picked it up previously
+                       echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && con=
tinue
+
                         DTBS=3D"$DTBS $DTB"
                         fitimage_emit_section_dtb $1 $DTB $DTB_PATH
                 done
@@ -536,6 +540,10 @@ fitimage_assemble() {
                 dtbcount=3D1
                 for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name=
 '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
                         DTB=3D$(echo "$DTB" | tr '/' '_')
+
+                       # Skip DTB if we've picked it up previously
+                       echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && con=
tinue
+
                         DTBS=3D"$DTBS $DTB"
                         fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERN=
EL_DEVICETREE}/$DTB"
                 done
--
2.25.1


--_000_e840813aa69c4b968e839da161d735c8mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:10pt; col=
or:#000000; font-family:Tahoma,Geneva,sans-serif">
<p>Do I need to send an update here to align with <a href=3D"https://git.op=
enembedded.org/openembedded-core/commit/meta/classes-recipe/kernel-fitimage=
.bbclass?h=3Dmaster-next&amp;id=3Df5c128008365e141082c129417eb72d2751e8045"=
 class=3D"x_OWAAutoLink" id=3D"LPlnk793989">
https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/k=
ernel-fitimage.bbclass?h=3Dmaster-next&amp;id=3Df5c128008365e141082c129417e=
b72d2751e8045</a> ?<br>
</p>
<p><br>
</p>
<div id=3D"x_Signature">
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on b=
ehalf of Belal, Awais<br>
<b>Sent:</b> Tuesday, August 16, 2022 6:58:55 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package=
 unique DTBs</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">The KERNEL_DEVICETREE and related variables could =
potentially have a device<br>
tree listed multiple times and this works okay for most scenarios. However,=
<br>
when we create FIT entries for these we get duplicate nodes and uboot-mkima=
ge<br>
fails with<br>
<br>
fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name<br>
fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name<br>
fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name<br>
fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): =
/images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name<br>
fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node n=
ame<br>
fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name<br>
fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name<=
br>
fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): =
/configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node nam=
e<br>
ERROR: Input tree has errors, aborting (use -f to force output)<br>
uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or dir=
ectory<br>
<br>
We fix this by tracking the DTBs we're compiling in the FIT and only pickin=
g<br>
up unique ones.<br>
<br>
Signed-off-by: Awais Belal &lt;awais_belal@mentor.com&gt;<br>
---<br>
&nbsp;meta/classes/kernel-fitimage.bbclass | 8 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;<br>
&nbsp;1 file changed, 8 insertions(&#43;)<br>
<br>
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass<br>
index 7e09b075ff..56d71ba8fa 100644<br>
--- a/meta/classes/kernel-fitimage.bbclass<br>
&#43;&#43;&#43; b/meta/classes/kernel-fitimage.bbclass<br>
@@ -527,6 &#43;527,10 @@ fitimage_assemble() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTB=
=3D$(echo &quot;$DTB&quot; | tr '/' '_')<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip DTB i=
f we've picked it up previously<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;$=
DTBS&quot; | tr ' ' '\n' | grep -xq &quot;$DTB&quot; &amp;&amp; continue<br=
>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTBS=
=3D&quot;$DTBS $DTB&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fitim=
age_emit_section_dtb $1 $DTB $DTB_PATH<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
@@ -536,6 &#43;540,10 @@ fitimage_assemble() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dtbcount=3D1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for DTB in $(find &quot;${EXTERNAL_KERNEL_DEVICETREE}=
&quot; \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTB=
=3D$(echo &quot;$DTB&quot; | tr '/' '_')<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip DTB i=
f we've picked it up previously<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;$=
DTBS&quot; | tr ' ' '\n' | grep -xq &quot;$DTB&quot; &amp;&amp; continue<br=
>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTBS=
=3D&quot;$DTBS $DTB&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fitim=
age_emit_section_dtb $1 $DTB &quot;${EXTERNAL_KERNEL_DEVICETREE}/$DTB&quot;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_e840813aa69c4b968e839da161d735c8mentorcom_--

