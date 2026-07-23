Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0D8C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:48:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6274.1784839728464374123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 13:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sw2YB5fU;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e347638adso1264516a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784839728; x=1785444528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYGV/ImgU/t0SGvBNTspnkQNxY0Rrrnx96j6QGIqMn8=;
        b=Sw2YB5fUZE00+olKiz5zTvGcgHfg1zQ7rNNJ6xGS+Y7X6ZigvASkr2i6IZoAjJ6yXx
         RR54lsOgFiFjZMTtG6g7699xWvNckHZj5OdUOBcoWYd+MU26QFbLLy7hkfruvAHC+QgI
         GvcWc+fxQWB+TbkXfMRtZl0A2SRjDnnkXNPJPOhNdO/QH+ujaqyFXTqIIfKlZDgcWKB/
         BcjREMmEon5Yf6Z4LPk5OTsI2W5PbqUlFJafHLo1OEB81YVBghGvG6KgkT6N24oDMMp5
         RaaqcPt/GvuwIH8UuUQ6W2stpb9Vo7VdaMXPZ7gutXIXTG2PQv9XNetMMKXfZBaEqSUJ
         8lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784839728; x=1785444528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYGV/ImgU/t0SGvBNTspnkQNxY0Rrrnx96j6QGIqMn8=;
        b=gn3SJHPXvyAeJ5iCdVRzm/ayJrGjAjdH5zbaZZsXKcinQUzJ5+W++ocKrqNdCNOUAt
         iumPr7Ei98mPWsaXcdy+3h0tF1S45WqGwFvv2VUG9KcM4o5F8V1o+lyWKozhyrthTz8z
         /hqDmFp/YANF83OA+r4/wdC2s0TOTduh85xlyZhsFCoE+qN9JXjcZEuL/Iqu1BEuibg9
         Pli/wtgNbPfEDqFpRG9YCsZRVXRKUDiihFrLjUms6N1FLTuI00HCGkuP/tmDvAJSA8fl
         DpAfHOIu2MyJUBgb0mZUZcEPwhVtnXyl3fplQfLS6efdh76UB0cs7y3P0b+FuVTa4cMj
         F0rw==
X-Gm-Message-State: AOJu0Yy7tPG2+i7rhjhedMmAg33JDLt7/tHCQtoPakvHQ9JG07s9LwUf
	enRwPa+lkNry6xNTTsSjL5qKYN+smw0sA+ar90PowdLVJQFfsO9y0c3ABDfmoQ==
X-Gm-Gg: AR+sD10WlrLGbbZ+EAgbpeQ14T37KT924XuvPKRSnkNML4NMuDsUNdrWvHTrXZNJ1VQ
	QPIEplp9OcMBPZ/6twoo8Oc4VJQ2KmmpMTDbVEKresaSb+e3f57G/s5VVFT4Xku8tcq9fua0m5X
	0v8bpsT6eNgWEr/WslcGZca4NGpVWljNAHSxkJKk3eIbwLN1JGr12XOl6icOSvwgtI4vY0QtUeX
	Uokd5Gh5c0CMg+vB9sgfhN4iWw3KpJKjLnKE37hvs7SjpZWyS4fPsYpKx5w7Unvyp8dv3KEPOOO
	ur9o5/zmD5z+FzOb37+4VN/RhN+QmgJ+cDMR31vsz6k7jyXVv5Pr3wK/zLKJZRwf6XcvEwoJvG4
	UVYzjBwsQvzi3FGoO8VsIs4nRSw4mihDwGxKwimeOjBw0MnIXF9davYz3XyH5n5+P0F/JzrtOSM
	YZbtRDCyXW58tAyVUbvUFmEUzd4hnD6GZgbRH6JeQKTCWgTEQsRBqpKIr0ppmCcSaWnFct+q6hJ
	w==
X-Received: by 2002:a17:90a:dfc5:b0:38e:d3b:436f with SMTP id 98e67ed59e1d1-38ec65ae18fmr4382493a91.36.1784839727708;
        Thu, 23 Jul 2026 13:48:47 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eabesm438508a91.6.2026.07.23.13.48.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jul 2026 13:48:45 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] sbom-cve-check-update-nvd-native: -> 2026.07.23-000007
Date: Thu, 23 Jul 2026 13:48:33 -0700
Message-ID: <20260723204833.43562-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723204833.43562-1-tim.orling@konsulko.com>
References: <20260723204833.43562-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 20:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241873

The diff is quite large, but a partial comparison can be seen:
https://github.com/fkie-cad/nvd-json-data-feeds/compare/v2026.06.24-000003..v2026.07.23-000007

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.24-000003.bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
index 95af1a5805..b0b6fb7d8c 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix=;tag=v${PV}"
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
+SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.55.0


