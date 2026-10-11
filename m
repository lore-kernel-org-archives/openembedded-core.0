Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F025CA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23552.1791708062830826378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d7h9EXJx;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so8743855e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708061; x=1792312861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pD7trybnOoUKfXdjQqb5bGjwMzL7cyTBsfJeC2xOMh8=;
        b=d7h9EXJx8oP5v50myucBV/I+t52Gcm69HIWjqcrZrKUoGbn5qO5oYxqfMl8FdvdBHK
         IDmluB8BFu9iV2VMI8p1oCMErtp7u0lyd2NzBrJw24sZpJhYv7yqngLgxs/MXwHPtA8O
         KxVNJi7PImSPEsLHPbIZuf3BCHgohKvDzVI1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708061; x=1792312861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pD7trybnOoUKfXdjQqb5bGjwMzL7cyTBsfJeC2xOMh8=;
        b=xx8Pt9cIAGZbviePJULoMVlDK/V99gij2p1lX81bIqNns382GSm685M6Up65FIY93/
         PulrbWHzZ44v7nImL0t2nUSc6hsO7o06eKa5p4k93NfD/3JtVIe6SyTCnGlgR/bBdKIQ
         rdFKZatOVzN5DEl1qC2XDVy4k8PNXNOW9h9IFjeK8031IWVaauKzhfSROFq/fagr/bQa
         sqhU9maV5kc3ptFffVv7+F9N7yHWX00Pl++vdH+s09otqduNeubAOi8FMx2dCqeRKMFy
         j81RlnkGRT723/LZP5ctOrWDfNlNaSaTFiMI4cuQ30FWHv2MvsCtJLq3Q9P1qupPwuoC
         bQ6Q==
X-Gm-Message-State: AFq9FYID5wMvZGDN43GczbzMisa5VhtUt0JJBo6ND4a1+12OAAslnRQd
	FXRIdCUaajKSBj50g45jwYBsf5EAwtuajJx7mFnpmj/MUQmDkGYBxafyz/dYvs0vqBhIToMIw/q
	dt/JxQ8w=
X-Gm-Gg: AYBFou3aCKILGDNS8GENzMflpwF91cxZoB5tJBm1GUCH//jvxmYhP0QOZ9ldtXtLdN6
	njf5VhdGDNv6mzegJeLLXFNA6ACXonWMmF5Ut8VQfEEUZQCt6dJ9GDfkxUT5tX4g1M2h8xkjWlI
	+c6fbtOgkQ+35wqDLP6SXhxmoGhZIIVZxMru+KIxk/5A00/NSx0auYsY0+U5xkzvFR2eKSY0NMz
	Zd7gVdO7IuJUXYRF8nHb6LiyYJdqQpAy5nxaaVyFeUQU5owfgD5T5cRQziGC06G74qsZFNvLreV
	tEGJAjIwjHAOljenU1EazAVRrVO5Nbu507h88BaRBmBRHHrCGnHmFo5tmCsHIhsgj+6nOAvK57E
	f46vsPd3SOP+n/y8bySmC5tlM6wiZBUeqKGMQufvHt7kEs9R52szMK/e2wwJgmjEJAU+8WIHNuR
	1tUHYsFDgdx7aoNv9fj6rxwRGa6bYZq89mucAg5fq+HKG3B+0nDrJgqicZRux4I4xRqIfiYji3j
	0G6DNL9mMU6zv6WVG6ZR/FmGcgDfUkHm2qIMegU7JBVcI/fjzE6Ew0p3QvlHx+5gmn4GZuVYw==
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr135427615e9.20.1791708061140;
        Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/60] libarchive: set status for CVE-2026-4424
Date: Sun, 11 Oct 2026 10:39:36 +0200
Message-ID: <2cc935e7deeffe8483d634df2c2ff7a7f95eb15a.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247512

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

These are RedHat CVEs listing version-less or distro versions.

Release 3.8.7 notes [1] contain reference to pull [2] from NVD report.

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.7
[2] https://github.com/libarchive/libarchive/pull/2898

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4359d85f9dcb0a6d188859f1ae0200352668b9cc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index afc06f85d4c..c0a29211434 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -89,6 +89,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

