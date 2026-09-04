Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F9C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:23:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14935.1788531827314301375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cz6mCw7W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b9320423cso11497405e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788531825; x=1789136625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxhIhNK9shAGgcZdWeSn0yqOv5EXETilWpL8UMa+T04=;
        b=Cz6mCw7WHS5u/vs19OUHL2eSA53br5qJFD2NHUNhKCzI6wKnNPs0ssgmGJ6k6QtnTO
         UyqfrUlO+cyOsuW6cuFtlp3t03WZBN/9dLMToXvify3YhamzAuDdfWQtJ7mJB60XOj88
         leQ3bHWynhRjM8FVDZeCt3BYAP8mNsAVG3pOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531825; x=1789136625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OxhIhNK9shAGgcZdWeSn0yqOv5EXETilWpL8UMa+T04=;
        b=Azost3qhekHGFikd9PoMUxru6zhh6ktoxLhFr2uiuqjbpTYeoAHceN++xfeEpsrc8d
         /D5TA3I1hUz2p77DPT90HCN6yRroTRUIq0KRYUmAWoHizQCEGLIUr9hWvM4JBkgtxn/w
         ZHbAZgAgyUYeiMBo6BaHBimuX09sAQdqoPuT1QVnHFLOO2CN+DT3sK4/+yYMJi+krIce
         +c2ErzfT+Y8xuOnyvOkop/Tk3e3PijjjIJWHk7yK1/Y4h1tCf4WUF6tueDe6q6m0WPj7
         V5f5WA4F/JuUTC0LEdi/o1ZejCmN69NsuoJNj6sPlq/UfHslC5DqnME3XA3cvBw2EUs3
         5wwQ==
X-Gm-Message-State: AFuF++nWy3Gr0d66CP3W02rnS6RVej+AdNAP5G/v0mKafLxzn51OxZJD
	M/mcc1FMms12pKKZIZrXlC4iDMg5kX+TyGOiKeGYcwkaH41m5av9igEW8XWhQs/mliirS4qkC0d
	hMHCIHiw=
X-Gm-Gg: AYBFou1L5Pb4JpPqkvigluvM/ns1+YntKi5qNPE+1zZ+6aYQNCTxpD/7vfk3JL9v+eX
	z9bPaS9ZUka2Vmt87ecOJ2e8BmOeDzM+QQil8Dnq8GosK9dUQaq6ntRYdW+OlKsho+t4Vt1DNBZ
	41qyrsoM+AuYUhFu4S3bwAyUnRXOrAxxtQcApj7dh9xHKUFefpw3FEA7lvcytM4VgEibAK92m5k
	xKNW3a8BCY/Xb4fUGVztKNzLGwOtRrxx09mzsaRqt1lkSCTEN6ZB9MNkmguqSjuMIsh6QqMzOcr
	vpJIBwYJYtjCAAG/f/1Q6wyHf+XcmdXHFfCijeoLUzGG+jL1qeYey3L95VxNBopgj6pUYlanYte
	UOlKOQ+5YR6H8NGDywHKJ0Mm7bdxMMRwfIbGuF3SM/O8bd4H+l9Ga4kTTtBc+1aIj5dNefOS3y2
	E3ff5fhWJgOzrGOSp/qmXftP5ujuJyN7876gfc9nzAw3KpDsKOPtgfSARKELBIjwY5CsY4T+kyU
	nC2DDtPejsWA4gzgA==
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr120230005e9.16.1788531825184;
        Fri, 04 Sep 2026 07:23:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm137868375e9.3.2026.09.04.07.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:23:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] enchant2: upgrade 2.8.19 -> 2.8.21
Date: Fri,  4 Sep 2026 15:23:40 +0100
Message-ID: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245117

2.8.21 (September 3, 2026)
--------------------------

This release fixes two bugs in composite dictionaries: first, if any
dictionary creation failed during creation of a composite dictionary,
dictionaries already created would be leaked; and secondly, the broker error
status could end up indicating an error incorrectly when one provider or
language failed and a fallback later succeeded. Thanks to @lpyuu for the
report and fixes.

2.8.20 (August 25, 2026)
------------------------

This release improves the man page for enchant(1), mostly by documenting
Ispell command-line options and pipe-mode commands that it ignores.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../enchant/{enchant2_2.8.19.bb => enchant2_2.8.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.19.bb => enchant2_2.8.21.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.19.bb b/meta/recipes-support/enchant/enchant2_2.8.21.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.19.bb
rename to meta/recipes-support/enchant/enchant2_2.8.21.bb
index f5d5897fd06..49d953a6c87 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.19.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.21.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c8d70991d544ee39274b96bd01d2858a009fe732ff43f2aaf605fd61ecd06f60"
+SRC_URI[sha256sum] = "dd2a762697c463148a8f59867089a5ebf2dd1449d869f93764b76c12bcf8acc0"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

