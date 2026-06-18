Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A259CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:52 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28659.1781815002075217781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=GL3EJLbr;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-517b1f2c6adso12965581cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781815001; x=1782419801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5qM/1zj9yRzMmx8j4swpdTHghzi9mj2VpPGAPaDfo8=;
        b=GL3EJLbrwyPPbENaPDQMZDXhOjXPyi2Ti85uqtZguwhP/vifQdrO9P4AhqdOCaklaj
         fNH4/tC/9hWTNms0rOFS8gkMCmmsWlk3N414RCC1jDqsoyXE14f270xLIRokB57bslIZ
         XWukNFi8Udg8uFYbyRuROymR/B77+jCLNkIG8EJwQTgBeAvMCx9Vqbo6Rwx9qLZyKolS
         WyxXz4Xc8KWngnso5icOEG/7e2VB+2nVR9cVMxGbcWJiOqlpwknO1xSwDZh55vdB8Lj1
         AzCQpZUa0byQW4rsMatlL69w9Iszl7TeF16ksM7SPjAjL8LWImztw9EyP/0tP5GofXfZ
         CPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815001; x=1782419801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h5qM/1zj9yRzMmx8j4swpdTHghzi9mj2VpPGAPaDfo8=;
        b=R1YaoTx50lAb8tgRISdf1zn7C/YoTLsDH4kDO+XkC59Vswu16vCVonwdIkqjkJqwwc
         bH5QREodpgKTJOaMN4tQnhZeVAmmRYMSKiyx3KyFm8ttyK6TVb3VYnvWWSe0nbD1ta+0
         ExgPF1+kA0OntpFNzARgLC6uavv9x7ECz8wkCs34C3bhm1UkYjJYfZAYyVAT+F6BbcV4
         49W/hMNCIfY0hpffsjYYbm0L7rOabFHAtA/KVALkyFzJa5BV+mJ1x1X07SDSQkw/0NEn
         vLa30N3jwp0EEKvJdSzZfuYXkLK952908XmLVahytvChL3dj8cO+SOQICjWXPdP+WA3M
         x9ow==
X-Gm-Message-State: AOJu0Yw56rUzSiaUs0xpZooGiPQTvEvySa8CL8KVx1Afi91dFw7Cz47L
	A2aHX4GIAxKCPazubK+PwWyZYGf4NMftyzdmxDqf1Ia4/oinihlSeXA5TOtWSe0F1OnuUv1lp+j
	NN90+rqZwMg==
X-Gm-Gg: AfdE7ckPmPOUQewzb8hm0VeUrMjwDDJ9piMGGbZyiqCKjmN0yXyzk6ZJy5uGLNWkns9
	ijiCpJalIHINq814idgibtHOMKroV2uaT445zY2qL1tdLrfQXYLsGbwF4yo+Ryqxc1fRmnSHlUT
	usHeZXbo1dKh3JYQgVPPREss4O2WvxeGd1m/yEvbJwAguEOZGGiHoaKQwPwq1dp85mhthkYIi37
	fAamresud/GZwKhQMorlTMkgJvp1BrijR0EqqTr1R00LZSGL1X3UL5gymG4MiRHfhX5syU8Odat
	Tg/YupD4hK7ydtT2fjQj5VLR1ch4AzggIbWETJG+nbsQkkwCF738iO36hon7A0mcqYWRxKR/zLM
	ZrB+P7XHRh0tp6I8zatmfBCGlMJ3JJ0e4GdvCBrDiExYR886u9gVuYApefZW/bQxktsffPI2sxm
	bVhL9zAvkk0ScwvexC5BJ8s/Ky+3w=
X-Received: by 2002:a05:622a:4209:b0:517:8315:d6a5 with SMTP id d75a77b69052e-519e4e3b772mr10689121cf.55.1781815000832;
        Thu, 18 Jun 2026 13:36:40 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de5e132e31sm2235466d6.5.2026.06.18.13.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 3/7] scripts/patchtest: simplify _runner()
Date: Thu, 18 Jun 2026 16:36:28 -0400
Message-ID: <20260618203632.131125-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239104

- Use the test suite's countTestCases() method directly instead of
  creating a variable
- Simplify return logic - we still want to fail early if there are no
  test suites to use, but otherwise we can reduce it to a single return
  value determination based on the result of runner.run()
- Add a newline above where the 'runner' variable is initialized

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index ff8e8b11bd..795fad511f 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -123,11 +123,11 @@ def _runner(resultklass, prefix=None):
         pattern=PatchtestParser.pattern,
         top_level_dir=PatchtestParser.topdir,
     )
-    ntc = suite.countTestCases()
 
     # if there are no test cases, just quit
-    if not ntc:
+    if not suite.countTestCases():
         return 2
+
     runner = unittest.TextTestRunner(resultclass=resultklass, verbosity=0)
 
     try:
@@ -135,11 +135,8 @@ def _runner(resultklass, prefix=None):
     except:
         logger.error(traceback.print_exc())
         logger.error('patchtest: something went wrong')
-        return 1
-    if result.test_failure or result.test_error:
-        return 1 
 
-    return 0
+    return 1 if (result.test_failure or result.test_error) else 0
 
 def run(patch, logfile=None):
     """ Load, setup and run pre and post-merge tests """
-- 
2.54.0


