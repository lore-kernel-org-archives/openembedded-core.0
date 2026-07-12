Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5659C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14797.1783866583987982133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=CvFGRfJr;
 spf=pass (domain: underview.tech, ip: 209.85.128.170, mailfrom: vince@underview.tech)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81e86df8987so21466907b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866583; x=1784471383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=CvFGRfJrPokiA1Fp+8L/tXcirvVxxGva3BAfRbWPFeOy3oCm9b6oTCNgk0Ekk3AezB
         7/C8BWgqlAN1tE629JrqzFkUJP1DEtD/Bf8BYhbDjzN9OGdzkelubM4F7iEKi6CXxukp
         EX1N4byIU1XZDKhIU2mFb6FZs5jDIbFNM8J8q8JDJ5ubbhesw9XK/nqKuq+7N/OQ+Si3
         CEoscLapm1JjdR77yCs4n6p5pzdm8d+Q0tf9xtOhBnehwapf4Zr7S3ZJRoX3u3gUITnM
         D/YfwMmnBM2tXSNhwMlE+7MoM9b5PTjr6tx+B+DNDnTLS79bXIneuq3dvNuQjHlL5/u2
         4/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866583; x=1784471383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=c2aiCoeB+KNyO4hLRHG+a0uORhangqpmbbpPpLDS0ZiZ+/Skl+pKpN/6oMDPZEyTyu
         RUc2c0uCSQSQ2MDkkTyD72gm4GPrJoQpAyjP574BEGtzsBd9rbuXOrj0SacV6aoStCRo
         ABr5/KiP3QVWqOsRgYrEoD5CD3PCv9WucPgrnxeJN1pJZIal0G4R2wM1Icqfu3dC4M5Y
         Z2XBKvM7fgf+pD4Ub90bRvbZqwYsCXXSAWJbyoxB5TKcyYtqnuTvlQ+7014gSzTQydFw
         k5YUSWHLwfYqzTETomVOw+JS8jbLOF6VfRqkvY6ZekOAR0p97DWWTbXT9XvDseuRq3fn
         xYAA==
X-Gm-Message-State: AOJu0Yx6/U/ASpzujp4DYijQN1V8QFUe57QAfwVKgjKYdam575Krq3Rf
	MNiZ5X5Aujck5N1mNhRVxSCwb9b9uNR5RIdVhXI+e2pUG0/UfqRDYhxGVxaFTwgMu0y9wHrgBxV
	W5GWn7tA=
X-Gm-Gg: AfdE7ck4fty5HW6mKHbJCucdEG/XZqqD4i7gHyq+LPjIFOV7ISIk65+KSZX1qS3d97z
	qS40HUUmFJ4zo27OOTGCP8ihjuLDbbVzg6xtuSt7CkjVHNoQzRn0Pv6UnBeBDGAww21oLw/hzcp
	N0xC3tv3ue4fjMOieSWbY4kSsqUXOWVJDjgDtHEsZN3MKygNr2kHe219r3SaEWvYl7G9X8zEuty
	OdqRHNJcTpd4kUkpEVcIWGJypgAQ3mazs61sq51+sz3poq6I18e/B7oCywqRZlCGVEJViP+I6Ht
	VYcOU6bs3z8eHh7nKhjYJTXyaO7knGpSgrRzWsqUKXER0QkeDmWHiUeYuOph2WFbz6isbpaI7up
	p9ydVubPhSic7LrpiXZmB7ew8q84edcgzc3EhxJlHhtBBq6hNFPkx3RpGa69zWhrg6LSxzfuKAh
	RY8m3UZkd1h6tpGg==
X-Received: by 2002:a05:690c:46ca:b0:80c:85e5:875f with SMTP id 00721157ae682-81e90340611mr42483887b3.72.1783866583007;
        Sun, 12 Jul 2026 07:29:43 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 21/24] ltp: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:13 -0400
Message-ID: <20260712142916.2573370-21-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240787

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/ltp/ltp_20260529.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20260529.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
index e863503200..58763f5d13 100644
--- a/meta/recipes-extended/ltp/ltp_20260529.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -121,7 +121,7 @@ RDEPENDS:${PN} = "\
     tar \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-loop"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-loop"
 
 FILES:${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testcases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_testsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/functional/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcases/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuite/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/testcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
 
-- 
2.43.0


