Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EDACA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.64587.1756215666517952499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tdfq408O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e202e0so4998993a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215666; x=1756820466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOtuYCdW6LD549/2dsILu0uJd/w/9H9lBhdjs0yuAN4=;
        b=Tdfq408O3hiMjVG3Wg80Yn3ZgD1mhqs83POdVDqfmovtbtM/BcISW5MS9P3Dw4b/P6
         Dd8+UmVKh8dYlrerkgNRQwHVA+l6xWwHVMkMCqq40CtCEm4NsH9YznMHno2mSrPmOTVp
         Hz0tjZ4iFeBcKOhXzq3X0yo3ZgLNe5xmcXKErP3O/hQFY3HVt4naBV27NfF1WWAeu+PW
         P4osXn+EZsj1oll74zSYv7GB3ciPfcIkeft+J5s7fEZ9mIKkhCol9QZEdlBxTI748NX2
         r9ig7Pb70+0356xoHy6jGrXIya0vDeA73SXHzSxyRGj/J28W9rHTs0SaJz/o0v92Khi1
         0bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215666; x=1756820466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOtuYCdW6LD549/2dsILu0uJd/w/9H9lBhdjs0yuAN4=;
        b=wdxANDEktqH/GyDHFJG3gdLvEH9cAE1qJc7Sj+6Zlj4OVvyCpJabrSgPY3SHMwgi96
         kqV7LMXwg2MtL38OHPDmdC1DI9CpTlwT2o4ewj829k5cVleMqD5kSs89mnOrGyEVqs6L
         THYVVk1XUbdnVbC9DFICm98gFZ0OT1qWd+O+vEPGuAytUxWdrCBCk9AZlycORPR7sC8e
         N9PgQcKJL4i4LzKLI11qOOUrHiB+Z1kbZsQVqmVa+pCLK7wViojQX0zjH675yo4U7fqu
         POJ+QQa4vY62T4/frA2xGhZ8nrU54IWR7ZnPRMGal7pIyA6Ula97HKD5gbNc6nLc31xS
         2kSQ==
X-Gm-Message-State: AOJu0Yyb5UW/axgdBahLPtwmk9MzBhA1xRADgg8G1UEUWPewkjzirrkE
	WmGg4cVqx2fK0msj1iozPthvVDPFcV2muHWXHn0aSJkk2msUShtn/RWe+7OvIBnwpS2I19Np3s0
	GSXN7
X-Gm-Gg: ASbGncuk024EAmV5ChFWrAx6zfRypEv23sEKTM4zajS5CB8o8dZBX3QfeBsMC/xrCds
	fPQs4H7gO3smRv/Rz/dJEuy+p3WUeV/eDIaXeUd1ZDFs6u/86/CS5TVyfnTx6YpFYSDW+LJ35YY
	Jg00bZCM0YBG7cCXy3yHoqeyjZEr8N0TKzgs3IHFPkUMT5+Wi2zZ93lcjrSxbq7UUN+fYpdFlB9
	P29r2obGZYsrpke8A/FH6rdN1jQKcWTdUihTN2Q4crdHOwIwHef8XCv+fiqdo/goawbt16sljNT
	rVcMqIFbw6IO1f4YC5ZeYRTIfMBAgQWjUWDaM+bkTEmIHuzoJ0tH2jYi/lPAjR3juf/NdzV4Xci
	o/H1fKMN0lTXmDasJ1lk+Nrva
X-Google-Smtp-Source: AGHT+IEhACNbb5ldMbsL60inoWOMAw99uH5qT8yixvSvV6CAG17snIE6zztHUYutLwFdeQkaSIckYg==
X-Received: by 2002:a17:90b:3bcd:b0:31e:ec02:2297 with SMTP id 98e67ed59e1d1-3251744bd07mr21306324a91.19.1756215665550;
        Tue, 26 Aug 2025 06:41:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/19] gnutls: mark CVE-2025-32989 and CVE-2025-32990 as fixed
Date: Tue, 26 Aug 2025 06:40:35 -0700
Message-ID: <0c84e464d67df1111e62edc5d4f9ad398e19e40a.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222441

From: Peter Marko <peter.marko@siemens.com>

This is mentioned in [1].
NVD tracks this as version-less CVE.

[1] https://gitlab.com/gnutls/gnutls/-/blob/3.8.10/NEWS?ref_type=tags#L8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 600f23683e..2ef71a1213 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -98,3 +98,6 @@ pkg_postinst_ontarget:${PN}-fips () {
         ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
     fi
 }
+
+CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
+CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
-- 
2.43.0


