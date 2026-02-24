Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7899CF357B6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21285.1771943126638786634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RzjfJxVX;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4833115090dso54050965e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943125; x=1772547925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUhA1opxw67efXt7LC/cOkfghiEqnRR8miTuO4VNwj0=;
        b=RzjfJxVXn5Uj8vdHTz/un/AG0Q48a1WrAEYCebJgmof4EC0vhU4FyoK7vOmoCcPQMg
         Scaj+WzijfIAVyq4/4nBXDofwz35YxRi9L5z4OVm4Yar3RNLA+ouUWeFPdmlbxe3MTCn
         hlTqIthNYC3noXku3jNovLYQWK9a6bnOJ8xtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943125; x=1772547925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUhA1opxw67efXt7LC/cOkfghiEqnRR8miTuO4VNwj0=;
        b=C73DlJ/MpLR7EwK0+e91mWtcSfdCqkXdJhS8wpD8M/XZrLtB8XuyM0Gsn/GolZ3Rwm
         e/N1sn28gOVpCSX6JoiIqsXQL2uUKLU8L7JYZHyZyHLA0+UyNX2857Rt9964iV/axHhR
         xlvEaNWX0itBIugo+pdeLITZQKxTesf4FlhIFuhnbFLKJxWtJpXl6WyiWL8uGmHB0cvY
         2nwe0/HrcYJCgphnWuFzi8NIQ+Q/GMwcYiPg12omSIw6xOPS+P+3Kyc5k0IRFa5rbqtp
         +vYmPv0C++2TR01Q/3UuWV5kCCxpnjCnylN4FEpPgd9E4JY5QI+l8elDxYAsuZ+vy7aW
         xW+w==
X-Gm-Message-State: AOJu0Yxha+MOa/siMDD5BxlXitq6mvmBl/LhMvFNAqAPfi51ULwwlHT2
	9wmTxNOjZmiV1nKvlD72RkPtk9E4N6rNBiLBThE/t1npM8JCzr0V2cp+FJfgDy7E8uDrLl4JUmR
	xpJ3U
X-Gm-Gg: AZuq6aKPKFC1ez8uq1OWA+BFu+FFeulcB6zRdTGlFqj5UIcdyetTn9Xb5OtFIlnwu/k
	mCcq2LGnBthCCApd007nTRxP06Tq48Qd5e7QaVKd49fOjKEC1eF3ux1wvi2J2fIzHPI83Dz87JO
	c1xq4NyWGaJJZ9g7WcuKUGF4nyYqjm+jZx7LfG01ncCpg/v+RW/zQ6gh6PQdp2V1UhISVtXWc6S
	b8Qag2pc4SCcShEbJHiV+vZ1pA2uBxbVUxWxFqYgF8iAwQrAL48uPjpN8aQg6uD30drgJ9FZw0k
	mEqkoSaPDLumvz3nkCjFnp1b+rjFOBS5e5FTh03LeMr0w3kftOWOhcBABOlnaUb0pzjkjpt0WU1
	uRIrkki4mj/1BCctaHpUBaANcavpgpQgOOYodOMuFRWgYEVUkI829VxjxWl0RhU6csYm2+frlaM
	lAmouFWMUyenhVWB3CrWX78VmZ8iBP6jixDpOtv30FCbaFP6ZS9rqyhuIXBiPcuYSaRA+PK2JKg
	JfPnVzFMlGt2u1t9gvJ72iMxxuxbsYEZhKX4p82utJX
X-Received: by 2002:a05:600c:c8a:b0:483:7783:5363 with SMTP id 5b1f17b1804b1-483a95f58b1mr178035365e9.26.1771943124764;
        Tue, 24 Feb 2026 06:25:24 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/38] pseudo: Update to include an openat2 fix
Date: Tue, 24 Feb 2026 15:24:25 +0100
Message-ID: <44898fefdd98e1f515ae1ddb42aea63d37540451.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231799

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing occasional autobuilder failures with tar issues related to openat2.
It appears there are definitions missing on debian 11 and opensuse 15.5 systems
which mean the openat2 syscall intercept isn't compiled in. This then triggers
on systems using the openat2 syscall, such as alma9 where it is used in a tar
CVE fix.

This updates to include the fix from upstream pseudo (along with a compile warning
fix).

This was tested by taking sstate for pseudo-native from a debian 11 system and using
it in a build of "bitbake nativesdk-git -c install" on a alma9 system where that task
failed. After this fix, it completes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c20c05b324e5d6564c8554381019170839509bb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8130fb21356..db3951f23c1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
+SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

