Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A18C636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5.1676236284015063975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sMEfbluc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id be8so11624670plb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hLCzRFOCaQnrOi3mt5GZWtY+0kV1jxmls3JOybjl38=;
        b=sMEfblucM1LOLWvDbi9IgaNwTDjqbWyv+DMTOi0pWhTQ9sefhmtLXE3Xi/dc6GcJQi
         i5PfAgrMWpHAVFuCEPcn7CTkGhUMYF3sUO79kTEKTS12U3uJojltMZTOe/bPznJPbIQu
         kya34EmUsvqDzWp/vGOijexyG/rGoKJRlyNxul591bBBGmRgk2tx9xx27y16dphl0g2O
         9We6dgmR2+ouUdgb670OO8Yy5KXShn373aVoREhqNEAzZHwGUVR8gXz/rTP7VkKuDmCB
         hg2udx3ELQHIm94hJK2kwTbg8Mq2EeZzS777//SN+YUtJZr0EGGSwMrKelz0nonmx8Xk
         0J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hLCzRFOCaQnrOi3mt5GZWtY+0kV1jxmls3JOybjl38=;
        b=IeOsGKcyzZQquiZI0J3HSYjDMm+T8SdhtJTcNpQ9QGLz7Z/cPafVTjCWsToLKhTU4E
         rEJ0Brh4YojGDQYJ1PUmh9yM7qctk9BQYrORuVu2kb9oMbi/j3cru/TXWsXTm/3Zww/o
         mSKM6RpmRg1miHFkO8YUrBf9QagJybpu9qwzqkteTbjyjd2XqKqR9XTFlUWNTnq5gdyC
         VeLGip62SMLA+iSqY9TwjkTxpy1XTPTABMAmbaAjGAFhd4w5t5CPegqzNCYZ0mGj+UrV
         sFKSkO9dxGO7fBUh5YN3XrhBMQKjmkC3kXIENZvkgNfe3oNG2uP+zTs2f1lnbfLdNwto
         806w==
X-Gm-Message-State: AO0yUKWFKxZ2nttJJL2RIQYw4uPsWiPv7b80g48qgkvaksIJVX0XrEGw
	8qk7ipE+Sk0dMf4TCbC4e2lxfQFTqjRwnQDVF8I=
X-Google-Smtp-Source: AK7set8Lo8sNdiiLJ16sCVxy0G7so8VwbjfCGk/xD/+VaeIoWTsdF299s0lA72QU+yWlcXh1JYuImg==
X-Received: by 2002:a17:902:f1d3:b0:19a:5a0a:85b with SMTP id e19-20020a170902f1d300b0019a5a0a085bmr9961561plc.66.1676236283098;
        Sun, 12 Feb 2023 13:11:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/27] httpserver: add error handler that write to the logger
Date: Sun, 12 Feb 2023 11:10:33 -1000
Message-Id: <dcf1dfc053c058a5e03051320845e278b9f81b75.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177060

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4bcca3123685f410fc99e5cc23f2b8f39fd0a63)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/httpserver.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 58d3c3b3f8..0d602e2dfa 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -38,6 +38,12 @@ class HTTPService(object):
             self.port = self.server.server_port
         self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir, self.logger])
 
+        def handle_error(self, request, client_address):
+            import traceback
+            exception = traceback.format_exc()
+            self.logger.warn("Exception when handling %s: %s" % (request, exception))
+        self.server.handle_error = handle_error
+
         # The signal handler from testimage.bbclass can cause deadlocks here
         # if the HTTPServer is terminated before it can restore the standard 
         #signal behaviour
-- 
2.34.1


