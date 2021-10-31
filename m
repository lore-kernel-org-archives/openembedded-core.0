Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A4FC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:33 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.33244.1635699512820185870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aMsHlFZ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id u33so2146104pfg.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v7QE5I5YJDEpxASMLyLPgfTfhK6Rk6VKG5RwPG96nIU=;
        b=aMsHlFZ7TvrMZN4UfTo1SvUl2rLY04ntngirf85xFYNUkLVb7TwAbINn6iNU+T+TLn
         eJGCeW97fj9+D8pFUdExoofRs7lk+b9cArvhtHv690CBIhwaktd5oy7NBvbohQpkNJJm
         gn4mvpSUWhGzaNhlmMDJfEo2dMgF8p7BFrapG8IgIIFmo5Yani3j096Y7CmAaPkWbY/e
         rLKwzj8weEVl6PoeSctwdKTJh+B0WoZT5Wv0pm8HmO7RKzenYHNy69H8QwGMKiNgCYy4
         lh3nC2zRIZW258fyFI6v9mp4+ayMo1RZdphVGZ6Hl8BCokI5xOw0+Hxv0/6wzpH7UTM7
         L0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7QE5I5YJDEpxASMLyLPgfTfhK6Rk6VKG5RwPG96nIU=;
        b=g7gilUiXSCX7prgpB/dh5RaCYl5hBjgti1zND3SujJLSKyGhVPfskcBQLNvfhewssV
         KUJC2Y1Hc+vHWY0K9OwikaPU0YD0Tkt4kXfTxX+3ppCpKQaNrInlK8yr1dknRO5s4OZM
         cIHZmVgNXjNWa4PMHQFY7NUDyJm6UxtnXJDiHUsUzlF3Lx9sy77jFN20YRk822VRCpfX
         SAAKwS2N9zAPYq5qDjXIIkOTRsSY6XeZlAUJCCESh65B9hX+5rfC1SGBcNwFleXPTyo4
         QiQfnhG6Iw9Ha8NkS4HYVKUCYDhr+/qCQpSiReF+qFTnRLRqlwmSBZbW8DQ171OwFHqU
         tSSw==
X-Gm-Message-State: AOAM5313ICTvMOeg6dt1xPc+hRw5A1QbZC6dZhqUfVnLemFFr/ZsJ72b
	LuLxAaiafPXpd8Sqdn/xbteWPuJMz5fLRRYMQxM=
X-Google-Smtp-Source: 
 ABdhPJwa/sWo4/6iA0kYaLDVTYBake8k0zOODAj5YgtaRASBNDxvIWG/asLwfft6go47ozacLlBDxg==
X-Received: by 2002:a05:6a00:14cb:b0:481:cda:5d56 with SMTP id
 w11-20020a056a0014cb00b004810cda5d56mr1266140pfu.54.1635699511958;
        Sun, 31 Oct 2021 09:58:31 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/29] oeqa/runtime: load modules using importlib
Date: Sun, 31 Oct 2021 06:57:34 -1000
Message-Id: 
 <015f0b03dc384851b3f250a1818a952d8c09079a.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157673

From: Ross Burton <ross@burtonini.com>

Instead of using __import__() which is low-level and discouraged, use
importlib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f501d22eab5dbd565f3f5783f4f484a6d1f70a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/context.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 3826f27642..7908ce1fd4 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -175,16 +175,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     # Search for and return a controller or None from given module name
     @staticmethod
     def _loadControllerFromModule(target, modulename):
-        obj = None
-        # import module, allowing it to raise import exception
-        module = __import__(modulename, globals(), locals(), [target])
-        # look for target class in the module, catching any exceptions as it
-        # is valid that a module may not have the target class.
         try:
-            obj = getattr(module, target)
-        except:
-            obj = None
-        return obj
+            import importlib
+            module = importlib.import_module(modulename)
+            return getattr(module, target)
+        except AttributeError:
+            return None
 
     @staticmethod
     def readPackagesManifest(manifest):
-- 
2.25.1


