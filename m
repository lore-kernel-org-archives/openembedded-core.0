Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E0C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 14:56:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.12593.1656514585121552374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jvg6xsQ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso868050wms.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G3FuNb93hwUCgGhruCy6lVdVXsqhJ5fKDO2DoMQqEd4=;
        b=Jvg6xsQ+/Jzq1GB4trKQrPoBYh160Ejm89ahjuQJlxivftfASmSmdZy/CK7pUV5i0O
         kzWHu41SknGHwEDEEJN/z8LxnsyRo9GRE5E9oAU3VwpsNktS+x8oPdjIgPzXIQmYUbwU
         f4x+gY9cg37H4s7UtySpnpqGu/x71JZ0K5rbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G3FuNb93hwUCgGhruCy6lVdVXsqhJ5fKDO2DoMQqEd4=;
        b=xhM8qqinCMyCYXIxGaqw4S7U8Q15G9BUI7G96h/1o+NKb72VzooeyRBu54eC+mHCXB
         zOejYUMAFbsXnmP807pH9nJOcae8Mn+BWTr/X1Jz9hKhAlmX1G4oTpq8caRLYeXzUWi8
         xjlgkfszseiz65DEmoQ/LCXwnt12gf0RsqLdCTf8Zj6CC0rdih1SgNgv35fW5GXc67Hn
         B2V+0heFPDFfjKF6Pi+QilNVTPL+UbZA0ZnIZyy+TDH0ekYpxJznFVJMsP4FunaJoH1w
         0UZnshp2wpUZNwGAtkRu9g8ti2K+jB+y2zv/Kd2/QmM8GqkpM6K6/mSuCqns5lVz4xj3
         pp1w==
X-Gm-Message-State: AJIora+VUitnk3VefPJtvHQAHLoy9Ldl2oT1XBIIxQuaLsqk5o8G7O4Y
	f7YJwUXF61NnImHoMlKT1mabefpnzboSsA==
X-Google-Smtp-Source: 
 AGRyM1s8TcNW81X2zcE82D0oEjEANnQI1hGRjkD2pQN1ZzeBypnoE/SmUvMIKdRagCsZoicMoYPLTg==
X-Received: by 2002:a05:600c:1d1c:b0:3a0:49a2:6b40 with SMTP id
 l28-20020a05600c1d1c00b003a049a26b40mr5899211wms.103.1656514582975;
        Wed, 29 Jun 2022 07:56:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7688:b75a:a909:895d])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b003a04d54b2f3sm3925736wmq.24.2022.06.29.07.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 07:56:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ncurses: 6.3 -> 6.3+20220423
Date: Wed, 29 Jun 2022 15:56:21 +0100
Message-Id: <20220629145621.588318-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 14:56:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167380

Includes a fix for CVE-2022-29458

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ncurses/ncurses.inc                         | 2 +-
 .../ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb} (77%)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 7a7c7dd227b..1abcfae1fef 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9529289636145d1bf093c96af067695a;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.3.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
similarity index 77%
rename from meta/recipes-core/ncurses/ncurses_6.3.bb
rename to meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index f0256dad22b..6cd143774c8 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -5,10 +5,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "51d0fd9cc3edb975f04224f29f777f8f448e8ced"
+SRCREV = "23b32732ccd779bae8731f2d4a611bfcae45974e"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.34.1


