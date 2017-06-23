Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 563D477EA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 01:56:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20390870"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2017 09:56:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BB6B747CA8D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 09:56:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 23 Jun 2017 09:56:21 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Jun 2017 09:56:08 +0800
Message-ID: <1498182968-27962-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: BB6B747CA8D8.ADED6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] (morty) rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Fri, 23 Jun 2017 01:56:24 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug

When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
For example:
$ rpm -qpi bash-4.3.30-r0.src.rpm
warning: bash-4.3.30-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID 0a868e8e: NOKEY
Name        : bash
Version     : 4.3.30
Release     : r0
Architecture: i586
Install Date: (not installed)
Group       : ԯ
Size        : 8413797
License     : GPLv3+
Signature   : DSA/SHA1, Wed 21 Jun 2017 07:37:52 PM PDT, Key ID 609104e40a868e8e
Source RPM  : (none)
Build Date  : Wed 21 Jun 2017 07:37:52 PM PDT
Build Host  : ubuntu
Relocations : (not relocatable)
Packager    : Poky <poky@yoctoproject.org>
URL         : http://tiswww.case.edu/php/chet/bash/bashtop.html
Summary     : 8
Description :
8 

Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 48 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
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
+$ rpm -qpi bash-4.3.30-r0.src.rpm
+warning: bash-4.3.30-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID 0a868e8e: NOKEY
+Name        : bash
+Version     : 4.3.30
+Release     : r0
+Architecture: i586
+Install Date: (not installed)
+Group       : ԯ
+Size        : 8413797
+License     : GPLv3+
+Signature   : DSA/SHA1, Wed 21 Jun 2017 07:37:52 PM PDT, Key ID 609104e40a868e8e
+Source RPM  : (none)
+Build Date  : Wed 21 Jun 2017 07:37:52 PM PDT
+Build Host  : ubuntu
+Relocations : (not relocatable)
+Packager    : Poky <poky@yoctoproject.org>
+URL         : http://tiswww.case.edu/php/chet/bash/bashtop.html
+Summary     : 8
+Description :
+8 
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
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 497af8e..ae5e0c4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -120,6 +120,7 @@ SRC_URI += " \
 	   file://0001-system.h-query.c-support-nosignature.patch \
 	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
 	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
+	   file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
 "
 
 # OE specific changes
-- 
2.7.4




