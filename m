Return-Path: <prvs=0316b6c712=alan.levy@plextek.com>
Received: from mailgate.plextek.co.uk (mailgate.plextek.co.uk [62.254.222.163])
	by mail.openembedded.org (Postfix) with ESMTP id 89AAC71A32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 11:45:32 +0000 (UTC)
Received: from plextek-exch1.plextek.lan ([10.10.0.152]:40176)
	by mailgate.plextek.co.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <alan.levy@plextek.com>)
	id 1dD8Fm-0003pR-2p for openembedded-core@lists.openembedded.org;
	Tue, 23 May 2017 12:45:30 +0100
Received: from PLEXTEK-EXCH1.plextek.lan (10.10.0.152) by
	PLEXTEK-EXCH1.plextek.lan (10.10.0.152) with Microsoft SMTP Server
	(TLS) id 15.0.847.32; Tue, 23 May 2017 12:45:17 +0100
Received: from PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46]) by
	PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46%18]) with mapi id
	15.00.0847.030; Tue, 23 May 2017 12:44:59 +0100
From: Alan Levy <alan.levy@plextek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] base.bbclass: improve error message for
	missing host tools
Thread-Index: AdLTucw6kWipB5hQRKCVYw2b3AMfwQ==
Date: Tue, 23 May 2017 11:44:58 +0000
Message-ID: <8db8207a6fe646d49a311c3705fd08c8@PLEXTEK-EXCH1.plextek.lan>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.12.154]
MIME-Version: 1.0
Subject: [PATCH v2] base.bbclass: improve error message for missing host tools
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
X-List-Received-Date: Tue, 23 May 2017 11:45:33 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8db8207a6fe646d49a311c3705fd08c8PLEXTEKEXCH1plexteklan_"

--_000_8db8207a6fe646d49a311c3705fd08c8PLEXTEKEXCH1plexteklan_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Host tools such as Subversion (svn) are not always installed or needed.
When they were required by a recipe but not installed the resulting error
message was not very user friendly. This patch generates a friendly error
message without forcing the user to install the tools if they aren't
needed.

Signed-off-by: Alan Levy <alan.levy@plextek.com>
---
meta/classes/base.bbclass | 16 ++++++++++++++--
meta/conf/bitbake.conf    |  4 ++++
meta/files/warnmissing.sh |  2 ++
3 files changed, 20 insertions(+), 2 deletions(-)
create mode 100755 meta/files/warnmissing.sh

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7892665..ecb6956 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -112,7 +112,9 @@ def get_lic_checksum_file_list(d):
             bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an inva=
lid URL: " + url)
     return " ".join(filelist)
-def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue):
+def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue, optional=3DFalse)=
:
+    corebase =3D d.getVar('COREBASE')
+    toolwarningscript =3D os.path.join(corebase, "meta/files/warnmissing.s=
h")
     tools =3D d.getVar(toolsvar).split()
     origbbenv =3D d.getVar("BB_ORIGENV", False)
     path =3D origbbenv.getVar("PATH")
@@ -120,6 +122,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTru=
e):
     notfound =3D []
     for tool in tools:
         desttool =3D os.path.join(dest, tool)
+        if optional and os.path.islink(desttool):
+            # For optional tools remove the symbolic link in case the host=
 package has been
+            # installed or removed since we last ran
+            os.remove(desttool)
         if not os.path.exists(desttool):
             srctool =3D bb.utils.which(path, tool, executable=3DTrue)
             if "ccache" in srctool:
@@ -127,7 +133,12 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTru=
e):
             if srctool:
                 os.symlink(srctool, desttool)
             else:
-                notfound.append(tool)
+                if optional:
+                    # Optional tools don't need to be present unless they =
are actually used by a recipe.
+                    # Set up a symlink to a script that generates a runtim=
e error if the tool is used
+                    os.symlink(toolwarningscript, desttool)
+                else:
+                    notfound.append(tool)
     if notfound and fatal:
        bb.fatal("The following required tools (as specified by HOSTTOOLS) =
appear to be unavailable in PATH, please install them in order to proceed:\=
n  %s" % " ".join(notfound))
@@ -234,6 +245,7 @@ python base_eventhandler() {
         # Works with the line in layer.conf which changes PATH to point he=
re
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL=
', d, fatal=3DFalse)
+        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_OPTIONAL=
', d, fatal=3DFalse, optional=3DTrue)
     if isinstance(e, bb.event.BuildStarted):
         localdata =3D bb.data.createCopy(e.data)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bb..6b5a195 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -477,6 +477,10 @@ HOSTTOOLS_NONFATAL +=3D "aws ccache gcc-ar gpg ld.bfd =
ld.gold nc sftp socat sudo"
# Temporary add few more detected in bitbake world
HOSTTOOLS_NONFATAL +=3D "join nl size yes zcat"
+# Tools that can occasionally cause problems at runtime if they aren't pre=
sent
+# on the host.
+HOSTTOOLS_OPTIONAL +=3D "svn cvs bzr hg"
+
CCACHE ??=3D ""
# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
# of ccache some distributions (e.g., Fedora 17).
diff --git a/meta/files/warnmissing.sh b/meta/files/warnmissing.sh
new file mode 100755
index 0000000..0048af4
--- /dev/null
+++ b/meta/files/warnmissing.sh
@@ -0,0 +1,2 @@
+echo "The following tool (as specified by HOSTTOOLS_OPTIONAL) appears to b=
e unavailable in PATH but is needed by one or more recipes. Please install =
it in order to proceed:\n  `basename $0`"
+exit 1
--
2.7.4


--_000_8db8207a6fe646d49a311c3705fd08c8PLEXTEKEXCH1plexteklan_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-language:EN-US;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Host tools such as Sub=
version (svn) are not always installed or needed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">When they were require=
d by a recipe but not installed the resulting error<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">message was not very u=
ser friendly. This patch generates a friendly error<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">message without forcin=
g the user to install the tools if they aren't<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">needed.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Signed-off-by: Alan Le=
vy &lt;alan.levy@plextek.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">---<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">meta/classes/base.bbcl=
ass | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">meta/conf/bitbake.conf=
&nbsp;&nbsp;&nbsp; |&nbsp; 4 &#43;&#43;&#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">meta/files/warnmissing=
.sh |&nbsp; 2 &#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">3 files changed, 20 in=
sertions(&#43;), 2 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">create mode 100755 met=
a/files/warnmissing.sh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta/clas=
ses/base.bbclass b/meta/classes/base.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index 7892665..ecb6956=
 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- a/meta/classes/bas=
e.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
/classes/base.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -112,7 &#43;112,9 @=
@ def get_lic_checksum_file_list(d):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(d.getVar('PN') =
&#43; &quot;: LIC_FILES_CHKSUM contains an invalid URL: &quot; &#43; url)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; return &quot; &quot;.join(filelist)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-def setup_hosttools_d=
ir(dest, toolsvar, d, fatal=3DTrue):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;def setup_hosttoo=
ls_dir(dest, toolsvar, d, fatal=3DTrue, optional=3DFalse):<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; corebase =3D d.getVar('COREBASE')<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
; toolwarningscript =3D os.path.join(corebase, &quot;meta/files/warnmissing=
.sh&quot;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; tools =3D d.getVar(toolsvar).split()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; origbbenv =3D d.getVar(&quot;BB_ORIGENV&quot;, False)<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; path =3D origbbenv.getVar(&quot;PATH&quot;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -120,6 &#43;122,10 =
@@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue):<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; notfound =3D []<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; for tool in tools:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; desttool =3D os.path.join(dest, tool)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if optional and os.path.islink(desttool):<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # For optional tools remo=
ve the symbolic link in case the host package has been<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # installed or removed si=
nce we last ran<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.remove(desttool)<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if not os.path.exists(desttool):<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; srctool =3D bb.utils.whi=
ch(path, tool, executable=3DTrue)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;ccache&quot; in=
 srctool:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -127,7 &#43;133,12 =
@@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTrue):<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if srctool:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
os.symlink(srctool, desttool)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; notfo=
und.append(tool)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f optional:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; # Optional tools don't need to be present unless the=
y are actually used by a recipe.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp; &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;# Set up a symlink to a script that generates a runt=
ime error if the tool is used<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; os.symlink(toolwarningscript, desttool)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; notfound.append(tool)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; if notfound and fatal:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;bb.fatal(&quot;The following required tools (as s=
pecified by HOSTTOOLS) appear to be unavailable in PATH, please install the=
m in order to proceed:\n&nbsp; %s&quot; % &quot; &quot;.join(notfound))<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -234,6 &#43;245,7 @=
@ python base_eventhandler() {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; # Works with the line in layer.conf which change=
s PATH to point here<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), '=
HOSTTOOLS', d)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), '=
HOSTTOOLS_NONFATAL', d, fatal=3DFalse)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'H=
OSTTOOLS_OPTIONAL', d, fatal=3DFalse, optional=3DTrue)<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;if isinstance(e, bb.event.BuildStarted):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; localdata =3D bb.data.createCopy(e.data)<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta/conf=
/bitbake.conf b/meta/conf/bitbake.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index 8e4f4bb..6b5a195=
 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- a/meta/conf/bitbak=
e.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
/conf/bitbake.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -477,6 &#43;477,10 =
@@ HOSTTOOLS_NONFATAL &#43;=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold n=
c sftp socat sudo&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"># Temporary add few mo=
re detected in bitbake world<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">HOSTTOOLS_NONFATAL &#4=
3;=3D &quot;join nl size yes zcat&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;# Tools that can =
occasionally cause problems at runtime if they aren't present<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;# on the host.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;HOSTTOOLS_OPTIONA=
L &#43;=3D &quot;svn cvs bzr hg&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">CCACHE ??=3D &quot;&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"># Disable ccache expli=
citly if CCACHE is null since gcc may be a symlink<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"># of ccache some distr=
ibutions (e.g., Fedora 17).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/meta/file=
s/warnmissing.sh b/meta/files/warnmissing.sh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">new file mode 100755<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index 0000000..0048af4=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- /dev/null<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/meta=
/files/warnmissing.sh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -0,0 &#43;1,2 @@<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;echo &quot;The fo=
llowing tool (as specified by HOSTTOOLS_OPTIONAL) appears to be unavailable=
 in PATH but is needed by one or more recipes. Please install it in order t=
o proceed:\n&nbsp; `basename $0`&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;exit 1<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-- <o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">2.7.4<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
</body>
</html>

--_000_8db8207a6fe646d49a311c3705fd08c8PLEXTEKEXCH1plexteklan_--
