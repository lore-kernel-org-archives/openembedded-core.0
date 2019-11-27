Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4474C7F9BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 00:53:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 16:53:33 -0800
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="199009553"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.19.240])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 16:53:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 08:53:25 +0800
Message-Id: <20191127005325.30813-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127005325.30813-1-anuj.mittal@intel.com>
References: <20191127005325.30813-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nasm: fix CVE-2019-14248
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
X-List-Received-Date: Wed, 27 Nov 2019 00:53:32 -0000
Content-Transfer-Encoding: 8bit

See:
https://bugzilla.nasm.us/show_bug.cgi?id=3392576

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../nasm/nasm/CVE-2019-14248.patch            | 43 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
new file mode 100644
index 0000000000..d45d2cb465
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
@@ -0,0 +1,43 @@
+From 93d41d82963b2cfd0b24c906f5a8daf53281b559 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 16 Aug 2019 01:12:54 -0700
+Subject: [PATCH] BR 3392576: don't segfault on a bad %pragma limit
+
+Don't segfault on a bad %pragma limit. Instead treat a NULL pointer as
+an empty string.
+
+Reported-by: Ren Kimura <rkx1209dev@gmail.com>
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+CVE: CVE-2019-14248
+Upstream-Status: Backport [https://repo.or.cz/nasm.git/commit/93d41d82963b2cfd0b24c906f5a8daf53281b559]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ asm/nasm.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index c84d675..65116ab 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -212,6 +212,11 @@ nasm_set_limit(const char *limit, const char *valstr)
+     bool rn_error;
+     int errlevel;
+ 
++    if (!limit)
++        limit = "";
++    if (!valstr)
++        valstr = "";
++
+     for (i = 0; i <= LIMIT_MAX; i++) {
+         if (!nasm_stricmp(limit, limit_info[i].name))
+             break;
+@@ -204,7 +209,7 @@ nasm_set_limit(const char *limit, const char *valstr)
+             errlevel = ERR_WARNING|ERR_NOFILE|ERR_USAGE;
+         else
+             errlevel = ERR_WARNING|ERR_PASS1|WARN_UNKNOWN_PRAGMA;
+-        nasm_error(errlevel, "unknown limit: `%s'", limit);
++        nasm_error(errlevel, "invalid limit value: `%s'", valstr);
+         return DIRR_ERROR;
+     }
+ 
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index e4f964ce93..bd4ecea8b6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2018-19755.patch \
+           file://CVE-2019-14248.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.21.0


