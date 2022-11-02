Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C5EC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.1934.1667356959357194953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z8iLupH6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id r18so15034508pgr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3tjcAl2eBdfXbmE22HnsrTowibB69AzjXBlWem/l3g=;
        b=z8iLupH6PpJCN64/ioDyN5Rfza3ERiLgul8xE84VdAK4JfkyugSL4+0xD9CN19+O1w
         JYe7jjE2/Dj4BM1AVc6q530Aex2w+h68AH5m1Gr6LCPFCrg9kLlpRzItW8n9VtFLqwAm
         lbo+H+nEBWpkY/jf4fXT/R0PFXJaaMTytnrecj0bv6hUUqZEzO7S8lP6ITI6LG+Nmy/J
         Cbg9qkwzpslnK0ywXVel4yHxoUT+2rR0a51UQKDh74m8Klper24zavl8EFZhlrzji2hp
         OnjTt8Y6hrLEf3NalsLRyOVm6gS4wMVXurWEmq0EmGqkUkl/uFGCQAWD5l353RaVLgdW
         Zo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3tjcAl2eBdfXbmE22HnsrTowibB69AzjXBlWem/l3g=;
        b=toaI3RLQDJ1+72tZ+O+bdXHDtlqwgYHbGnVp3chKnm7Lyiqj6Z+wvK1kxbtLFJpWW2
         5i5YUZDJ6XyyIYrwbsyv+zZ9lseZj0zUJ9ZLQZgGtHNR/QoLje/lpsrkEk4M/afqIwY2
         A3o4kg8CsInJnJOWfgpugfO6lHAHxmKVAGsnm/DllU76NzCqZLzcwmrsk9OoFZPN5/fB
         ZrBHZGz7R4nWfRBWOQ2/Z7TlAes6uPcp2gI1V9rFQcXdMN1X9zk5ct+2LiTpBcbwV4uD
         mp/HeuAv4aySkQbFJ1IeP6+nKLE6vwjI5Ys+iBGA23tbhfwfxo3S4Fdizvo1FweQQ3Dv
         iZKQ==
X-Gm-Message-State: ACrzQf1PCIEwyURSMenNL5viLT1N+zVnnucWYh8+BTDkPwIn7bsJdRVN
	SppuDD0tsKIwxZQIANUwgBjjkLyheZ+6CjI0
X-Google-Smtp-Source: AMsMyM5hbMcWg5gxbn1bPN5XyYzcp06+kxqQ5Ft0z62uGlgfqo1Jyqi7YpgMItIwWDzUKaVo1tV39w==
X-Received: by 2002:a63:7909:0:b0:458:1ba6:ec80 with SMTP id u9-20020a637909000000b004581ba6ec80mr19910858pgc.414.1667356958372;
        Tue, 01 Nov 2022 19:42:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/20] qemu: backport the fix for CVE-2022-3165
Date: Tue,  1 Nov 2022 16:41:57 -1000
Message-Id: <d63c5b210b50a2c332a5c309298ec13b510cc7c8.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172547

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d820389728b0f5e085954b4f995da2b2014acedf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-3165.patch             | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 612abd240a..3908aa0c7c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
            file://arm-cpreg-fix.patch \
+           file://CVE-2022-3165.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
new file mode 100644
index 0000000000..3b4a6694c2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
@@ -0,0 +1,59 @@
+CVE: CVE-2022-3165
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From d307040b18bfcb1393b910f1bae753d5c12a4dc7 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Sun, 25 Sep 2022 22:45:11 +0200
+Subject: [PATCH] ui/vnc-clipboard: fix integer underflow in
+ vnc_client_cut_text_ext
+
+Extended ClientCutText messages start with a 4-byte header. If len < 4,
+an integer underflow occurs in vnc_client_cut_text_ext. The result is
+used to decompress data in a while loop in inflate_buffer, leading to
+CPU consumption and denial of service. Prevent this by checking dlen in
+protocol_client_msg.
+
+Fixes: CVE-2022-3165
+Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
+Reported-by: TangPeng <tangpeng@qianxin.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ ui/vnc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/ui/vnc.c b/ui/vnc.c
+index 6a05d06147..acb3629cd8 100644
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
+GitLab
+
-- 
2.25.1


