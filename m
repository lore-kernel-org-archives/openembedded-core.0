Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69356EF99E7
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:02:07 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1790.1771023719315413508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEADF4Hv;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40ee196dd78so942562fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023718; x=1771628518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ5z2U+F4Ift3x0Fykk79oXtk/pF0EoKM56SG24NT58=;
        b=FEADF4HvsCsjlp9Q4K3t4Jq9ok58U/LtfqBfCdEcubTKkZ8im98EtaxrfGL2kCdMGU
         UjNOYQ81hBTNRzX++fLvjI+74eL9h89p3L6H22vpQRmdZXj7yGX49QBTiZkcC53PeLSX
         dXbiX73H9U1RBWyvq9vHq7PW9SU+M+jmXpfYho9iezNjUBuIIhfe4AZ0Ch7A3AhSslMN
         Ov5BaGlM4yJdOLuGsZ1qggbI1FReBXnh9IkABTXWslXthRBRlxl0SAZhtvnToH8wZZFc
         TmDP1cj0C7tNSZlLjKUxg7q8Ho+oMFEcO3N6kzL8spXjfOKbtEfgJgG6VZntE8gzLAMC
         NHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023718; x=1771628518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZ5z2U+F4Ift3x0Fykk79oXtk/pF0EoKM56SG24NT58=;
        b=mHAXo77BBBTKW5eDt5+o8FAR4S48LINunwAdwKx3yMUQ+Ca9kdpkeknZ5pB7bEFxNt
         /cbVNAD5X56gDW3mvF0Lp2wiJdphKmbPp3GZmewp1lZreEt5fYLwSsctzKcKOzj+sDC5
         TPdo2BlKRgB5jg7cNgtSDk55UkfTRo51dz7eoc9Rj5C+90vLWsQsBcYZ5H07gx2hkQCs
         SbxZBu/br/Djgno8w+1pKKmQX4DLgCcry7sps4JrS2Mw/Eb+NwVOZ02Li9+dLdxQ7o6R
         HbsNIygHpLmo/+a2jKGq+2tZXdfiGhdrOI27HA5E81rCfRKAUSfawEJyFd9nbt/bpNta
         kfGg==
X-Gm-Message-State: AOJu0Ywot3DvTwSL4+fyK7vFt4fIkoAv/q+G3zTnRWTb2tyrTb6qbcwC
	fWXIH2GpRv3owCl76AEEO+yIiwvuSL4+ZYSHw1W287jwXYG4dmluPZ84oIgAig==
X-Gm-Gg: AZuq6aL/LdJN0rhRLsGlZ9gOgYmZD1cAXXT6T4WVT0pj+QsQH7uhnfU/P8D522eoxQL
	5c1iTirNXRNYDvrghCdJmeEpsTrAoI+gzGCAdaCoL5Q4V5vQuKMnseCsHl2nH7+7zRGsr0oiLBS
	3uNx80G9QcsFsUtVC4ghrv6V/eNbejMDq2WqFRngaNr8Zd1ew5ThdynuljAx3NwJCZf1/NMcsMR
	3zbr2bryhZBA3AwmKpT6hpOaXEJgZSoB5VL5aw6JPHCsrmwSzcba7+5KPGPrzQV64nLNSNAXFwf
	GKgJlJPZkmH75eBbddRbmCKheqI+OcQg7g+d9MlU/3pJD3wM8SVEIVz0lVvPXpFCGO+V4665oyU
	C6oo90ZzBEJaa6QN1OwuSGYHuwx1k9WbY/5RDhwsRXOr9X8b98qyhwXK0UY0EK6NB61ly0S2ucK
	CjipHzJKUEhMDVSAFavxg=
X-Received: by 2002:a05:6871:297:b0:40e:f108:5903 with SMTP id 586e51a60fabf-40f088fffe5mr1060496fac.16.1771023718059;
        Fri, 13 Feb 2026 15:01:58 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf101db0sm8092157fac.12.2026.02.13.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:01:56 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 4/4] python3-cryptography: Disable legacy-openssl by default
Date: Fri, 13 Feb 2026 17:01:30 -0600
Message-ID: <20260213230130.757732-5-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213230130.757732-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 23:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231144

Disable legacy-openssl support by default to match the openssl recipe.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 366fda5e87..062b41807b 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -22,7 +22,7 @@ require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
 
-PACKAGECONFIG ??= "legacy-openssl"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[legacy-openssl] = ",,,openssl-ossl-module-legacy"
 
 export CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY = "${@bb.utils.contains('PACKAGECONFIG', 'legacy-openssl', '0', '1', d)}"
-- 
2.53.0


