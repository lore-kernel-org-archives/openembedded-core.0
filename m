Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBFACA9EC7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23425.1791708064294227446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dAkpiz8W;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso514713f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708062; x=1792312862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4POro0R/iNnVbB8QmrbPQr11Gzmu81AHg4d6nzWFvlM=;
        b=dAkpiz8WoP2btMw+U8p75/xQUoiydGFVydy1bf/FSVwbZ5fBPKMKvPt4UxFNsJ2mlR
         CSetr2wE9yt30p62wgtxmwWXeYgQLFq+sT467YisORsGx4M3kyV66uKKZ/GWxYkQVB2d
         WoLm0nyN8VuFWeuTmXIJ0G4h9CbCqr622FfL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708062; x=1792312862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4POro0R/iNnVbB8QmrbPQr11Gzmu81AHg4d6nzWFvlM=;
        b=DvEF67Bfb+VLuUoslKZ96jg5RI0TEoycJbuZM2marGy5m2Zo1t/FuC5HYt8T/KJ266
         BvVV4oZHtrruTv9/RAYl18LKvTtLep4Fu/Kl5ANGbosEUzBiMXaN/2ouQVAVDAhaSu9y
         bNPaYuTrAlec6robydKOm6DMthV80Q6M1z2IROw6peT09d0Xy/B8ktXBXVnvQmgTZUQq
         iEMNdis8PTdVI7eP9NTUi9x9w0HUJyHO457FE8TuM7Gyvroy19dlxQmSnqC55NVeR/75
         ANqDqjBKzV+tpMpjzoG8zjiCXdNx2L2s5McnLijEZ7vrUT59ALHHpP7dwlb+vV+IS40E
         be8A==
X-Gm-Message-State: AFq9FYK/4cIeksHRn8iCyCnQkp46c07IqINWKAAJQPh0UwwPERQmioFy
	FPWSKQTwDVV3qZ71E9CJV4DZQ1AYc1/GGQzKXsS5lMOD/oPLaLQG983sRsXiY3bdSqxX/gulk4Y
	rdEIInCg=
X-Gm-Gg: AYBFou1Umz5P5QE2VJOUxcPIiq5S894aIooX7byzxZOBSCb4HCsgSH9ONKlma+QCT9A
	lRXxXndWK2bD8WlvDHrwv+hl1zY4WyHe8fGN2szNSGFq4AD4cb1jaQp84j4R3Ytg0xPbeu7f/S3
	HBt6077J7VQIib8XYR4b24VjzmdfM6HvWRa+21z32cxdMzoIdIsK0VOHRd5suKujVY3YTxKFfN7
	kxJet/3Selsj9exJUQw1wEqElSczDzHpAmZfSMxSdlCpsAZgap3+j7f/+8QdznVQyyrDqhAhZJB
	2awre41pz0vxkAjlkWI/azvNJ8oPv3QkdafCSSff7fcK6z3kpj6vlntN60Sx3J8EZ4XUybKnhGy
	zUu7B0au6EVAVnrZ/maz1+SYx5hnsTbEJnN8MwBOVqqHxEhkkeo6vpkdBCyHp/zwoJoMty/5pnR
	Yu52M/n/4tgtqPv3+TdyG7mfRoRT69q5mGCaFj7j16uISXWKY+w1o1TLNB89MLIWz9J7KQDPi6e
	MqUckd6Zil7/UQET2tWrKBQPJEEs4QmJN3bwmgGOpJOQ9uSDKOW3bVvKRfwI3BlRc7ILE1vHA==
X-Received: by 2002:a05:6000:469c:b0:48d:b75d:30f6 with SMTP id ffacd0b85a97d-48dbad1226cmr7031406f8f.35.1791708062523;
        Sun, 11 Oct 2026 01:41:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/60] openssl: set status for CVE-2015-3216
Date: Sun, 11 Oct 2026 10:39:38 +0200
Message-ID: <64731c4dcd827574424b6ab297e1235c1231c409.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247514

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this fffects Red Hat specific patch.

[1] https://security-tracker.debian.org/tracker/CVE-2015-3216

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0353d7f67e6fedfc10e9ca56a6bf5f3ca9e215e8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/openssl/openssl_3.5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index d8cae41291a..71446e62e31 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -301,3 +301,5 @@ INSANE_SKIP:${PN} = "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+CVE_STATUS[CVE-2015-3216] = "not-applicable-platform: specific to RHEL patches"

