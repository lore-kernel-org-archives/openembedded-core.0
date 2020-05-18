Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.815.1589820585649410374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JfYmKWPY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 23so5212505pfy.8
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RMGV49UqlJpI7vi6/w7X5Tg0MR95gDidKBOzaqnAWZ8=;
        b=JfYmKWPY76+qQmlTa4JPADnVyBT0pvwqiV6zp5sS70iogPz7wALHegHlutbiim0kta
         o/nIsKWHAV2LgthBE0kwuUaJ94hV+T3FRFB0F2quKppi6IEjIR7G5fkElqTbB5xoFlkU
         OPVI4dw8pYiOSLvfV5iz7uo29w5ogA3jy6nsbV4BISr44VfO9EvJloSFb3QkQkiCpAek
         FXuWwoLfaWDIOQwcNb2hlTPQunTHPXB5cSCyI4joXTctyEzGY9gOQcQD+oNf77GMAvBV
         u+deMC+eVPWYOPhBoR8vmartSqIcNtskJPi+G+P8edVEUKKw0msC+b8q+EX6aXVy9TyW
         5DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RMGV49UqlJpI7vi6/w7X5Tg0MR95gDidKBOzaqnAWZ8=;
        b=SQSjT1eObQedIQEqceGHzC/vDNgeITN995EjzDdHb7Dd9evnvYijw26IowMl9FEv0X
         ntg/HrKGRa+U/WNqtpus6bFvO686hhVwdAF9Mk41tWU8Qki4qujap2SYoTf424Uxbetq
         lWJAh1HdwF0Wwy7eFKKujocRQmKVB8n3jvZTmTRK8NV6QxerUN2BQfHTJApUo0UPicgo
         WsfozUcvguo8BLSEAwgIR993NEPKJFYODK0LKTNI4ChEi03QXm7x+QMIfTRRhRlon7DO
         AQDDoMalB49pUXw8XiYYpwmNqnX++IFBNY1Xzk6kaNYW//b39sm8IR5MQjADL/8HNog8
         IU/w==
X-Gm-Message-State: AOAM531AUW8MVzqgCtQWJQohr44TBU6UM7aKZRoLK1f/uMrTc0EIx3FP
	XK09HMy8J87ZIbk59GH2oiu7xz8t+8N57Q==
X-Google-Smtp-Source: ABdhPJzF/SjTCik9mjJwC4NcMURwE+LWE0ky3BTEH7infg9tFJCTq87NEmIkPOjVRGLFJk4YR00fSQ==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr15856542pgh.280.1589820584628;
        Mon, 18 May 2020 09:49:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/19] meson.bbclass: Close the log file after reading
Date: Mon, 18 May 2020 06:48:35 -1000
Message-Id: <789c008167e5fe94f781ab274d60b06eaa46ce25.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Anton Eliasson <anton.eliasson@axis.com>

This fixes warnings like:

    WARNING: package-name-0.0.1-r0 do_configure: <string>:164: ResourceWarning:
    unclosed file <_io.TextIOWrapper
    name='/source_directory/build/tmp/work/arch/package-name/0.0.1-r0/package-name-0.0.1//meson-logs/meson-log.txt'
    mode='r' encoding='UTF-8'>

Signed-off-by: Anton Eliasson <anton.eliasson@axis.com>
Reviewed-by: Ola x Nilsson <ola.x.nilsson@axis.com>
Signed-off-by: Anton Eliasson <anton.eliasson@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b47..e9628033c6 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -164,7 +164,8 @@ meson_do_configure_prepend_class-native() {
 python meson_do_qa_configure() {
     import re
     warn_re = re.compile(r"^WARNING: Cross property (.+) is using default value (.+)$", re.MULTILINE)
-    log = open(d.expand("${B}/meson-logs/meson-log.txt")).read()
+    with open(d.expand("${B}/meson-logs/meson-log.txt")) as logfile:
+        log = logfile.read()
     for (prop, value) in warn_re.findall(log):
         bb.warn("Meson cross property %s used without explicit assignment, defaulting to %s" % (prop, value))
 }
-- 
2.17.1

