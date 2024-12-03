Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69851E64A9E
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.19586.1733233062131375206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lrbcSpvL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215666ea06aso22116705ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233061; x=1733837861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rUDM+o1XOazbzWTK0N/5kQXVFTKBoweZtfab8YsYrs=;
        b=lrbcSpvL43yjg44TUJmMg+IoUbKM1PL+PhQiQrU9UXg5ydOFQVoAtD4tyL++tQOwRk
         8pkb7h61UU+hI2c8FkemOp+ddPPcD8KuITyxqrmi9LdTIm5sRKU40a4ZCYnB0Wlt8ME9
         B3aLdwiZaArZVMm1jBAMVURQaHEsjBKkNc7yob5VFjs2HPNXAnecya+wOTkxb7qY2jMg
         E0Ge3kfKGzuTVMy0yewuzz+ChTSs32rSke8MUnVr/niDNj6BIRVXf60b44pz4LCayiyD
         HI7aBLE8AZNYraaNKlVSn9sjoUaio+4cmY8Ks/isAERUkTFFXWT1ENi5McvJ0nhcWEB/
         GJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233061; x=1733837861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rUDM+o1XOazbzWTK0N/5kQXVFTKBoweZtfab8YsYrs=;
        b=NQqj999JrPM17hM2uv68Q+tTLj9yIA2yTz+4Zk0+kzTttaQriv3vaktPL6yK6ZmYxt
         qYoyXgBRd538uSDgYa2w3dU/lD6PIK6mVRH8ZzpVMWrexv6tkNfWClxY9MOuv1Z+9S2u
         Z0AeUwYuriQIWv2z/fe48OdLblsGxJ6/RJGw/GSkgf7v7EhJW3u4P+4QEZfFPPBqkB4h
         s9NNIstl1NM7vvGJ0hUg0Y0RxJtdMTS8fDP/WizDng9IpgYTekF/Yo23DxlYZYQTgC62
         DjZeQzg/WIvQB1Ht9XDn93+uydsSLsiYLVQeHjocDiXP1Ydd7SxID3w+PTaald33DPxz
         FUDw==
X-Gm-Message-State: AOJu0YympZp6QQ/EsWmghF4/H3pwe+0Vr3KR/uiXkgGTJE5yWNzfdCZJ
	W/sWuA9hOHfLiikhLghX3pmzaewVEpk1wTlmsisxjsQC8sMY5yzjHb9PTreA95EQySplJdn1v9a
	h
X-Gm-Gg: ASbGncvL+K/LhtUbJa5w9iuPYheKtinBiXqDcvjuMDECd1qMldkJMgTYIszT+3IbAM1
	GSnu4ZAS2rn5myrU+18M5hbNjGYOiegxygLN6fo2JhSIABloTrtuL+gy+xTZSwVs8lsNyLD542e
	h0fYwRbQBfzk7SO7HMCnI53i5N63rpkF49LYs4q7usmwybv0RA5wPkM47pxs45Vfw6Gmi+QCw+2
	xbYnzCAGnuebHvZCstO0sUhSUwO+FWFcfXIc7s=
X-Google-Smtp-Source: AGHT+IGt+zFhUHSDStYE8nQwPM+rmHabKIgHfr6xkP0NKM6kvpOakM7ZGM90VoGAt0/8K42MReu3HA==
X-Received: by 2002:a17:902:dac3:b0:215:9bc2:42ef with SMTP id d9443c01a7336-2159bc24490mr124981325ad.1.1733233061345;
        Tue, 03 Dec 2024 05:37:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/16] python3-requests: upgrade 2.32.1 -> 2.32.2
Date: Tue,  3 Dec 2024 05:37:12 -0800
Message-Id: <5b420f3526729809f11b187f48469a7a86d6a93a.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208197

From: Soumya Sambu <soumya.sambu@windriver.com>

https://requests.readthedocs.io/en/latest/community/updates/#id2

2.32.2 (2024-05-21)
  * Deprecations - To provide a more stable migration for custom HTTPAdapters
    impacted by the CVE changes in 2.32.0, we’ve renamed _get_connection to a
	new public API, get_connection_with_tls_context. Existing custom
	HTTPAdapters will need to migrate their code to use this new API.
	get_connection is considered deprecated in all versions of
	Requests>=2.32.0.
  * A minimal (2-line) example has been provided in the linked PR to ease
    migration, but we strongly urge users to evaluate if their custom adapter
	is subject to the same issue described in CVE-2024-35195. (#6710)

https://github.com/psf/requests/compare/v2.32.1...v2.32.2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-requests_2.31.0.bb => python3-requests_2.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.31.0.bb => python3-requests_2.32.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/meta/recipes-devtools/python/python3-requests_2.32.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-requests_2.31.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.0.bb
index 287b4f8eee..b4df4c5dc7 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
+SRC_URI[sha256sum] = "fa5490319474c82ef1d2c9bc459d3652e3ae4ef4c4ebdd18a21145a47ca4b6b8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


