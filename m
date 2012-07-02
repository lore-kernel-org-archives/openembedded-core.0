Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SlmGw-0000Bc-AN
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 21:26:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62JFtnv009518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 12:15:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 12:15:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 14:25:28 -0500
Message-ID: <ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341257063.git.mark.hatle@windriver.com>
References: <cover.1341257063.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] oprofile: Change /root to /home/root
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 19:26:58 -0000
Content-Type: text/plain

OE uses /home/root instead of /root for the root user's directory.  Update
oprofile to match.

Upstream-status: Inappropriate [OE Specific]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/oprofile-root.patch          |  108 ++++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 73a5a07..ac8ce10 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,10 +19,11 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
+           file://oprofile-root.patch \
            file://acinclude.m4"
 
 inherit autotools
diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
new file mode 100644
index 0000000..db63a8e
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
@@ -0,0 +1,108 @@
+Change hardcoded /root to /home/root
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofile-0.9.7/doc/opcontrol.1.in
+--- oprofile-0.9.7.orig/doc/opcontrol.1.in	2011-07-04 21:25:04.000000000 -0500
++++ oprofile-0.9.7/doc/opcontrol.1.in	2012-07-02 14:02:16.358865420 -0500
+@@ -171,7 +171,7 @@
+ 
+ .SH FILES
+ .TP
+-.I /root/.oprofile/daemonrc
++.I /home/root/.oprofile/daemonrc
+ Configuration file for opcontrol
+ .TP
+ .I /var/lib/oprofile/samples/
+diff -ur oprofile-0.9.7.orig/doc/oprofile.1 oprofile-0.9.7/doc/oprofile.1
+--- oprofile-0.9.7.orig/doc/oprofile.1	2011-08-12 10:23:27.000000000 -0500
++++ oprofile-0.9.7/doc/oprofile.1	2012-07-02 14:02:29.295862358 -0500
+@@ -150,7 +150,7 @@
+ .I $HOME/.oprofile/
+ Configuration files
+ .TP
+-.I /root/.oprofile/daemonrc
++.I /home/root/.oprofile/daemonrc
+ Configuration file for opcontrol
+ .TP
+ .I /opt/oprofile-0.9.7-rc3/share/oprofile/
+diff -ur oprofile-0.9.7.orig/doc/oprofile.1.in oprofile-0.9.7/doc/oprofile.1.in
+--- oprofile-0.9.7.orig/doc/oprofile.1.in	2011-07-04 21:25:04.000000000 -0500
++++ oprofile-0.9.7/doc/oprofile.1.in	2012-07-02 14:01:35.812004623 -0500
+@@ -150,7 +150,7 @@
+ .I $HOME/.oprofile/
+ Configuration files
+ .TP
+-.I /root/.oprofile/daemonrc
++.I /home/root/.oprofile/daemonrc
+ Configuration file for opcontrol
+ .TP
+ .I @prefix@/share/oprofile/
+diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile-0.9.7/doc/oprofile.html
+--- oprofile-0.9.7.orig/doc/oprofile.html	2011-07-04 21:32:35.000000000 -0500
++++ oprofile-0.9.7/doc/oprofile.html	2012-07-02 14:04:59.804018961 -0500
+@@ -1394,7 +1394,7 @@
+               <dd>
+                 <p>
+ 		    Followed by list arguments for profiling set up. List of arguments
+-		    saved in <code class="filename">/root/.oprofile/daemonrc</code>.
++		    saved in <code class="filename">/home/root/.oprofile/daemonrc</code>.
+ 		    Giving this option is not necessary; you can just directly pass one
+ 		    of the setup options, e.g. <span class="command"><strong>opcontrol --no-vmlinux</strong></span>.
+ 		  </p>
+@@ -1430,7 +1430,7 @@
+               <dd>
+                 <p>
+ 		    Start data collection with either arguments provided by <code class="option">--setup</code>
+-		or information saved in <code class="filename">/root/.oprofile/daemonrc</code>. Specifying
++		or information saved in <code class="filename">/home/root/.oprofile/daemonrc</code>. Specifying
+ 		the addition <code class="option">--verbose</code> makes the daemon generate lots of debug data
+ 		whilst it is running.
+ 		</p>
+diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-0.9.7/doc/oprofile.xml
+--- oprofile-0.9.7.orig/doc/oprofile.xml	2011-07-04 21:25:04.000000000 -0500
++++ oprofile-0.9.7/doc/oprofile.xml	2012-07-02 14:02:03.543019283 -0500
+@@ -568,7 +568,7 @@
+ 		<term><option>--setup</option></term>
+ 		<listitem><para>
+ 		    Followed by list arguments for profiling set up. List of arguments
+-		    saved in <filename>/root/.oprofile/daemonrc</filename>.
++		    saved in <filename>/home/root/.oprofile/daemonrc</filename>.
+ 		    Giving this option is not necessary; you can just directly pass one
+ 		    of the setup options, e.g. <command>opcontrol --no-vmlinux</command>.
+ 		  </para></listitem>
+@@ -592,7 +592,7 @@
+ 		<term><option>--start</option></term>
+ 		<listitem><para>
+ 		    Start data collection with either arguments provided by <option>--setup</option>
+-		or information saved in <filename>/root/.oprofile/daemonrc</filename>. Specifying
++		or information saved in <filename>/home/root/.oprofile/daemonrc</filename>. Specifying
+ 		the addition <option>--verbose</option> makes the daemon generate lots of debug data
+ 		whilst it is running.
+ 		</para></listitem>
+diff -ur oprofile-0.9.7.orig/gui/oprof_start_util.cpp oprofile-0.9.7/gui/oprof_start_util.cpp
+--- oprofile-0.9.7.orig/gui/oprof_start_util.cpp	2011-07-04 21:25:04.000000000 -0500
++++ oprofile-0.9.7/gui/oprof_start_util.cpp	2012-07-02 13:55:21.041876096 -0500
+@@ -39,7 +39,7 @@
+ // return the ~ expansion suffixed with a '/'
+ string const get_config_dir()
+ {
+-	return "/root";
++	return "/home/root";
+ }
+ 
+ string daemon_pid;
+diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile-0.9.7/utils/opcontrol
+--- oprofile-0.9.7.orig/utils/opcontrol	2011-07-20 14:36:48.000000000 -0500
++++ oprofile-0.9.7/utils/opcontrol	2012-07-02 13:55:06.232872688 -0500
+@@ -384,7 +384,7 @@
+ 	OPROFILED="$OPDIR/oprofiled"
+ 
+ 	# location for daemon setup information
+-	SETUP_DIR="/root/.oprofile"
++	SETUP_DIR="/home/root/.oprofile"
+ 	SETUP_FILE="$SETUP_DIR/daemonrc"
+ 	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
+ 
-- 
1.7.3.4



