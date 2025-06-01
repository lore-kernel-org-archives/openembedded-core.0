Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E5C5B543
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:50 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.37189.1748816803684452702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OXLNzXjl;
 spf=pass (domain: konsulko.com, ip: 209.85.214.195, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-234fcadde3eso45376355ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816803; x=1749421603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMWTgkZm6fVe2DNirL+kPR3LKVdhdS7TTXIOTXBoL0=;
        b=OXLNzXjlo+d1EtZm8G48yDjDHGdu2TTLsftke8K2iWGRZxwm2JqyDjxff6JBmneaEc
         dj5ztu4ZWe4w50eQ2amxQUlvThNqAd30GAdaFd+CYST7ljXWXkOQojWUeJIl8w+Dvma2
         CtxObNzyl4Op/0K5OPhEFE9X9a3yr2v/syUYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816803; x=1749421603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gMWTgkZm6fVe2DNirL+kPR3LKVdhdS7TTXIOTXBoL0=;
        b=vE49a1jJXzyt5mG5zLFSnbrcqT3RxEmDTgpRnyigWQnmqH53ySl0t8mPLLcZVmG84n
         koGxCJ0nOZFXLmnZr1/VnRzboqgv7VlnR192P0oSlk8iTk89caTagBapI24rxR9UI/dU
         HXv1KK6HociG2jOBMLkgjA4wukfB2x/UfjnXrr08C4L3K/jXEgcpSk0wr5gtj81tbUrH
         SAPRKabz1bPQNg+ZmXDViki2BkWr/fyGnK8+zkzEOF3XgqfnfKwf0cNy1BW2ZJh45SSn
         /VcJSjFC8S9nr2woM3gKhPFWj92p2XdeMwrrtj0xrpXdW2PUv/OlW3s6MOZAbuPOBHLA
         5G0Q==
X-Gm-Message-State: AOJu0YwkfM5y364t3ts1NcwT61pqq9Mx1gyGbaKfH+CJHN1Auuadu8uf
	qMKN1dF/xDESULJwD/7v0TUU20xY6M8YZt1xNRBH6RzOpUi1a1Zz0gmSOHv1m+BIjSBbBY1xS2w
	ZKoGQYkpji8q4
X-Gm-Gg: ASbGncuiFtl1DHgZ0vhhsfHXkEwmVDcn6VS42220YxEojEmfokGtnhHuzZ3dBgdxsxg
	6gMMjdnkyJYYRHGC//KtvUxQw3PvhbqTH4xrVYO7o2L4VafoeLK7rdzqG/K8kkUnoopRkt/oyda
	dBA/dck1gEFW88ara90lnl1bv/mOwvI3FgwyEEiyqz6an3b04zhHd7aZH+JTvb7eKjI18apxjCE
	rzH9kAez50RDt3/UfIpYsPKrjScU+fsNtOStGwZomt8/sjyVJHKSm18zH7tvrMFaaYtGraboGnp
	/wMUsaHqZMLwLzBPYFsVhq8fq3sOlKTYLbQJ0bi/mH/4gcwe/ltrSdq/kvb7AFbczhbl3iMCCsI
	l4fdj4oW6XTPbDnhXWHOyo04yow==
X-Google-Smtp-Source: AGHT+IGiRYFormLWhA6PgQ5uPTwbHQ/Nb1rNgEU0wjP7DTT6nVmYLABBJRLGDA4YM12LeqlWjhZwkA==
X-Received: by 2002:a17:902:cf4b:b0:234:d7b2:2ab5 with SMTP id d9443c01a7336-2355f7823demr93943455ad.15.1748816802717;
        Sun, 01 Jun 2025 15:26:42 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3563sm59119255ad.158.2025.06.01.15.26.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:42 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] python3-urllib3: upgrade 2.3.0 -> 2.4.0
Date: Sun,  1 Jun 2025 15:26:20 -0700
Message-ID: <c799fb8525384c72ef1c185031b21468c96c5924.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217685

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 2.3.0:
https://github.com/urllib3/urllib3/compare/2.3.0...2.4.0

Changelog:
https://urllib3.readthedocs.io/en/stable/changelog.html
https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#240-2025-04-10

2.4.0 (2025-04-10)
Features
* Applied PEP 639 by specifying the license fields in pyproject.toml.
  (#3522)
* Updated exceptions to save and restore more properties during the
  pickle/serialization process. (#3567)
* Added verify_flags option to create_urllib3_context with a default of
  VERIFY_X509_PARTIAL_CHAIN and VERIFY_X509_STRICT for Python 3.13+.
  (#3571)

Bugfixes
* Fixed a bug with partial reads of streaming data in Emscripten. (#3555)

Misc
* Switched to uv for installing development dependecies. (#3550)
* Removed the multiple.intoto.jsonl asset from GitHub releases.
  Attestation of release files since v2.3.0 can be found on PyPI. (#3566)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
index fe913e6b73c..7a4bffc05ee 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
+SRC_URI[sha256sum] = "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


