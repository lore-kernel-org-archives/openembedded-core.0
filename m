Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZPZU-00054R-PG
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 18:19:17 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGH56VF016450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 18:05:07 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZPLm-0006LE-9O; Fri, 16 Nov 2012 18:05:06 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 18:05:05 +0100
Message-Id: <1353085505-24345-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] opkg: added alternatives-ln patch
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
X-List-Received-Date: Fri, 16 Nov 2012 17:19:17 -0000

Use 'ln -n' to avoid dereferencing links to host files.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../opkg/opkg/alternatives-ln.patch                | 56 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/alternatives-ln.patch

diff --git a/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch b/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch
new file mode 100644
index 0000000..f257eb0
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/alternatives-ln.patch
@@ -0,0 +1,56 @@
+update-alternatives: use 'ln -n'
+
+Using the '-n' option (--no-dereference) is a better way to solve the
+do-not-link-into-directory issue.  Using only 'ln -sf' can cause problems
+on SELinux enabled hosts when target is inaccessible; e.g. when preparing
+an offline rootsystem:
+
+ | $ cd <offline root>
+ | $ ln -sf /lib/systemd/systemd sbin/init     # alternative #1
+ | $ ln -sf /bin/busybox sbin/init             # alternative #2
+ | ln: accessing `sbin/init': Permission denied
+ | 
+ |  --> strace:
+ | brk(0)                                  = 0x102b000
+ | stat("sbin/init", 0x7fffaa91c900)       = -1 EACCES (Permission denied)
+ | ...
+ | exit_group(1)                           = ?
+
+Now with '-n':
+
+ | $ ln -snf /bin/busybox sbin/init
+ | lstat("sbin/init", {st_mode=S_IFLNK|0777, st_size=20, ...}) = 0
+ | lstat("sbin/init", {st_mode=S_IFLNK|0777, st_size=20, ...}) = 0
+ | stat("/bin/busybox", 0x7fff8c1a3bd0)    = -1 ENOENT (No such file or directory)
+ | symlink("/bin/busybox", "sbin/init")    = -1 EEXIST (File exists)
+ | unlink("sbin/init")                     = 0
+ | symlink("/bin/busybox", "sbin/init")    = 0
+
+
+The '-n' flag is well supported (coreutils have it at least since
+1999, busybox at least since 0.60.3 (2002)) and it obsoletes the
+explicit check whether target is a directory.
+
+Upstream-Status: pending [http://code.google.com/p/opkg/issues/detail?id=95]
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+
+Index: trunk/utils/update-alternatives.in
+===================================================================
+--- trunk.orig/utils/update-alternatives.in
++++ trunk/utils/update-alternatives.in
+@@ -113,14 +113,7 @@ find_best_alt() {
+ 		if [ ! -d $link_dir ]; then
+ 			mkdir -p $link_dir
+ 		fi
+-		if [ -h $link -a -d $link ]; then
+-			# If $link exists and the target is a directory,
+-			# 'ln -sf $path $link' doesn't replace the link to
+-			# that directory, it creates new link inside.
+-			echo "update-alternatives: Removing $link".
+-			rm -f $link
+-		fi
+-		ln -sf $path $link
++		ln -snf $path $link
+ 		echo "update-alternatives: Linking $link to $path"
+ 	else
+ 		echo "update-alternatives: Error: not linking $link to $path since $link exists and is not a link"
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index e1049a7..064cf43 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -12,6 +12,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0009-pkg_depends-fix-version-constraints.patch \
   file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
   file://opkg-no-sync-offline.patch \
+  file://alternatives-ln.patch \
   file://don-t-add-recommends-pkgs-to-depended-upon-by.patch \
   file://don-t-print-provides-if-nothing-is-provided.patch \
 "
@@ -21,4 +22,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
-- 
1.7.11.7



