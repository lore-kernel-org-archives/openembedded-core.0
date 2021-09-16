Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.4444.1631750663336217159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 17:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f03yhvvt;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id q22so4331750pfu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOQqUf3DFPUoFECIOdM9krTIFkvZNnFLRVRKbAXbnP8=;
        b=f03yhvvt2QzU3ht6duw2nOS17jPvvCWsQgJnBr+8ath/X425pGjfG5+MkydtYHQqWw
         6lWLDwkmDUGLbKT/8DVFbhvJkfAui1pImt1bIvajvT9F2NfMa0Vj3Hg1KO6bgHGtzieD
         cCTx/yt3yfBYa+pjd59iFv4TYlfStBVKvfV/p4yBVGFUZyUktLfRmmCtiVCpFBmqrOUV
         MbD45dQEWWoYpSg/Atj4buCTkLY2EISSOy7LF4izvWUL5yjXDVEHCKthCyh4JyUSA5NZ
         MYszNzmL/zWXcWTPhdyopaYoVQxK3K+EzjZ1e+0ziTLrskQRmVcmBkV8s05ZYWhT6pk3
         srbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOQqUf3DFPUoFECIOdM9krTIFkvZNnFLRVRKbAXbnP8=;
        b=2MNg0qMXYgue64CIwSZXdTmWyNb9JBUoibC8qraGMxr2S8+S8HUzF+aGAyUYCFZQvg
         PKMyhpydBpL4EvFSY+nTbEeqous2JrcemYaKR6kEHuXPnRMg3+WZuV/BRos4a8gqACuk
         DjkV+k+LRctKdl+OOqkNrtszLq+m98FWGRF3tNV4m7YXEouEOrytlt5iUW70AHOngJg7
         5NTktKHriLk2tej2el5szgzbytgbEl80CxpvchTQyGYs6QQHxw+jTXByuiC7UBMr5sox
         tPGGseN0M64oWK7Gr38b5QMLy/0Hd3UW0a6BL6eBMry7u3GgEiwXdxiUVD/t1D/4RTWv
         udsQ==
X-Gm-Message-State: AOAM532MzLHcrApIq2pbtL/WmtNTX7TuyS7xzluG6kNPf6DX3YhBu8/U
	y4TtJcaIBSEyKMxmENOo3WkGG43UzkI=
X-Google-Smtp-Source: ABdhPJzFEkF8bXA1sRPJCF3UryuCzpNSny85MVTFpX+tCIqE/FDpXahj6i+wHOrVxq6fd1S48CcmaA==
X-Received: by 2002:a62:8cd7:0:b0:438:26bb:965d with SMTP id m206-20020a628cd7000000b0043826bb965dmr2083032pfd.64.1631750662746;
        Wed, 15 Sep 2021 17:04:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:538a:dbbb:2df2:d1e8])
        by smtp.gmail.com with ESMTPSA id 13sm919152pfw.73.2021.09.15.17.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 17:04:22 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 2/4] qemu: Security fix for CVE-2020-27617
Date: Wed, 15 Sep 2021 17:04:17 -0700
Message-Id: <20210916000419.1812968-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916000419.1812968-1-akuster808@gmail.com>
References: <20210916000419.1812968-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 106462
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=7564bf7701f00214cdc8a678a9f7df765244def1
ChangeID: b9dc1b656c07d6a0aecaf7680ed33801bd5f6352
Description:

Affects qemu < 5.2.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-27617.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f5e8a9ae49..3113d638d7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -89,6 +89,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-12829_3.patch \
            file://CVE-2020-12829_4.patch \
            file://CVE-2020-12829_5.patch \
+           file://CVE-2020-27617.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch
new file mode 100644
index 0000000000..7bfc2beecb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch
@@ -0,0 +1,49 @@
+From 7564bf7701f00214cdc8a678a9f7df765244def1 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 21 Oct 2020 11:35:50 +0530
+Subject: [PATCH] net: remove an assert call in eth_get_gso_type
+
+eth_get_gso_type() routine returns segmentation offload type based on
+L3 protocol type. It calls g_assert_not_reached if L3 protocol is
+unknown, making the following return statement unreachable. Remove the
+g_assert call, it maybe triggered by a guest user.
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upsteram-Status: Backport
+CVE: CVE-2020-27617
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ net/eth.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/net/eth.c b/net/eth.c
+index 0c1d413ee2..1e0821c5f8 100644
+--- a/net/eth.c
++++ b/net/eth.c
+@@ -16,6 +16,7 @@
+  */
+ 
+ #include "qemu/osdep.h"
++#include "qemu/log.h"
+ #include "net/eth.h"
+ #include "net/checksum.h"
+ #include "net/tap.h"
+@@ -71,9 +72,8 @@ eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto)
+             return VIRTIO_NET_HDR_GSO_TCPV6 | ecn_state;
+         }
+     }
+-
+-    /* Unsupported offload */
+-    g_assert_not_reached();
++    qemu_log_mask(LOG_UNIMP, "%s: probably not GSO frame, "
++        "unknown L3 protocol: 0x%04"PRIx16"\n", __func__, l3_proto);
+ 
+     return VIRTIO_NET_HDR_GSO_NONE | ecn_state;
+ }
+-- 
+2.25.1
+
-- 
2.25.1

