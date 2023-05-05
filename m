Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA077C7EE2D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.30320.1683300027354474864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pUXQYaa6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-643912bca6fso1542020b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300026; x=1685892026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CymKsu1w2+hJ5bdueULDwhUaruCDDCbX0e4SEWBbZc=;
        b=pUXQYaa6IyhrxoWv+rXMlxBJcarP6nO5vrz+/lvvf4xFFksRgH/CVSN9u6uKqju+IY
         Z7ss2BBpcg3q/wmYj+eLT7ABPJToIK1IK8EJ5FnoAegihV6cO8cOmxfBrslNcqd05Rkg
         BjLUffqM61tUFE86EadDyf9FDcxnzNzwvXDAmczb3zFaZjzXVM/nv1RPwwzqT0wGnTYS
         XWvnELyP1cBebnKFD1jW/QbqUMJdZ3aivR9CwGh9vhNIH/G6LT8ADDqrn4Oip1+P7Rg4
         dznT3TgUDJmdMLlG3tF4Yol2OggV7CLTc2IYUvomLt+4RPETiOdalkYqsmZ/6OKo6r+G
         9ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300026; x=1685892026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CymKsu1w2+hJ5bdueULDwhUaruCDDCbX0e4SEWBbZc=;
        b=ST9SHZejUXqQj9efrDSce6BgFKuubnEgaX8OnWklp35NAbruFCVXwSOcfGc8kmeH0B
         iCLsPk1qY7ms16B39Y0baOtyuv4cF7aSEiq8GJr10xGF0jo5UvNIY0c0o2/9J07Mi0yH
         1IKnxQuo2b2KyH+SlJjWq6BgsUcoDr/5kK8BaxwysONuqMY3W9dOMCrMI1OckaJCw146
         YcteZADNEELTPROI+DA9K2f8I1Q7b1FYdRgqNKvXOzBLblcnPntKO9YJgmbrIeSQWLFR
         aJHBSVlyVfdKyaRlnZkrcF/4a+XPM2My02HhJ20+OCd9vXjShLe5aEWaTJEkKmL3b02B
         kuww==
X-Gm-Message-State: AC+VfDxa+b03GjjJ2EiyNVB7aW3FqLiKjh7v2CadZ56+WKOdrVaaeAZd
	lH4E3q0ApNQVJTur9yFCti4qKpKoILXos6xSazo=
X-Google-Smtp-Source: ACHHUZ6ZpmUMJm64Kkt/ZXZ10E4qmeY+/YjAkYia4eM7XQLnKo5Wcfe/bW790/z+hNPDX3YHr34uGA==
X-Received: by 2002:a05:6a00:179b:b0:63b:62d1:d868 with SMTP id s27-20020a056a00179b00b0063b62d1d868mr2893480pfg.8.1683300026429;
        Fri, 05 May 2023 08:20:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/35] mtools: upgrade 4.0.42 -> 4.0.43
Date: Fri,  5 May 2023 05:19:25 -1000
Message-Id: <054490362e8848907f19fbff5b7b5f31353458f8.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix root directory test in mattrib
- -b BiosDisk flag for mformat to allow setting physdrive to
  a user-specified value
- Clearer error message in mformat when trying to mformat a
  disk whose total size is not known
- Make recursive copy more consistent
- Trailing slash now always implies target should be a directory
- Code cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7f04fd469f9ee989eadd85ea949527300704ca70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/{mtools_4.0.42.bb => mtools_4.0.43.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.42.bb => mtools_4.0.43.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.42.bb b/meta/recipes-devtools/mtools/mtools_4.0.43.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.42.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.43.bb
index 85d9e451c2..859103979e 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.42.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.43.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "64bfdfde4d82af6b22f3c1c72c3e231cbb618f4c2309cc46f54d16d5502ccf15"
+SRC_URI[sha256sum] = "541e179665dc4e272b9602f2074243591a157da89cc47064da8c5829dbd2b339"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


