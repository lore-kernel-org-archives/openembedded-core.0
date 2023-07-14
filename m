Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4897C00528
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.800.1689374002951440651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=A6JRrLs8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8c81e36c0so15298685ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374002; x=1691966002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wd3rbgQ4hIyXJKK4ThOMqS9frZDjOj2XAw7j/0da0xw=;
        b=A6JRrLs8woXdc4oEEDjZcPlRhCNpKRIAE/DtORMYjn0ke6Ytqfe0c7cGhIKQMqje/C
         +5okJf2+PzkW+OwnT0xHlmypeDeb9e0cGrRuPaDydyqV6jNndpcu6I8q5S5qjeSHs/jQ
         LGziXPbeqfCdGXYC+P4NH8daD0DrGoarLCE/8naBLdhToKfQqwQ31+zlHkvM5Pp8/h7P
         0pVfPboOmqm0iBteqNBL216gQ9/ySkj5fhAg25zRQh8lEWpk+AuGGWnWF8pULgUOxxk8
         NqDE8E43cTwCO8KoJRZzbLReQE24QH3p0ZbXsYMe5F//F+0WikzeOXSKi/3XdqSjYxM4
         w6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374002; x=1691966002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd3rbgQ4hIyXJKK4ThOMqS9frZDjOj2XAw7j/0da0xw=;
        b=H9SGNSkha0SuLDCaI+iSvo6SCJy0xK10094sngSrsKsFXAF/fVGNi7v1Z0ypMQSUzB
         zieYzZTBANgDuthCE/cw6Pp+1RE4ggr7YZ6N6Rmyqnjh1E6lv9EVhHgleRQQqTa3K2s8
         cuixxKk9g9XLx/26h/JkO06ZHkN/zbG7z+qB92KzTsmNh28p1sPZwZNMiKf8r0nbh9Al
         2CwcHiOLDYGMMnTqh617pDT53hdMbkS1I3mdtVCVw6h6GaqV0tc0NK6OxJydlWzZLrcX
         6IO5GX2CkLTuJFJkSiMKVcwfLFDgA4gTFgVXAsrcyeaEg8HIBFUwAa7oDHPq+Ax44bOu
         nrGA==
X-Gm-Message-State: ABy/qLat8t+QwXX8zPDj5fdQUaulUcH2rA8dCQiblnFhO6DkUjsqx3kT
	q8UEkI3r/7SgzTkURFk9QRZhyb4E7hwaoNdbunQ=
X-Google-Smtp-Source: APBJJlH2o52yckT0hGSh6vVXTFuV2OMO4VGOFWGVxtOu0WCFwCRoHhKIcXF7801a69QLj1AHCrGjjA==
X-Received: by 2002:a17:902:ce92:b0:1b9:d311:3656 with SMTP id f18-20020a170902ce9200b001b9d3113656mr5482503plg.0.1689374001923;
        Fri, 14 Jul 2023 15:33:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/26] freetype: upgrade 2.13.0 -> 2.13.1
Date: Fri, 14 Jul 2023 12:32:40 -1000
Message-Id: <b89e75cd39ee704e677ab1e770884cd53cd7f1e8.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184288

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* docs/VERSION.TXT: Add entry for version 2.13.1.
* docs/CHANGES: Updated.
* docs/release, docs/README, builds/macs/README: Updated.
* README, src/base/ftver.rc, builds/windows/vc2010/index.html,
builds/windows/visualc/index.html, builds/windows/visualce/index.html,
builds/wince/vc2005-ce/index.html, builds/wince/vc2008-ce/index.html,
docs/freetype-config.1: s/2.13.0/2.13/1/, s/2130/2131/.
* include/freetype/freetype.h (FREETYPE_PATCH): Set to 1.
* builds/unix/configure.raw (version_info): Set to 26:0:20.
* CMakeLists.txt (VERSION_PATCH): Set to 1.
* subprojects/libpng.wrap, subprojects/zlib.wrap, subprojects/dlg: Updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4447b2db3166bd8c76271f0293931392572c6977)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/{freetype_2.13.0.bb => freetype_2.13.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.0.bb => freetype_2.13.1.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.0.bb b/meta/recipes-graphics/freetype/freetype_2.13.1.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.13.0.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.1.bb
index 514672c0ee..5b1c520944 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.0.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c"
+SRC_URI[sha256sum] = "ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


