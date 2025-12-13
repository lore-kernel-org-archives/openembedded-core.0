Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5043AD5AE5E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2981.1765620044688951890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kw+w2PKi;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29808a9a96aso27489175ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620044; x=1766224844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz/b+p5f+qJxACa9o3zP0K17MJQsamYjkxJG6czi8OA=;
        b=Kw+w2PKi1ZIv2LZW8x/MSMn089MrEeN1U0WvBjBSL9W/Bo1c0qopCxY+ZjbuBlJmyS
         C8tG13WinWAfragF/Qkt7bNFi+EO/qe/77uAJUnZG9LIriXX++ey1NbpZ4uOtNnFqHnP
         FOFjc2HN/Trx0QyVTSN7AxZITcPmpwCu4fVtfeDfEtpfdoo6AHE8sO7zylTiJJgHZiQa
         22GFrO4od97v8smYI/fSUBd0j+wP6hf90waZyzk42urU/uqxQ8Knb7DGqqsrrImZjwrc
         q4meu8sORA5vLpJ3C235WWymtQqBb1FF1P3jQ/crMwSPG5SdFOPg9hEmobh8TWxUlq37
         kBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620044; x=1766224844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xz/b+p5f+qJxACa9o3zP0K17MJQsamYjkxJG6czi8OA=;
        b=Ag1yEtlGSKSuoBZGz1tZOdlVSdszQNKkB7kf6hC7I75EV07z5q+7k18NmuEkGaSXmU
         XGrjizFA0xaanA3Lp7CAq00PdgB4R63JUo4zbqZRP+0FwmY7/HZweWbSts7wly72TaR8
         1ufIPK2uE7w+bgQPVoPoFgELnTHemuCGGrj94CZhGQTdkG29oEmvih8esmOHnF+40J+b
         eLh8pAEGEz9ZKJYHpsxdbIfE5jg894V7ESoaQNPtIkpdBJy6XC3aTH6gyfPW7XvC9q22
         k/s2s2OFSycYxbvuMJORtXV311UTeOegxTL1GMXmoq/wzIE6lOy/LMEDddKZxeoiFBI0
         gHCA==
X-Gm-Message-State: AOJu0Yzc42fKhChXtLo57sx18+/ggZ/WKT/0/Uu398PVdpTInPB6AsDb
	2+MeZKG+p6dE1gHhxWKPaLc9D6bYSom72IoznLGCYtrNZmxyKr1FT9DatiEUuSE4
X-Gm-Gg: AY/fxX5xaf+Vm7CHPRCv1nyHaCgCVtB4nYp/MDvK0lOY+Pq+EucHBEsjscvSeMDo8jD
	ZH17SmHpgRAm/e7MVVNVOtcIxHapdyFPGFwAMQdmTo99c+uV1LPgziOf57u676wUSuWt3LovxsL
	RTB6UsmFyi8vgSYDXJb36kL4s41+EjjCFuNtLtpvXsjYOn5qmZG9mUYyZsGY802ONYdSLiRTEOL
	dOws5d++lMU/Aihl2OtYlimxKrvRUv0E29v/8UmiTyHQu4gi4L9hVFkl1Olf1wdAGwPwvgmfvuf
	1mjeaPf6OGHmTXfl0UyKo4Oy9keOGt53wsi4dG0X4ikK8AGnLsPLdfcD7vK6IdiGUNeA/Lviwyc
	TNhB3HOZ+eRltfdEEc1tvnADVRwtEFEZX67mG0Qj7hAp6XB2nHdLkLzIIP8hq7ADQx/VVo3fsyb
	9iMBTGmW6X3/X8nRs88O497Y/z
X-Google-Smtp-Source: AGHT+IHfUJK9dprF0uyA/yiTCF2L3aCr76lRfNU5z0pdt1jbI+syx4eXBWcmGKyaUh57i7xDxq6IPw==
X-Received: by 2002:a17:903:2bcc:b0:295:8a2a:9595 with SMTP id d9443c01a7336-29f241512c1mr51035905ad.39.1765620043842;
        Sat, 13 Dec 2025 02:00:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 24/67] git: upgrade 2.51.0 -> 2.51.2
Date: Sat, 13 Dec 2025 15:28:48 +0530
Message-ID: <20251213095931.2571498-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227642

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 47c077c43879cb5e99b5d6f6d66162c70a1f4d9d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.51.0.bb b/meta/recipes-devtools/git/git_2.51.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.51.0.bb
rename to meta/recipes-devtools/git/git_2.51.2.bb
index aeb8c54aa0..14d5a3d60e 100644
--- a/meta/recipes-devtools/git/git_2.51.0.bb
+++ b/meta/recipes-devtools/git/git_2.51.2.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
+SRC_URI[tarball.sha256sum] = "9b44c2b337ec838e10aad42439d390963904449710d30c9e7e4ba449f45da98f"

