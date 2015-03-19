Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F21C65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:50:34 +0000 (UTC)
Received: by igcau2 with SMTP id au2so101183813igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gNzO6s9Bbs4H0VZoerYOl4JVJh/k/8Y0Fqeughlh51A=;
	b=e30CG84gRC0/siu5TLECtznlMYjONrlHOA13szMT0D7JBxiyFS6+E8F2FoW/QDNuiW
	pg2qHzmdlD6eUqGz0c8hiffQlcrtMTTimAFz8Bj1SPFO6r+RRfBcIkvLGTzccYnz9knT
	hoNbL5TLMurKUEy6k4jCAt6CU+tAVq0UuUGiOzIKQp/Sn+XstPnhFOlmqAQN8OsI6AW7
	zixJCklCjXw/dvndqFQVvQBsXjzrdcsMYsMWBWnoSMCUnWFanmrdVKPmP+/ZAWTcNO1U
	292Ol6Qn39cTFgK12RSm7uSwd/v7iqgu47GcY9feZUuxCQV4aFahlsldRz8yIjNyhzMY
	JAFw==
X-Received: by 10.107.3.2 with SMTP id 2mr117397911iod.92.1426787435449;
	Thu, 19 Mar 2015 10:50:35 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id w17sm1339265iod.44.2015.03.19.10.50.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Mar 2015 10:50:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 10:50:18 -0700
Message-Id: <1426787419-16672-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [dizzy][PATCH 1/2] busybox: lzop: add overflow check (CVE-2014-4607)
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
X-List-Received-Date: Thu, 19 Mar 2015 17:50:39 -0000

Backport from busybox 1_22_stable branch:

  http://git.busybox.net/busybox/commit/?h=1_22_stable&id=5698ff93233b47218a677fd7facd8cc90211d1a4

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../busybox/busybox/lzop-add-overflow-check.patch  | 71 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/lzop-add-overflow-check.patch

diff --git a/meta/recipes-core/busybox/busybox/lzop-add-overflow-check.patch b/meta/recipes-core/busybox/busybox/lzop-add-overflow-check.patch
new file mode 100644
index 0000000..63d4948
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/lzop-add-overflow-check.patch
@@ -0,0 +1,71 @@
+Upstream-status: Backport
+http://git.busybox.net/busybox/commit/?h=1_22_stable&id=5698ff93233b47218a677fd7facd8cc90211d1a4
+
+From 5698ff93233b47218a677fd7facd8cc90211d1a4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 30 Jun 2014 10:14:34 +0200
+Subject: [PATCH] lzop: add overflow check
+
+See CVE-2014-4607
+http://www.openwall.com/lists/oss-security/2014/06/26/20
+
+function                                             old     new   delta
+lzo1x_decompress_safe                               1010    1031     +21
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+(cherry picked from commit a9dc7c2f59dc5e92870d2d46316ea5c1f14740e3)
+---
+ archival/libarchive/liblzo.h  | 2 ++
+ archival/libarchive/lzo1x_d.c | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/archival/libarchive/liblzo.h b/archival/libarchive/liblzo.h
+index 843997c..4596620 100644
+--- a/archival/libarchive/liblzo.h
++++ b/archival/libarchive/liblzo.h
+@@ -76,11 +76,13 @@
+ #    define TEST_IP             (ip < ip_end)
+ #    define NEED_IP(x) \
+             if ((unsigned)(ip_end - ip) < (unsigned)(x))  goto input_overrun
++#    define TEST_IV(x)          if ((x) > (unsigned)0 - (511)) goto input_overrun
+ 
+ #    undef TEST_OP              /* don't need both of the tests here */
+ #    define TEST_OP             1
+ #    define NEED_OP(x) \
+             if ((unsigned)(op_end - op) < (unsigned)(x))  goto output_overrun
++#    define TEST_OV(x)          if ((x) > (unsigned)0 - (511)) goto output_overrun
+ 
+ #define HAVE_ANY_OP 1
+ 
+diff --git a/archival/libarchive/lzo1x_d.c b/archival/libarchive/lzo1x_d.c
+index 9bc1270..40b167e 100644
+--- a/archival/libarchive/lzo1x_d.c
++++ b/archival/libarchive/lzo1x_d.c
+@@ -92,6 +92,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
+ 				ip++;
+ 				NEED_IP(1);
+ 			}
++			TEST_IV(t);
+ 			t += 15 + *ip++;
+ 		}
+ 		/* copy literals */
+@@ -224,6 +225,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
+ 						ip++;
+ 						NEED_IP(1);
+ 					}
++					TEST_IV(t);
+ 					t += 31 + *ip++;
+ 				}
+ #if defined(COPY_DICT)
+@@ -265,6 +267,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
+ 						ip++;
+ 						NEED_IP(1);
+ 					}
++					TEST_IV(t);
+ 					t += 7 + *ip++;
+ 				}
+ #if defined(COPY_DICT)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 7736520..3934278 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
+           file://lzop-add-overflow-check.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.9.1


