Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6206FC3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 18:41:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s56IfUfW001620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 11:41:31 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 11:41:30 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 14:41:04 -0400
Message-ID: <1402080064-16450-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sysvinit: Add ability to add default line for ctrl-alt-del
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
X-List-Received-Date: Fri, 06 Jun 2014 18:41:35 -0000
Content-Type: text/plain

Currently the generated inittab doesn't have a line for the three
finger salute, and hence no action is taken on ctrl-alt-del, even
when a normal PC-style target is used with VTs enabled and a real
keyboard connected.

If someone enables USE_VT then lets assume they might actually
intend to use the VTs and connect a keyboard and want ctrl-alt-del
support.  In keeping with the SYSVINIT_ENABLED_GETTYS option, we
make it optional, since for some situations (kiosk etc.) it may
not be desired to be enabled.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/conf/documentation.conf                           | 1 +
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 7fa3f318b959..ba5505790a9e 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -396,6 +396,7 @@ SYSROOT_PREPROCESS_FUNCS[doc] = "A list of functions to execute after files are
 SYSTEMD_AUTO_ENABLE[doc] = "For recipes that inherit the systemd class, this variable specifies whether the service you have specified in SYSTEMD_SERVICE should be started automatically or not."
 SYSTEMD_PACKAGES[doc] = "For recipes that inherit the systemd class, this variable locates the systemd unit files when they are not found in the main recipe's package."
 SYSTEMD_SERVICE[doc] = "For recipes that inherit the systemd class, this variable specifies the systemd service name for a package."
+SYSVINIT_ENABLED_CTRLALTDEL[doc] = "Specifies if virtual terminals should trap on ctrl-alt-del and reboot, the default is '0'."
 SYSVINIT_ENABLED_GETTYS[doc] = "Specifies which virtual terminals should be running a getty, the default is '1'."
 
 #T
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index c3244b46021e..334f9f1ad4b0 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -38,6 +38,12 @@ do_install() {
 #
 
 EOF
+        if [ "${SYSVINIT_ENABLED_CTRLALTDEL}" = "1" ]; then
+            cat <<EOF >>${D}${sysconfdir}/inittab
+ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now
+
+EOF
+        fi
 
         for n in ${SYSVINIT_ENABLED_GETTYS}
         do
@@ -77,6 +83,7 @@ CONFFILES_${PN} = "${sysconfdir}/inittab"
 
 USE_VT ?= "1"
 SYSVINIT_ENABLED_GETTYS ?= "1"
+SYSVINIT_ENABLED_CTRLALTDEL ?= "0"
 
 
 
-- 
1.9.1


