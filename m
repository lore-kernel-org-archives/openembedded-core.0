Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C50EC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.2866.1668348781875536035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Nc8cLnYb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 6so8156796pgm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3k7Gln+Eco6WitLRUSFQkqSqg03Mgw2R/VYOqcZeYNc=;
        b=Nc8cLnYbRSHX5ZkSzcluB1Vl9ctkkJryqLbIvPuCbfPO0cy0lNGQgyO2PMRU6KewlB
         1wQ0AR58gpFVYk3Pp6/9dapMfLyV1mmAPZV3z5107R/Dm1oh4GuLVA9kT846UYR/adCS
         hgELcZQrsOd3tJqyVl1BOggPn81vnOk22EGpeeGr/udS1nZlLLtKfK0pQyw3teBjdb3c
         YUv+/hJz5A3XsIn/eUtDcrUu97ABVqqntEHOti9pmHCf/ls1aeNY5lig4jscjZYWV1fD
         kodfmHzzbjMDN8N7lpkYg6hAJiMxFdD+qgj9dVgr83Su4Uhh5NS9od5h6WpRYGmXCgSN
         UpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3k7Gln+Eco6WitLRUSFQkqSqg03Mgw2R/VYOqcZeYNc=;
        b=7wYwxdMPfk7j98Y4szs/IzMYfqQHoysZCvn2B42WRhtx5ZE1SFS0WxIKP33cFLRFC9
         0mtHZvPqBhHii5ySbhbN8aHFs0livjpQ5AoEmPClyKLbHPUK457ZY4ANSZgJZuKE2W1H
         lcsvpIXdpRM88FK91zpOGp2ZctTjtC3Ecuugu/IEN/z2YJ0LSM2nA/HDLT98gJtJXdTX
         N36vUtoVLMwZounskw7rJezDjTlOqi12meK26pv7kfMYlx3pR2J+jWclhPwA06Klotx2
         o9amQGOv7UUyHOpLcOFDQtKz939pICK1mNKyvMlw1kcZ7LubRROm27we4tSW8FzcKhlg
         QjnA==
X-Gm-Message-State: ANoB5pmLFevfqXOvvcpxpnVCKt4RpFicM0Ut6I+IW7j9+D4Qq/bF8SYb
	trYWVW52A1b4KK/K0wv+2TWWj9RtT3kPKLD7
X-Google-Smtp-Source: AA0mqf6VQE0aF3YQgfSiZ0bt94c1b/c32IuU1ZCY0ZzAD8Zjvwr49/5/jt0hLnp/PyN/OYycxVoCgw==
X-Received: by 2002:a63:1e05:0:b0:434:911a:301 with SMTP id e5-20020a631e05000000b00434911a0301mr8880299pge.50.1668348780555;
        Sun, 13 Nov 2022 06:13:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] QEMU: CVE-2022-3165 VNC: integer underflow in vnc_client_cut_text_ext leads to CPU exhaustion
Date: Sun, 13 Nov 2022 04:12:40 -1000
Message-Id: <c7eb6da6fa68caf2fb0becbbebeea5e8ea2c9c56.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173196

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/d307040b18

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 .../qemu/qemu/CVE-2022-3165.patch             | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 19431ee6dd..6a49dc53e9 100644
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


