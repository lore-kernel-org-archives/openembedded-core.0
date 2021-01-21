Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: b6taH0QE5Wf2AGos3xV00RsUtRbher3m4+vF2SkezPUq8clqyhenR/e28VReJwGNJbcx90EtT0
 kju+f+S4nNgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392523"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392523"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:43 -0800
IronPort-SDR: d1HLxcf1dJlDYgEZkMrVzGbGmESS6bomWqig2LV3I8R0cH9Oe88MJ5Pjw4joZPIeQtbanWOyPj
 H14g+m3u+jhw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413946"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/20] flex: Fix --noline option behavior
Date: Fri, 22 Jan 2021 00:22:05 +0800
Message-Id: <e02c02459b35129402b2a77b592896c787e590ff.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Option --noline or -L does not handled properly.
So generated code contains #line directives with
file absolute path and prevents to create
reproducible builds.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0bf2cb7dc2123f220accf1542c2ae4c4b4b8275a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...directives-if-gen_line_dirs-is-false.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
new file mode 100644
index 0000000000..c8202b6bd5
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
@@ -0,0 +1,32 @@
+From 440f3f55739468cd26e22f31871eca8cbbd53294 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 6 Jan 2021 06:12:14 -0800
+Subject: [PATCH] Emit no #line directives if gen_line_dirs is false
+
+If we set --noline we should not print line directives.
+But setting --noline means gen_line_dirs is false.
+
+Upstream-Status: Submitted
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ src/buf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/buf.c b/src/buf.c
+index 185083c..4439e28 100644
+--- a/src/buf.c
++++ b/src/buf.c
+@@ -95,8 +95,8 @@ struct Buf *buf_linedir (struct Buf *buf, const char* filename, int lineno)
+     const char *src;
+     size_t tsz;
+ 
+-    if (gen_line_dirs)
+-	return buf;
++    if (!gen_line_dirs)
++        return buf;
+ 
+     tsz = strlen("#line \"\"\n")                +   /* constant parts */
+                2 * strlen (filename)            +   /* filename with possibly all backslashes escaped */
+-- 
+2.26.2.Cisco
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 3d57572865..1d43d2228a 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            file://check-funcs.patch \
+           file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.29.2

