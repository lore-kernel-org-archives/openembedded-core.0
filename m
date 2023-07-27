Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA2C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.16754.1690487050846485119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=f2K+waQA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-26830595676so955270a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487050; x=1691091850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1Qc1R5F8jgbQ2v+lMcoz3qL36EtA7rvCvFqPTtLQmo=;
        b=f2K+waQAlOXN4XH/eiw9NxLoGQJ2du3wz28Q4KaftnG5ARuyTBHaE8I6N99tg3TC+X
         opGw7LlTmFdu2CHu1PEKd2pawM1OohlYPCHs9t3UqNKhQzkk6ExmBM9PY5dJp7T7/btA
         T58TNl2TSfM+QcEo4q+KOokUbf8kbG93jz7hc7SMEA/YWhmmbLNuSgUWeEbYNVguua7/
         Bqzwb4vgXIb6qD8ZEJf21pMffS5mM6QwtlY0ATc8iMpX8TXcXuU0v4Uj98KpscQ1W+nG
         ft+jT1J0B8AmMEPMFvVipW0fjuPwiBiK0vsDj4S3KG9tXYu2xxfE8X430FXlEinpVx6/
         3Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487050; x=1691091850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1Qc1R5F8jgbQ2v+lMcoz3qL36EtA7rvCvFqPTtLQmo=;
        b=QyoudbRctR3MOmzZ/cYGlbAdOTmeT5u2ueyEUY31QNT7iVB5DUGfPKcXXV1YlYsNpB
         J3lPXIIe04vq3qDARDPNa5HsJCAp+VBLIexHAedlJKDy3C0KsBpxC5RDmvgduWnNbpia
         UPJx/xEi+mBhe3zb3YYa+uNXbk3CkDb+1Aj1pW9nVMC+4ftF2EsdGP+DoVkIi4aGpM44
         xi4Ss1cZsf16YvSqyF5nsm6mIJmStQE00G/rlFjBRxauMMsz2FsmyzLEV7JJviUHdnyt
         YipTljUkePtXEtUJVLMiwYZ3yafe61PpkcD3jF4Oq1K4Ro+QG1EtUoM6QMdtXpuJKFn6
         MO1g==
X-Gm-Message-State: ABy/qLbdHLd7xi2oWFmPDxH88Y9ugRfaBnpNioJNx4qy/7c+KVkmXYtW
	BMQ1I/BapXLIDE9wimdJbQ4ri/00g0Rqg/BDdFw=
X-Google-Smtp-Source: APBJJlHpfXXBosww0Ij+20h1yXVSY5kiFHWpvITh+UH/tB44ep5EMA1cdxbw5+NpzmbtKecNAbk44g==
X-Received: by 2002:a17:90a:c90a:b0:263:72fe:3ef7 with SMTP id v10-20020a17090ac90a00b0026372fe3ef7mr261698pjt.42.1690487049981;
        Thu, 27 Jul 2023 12:44:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/27] taglib: upgrade 1.13 -> 1.13.1
Date: Thu, 27 Jul 2023 09:43:26 -1000
Message-Id: <5eb1b017cfc136d23631b2008b417b82993ce4d8.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184983

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fixed parsing of TXXX frames without description.
 * Detect MP4 atoms with invalid length or type.
 * Do not miss ID3v2 frames when an extended header is present.
 * Use property "DISCSUBTITLE" for ID3v2 "TSST" frame.
 * Build system improvements: Use absolute path for macOS dylib install name,
   support --define-prefix when using pkg-config, fixed minimum required
   CppUnit version.
 * Code clean up using clang-tidy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69477347a21cc810851fd231659f73c6b4661d03)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_1.13.bb => taglib_1.13.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_1.13.bb b/meta/recipes-support/taglib/taglib_1.13.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_1.13.bb
rename to meta/recipes-support/taglib/taglib_1.13.1.bb
index 6560bc3660..3f0a759f95 100644
--- a/meta/recipes-support/taglib/taglib_1.13.bb
+++ b/meta/recipes-support/taglib/taglib_1.13.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0"
+SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 
-- 
2.34.1


