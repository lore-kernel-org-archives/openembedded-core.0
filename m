Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4F2C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 18:07:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.4.1648490833946791623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sg5QLZOo;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id v4so14946807pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZU/dsg8AdWUV/Ab9Qvu6kgp8pjOyp0IP1mMNR6b7vEQ=;
        b=Sg5QLZOoNI63uzfC9jYk2oW+sicihuAChLqlDt5RnVbJt2lO+8wxCqvXRMd9h0MPhs
         xiLDrP7CGottXQlDm9cMOwFpXies7LoURFOI2eMBO4xRf1T6efYd9Upn0Hf0UceKjFhI
         O/aF+AAB27HamvCVMuvJEapKiecTGMVBYDjmurWRlB3NzTyLUOIvBXZoDf+2oIm0PPKi
         lv9LAHrLcaHGWfj4B5ZFfExhQOjL/PEH/1MDSy2fFAJbY+LMOyOboD9ch2itUd/Hor0l
         m6haGKebP9bkcuc0MwdY0srFHwsFJI+yDCgB8PrOPD6bGzX8ab1q2gc2x5nq91dlPSRN
         vonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZU/dsg8AdWUV/Ab9Qvu6kgp8pjOyp0IP1mMNR6b7vEQ=;
        b=n5cQ3xFDLH670cPgzzMU2fcNponLdITnJoLt5ajCE4x2FQMQNRDblB48EiZuNFBuac
         eVbIEyShgwLwxmUaeP1WLKn8r87BxIbv6ANirbz0rc1EQIeyBD3AFUW9cChC+sVL4tNf
         cmZBrZrQ5ITSTGYCUAqrAgMUtK4Hy7LgVL3YxBMQuxbXCDkvQaTIGhac1VihlyoWmrmF
         3v+0E0Tb2xlUjEjATeSoU5KQFjNSn5ZJp1i04Ly+H18KEJNmZ8NGEa/hIl+44Onevs0t
         EWqOMPBwwrS9wPKZjM1TSfLVyDP0JONa7h4khR3PEi/wAEtHLNsM7oqO8MUOMpefl6IX
         AIgA==
X-Gm-Message-State: AOAM5319EYWMblPTtqNm7gTvgDsTI3SxDQBDYjRcKNT3MIJCmE+Ad0JQ
	O3fSA/9osJjbjzlmXhLd6MANmaN6cPw=
X-Google-Smtp-Source: 
 ABdhPJzum2/Lw7fhZqIdq4J3E0GPZb++pz4i4tQibezKvts6npSHTJswuWJUGkV0Sffy9IlRhkKfRQ==
X-Received: by 2002:a17:90a:bf8f:b0:1bc:4ae6:e009 with SMTP id
 d15-20020a17090abf8f00b001bc4ae6e009mr369589pjs.127.1648490833189;
        Mon, 28 Mar 2022 11:07:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 nu16-20020a17090b1b1000b001c77c6a391csm174982pjb.26.2022.03.28.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 11:07:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] go-target: Pass -trimpath to go linker
Date: Mon, 28 Mar 2022 11:07:07 -0700
Message-Id: <20220328180707.3565916-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328180707.3565916-1-raj.khem@gmail.com>
References: <20220328180707.3565916-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 18:07:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163720

This is for improving reproducibility to trim absolute paths as these
recipes do not inherit go bbclass where it would be set automatically

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-target.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index d085643036a..aaaaa125f79 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -13,8 +13,8 @@ export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
 
 export GOCACHE = "${B}/.cache"
-GO_LDFLAGS = ""
-GO_LDFLAGS:class-nativesdk = "-linkmode external"
+GO_LDFLAGS = "-trimpath"
+GO_LDFLAGS:append:class-nativesdk = " -linkmode external"
 export GO_LDFLAGS
 
 CC:append:class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
-- 
2.35.1


