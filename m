Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C297CA9ED2
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23424.1791708062204457840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AfYgngzo;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a020e65269so5685925e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708060; x=1792312860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iaKThuqlZbIuVaurpFXZ3Wv5Kkr5PlG8vNXZzfWfKxs=;
        b=AfYgngzomiMpkdVAsgO1t/F2Zc8Fdsj51F4juC/O7pGcWawp2LJqg4aaY8BEIJpZh8
         Xy7yMrRK195JmqhU3NkvcY1bZaKnk3ypvc3JiIwzrqlTvBjjkyBI1RBtZmwjjuiIyWiF
         0LvjqZYkFTIaZ0l6XfKCTHtnsU+pPSEm/NaQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708060; x=1792312860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iaKThuqlZbIuVaurpFXZ3Wv5Kkr5PlG8vNXZzfWfKxs=;
        b=MDYZ8xMgVJQbKVdAbxe9mN+nYd3+QLkCdjYxoUmzOrZHYAZY7aJ0ANOEZV8uGTypeA
         JtnTPU4o2uGiwCPW+XdJpvfcg8CAM5U0uIL8C15EbP9d/252HBDvlzI12mZb+NElcUDD
         SBiGOdNzWIPcseZAOr08WCxVUrHq6bm7Jvzh9TmCkQcNZ+fW98YNIz3qBmQ8W0klFLxL
         rGrSYHUPuInQnTOqee2cK8aInrJVlQkH3aN3n97cuGOqdb/aj49RX2l2b/6tspSLUbA8
         MHZWL3IpyA5Qtrv7nmSltqE1aX05YcGjwcpQuz0krfezaQ6xKS8hxBFkQxl2fqIr65hI
         oyuQ==
X-Gm-Message-State: AFq9FYJk4FAozSlMdxKcYjUszy33GxOIN2b1JbrC2EPYvp21KY3jiMg7
	oqRNzX3m3Zj2oD33j/9juOjXNUNrll7zrkAkCGMxiIbEz5nJ+VaC6gqyYsfFGKJxH8+W2TC1pAg
	RDaPLMQc=
X-Gm-Gg: AYBFou1tLuCeRh2uFHu1dje7jPOh4B2RyEqZ0WE7BeNxg8b1AHxLyRQWNscAOs/+Dqi
	NK6D4Zzcpxy80sXgXc7Q2Fgbh1oJJGOb+C6jtzvth/t+GXXWa0DHu/FVZgM/SkxO+Omug0w7wLS
	KQAiDhn750dqJOfagT6x/KtEuDqhF0RGEUdBbzYdn2klpjAdrSEyb+2dvHRIUBFRGfRSSW2bniz
	gNv8i4l8UnygrieSzNhTshaAfCcM9mZ3EF7w2wtm2XxXPI7esGVvCI4A97FnNaQtwZxPsViAC60
	XiUQChl+65g7/qMjL2jPUDEdcYjmPsGrEBrufm5Gc1B/lRQ9WjtFeehQ1X5f6rpRY/R8Ylss0MC
	Ije8v/bDWUsuo0ZOJt1hh+UagjsWkU/0hUXN2mIHwTKIP1e+XFUnQVn7prWEQyZln1OQhNRZN2v
	/G5bJzzKI2XlyAK0Nt1VL9wb/LPOPHxrqjCJZLFYmFQnb0qOawjvM/N33DVb/Ae+LidAkMWMSLA
	5Ds0QKWfuY5F3dOr2Vi7seSfPrPxU2JGAX41x4tV/gK2WD8Bd039irOmydgakJN354f6ou0Hw==
X-Received: by 2002:a05:600c:3e16:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a1992fd259mr28338575e9.16.1791708060278;
        Sun, 11 Oct 2026 01:41:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.40.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:40:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/60] gnutls: set status for CVE-2023-0361
Date: Sun, 11 Oct 2026 10:39:35 +0200
Message-ID: <16990a4d1c3c24112eeeecc7494adc3ead0a1998.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247511

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this CVE was fixed in v3.8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2023-0361

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9d9b944d390efdf45196e53e4283e3ec2acfd0fd)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 538fd9c9e0d..92854eeaf9c 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -123,6 +123,7 @@ pkg_postinst_ontarget:${PN}-fips () {
     fi
 }
 
+CVE_STATUS[CVE-2023-0361] = "fixed-version: fixed in version 3.8.0"
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"

