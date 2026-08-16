Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F14FC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 20:04:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16348.1786910633136950326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 13:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EtzyWyqO;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so32917795ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786910632; x=1787515432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBLKyy9Zozolog86f1s4MeIR423BnvBRuyd9+B2+9xU=;
        b=EtzyWyqO8EwMnDXnTfd0sQ1mD/b3F021ZAg4vNrl5zgV83W0a7PdNLaL+ixinvNcRH
         gdw9+BjwTn4946phKoegQ2tpxQFWhX3A8Ai+vpBKw5JS0fKI2zmc7k5FFASPt8ywenvC
         hpis9oiYs0Ven0cn1MYz9oVUxarhpiQuGmVGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786910632; x=1787515432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBLKyy9Zozolog86f1s4MeIR423BnvBRuyd9+B2+9xU=;
        b=NYcX9kDKhnpQ9PLtW4tM8LteQpEsIxogTJeIo+2hLjB7cBUWE+FpEWlHIVeE1v5rQn
         MUx5A6o7j+MfZolwSe4OmkZmgh2pM1JVEp/ZFQzlqLFMmdS5KdnnIp5SIr2DSX7YsFeK
         y17G3zCxazGKlkoCmpPAH4A82WvL3ptpPVsGrGNK/aJFbBRP8HKhkYaVQ9yDX0FA0rdW
         GaodsoMbHAxqwhfCSv6badqzL+UREA0gpxflZ/o7+NbNkMqz0CVEcuUUKHlMRXlOK56S
         YUPXuYzj2mr53Q+x8Qmslj/hgHy0Syv8LKdNDM/ivrcTOG+DYrT0OiVlmMMGiXmZnwHk
         AWUQ==
X-Gm-Message-State: AOJu0YxQSflPONyB8vV+dQrt8g5EAo18Xt9Qop1eEVWMHPvNtVGogFag
	OzRM5PyYNxxJmNOFDnhxhl98AmY/eiof84T6PDtUTkKgwI7kSvkJFichQc9FvYaEij+jRhoqvNE
	We51A
X-Gm-Gg: AR+sD10nWnw4ARtjUZ8RfDbn1DsTn2g0WGg8zLq4Q3yKuM1idbKWRevuTxLzscoaI1c
	9EMLUTkL1qa1SUwIcHuIYgl+Q9ixWmqCTGuuHCq5tvHtm3zns3c3MPgtJU+vBcODYhFk/BEfHsq
	hw9k5TxG5XAytm7XQ0NB6i/ppf/U8PB4W55Uz7OmvrUN2qpU1Wb7YizmGwNM9CT6GB8Sgmd2Rem
	NbDkrGdr28f24RCeDUCWElGT7nMXlWEcBZCPismK4mMsqWOE1f38DxLgChiiE+W7zo5DDm5ra+t
	XdKVlj6ZPggtgKFh6e2DrevXxmQF7GuXRXyEi428X6w6sEvqGMXlwPreOxYIVhyCWzWbClBpAVM
	qP+K7goct7mit2hMKombqnXcvIj7dhJuIy1XNqw2sRFcCRkPJQiOw0vg2hUJpxDn2Uty7286w72
	teEwDg+UngyvWNruL1c+niMFSgFwpL/VaTE0q0V9f/JP/CWRDplfnOz16qcf7OiSyJC8t9/meLn
	hFQPN0u6kpGEaNQ
X-Received: by 2002:a17:903:2f8f:b0:2ca:304:f93e with SMTP id d9443c01a7336-2d3b0d111c3mr200004785ad.22.1786910632460;
        Sun, 16 Aug 2026 13:03:52 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a1e:93e3:2a6f:adab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7540bcsm27111715ad.3.2026.08.16.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 13:03:51 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-numpy: fix CVE_PRODUCT
Date: Sun, 16 Aug 2026 13:03:40 -0700
Message-ID: <20260816200339.1832620-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 20:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243563

From: Tim Orling <tim.orling@konsulko.com>

Without this change, 0 CVEs are reported.

With this change, 8 Patched CVEs are reported:
* CVE-2014-1858
* CVE-2014-1859
* CVE-2017-12852
* CVE-2019-6446
* CVE-2021-33430
* CVE-2021-34141
* CVE-2021-41495
* CVE-2021-41496

This can be verified with a query like:
$ cat .../core-image-ptest-python3-numpy-*.rootfs.sbom-cve-check.yocto.json \
  | jq '.package[] | select(.name == "python3-numpy") \
  | .issue[] | {id: .id, status: .status}'

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-numpy_2.5.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb b/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
index 528f037701..4406204681 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "d482d171c406ae88c5b19cad3b6a1c4c5209f886ab74bc44c2c865c23f
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "numpy:numpy"
+
 inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${UNPACKDIR}/numpy-${PV}"
-- 
2.47.3


