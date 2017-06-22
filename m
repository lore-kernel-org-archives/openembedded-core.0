Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC0D71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:05:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20338957"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jun 2017 09:05:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 069F547C7C84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 09:05:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 22 Jun 2017 09:05:19 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 09:05:14 +0800
Message-ID: <1498093514-5501-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 069F547C7C84.ABEB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] (jethro) rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Thu, 22 Jun 2017 01:05:25 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug

When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
For example:
$ rpm -qpi zlib-1.2.8-r0.src.rpm
warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
Name        : zlib
Version     : 1.2.8
Release     : r0
Architecture: i586
Install Date: (not installed)
Group       : ﺩ
Size        : 633007
License     : Zlib
Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
Source RPM  : (none)
Build Date  : 2017年04月22日 00時38分03秒
Build Host  : force
Relocations : (not relocatable)
Packager    : Poky <poky@yoctoproject.org>
URL         : http://zlib.net/
Summary     : ¨¯
Description :
ﺩ

Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 48 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
new file mode 100644
index 0000000..b962617
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
@@ -0,0 +1,48 @@
+Subject: [PATCH] Fix the Bug of SRPM String error
+
+Upstream-Status: Pending
+$ rpm -qpi zlib-1.2.8-r0.src.rpm
+warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
+Name        : zlib
+Version     : 1.2.8
+Release     : r0
+Architecture: i586
+Install Date: (not installed)
+Group       : ﺩ
+Size        : 633007
+License     : Zlib
+Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
+Source RPM  : (none)
+Build Date  : 2017年04月22日 00時38分03秒
+Build Host  : force
+Relocations : (not relocatable)
+Packager    : Poky <poky@yoctoproject.org>
+URL         : http://zlib.net/
+Summary     : ¨¯
+Description :
+ﺩ
+
+Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
+---
+ rpmdb/tagname.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c
+index cfd1459..dbcafd1 100644
+--- a/rpmdb/tagname.c
++++ b/rpmdb/tagname.c
+@@ -518,9 +518,9 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, size_t dbiNTags)
+ void tagTypeValidate(HE_t he);
+ void tagTypeValidate(HE_t he)
+ {
+-    /* XXX Re-map RPM_I18NSTRING_TYPE -> RPM_STRING_TYPE */
++    /* XXX RPM_I18NSTRING_TYPE is treated as strings. */
+     if (he->t == RPM_I18NSTRING_TYPE)
+-	he->t = RPM_STRING_TYPE;
++	return;
+ 
+     /* XXX Arbitrary tags are always strings. */
+     if ((he->tag & 0x40000000)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 73b3734..f8bdfe9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -100,6 +100,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-macros.in-disable-external-key-server.patch \
 	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
 	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
+	   file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
2.7.4




