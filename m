Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73916CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:10:36 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25039.1791220226372624195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=BNqFIQnh;
 spf=pass (domain: ossystems.com.br, ip: 74.125.82.51, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1433e7b057fso1122813c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791220226; x=1791825026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzMdCDhve7vfrmRlXyDBFmDOXdW972uMk8l7W+6jasM=;
        b=BNqFIQnhMan8X4+UGsmZMDWeNiwd+VSugW9O1Lc9IVkMfKhGc8c2B4Kgc7lfVY+v/6
         hgxULqWpotVPJw+5S7ebejwDVYYRY4nzRZtJEC44wMLTzoQ1ptVjO+xeQWfux2XxqyHg
         kJ530aIKTzgZd7w7kgCrfbo1TDUX49VAcAu+Q/dKoZc8Idcih+9LRwwQr5/8GR+lH1P2
         o46YVi+YZIj30dsVFM5UnU6tLZH2LfoJT1yuXX/mttAtiG0WSRwVdbw14DZ0C56EedzB
         swQw++/U1uh6Il/Y53X1hq3bNkzfALq0Y7DVbuHNVv0IN/NSinX56YRCjJKnK5LD5d2s
         2aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220226; x=1791825026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzMdCDhve7vfrmRlXyDBFmDOXdW972uMk8l7W+6jasM=;
        b=f2fQU95Ghim1vMKrD+vh3VN0bMfubLG/VDcZQDIsgyV08WnOJn2YSs7CUU2nE/9233
         4QpeLPmER3JfGf9S1y/YL9jWPTWkQSUe5XIKLq/9IsAxfxzBA1TtGEaXaToriCzPfgwS
         XtNpbOsDadynXduEqlwp2xM03ZdulBdszMPLLjM8O8TgS77xvaKHTwaLds3u5rqE9Jht
         /6TGc1YkwZcUlKfWPvvpdq5Q5iMBDTlgmgqgwITKvocUUQ0xr+CGwMBdkoYwX0zR9BrA
         ti5HLowvuqet2Qm0Fborm9ebX/Vqx6cj1y89YHCosI43d8q+kPH76xIe359wbM1sjv/G
         30tA==
X-Gm-Message-State: AFuF++mw9RcZn+oEfc7NdZ43ZAr/xFs4qE0O4CAGCmYO3+V84lX+8Okj
	6srLBtjjdZcGN7uOkggaA0H40Fh2lWwloZADUWwPzar6PjtlsXlcQL6+F7tR70xur80lZfbfA52
	nTtBR
X-Gm-Gg: AYBFou3lORt7yNglzeZ7vEJ1YRrAJsoCGpu79gQzHylPN6CXTKBOsC8A4tgtdl9z6xf
	fSaemjTDKZkhdUfG0VCWdjYRN1mrxUj3SyEzIO8N/FQZpty2jqodkMSujJ1i5WH/6vfBaA35KHT
	gmIosiLnJF02s+TKEn9TBErr6qITS+n7Q+r6k5DgH1YvWPuLi1IdNX/tjWWEWe1HudFpkDVVvTC
	vtmdww4X7MYmfxXt9xQQyoMb9v4V9Ql3awGzwcHG7i4z/KkmmeSHRTIrmGjdM520vBGzet2GaW/
	pMLhCZlG0kVt1v+mZ8xZPRrdnAAqxvmYlmMUaHoiCm3WaXj+jrqqp8n4A9PP0DP9B0sPdcUOVWm
	JsMJwEB9Opwd7uw/rA+lZZpNQNuTdF1KXdzAcw+LFFC+OxSPQvZS4S0wMjZpQQQzYcdv7rBSEsE
	G8m3YNyh3DNPz2L4vtt4PjJZfTrlfVZDrzW5c1DnaXP816LuiG5eoDqaoQrEYFjrFmbiLkCoOmc
	ox30QfUFpg+NGqbwsW3LfjCbNWJBw==
X-Received: by 2002:a05:701b:2083:20b0:14f:505d:827 with SMTP id a92af1059eb24-151c435b9aamr11764455c88.45.1791220225686;
        Mon, 05 Oct 2026 10:10:25 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm25189110c88.15.2026.10.05.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:10:25 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 2/2] python3-dbusmock: Recommend python3-pygobject only with GI data
Date: Mon,  5 Oct 2026 13:54:12 -0300
Message-ID: <20261005165412.1120027-3-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005165412.1120027-1-luciano.dittgen@ossystems.com.br>
References: <20261005165412.1120027-1-luciano.dittgen@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247255

python3-pygobject is skipped on target unless GI_DATA_ENABLED, which also
needs qemu-usermode in MACHINE_FEATURES, so the DISTRO_FEATURES check left
world without a provider on e5500/e6500 machines. Use GI_DATA_ENABLED, as
glib's ptest does. Checked with bitbake -S none world for p5040ds,
t4240rdb and t2080rdb-64b.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index 12fc704f75..4b6dc0a3fe 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "221b65e1c2e48de9fd11bf7e8c165adaf91648f49a11f390d086a49838
 
 PYPI_PACKAGE = "python-dbusmock"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta gobject-introspection-data
 DEPENDS += "python3-setuptools-scm-native"
 
 CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
@@ -19,6 +19,6 @@ RDEPENDS:${PN} += "\
     python3-xml \
     "
 
-RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', '${MLPREFIX}python3-pygobject', '', d)}"
+RRECOMMENDS:${PN} = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${MLPREFIX}python3-pygobject', '', d)}"
 
 BBCLASSEXTEND = "native"
-- 
2.54.0


