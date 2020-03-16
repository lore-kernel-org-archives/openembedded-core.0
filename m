Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id BD67B60C72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 16:31:28 +0000 (UTC)
IronPort-SDR: QB8JgQ/s9BepsFzBVQDMtY+YE3lBTWfxeE0q+c1kRdqIZ2kNwlPgxpfUS4Q/1t20h4b5ngZBfx
	dteG1dj87AZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Mar 2020 09:31:30 -0700
IronPort-SDR: uobwv8kCiRhhvfXk7LoU7OvezuPvNcY0WSd/UsmfcynJgd2KAs527p0oF6JrqbaQ2bQGmbUoq4
	Td7deDO/19ZA==
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="390745612"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.148.157])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:31:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:31:00 +0800
Message-Id: <8ec7a51da26f07fd43b5e6787b15c8636009b183.1584375668.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584375668.git.anuj.mittal@intel.com>
References: <cover.1584375668.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH][zeus 2/7] libpcre2: fix CVE-2019-20454
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
X-List-Received-Date: Mon, 16 Mar 2020 16:31:29 -0000
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libpcre/libpcre2/CVE-2019-20454.patch     | 19 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.33.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2019-20454.patch
new file mode 100644
index 0000000000..51f95a7097
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
index 50b26753b4..1020df99b8 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.33.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
+           file://CVE-2019-20454.patch \
 "
 
 SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
-- 
2.24.1


