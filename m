Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17471125892
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4761.1773257260562240695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m1ohczGQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b790af67so1145026f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257259; x=1773862059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zBQik64VmUqGsGYBlp62eoP2WydmO22cb9R5G298rc=;
        b=m1ohczGQCXjZDdTUNU1Kt8ef16QI1k6VFMBGAkQoCCx/nC1Vf4AA5ZWq+PFCQGtiQM
         qyA6wkR/OZYqMIvaoHcD9lFWu9CYVbOwCWZSVwihaFd6L0w8z0Wa+Jz0gqVAdobaUObw
         TKwVJTt0t0tsZ2odxWCDBtlM54Q4vIBZyukAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257259; x=1773862059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/zBQik64VmUqGsGYBlp62eoP2WydmO22cb9R5G298rc=;
        b=MDHFlt+Wyaiqz5Tao5N9QyJ15n58DFm+Ltx0/x7VxFajwb6KfKn+GrIEohA4KPG9wK
         05lSr5FO/1WA787INBU5liKAejplfQFJRHSwnGRzV9rVqmySAXIS6s9d0KzbkTvIxDyK
         dNAbR6PlfpwGOm7ZKKKMrwDUjY+f/lrTH0d5zMRBtk2EMoa5+nHlugaBEDij1kLCm/+D
         +LBDWZ7ioUsMdRkyxSsN6uYvJjCbgBzpt9wVCX4rV807b8IGRT4AYCKlE0yjAnKNwbWD
         d/CeuaIrw+w5D196dRz28QJESCp1DmiDgyzqqnHGogFCnfmH4aVdYKF72my/Vl6evCLi
         +BCQ==
X-Gm-Message-State: AOJu0Yy4H8QkRvUHi/8tKAQVzYiLGpi0yMr/WCpA4gJZpJ/KVet2fDLc
	XQKF+0uDuI8SiJmL/IxmmE2QQw6F5AYbId1VYu+xKNcpzzw1c8lcRsoLnDAqLqLuCZyCnumIIoF
	Au8vq
X-Gm-Gg: ATEYQzxQBq0AprvJr7SYCSzkHLXpN+T8RbrKfRgPMbQ/N+RE16xPCMHC3wSE7O/cOC6
	LgofszqSBdTFnXTMRC80ieq/RLR/6CKXH2XEutkEmWNkmk8korkuWRz2XWv+nSEHZv+88pvsP0h
	fJ5afYGCXb4toPuo2dkl5jwgPCzjl22w7G9Eslezz1tjM3GkYnzgsfmdv81rXt4JrzIaYqKKDv/
	00hBekkl6v6JXeK7xLtv6jVod3K6HIMz2t/yZ7AZ8+bvIqhV6ySUDvfAEJPn003oZTpsxa6pr4M
	xwdi6cJ2lnPjB+QHoAF50vkfUTOP3m14YCTgEKLt3fiKOrbDnRTQawCpHzYgYRSRQ++iO7UwjCN
	RezvDbvr0kLrT7Ilde71Z6X6RDB7KKiJPERwNYJtyqHpVswOlwXqgrO52ovOmDmGU7WA5WxP1fa
	ej9GbhuOkcVAl+Z1fgSxhJaU4x1rco57EcX1bEkEmSWmLl612Hy+O9dyfvAIBvv3hxFD/Z8FwYy
	Tqg77K4TVUSviqfghQwsyZF9TU=
X-Received: by 2002:a05:6000:64d:b0:439:c078:9a57 with SMTP id ffacd0b85a97d-439fe1b417fmr1342769f8f.25.1773257258537;
        Wed, 11 Mar 2026 12:27:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 3/6] libpam: set status for CVE-2024-10041
Date: Wed, 11 Mar 2026 20:27:05 +0100
Message-ID: <8cd638d1acec0e03b4d66b49f8bcb91eea50648a.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232902

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.6.1 (per [1]).
NVD tracks it as version-less CVE for RedHat.

[1] https://security-tracker.debian.org/tracker/CVE-2024-10041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8d9ea270288..e83accd8815 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
+
+CVE_STATUS[CVE-2024-10041] = "fixed-version: fixed since v1.6.1"

