Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id D41E578682
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 23:29:19 +0000 (UTC)
X-AuditID: 0a000213-bf3ff700000031b9-14-5a272bcfe0cf
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	7A.FB.12729.FCB272A5; Tue,  5 Dec 2017 17:29:19 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 5 Dec 2017 17:29:19 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Error caused by kernel-yocto: ensure that only valid BSPs are
	built
Thread-Index: AdNuGr+rCPF4JdIKS5Wr2G+lhqxOvQABZmGA
Date: Tue, 5 Dec 2017 23:29:18 +0000
Message-ID: <655290B7709079438B7932553958E60DA138C514@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.61]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWyRiBPQ/e8tnqUwdQmQ4s7P9+xOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoErY/ecTYwFywwr9jyYz9zAuFW7i5GDQ0LAROLe5fguRi4OIYET
	jBLXl7awQTgzGSX+3XkM5HBysAkYSZy7vokRJCEi0A1U1fyLqYuRnUNYIEjioh9IiYhAsMS+
	ty+YIWwjiRUb+1hAbBYBFYnJPzeB2bxA1XuOLAWzGQXEJL6fWsMEYjMLiEvcejIfzJYQEJBY
	suc8M4QtKvHy8T9WCFtOom/iQ3aI+nyJY+8hangFBCVOznzCMoFRcBaSUbOQlM1CUgYR15FY
	sPsTG4StLbFs4WtmGPvMgcdMyOILGNlXMQrmJmbmGOqlFheX5Zek6iXn525iBAY8FwOT8A7G
	BTNiDzEKcDAq8fAaK6tHCbEmlhVX5h5ilOZgURLnjTwoFyUkkJ5YkpqdmlqQWhRfVJqTWnyI
	kYmDE0RwSTUwhiscvtVygJ8rZMbvww8PH31y807R+hDpdx1yNves/gTzbhf/u7LAZdGuP+/n
	h7vOWM1RzrlRK9bpwrYtXH41JZGv39zYn7bjQETu0v2dSx4VHladZffEXErvc8+MQyVTBOKf
	xr6r632+RE3877xNR/7cft0op51x8bNUrNIvrt9XN+xSCkxpslBiKc5INNRiLipOBAAsQb1l
	XgIAAA==
Subject: Re: Error caused by kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Tue, 05 Dec 2017 23:29:20 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA138C514ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA138C514ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After some more digging I found it is because the KTYPE is defined as stand=
ard/base and the spp script can only find standard.
Is this expected behavior and yocto-bsp should be fixed or a bug and spp sh=
ould be fixed?


From: Davis, Michael
Sent: Tuesday, December 05, 2017 4:45 PM
To: 'openembedded-core@lists.openembedded.org'
Subject: Error caused by kernel-yocto: ensure that only valid BSPs are buil=
t

After upgrading rocko all my builds are failing with the following message.
ERROR: linux-yocto-4.12.14+gitAUTOINC+e3c9041f48_1d685baca1-r0.1 do_kernel_=
metadata: Could not locate BSP definition for test/standard and no defconfi=
g was provided
The source of the issue seems to be commit 44aea7b87307795fe4e089c51d45afcc=
aa2f6525.
This includes a fresh BSP I created with yocto-bsp create, so the helper to=
ols are generating examples that don't work.
bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKTYPE=
=3D${LINUX_KERNEL_TYPE}) always returns nothing even though I have .scc fil=
es defined.
What is the new expected format to avoid this error?

Thanks,
Mike


--_000_655290B7709079438B7932553958E60DA138C514ESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">After some more diggin=
g I found it is because the KTYPE is defined as standard/base and the spp s=
cript can only find standard.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Is this expected behav=
ior and yocto-bsp should be fixed or a bug and spp should be fixed?<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></=
span></i></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Davis, M=
ichael
<br>
<b>Sent:</b> Tuesday, December 05, 2017 4:45 PM<br>
<b>To:</b> 'openembedded-core@lists.openembedded.org'<br>
<b>Subject:</b> Error caused by kernel-yocto: ensure that only valid BSPs a=
re built<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After upgrading rocko all my builds are failing with=
 the following message.<o:p></o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Courier New&quot=
;;color:#FF5454;
background:white">ERROR</span></b><span style=3D"font-family:&quot;Courier =
New&quot;;
color:black;background:white">:
</span><span style=3D"font-family:&quot;Courier New&quot;;
color:#B21818;background:white">linux-yocto-4.12.14&#43;gitAUTOINC&#43;e3c9=
041f48_1d685baca1-r0.1 do_kernel_metadata: Could not locate BSP definition =
for test/standard and no defconfig was provided<o:p></o:p></span></p>
<p class=3D"MsoNormal">The source of the issue seems to be commit <span sty=
le=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-serif&qu=
ot;;color:#333333;
background:white">
44aea7b87307795fe4e089c51d45afccaa2f6525.<o:p></o:p></span></p>
<p class=3D"MsoNormal">This includes a fresh BSP I created with yocto-bsp c=
reate, so the helper tools are generating examples that don&#8217;t work.<s=
pan style=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-s=
erif&quot;;color:#333333;
background:white"><o:p></o:p></span></p>
<p class=3D"MsoNormal">bsp_definition=3D$(spp ${includes} --find -DKMACHINE=
=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE}) always returns nothing even =
though I have .scc files defined.<o:p></o:p></p>
<p class=3D"MsoNormal">What is the new expected format to avoid this error?=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA138C514ESSEX01essvotec_--
