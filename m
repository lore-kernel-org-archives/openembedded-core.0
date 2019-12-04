Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F0FAA7CDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:12 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389446"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:49 +0800
Message-Id: <4a2f7c959372c1c5e182f3ead539317add9cf347.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 08/10] glibc: fix CVE-2019-19126
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:11 -0000
Content-Transfer-Encoding: 8bit

Backport from 2.30 stable branch and drop NEWS section.

(From OE-Core rev: b4d4f70380c100d8ab06557237d8d5649a885e30)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/CVE-2019-19126.patch          | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-19126.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
new file mode 100644
index 0000000000..aead04c485
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
@@ -0,0 +1,32 @@
+From 37c90e117310728a4ad1eb998c0bbe7d79c4a398 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Marcin=20Ko=C5=9Bcielnicki?= <mwk@0x04.net>
+Date: Thu, 21 Nov 2019 00:20:15 +0100
+Subject: [PATCH] rtld: Check __libc_enable_secure before honoring
+ LD_PREFER_MAP_32BIT_EXEC (CVE-2019-19126) [BZ #25204]
+
+The problem was introduced in glibc 2.23, in commit
+b9eb92ab05204df772eb4929eccd018637c9f3e9
+("Add Prefer_MAP_32BIT_EXEC to map executable pages with MAP_32BIT").
+
+(cherry picked from commit d5dfad4326fc683c813df1e37bbf5cf920591c8e)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=37c90e117310728a4ad1eb998c0bbe7d79c4a398]
+CVE: CVE-2019-19126
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+index 975cbe2..df2cdfd 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
++++ b/sysdeps/unix/sysv/linux/x86_64/64/dl-librecon.h
+@@ -31,7 +31,8 @@
+    environment variable, LD_PREFER_MAP_32BIT_EXEC.  */
+ #define EXTRA_LD_ENVVARS \
+   case 21:								  \
+-    if (memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
++    if (!__libc_enable_secure						  \
++	&& memcmp (envline, "PREFER_MAP_32BIT_EXEC", 21) == 0)		  \
+       GLRO(dl_x86_cpu_features).feature[index_arch_Prefer_MAP_32BIT_EXEC] \
+ 	|= bit_arch_Prefer_MAP_32BIT_EXEC;				  \
+     break;
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
index 03add3363c..7913bc2812 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -41,6 +41,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0027-inject-file-assembly-directives.patch \
            file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://CVE-2019-19126.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.21.0


