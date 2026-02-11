Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3D6ECD6E0
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 18:51:59 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26832.1770835914796645531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 10:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d73CLO6M;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: colinmca242@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67242e24be4so1506485eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835913; x=1771440713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU2s+mIlGp9TnrvzHtAEluqnwUBDPX2/KJiiCy8vEnE=;
        b=d73CLO6M3KGqbNS/ev5CuFIsz69hBnd/LgPpqDWHaI/M9tWbMWUu7RcmwJMmHOJQHF
         kL8/+BLpgV8N+M9Tm6mZiLt4ni8Nys82ZWIWU/bZUMtrcx83UvaegUUyywy4WXUvzBGa
         fI5E1LSP9dbZlhLQ9wK+oJvkpCly6V2cEZtC8tea2892KnClPU+/rE6/4g6czTBvMTjv
         2o46QMOgzs0fvChGu+W6kDrsZLc2hfelLT8sW1UPju0+K9KkWuxVIWIe/hnXPbKiHVJy
         NISmThpQYlJzvtpaNmLI3eCIT09n4Qf8czzDqxygWzhpGv/sYGtO5m13Ivmxpfqh2hWz
         MQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835913; x=1771440713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QU2s+mIlGp9TnrvzHtAEluqnwUBDPX2/KJiiCy8vEnE=;
        b=YQjtCkEQE8sO/iXrSyHDAagmGD1fzF215CSOozyTNXYIp7SEMLLOkwl7MQtQqyi4TK
         ZhDu3ZBR8zm9Dk+AqV5OW+IgOoIawqGS6oudR0wmvqDw3WHaNB1ARxc2Yt3TxYGdnncZ
         JHj8AJAGCBWUTqDaWAtsywaOZmmUMcH8Tk3lHC+DQ9B7tF5fK0VxKCgkonIDm6VVchRp
         LSEOpv9TcYELxdeStmchUX1C7DKYhOADbHpghWnZREVLmz9ZFalnmdyS4bqIwW98cHCK
         xVrfPlw6tFn94jxoIDn5KYQYpnaU1NbwMEiQI2hFIRJw8zCdHaWFI7lM3EjXF7TFOwf4
         qz1g==
X-Gm-Message-State: AOJu0Ywsi9ejBBO1zlaIaexVP1Sc9U9NTgEhcxHj7k4Vt/+8As4mltQZ
	xkHeCw/ZduYs45BfRXBrgCQhvLjOl1tBtU/QboSThXKsAY2mAVqOTPNQ9TnJvw==
X-Gm-Gg: AZuq6aKR4aD+ydOrWbB3VVvqPQWMDOKySy+zFDEik6mqQwBIk2pkgSbF5DOLgmW8kgn
	hFu700asZ5gjkW90cIVpLyT/A9r0LHC+7Z53gREW+m7KnnAf/L6CARhsRyGM7LS3N2Re0gCZ/JL
	YX/pfP4OpUBQoSLxNpeDyNSnIxNPFEpVFbEKl4Z2cPEwLzCG/pB349LBCbOtimCU5KVSnXbMP9D
	sGttAzR/tqXVKG2ZcB4+m7CHGV7ZNSKT+pVKIqRFJ3IgGplgpbaChBBufjXfWmNkya2bcyI8CGZ
	HaJSGQ/76GOL2/QS0ZRvBsS3rM6ru2wRji9VRX7EGrVFD+QKZsuH65pussACuEZ/vQQWFaQBEOy
	03bmg9sXz8oLvzeNLtUHU4+svDFT6L+hrMGz9zzYlKS4Zb27FYiZcJ7T8yk6NfAjFVm/SY86GdM
	ZWUtccYStkFleRlMWXkQInQjWgZZpxfA==
X-Received: by 2002:a05:6820:198b:b0:672:d632:b1a with SMTP id 006d021491bc7-6759817fe65mr109515eaf.12.1770835913528;
        Wed, 11 Feb 2026 10:51:53 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67475fbc91bsm1356092eaf.15.2026.02.11.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:51:52 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH 2/3] openssl: Add legacy packageconfig option
Date: Wed, 11 Feb 2026 12:49:16 -0600
Message-ID: <20260211184917.1045939-3-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211184917.1045939-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 18:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230999

Add packageconfig option to enable legacy support (disabled by default).
The legacy module includes deprecated and unmaintained OpenSSL
components. The openssl-ossl-module-legacy package that includes the
module is now conditional on the packageconfig option being enabled.
Packages that depend on this package are also now conditional on the
packageconfig option.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index 6b9ccef0b5..c9d74002a7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -29,6 +29,7 @@ PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
+PACKAGECONFIG[legacy] = ",no-legacy"
 PACKAGECONFIG[tls1] = ",no-tls1"
 PACKAGECONFIG[tls1_1] = ",no-tls1_1"
 PACKAGECONFIG[manpages] = ""
@@ -257,7 +258,8 @@ pkg_postinst_ontarget:${PN}-ossl-module-fips () {
 # file to be installed for both the openssl-bin package and the libcrypto
 # package since the openssl-bin package depends on the libcrypto package.
 
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy ${PN}-ossl-module-fips"
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-fips"
+PACKAGES =+ "${@bb.utils.contains("PAKCAGECONFIG", "legacy", "${PN}-ossl-module-legacy", "", d)}"
 
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
@@ -275,9 +277,11 @@ FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/open
 
 CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
-RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
+RRECOMMENDS:libcrypto += "openssl-conf"
+RRECOMMENDS:libcrypto += "${@bb.utils.contains("PAKCAGECONFIG", "legacy", "${PN}-ossl-module-legacy", "", d)}"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines openssl-ossl-module-legacy"
+RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains("PAKCAGECONFIG", "legacy", "${PN}-ossl-module-legacy", "", d)}"
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.53.0


