Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7E6CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:52 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28955.1781815005201212416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=VmA+zW6H;
 spf=pass (domain: baylibre.com, ip: 209.85.160.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-51780bbc560so21390811cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781815004; x=1782419804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opohMB5wD5R/oo/RNx4M3mqJ3UEXwcXWirZEM0oTS0A=;
        b=VmA+zW6H4SFH1fPl9qWD79TFcK9LeHmFCxZImMtjx41prYQxXf1p/8SKQANzDArq9k
         Y4c2zhHt+1pTrPE36n7zc+QlQT65fb+Hm26qy57v8J4d0pMxR1GOcrD0Y8G/d8yqDpnL
         0iNQ/6VmEdNMiP9awW1iPzmC7B4z7wm+yarVoYOugXFSwEApeac9GTfPm4UtH6nSlniZ
         LVbspJBEA51OzAaB6x49TRIKekfZIoJ4V4fOcH5PDlvc3n866KxV1bM3JkHcF9SXCg2w
         /4Npp3BJ/wicOoBo2d2Vvi+c3yxNHOixNDO8VQHDpYFpAwtxCbpHLhmZk+MWYWefel0l
         w58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815004; x=1782419804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opohMB5wD5R/oo/RNx4M3mqJ3UEXwcXWirZEM0oTS0A=;
        b=AK6SatKDkVCrY7VxJAwZp8OlVQTHJvRdwstbd9wDayV+R+Pgn6UxQ/fnoMndV7U97p
         iZfSY1GIffkdQr/C+BxZ1NOSl76VDCU3Ra/R3wn1IkE8+ePbm9k86GqQmIq7uxThx+Vp
         yRtM6dujJM+rjPVMaq4UWMegx05zX8HtGEWXNAoMx5KDNaFjGHZrXRE3mO3s5E6SlBiP
         OhRVc/RQb8HelkmbEghhDb81N+QTr32oODXOiYBBicESPIsMigpYGKq3Ll7OfdfFTF3p
         DnvcMelPpiUB++rovq8qfBUGGHaVc8H/RD7erwt9/pxlinc+Fe4uXriYPxxf7E4MBhqx
         g0Ag==
X-Gm-Message-State: AOJu0Yz4XqHdINrFZjJT4YEDSx3VvBHvK2mMGfg/Fg0NCRL9uAJMLqhL
	TQY9JWvLScfb5ZW9n/eVs1gQLbXJOnvx7iqA8YWj1GZILmQdl/9gB03TpuobHcJcZsxgwfAsmf4
	nrfQfBb+ZKdOY
X-Gm-Gg: AfdE7cnue10cWr/+ZTU9LuDwYnwM6pwvPeIz6hf+usH+cLo2NgGntkE+92fiZUCZOmM
	3BwugzPT+4RL5k6GG4N1ByEVT/grHd5DYH7420r8WRE/dFydce+3+58bgV0r4bDKFNio4kVIlcR
	KMs2F7QdjGGm3WoOJ//HqBd6ya+SiauATSLOrJOPH/mtmbTQTQz+weJVeSBoVFM7mKqwV04AmAe
	jKxox4flkxD0jKFNVZSZvHAEmMakjhk7kvPMEgUczDaOuVjxUPsSsFwH+8qiDY4MsrGqp2ac7L7
	o77EcuaKZ7TdsgL+l7RADIccYP4aThuT8IbMZQHInkY+k7n4+axsal2yHeB0PLlTbXHvOFvTMQg
	res7DvWcG8lnbnmXvGKQ1NH9f6iRzVruMBMGR/XhoBtgP+uwCM7A1uYqbB8SSGvQUT2Kl9pPuu4
	KJP1j0/o2M0G6dj6/y
X-Received: by 2002:a05:622a:5c1b:b0:517:70a5:c875 with SMTP id d75a77b69052e-519e67b85aamr7880731cf.14.1781815003885;
        Thu, 18 Jun 2026 13:36:43 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-519e4e105b4sm4295781cf.5.2026.06.18.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 4/7] scripts/patchtest: simplify traceback logging, remove whitespace
Date: Thu, 18 Jun 2026 16:36:29 -0400
Message-ID: <20260618203632.131125-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239105

We currently use the logging module to wrap tracebacks when a failure
occurs. The traceback module is sufficient for this task, so use it
directly. Also remove a redundant import of the traceback module, and
fix some whitespace in the getResult class that was missed previously.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 795fad511f..aef80a86bb 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -30,8 +30,6 @@ loggerhandler = logging.StreamHandler()
 loggerhandler.setFormatter(logging.Formatter("%(message)s"))
 logger.addHandler(loggerhandler)
 logger.setLevel(logging.INFO)
-info = logger.info
-error = logger.error
 
 def _format_test_description(test):
     return (test.id().split('.')[-1]
@@ -56,9 +54,9 @@ def getResult(patch, mergepatch, logfile=None):
         shouldStop  = True
         longMessage = False
 
-        success     = 'PASS'
-        fail        = 'FAIL'
-        skip        = 'SKIP'
+        success = 'PASS'
+        fail    = 'FAIL'
+        skip    = 'SKIP'
 
         def startTestRun(self):
             self.repo_error   = False
@@ -84,7 +82,7 @@ def getResult(patch, mergepatch, logfile=None):
         def addError(self, test, err):
             self.test_error = True
             (ty, va, trace) = err
-            logger.error(traceback.print_exc())
+            traceback.print_exc()
 
         def addFailure(self, test, err):
             self.test_failure = True
@@ -132,8 +130,8 @@ def _runner(resultklass, prefix=None):
 
     try:
         result = runner.run(suite)
-    except:
-        logger.error(traceback.print_exc())
+    except Exception:
+        traceback.print_exc()
         logger.error('patchtest: something went wrong')
 
     return 1 if (result.test_failure or result.test_error) else 0
@@ -227,7 +225,6 @@ if __name__ == '__main__':
     try:
         ret = main()
     except Exception:
-        import traceback
         traceback.print_exc(5)
 
     sys.exit(ret)
-- 
2.54.0


