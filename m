Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.8795.1632492966697275482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AQlKoV0p;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id t20so7053388pju.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hUiKy6KLQbtReY/tcAOIws2KwiXxOcj8lKUf99X/9Hg=;
        b=AQlKoV0pWMlpJRG0ECefIId+wwgFtxFQy+dNxpRTRJLEBZ99PokNBCp0OV4ugEVZ3h
         oH7iVTziMopbfNN21Z+fcFdS8/I999R5l2jew1XBBML/C/GonnFMidwfgYhHTiBeCaO2
         uP5eWZkfLAH8dLaweIOyLIBI4eNql3FRtfMO0Sb0JeVvSeeiNeBLJL33SNk6Qk3h0St4
         aLBU3580b8exD0g6ypx674tchJ1ksAMsY3WsZa2cZ2M8JDv0sWewc/xIfnV5JD5mElZ5
         rhDlMofu4JhVSWuDJDMOTsx/1kk2NYoXqhaTAutTLPmPcihTMmxPUVf/jgrlMEw/9cpf
         4++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUiKy6KLQbtReY/tcAOIws2KwiXxOcj8lKUf99X/9Hg=;
        b=cgQx5a+pVtEgqPRJPFZ54EqbTs9UtVWtmsFv0JRRDrZSr1uTEhdtbgiKl8u0Uuc0jP
         LYoSrA3ONezFQQCBT5Sf0svzfYw85qQXOVnrHN9zybTBvWssDzOrP5gANh2IBOfTEtDY
         l+JEUj6RmvC+f8Zkqxppr56iMWDehIUBCoh9EVS8Lt1YhaRUP5Eh88j+MEV40JViKpzY
         NxQnxJCP50YgQU+HHi018VcwntG5Lu2povr1/elF1AMkQvwVgS64cqh51lE6uwEDoU82
         P1e99/1nW8070r4S/AAbJ7h29poFbfXoExacxfPwOTZdoEMo6t+D19Wl9imqAc0y9Tkx
         elvA==
X-Gm-Message-State: AOAM533ohaLY51bO7N9IwhznlRPt4cvPnLHr8HTrxJ0NwjkpIpnnbt1I
	5F/jk30dqkdab2kuuCvXVyQLfUyNnhRWoPKK8G0=
X-Google-Smtp-Source: ABdhPJxGQla8rCrKN0vtMELnlH0HmjvL1O3Mdh5QzrfLlYzA1+O+0+2BASxSJl60MS5tKMAVhGsdnA==
X-Received: by 2002:a17:90b:30b:: with SMTP id ay11mr2526975pjb.192.1632492965737;
        Fri, 24 Sep 2021 07:16:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/25] qemu: Security fix for CVE-2020-27617
Date: Fri, 24 Sep 2021 04:15:09 -1000
Message-Id: <7f14fac807c605eb8f0e65814ea17d066643cedb.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

