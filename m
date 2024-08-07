Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293C2C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:12:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.31957.1723032755237439365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPKX/7+U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so928872f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723032753; x=1723637553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5ijgWsf2wsdxzrsSBsTMOvRDq0fX/lUwAWn8/ovSIw=;
        b=SPKX/7+UZj18Dy5f8iZZkRYSBuRFOWC/MzPqtnx0hWmUe6591p3XmK3z0PA8cjCekp
         RQrg8/tfqQzgBHJhp9RVR0DWJLQ4cOitbuUZeanwfEdwSA954ZvjzMZa3o2ZH6Ts7vku
         JhIeZf5jiUY1CZk1eWeYYP7izAeNUCtJhyB9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032753; x=1723637553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5ijgWsf2wsdxzrsSBsTMOvRDq0fX/lUwAWn8/ovSIw=;
        b=fyO4XtHoy/0YIBYWvud9Pz539KQ5KMcPqbJYZ53g5jopC1uVCo+ycZ2S3pU0tlIFUK
         vfjgg8gmMy7if2BN1gR8aqf48p7PURQd9Wn30RqY//b2YP2cJ99l5FH7zsb0OZk33DTz
         9DL6BOt4948M0bCyeoKG4WgsTPFRstet3LRuFpyTZmkFI+or9ygByg0O5i+7agKqxvpz
         6OUe9WW8MQ2cf1m7zbsXe9nI/Z+TbS8CHUmCCpS4cizekiOJ7kcnOsVbHI43FaqVC5kc
         SZ4rAkQBc1S6zgm+Iefjc4wYMj6cXxwn+9kCjOFEssWgfXxSUFXywj9TyEZ4SIyRHIhd
         a/ow==
X-Gm-Message-State: AOJu0YyUyqhUynIWl7VDNQz6r00UJfZSTQCzmuMaRusunRdZlMD8HRzV
	9raCftO8yswEnPR/pf8oEABk1AP7vuYHuaIdcafEPZ9onK3SWrM/7RGcxig6VhAR9I2Rth0yra3
	a6Vw=
X-Google-Smtp-Source: AGHT+IEOROzbZzcLpKAVktBaZjQRkwUSOrXLpibAwAQkgdMYShYm637Cx/jT5gFigUyA0+kiHoE8Xw==
X-Received: by 2002:a5d:67cc:0:b0:368:48e6:5059 with SMTP id ffacd0b85a97d-36bbc10cfb9mr11962544f8f.32.1723032752897;
        Wed, 07 Aug 2024 05:12:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff8:c4ec:1a07:92b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0de1csm15941697f8f.4.2024.08.07.05.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:12:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] perf: Drop perl buildpaths skip
Date: Wed,  7 Aug 2024 13:12:28 +0100
Message-ID: <20240807121230.185087-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203067

According to my tests, enabling perl in PACKAGECONFIG and building doesn't
show any buildpaths QA issue. Therefore drop this INSANE_SKIP as obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf-perl.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf-perl.inc b/meta/recipes-kernel/perf/perf-perl.inc
index 491f54c3280..f3eef75a905 100644
--- a/meta/recipes-kernel/perf/perf-perl.inc
+++ b/meta/recipes-kernel/perf/perf-perl.inc
@@ -5,7 +5,3 @@ export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}/CORE"
 export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl5/${@get_perl_version(d)}/${@get_perl_arch(d)}"
-
-# The perl symbols CPPSTDIN and CPPRUN embed the sysroot into the
-# binaries, work needed to remove this
-INSANE_SKIP:${PN}-dbg += "buildpaths"

