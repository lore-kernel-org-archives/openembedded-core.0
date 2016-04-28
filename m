Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9FF6FF3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:23:33 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vv3so11697542pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jAc/d/eLPuohz0Ipperb3Majg5ofOZhPeQvdkW01EWA=;
	b=f3JOlvBQs3730bJwnLSEdgyFJ2QTsrLngHpZcPVeq1ibyi3/TlJZ4aOulS67zG0llI
	CI19jZIJRheTRNiK/3QIXh9sekXP3lV1m2mwgXLPgzotfntt8Cci1woN+3JPI526/zRb
	yj1TkdPgsu/1nw7NVfhyKw/7U5fKK5jesyLdoU0zHxsxO2WFSsSPRSLRnmDxQM5UxBbe
	U0gSgvUv1/zn3CX8LKutpv7Xb0Q31pEYx+VkKVfS5d0OVfFEDvL6VTsS3djZhUHYuvlz
	vQ88uvICT9/mwlThu+v4ShE8q6ko+NKPXH115o27i/lt75AkO+/cmS5yXZwZ2gm8ECy5
	lUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jAc/d/eLPuohz0Ipperb3Majg5ofOZhPeQvdkW01EWA=;
	b=VU+gGNtTCMnXsPu/iU73J0HNxIRjLxQsE60l8uP0IqjavsAUsZoNAx0ZdyOiZkPeHU
	u/OL7NkCHwyXYkFGC2+5qbOWjuD1bTQTdmKYmLlZ7MJR3R8gwUKxmPqT7lv/g7IbsX63
	vTxzwnJpqii2FwTs5EqGHQLkEU2EOArdreLDBlhGXAXeSV+TBTaJuCuXFCUU9DssbMtA
	p47jnLntykIdahconP86n4OU0pLSqCzdCvTkSdq4FXSKVjUUgR7Taq9Br+GQTllM0ETW
	r6oURwo9iVXauObSYJ5qDV6c+CGZxnl5beOVgGCjpJkACLyg0x1X9pJi0QG+iTQ3Kw8E
	Malw==
X-Gm-Message-State: AOPr4FWjWCpThImGiDkj/4JuFjMU2452tFp4SMx9grX311Qo28r3dZKmc/+pbnAxHAf0Uw==
X-Received: by 10.66.118.70 with SMTP id kk6mr22755672pab.74.1461867814654;
	Thu, 28 Apr 2016 11:23:34 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	z17sm16834986pfi.61.2016.04.28.11.23.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Apr 2016 11:23:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 11:23:30 -0700
Message-Id: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Thu, 28 Apr 2016 18:23:36 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-2857.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
new file mode 100644
index 0000000..73cfa2a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
@@ -0,0 +1,51 @@
+From 362786f14a753d8a5256ef97d7c10ed576d6572b Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 2 Mar 2016 17:29:58 +0530
+Subject: [PATCH] net: check packet payload length
+
+While computing IP checksum, 'net_checksum_calculate' reads
+payload length from the packet. It could exceed the given 'data'
+buffer size. Add a check to avoid it.
+
+Reported-by: Liu Ling <liuling-it@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2857
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=362786f14a753d8a5256ef97d7c10ed576d6572b
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ net/checksum.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+Index: qemu-2.5.0/net/checksum.c
+===================================================================
+--- qemu-2.5.0.orig/net/checksum.c
++++ qemu-2.5.0/net/checksum.c
+@@ -59,6 +59,11 @@ void net_checksum_calculate(uint8_t *dat
+     int hlen, plen, proto, csum_offset;
+     uint16_t csum;
+ 
++    /* Ensure data has complete L2 & L3 headers. */
++    if (length < 14 + 20) {
++        return;
++    }
++
+     if ((data[14] & 0xf0) != 0x40)
+ 	return; /* not IPv4 */
+     hlen  = (data[14] & 0x0f) * 4;
+@@ -76,8 +81,9 @@ void net_checksum_calculate(uint8_t *dat
+ 	return;
+     }
+ 
+-    if (plen < csum_offset+2)
+-	return;
++    if (plen < csum_offset + 2 || 14 + hlen + plen > length) {
++        return;
++    }
+ 
+     data[14+hlen+csum_offset]   = 0;
+     data[14+hlen+csum_offset+1] = 0;
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index e9d9a8d..7622386 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-2197.patch \
             file://CVE-2016-2198.patch \
             file://pathlimit.patch \
+            file://CVE-2016-2857.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.3.5


