Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12841D5AE50
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2868.1765620014086237140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=INIENSFr;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f0f875bc5so24816045ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620013; x=1766224813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGCxxoOhxNtMhWzMsPDUirtdAGm3sKX3DKpGoUU3Bu4=;
        b=INIENSFrZG3DsxoW8BX6Px/8mD8VVvV/Cmb+2M/gchdJy9DQhcIbwxUSr4DXM9EXbY
         52Wmia4Tyzo6qVap/BrcTDIIBcbh1/J1sB78gIRIIRBdF39c0CQGaimyqYo0fHQrqKts
         +Glv+YbFyl6VAOovwrE4Wh4bEpko3gtljaVjGEPUihrm+gDVwQdnkxERnZe9gaJ45AcT
         4TTDcInw+M2t7AYiKLXjefPiAfVFL6xery67uCeUI0DY8KhV1Golp7oa2+1trBYb8Se5
         BcQZgnVqjTdMwXrFfsxvjDdjWRq7wn4IGwRhb/T+LZSLUQe4T10H13hcr/p5zvfEeT6y
         m4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620013; x=1766224813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGCxxoOhxNtMhWzMsPDUirtdAGm3sKX3DKpGoUU3Bu4=;
        b=eQiCEvVNm0IeAlyjzhjKGYm5eeGJ8uvnil+R7TfyCNJWwlnPmXxcl15BIgjsHxSrDq
         u+8wRdp5uf6BgDaGgZevPQU8pkhFAin2sB8XQPt13kCn371OBzjF4lEOIik8pJN4sLMe
         wQhLys91N5v9wKRLE+DzqqExC+NNinwnpY8/uzTUG2ofIVteantBask7L7bj7nP3Z0Uf
         y3YGZxBtndcxbc4WaDeurGAeiOvk2/shCPCOgRSdoH9SnL/vEAXsaeoEe5SkJXj9mh62
         +oVK3Y7Lsk2NaeAcblFmFWhcBft35eKNzyDlUFMT9IkkjDvZHXqceWn9hap7iZj18Ssi
         GLkg==
X-Gm-Message-State: AOJu0YwNcC7u9Qw3c432iTU/mowFFkrFz5AhxII9MrCvho7GJcH/5ITY
	BU0Px3PccVD9pqroTQz//Bcu1bttD3VF1K104unLaTGlsAu/fJ2Tv6ZNsKT1vHYg
X-Gm-Gg: AY/fxX6K44ajTzXegKkmhpJBqNpxQWLZ1nwRW801hUxbqC8XNH+4G9UI6+LAmTwe3Fh
	l/a2pHd6TgI6maDGV6qqcUD4mHvKnz9VLDaBvSjuHwZ7ylEjRI6YOV37ydQisXe2K79AMdLg+d4
	JyI9izO/5mjO5ETUyRDZ6sQAzl/5ZUsHGWkh35A1S/wAFeFsoJmJlGNramHngu+oNulDRecTj6o
	2L2GshvYizYmUSxwakYun6NW2xiDaNtxOMxw9JQpWW2Wf+txeyjJ/uQJt01E6H267H5MTFK/lRv
	wNLEfmIwNfahwpGL8L7VgfjNKusgQl5UTPKUuK1w8YIfV70FQoNW8VcPevUU/RiLjX9fBWaeX9D
	/Gi/s03wsfa/w4Uj9z1WVIBgGOY23a2/cW02vmIh9lNNOKZqJJqS0CLcPYzJ7BpkrYOvVAa9Cuy
	RD/pb64d533aS0VhY0EKzZlac1
X-Google-Smtp-Source: AGHT+IE0iAM5n/dIsu1qJEtDwywFaCLmIhi1+pfot9qSdbTFQxVSl94hRl8sDWN3kmMli49SgxasZA==
X-Received: by 2002:a17:902:f64e:b0:2a0:980e:b905 with SMTP id d9443c01a7336-2a0980ed49dmr14569355ad.17.1765620013285;
        Sat, 13 Dec 2025 02:00:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 13/67] libarchive: upgrade 3.8.2 -> 3.8.3
Date: Sat, 13 Dec 2025 15:28:37 +0530
Message-ID: <20251213095931.2571498-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227631

From: Peter Marko <peter.marko@siemens.com>

Release Notes [1]:
Libarchive 3.8.3 is a bugfix and security release.
Security fixes:
* lib: Create temporary files in the target directory (#2753)
* lha: Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET] (#2768)
* 7-zip: Fix a buffer overrun when reading truncated 7zip headers (#2769)
Notable bugxies:
* lz4 and zstd: Support both lz4 and zstd data with leading skippable frames (#2771)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/compare/v3.8.2...v3.8.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4b32b43a607bf708e5433366a3ef6cbcd5b8b221)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.3.bb
index d4f367009a..e3706ba3bb 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "5f2d3c2fde8dc44583a61165549dc50ba8a37c5947c90fc02c8e5ce7f1cfb80d"
+SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
 
 inherit autotools update-alternatives pkgconfig
 

