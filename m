Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFBAF77037
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 09:59:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8T9x0Cw025349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 02:59:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 02:59:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 17:59:02 +0800
Message-ID: <f435d139003ffcac05e8079fad8fe42c1a473f9c.1443520698.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443520698.git.Qi.Chen@windriver.com>
References: <cover.1443520698.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: add runuser PAM config files to fix runuser error
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
X-List-Received-Date: Tue, 29 Sep 2015 09:59:02 -0000
Content-Type: text/plain

The runuser command fails with below error message, add proper PAM
config files to fix the problem. The config files are borrowed from
CentOS 7.0 release.

runuser: Failure setting user credentials

Signed-off-by: Shan Hai <shan.hai@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc            | 6 ++++++
 meta/recipes-core/util-linux/util-linux/runuser-l.pamd | 3 +++
 meta/recipes-core/util-linux/util-linux/runuser.pamd   | 4 ++++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb      | 2 ++
 4 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser-l.pamd
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser.pamd

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a4072bc..594108f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -163,6 +163,12 @@ do_install () {
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
 	rm -f ${D}${bindir}/chkdupexe
+
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
+		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
+	fi
 }
 
 # reset and nologin causes a conflict with ncurses-native and shadow-native
diff --git a/meta/recipes-core/util-linux/util-linux/runuser-l.pamd b/meta/recipes-core/util-linux/util-linux/runuser-l.pamd
new file mode 100644
index 0000000..4b368cc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/runuser-l.pamd
@@ -0,0 +1,3 @@
+auth	include		runuser
+session	optional	pam_keyinit.so force revoke
+session include		runuser
diff --git a/meta/recipes-core/util-linux/util-linux/runuser.pamd b/meta/recipes-core/util-linux/util-linux/runuser.pamd
new file mode 100644
index 0000000..48d133b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/runuser.pamd
@@ -0,0 +1,4 @@
+auth	sufficient	pam_rootok.so
+session	optional	pam_keyinit.so revoke
+session	required	pam_limits.so
+session	required	pam_unix.so
diff --git a/meta/recipes-core/util-linux/util-linux_2.26.2.bb b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
index fc7dc6e..e09fdfa 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
@@ -13,6 +13,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-parallel-build.patch \
+            file://runuser.pamd \
+            file://runuser-l.pamd \
             ${OLDHOST} \
 "
 SRC_URI[md5sum] = "9bdf368c395f1b70325d0eb22c7f48fb"
-- 
1.9.1


