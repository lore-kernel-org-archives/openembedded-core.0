Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlGLd-0001Uj-PV
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 10:54:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ9dG0t000712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 01:39:16 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 19 Dec 2012 01:39:11 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:39:39 +0800
Message-ID: <1d85ab32f49b6d3eaab89eb78afe131415b00794.1355902677.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355902677.git.kai.kang@windriver.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/4] oprofile: use dynamic root home directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 09:54:29 -0000
Content-Type: text/plain

Use stub "ROOTHOME" to replace "/home/root" in oprofile-root.patch, then
we can substitute it with configured root home directory.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/oprofile-root.patch          |   23 ++++++++++++-------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index b3ce852..0977065 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -31,6 +31,7 @@ inherit autotools
 
 EXTRA_OECONF = "--with-kernel-support --without-x"
 do_configure () {
+        find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
 }
diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
index db63a8e..f3fe4c9 100644
--- a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
@@ -4,6 +4,11 @@ Upstream-Status: inappropriate [OE specific]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
+Replace "/home/root" with stub "ROOTHOME", then substitute it with
+real root home directory which is configured dymanically.
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
 diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofile-0.9.7/doc/opcontrol.1.in
 --- oprofile-0.9.7.orig/doc/opcontrol.1.in	2011-07-04 21:25:04.000000000 -0500
 +++ oprofile-0.9.7/doc/opcontrol.1.in	2012-07-02 14:02:16.358865420 -0500
@@ -12,7 +17,7 @@ diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofile-0.9.7/doc/opcontrol.1.i
  .SH FILES
  .TP
 -.I /root/.oprofile/daemonrc
-+.I /home/root/.oprofile/daemonrc
++.I ROOTHOME/.oprofile/daemonrc
  Configuration file for opcontrol
  .TP
  .I /var/lib/oprofile/samples/
@@ -24,7 +29,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1 oprofile-0.9.7/doc/oprofile.1
  Configuration files
  .TP
 -.I /root/.oprofile/daemonrc
-+.I /home/root/.oprofile/daemonrc
++.I ROOTHOME/.oprofile/daemonrc
  Configuration file for opcontrol
  .TP
  .I /opt/oprofile-0.9.7-rc3/share/oprofile/
@@ -36,7 +41,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1.in oprofile-0.9.7/doc/oprofile.1.in
  Configuration files
  .TP
 -.I /root/.oprofile/daemonrc
-+.I /home/root/.oprofile/daemonrc
++.I ROOTHOME/.oprofile/daemonrc
  Configuration file for opcontrol
  .TP
  .I @prefix@/share/oprofile/
@@ -48,7 +53,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile-0.9.7/doc/oprofile.html
                  <p>
  		    Followed by list arguments for profiling set up. List of arguments
 -		    saved in <code class="filename">/root/.oprofile/daemonrc</code>.
-+		    saved in <code class="filename">/home/root/.oprofile/daemonrc</code>.
++		    saved in <code class="filename">ROOTHOME/.oprofile/daemonrc</code>.
  		    Giving this option is not necessary; you can just directly pass one
  		    of the setup options, e.g. <span class="command"><strong>opcontrol --no-vmlinux</strong></span>.
  		  </p>
@@ -57,7 +62,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile-0.9.7/doc/oprofile.html
                  <p>
  		    Start data collection with either arguments provided by <code class="option">--setup</code>
 -		or information saved in <code class="filename">/root/.oprofile/daemonrc</code>. Specifying
-+		or information saved in <code class="filename">/home/root/.oprofile/daemonrc</code>. Specifying
++		or information saved in <code class="filename">ROOTHOME/.oprofile/daemonrc</code>. Specifying
  		the addition <code class="option">--verbose</code> makes the daemon generate lots of debug data
  		whilst it is running.
  		</p>
@@ -69,7 +74,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-0.9.7/doc/oprofile.xml
  		<listitem><para>
  		    Followed by list arguments for profiling set up. List of arguments
 -		    saved in <filename>/root/.oprofile/daemonrc</filename>.
-+		    saved in <filename>/home/root/.oprofile/daemonrc</filename>.
++		    saved in <filename>ROOTHOME/.oprofile/daemonrc</filename>.
  		    Giving this option is not necessary; you can just directly pass one
  		    of the setup options, e.g. <command>opcontrol --no-vmlinux</command>.
  		  </para></listitem>
@@ -78,7 +83,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-0.9.7/doc/oprofile.xml
  		<listitem><para>
  		    Start data collection with either arguments provided by <option>--setup</option>
 -		or information saved in <filename>/root/.oprofile/daemonrc</filename>. Specifying
-+		or information saved in <filename>/home/root/.oprofile/daemonrc</filename>. Specifying
++		or information saved in <filename>ROOTHOME/.oprofile/daemonrc</filename>. Specifying
  		the addition <option>--verbose</option> makes the daemon generate lots of debug data
  		whilst it is running.
  		</para></listitem>
@@ -90,7 +95,7 @@ diff -ur oprofile-0.9.7.orig/gui/oprof_start_util.cpp oprofile-0.9.7/gui/oprof_s
  string const get_config_dir()
  {
 -	return "/root";
-+	return "/home/root";
++	return "ROOTHOME";
  }
  
  string daemon_pid;
@@ -102,7 +107,7 @@ diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile-0.9.7/utils/opcontrol
  
  	# location for daemon setup information
 -	SETUP_DIR="/root/.oprofile"
-+	SETUP_DIR="/home/root/.oprofile"
++	SETUP_DIR="ROOTHOME/.oprofile"
  	SETUP_FILE="$SETUP_DIR/daemonrc"
  	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
  
-- 
1.7.5.4



