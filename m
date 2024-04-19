Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3811C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 17:53:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.436.1713549201936647985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 10:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaTZYq5B;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d87660d5c9so24981321fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 10:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713549200; x=1714154000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6TGUXcLNBOJ9BT54PrwxYhiA9l4jcE2POSI9opJu1Y=;
        b=SaTZYq5BPG/OmaiYsvjK2azyyJolzjRiodqPJp4IpR1assXdYVS4ivtu24BRyvPLIx
         SdqwTtzSpsHvV5Frcmn42dHcPWXyTsiRtIBZfDyIowtfqPyA7Fu8NvbX40LAUi8cqMUD
         uCORIIbLhR4KIkkKqApNV/AYsbTTF0nSj48KuN63iF7hgxMbegVqzdE8JK9R9RfSXtgJ
         +WwFq0oqH1I/TfACPVoiwCBzRjC6wG7dF4QLJfhhQX0W1i5K1kc7h8vfTjkozu+mSVBY
         ok0lspuFSUp9k6lIRuOhaJ9HkPI9R/0YAgOPkRslRQX4oDMIvVpSKMwaTrAS0Egyy0ce
         PdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713549200; x=1714154000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6TGUXcLNBOJ9BT54PrwxYhiA9l4jcE2POSI9opJu1Y=;
        b=PBbL1sMCY5+PVPmYLIGWNUieenmH41H4h1u0N5v3RsdXm3Fx62Zw3W7XKONy/XIcgq
         TmSZ39kl5sOgmpvRPgDYNI908Dy4bdVlCsaXJiVIGYG+4Rqc2rVE3BZLX6bKeOKCyXuR
         zKmkeNyI2ei+v/0RsdMaoAZ28gOx7t0ApjWbmIYf7q1DwwND6A9E9v3eqD0tCMTi25ME
         ia9pcacGw8vEwCz49MwO8cCbewF5WUyw179fB9vgF0KKOsdxgnZidwYTIBcGIvqDRac4
         aFxW+dcmbqyzElbbvBh+ZUL+yNx0lH9NlHKiS30A220zq1lcmbUhOF/ntdYhGFHQ1VAl
         iARQ==
X-Gm-Message-State: AOJu0Yy9k6mU6MmvP8HvvCxgAtgu0hIMxZw8g+KlDb03bLvIJdhCKdcP
	pcAbfY0YL898smQzPVV8NIfO/GlJnNbgiYqkkWdKvSeCiGXsMNyWGKhPLds+
X-Google-Smtp-Source: AGHT+IF27gL2Wa9/Nx3s5Dpa3O0d4GnysFzugoTP2qsmMVnzq5rLKxHCW0kRd4Wrssq6o7013zIKaw==
X-Received: by 2002:a2e:3e01:0:b0:2da:a3ff:5254 with SMTP id l1-20020a2e3e01000000b002daa3ff5254mr2355278lja.1.1713549199348;
        Fri, 19 Apr 2024 10:53:19 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id fk4-20020a05600c0cc400b00419c8e2bc3csm1405841wmb.6.2024.04.19.10.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 10:53:18 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] go: Drop the linkmode completely
Date: Fri, 19 Apr 2024 18:53:08 +0100
Message-ID: <20240419175309.214181-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 17:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198558

This will make possible to restore the default dynamic linking globally
which is what we had before the 1.20.X release.

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
2.44.0


