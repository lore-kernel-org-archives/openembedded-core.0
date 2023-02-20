Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F86C64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.14068.1676902738729478045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GGMoIEqc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id bm5so719630pgb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvV+fL1cUxzOvVEvWvWxCJlWye+sNpK/COiOL5YRgdU=;
        b=GGMoIEqc9fWTplQ+xc4Mqp5ySPoNwjhckUa6D0IUfKSxfg+mdFjMOCdcOYLzzuOlGo
         XxPiwp/Wb6XshBi7H9F9YYwpTbXTiDMtE+R+WRvOcKoJwKzJsu6dxJ8eqIbvekARC3f+
         jc8n8Q42HeK4PIQObd4OywFc0+LRuWbE8lPRLYSA2sPAzynWmUuHE4y5eQwINXgbRGo7
         fWek+qY7tjolbf/N1kUQLrCPULKvoAWcvHP5Oj0lURQJWiE/NzVq6OCkBfrg/2TvlASt
         JT0RgylX8QyZCHt41Lzci8bzKtthlt8bTpyqApBSZIr/FhOnR061sr7WB8eEiOhzfR3o
         DtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvV+fL1cUxzOvVEvWvWxCJlWye+sNpK/COiOL5YRgdU=;
        b=LKrYNSzpuaq9JqU6QL0cp5WQlzFbBAOO/UBeDirtqkagjRxaMX31tWKMmogY1mrY4k
         tkRrfRW2F2mSGL1r60L6QfbWX/8OZfJIn7QjfF8Th84diSiNLcDeakNB48JR8difFiLQ
         p/qRyXDoZQdst2ylCRHFjU0UF250ZRtLPF3FUrcZxHmmlapB0DJMcPspRr2kKFRhebyJ
         NlDgGcux6/rWag9Z1Lf9vRIgi5kiJpTbOeHHeeENVYpX5+i81I2tRZpKjmnVPBp5xDP+
         nghX9Yi/pmuUn5Wi4mB3PRvQ1fbk6F2G5S9qK0yIn1aDDS3AiKhzAF3PMdceL2CzeOVC
         m6lA==
X-Gm-Message-State: AO0yUKVaFLC88V6QAq3W2btfCgQwL7YbTCHs4pXIGsz2rxu3SbQZ3YN5
	Fq4z3WLDXGlwwfg3pRCwvqIj0bjG9PX6DSAae4I=
X-Google-Smtp-Source: AK7set8LJBd3rtqwdmHjNQ3r04ROpToXDff+Q28JIqMTEj/169BeiT9gU0ivuCxhQ381CE1/+32zcQ==
X-Received: by 2002:aa7:9505:0:b0:593:ed9c:9f07 with SMTP id b5-20020aa79505000000b00593ed9c9f07mr977074pfp.27.1676902756067;
        Mon, 20 Feb 2023 06:19:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/22] oeqa qemurunner.py: add timeout to QMP calls
Date: Mon, 20 Feb 2023 04:18:28 -1000
Message-Id: <cd6bb88d98b1dc8d751cf75b9ddcca39c84738c6.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177427

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
index 3aeef19434..d21b0a275f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -346,6 +346,8 @@ class QemuRunner:
                     return False
 
             try:
+                # set timeout value for all QMP calls
+                self.qmp.settimeout(self.runqemutime)
                 self.qmp.connect()
                 connect_time = time.time()
                 self.logger.info("QMP connected to QEMU at %s and took %s seconds" %
@@ -623,6 +625,7 @@ class QemuRunner:
 
     def run_monitor(self, command, args=None, timeout=60):
         if hasattr(self, 'qmp') and self.qmp:
+            self.qmp.settimeout(timeout)
             if args is not None:
                 return self.qmp.cmd(command, args)
             else:
-- 
2.34.1


