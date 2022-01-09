Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E897DC433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:44 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.23487.1641765884020438157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4/sPYqYW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id y9so9574040pgr.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AQFtiN3SuBhrpoTyaSkPFe7aNk/2OmyTc+pmciv95JU=;
        b=4/sPYqYWfm+qfndjqDgY2Cj1ryqJys+O4jT4yDesIyPb/4+b+GloJvRwE0GwdjvWeM
         O7sIY5p0nHFqdYHcIwAZSrIBfIh65d8HnTrFswsqR8F16547PX6GYbgBBtktqVG5Fwn2
         2aUFclPFrs8h+RFVsIjVFseEhw3Cr9pQalQS18sQKXjgdqUcNz+u2vA15h8fBvEIdTwF
         ng5W0zTN13VssP3CaTKT0GET6kUhD3orucpm8PQDlpxW6vCt5Pz1hR2XGIuEDWyk/apf
         jZroBASJDeeB4LqOr2xCuegtYMwkJbMuMuz6XX26QtRQDqdovEYja0fM/1zKg7Gmku5g
         XAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQFtiN3SuBhrpoTyaSkPFe7aNk/2OmyTc+pmciv95JU=;
        b=lt0GJwLrk/FGFhYBFW3a7+S2szQIQw3V5dCQ8DBTdcksxa3tautDMwGAKPucj7r1yg
         D2zuxYqKu8xFpTnAXaGWpJW+/JUbdf0yZPjaxpf8m9ZSZAzypwySbEP01mnp+VafUUV1
         6w5FpNHElzC/0yItWX9nORiypldeqPn/lf1dzfEFK9CZX15rBHNWUEwLAnWhSckgO2Ax
         2XsZrFmRKci4czLKTZ5WYNthhSrRGw6E0OvQIWtSkWGwVUGC38zBQch8DP6W/zA1wTgB
         3BjS2+zla++w+PA6kwrd10mJB3FkwT0+QcDnPwcIcygfynh3/6/TU5s3k1AaHBEMN8B+
         dw7A==
X-Gm-Message-State: AOAM5313qda+vOESHyuzFY20sEH7xRicgG0h87QEUItSS0LIu89T2ren
	go70P+fi5f0ocWJCUdPglBDOT+L83YIp/PDKqpg=
X-Google-Smtp-Source: 
 ABdhPJy+Tt6C+Y/YAOKVkPj167qKYyILhk1lW7hTDxCFQHS3uAi5DRbFREB9CUIeivR6CN6q+jJDsA==
X-Received: by 2002:a63:7543:: with SMTP id f3mr9083711pgn.360.1641765883164;
        Sun, 09 Jan 2022 14:04:43 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] oeqa/selftest/bbtests: Use YP sources mirror
 instead of GNU
Date: Sun,  9 Jan 2022 12:04:09 -1000
Message-Id: 
 <cc786c759c1454340b72805227f2181d22bd7080.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160296

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The gnu sources server has been known to disappear. Use the YP sources
mirror instead. If that breaks, the autobuilder is broken anyway. This
should reduce test failures from upstream network issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5459e42f1a6be9c08f303653cc1f73514eca9ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d4f6a08991..e659be5341 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -157,7 +157,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
+        data = 'SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-- 
2.25.1


