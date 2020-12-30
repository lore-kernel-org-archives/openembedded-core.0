Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4406.1609318905711505661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 01:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: bFUu5Mlv3qWQX4iA3OheY7GsOSJfBWspn7hxm/LnLAyjl5CzRjklFphMjcHnSIV8QH1sixeULu
 Yc8nMxtSMY+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176739314"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="176739314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 01:01:45 -0800
IronPort-SDR: YHzW9q1Hk/DewF8RCCtc2gay0dZHXIVqo2uLs97iE8hrlv3twrsGtKK2uRERIqukLEm8EllbgB
 f4dzoNmA/FJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="376356696"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga008.jf.intel.com with ESMTP; 30 Dec 2020 01:01:42 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gdk-pixbuf: fix CVE-2020-29385
Date: Wed, 30 Dec 2020 17:01:40 +0800
Message-Id: <20201230090140.85279-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230090140.85279-1-chee.yang.lee@intel.com>
References: <20201230090140.85279-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Backport patch from
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81

image file in upstream patch is for test purpose only, it cause error during
do_patch so drop it:
File tests/test-images/fail/hang_114.gif: git binary diffs are not supported.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.17.1

