Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RsOeM-0001hv-IA
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 02:06:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2012 16:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118835791"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.149])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2012 16:58:17 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 16:58:14 -0800
Message-Id: <e2b46859bfa16f03f06e0368857740a549a1c33c.1328057677.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
In-Reply-To: <cover.1328057677.git.josh@linux.intel.com>
References: <cover.1328057677.git.josh@linux.intel.com>
Subject: [PATCH 2/3] sysklogd: various fixes so it starts/stops cleanly
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
X-List-Received-Date: Wed, 01 Feb 2012 01:06:14 -0000

This patch fixes several issues with the sysklogd recipe:
o Errors at start due to non-existent /var/log/news/ - every other log
  file is created in /var/log, not a sub-directory. Do the same for news
  logs.
o klogd would not be stopped due to pidfile recycling, give klogd its own
  pidfile
o preinstalls failed at rootfs creation time by trying to access the host
  root filesystem rather than a path relative to $D. Update the preinst to
  test for $D and do the right thing.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-extended/sysklogd/files/sysklogd    |    2 +-
 meta/recipes-extended/sysklogd/files/syslog.conf |    6 +++---
 meta/recipes-extended/sysklogd/sysklogd.inc      |   14 ++++++++++----
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb   |    2 +-
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index e0fa7a8..dcbc81e 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -15,7 +15,7 @@
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 
 pidfile_syslogd=/var/run/syslogd.pid
-pidfile_klogd=/var/run/syslogd.pid
+pidfile_klogd=/var/run/klogd.pid
 binpath_syslogd=/sbin/syslogd
 binpath_klogd=/sbin/klogd
 
diff --git a/meta/recipes-extended/sysklogd/files/syslog.conf b/meta/recipes-extended/sysklogd/files/syslog.conf
index 795d735..7d1858c 100644
--- a/meta/recipes-extended/sysklogd/files/syslog.conf
+++ b/meta/recipes-extended/sysklogd/files/syslog.conf
@@ -26,9 +26,9 @@ mail.err			/var/log/mail.err
 
 # Logging for INN news system
 #
-news.crit			/var/log/news/news.crit
-news.err			/var/log/news/news.err
-news.notice			-/var/log/news/news.notice
+news.crit			/var/log/news.crit
+news.err			/var/log/news.err
+news.notice			-/var/log/news.notice
 
 #
 # Some `catch-all' logfiles.
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 0b84dac..d4eea41 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -46,12 +46,18 @@ do_install () {
 pkg_preinst_${PN} () {
 	# all this is needed to avoid sysmlink errors,
 	# because update-rc.d runs before pkg_postinst
-	if [ -e ${sysconfdir}/init.d/syslog -a ! -L ${sysconfdir}/init.d/syslog ]; then
+	if test "x$D" != "x"; then
+		ETC=$D/${sysconfdir}
+	else
+		ETC=${sysconfdir}
+	fi
+
+	if [ -e $ETC/init.d/syslog -a ! -L $ETC/init.d/syslog ]; then
 		echo "WARNING:" "non symlink ${sysconfdir}/init.d/syslog exist -> backup to ${sysconfdir}/init.d/syslog.old"
-		mv ${sysconfdir}/init.d/syslog ${sysconfdir}/init.d/syslog.old
+		mv $ETC/init.d/syslog $ETC/init.d/syslog.old
 	fi
-	if [ ! -e ${sysconfdir}/init.d/syslog ]; then
-		ln -s dummy ${sysconfdir}/init.d/syslog
+	if [ ! -e $ETC/init.d/syslog ]; then
+		ln -s dummy $ETC/init.d/syslog
 	fi
 }
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
index 187c9f4..b58094e 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "e053094e8103165f98ddafe828f6ae4b"
 SRC_URI[sha256sum] = "6169b8e91d29288e90404f01462b69e7f2afb1161aa419826fe4736c7f9eb773"
-- 
1.7.7.6



