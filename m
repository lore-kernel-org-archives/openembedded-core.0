Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2FBC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.949.1783881816507959909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=S67Dq5q6;
 spf=pass (domain: underview.tech, ip: 74.125.224.48, mailfrom: vince@underview.tech)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6662551100bso3175101d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881815; x=1784486615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=S67Dq5q6jm3HFLWooA0Ck/V3SnemS+hs4gnu7teB3+4OYKqpkq0HrI6jxo76Nn4fko
         rbak5RC2dCj9X/hIaktJv20r+6BJ4s5mTv6kpUnluA5Tj58XVf/MgmqyIeyKhqLWKnbe
         7DYMTRyuHCmQU7ej8ABSYHt1Jsc3JUMZ18AI+rIpZFd5w8k9FyqWFNaErmCXhLXj6M3Z
         Q7R8AdAqa7NO/nBC90J4xjSO1eAZp3Wg07WITqndvtFHQKO4NySsWOVyfMHsnrrCTgO3
         uV75KKO42y+SGEaLSrFVcx0WxLLF6Dty9ZhHGUwTvejB8sW5raAz+CmbwdtvKID4tV1Y
         zc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881815; x=1784486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZE5V+q19E5+KhibF5eu0YBz+rNt1AuLLXF7vNizyN4=;
        b=bqBBcxJxTx1W8qhViW/Ii1AJZAN3U5dhIauV+58lhfMVYVw6L4ewbaBFBCxDul9OcM
         dFRfWEV4kTvkFw/aMAFj/0wdjMPjHnKRJIDA+NtASF2jj7tKklIIMYVo4nj+D8jMlHQz
         FNBoL4aO4VToXnIbt8wN1YEOTREkC0YwNU3TzCA/UU4TqbV332LGwb5fORnjPuELhcAa
         upr45ZKPIBoOulC6wETqp98MOslRWuwV63lkEWJ61wJJVVd7N+++GpG4oiunURtfJWcb
         L71EExcDbgxZM3Tk80aBN1/gp9tGfD1ZLKTaUBDiPfU7X/zmTlwPt+SMSHGiwwqBZZX3
         b59w==
X-Gm-Message-State: AOJu0Yyqlme+YeUiEeCQG5TD3Q5sulfmk+8r+BN+k3lRiq76YR8FdRZQ
	kXYrxE0JXzKl9yB+rAQY5ozMpq5TUwh43VB4KLyjxD+NBgu3ZiEyQ5tbgf63styvG6EyNdSE8Hd
	VOzTS
X-Gm-Gg: AfdE7cldhwA2y9/FJxnCx2Yb1x/1TR/AP8Qf+qH8UvBsWzPsLAe+wTDhHCniovmjTaM
	F0N9nrs2MvftTIkpDArlu/bMyds+cf0OuWQUV4Lej6py0opCF2nT6X4zTTCMfiU/xmvy6L8D80N
	R6yqf28+JBmpoUDH3LB78q2calIbHV8fsffRryRFptpCTBE6PBHmYirANj1tEbeR3U44V04b2g9
	+4NirJu1LqSEnbsmsk4CEcIKBhSOHYWCoD/I1qT/x7zyqwwHdzWPIIlCuF7vTmJH4Pp6QkfXFKS
	rm5+Ca5UIyZ2oSKQTQK9p5y9/h9wW6kwHTNoVBS2XJstJhleuvoSqnh5GkHjY0E9j63Cj7pTQcn
	cfxTGYZHTYV4Z+9EYfZjytOBA5eVREWXRoDquaVAl1PpZ3F9jt0MJwsJg29rWizCfhK9n+Qea04
	ssyNSiD86MrzWWug==
X-Received: by 2002:a05:690e:1909:b0:667:e172:afb9 with SMTP id 956f58d0204a3-667e172b2dbmr2981863d50.86.1783881815601;
        Sun, 12 Jul 2026 11:43:35 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:35 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 21/27] ltp: rename kernel prefix
Date: Sun, 12 Jul 2026 14:43:01 -0400
Message-ID: <20260712184307.3259642-21-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240811

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


