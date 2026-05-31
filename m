Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F6CCD6E4C
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:14 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16955.1780186691604336107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tOZqwOSd;
 spf=pass (domain: konsulko.com, ip: 209.85.215.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so46544a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186691; x=1780791491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOF24l9W4EgNoQEBqbIR6XfH6V66X19WhkWqHlqsEyU=;
        b=tOZqwOSdiDWsxuMe0mIHgNC/TYTh5dqTwR9ih9gX9sV1Z6ICnOPx64zcLKVs1BsrpP
         58QBsk94DzABpvuWy1nEk/2kjSpgsE12MPWUm9CgSaUQl2ZBzQR9edkO0XYDuLx2LwGh
         2S6kD69DAxc1ZXjrR/QR7kfVmesuzhrRign/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186691; x=1780791491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOF24l9W4EgNoQEBqbIR6XfH6V66X19WhkWqHlqsEyU=;
        b=eCLO5PyjrlaEDtyUkLuEmbJnbYXT5TNP19ND5kD/mSZqCG0Q6Trj/VbePIbx3CyIml
         PcD5c+9VuVuk8XhjtZaf0hSWiQgNTk+/ECfNDdnSWm/1mZDWzahgU+x2dfyUx9lgcokw
         vYLWU395nEM/WBvd4EWHcZSo9+gf3XJ8rWfpb9ub5/5Nsg/8YA3crR72/0buJCSyzgaR
         4V8lExpF/N67c+90lgJhYQp7p8zczHk9p0N8O2PokqggEygGX9ikG7mkhVd1h8CZ8Gco
         alx37t1ipHFSCaladuw4BDTvrxeBM5yK2iQU3r1JokQGC94TPvc+65bgU/nd+5eqtREH
         Oh2g==
X-Gm-Message-State: AOJu0Ywv0hJFGHrVK9/mIeSIsKEl/nHfCLIRA8ZtV9tNr+0HbyhoHc81
	03R3Awx5cRXeUZt+BNKn00MI3LenSppVp5CMJbPYPZu3V66bF3xbWKgilG1dwBxonuGwxJfKQ8q
	2vn+S
X-Gm-Gg: Acq92OH5Oh25hhpf9xRkLfY50Y3NJ0RdVwCiJrBpl2HwnKhjvkH2yhqFSt/PKHc2emf
	5yS/dXRL+z4LPZMpVsGNg7OVeJam6oE/ZWO0hYzhH1lElVskltTmFetX75dwDKmMeR4oGpC5NVc
	v9eWjO4JHiR0QDbjWQYYsl2Kt+YMU+Tx5WLT2LcYbtuh16DBmldW7zqGM7OzhJtrk1Vy4D1sRhP
	fa8dcUT6UXpJxgkLmMnpp+hH/+NaErktKbDooJ4sGzgIZpFiaEUtwO5uKnj4x8O2i+FznwlpN7s
	sDr1zxlBmdfsIyoyN+hDEpodWY17/bNtLnolv6IoG/XzY/ot7krKYVS4xmWgnTYHfdvJOyhPTX/
	i/DqcF7ElH/YyUC5dMXQHni73g8y9a5IvaZiXFcaNW3QK5PnBfI/W8ks8fN0KFFRN5m2VMLBQi4
	yECCyLPQA1OffQhiy8+qvPzaZNjrjnQ2DqXpnOJlc6yPWRwPCeX2XVHZXxmWJUg/edupZMxfJzP
	A==
X-Received: by 2002:a05:6a00:3ccf:b0:841:4961:8d35 with SMTP id d2e1a72fcca58-8422520762emr5131977b3a.0.1780186690871;
        Sat, 30 May 2026 17:18:10 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cc0d1csm6270562b3a.42.2026.05.30.17.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:10 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/9] python3-packaging: upgrade 26.0 -> 26.2
Date: Sat, 30 May 2026 17:17:50 -0700
Message-ID: <20260531001756.1582306-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237782

From: Tim Orling <tim.orling@konsulko.com>

26.2 - 2026-04-24
Fixes:
* Fix incorrect sysconfig var name for pyemscripten in (PR #1160)
* Make Version, Specifier, SpecifierSet, Tag, Marker, and Requirement
  pickle-safe and backward-compatible with pickles created in 25.0-26.1
  (including references to the removed packaging._structures module)
  (PR #1163, PR #1168, PR #1170, PR #1171)
* Re-export ExceptionGroup in metatadata for now in (PR #1164)

26.1 - 2026-04-14
Fixes:
* Fix > comparison for versions with dev+local segments in (PR #1097)
* Fix incorrect self-comparison for InfinityType and NegativeInfinityType
  in (PR #1093)
* Canonicalize when deduplicating specifiers in SpecifierSet in
  (PR #1109)
* Fix charset error message formatting in (PR #1121)
* Handle the key parameter in SpecifierSet.filter when specifiers are
  empty and prerelease is False in (PR #1096)
* Standardize inner components of repr output in (PR #1090)
* Specifier’s === uses original string, not normalized, when available
  in (PR #1124)
* Propagate int-max-str-digits ValueError in (PR #1155)

For additional changes, see [1].
For full comparison, see [2].

[1] https://packaging.pypa.io/en/stable/changelog.html
[2] https://github.com/pypa/packaging/compare/26.0...26.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-packaging_26.0.bb => python3-packaging_26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
index ff45cb5133..1e4c0a6bd3 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.43.0


