Return-Path: <prvs=0316b6c712=alan.levy@plextek.com>
Received: from mailgate.plextek.co.uk (mailgate.plextek.co.uk [62.254.222.163])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB4A7199E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 12:39:27 +0000 (UTC)
Received: from plextek-exch1.plextek.lan ([10.10.0.152]:42012)
	by mailgate.plextek.co.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <alan.levy@plextek.com>)
	id 1dD95y-0006hX-1T for openembedded-core@lists.openembedded.org;
	Tue, 23 May 2017 13:39:26 +0100
Received: from PLEXTEK-EXCH1.plextek.lan (10.10.0.152) by
	PLEXTEK-EXCH1.plextek.lan (10.10.0.152) with Microsoft SMTP Server
	(TLS) id 15.0.847.32; Tue, 23 May 2017 13:39:19 +0100
Received: from PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46]) by
	PLEXTEK-EXCH1.plextek.lan ([fe80::64ad:692a:46f8:cc46%18]) with mapi id
	15.00.0847.030; Tue, 23 May 2017 13:39:19 +0100
From: Alan Levy <alan.levy@plextek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v3] base.bbclass: improve error message for
	missing host tools
Thread-Index: AdLTwV+3lpUv5pJHRWOl7ntqUnR3Dw==
Date: Tue, 23 May 2017 12:39:19 +0000
Message-ID: <b8549a606b514fa4b41060b879cc59d0@PLEXTEK-EXCH1.plextek.lan>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.12.154]
MIME-Version: 1.0
Subject: [PATCH v3] base.bbclass: improve error message for missing host tools
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
X-List-Received-Date: Tue, 23 May 2017 12:39:30 -0000
Content-Language: en-US
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
=20
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
=20
@@ -234,6 +245,7 @@ python base_eventhandler() {
         # Works with the line in layer.conf which changes PATH to point he=
re
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL=
', d, fatal=3DFalse)
+        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_OPTIONAL=
', d, fatal=3DFalse, optional=3DTrue)
=20
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
=20
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
--=20
2.7.4


