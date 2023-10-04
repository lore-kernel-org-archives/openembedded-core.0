Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046A2E7B60D
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:38:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17095.1696423109958689355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9N6gkJ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so20223155e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696423108; x=1697027908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSH1e6WJhSSUYr1/kyZigJGZZMHevGohjSB2fDExkjI=;
        b=I9N6gkJ/9vHL7/lE/hdKn97rkWc7K7Cm0j4IE3gEKaK1UnlcNa+4ceZdK9xD+3NB9I
         FTL3cffLA+MlPp+7ivg8nPMpPWiVpb6P6e1AEWSdAK496oHi9XRzBkaDLrWYmDJcRRWt
         w8k9Z7NHBuz0Kd4vT7i8UZZJpbHgWa3G2UvAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423108; x=1697027908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSH1e6WJhSSUYr1/kyZigJGZZMHevGohjSB2fDExkjI=;
        b=bGz+swXc1/3+RPgLBQ6HsOk74KQObbxFTFr5NsBhvMVz12nVA/KKZ9OhC+mZ/WdIn1
         kYkTjGgJz2NBTSq2ySGUZU6HaL7CIHjaETgWNy/aae2IhttuvysIMBKkzgE0o8qGCIdP
         u27qQKoDJ/otQKN7VXX9sMgtaXpH2ws7mq1c/vbU77krnIgNX0uFHln8R5v/iAPcsqvi
         MO546U41SOT2DqT9R0CFOfCA/slru0kmQcoYGwLDeALXAHuhTVko+xL74a7YOxdLcdz2
         fQVlKP88RiPI3OtrJnXZ8zmHd6sYp49G+AO7j+CP0JimECSX1pSip84zE7tkq59cvwhb
         DsCQ==
X-Gm-Message-State: AOJu0Yzny+k/pjM3zlDvB7cwSSFOLSP6ApWZajMpXkb70JpCEsaGFfIE
	hi9Ugf4NTtFiexVQGfa4hsXJpcW2HAwaDVWFV6E=
X-Google-Smtp-Source: AGHT+IEi7gfoHfrXIVk4Jo5xxGC3MoQjeqs9vp10xbOQwfTDnAAlmkWxn+kOqmMgxetsB4uNa2TZ+Q==
X-Received: by 2002:adf:de09:0:b0:320:9e7:d525 with SMTP id b9-20020adfde09000000b0032009e7d525mr2063126wrm.46.1696423108005;
        Wed, 04 Oct 2023 05:38:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003279518f51dsm3974617wrb.2.2023.10.04.05.38.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:38:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] qemurunner: Log the second serial console as well as the first
Date: Wed,  4 Oct 2023 13:38:22 +0100
Message-Id: <20231004123823.2990916-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188678

To aid debugging, always log the second serial console as well as the first
to a seperate log file. This should make it clearer what happened when we
see test failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b738a261d87..ea867a2934f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -113,9 +113,9 @@ class QemuRunner:
         msg = re_control_char.sub('', msg)
         return msg
 
-    def log(self, msg):
+    def log(self, msg, extension=""):
         if self.logfile:
-            with codecs.open(self.logfile, "ab") as f:
+            with codecs.open(self.logfile + extension, "ab") as f:
                 f.write(msg)
         self.msg += self.decode_qemulog(msg)
 
@@ -477,10 +477,7 @@ class QemuRunner:
                     data = data + read
                     if data:
                         bootlog += data
-                        if self.serial_ports < 2:
-                            # this file has mixed console/kernel data, log it to logfile
-                            self.log(data)
-
+                        self.log(data, extension = ".2")
                         data = b''
 
                         decodedlog = self.decode_qemulog(bootlog)
-- 
2.39.2


