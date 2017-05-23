Return-Path: <prvs=0316b6c712=alan.levy@plextek.com>
X-Greylist: delayed 341 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 May 2017 11:25:59 UTC
Received: from mailgate.plextek.co.uk (mailgate.plextek.co.uk [62.254.222.163])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCA86025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 11:25:59 +0000 (UTC)
Received: from plextek-exch1.plextek.lan ([10.10.0.152]:39165)
	by mailgate.plextek.co.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <alan.levy@plextek.com>)
	id 1dD7rL-0002Z0-1B for openembedded-core@lists.openembedded.org;
	Tue, 23 May 2017 12:20:15 +0100
Received: from PLEXTEK-EXCH1.plextek.lan (10.10.0.152) by
	PLEXTEK-EXCH1.plextek.lan (10.10.0.152) with Microsoft SMTP Server
	(TLS) id 15.0.847.32; Tue, 23 May 2017 12:20:14 +0100
Received: from PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46]) by
	PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46%18]) with mapi id
	15.00.0847.030; Tue, 23 May 2017 12:20:08 +0100
From: Alan Levy <alan.levy@plextek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] base.bbclass: improve error message for
	missing host tools
Thread-Index: AdLTtnamWz8LjyXwQSCSBcG+2vQj1Q==
Date: Tue, 23 May 2017 11:20:08 +0000
Message-ID: <6ea4a0079ae04490aef2431f8c89d07f@PLEXTEK-EXCH1.plextek.lan>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.12.154]
MIME-Version: 1.0
Subject: [PATCH] base.bbclass: improve error message for missing host tools
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
X-List-Received-Date: Tue, 23 May 2017 11:26:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6ea4a0079ae04490aef2431f8c89d07fPLEXTEKEXCH1plexteklan_"

--_000_6ea4a0079ae04490aef2431f8c89d07fPLEXTEKEXCH1plexteklan_
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
meta/files/warnmissing.sh |  3 +++
3 files changed, 21 insertions(+), 2 deletions(-)
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
         bb.fatal("The following required tools (as specified by HOSTTOOLS)=
 appear to be unavailable in PATH, please install them in order to proceed:=
\n  %s" % " ".join(notfound))
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
index 0000000..41c707d
--- /dev/null
+++ b/meta/files/warnmissing.sh
@@ -0,0 +1,3 @@
+echo "The following tool (as specified by HOSTTOOLS_OPTIONAL) appears to b=
e unavailable in PATH but is needed by one or more recipes. Please install =
it in order to proceed:\n  `basename $0`"
+exit 1
+
--
2.7.4


--_000_6ea4a0079ae04490aef2431f8c89d07fPLEXTEKEXCH1plexteklan_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
<p class=3D"MsoNormal">Host tools such as Subversion (svn) are not always i=
nstalled or needed.<o:p></o:p></p>
<p class=3D"MsoNormal">When they were required by a recipe but not installe=
d the resulting error<o:p></o:p></p>
<p class=3D"MsoNormal">message was not very user friendly. This patch gener=
ates a friendly error<o:p></o:p></p>
<p class=3D"MsoNormal">message without forcing the user to install the tool=
s if they aren't<o:p></o:p></p>
<p class=3D"MsoNormal">needed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Alan Levy &lt;alan.levy@plextek.com&g=
t;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">meta/classes/base.bbclass | 16 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--<o:p></o:p></p>
<p class=3D"MsoNormal">meta/conf/bitbake.conf&nbsp;&nbsp;&nbsp; |&nbsp; 4 &=
#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">meta/files/warnmissing.sh |&nbsp; 3 &#43;&#43;&#43;<=
o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 21 insertions(&#43;), 2 deletions(-=
)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta/files/warnmissing.sh<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/classes/base.bbclass b/meta/classe=
s/base.bbclass<o:p></o:p></p>
<p class=3D"MsoNormal">index 7892665..ecb6956 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta/classes/base.bbclass<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta/classes/base.bbclass<o:p></o:=
p></p>
<p class=3D"MsoNormal">@@ -112,7 &#43;112,9 @@ def get_lic_checksum_file_li=
st(d):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; bb.fatal(d.getVar('PN') &#43; &quot;: LIC_FILES_CHKSUM=
 contains an invalid URL: &quot; &#43; url)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; return &quot; &quot;.join(f=
ilelist)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-def setup_hosttools_dir(dest, toolsvar, d, fatal=3D=
True):<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;def setup_hosttools_dir(dest, toolsvar, d, fata=
l=3DTrue, optional=3DFalse):<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; corebase =3D d.getVar('COREB=
ASE')<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; toolwarningscript =3D os.pat=
h.join(corebase, &quot;meta/files/warnmissing.sh&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; tools =3D d.getVar(toolsvar=
).split()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; origbbenv =3D d.getVar(&quo=
t;BB_ORIGENV&quot;, False)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; path =3D origbbenv.getVar(&=
quot;PATH&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -120,6 &#43;122,10 @@ def setup_hosttools_dir(des=
t, toolsvar, d, fatal=3DTrue):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; notfound =3D []<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; for tool in tools:<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; des=
ttool =3D os.path.join(dest, tool)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if o=
ptional and os.path.islink(desttool):<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;# For optional tools remove the symbolic link in case t=
he host package has been<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; # installed or removed since we last ran<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; os.remove(desttool)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
not os.path.exists(desttool):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; srctool =3D bb.utils.which(path, tool, executable=3DTr=
ue)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if &quot;ccache&quot; in srctool:<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -127,7 &#43;133,12 @@ def setup_hosttools_dir(des=
t, toolsvar, d, fatal=3DTrue):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if srctool:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.symlink(srctool, desttool)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; else:<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; notfound.append(tool)<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if optional:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Optio=
nal tools don't need to be present unless they are actually used by a recip=
e.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Set u=
p a symlink to a script that generates a runtime error if the tool is used<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.syml=
ink(toolwarningscript, desttool)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; notfoun=
d.append(tool)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; if notfound and fatal:<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.=
fatal(&quot;The following required tools (as specified by HOSTTOOLS) appear=
 to be unavailable in PATH, please install them in order to proceed:\n&nbsp=
; %s&quot; % &quot; &quot;.join(notfound))<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">@@ -234,6 &#43;245,7 @@ python base_eventhandler() {=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # W=
orks with the line in layer.conf which changes PATH to point here<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set=
up_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set=
up_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=
=3DFalse)<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; setu=
p_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_OPTIONAL', d, fatal=
=3DFalse, optional=3DTrue)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if isinstance(e, bb.ev=
ent.BuildStarted):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loc=
aldata =3D bb.data.createCopy(e.data)<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/conf/bitbake.conf b/meta/conf/bitb=
ake.conf<o:p></o:p></p>
<p class=3D"MsoNormal">index 8e4f4bb..6b5a195 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta/conf/bitbake.conf<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta/conf/bitbake.conf<o:p></o:p><=
/p>
<p class=3D"MsoNormal">@@ -477,6 &#43;477,10 @@ HOSTTOOLS_NONFATAL &#43;=3D=
 &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo&quot;<o:p></=
o:p></p>
<p class=3D"MsoNormal"># Temporary add few more detected in bitbake world<o=
:p></o:p></p>
<p class=3D"MsoNormal">HOSTTOOLS_NONFATAL &#43;=3D &quot;join nl size yes z=
cat&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# Tools that can occasionally cause problems at=
 runtime if they aren't present<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;# on the host.<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;HOSTTOOLS_OPTIONAL &#43;=3D &quot;svn cvs bzr h=
g&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">CCACHE ??=3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"># Disable ccache explicitly if CCACHE is null since =
gcc may be a symlink<o:p></o:p></p>
<p class=3D"MsoNormal"># of ccache some distributions (e.g., Fedora 17).<o:=
p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/files/warnmissing.sh b/meta/files/=
warnmissing.sh<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..41c707d<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta/files/warnmissing.sh<o:p></o:=
p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,3 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;echo &quot;The following tool (as specified by =
HOSTTOOLS_OPTIONAL) appears to be unavailable in PATH but is needed by one =
or more recipes. Please install it in order to proceed:\n&nbsp; `basename $=
0`&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;exit 1<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.7.4<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_6ea4a0079ae04490aef2431f8c89d07fPLEXTEKEXCH1plexteklan_--
