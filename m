Return-Path: <prvs=030ca96a4=kyle.unice@L-3com.com>
Received: from smtp8out.l-3com.com (smtp8out.l-3com.com [128.170.207.117])
	by mail.openembedded.org (Postfix) with ESMTP id CCC8A73166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:59:29 +0000 (UTC)
X-filenames: 
X-filesizes: None
X-filetypes: 
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464652800"; 
	d="scan'208,217";a="292262666"
Received: from slxhub01.csw.l-3com.com ([128.170.35.31])
	by smtp8out.l-3com.com with ESMTP; 17 Aug 2016 14:59:29 +0000
Received: from SLXMBX01.csw.l-3com.com ([fe80::d1ac:3ec4:a328:a9c3]) by
	SLXHUB01.csw.l-3com.com ([fe80::6cc7:6feb:72e8:3b67%16]) with mapi id
	14.03.0301.000; Wed, 17 Aug 2016 08:59:29 -0600
From: <kyle.unice@L-3com.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Problem building eglibc
Thread-Index: AdH4l/OrwL+NE4tVQxeq66YPc2rk4A==
Date: Wed, 17 Aug 2016 14:59:28 +0000
Message-ID: <25D6125FB568F54699E315276ED4D36C614E19DF@SLXMBX01.csw.l-3com.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.170.35.58]
MIME-Version: 1.0
Subject: Problem building eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 14:59:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_25D6125FB568F54699E315276ED4D36C614E19DFSLXMBX01cswl3co_"

--_000_25D6125FB568F54699E315276ED4D36C614E19DFSLXMBX01cswl3co_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I previously posted this issue:

---------------------------------------------------------------------------=
----------------
On Aug 16, 2016, at 12:53 PM, kyle.unice@L-3com.com<mailto:kyle.unice@l-3co=
m.com> wrote:

Folks,

I am having a problem doing the 'bitbake -c do_populate_sdk fsl-image-full'=
 command using the daisy branch of Yocto with the freescale b4860qds-64b ev=
aluation board.

Here is the error I get:

ERROR: Unable to install packages. Command '/opt/QorIQ-SDK-V1.8-20150619-yo=
cto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/smart --da=
ta-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-network=
ing/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart install -y l=
ibgcc1@lib32_ppce6500 gcc@lib32_ppce6500 libgcov-dev@lib32_ppce6500 libgcc-=
s-dev@lib32_ppce6500 valgrind@lib32_ppce6500 binutils@lib32_ppce6500 g++@li=
b32_ppce6500 ldd@lib32_ppce6500 gcov@lib32_ppce6500 cpp@lib32_ppce6500 egli=
bc-utils@lib32_ppce6500 eglibc-dev@lib32_ppce6500' returned 1:
Loading cache...
Updating cache...               ######################################## [1=
00%]

Committing transaction...
Preparing...                    ######################################## [ =
 0%]
error: file /usr/include/gnu/lib-names.h from install of eglibc-dev-2.19-r0=
.lib32_ppce6500 conflicts with file from package libc6-dev-2.19-r0.ppc64e65=
00
---------------------------------------------------------------------------=
----------------

I got some help and was told to apply this patch -

patch https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6=
e26711c5

---------------------------------------------------------------------------=
----------------

But now I am getting this error.  Looks like the patch did not include the =
64-bit build option for generating ld64.so.1.

ERROR: Unable to install packages. Command '/opt/QorIQ-SDK-V1.8-20150619-yo=
cto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/smart --da=
ta-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-network=
ing/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart install -y l=
ibgcc1@ppc64e6500 gcc@ppc64e6500 libgcc-s-dev@ppc64e6500 run-postinsts@all =
usdpaa-apps-staticdev@b4860qds_64b ldd@ppc64e6500 usdpaa-apps@b4860qds_64b =
packagegroup-core-ssh-openssh@all tcf-qoriqdbg@ppc64e6500 apptrk@ppc64e6500=
 asf@b4860qds_64b udev-extraconf@ppc64e6500 pme-tools@ppc64e6500 rpm@ppc64e=
6500 eth-config@ppc64e6500 mtd-utils@ppc64e6500 packagegroup-core-standalon=
e-sdk-target-dbg@all usdpaa-staticdev@b4860qds_64b util-linux@ppc64e6500 fm=
-ucode-image@ppc64e6500 dpa-offload-dev@b4860qds_64b mtd-utils-jffs2@ppc64e=
6500 smartpm@ppc64e6500 e2fsprogs-tune2fs@ppc64e6500 packagegroup-core-ecli=
pse-debug@all eglibc-utils@ppc64e6500 g++@ppc64e6500 gcov@ppc64e6500 dosfst=
ools@ppc64e6500 e2fsprogs-e2fsck@ppc64e6500 gnuradio-dev@ppc64e6500 package=
group-fsl-core@all packagegroup-fsl-extend@all packagegroup-core-boot@b4860=
qds_64b packagegroup-core-full-cmdline@all sysklogd@ppc64e6500 merge-files@=
all packagegroup-core-buildessential@all rcw-image@b4860qds_64b packagegrou=
p-core-x11-base@all kmod@ppc64e6500 usdpaa@b4860qds_64b packagegroup-core-n=
fs-server@all hypervisor-partman@ppc64e6500 ceetm@b4860qds_64b dpa-offload-=
staticdev@b4860qds_64b libc6-dev@ppc64e6500 usdpaa-dev@b4860qds_64b e2fspro=
gs-mke2fs@ppc64e6500 libgcov-dev@ppc64e6500 sysfsutils@ppc64e6500 qoriq-deb=
ug@b4860qds_64b mtd-utils-ubifs@ppc64e6500 kernel-image-3.12.37-rt51-qoriq-=
sdk-v1.8+gf488de6@b4860qds_64b<mailto:kernel-image-3.12.37-rt51-qoriq-sdk-v=
1.8+gf488de6@b4860qds_64b> fmc@b4860qds_64b bash@ppc64e6500 packagegroup-co=
re-standalone-sdk-target@all e2fsprogs@ppc64e6500 packagegroup-core-tools-d=
ebug@b4860qds_64b hyperrelay@ppc64e6500 valgrind@ppc64e6500 sysstat@ppc64e6=
500 packagegroup-core-x11@all net-tools@ppc64e6500 cpp@ppc64e6500 kernel-de=
vicetree@b4860qds_64b binutils@ppc64e6500 u-boot-qoriq-images@b4860qds_64b'=
 returned 1:
Loading cache...
Updating cache...               ######################################## [1=
00%]

Computing transaction...error: Can't install libstdc++6-4.9.2-r0@ppc64e6500=
<mailto:libstdc++6-4.9.2-r0@ppc64e6500>: no package provides ld64.so.1()(64=
bit)


ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-yocto/bui=
ld_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-=
r0/temp/log.do_populate_sdk.98993
ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/image=
s/fsl-image-full.bb, do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 6311 tasks of which 2955 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-f=
ull.bb, do_populate_sdk




W. Kyle Unice
Staff Engineer
MS F1H03
322 North 2200 West Dock 3
Salt Lake City, Utah 84116-0850

Voice: 801-594-2687


--_000_25D6125FB568F54699E315276ED4D36C614E19DFSLXMBX01cswl3co_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Candara;
	panose-1:2 14 5 2 3 3 3 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Candara","sans-serif";
	color:windowtext;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">I previously posted this issue:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">---------------------------------------=
----------------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal">On Aug 16, 2016, at 12:53 PM,<span class=3D"apple-co=
nverted-space">&nbsp;</span><a href=3D"mailto:kyle.unice@l-3com.com"><span =
style=3D"color:purple">kyle.unice@L-3com.com</span></a><span class=3D"apple=
-converted-space">&nbsp;</span>wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">Folks,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">I am having a problem doing the &#8216;bitbake &#8211;c =
do_populate_sdk fsl-image-full&#8217; command using the daisy branch of Yoc=
to with the freescale b4860qds-64b evaluation board.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">Here is the error I get:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,&quot=
;sans-serif&quot;">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">ERROR: Unable to install packages. Command '/opt/QorI=
Q-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-li=
nux/usr/bin/smart --data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b48=
60qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk=
/image/opt/fsl-networking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/=
lib/smart
 install -y libgcc1@lib32_ppce6500 gcc@lib32_ppce6500 libgcov-dev@lib32_ppc=
e6500 libgcc-s-dev@lib32_ppce6500 valgrind@lib32_ppce6500 binutils@lib32_pp=
ce6500 g&#43;&#43;@lib32_ppce6500 ldd@lib32_ppce6500 gcov@lib32_ppce6500 cp=
p@lib32_ppce6500 eglibc-utils@lib32_ppce6500
 eglibc-dev@lib32_ppce6500' returned 1:</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">Loading cache...</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">Updating cache...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ##########################=
############## [100%]</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">&nbsp;</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">Committing transaction...&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></i><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">Preparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
####################################### [&nbsp; 0%]</span></i><o:p></o:p></=
p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">error: file /usr/include/gnu/lib-names.h from install=
 of eglibc-dev-2.19-r0.lib32_ppce6500 conflicts with file from package libc=
6-dev-2.19-r0.ppc64e6500</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">---------------------------------------=
----------------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;">I got some help and was told to apply this patch -&nb=
sp;</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">patch&nbsp;<a href=3D"https://github.com/kraj/glibc/=
commit/93ae1ebaa6df1a0c188614bd0a601ab6e26711c5"><span style=3D"color:purpl=
e">https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6e26=
711c5</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">---------------------------------------=
----------------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">But now I am getting this error.&nbsp; =
Looks like the patch did not include the 64-bit build option for generating=
 ld64.so.1.&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">ERROR: Unable to install packages. Comm=
and '/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysr=
oots/x86_64-linux/usr/bin/smart --data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-y=
octo/build_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-f=
ull/1.0-r0/sdk/image/opt/fsl-networking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-=
fsl-linux/var/lib/smart
 install -y libgcc1@ppc64e6500 gcc@ppc64e6500 libgcc-s-dev@ppc64e6500 run-p=
ostinsts@all usdpaa-apps-staticdev@b4860qds_64b ldd@ppc64e6500 usdpaa-apps@=
b4860qds_64b packagegroup-core-ssh-openssh@all tcf-qoriqdbg@ppc64e6500 appt=
rk@ppc64e6500 asf@b4860qds_64b udev-extraconf@ppc64e6500
 pme-tools@ppc64e6500 rpm@ppc64e6500 eth-config@ppc64e6500 mtd-utils@ppc64e=
6500 packagegroup-core-standalone-sdk-target-dbg@all usdpaa-staticdev@b4860=
qds_64b util-linux@ppc64e6500 fm-ucode-image@ppc64e6500 dpa-offload-dev@b48=
60qds_64b mtd-utils-jffs2@ppc64e6500
 smartpm@ppc64e6500 e2fsprogs-tune2fs@ppc64e6500 packagegroup-core-eclipse-=
debug@all eglibc-utils@ppc64e6500 g&#43;&#43;@ppc64e6500 gcov@ppc64e6500 do=
sfstools@ppc64e6500 e2fsprogs-e2fsck@ppc64e6500 gnuradio-dev@ppc64e6500 pac=
kagegroup-fsl-core@all packagegroup-fsl-extend@all
 packagegroup-core-boot@b4860qds_64b packagegroup-core-full-cmdline@all sys=
klogd@ppc64e6500 merge-files@all packagegroup-core-buildessential@all rcw-i=
mage@b4860qds_64b packagegroup-core-x11-base@all kmod@ppc64e6500 usdpaa@b48=
60qds_64b packagegroup-core-nfs-server@all
 hypervisor-partman@ppc64e6500 ceetm@b4860qds_64b dpa-offload-staticdev@b48=
60qds_64b libc6-dev@ppc64e6500 usdpaa-dev@b4860qds_64b e2fsprogs-mke2fs@ppc=
64e6500 libgcov-dev@ppc64e6500 sysfsutils@ppc64e6500 qoriq-debug@b4860qds_6=
4b mtd-utils-ubifs@ppc64e6500
<a href=3D"mailto:kernel-image-3.12.37-rt51-qoriq-sdk-v1.8&#43;gf488de6@b48=
60qds_64b">kernel-image-3.12.37-rt51-qoriq-sdk-v1.8&#43;gf488de6@b4860qds_6=
4b</a> fmc@b4860qds_64b bash@ppc64e6500 packagegroup-core-standalone-sdk-ta=
rget@all e2fsprogs@ppc64e6500 packagegroup-core-tools-debug@b4860qds_64b
 hyperrelay@ppc64e6500 valgrind@ppc64e6500 sysstat@ppc64e6500 packagegroup-=
core-x11@all net-tools@ppc64e6500 cpp@ppc64e6500 kernel-devicetree@b4860qds=
_64b binutils@ppc64e6500 u-boot-qoriq-images@b4860qds_64b' returned 1:<o:p>=
</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Loading cache...<o:p></o:p></span></i><=
/p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Updating cache...&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ############=
############################ [100%]<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Computing transaction...error: Can't in=
stall
<a href=3D"mailto:libstdc&#43;&#43;6-4.9.2-r0@ppc64e6500">libstdc&#43;&#43;=
6-4.9.2-r0@ppc64e6500</a>: no package provides ld64.so.1()(64bit)<o:p></o:p=
></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">ERROR: Function failed: do_populate_sdk=
<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">ERROR: Logfile of failure stored in: /o=
pt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/b4860q=
ds_64b-fsl-linux/fsl-image-full/1.0-r0/temp/log.do_populate_sdk.98993<o:p><=
/o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-2015=
0619-yocto/meta-fsl-networking/images/fsl-image-full.bb, do_populate_sdk) f=
ailed with exit code '1'<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">NOTE: Tasks Summary: Attempted 6311 tas=
ks of which 2955 didn't need to be rerun and 1 failed.<o:p></o:p></span></i=
></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Summary: 1 task failed:<o:p></o:p></spa=
n></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp; /opt/QorIQ-SDK-V1.8-20150619-yoc=
to/meta-fsl-networking/images/fsl-image-full.bb, do_populate_sdk<o:p></o:p>=
</span></i></p>
<div style=3D"mso-element:para-border-div;border:none;border-bottom:solid w=
indowtext 1.0pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-size:12.0pt;font-family:&quot;Candara&quot;,&quot;sans-serif&quot;"><o:p>=
&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">W. Kyle Unice<o:p></o:p></p>
<p class=3D"MsoNormal">Staff Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">MS F1H03<o:p></o:p></p>
<p class=3D"MsoNormal">322 North 2200 West Dock 3<o:p></o:p></p>
<p class=3D"MsoNormal">Salt Lake City, Utah 84116-0850<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Voice: 801-594-2687<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_25D6125FB568F54699E315276ED4D36C614E19DFSLXMBX01cswl3co_--
