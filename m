Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB0FC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 16:48:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4680.1784738919458492180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 09:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ik6jnqT+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260722164835f627ffd88200020718-gecok5@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260722164835f627ffd88200020718
        for <openembedded-core@lists.openembedded.org>;
        Wed, 22 Jul 2026 18:48:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C3dVmtDA13cqBtN2hrT8YWSo5kudGntYbPOivZPvqG8=;
 b=ik6jnqT+iWqT/CAGojhlIr5Vb6Mz9w5VNTz6Wo4H4HCljD/7tiAHSvuEcOuA0Mj/wQrYDW
 5Q99LuLG5gDhu8O9/lfmOXMhP5k47/V/BCTCNxseE0QzwteS7dY14+s1lqsFj8bFTUSKt1vm
 mKcX+K1QiXD1Nuddqq6V/iX2yT9vKtdnk23eVrAcIUMRIjlU+I7j0UK6hTZwTuuaF4hyhHvG
 7cQnGVd7O8VWhJLPfvXQdb52hHPM0/7RIVlL9WehRiO/VPuOHSfHUkdhJTuEoaLyLNyAmSA3
 doHNWitd7eGJbybVpRzdQxXyWufUUnZPbRWahY2Ad+DJI14P5tmeAo2g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libpng: set status for CVE-2026-40930
Date: Wed, 22 Jul 2026 18:47:59 +0200
Message-ID: <20260722164759.224334-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 16:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241705

From: Peter Marko <peter.marko@siemens.com>

Per [1]:
* The vulnerable code originates from the third-party libpng-apng patch,
which adds APNG support to libpng 1.6.x.
* Upstream libpng 1.6.x (without the apng patch) is not affected.

As Yocto never included libpng-apng patch, we can ignore this CVE.

[1] https://github.com/pnggroup/libpng/security/advisories/GHSA-c4v6-gxrq-6g2x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.58.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 630b489d00..6e4e5e9f38 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -72,3 +72,4 @@ do_install_ptest() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-34757] = "fixed-version: fixed since 1.6.57"
+CVE_STATUS[CVE-2026-40930] = "cpe-incorrect: Yocto never included affected libpng-apng patch"

