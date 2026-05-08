Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75BDCD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8249.1778224369024717087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LGylHYIx;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d102471a4so16436475e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224367; x=1778829167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHD2EeNVpltxNyjV1miDC5Uysy9+dSp+le1og/y3FSI=;
        b=LGylHYIxTqc6BCZb3tet0TzpBE2wgE+IuAsliubqaTh5cP+xMUCAFESclWIQBMF3EP
         acSPImZthHY82oYEh/hRqIJBQGUnOdAJ0Os7wbhleszaNXyzE971YEWsGr41m2CYES3m
         pcB+IeAMjsa7ueAbU+jzxpFwuodF7zDpkyg0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224367; x=1778829167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MHD2EeNVpltxNyjV1miDC5Uysy9+dSp+le1og/y3FSI=;
        b=aLZtrJcRf2ufIL4W6Q8NORVFRYRVg+rL21Kmht+ddOk8jpL2IWzEggu6jPMz7wzIP5
         RAJXjn5hntjprPTqe/AmxX+mTde6M/jYKWlJ3jlsgZ4OpJGXo8whiHNYzPb679n/JxHC
         W0bB5ItLvgcQOX5nhBao/nrhN0aiGzJDqnZ5iUZDBpCYIArrzzSqMFWlo8hdhPUV8zwS
         FumEcV5RKyCmd9Otabpq/KBfraRlkoNP/RS7DuZ4yXg6vticHXmzUpZ3nUwFf1J5hMUD
         lJ40D5U807UWEYqb/i+lfZY0WTbeDZQGxPDHf37NSIUwHPmOLlftwhAwDms8baApz/+A
         FMSw==
X-Gm-Message-State: AOJu0YzTlnV29ER1Tjbv2qmjp7PPozrno46EHEwzgl7xxuzN+5abwENW
	HxO6g5JEMQ3b2XC+y+uPAs/eQuQoA5BetehmQHjgtAdt5S+wP2CoKmLDTycFV57eTFQCEKEBFfL
	oYrR8D6c=
X-Gm-Gg: AeBDieuW6rBpFFzCkLg0whESO5g+qfR6GmlRk6rmsQStXafvHobEzk5t24ofOy4I4CV
	EWpgUsxnRwKhf6r49D891XYCgPW41qmYddDZQSLtsYJhN6I/opkx5SFu2L1CtnyhslZjx8RkeMq
	zoS4mhLJzTYaPQduL+IykucKdXs5rmU0QQopfEp2Wks3keVupcsMhTvctig96vfklCcyY+Amr+5
	zSrZP3zoisF58WV+0ZU0qzyQZVotcdJ+PJj7B4ZsKg/oUGpvQut8lVmKUE2VLI08+jaGD/rxAge
	yoqrQ10ntEr8CySa6ih/HmTOOVrXighnpUcv1GAj3+7xW/N/j+i5m/mHldke5u56fGptRtvKlWj
	ojVaktkcdeBKZU3JxEhrEzPFxgWSun+FZyVYbTgS0sFR+XnSmNGitu/WfeFeJNq1HZPd8dK6ca7
	PdnjHgsv4iSvgcdP/EfmyunS3ujOuFzEeUtRV0ZoLSdKUNX+T44YwPjzleut8o18pIRKL7JDQW+
	sPW7XakYmVIIr/oik7HsaSNqX0=
X-Received: by 2002:a05:600c:4703:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e676ac029mr20567455e9.20.1778224366909;
        Fri, 08 May 2026 00:12:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 48/52] libarchive: set status for CVE-2026-4426
Date: Fri,  8 May 2026 09:11:41 +0200
Message-ID: <6e77ce9e6e46e90348bdd455a1d419215fa4f997.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236690

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE so needs explicit status.
Fix reference: PR/commit listed in [1] backported as [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-4426
[2] https://github.com/libarchive/libarchive/commit/ec1bc43156b84e12ff363f39005533e6f7067297

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab127fa9d3ec67951374724071a71dbb9121b922)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index a65afb7b22d..577362ef8b0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -89,4 +89,5 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"

