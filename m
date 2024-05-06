Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EC1C41513
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 10:20:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17344.1714990830197496345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 03:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ubqu20Tp;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso2346169f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990828; x=1715595628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i02c209tjZDStUXNfQKzncoFuqWCNOogqvD+byNYUZQ=;
        b=Ubqu20TpJM3JOiCp+zF9ZoUZWAm0VtGjFLZq5BCEMgcWS2Qy3P0VCZJcy4FjaxRFpz
         0kQXyREk4pmf4edzSBIkza5zGQu8vRVJx+h2kowKMRc6bX49fRAJ6bt0gLILERLeWvMN
         KYQAJ5VGIb5nMrNl4zY9Lz2crssxmUp7y2+r58gHb0veY9mEV6tCLjXmt50xYFc3yFu+
         Vvh7+ePaWMp4FCnX029CRjEt5toZ+bg5xr+J3fkcTu6Y4VcDXBpqg2J6AbVYFCIlJV9/
         sECe5MyBrM+oBbTnwyJ6YYLdUp2EWghk9nx9d4LpB+V3I3HD5HbcyLfrjGdM8eEZIU+x
         /v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990828; x=1715595628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i02c209tjZDStUXNfQKzncoFuqWCNOogqvD+byNYUZQ=;
        b=X/n5VUYwT4WrGBKMUX6tHS7Mt7vsrK4JxaNj36A2tjsFq977x9LvrKvUGu1ql6obsN
         zHuvkGY6J1wlZEn56Z+2fC4xgUbjXzaf9oPJCvTlNWtqrg7PHL6zoNxhK3eyTkZv+KRl
         p7enadveCZ8TH0e2/TSAhxSAoDHMzyfAReFaIGPP8n95dwBpFKSVTfS+sn6S81e90ZYw
         R5X/Hcmp/GYJD9BVGbGduaO5rzobulAAVeDAd9tk8d74IcKWl0nBOewkkye2PSlTfmNW
         xMIwp94pw7gluH73XxTylaEd19NL1o2LV44ojYCoogGjiCvKbCkoPNQTtF5rHytgUXw1
         LZEA==
X-Gm-Message-State: AOJu0Ywn/X/sWhmKPAwv4SBbh1vESyTWpkKn1KfWDHy79jE0vB0Ji3F7
	vLBawA5ekXOYmkHm+bTiRRfF77vZxcktLnutT5lNqN5OjiuU2DjgBBrBKr2e
X-Google-Smtp-Source: AGHT+IGUp+Q48WhCpx2xtaEfpsaraBz02BeHX1lDhrGzUMJD4uQgTzTBWSBaQtXih3sBvVBStw2SfA==
X-Received: by 2002:adf:ef49:0:b0:34c:e0d6:bea6 with SMTP id c9-20020adfef49000000b0034ce0d6bea6mr7493079wrp.29.1714990827795;
        Mon, 06 May 2024 03:20:27 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id o16-20020adfcf10000000b0034b1bd76d30sm10286049wrj.28.2024.05.06.03.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 03:20:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 1/2] go: Drop the linkmode completely
Date: Mon,  6 May 2024 11:20:18 +0100
Message-ID: <20240506102019.1488-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 10:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199038

From: Jose Quaresma <quaresma.jose@gmail.com>

This will make possible to restore the default dynamic linking globally
which is what we had before the 1.20.X release.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ad90fc2fc49c4199a59dfb1c1d81a7ba184a522)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/go.bbclass          | 2 --
 meta/recipes-devtools/go/go-runtime.inc | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index cc3564c36a..d32509aa6d 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -48,8 +48,6 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
-GO_LINKMODE:class-nativesdk = "--linkmode=external"
-GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
 GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 3f1e795dd9..413cf6d33f 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -15,7 +15,7 @@ export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-pr
 export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
-GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
+GO_SHLIB_LDFLAGS ?= '-ldflags="-extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
 	:
-- 
2.45.0


