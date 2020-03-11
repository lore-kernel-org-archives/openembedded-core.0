Return-Path: <chee.yang.lee@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7F78360B69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 06:47:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2020 23:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,539,1574150400"; d="scan'208";a="236330217"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 10 Mar 2020 23:47:39 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 14:47:36 +0800
Message-Id: <1583909256-28697-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583909256-28697-1-git-send-email-chee.yang.lee@intel.com>
References: <1583909256-28697-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH][zeus 2/2] libpcre2: fix CVE-2019-20454
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
X-List-Received-Date: Wed, 11 Mar 2020 06:47:39 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libpcre/libpcre2/CVE-2019-20454.patch             | 19 +++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.33.bb        |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch
new file mode 100644
index 0000000..51f95a7
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Backport [https://vcs.pcre.org/pcre2/code/trunk/src/pcre2_jit_compile.c?r1=1092&r2=1091&pathrev=1092]
+CVE: CVE-2020-8002
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+--- pcre2-10.30/src/pcre2_jit_compile.c	2019/05/13 16:26:17	1091
++++ pcre2-10.30/src/pcre2_jit_compile.c	2019/05/13 16:38:18	1092
+@@ -8571,7 +8571,10 @@
+ PCRE2_SPTR bptr;
+ uint32_t c;
+ 
+-GETCHARINC(c, cc);
++/* Patch by PH */
++/* GETCHARINC(c, cc); */
++
++c = *cc++;
+ #if PCRE2_CODE_UNIT_WIDTH == 32
+ if (c >= 0x110000)
+   return NULL;
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.33.bb b/meta/recipes-support/libpcre/libpcre2_10.33.bb
index 50b2675..1020df9 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.33.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
+           file://CVE-2019-20454.patch \
 "
 
 SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
-- 
2.7.4


