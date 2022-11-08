Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043CFC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 12:51:52 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.7350.1667911906463045737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 04:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pn9pF3WR;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id m6so13761974pfb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 04:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zzhazCkbNyXee7uc0LgbZ4YC5wLrQBDjMCjPY5tfbA=;
        b=Pn9pF3WRfhIm/xtwAuMJqqsbT190hm087eljqmYLN844NurnzoqymC48WEkvw4GPGX
         LTRcZd1RJ2Bo8ygm+BichQJKX//WJwZmuPsYqhehRXLyMHsLep68uQNebNT1GFqbQVur
         +x7jjxOmdO7mMcXXOVbw++2eHhOI1qhvz2H2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zzhazCkbNyXee7uc0LgbZ4YC5wLrQBDjMCjPY5tfbA=;
        b=GzykR0niUT+8VFlYg+qP554SruMOETLk6+ascwASIrm7nF+HUywbOzT1M9eighHNXj
         8mE37YTammULuMQRXscynWBnR3mA9k1OmRVovB04xITga8wTSIw8Tqb/fueWtRfX4gX7
         XfX7XqVjdVydfFdKXaWFjU1ZPqgGGoWBDiQA/hnAj2eNlXmt6O4VvTUmi3IG0ccyomfv
         ySNt67p+8x52lZsPxeAm1YIQ1S6h0nGvWBHYbXDdoQ5zsFW9R4FebU22GE3S6eIO3Nyu
         CwRqDH9dmF0cY4tc7pw5+RK9O6JhmbcbJoYe17Xt6G0tRydDsS5C/vEK0A2rb5V15X6f
         W0iQ==
X-Gm-Message-State: ACrzQf27WPtazttE8rFFZGGSU6RXeEb3sw2jGIbV23DqXR7d1Bfq4sgB
	//fO4DVLvl9q9bMI8zBTD5WLd/vuUAhWwQ==
X-Google-Smtp-Source: AMsMyM7Sd+X+BCbNpyucxaPStAVeZWiHwXgURgD2BgTlaPi9G1qplovmO83Fo8gOUCzVyPTqIf21kA==
X-Received: by 2002:a65:694b:0:b0:43b:f03d:32b0 with SMTP id w11-20020a65694b000000b0043bf03d32b0mr46490987pgq.543.1667911905267;
        Tue, 08 Nov 2022 04:51:45 -0800 (PST)
Received: from MVIN00024 ([43.249.234.214])
        by smtp.gmail.com with ESMTPSA id bx6-20020a17090af48600b0020ad26fa65dsm6014268pjb.56.2022.11.08.04.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 04:51:44 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 08 Nov 2022 18:21:39 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] QEMU: CVE-2022-3165 VNC: integer underflow in vnc_client_cut_text_ext leads to CPU exhaustion
Date: Tue,  8 Nov 2022 18:21:38 +0530
Message-Id: <20221108125138.176367-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 12:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172965

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/d307040b18

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 .../qemu/qemu/CVE-2022-3165.patch             | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 14feb4f1e0..13e2991af2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -13,7 +13,6 @@ inherit pkgconfig ptest python3-dir
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
-
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
@@ -92,6 +91,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0019-target-ppc-Implement-Vector-Mask-Move-insns.patch \
            file://0020-target-ppc-move-xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch \
            file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch \
+           file://CVE-2022-3165.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
new file mode 100644
index 0000000000..a7d061eb99
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
@@ -0,0 +1,61 @@
+From a15f7d9913d050fb72a79bbbefa5c2329d92e71d Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 8 Nov 2022 17:10:00 +0530
+Subject: [PATCH] CVE-2022-3165
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/d307040b18]
+CVE: CVE-2022-3165
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+ui/vnc-clipboard: fix integer underflow in vnc_client_cut_text_ext
+
+Extended ClientCutText messages start with a 4-byte header. If len < 4,
+an integer underflow occurs in vnc_client_cut_text_ext. The result is
+used to decompress data in a while loop in inflate_buffer, leading to
+CPU consumption and denial of service. Prevent this by checking dlen in
+protocol_client_msg.
+
+Fixes: CVE-2022-3165
+
+("ui/vnc: clipboard support")
+Reported-by: default avatarTangPeng <tangpeng@qianxin.com>
+Signed-off-by: Mauro Matteo Cascella's avatarMauro Matteo Cascella <mcascell@redhat.com>
+Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann's avatarGerd Hoffmann <kraxel@redhat.com>
+---
+ ui/vnc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/ui/vnc.c b/ui/vnc.c
+index af02522e8..a14b6861b 100644
+--- a/ui/vnc.c
++++ b/ui/vnc.c
+@@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
+         if (len == 1) {
+             return 8;
+         }
++        uint32_t dlen = abs(read_s32(data, 4));
+         if (len == 8) {
+-            uint32_t dlen = abs(read_s32(data, 4));
+             if (dlen > (1 << 20)) {
+                 error_report("vnc: client_cut_text msg payload has %u bytes"
+                              " which exceeds our limit of 1MB.", dlen);
+@@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
+         }
+ 
+         if (read_s32(data, 4) < 0) {
+-            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
+-                                    read_u32(data, 8), data + 12);
++            if (dlen < 4) {
++                error_report("vnc: malformed payload (header less than 4 bytes)"
++                             " in extended clipboard pseudo-encoding.");
++                vnc_client_error(vs);
++                break;
++            }
++            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data + 12);
+             break;
+         }
+         vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
+-- 
+2.25.1
+
-- 
2.25.1


