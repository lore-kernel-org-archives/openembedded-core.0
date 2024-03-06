Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA58C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:12:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10350.1709727169243242869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HED2KLlg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e27940554so3251271f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709727167; x=1710331967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOpq6YBiI7QGPUvhPrBZcCDNn54Vmhk/PFjMgnxMgvU=;
        b=HED2KLlg9YCHR6ID9dVXnhl0RABoLLFEiJQRJXGKCvxJizByRtIL3nD04gsj0/5iVQ
         gYDT0G7Or5WGstu79agzpzZKrs0bw95zE6zfj+53Howw1uA/83F8m50aTPhUabqjpz9f
         pYfYlm457s189CF7Ynx2u/d8bXEE5xGcCM3i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727167; x=1710331967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOpq6YBiI7QGPUvhPrBZcCDNn54Vmhk/PFjMgnxMgvU=;
        b=euzfw6/n7p41DgAAeqny5DIyNw1+Pv7yz1SYhirN2ER+bmQvm9QaaN4DXWUkhuLz0R
         2NisMl9K7K97XCEl0NR5G1Cth6fS/W79x0ubVcnK+LKWKsr4q/dc5sHN3a6AEYSKstSb
         4Ieu8TVudVXK+Qk3dTs3reCbWSmNgFqAFvD61/RvlbZyeziHP1LJQl6e0yA/sZdeekAN
         sRKO7lFE+vqcJb/oteZXcHFG7+LxYVyee5nvpRNCFURVqStN6J9HV0lWQ0/dvTFDlB/F
         WgAPGObI6GoRedZao4dA7ux5le/kdzEBdXi0AdZuKW+0tO3ovPIRJyuRee17/j1u/Qev
         0SzQ==
X-Gm-Message-State: AOJu0Yz2tLF3bhW3DJSLdw/dndoMxnuuM98ZJi9nOYUGdtsVKzJz9Oqr
	DBV7USABQsck/NAqKHBvRapi9zmmi8GAHdBnkkib5jKq0U9h0fVGPZlfGnHUFMdlRmtwbjEIHAc
	z
X-Google-Smtp-Source: AGHT+IHeufI1xFdNhhKVDjzdS/fwdjT1URkLOCBmr2S55g56xikdMVCYOO/SmgfjyUlQQh/+KIwWog==
X-Received: by 2002:adf:f183:0:b0:33e:4ffa:dbee with SMTP id h3-20020adff183000000b0033e4ffadbeemr2202307wro.7.1709727167593;
        Wed, 06 Mar 2024 04:12:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm17634099wrb.29.2024.03.06.04.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:12:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] go: Drop linkmode with nativesdk/cross-canadian
Date: Wed,  6 Mar 2024 12:12:42 +0000
Message-Id: <20240306121243.2247637-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
References: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196667

In 1.22 this appears to cause failures and no longer appears to be needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 2 +-
 meta/recipes-devtools/go/go-target.inc         | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 8298fe31bea..dd485b6799b 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -16,7 +16,7 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR} \
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GO_LDFLAGS = '-extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index a4b55ad3d89..981c7abd313 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -13,9 +13,7 @@ export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
 
 export GOCACHE = "${B}/.cache"
-GO_LDFLAGS = ""
-GO_LDFLAGS:class-nativesdk = " -linkmode external"
-export GO_LDFLAGS
+export GO_LDFLAGS = ""
 export GOBUILDFLAGS = "-gcflags=-trimpath=$GOPATH -asmflags=-trimpath=$GOPATH -trimpath"
 CC:append:class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
 
-- 
2.40.1


