Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93FA365CB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:57:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8N7vepY009207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:57:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 00:57:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 15:57:39 +0800
Message-ID: <1411459059-16110-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] ltp: make setregid02 be able to pass
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
X-List-Received-Date: Tue, 23 Sep 2014 07:57:48 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

[YOCTO #6748]

replace "nobody" group with "nogroup", since the user "nobody"
belongs to "nogroup" group and no "nobody" group in oe-core

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../ltp/ltp/make-setregid02-work.patch             |   61 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/make-setregid02-work.patch

diff --git a/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch b/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
new file mode 100644
index 0000000..4836010
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
@@ -0,0 +1,61 @@
+[PATCH] make setregid02 work
+
+Upstream-Status: Inappropriate [configuration]
+
+there is no "nobody" group in oe-core, the user "nobody" belongs to
+"nogroup" group, so replace nobody with nogroup to make the test pass
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ testcases/kernel/syscalls/setregid/setregid02.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/setregid/setregid02.c b/testcases/kernel/syscalls/setregid/setregid02.c
+index 8058627..866bee4 100644
+--- a/testcases/kernel/syscalls/setregid/setregid02.c
++++ b/testcases/kernel/syscalls/setregid/setregid02.c
+@@ -41,7 +41,7 @@ static gid_t neg_one = -1;
+ 
+ static struct passwd *ltpuser;
+ 
+-static struct group nobody, root, bin;
++static struct group nogroup, root, bin;
+ 
+ /*
+  * The following structure contains all test data.  Each structure in the array
+@@ -57,17 +57,17 @@ struct test_data_t {
+ 	char *test_msg;
+ } test_data[] = {
+ 	{
+-	&neg_one, &root.gr_gid, EPERM, &nobody, &nobody,
++	&neg_one, &root.gr_gid, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(-1, root),"}, {
+-	&neg_one, &bin.gr_gid, EPERM, &nobody, &nobody,
++	&neg_one, &bin.gr_gid, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(-1, bin)"}, {
+-	&root.gr_gid, &neg_one, EPERM, &nobody, &nobody,
++	&root.gr_gid, &neg_one, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(root,-1),"}, {
+-	&bin.gr_gid, &neg_one, EPERM, &nobody, &nobody,
++	&bin.gr_gid, &neg_one, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(bin, -1),"}, {
+-	&root.gr_gid, &bin.gr_gid, EPERM, &nobody, &nobody,
++	&root.gr_gid, &bin.gr_gid, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(root, bin)"}, {
+-	&bin.gr_gid, &root.gr_gid, EPERM, &nobody, &nobody,
++	&bin.gr_gid, &root.gr_gid, EPERM, &nogroup, &nogroup,
+ 		    "After setregid(bin, root),"}
+ };
+ 
+@@ -165,7 +165,7 @@ static void setup(void)
+ } while (0)
+ 
+ 	GET_GID(root);
+-	GET_GID(nobody);
++	GET_GID(nogroup);
+ 	GET_GID(bin);
+ 
+ 	TEST_PAUSE;
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 30761fd..a3f0ef7 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
     file://automake-foreign.patch \
+    file://make-setregid02-work.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


