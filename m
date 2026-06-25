Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AF8CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:53:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16226.1782406419117042244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 09:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rtuSVra3;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7ecaadddfso794315ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782406418; x=1783011218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7FGUy+jr+qMDlFdYqDZLVkgLaOAgYNIaD+JZ7kfhI8=;
        b=rtuSVra3UZHsKqFq+ovWUodIcvUpFKlsek4n7QIoZM8zzWxlm+ZrtW3UU9q2Oo8kIZ
         SdLuo5A3OMC14WW3AAHj2zrJCYn9bBQ3ULLZGis95QwgjAaLaozWIZOoLK3NRLPAMHOd
         O/rkuKIuJOP4eRb4y03lvkPCJIqUfvqH2YFoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406418; x=1783011218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7FGUy+jr+qMDlFdYqDZLVkgLaOAgYNIaD+JZ7kfhI8=;
        b=MHnG37efqLTdarr9VbejynJx7WZmKfRjiHqh0uzdCT9jqp8uKaKhluikjiyPXcSIy/
         Dd9gPMNZAHsofpK7jumEAxoWvj914zuqBhuuv6u/Jcnn8t5pwcKp6IPwijnFfzS7fJSe
         GLUsKXd6tGG+7VgJo1DnT+Bq5F6ImaeEkby1UTngRLcY/b0if5abKXfU3LR37/02NTsc
         J8UkuL64lSCBTN3Hw4XyetWVP4GnCLRiJePQdXokQ0EAJKooVTmrGlR/o2MoukHpkSv7
         By9q1YArj+nIaGJy7XcEQ+SKNpNi0gTcIdMveXBF/JDpS5KhelS9BPke5deD/vjR9Evg
         0Ulg==
X-Gm-Message-State: AOJu0Yy9ese+2Nv794DnbkAqdZIZLKOMAPx5nHIRuuP4ij4VRB5YpIfK
	hkAieU/bb1r6iGaBHLy17ZZeXM2KFAyUSdbkZg186anqyJztw34mShUbKpVTGSYBpu5ZUy3SN8e
	0lxMV
X-Gm-Gg: AfdE7cla/q2W8alMziGddY3Nw7H5KCzeMjqCWK7HiYq/tDWp8E8VsvkVNMjsdEXO0js
	YoMdvsjwjPMSoA/BjaImyEZoQrc8i8D4H+lfIZGrT6YyPkwn0CFIwe3kFIjcP0GOeQlPoaG2Ouu
	UsAuuFRHyXh/HSwCUzXeXjNZemaW5GufEc4TqvLGnC6xv8w3g7tCSQCyI0gmghw8ZZ26AoEvAlK
	TVL1jcyK0jhNR++kYKKEz3vPQqwoJWbdZXb6ayehWl9JbByb28mrQzS3Ddl5leXdReAuRJVHsbD
	qN1dk6x+LC+XFBSeoC8GWDZXFTF8fJyEIaLLwxC7xhFztUjxe/SZoRusyQ4MIBKJIRVXqFfTuaP
	6r8wbGabOjU+eclcAlqcLKNXlDRzE7Ka7jprCkb5zzoIQN2fOdrQVyNxHf+U5LsFK1Ccr0WGsz9
	VBkEsrl/5S2quOx7HVTtHoE2zNr3lsEQ==
X-Received: by 2002:a17:903:3887:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2c7fc6f2ecbmr38667695ad.23.1782406418534;
        Thu, 25 Jun 2026 09:53:38 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:9a80:98fe:3666:7312])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8ad5sm23621515ad.13.2026.06.25.09.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:53:38 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-certifi: upgrade 2026.5.20 -> 2026.6.17
Date: Thu, 25 Jun 2026 09:53:17 -0700
Message-ID: <20260625165316.2558993-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 16:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239581

From: Tim Orling <tim.orling@konsulko.com>

d46de62 Bump actions/checkout from 6.0.2 to 6.0.3 (#417)
6c183ec fix: update Requests docs link to canonical URL (#415)
36e3568 Bump dessant/lock-threads from 6.0.0 to 6.0.2

For full comparison of changes, see [2].

[2] https://github.com/certifi/python-certifi/compare/2026.05.20...2026.06.17

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
index bfeaeb965b..db78aaea0c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
+SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


