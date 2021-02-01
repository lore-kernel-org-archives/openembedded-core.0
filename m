Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29180.1612152191078061277
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 20:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: M47p7hnpNqK9tfXDahesyvxGcT45aWrl8CeykjI2P7L6vrC5EXWDiJuEmSSe+lu6pEWnCZtIUn
 H5C6i2mSm6Dw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178065185"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="178065185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 20:03:11 -0800
IronPort-SDR: fpT9yS5BwQhXhNpbvoFBRbLN6AWxYsrXMrElHCbbKdm24taev3DGvZDq/9rwqAWWY/D1uwTAVS
 D+u4w0uipDIA==
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="432141241"
Received: from hhan1-mobl.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.124])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 20:03:10 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 3/3] gdk-pixbuf: fix CVE-2020-29385
Date: Mon,  1 Feb 2021 12:02:54 +0800
Message-Id: <20210201040254.80979-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201040254.80979-1-anuj.mittal@intel.com>
References: <20210201040254.80979-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Backport patch from
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81

image file in upstream patch is for test purpose only, it cause error during
do_patch so drop it:
File tests/test-images/fail/hang_114.gif: git binary diffs are not supported.

(From OE-Core rev: 7cd401b7c60dba91f6fb10395ab4a10a267cf23d)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee867453ff2116620c07f0bb3bea725d7aa60731)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
new file mode 100644
index 0000000000..3fef2bc1eb
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
@@ -0,0 +1,55 @@
+From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
+From: Robert Ancell <robert.ancell@canonical.com>
+Date: Mon, 30 Nov 2020 12:26:12 +1300
+Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
+
+The code value after a reset wasn't being validated, which means we would
+accept invalid codes. This could cause an infinite loop in the decoder.
+
+Fixes CVE-2020-29385
+
+Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81]
+CVE: CVE-2020-29385
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ gdk-pixbuf/lzw.c                    |  13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+ create mode 100644 tests/test-images/fail/hang_114.gif
+
+diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
+index 9e052a6f7..105daf2b1 100644
+--- a/gdk-pixbuf/lzw.c
++++ b/gdk-pixbuf/lzw.c
+@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
+                                 if (self->last_code != self->clear_code && self->code_table_size < MAX_CODES) {
+                                         if (self->code < self->code_table_size)
+                                                 add_code (self, self->code);
+-                                        else if (self->code == self->code_table_size)
++                                        else
+                                                 add_code (self, self->last_code);
+-                                        else {
+-                                                /* Invalid code received - just stop here */
+-                                                self->last_code = self->eoi_code;
+-                                                return output_length;
+-                                        }
+ 
+                                         /* When table is full increase code size */
+                                         if (self->code_table_size == (1 << self->code_size) && self->code_size < LZW_CODE_MAX)
+                                                 self->code_size++;
+                                 }
+ 
++                                /* Invalid code received - just stop here */
++                                if (self->code >= self->code_table_size) {
++                                        self->last_code = self->eoi_code;
++                                        return output_length;
++                                }
++
+                                 /* Convert codeword into indexes */
+                                 n_written += write_indexes (self, output + n_written, output_length - n_written);
+                         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 3dec5ed052..16708fd581 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0004-Do-not-run-tests-when-building.patch \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
            file://missing-test-data.patch \
+           file://CVE-2020-29385.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.29.2

