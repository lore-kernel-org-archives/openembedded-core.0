Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A57DC53209
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:18 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15307.1784883733282703800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gjKAb2Bw;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-907ae240ac3so813566d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883732; x=1785488532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V3gloWwIQQanvt+2PnmBBPZXsya3UgNuZ7SjKxGH1n0=;
        b=gjKAb2BwSSmf3+mrhZZfzzD3bpjLUFCDLaA4/LF4a//0TQAuhqfX6kvgDjx6RU6TnO
         cft73oJMn7xdWZ77jOB/B4KCq7Ipp166x82jzXJIvI7xykoFIi+lJFWjpRgdUxEMiglp
         /crj6+rfzfn28CiaQ6tl6Oq93ShJyUfpZN/vtovbPXjaDlc4zJBAX/MheYs9J+0vYBkr
         g0InE3+druc82H5xNU7ugkzww7il/f2Oi/vkHeG0dKsajmphOIldRLFEMsY62QnjAYMU
         zlE1qxoi9+KNxc1h9V4R9LOWZiYlXHuGv4gUQRLSBqw8KQQOnDwWmLTAVSPNA2ChHxT2
         UohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883732; x=1785488532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V3gloWwIQQanvt+2PnmBBPZXsya3UgNuZ7SjKxGH1n0=;
        b=kthsiWcicXpyulzT09wkYi6hMpc4Gh2kh/xL09AboAtLHjQulqWzNvvL9VPebhQS9r
         FGkLv+Zv1Jpv0I+WIpvUhS1Lnt3m8wM2xIpwXnc4aO/stqqXS41JbXq/lNyj84O35zQc
         r5rajmX99S+1MXXVUUtJUn9hTAPcjx8Ow7MkZN1E46QXD56CPKL73f5yRR4OYx/KnsnE
         4e/lXL3s2Ro26voN8W/XwmnqNwsSlnzLg74ZvQEd9AcF3IRgdWQxnx9t5GjazVOnDcfE
         m72NnKT/PB1gaGWAk+rGWQnUVHjyWf0CBFSA5eRBP8oujCWFbPkc7ADvI9hb4TL6TbPP
         mT4g==
X-Gm-Message-State: AOJu0YxA7zUNQvuyXQhklG4wDtkyvQGhnoiSoxOegdMVgqiQ7qqUKjec
	zEIRcGHVu7ARaWE2JnowD9cElc5NFrp60B5HmACo6tIHAnjA+RXDF0e3ye9vPQ==
X-Gm-Gg: AR+sD11CrqxJIzcj/8K6PM+eeNjz0m1/D+MuacA5CKTm5hSAoXPDuQFjWTzmvGYlvRh
	gsLDkQxySLPwt8hJRbfTU5GSB++Krardp8DYMbTYo7a2gu0D+J58nCy5lcoimLSN12ZL9RqdqDF
	OXD4jINIxCqDavL/2HMVIv8e4znOmXoXSw3lpFLAnYvnfUpCyURtSkrLKNSiyz6yrULRh6t6q6d
	LUtJTKZfqrzlLoEQIMU98Y/mskb+CJOAG+W/fmOTCQrDe/4aRC6cE6xuG1FaVybPFNY4wjnEqtb
	UWgcBO4CMq5YWpLx+flzs177YwXKMltu3IRfCDsJVGPHURBGQExcb7qWqes0pc7ma6rkdPwawS+
	xqS90t6JYU3cnIDbNFSwD2Kfwl1W8o4oyqWuyfM2j96c6f/yUNfOOUNofb701iKCVG/crAkghnf
	w7no+EmdqXs25mM96SdfiGB7apGMHsv/3Qxfeaiuc6k0nl
X-Received: by 2002:a05:6214:3f8f:b0:907:af42:ac86 with SMTP id 6a1803df08f44-907ca6649d3mr75933906d6.43.1784883732231;
        Fri, 24 Jul 2026 02:02:12 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 07/10] nativesdk-packagegroup-sdk-host: add an sbom SDK feature
Date: Fri, 24 Jul 2026 05:01:43 -0400
Message-ID: <20260724090146.19924-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241917

Software composition tooling is useful to have in an SDK for generating
or checking SPDX documents and scanning artifacts, but it is not needed
by every SDK and pulls in a Python dependency chain, so it should be
opt-in rather than always present.

Add an "sbom" SDK feature that pulls in the SPDX and SBOM/CVE tools
(nativesdk-python3-spdx-tools and nativesdk-python3-sbom-cve-check). It
is not enabled by default; a configuration that wants it adds the "sbom"
feature to SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- reordered ahead of the default-on qemu and gdb features so the opt-in
  features are grouped together

changes in v3:
- new in v3
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c2974a57fe3e..31710a23969e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} = "\
     nativesdk-flex \
     nativesdk-perl-module-integer \
     ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
+    ${@bb.utils.contains('SDK_FEATURES', 'sbom', 'nativesdk-python3-spdx-tools nativesdk-python3-sbom-cve-check', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


