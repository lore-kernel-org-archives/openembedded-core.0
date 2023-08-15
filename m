Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66050C001DE
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.138747.1692116678248705590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d2Wktfcf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdbbede5d4so35316815ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116677; x=1692721477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgtrjbI4Py+rYHwjomObIYp6VOvb7xktPwZrwQLo5gQ=;
        b=d2WktfcfP/4901SQ4H/gZ3y/JbPFoQiYBHpKrFpWQyhTH1u338MdGYa+wG6qLLfVoS
         syKo5ERJWvqb/VElixk581mUwXj6pb3Ht3ORWdM/GhtI50xhbKsu2qed6iKbtzw9Q2d2
         lifMyE0wgPvPuE1i9wwUOVlTw4lJDWPh8zPASd8ztVOT/27YJq7ViQ0eNGdkhHXkIRPZ
         pItl6gx+PH4y0MmQTRjXwnXdEyUWD6R4TnQxxF+sop1cCSha7A4+lHNqPYvDNP4sE/Gk
         s9tXJoRVpZleHg1rcEZ8QbTihtFN1WzdDSqiwJ+dxju6jfs5MbyGYSyBtygLvpktQZNd
         X3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116677; x=1692721477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgtrjbI4Py+rYHwjomObIYp6VOvb7xktPwZrwQLo5gQ=;
        b=GHLLgJamjCXUoUucPk5zVcoMZEdO57Gme2E7+Bge26wm7dLeYnWdsr+stT8bSwFH75
         l65xL2NvxZs1IwjuPtwKj+f1K5qTB0Ilsj0RzZkxNGRw6bjBvZSiKPVm4s4CBtP/uPu2
         A0X5t9KFeY8MfS+bprPiKxHlh1uzzVZrWsrEU89Ou8903TDeBL1cY9YMptzTdHXzvDEG
         r+WHmJJS+fiuIdq+RB5nMgbSYkywLkfnkFqDxoEpak3XygeXpA+uIhWwAGTLoo7WCqAZ
         rIg4cL5y8v7+8h4g5Daw6WiAltljoAz7Z7bEjyD1La5YChc184UhFfAeoNp+OkdmnoHL
         JSQA==
X-Gm-Message-State: AOJu0YypmlaiGSl1pjRZ9ByRy/adKqA6gUu/9kxNcyCkROhOZOsdilAG
	rBkALJflnqycChjbwON4mKNhEQq2+zKl4o0J8ew=
X-Google-Smtp-Source: AGHT+IFbljyD0FwWKhdVt1B0N7w/bP/L+/wwsGArUbKXDDvm1BPfCVHX6PkIdTxVJVOkBLZHiHU5BQ==
X-Received: by 2002:a17:902:c409:b0:1bc:6c8:cded with SMTP id k9-20020a170902c40900b001bc06c8cdedmr19400318plk.67.1692116677386;
        Tue, 15 Aug 2023 09:24:37 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/18] qemu: fix CVE-2023-3255
Date: Tue, 15 Aug 2023 06:24:11 -1000
Message-Id: <886536b056230a9d72c900eacc8d1d8b44bd2836.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186081

From: Yogita Urade <yogita.urade@windriver.com>

QEMU: VNC: infinite loop in inflate_buffer() leads to denial of service

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-3255

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-3255.patch             | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c1ac245f9f..7dc382ffdb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://ppc.patch \
 	   file://CVE-2023-0330.patch \
 	   file://CVE-2023-3301.patch \
+	   file://CVE-2023-3255.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
new file mode 100644
index 0000000000..661af629b0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
@@ -0,0 +1,65 @@
+From d921fea338c1059a27ce7b75309d7a2e485f710b Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Wed, 2 Aug 2023 12:29:55 +0000
+Subject: [PATCH] ui/vnc-clipboard: fix infinite loop in inflate_buffer
+ (CVE-2023-3255) MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
+ Content-Transfer-Encoding: 8bit MIME-Version: 1.0 Content-Type: text/plain;
+ charset=UTF-8 Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A wrong exit condition may lead to an infinite loop when inflating a
+valid zlib buffer containing some extra bytes in the `inflate_buffer`
+function. The bug only occurs post-authentication. Return the buffer
+immediately if the end of the compressed data has been reached
+(Z_STREAM_END).
+
+Fixes: CVE-2023-3255
+Fixes: 0bf41cab ("ui/vnc: clipboard support")
+Reported-by: Kevin Denis <kevin.denis@synacktiv.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Tested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Message-ID: <20230704084210.101822-1-mcascell@redhat.com>
+
+CVE: CVE-2023-3255
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/d921fea338c1059a27ce7b75309d7a2e485f710b]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ ui/vnc-clipboard.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
+index 8aeadfaa2..c759be343 100644
+--- a/ui/vnc-clipboard.c
++++ b/ui/vnc-clipboard.c
+@@ -50,8 +50,11 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+         ret = inflate(&stream, Z_FINISH);
+         switch (ret) {
+         case Z_OK:
+-        case Z_STREAM_END:
+             break;
++        case Z_STREAM_END:
++            *size = stream.total_out;
++            inflateEnd(&stream);
++            return out;
+         case Z_BUF_ERROR:
+             out_len <<= 1;
+             if (out_len > (1 << 20)) {
+@@ -66,11 +69,6 @@ static uint8_t *inflate_buffer(uint8_t *in, uint32_t in_len, uint32_t *size)
+         }
+     }
+
+-    *size = stream.total_out;
+-    inflateEnd(&stream);
+-
+-    return out;
+-
+ err_end:
+     inflateEnd(&stream);
+ err:
+--
+2.40.0
-- 
2.34.1


