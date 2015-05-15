Return-Path: <Shan.Hai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82E187402F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 05:29:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4F5TlgJ006212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 22:29:47 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 14 May 2015 22:29:47 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 May 2015 13:29:43 +0800
Message-ID: <1431667783-27190-2-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
References: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: add runuser PAM config files
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
X-List-Received-Date: Fri, 15 May 2015 05:29:46 -0000
Content-Type: text/plain

The runuser command fails with below error message, add proper PAM
config files to fix the problem. The config files are borrowed from
CentOS 7.0 release.

runuser: Failure setting user credentials

Signed-off-by: Shan Hai <shan.hai@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc            | 6 ++++++
 meta/recipes-core/util-linux/util-linux/runuser-l.pamd | 4 ++++
 meta/recipes-core/util-linux/util-linux/runuser.pamd   | 5 +++++
 meta/recipes-core/util-linux/util-linux_2.26.1.bb      | 2 ++
 4 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser-l.pamd
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser.pamd

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 60309a5..0098fc4 100644
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
index 0000000..fa1e4d8
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/runuser-l.pamd
@@ -0,0 +1,4 @@
+#%PAM-1.0
+auth		include		runuser
+session		optional	pam_keyinit.so force revoke
+session		include		runuser
diff --git a/meta/recipes-core/util-linux/util-linux/runuser.pamd b/meta/recipes-core/util-linux/util-linux/runuser.pamd
new file mode 100644
index 0000000..37f0e84
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/runuser.pamd
@@ -0,0 +1,5 @@
+#%PAM-1.0
+auth		sufficient	pam_rootok.so
+session		optional	pam_keyinit.so revoke
+session		required	pam_limits.so
+session		required	pam_unix.so
diff --git a/meta/recipes-core/util-linux/util-linux_2.26.1.bb b/meta/recipes-core/util-linux/util-linux_2.26.1.bb
index 58bc90d..2938e0b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.1.bb
@@ -14,6 +14,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://configure-sbindir.patch \
             file://fix-parallel-build.patch \
             ${OLDHOST} \
+            file://runuser.pamd \
+            file://runuser-l.pamd \
 "
 SRC_URI[md5sum] = "2308850946766677f3fabe0685e85de8"
 SRC_URI[sha256sum] = "22dc1c957262e2cbdfb4d524a63d5cd4f219d3ac9b5eab570fc771076799bb6e"
-- 
1.8.5.2.233.g932f7e4


