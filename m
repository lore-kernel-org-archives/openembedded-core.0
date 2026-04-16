Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8208BF88063
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7720.1776322110646256721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=icr3Ahv+;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d73352cf2so3798701f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322109; x=1776926909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n9FjqaiKYxFXQPW+GkL0tGMIOvJf7FGucVcrl0XFDk=;
        b=icr3Ahv+3WS434Jwut53DglcN4enqA/KF8LT+6DSsKvimHtv80NtuLemiTC7sc6qxd
         hJlOX9UQczdooVabM463cvWG4trW1M7JHwG+kfdcM4C71781a6wFqUvlOegZ9iwIljMj
         l/URwBuAXF14d47N7qusLUEUDMviTpmIyc5zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322109; x=1776926909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0n9FjqaiKYxFXQPW+GkL0tGMIOvJf7FGucVcrl0XFDk=;
        b=m8ELYtSSrfPxieNHHZL51Wh06YRhEVojLH3oFjhsHZIG+jPy+Om8wsJv/JXi19EGS1
         tVcxloW76VibLxYTvfzAJXpU4tHJK1xSCpo53Zy9qhbr7pDeXh0QJA9t0hiS6IifuQ2q
         TpgesBapysFM24fb6Qii5UR1Q0UMtlOzlpnMoI95HqYEXqQcAfsIOkS164RbThdeomKm
         xi1PJqVCLyQBXomdN9FFMu7Loh2infvk45oNi4G+ip7HsJFaqCgfNCqK64CQMC7j2jO8
         O3Znpf4c0qZox9GDMewFSsA1rZKyMvyfdt6gyFuM7yht93PSQm0KGNPnft2gG264ySc7
         Xnkg==
X-Gm-Message-State: AOJu0Yy0cpOHNymPeHlUA0ibKB+7Y2Nf8BIlDC5SK0PsiedL2CHgU3kN
	CIPWAZmxHJJ7TI6nTnKPyMgjKMq7O2cK5Y2nYn/GfUXWYNGNSYry9gV4ndEVawiVIwiaWuJ7MT7
	14iEQmqUhUN88
X-Gm-Gg: AeBDieuIyLibizyD5RwV6fkeDlJmKTEV7R9nRILTe4az0VNRmJ3tiiQwkAzdDgO3rVl
	oC+cbxDRN/GQcqRHrS/OWouEEBXuaACWyWJsNT65v6Fm5hMsi7jqDATN+rKrqFU9cDA862WIrtJ
	dew7Sus9U/ZkL7GiREaJACyaGJv80UWd4h4U8BqA7sLNgL1gaKc6rnGBZ2oLjMBT9o1NKSDP9yO
	jeKmRbF/BaOUp37tX7PFuPXXPXwXxX2ds3zJnR5Gi1V5Px1UDA1v/PMW8t22TnPnaQaTTYUKC8C
	dcaeOMKO1/p8wuzpUWGg1UM1VXSg2YPTR2DkThAgbLn7Msa8iCmVSECG6EQI/ASvayZKTXmzAkf
	KJHyO/e6d/Hf4cvm/0VjpkYNcb2g0kFO3qt08uWtMBiW4Rfsoqd+dV3fU0KD5hLlaRqfCS+Rg9N
	mgZwtunAN5keIJQ2OjpndF55+NEeHhSz9IcDv9mtWzjGeAxw2N2X5mn7zk9tdjk4ro1TNNwQVpB
	WolyLvpMKyPPq7JBRmRDmo/kCa+Jj8bxccbSA==
X-Received: by 2002:a05:6000:605:b0:43d:7b90:fa2a with SMTP id ffacd0b85a97d-43d7b90fe46mr22095423f8f.3.1776322108518;
        Wed, 15 Apr 2026 23:48:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 16/47] openssl: upgrade 3.5.5 -> 3.5.6
Date: Thu, 16 Apr 2026 08:47:17 +0200
Message-ID: <0f6e3b8446558a471e38d4e76b105014512853dc.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235358

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.6 is a security patch release. The most severe CVE fixed in this release is Medium.
This release incorporates the following bug fixes and mitigations:
* Fixed incorrect failure handling in RSA KEM RSASVE encapsulation. (CVE-2026-31790)
* Fixed loss of key agreement group tuple structure when the DEFAULT keyword is used in
  the server-side configuration of the key-agreement group list. (CVE-2026-2673)
* Fixed potential use-after-free in DANE client code. (CVE-2026-28387)
* Fixed NULL pointer dereference when processing a delta CRL. (CVE-2026-28388)
* Fixed possible NULL dereference when processing CMS KeyAgreeRecipientInfo. (CVE-2026-28389)
* Fixed possible NULL dereference when processing CMS KeyTransportRecipientInfo. (CVE-2026-28390)
* Fixed heap buffer overflow in hexadecimal conversion. (CVE-2026-31789)

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-355-and-openssl-356-7-apr-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc25ce383ddcb1185c193ff2b10f9116741eb316)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 2 +-
 .../openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index dadc034c913..bfbfedbd67e 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 09303c4..011bda1 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -514,13 +514,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.6.bb
index c0d02b617ba..cbe7ed144e0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

