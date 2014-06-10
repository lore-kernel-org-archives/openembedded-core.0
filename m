Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC47265E61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 01:35:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5A1ZEaP003604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jun 2014 18:35:14 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 9 Jun 2014 18:35:14 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jun 2014 09:35:12 +0800
Message-ID: <1402364112-10170-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH][V2] oprofile: Determine the root home directory dynamically
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
X-List-Received-Date: Tue, 10 Jun 2014 01:35:19 -0000
Content-Type: text/plain

This commit detects the root home directory dynamically with changes to
the opcontrol script and the oprofile gui app source.

The commit replaces an earlier fix that detected and adjusted a
'non-standard' root home directory at build time.  The advantage of this
patch is that the oprofile tools are adjusted to the current run-time
path to ~root, not the build time path.

Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |    5 +-
 .../oprofile/oprofile/oprofile-root.patch          |  113 ------------------
 .../oprofile/oprofile/root-home-dir.patch          |  120 ++++++++++++++++++++
 3 files changed, 122 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index aaba48e..76d0b6c 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,16 +19,15 @@ FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
 SRC_URI = "file://opstart.patch \
-           file://oprofile-root.patch \
            file://acinclude.m4 \
            file://oprofile-cross-compile-tests.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://root-home-dir.patch"
 
 inherit autotools-brokensep pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
-	find ${S} -wholename '${S}/.pc' -prune -o -type f -print | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
 }
diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
deleted file mode 100644
index f3fe4c9..0000000
--- a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Change hardcoded /root to /home/root
-
-Upstream-Status: inappropriate [OE specific]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Replace "/home/root" with stub "ROOTHOME", then substitute it with
-real root home directory which is configured dymanically.
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-
-diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofile-0.9.7/doc/opcontrol.1.in
---- oprofile-0.9.7.orig/doc/opcontrol.1.in	2011-07-04 21:25:04.000000000 -0500
-+++ oprofile-0.9.7/doc/opcontrol.1.in	2012-07-02 14:02:16.358865420 -0500
-@@ -171,7 +171,7 @@
- 
- .SH FILES
- .TP
--.I /root/.oprofile/daemonrc
-+.I ROOTHOME/.oprofile/daemonrc
- Configuration file for opcontrol
- .TP
- .I /var/lib/oprofile/samples/
-diff -ur oprofile-0.9.7.orig/doc/oprofile.1 oprofile-0.9.7/doc/oprofile.1
---- oprofile-0.9.7.orig/doc/oprofile.1	2011-08-12 10:23:27.000000000 -0500
-+++ oprofile-0.9.7/doc/oprofile.1	2012-07-02 14:02:29.295862358 -0500
-@@ -150,7 +150,7 @@
- .I $HOME/.oprofile/
- Configuration files
- .TP
--.I /root/.oprofile/daemonrc
-+.I ROOTHOME/.oprofile/daemonrc
- Configuration file for opcontrol
- .TP
- .I /opt/oprofile-0.9.7-rc3/share/oprofile/
-diff -ur oprofile-0.9.7.orig/doc/oprofile.1.in oprofile-0.9.7/doc/oprofile.1.in
---- oprofile-0.9.7.orig/doc/oprofile.1.in	2011-07-04 21:25:04.000000000 -0500
-+++ oprofile-0.9.7/doc/oprofile.1.in	2012-07-02 14:01:35.812004623 -0500
-@@ -150,7 +150,7 @@
- .I $HOME/.oprofile/
- Configuration files
- .TP
--.I /root/.oprofile/daemonrc
-+.I ROOTHOME/.oprofile/daemonrc
- Configuration file for opcontrol
- .TP
- .I @prefix@/share/oprofile/
-diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile-0.9.7/doc/oprofile.html
---- oprofile-0.9.7.orig/doc/oprofile.html	2011-07-04 21:32:35.000000000 -0500
-+++ oprofile-0.9.7/doc/oprofile.html	2012-07-02 14:04:59.804018961 -0500
-@@ -1394,7 +1394,7 @@
-               <dd>
-                 <p>
- 		    Followed by list arguments for profiling set up. List of arguments
--		    saved in <code class="filename">/root/.oprofile/daemonrc</code>.
-+		    saved in <code class="filename">ROOTHOME/.oprofile/daemonrc</code>.
- 		    Giving this option is not necessary; you can just directly pass one
- 		    of the setup options, e.g. <span class="command"><strong>opcontrol --no-vmlinux</strong></span>.
- 		  </p>
-@@ -1430,7 +1430,7 @@
-               <dd>
-                 <p>
- 		    Start data collection with either arguments provided by <code class="option">--setup</code>
--		or information saved in <code class="filename">/root/.oprofile/daemonrc</code>. Specifying
-+		or information saved in <code class="filename">ROOTHOME/.oprofile/daemonrc</code>. Specifying
- 		the addition <code class="option">--verbose</code> makes the daemon generate lots of debug data
- 		whilst it is running.
- 		</p>
-diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-0.9.7/doc/oprofile.xml
---- oprofile-0.9.7.orig/doc/oprofile.xml	2011-07-04 21:25:04.000000000 -0500
-+++ oprofile-0.9.7/doc/oprofile.xml	2012-07-02 14:02:03.543019283 -0500
-@@ -568,7 +568,7 @@
- 		<term><option>--setup</option></term>
- 		<listitem><para>
- 		    Followed by list arguments for profiling set up. List of arguments
--		    saved in <filename>/root/.oprofile/daemonrc</filename>.
-+		    saved in <filename>ROOTHOME/.oprofile/daemonrc</filename>.
- 		    Giving this option is not necessary; you can just directly pass one
- 		    of the setup options, e.g. <command>opcontrol --no-vmlinux</command>.
- 		  </para></listitem>
-@@ -592,7 +592,7 @@
- 		<term><option>--start</option></term>
- 		<listitem><para>
- 		    Start data collection with either arguments provided by <option>--setup</option>
--		or information saved in <filename>/root/.oprofile/daemonrc</filename>. Specifying
-+		or information saved in <filename>ROOTHOME/.oprofile/daemonrc</filename>. Specifying
- 		the addition <option>--verbose</option> makes the daemon generate lots of debug data
- 		whilst it is running.
- 		</para></listitem>
-diff -ur oprofile-0.9.7.orig/gui/oprof_start_util.cpp oprofile-0.9.7/gui/oprof_start_util.cpp
---- oprofile-0.9.7.orig/gui/oprof_start_util.cpp	2011-07-04 21:25:04.000000000 -0500
-+++ oprofile-0.9.7/gui/oprof_start_util.cpp	2012-07-02 13:55:21.041876096 -0500
-@@ -39,7 +39,7 @@
- // return the ~ expansion suffixed with a '/'
- string const get_config_dir()
- {
--	return "/root";
-+	return "ROOTHOME";
- }
- 
- string daemon_pid;
-diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile-0.9.7/utils/opcontrol
---- oprofile-0.9.7.orig/utils/opcontrol	2011-07-20 14:36:48.000000000 -0500
-+++ oprofile-0.9.7/utils/opcontrol	2012-07-02 13:55:06.232872688 -0500
-@@ -384,7 +384,7 @@
- 	OPROFILED="$OPDIR/oprofiled"
- 
- 	# location for daemon setup information
--	SETUP_DIR="/root/.oprofile"
-+	SETUP_DIR="ROOTHOME/.oprofile"
- 	SETUP_FILE="$SETUP_DIR/daemonrc"
- 	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
- 
diff --git a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch b/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
new file mode 100644
index 0000000..45cab7d
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
@@ -0,0 +1,120 @@
+oprofile: Determine the root home directory dynamically
+
+This commit detects the root home directory dynamically with changes to
+the opcontrol script and the oprofile gui app source.
+
+The commit replaces an earlier fix that detected and adjusted a
+'non-standard' root home directory at build time.  The advantage of this
+patch is that the oprofile tools are adjusted to the current run-time
+path to ~root, not the build time path.
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+
+diff --git a/doc/opcontrol.1.in b/doc/opcontrol.1.in
+index c434704..f57eb76 100644
+--- a/doc/opcontrol.1.in
++++ b/doc/opcontrol.1.in
+@@ -171,7 +171,7 @@ No special environment variables are recognised by opcontrol.
+ 
+ .SH FILES
+ .TP
+-.I /root/.oprofile/daemonrc
++.I ~root/.oprofile/daemonrc
+ Configuration file for opcontrol
+ .TP
+ .I /var/lib/oprofile/samples/
+diff --git a/doc/oprofile.1.in b/doc/oprofile.1.in
+index 3d0f0ed..5c623e1 100644
+--- a/doc/oprofile.1.in
++++ b/doc/oprofile.1.in
+@@ -150,7 +150,7 @@ No special environment variables are recognised by oprofile.
+ .I $HOME/.oprofile/
+ Configuration files
+ .TP
+-.I /root/.oprofile/daemonrc
++.I ~root/.oprofile/daemonrc
+ Configuration file for opcontrol
+ .TP
+ .I @prefix@/share/oprofile/
+diff --git a/doc/oprofile.html b/doc/oprofile.html
+index 128d9f7..d7e4dea 100644
+--- a/doc/oprofile.html
++++ b/doc/oprofile.html
+@@ -1394,7 +1394,7 @@ The <span class="command"><strong>opcontrol</strong></span> script provides the
+               <dd>
+                 <p>
+ 		    Followed by list arguments for profiling set up. List of arguments
+-		    saved in <code class="filename">/root/.oprofile/daemonrc</code>.
++		    saved in <code class="filename">~root/.oprofile/daemonrc</code>.
+ 		    Giving this option is not necessary; you can just directly pass one
+ 		    of the setup options, e.g. <span class="command"><strong>opcontrol --no-vmlinux</strong></span>.
+ 		  </p>
+@@ -1430,7 +1430,7 @@ The <span class="command"><strong>opcontrol</strong></span> script provides the
+               <dd>
+                 <p>
+ 		    Start data collection with either arguments provided by <code class="option">--setup</code>
+-		or information saved in <code class="filename">/root/.oprofile/daemonrc</code>. Specifying
++		or information saved in <code class="filename">~root/.oprofile/daemonrc</code>. Specifying
+ 		the addition <code class="option">--verbose</code> makes the daemon generate lots of debug data
+ 		whilst it is running.
+ 		</p>
+diff --git a/doc/oprofile.xml b/doc/oprofile.xml
+index 6a17c6d..0968d76 100644
+--- a/doc/oprofile.xml
++++ b/doc/oprofile.xml
+@@ -568,7 +568,7 @@ The <command>opcontrol</command> script provides the following actions :
+ 		<term><option>--setup</option></term>
+ 		<listitem><para>
+ 		    Followed by list arguments for profiling set up. List of arguments
+-		    saved in <filename>/root/.oprofile/daemonrc</filename>.
++		    saved in <filename>~root/.oprofile/daemonrc</filename>.
+ 		    Giving this option is not necessary; you can just directly pass one
+ 		    of the setup options, e.g. <command>opcontrol --no-vmlinux</command>.
+ 		  </para></listitem>
+@@ -592,7 +592,7 @@ The <command>opcontrol</command> script provides the following actions :
+ 		<term><option>--start</option></term>
+ 		<listitem><para>
+ 		    Start data collection with either arguments provided by <option>--setup</option>
+-		or information saved in <filename>/root/.oprofile/daemonrc</filename>. Specifying
++		or information saved in <filename>~root/.oprofile/daemonrc</filename>. Specifying
+ 		the addition <option>--verbose</option> makes the daemon generate lots of debug data
+ 		whilst it is running.
+ 		</para></listitem>
+diff --git a/gui/oprof_start_util.cpp b/gui/oprof_start_util.cpp
+index d293431..d13fa8f 100644
+--- a/gui/oprof_start_util.cpp
++++ b/gui/oprof_start_util.cpp
+@@ -20,6 +20,8 @@
+ #include <iostream>
+ #include <fstream>
+ #include <cstdlib>
++#include <sys/types.h>
++#include <pwd.h>
+ 
+ #include <qfiledialog.h>
+ #include <qmessagebox.h>
+@@ -39,7 +41,8 @@ namespace {
+ // return the ~ expansion suffixed with a '/'
+ string const get_config_dir()
+ {
+-	return "/root";
++	struct *pw = getpwnam("root");
++	return pw->pw_dir;
+ }
+ 
+ string daemon_pid;
+diff --git a/utils/opcontrol b/utils/opcontrol
+index 09fa5a7..a8acdae 100644
+--- a/utils/opcontrol
++++ b/utils/opcontrol
+@@ -385,7 +385,7 @@ do_init()
+ 	OPROFILED="$OPDIR/oprofiled"
+ 
+ 	# location for daemon setup information
+-	SETUP_DIR="/root/.oprofile"
++	SETUP_DIR="`grep root /etc/passwd | cut -d: -f6`/.oprofile"
+ 	SETUP_FILE="$SETUP_DIR/daemonrc"
+ 	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
+ 
-- 
1.7.9.5


