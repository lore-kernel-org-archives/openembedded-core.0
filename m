Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEE07F2DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 03:38:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x863brYj016920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2019 20:38:03 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 20:37:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2019 11:37:39 +0800
Message-ID: <1567741059-137869-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567741059-137869-1-git-send-email-changqing.li@windriver.com>
References: <1567741059-137869-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mdadm: skip timeout testcase 11spare-migration
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
X-List-Received-Date: Fri, 06 Sep 2019 03:38:12 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

[YOCTO #13368]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-mdadm-skip-test-11spare-migration.patch   | 43 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
new file mode 100644
index 0000000..3a192cc
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-skip-test-11spare-migration.patch
@@ -0,0 +1,43 @@
+From 1b83afa7c3121f819e72ea74883f8b6d61d6548e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 6 Sep 2019 10:59:02 +0800
+Subject: [PATCH] mdadm: skip test 11spare-migration
+
+11spare-migration is a test series to check mdadm Monitor migrates spares
+according to rules in /etc/mdadm.conf defined by POLICY lines.
+
+[snip]
+for scan in no yes; do
+       for platform in 1.2 imsm; do
+               try
+       done
+done
+[snip]
+
+"try" includes near 20 sub testcase, so there are nearly 80 subcases need to run,
+so it will take long time than ptest-runner timeout limit, skip it as workaround.
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ test | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/test b/test
+index 711a3c7..880dd1d 100755
+--- a/test
++++ b/test
+@@ -272,6 +272,9 @@ main() {
+ 	else
+ 		for script in $testdir/$prefix $testdir/$prefix*[^~]
+ 		do
++			if [ $script == "$testdir/11spare-migration" ];then
++				continue
++			fi
+ 			do_test $script
+ 		done
+ 	fi
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 86c73ab..8b6e227 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -23,7 +23,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
 	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-support-usrmerge.patch \
+           file://0001-mdadm-skip-test-11spare-migration.patch \
            "
+
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
 
-- 
2.7.4


