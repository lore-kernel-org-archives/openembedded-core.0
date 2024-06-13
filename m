Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB02C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:43 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.9958.1718288441764960961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=he8bjJwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6e40ee57f45so852604a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288441; x=1718893241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0eRdF2AQFn3TG7IeltEbIl9UCQFckTuYIsMRnJWDsI=;
        b=he8bjJwCFOzNisb8Zge+hN93BIs9kI8KgqJ/MWBbDKIsY8Br1wna8byaLi5orJAea5
         kyDC5vB6eEX8k5C/7XdbP7exSOPhQiUzn+36XpT1y/dzvrvNLIC2ba29J7o1e9CrONFD
         hwr2EwtRLF3ntvbJulgIgpV6Xz2d8Im4iYwvtIMlwoYIRpr923K6pMqzIGNTx2V8m5Lg
         rIEzXmrSyZmlZtwQySoodGnpmBjYhTohFwsEJRWWQ1YPrVCAHpGeD3vD5mWHUqQ5AdFN
         xd/LEw20oHzLtNRS/a0qLl7hEGhmA5BlsPRB1saXYVbTzMxLM2hd9KMQ7GNzfiJk/1l3
         YC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288441; x=1718893241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eRdF2AQFn3TG7IeltEbIl9UCQFckTuYIsMRnJWDsI=;
        b=lShgdRkEVZORpsUBN4clJHyR54qUhxOyBwjECpm3aWojhPnD4j16Uzc533m5OO+EXQ
         tl5j1EYfY8ej/EpR9A3FEWugnaoyvLqc2DdQCpVWby7+F5ZM/U/CjcZBg8iIGSz8iryO
         Ai6QZmN7CPDGhDfM+Phonmi/OgYV9WeiMMPTCTfdfWjyRWpXdBUcNxVUstNUCQMODDFE
         VQYZujbTBk0NQEg4D8U/bFNXYdAsBsqfQ8yTH+It3USYlvDjZVmAyZQkKem2sWi+l62O
         JRYbTlz5weGrijMluPG0svCrvwMZIMkW1A414I6vQuSNfIc15MuZF16P+ofpNBZ1S/BY
         nxgw==
X-Gm-Message-State: AOJu0YzqkBXpkBeC9j2jzj7Bwd6zoOdBz3qjSCZiv1bd0cmIKiIHlX3l
	RHgITCXuAutwdYwAEH3m5N7IU38mpqvt+9RhVDwqKiEgTpBl0GvmZHgYzR7qAutGV7z5b6lyiFB
	e
X-Google-Smtp-Source: AGHT+IE2zzTw8wZ8fk/uc0ZblF7nbZCw47xVMcBt+epDIMrhcMM3u63/kt8TJ049NN6ZA5Hi9ktCFQ==
X-Received: by 2002:a17:902:c94d:b0:1f7:11dd:6d89 with SMTP id d9443c01a7336-1f83b76c5a9mr55714355ad.68.1718288440893;
        Thu, 13 Jun 2024 07:20:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/29] cronie: upgrade 1.7.1 -> 1.7.2
Date: Thu, 13 Jun 2024 07:20:06 -0700
Message-Id: <c33261bbf0193f7f73c57ec8c463ecc36799991e.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200604

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
*Revert setting the return path to <>. It is not RFC compliant.
*Inherit MAILFROM from the crond process environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e93d7ba7ea3718e396510b12726a232edaecf976)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cronie/{cronie_1.7.1.bb => cronie_1.7.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.7.1.bb => cronie_1.7.2.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.7.1.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.7.1.bb
rename to meta/recipes-extended/cronie/cronie_1.7.2.bb
index 854b68163c..abdaff644d 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "78033100c24413f0c40f93e6138774d6a4f55bc31050567b90db45a2f9f1b954"
+SRC_URI[sha256sum] = "f1da374a15ba7605cf378347f96bc8b678d3d7c0765269c8242cfe5b0789c571"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


