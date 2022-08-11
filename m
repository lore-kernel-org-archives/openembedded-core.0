Return-Path: <Awais_Belal@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF076C00140
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 03:24:06 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web12.2365.1660188235054378330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 20:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
X-IronPort-AV: E=Sophos;i="5.93,228,1654588800";
   d="scan'208,217";a="83841078"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 10 Aug 2022 19:23:54 -0800
IronPort-SDR: 
 4ozXyxZ8b5p6GjOtjlfuzGZwkmq7nqcPV45BWf+2U3w/VF7PlQWftRKAFONkN3dqZauRxK9FKG
 syXRTsBYe8O0I8eR4QZiWv4affWZgLVMkAg+i97Y3XA0dpxUao4HzMesZ6V/1vAKmdvD+je0Ge
 ZYy63HQC9ViTci5g7iWYDXrihIag/no42vv0RqVXcjfyB0aEuSZE/z8MnnHHMoBhzGUqyDHRBM
 /ZZJ6gJgISRI8hEyMv6NIJuZhqXjtQ40BHcDqU4Dq1Zruq4moYQNzkvrBZn1AStSj0nRTU5cNr
 XnI=
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: only package unique
 DTBs
Thread-Topic: [OE-core] [PATCH] kernel-fitimage.bbclass: only package unique
 DTBs
Thread-Index: AQHYqxgiN2FX2mZTk0yQeen3RTWNEa2pCmKq
Date: Thu, 11 Aug 2022 03:23:49 +0000
Message-ID: <33274b612f714d78a0c721035d58c091@mentor.com>
References: 
 <20220808103227.104898-1-awais_belal@mentor.com>,<5a58fa84-6b17-b4e5-dd30-43277dde7d05@theobroma-systems.com>
In-Reply-To: <5a58fa84-6b17-b4e5-dd30-43277dde7d05@theobroma-systems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.90]
Content-Type: multipart/alternative;
	boundary="_000_33274b612f714d78a0c721035d58c091mentorcom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 03:24:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169225

--_000_33274b612f714d78a0c721035d58c091mentorcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,


Thanks for the feedback.


> I think this might be a bit too much. e.g. I could have a DTS/DTB named
> this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it is
> a duplicate whereas it isn't (poor naming choice, though.. yes :) ).

> I believe that:
> for DTB in $(echo "${DTBS}" | tr ' ' '\n' | sort -u); do

> would work and avoid unnecessary loops.


this would definitely avoid unnecessary loops however I don't think sorting=
 would be the right thing here as the first dt in the list gets to become t=
he default config which is something assumed for the runtime and sorting wo=
uld break that. If we want to cover up the corner case you described above =
would something such fit the bill


echo $DTBS | tr ' ' '\n' | grep -xq $DTB && continue


> I believe using sort -u here should be enough for this second diff?


sort -u wouldn't help here if the same name dt is present in KERNEL_DEVICET=
REE and the EXTERNEL_KERNEL_DEVICETREE as we'll run into the same problem o=
f having the same dt being packaged twice. I'd rather use the same techniqu=
e here if you agree.


BR,
Awais
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Quentin Schulz <quentin.schulz@theobroma-system=
s.com>
Sent: Monday, August 8, 2022 4:15:15 PM
To: Belal, Awais; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: only package unique=
 DTBs

Hi Awais,

On 8/8/22 12:32, Awais Belal wrote:
> The KERNEL_DEVICETREE and related variables could potentially have a devi=
ce
> tree listed multiple times and this works okay for most scenarios. Howeve=
r,
> when we create FIT entries for these we get duplicate nodes and uboot-mki=
mage
> fails with
>
> fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names)=
: /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
> fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names)=
: /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names)=
: /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
> fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names)=
: /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
> fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names)=
: /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node=
 name
> fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names)=
: /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names)=
: /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node nam=
e
> fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names)=
: /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node n=
ame
> ERROR: Input tree has errors, aborting (use -f to force output)
> uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or d=
irectory
>
> We fix this by tracking the DTBs we're compiling in the FIT and only pick=
ing
> up unique ones.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>   meta/classes/kernel-fitimage.bbclass | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
> index 753164551c..2a07a57d5d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -529,6 +529,14 @@ fitimage_assemble() {
>                        fi
>
>                        DTB=3D$(echo "$DTB" | tr '/' '_')
> +
> +                     # Skip DTB if we've picked it up previously
> +                     case ${DTBS} in
> +                             *${DTB}*)

I think this might be a bit too much. e.g. I could have a DTS/DTB named
this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it is
a duplicate whereas it isn't (poor naming choice, though.. yes :) ).

I believe that:
for DTB in $(echo "${DTBS}" | tr ' ' '\n' | sort -u); do

would work and avoid unnecessary loops.

> +                                     continue
> +                                     ;;
> +                     esac
> +
>                        DTBS=3D"$DTBS $DTB"
>                        fitimage_emit_section_dtb $1 $DTB $DTB_PATH
>                done
> @@ -538,6 +546,14 @@ fitimage_assemble() {
>                dtbcount=3D1
>                for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name=
 '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do

I believe using sort -u here should be enough for this second diff?

Cheers,
Quentin

--_000_33274b612f714d78a0c721035d58c091mentorcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<p>Hi Quentin,</p>
<p><br>
</p>
<p>Thanks for the feedback.<br>
</p>
<p><br>
</p>
<p>&gt; <font size=3D"2"><span style=3D"font-size:10pt">I think this might =
be a bit too much. e.g. I could have a DTS/DTB named
<br>
&gt; this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it =
is <br>
&gt; a duplicate whereas it isn't (poor naming choice, though.. yes :) ).<b=
r>
<br>
&gt; I believe that:<br>
&gt;&nbsp;for DTB in $(echo &quot;${DTBS}&quot; | tr ' ' '\n' | sort -u); d=
o<br>
<br>
&gt; would work and avoid unnecessary loops.</span></font></p>
<p><br>
</p>
<p>this would definitely avoid unnecessary loops however I don't think sort=
ing would be the right thing here as the first dt in the list gets to becom=
e the default config which is something assumed for the runtime and sorting=
 would break that. If we want to
 cover up the corner case you described above would something such fit the =
bill<br>
</p>
<p><br>
</p>
<p><span>echo $DTBS | tr ' ' '\n' | grep -xq $DTB &amp;&amp; continue</span=
><br>
</p>
<p><br>
</p>
<p>&gt; <font size=3D"2"><span style=3D"font-size:10pt">I believe using sor=
t -u here should be enough for this second diff?</span></font></p>
<p><br>
</p>
<p>sort -u wouldn't help here if the same name dt is present in KERNEL_DEVI=
CETREE and the EXTERNEL_KERNEL_DEVICETREE as we'll run into the same proble=
m of having the same dt being packaged twice. I'd rather use the same techn=
ique here if you agree.<br>
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
ehalf of Quentin Schulz &lt;quentin.schulz@theobroma-systems.com&gt;<br>
<b>Sent:</b> Monday, August 8, 2022 4:15:15 PM<br>
<b>To:</b> Belal, Awais; openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [PATCH] kernel-fitimage.bbclass: only package=
 unique DTBs</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Awais,<br>
<br>
On 8/8/22 12:32, Awais Belal wrote:<br>
&gt; The KERNEL_DEVICETREE and related variables could potentially have a d=
evice<br>
&gt; tree listed multiple times and this works okay for most scenarios. How=
ever,<br>
&gt; when we create FIT entries for these we get duplicate nodes and uboot-=
mkimage<br>
&gt; fails with<br>
&gt; <br>
&gt; fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_nam=
es): /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name<=
br>
&gt; fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_nam=
es): /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name<br>
&gt; fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_nam=
es): /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name<br>
&gt; fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_nam=
es): /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name<br=
>
&gt; fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_nam=
es): /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate n=
ode name<br>
&gt; fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_nam=
es): /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name=
<br>
&gt; fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_nam=
es): /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node =
name<br>
&gt; fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_nam=
es): /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate nod=
e name<br>
&gt; ERROR: Input tree has errors, aborting (use -f to force output)<br>
&gt; uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file o=
r directory<br>
&gt; <br>
&gt; We fix this by tracking the DTBs we're compiling in the FIT and only p=
icking<br>
&gt; up unique ones.<br>
&gt; <br>
&gt; Signed-off-by: Awais Belal &lt;awais_belal@mentor.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; meta/classes/kernel-fitimage.bbclass | 16 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 1 file changed, 16 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kerne=
l-fitimage.bbclass<br>
&gt; index 753164551c..2a07a57d5d 100644<br>
&gt; --- a/meta/classes/kernel-fitimage.bbclass<br>
&gt; &#43;&#43;&#43; b/meta/classes/kernel-fitimage.bbclass<br>
&gt; @@ -529,6 &#43;529,14 @@ fitimage_assemble() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTB=3D$=
(echo &quot;$DTB&quot; | tr '/' '_')<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip DTB if we've=
 picked it up previously<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ${DTBS} in<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *${DTB}*)<br>
<br>
I think this might be a bit too much. e.g. I could have a DTS/DTB named <br=
>
this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it is <b=
r>
a duplicate whereas it isn't (poor naming choice, though.. yes :) ).<br>
<br>
I believe that:<br>
for DTB in $(echo &quot;${DTBS}&quot; | tr ' ' '\n' | sort -u); do<br>
<br>
would work and avoid unnecessary loops.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; continue<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; ;;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DTBS=3D=
&quot;$DTBS $DTB&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fitimag=
e_emit_section_dtb $1 $DTB $DTB_PATH<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; done<br>
&gt; @@ -538,6 &#43;546,14 @@ fitimage_assemble() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dtbcount=3D1<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; for DTB in $(find &quot;${EXTERNAL_KERNEL_DEVICETREE}&q=
uot; \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do<br>
<br>
I believe using sort -u here should be enough for this second diff?<br>
<br>
Cheers,<br>
Quentin<br>
</div>
</span></font>
</body>
</html>

--_000_33274b612f714d78a0c721035d58c091mentorcom_--

