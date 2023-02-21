Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2AEC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:42:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.43528.1676990478424193122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UBlU/YLD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id n20so2628544pfu.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTreeO5EUmjdAHKN/iMtvW9W3cu/NjLVEjsf/hnOXI4=;
        b=UBlU/YLDEqKfzQg9YO/otCEMm0qaGOcvaMhwI8z1rCv5abwrGu0JZCd75vpwdKF8Yd
         AasaaZv3IGdyVjPOdaRfZv9gBez6pdNNyXLdJV4BEzxC3XnMM2gSTpAtbZVcI8KJtydo
         wvYih+Ud5SXLuUJQI/bnqlDfA9MdQK86zxHzT5cYvzzl2wpNjAYrUfolMNlSMz3Zc97A
         /pGVYzg95rI5y9oAfILvGX3tO4uAYSTI3DDcML1M0HIgCBMB+05lGhFzEe3gdYxSSSdz
         PkGiZrkQ03fEYEQ/9uXp7HlP+IyLTriPLH6OkO9dBtF5WGHh2hk3KEUxMkKh2yIgy08r
         hr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTreeO5EUmjdAHKN/iMtvW9W3cu/NjLVEjsf/hnOXI4=;
        b=qQFB1i/tV1794dQiPLhuoY1a6uX2gjRWnawkVRcQrgQZj8pcJ7Jt8M61T6U0zR2p7c
         Y3Wtitw//0LeSGjI0R1fHC8w5/ny5+krFiNX768VRChBZcQSL0xYOsQ3si2xEdntMWxB
         T0517QgBC/1HiAujeqJxjECSInvAwl13H9RPImn0sfbR/DVT0xOVwbRK/VdN62hMdBNV
         k1t2tRK1O4WwTe+NhSskYMEANQ32mhNkJCH6RdjjDdMseI0ZzTeNhCmLy7TZSeKhiF+2
         lAddqWblBVeNMtPHcESZI8q6W+aPmn6acYX94/vMUXVfql3sp51voOv/z4cKfOZoIb4f
         +ZbA==
X-Gm-Message-State: AO0yUKVzAPqBDIJZaToV98MWAWkljWQHD/nueTS/5f/iuK2VUKKDzKGW
	GA5O5dTciK1qXduG3mBuMR36l81VKIaC2cLKbhM=
X-Google-Smtp-Source: AK7set9Exz16GPQ56g+73V8n0tfsPF9GNoQpHpy4mkYIJVBLXagbuRKQTZRXFkFlxCOlZSvic9+snw==
X-Received: by 2002:a62:4ec9:0:b0:5a9:b7e3:2ee4 with SMTP id c192-20020a624ec9000000b005a9b7e32ee4mr4758966pfb.12.1676990516826;
        Tue, 21 Feb 2023 06:41:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/23] oeqa qemurunner.py: add timeout to QMP calls
Date: Tue, 21 Feb 2023 04:41:04 -1000
Message-Id: <3b99d0ce6445084038f89dfa98605a7aec49107b.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177521

From: Mikko Rapeli <mikko.rapeli@linaro.org>

When a qemu machine hangs, the QMP calls can hang for ever
too, and when this happens any failing test commands from ssh
runner may be followed by dump_monitor() calls which
then also hang. Hangs followed by hangs.

Use runqemutime at setup and run_monitor() specific timeout
for later calls.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 3a07bdf77dc6ecbf4c620b051dd032abaaf1e4ff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index fedabb189a..aa9e530f1b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -342,6 +342,8 @@ class QemuRunner:
                     return False
 
             try:
+                # set timeout value for all QMP calls
+                self.qmp.settimeout(self.runqemutime)
                 self.qmp.connect()
                 connect_time = time.time()
                 self.logger.info("QMP connected to QEMU at %s and took %s seconds" %
@@ -617,6 +619,7 @@ class QemuRunner:
 
     def run_monitor(self, command, args=None, timeout=60):
         if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.settimeout(timeout)
             if args is not None:
                 return self.qmp.cmd(command, args)
             else:
-- 
2.34.1


