Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AF0C3600C
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.48748.1742845021506070211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c9brLOLp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso7712430a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845021; x=1743449821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuiShd1WuSt3JsHHXLCo2txggTisp7O/Qy+zZOGdC34=;
        b=c9brLOLpkyfdjYNxEEMm4rOBChiiFV7BQHntYm40neNBx7IGRU9VDhVVjUt42lpLa2
         rJK4nIf4G7ZMQSKpqLjNNgvXjngNLyib5WOBbuNU40CblAB594bJQ9LbWiKIVCTIs2Mk
         0ASDZPSitCzzX+AvHe83ftVz3MyY5B9OTQNN4hlcaKrrHZPK1Wd1k8jtG1Rw8MwgpLDh
         lhswJ/ICKNfZDHHosnpEnNbJeptlVn+kMX74fIsVml0+kQGJ1aYKksbA/Kmg/jwOSWIH
         PJMbrp0C+VjNJiHK4KUm+J9Vg3ryAUHBz8MDkNiP0drjB2FD9xoT1rduhpaEqQr/ENRt
         5SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845021; x=1743449821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuiShd1WuSt3JsHHXLCo2txggTisp7O/Qy+zZOGdC34=;
        b=wdnQm3exYibaGuxD5BivicuLJpgUwXdvWJYSP5zGcDD3t+Q/fqnjsWZjQJRBbR6qZS
         W3hQbY0PQPdOfV9xkhXfRrCaOAUyhN3LFR2TGiTO2G0WXMl+awnPUPCaE5xXYYpFV1Fv
         1BmofamD60YMKxgRAsXgUScKPuH7zr/AamrF5G9ZV90r1YZNk3b3cnKZuKI+FXkMd4ig
         sLY1A+M5QdPbAwJeOOWZB9mMou0boTv85/EvG0lLYRh2Exp69rXmj7fagQLTlv0cYZkz
         9SpIzGlXUYG3IqcR/yG5GJ2l8L4Oxx01D9bULgQ67gJONuiiLbjVtduZUs1FUCX/s29j
         eTtg==
X-Gm-Message-State: AOJu0YyapIvEUgp9Czg6agnkR7FKQ9tR9g1rnIV3C/1LNu44yxe/Qv9x
	yPVhxZkxYSaaHVj9mKAeLZISNIyjJmE3Tsgn4HSijujLhoHBDPZcHEDBo0GAOLmwpl96p+jrQv5
	1
X-Gm-Gg: ASbGncvmtn47OQ4WS8EbJH3io6Nf6ybuwQ7plkVve7bsFwwCFErRKn6KvBi61bXueGP
	cXE1pCPSlLeOd35oKjLKwEnd3EhW//eNBXY4Acasz1WGCM4YKXICN0MsVR0xlqKBAENnka28gy/
	jRS2bJv25a7eGF1aTlzKfD4csKqTQYJFA+DTSHiLbQXE2qlOo9afedioADxxT9EKb0E3FcNokhw
	NmF3J2mI+Qh43jF6cSu6L8ZkzhZbJy+2iSuHw5PpgnLUp29Wh1+qneYkfYKvhmXTGf+F86q/Prg
	N0CRR8tr3LcMPkYS8IeAORL3l88sjBCqVY4F
X-Google-Smtp-Source: AGHT+IE0JHroTi4y/03IXg0hbQi26uJc7OIiJ5ptae5a3PRYuZg4XnIDnqf2dNvro+2lEViR5U+Kbw==
X-Received: by 2002:a17:90b:1f81:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-3030fe81de2mr23484810a91.11.1742845020599;
        Mon, 24 Mar 2025 12:37:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:37:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] tiff: mark CVE-2023-30774 as patched
Date: Mon, 24 Mar 2025 12:36:48 -0700
Message-ID: <87893c72efbba029c5f2a9e8e3fff126b2a0cb71.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742844907.git.steve@sakoman.com>
References: <cover.1742844907.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213573

From: Peter Marko <peter.marko@siemens.com>

[1] points tu issue [2] which was fixed by [3] together with lot of
other issues.
We already have this patch, so mark CVE-2023-30774 in it.

Also split CVE tag to separate entries.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-30774
[2] https://gitlab.com/libtiff/libtiff/-/issues/463
[3] https://gitlab.com/libtiff/libtiff/-/merge_requests/385

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
index 17b37be041..261421b399 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -23,7 +23,9 @@ This MR will close the following issues:  #149, #150, #152, #168 (to be checked)
 
 It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
 
-CVE: CVE-2022-3599 CVE-2022-4645
+CVE: CVE-2022-3599
+CVE: CVE-2022-4645
+CVE: CVE-2023-30774
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
-- 
2.43.0


