Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7390C61DDB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2974.1787945888312870763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b1dxwbMw;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15263385e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945886; x=1788550686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fbw/fJAndP9Qn45FVggGS9VyLSd8Ic0wI2q2e2M/zjg=;
        b=b1dxwbMwC6QVhL391tJe2Uc1zQmbvyXhOZagaEXtMPMBmPMkW5znht8II4WVsOEImH
         u9e0Q7xe0hqQz0+88SkCnypm0GrO69Y5XTpvDoETWFii58O9kCdqS+B/3eVUiwOKE+r/
         qxzScduzeNo2oBGdCX4zRcuE1H7ni1F1nEDzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945886; x=1788550686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fbw/fJAndP9Qn45FVggGS9VyLSd8Ic0wI2q2e2M/zjg=;
        b=LwhSE7Qxc0P0HTrtYJZf3sVpPby0UY9OKSxFYBbM38Cl3pPg6ZEoIapcoH1yh4MNpH
         JNGGNxHN+PtRCo/z3FK29yD9KoLOBrh42QhhAhxpedI0XpFQad+5Cu9k/vuYxSGoI2K4
         F00/Zpwf1t3F9AmmTrJ8lGtgio8HGYAgjHRVrfnSvdgJpSEGsR8mS550z+c0TTx5EPPR
         LjcsGI9TF8tCwAcdb82TktRz72+C2XKmE/8CaCVuawdD6Y6PwRFOgt1kxD28ZrMZLrCY
         2CVt7tIJpImDFTDPWMTWGKWk0VNLjrv0JWKAhn1xp9tNQE9a/l1O67fbrRs9TvoS6N/e
         bSbw==
X-Gm-Message-State: AFuF++ldlEJgWEdTCE4Q5bj/bO2OGYHksWjH7nX4qcz1G26IA8x3Fcko
	hj3e5W449KG9WzwsPjIjtQAo+FUANfbHefcy9drpN47NWrYMY1W2Xflyx2TCCikC7kHKAfP0Qeo
	d2zDymLg=
X-Gm-Gg: AR+sD12nUk3kHKvr7vK6JsBLMI+FQCy1zo+NsHT/icaU8je9qHAO886fJLqYniO5jbS
	m+8FWIoYmg7RICcILJkvsjNq0M3r2x4a3bKIkQzEEpQE/xrdUt+ScfrHGkhju5Cf4K3jcwIMsxn
	E9jfonvnnLZyTa2nU/uc1hi2iYS6S4VnGpb4IU+lV5U0A16vwsr30Sm4wMhjdP39l2KuoYl2AEw
	N17LoWcpLJindDeEBcgizNjpOe7Zv3LDwPis56j7Hb+2W1dqBBYcemOXu+n/llRRwd1g7gmCjVq
	d5wVIkTdUaQ7LYl+ndBhPhVXUa4S309UJRzwPm3aiduSQEj/e4B5nVGUny0lUuNNRzrm4EFaiJw
	WopLzZY1WO3++PwlwDQneidasqU4ro8pjltEaqdUtqJc1UkTjye4vmervvg4B/mdSA/ICGwAqe8
	0h64XcGAAik/unRMBiVl3YJnEM6ygRHjykpO5llEph7elftgU+I2WbnfFq44zbxCT9+3Ck5RkOn
	lk7K769fAqX7GQb2winMOzYGQBcbdJo84CovFC8ykULL4633o4iqfcLGM/n4FOz
X-Received: by 2002:a05:600c:c3cf:10b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49b91c47b76mr112810785e9.12.1787945886564;
        Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/56] connman: remove connection_manager from CVE_PRODUCTS
Date: Fri, 28 Aug 2026 21:35:15 +0200
Message-ID: <c039e8d2c0909531d0dc2ef4b23dd62fbb25dbc3.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244566

From: Peter Marko <peter.marko@siemens.com>

The only CVE with this product/cpr is CVE-2013-10036 which is for
different connection manager and is showing up as false positive in CVE
reports with current sbom-cve-check tooling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b2046bf757622ae46e66691119cebc504113993)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/connman/connman_2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/recipes-connectivity/connman/connman_2.0.bb
index 6f7093301bf..920745afc32 100644
--- a/meta/recipes-connectivity/connman/connman_2.0.bb
+++ b/meta/recipes-connectivity/connman/connman_2.0.bb
@@ -14,8 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-CVE_PRODUCT = "connman connection_manager"
-
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \

