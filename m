Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39E98773CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 21:58:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 05 Sep 2016 14:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,288,1470726000"; d="scan'208";a="1045985451"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.144])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2016 14:58:46 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 16:59:12 -0500
Message-Id: <1473112752-24962-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] systemd_230.bb: Set journal RuntimeMaxSize to 64M as default
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
X-List-Received-Date: Mon, 05 Sep 2016 21:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At this time systemd journald uses the /run tmpfs to store logs
by default systemd uses 15% of available space [1] of the /run
partition, when the space runs out journald starts to vaccum/store
the logs into /var/log [1].

It causes two problems one of them is timeout dev-ttySN.device's
when enable debug and use journal as systemd.log_target [2] the other
is related to don't find syslog entries into the journal log [3].

This problems are now more evident because i recently enabled the
systemd debug option in testimage [4].

One area of improvement will be add support in systemd journald to
read these parameters from the kernel cmdline like systemd.log_target,
if the support exists we could add that parameter at level of testimage.

[1] https://www.freedesktop.org/software/systemd/man/journald.conf.html#SystemMaxUse=
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8142#c19
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10128#c4
[4] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=a86a1b2703372c12e7fca18918695d093ea6ee53

[YOCTO #10128]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 43bc943..5851c65 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -232,6 +232,9 @@ do_install() {
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	# Set the maximium size of runtime journal to 64M as default
+	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
+
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
-- 
2.1.4


