Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F8AFF60FB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:57:29 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16608.1774951039839327222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=dz22cefi;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-66b0c0c0dabso727264a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774951038; x=1775555838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=dz22cefiJpHtAdTPFG7Ya7Pxdu58tXRNMHTiotiUC9UfSokXj0c4a7GQSJtcp6EGQ4
         9p4PPkeYTgtLA32KXKJJ989K0WMy++vVaJOwcYqIMg/gN0w0JVMs6YuqJ+uuq7jmAvli
         7NT7GQNkZeLuILx9WXUfbQ1cA66pEn3h+0UoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951038; x=1775555838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=mJ9jUctPv++/bt+8fa0Sn2rOOTaigduzfqpWvA/Mp7930Dpa5eM8nQ1GDUlx2DYlxF
         TBLLmFcdkhhAr5r5M+MbTCmcgivnAQ2wT6XQTmdD6MiGhP3ebpgxFLX9biqtGr8henhm
         0sYeVhvV4pSrB+uGpUimhyUGTm4RpMsmERP4cTx1YTxCCgw/IVl1cfpxy78JRNRkdjtH
         EwAnIHM7OezBlWPU1aFgYUKe87GRX2e8rACmPpZqIuamjChPgWT+G4nNfeV1PkfexD8h
         WsvMhO2M3F7QVlyYeYCg1NR9YKy5V09QfX7BvRGK/wea4mHEIKxdIfuRQEqReCmIiRnb
         iWhg==
X-Gm-Message-State: AOJu0Yzn1Fp9s8mR9jMItpLPUfmjUF+eqaagJv4RIsVRs82eHU/HTz+D
	jOXoVoZ0QO25OvfhAqoG1gL4NdbqnavKtoIwvHb9WZ/XDWoRtGcfp2N61Wo1TDt0e9c4lVsA7n5
	og+YsoyCw0A==
X-Gm-Gg: ATEYQzwAvzi4Z/PFmPRLnraUj7QUv73RxXKxJdEgDJEpuU/laVEwnOqUOlooD5r+WX2
	NtjSf0YUzd6C/0rU/nKQopk+qaXQnhPSTJD4rnqdhJiEvjEst1iO8XmG0ysa3Ti3Yi/7dzoBZAZ
	SwewFuLPonugsK3GySj6m+n+4ILj30nGjlXosLgvO7BhI+Ne1+qXebHgahugYm8DN18IJ20GJLU
	fpeANXdnhIuO3wV4zliZycMsa15a5zJFPzJ7TuD75cCnyWbzN5rf6LQ7fx2XPeylUTZ2DB5ICGj
	Nxe3TezNY4Mp8DJyt1lSVRlz2alNIsotrwpBvLqg7ygmX/n5BrrRGrt2KUcDcxbcG4LnFE6TzG0
	fwJMqJ3Yr7Usn5hw6vvm+7rWOpYVjwUXOVh5CtfIIuCaiOA2Z/LEM5Lwp/OLWbvqZ43K4u9N63y
	XL4QqRfwM+gKdpUvr99klVevB6chv6mh00/9RID04hyC4YGlGk2canvN4Nm4eosK/q/ws1pbxhV
	bBrlW8sj/4=
X-Received: by 2002:a05:6402:430d:b0:66b:b6e2:66c8 with SMTP id 4fb4d7f45d1cf-66bb6e26840mr2294999a12.4.1774951038152;
        Tue, 31 Mar 2026 02:57:18 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7607a653sm3413599a12.24.2026.03.31.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:57:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v8 3/7] libsolv: explicitly enable comps for rpm packageconfig
Date: Tue, 31 Mar 2026 11:57:09 +0200
Message-ID: <20260331095714.1285106-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 09:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234274

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index 852e79c45e..8a941ce4b8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.53.0


