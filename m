Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 427DE6D181
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 07:54:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Oct 2013 00:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,607,1378882800"; 
	d="scan'208,217";a="425652732"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2013 00:54:21 -0700
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 31 Oct 2013 07:53:49 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.83]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.75]) with mapi id
	14.03.0123.003; Thu, 31 Oct 2013 07:53:49 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: oe-selftest proof of concept
Thread-Index: Ac7WDQZZRNYS7Kf/TvuytaHDS9G5QQ==
Date: Thu, 31 Oct 2013 07:53:48 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1A9528@IRSMSX103.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: oe-selftest proof of concept
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
X-List-Received-Date: Thu, 31 Oct 2013 07:54:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_33115ABC4887814E8A92A08FBC93416B0A1A9528IRSMSX103gercor_"

--_000_33115ABC4887814E8A92A08FBC93416B0A1A9528IRSMSX103gercor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This e-mail was originally sent to the Yocto mailing list in the form of 2 =
e-mails. As per Paul's and Richard's request, I am re-sending and moving th=
e conversation here. Feel free to add any input :) .

NOTE: I also made a small syntax correction in the example at the end of th=
e e-mail for oeSelfTest.var_append() .

After a chat with Richard and Stefan, I came up with an outline of how the =
oe-selftest feature(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D474=
0 ) should look like. I made a summary of my proposal below. Please feel fr=
ee to add your thoughts!

There will be a new script introduced(similar to bitbake-selftest) that wil=
l use python unit test to execute tests. Name has not been decided but it c=
an be "oe-selftest".
Running this script will not compromise poky in any way.
Initially, the script does not need any preparation in order to be run. If =
this changes in the future, the user will be prompted upon execution with t=
he pre-required tasks.
Oe-selftest can be used together with the automated runtime tests if necess=
ary.

The following types of tests are targeted for the initial implementation:
- testing the functionality of scripts in poky/scripts (such as: bitbake-la=
yers, yocto-bsp, yocto-kernel, yocto-layers)
- testing of the 'bitbake' command and its output (this includes output dat=
a validation such as the sstate-cache/ and tmp/ directories)

In order to achieve the above, the script will need to:

-          manipulate configuration files and variables

-          issue commands in a certain order

-          analyze command output

-          analyze output files and directories

-          manage shared resources such as sstate-cache

Oe-selftest will use Python Unit Testing as follows:
                - we will use what has already been done with the 'unittest=
' and 'oeqa' classes. This includes 'decorators' and methods like 'skipModu=
les'.
                - the tests configuration files will be similar to those of=
 the automated runtime tests.
                - because we are using the same framework and structure, th=
e output will also be similar to that of the automated runtime tests
                - the build environments used will be set up in the setUpCl=
ass() or setUpModule() methods
                                * local.conf may be modified here to use sh=
ared resources like sstate-cache and downloads directory with other build e=
nvironments
                - the build environments used will be removed in the tearDo=
wnClass() or tearDownModule() methods
                                * this ensures no residue is left over that=
 we are not aware of
                - we will add a new class oeqa.oeSelfTest that contains the=
 following base methods:

1) A few methods to manipulate variables in poky in a standardized way:
                - oeSelfTest.var_rewrite(filepath_relative_to_poky_location=
, variable_name, new_variable_value)
                                * resets a variable to the specified value(=
may be similar to how HOB does to local.conf and bblayers.conf)
                - oeSelfTest.var_append(filepath_relative_to_poky_location,=
 variable_name, appended_variable_value)
                                * appends data to a variable
                - oeSelfTest.var_remove(filepath_relative_to_poky_location,=
 variable_name, remove_variable_value)
                                * removes data from a variable

2) We need to be able to execute tasks in a multiple build directories envi=
ronment.
                - oeSelfTest.execute(command, build_dir)
                                * this method executes the command 'command=
' from 'build_dir'
                                * for each execution, the environment is so=
urced (similar to autobuilder)
                                (if the build directory does not exist, the=
 command will fail. This needs to be taken care of in the setUpClass() meth=
od)
                                * it returns the exit code and the output o=
f the command

Additional information/notes:
- class and method naming and structure is not final and open for suggestio=
ns
- poky under git is required for the script to work; we will use git to res=
et modified files to default.
- a policy needs to be set in place(after experience has been gained from u=
sing the tool) for working with a shared sstate-cache directory and multipl=
e build environments at a time.
- coding style is very important in order to get a reasonable execution tim=
e. At the moment this is not a priority though.
- no strategy has been put in place yet in order to deal with multiple poky=
 environments


I made an example of how we can use the functionality described to conduct =
3 of our test cases:
https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D90
https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D93
https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D83

As mentioned, the structure is very similar to the automated runtime tests =
configuration files.
NOTE: ${POKYDIR} does not exist but I use it to refer to the location of th=
e poky directory.

"
import unittest
import os
from oeqa import oeSelfTest, skipModule
from oeqa.utils.decorators import *

def setUpModule():
#             Here we set up the environment for a build directory

class bitbake_layers(oeSelfTest):

                @classmethod
                def setUpClass(self):
#                             Here we set up special settings for the build=
 environment, like shared sstate-cache directory

                def test_show_overlayed(self):
                                oeSelfTest.execute("cp -R ${POKYDIR}/meta/r=
ecipes-graphics/clutter ${POKYDIR}/meta/recipes-core/")
                                (status, output) =3D oeSelfTest.execute("bi=
tbake-layers show_overlayed | grep clutter", build_dir)
                                oeSelfTest.execute("rm -R ${POKYDIR}/meta/r=
ecipes-core/clutter")
                                self.assertEqual(status, 0, msg=3D"Could no=
t find overlayed recipe")

                def test_show_appends(self):
                                oeSelfTest.execute("echo "" > ${POKYDIR}/me=
ta-yocto/recipes-core/busybox/linux-yocto_3.10.bbappend"/")
                                (status, output) =3D oeSelfTest.execute("bi=
tbake_layers show_appends | grep \"/meta-yocto/recipes-core/busybox/linux-y=
octo_3.10.bbappend\"", build_dir)
                                self.assertEqual(status, 0, msg=3D" 'bitbak=
e_layers show_appends' Could not find the bbappend file")

                def test_show_layers(self):
                                (ls_status) =3D oeSelfTest.execute("ls ${PO=
KYDIR} | grep meta-intel")
                                if ls_status =3D=3D 1:
                                                (git_status) =3D oeSelfTest=
.execute("git clone git://git.yoctoproject.org/meta-intel ${POKYDIR}/")
                                oeSelfTest.var_append("${BUILDDIR}/conf.bbl=
ayers.conf", "BBLAYERS", "${POKYDIR}/meta-intel")
                                (status, output) =3D oeSelfTest.execute("bi=
tbake-layers show_layers | grep meta-intel", build_dir)
                                self.assertEqual(status, 0, msg=3D" 'bitbak=
e-layers show_layers ' could not find meta-intel layer in output")

                @classmethod
                def tearDownClass(self):
#                             Even though now it's not needed, here we can =
reset the git repo in order to revert to default
                                oeSelfTest.execute("git reset --hard")

def tearDownModule():
#             Here we remove the build directory
"

Regards,
Corneliu
Romania Yocto QA


--_000_33115ABC4887814E8A92A08FBC93416B0A1A9528IRSMSX103gercor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1671758149;
	mso-list-type:hybrid;
	mso-list-template-ids:298582696 -245868780 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri","sans-serif";
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"text-autospace:none">Hello all,<o:p></o:p><=
/p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><i>This e-mail was =
originally sent to the Yocto mailing list in the form of 2 e-mails. As per =
Paul&#8217;s and Richard&#8217;s request, I am re-sending and moving the co=
nversation here. Feel free to add any input
</i></b><b><i><span style=3D"font-family:Wingdings">J</span></i></b><b><i> =
.<o:p></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><i><o:p>&nbsp;</o:p=
></i></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><i>NOTE: I also mad=
e a small syntax correction in the example at the end of the e-mail for oeS=
elfTest.var_append() .<o:p></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">After a chat with Rich=
ard and Stefan, I came up with an outline of how the oe-selftest feature(<a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4740">https://=
bugzilla.yoctoproject.org/show_bug.cgi?id=3D4740</a>
 ) should look like. I made a summary of my proposal below. Please feel fre=
e to add your thoughts!<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">There will be a new sc=
ript introduced(similar to bitbake-selftest) that will use python unit test=
 to execute tests. Name has not been decided but it can be &quot;oe-selftes=
t&quot;.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Running this script wi=
ll not compromise poky in any way.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Initially, the script =
does not need any preparation in order to be run. If this changes in the fu=
ture, the user will be prompted upon execution with the pre-required tasks.=
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Oe-selftest can be use=
d together with the automated runtime tests if necessary.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">The following types of=
 tests are targeted for the initial implementation:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- testing the function=
ality of scripts in poky/scripts (such as: bitbake-layers, yocto-bsp, yocto=
-kernel, yocto-layers)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- testing of the 'bitb=
ake' command and its output (this includes output data validation such as t=
he sstate-cache/ and tmp/ directories)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">In order to achieve th=
e above, the script will need to:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>manipulate configuration files and variables<o:p></=
o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>issue commands in a certain order<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>analyze command output<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>analyze output files and directories<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1;text-autospace:none">
<![if !supportLists]><span style=3D"mso-list:Ignore">-<span style=3D"font:7=
.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span></span><![endif]>manage shared resources such as sstate-cache<o:p></=
o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Oe-selftest will use P=
ython Unit Testing as follows:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - we w=
ill use what has already been done with the &#8216;unittest&#8217; and &#82=
16;oeqa&#8217; classes. This includes &#8216;decorators&#8217; and methods =
like &#8216;skipModules&#8217;.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - the =
tests configuration files will be similar to those of the automated runtime=
 tests.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - beca=
use we are using the same framework and structure, the output will also be =
similar to that of the automated runtime tests<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - the =
build environments used will be set up in the setUpClass() or setUpModule()=
 methods<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * local.conf may be modified here to use shared resources li=
ke sstate-cache and downloads directory with other build environments<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - the =
build environments used will be removed in the tearDownClass() or tearDownM=
odule() methods<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * this ensures no residue is left over that we are not aware=
 of<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - we w=
ill add a new class oeqa.oeSelfTest that contains the following base method=
s:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">1) A few methods to ma=
nipulate variables in poky in a standardized way:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - oeSe=
lfTest.var_rewrite(filepath_relative_to_poky_location, variable_name, new_v=
ariable_value)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * resets a variable to the specified value(may be similar to=
 how HOB does to local.conf and bblayers.conf)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - oeSe=
lfTest.var_append(filepath_relative_to_poky_location, variable_name, append=
ed_variable_value)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * appends data to a variable<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - oeSe=
lfTest.var_remove(filepath_relative_to_poky_location, variable_name, remove=
_variable_value)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * removes data from a variable<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">2) We need to be able =
to execute tasks in a multiple build directories environment.<o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - oeSe=
lfTest.execute(command, build_dir)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * this method executes the command 'command' from 'build_dir=
'<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * for each execution, the environment is sourced (similar to=
 autobuilder)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (if the build directory does not exist, the command will fai=
l. This needs to be taken care of in the setUpClass() method)<o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"text-autospace:none">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; * it returns the exit code and the output of the command<o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">Additional information=
/notes:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- class and method nam=
ing and structure is not final and open for suggestions<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- poky under git is re=
quired for the script to work; we will use git to reset modified files to d=
efault.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- a policy needs to be=
 set in place(after experience has been gained from using the tool) for wor=
king with a shared sstate-cache directory and multiple build environments a=
t a time.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none">- coding style is very=
 important in order to get a reasonable execution time. At the moment this =
is not a priority though.<o:p></o:p></p>
<p class=3D"MsoNormal">- no strategy has been put in place yet in order to =
deal with multiple poky environments<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I made an example of h=
ow we can use the functionality described to conduct 3 of our test cases:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><a href=3D"https://bugzilla.yoctoproject.org/tr_show=
_case.cgi?case_id=3D90">https://bugzilla.yoctoproject.org/tr_show_case.cgi?=
case_id=3D90</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://bugzilla.yoctoproject.org/tr_show=
_case.cgi?case_id=3D93">https://bugzilla.yoctoproject.org/tr_show_case.cgi?=
case_id=3D93</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://bugzilla.yoctoproject.org/tr_show=
_case.cgi?case_id=3D83">https://bugzilla.yoctoproject.org/tr_show_case.cgi?=
case_id=3D83</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">As mentioned, the stru=
cture is very similar to the automated runtime tests configuration files.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">NOTE: ${POKYDIR} does =
not exist but I use it to refer to the location of the poky directory.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#8220;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>import unittest<o:p=
></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>import os<o:p></o:p=
></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>from oeqa import oe=
SelfTest, skipModule<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>from oeqa.utils.dec=
orators import *<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>def setUpModule():<=
o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>#&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Here we set up the e=
nvironment for a build directory<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>class bitbake_layer=
s(oeSelfTest):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @cl=
assmethod<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def=
 setUpClass(self):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>#&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Here we set up special settings for the build environment, like shared sst=
ate-cache directory<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:=
p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def=
 test_show_overlayed(self):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; oeSelfTest.execute(&quot;cp -R ${POKYDIR}/meta/recipes-gr=
aphics/clutter ${POKYDIR}/meta/recipes-core/&quot;)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (status, output) =3D oeSelfTest.execute(&quot;bitbake-lay=
ers show_overlayed | grep clutter&quot;, build_dir)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; oeSelfTest.execute(&quot;rm -R ${POKYDIR}/meta/recipes-co=
re/clutter&quot;)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; self.assertEqual(status, 0, msg=3D&quot;Could not find ov=
erlayed recipe&quot;)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def=
 test_show_appends(self):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; oeSelfTest.execute(&quot;echo &quot;&quot; &gt; ${POKYDIR=
}/meta-yocto/recipes-core/busybox/linux-yocto_3.10.bbappend&quot;/&quot;)<o=
:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (status, output) =3D oeSelfTest.execute(&quot;bitbake_lay=
ers show_appends | grep \&quot;/meta-yocto/recipes-core/busybox/linux-yocto=
_3.10.bbappend\&quot;&quot;, build_dir)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; self.assertEqual(status, 0, msg=3D&quot; 'bitbake_layers =
show_appends' Could not find the bbappend file&quot;)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def=
 test_show_layers(self):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (ls_status) =3D oeSelfTest.execute(&quot;ls ${POKYDIR} | =
grep meta-intel&quot;)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if ls_status =3D=3D 1:<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (git_status) =3D oeSelfTest.execute(=
&quot;git clone git://git.yoctoproject.org/meta-intel ${POKYDIR}/&quot;)<o:=
p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; oeSelfTest.var_append(&quot;${BUILDDIR}/conf.bblayers.con=
f&quot;, &quot;BBLAYERS&quot;, &quot;${POKYDIR}/meta-intel&quot;)<o:p></o:p=
></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (status, output) =3D oeSelfTest.execute(&quot;bitbake-lay=
ers show_layers | grep meta-intel&quot;, build_dir)<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; self.assertEqual(status, 0, msg=3D&quot; 'bitbake-layers =
show_layers ' could not find meta-intel layer in output&quot;)<o:p></o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @cl=
assmethod<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def=
 tearDownClass(self):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>#&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Even though now it's not needed, here we can reset the git repo in order t=
o revert to default<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; oeSelfTest.execute(&quot;git reset --hard&quot;)<o:p></o:=
p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i><o:p>&nbsp;</o:p></=
i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>def tearDownModule(=
):<o:p></o:p></i></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><i>#&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Here we remove the b=
uild directory<o:p></o:p></i></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#8220;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Corneliu<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Romania Yocto QA<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_33115ABC4887814E8A92A08FBC93416B0A1A9528IRSMSX103gercor_--
