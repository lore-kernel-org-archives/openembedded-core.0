Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848F8C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.44217.1742834030770184594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wd1ja36x;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so85757985ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834030; x=1743438830; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0jxlHIf07Dp0Wa7q5W+LZslLvOP1QqCBnrYe1M7SlY=;
        b=Wd1ja36x/1iwF9GgCYxv9pJFF1TsSBcpm+GwJMRxteClqiJB8F8h5U+bhvbjn24dZ5
         VCkTgjqMe96s2Jva5gBxB5zwzu6jnPiPbnaOO9xBxDH0/eU5l3nlkyh6eJDdiS2bBr7f
         d+etRG1xwrO5cjOeaq8QCnEspTJgLxKwl7RDoi2uEvZ7IsG4wj7NBj/MSVREaaGYcsRm
         eHGghf0gf6RzYmOrBZC6tjH2MPlMReGnh7AmZSA95lJ2mEj+EBj7TSINiP7sPUeAxPcq
         aNirnXMApgyBIXVKZgN2IH5ut/P+n+hUzTh+QwRGRWwyUw9RSuDR6MTYQY8kAmcEKZjy
         ZK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834030; x=1743438830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0jxlHIf07Dp0Wa7q5W+LZslLvOP1QqCBnrYe1M7SlY=;
        b=BV2oAcsNiU+rFnGqGkOpKva9v3pphIlYb/4MgZPsNiQrPVW7Wv5fvkDTVIa/BeVHRo
         DM23OLPfy+Dk/AVGrxJZNUHk/7LHt5DIFlyO5ElikwSffsjurafiKAPGQ8P937Qa4ZV0
         PB9N46zoWmrOL241OfdMyE1IjXKvq7P1PNBOarCF5tvxQOHLYjVMv5FHVKcBPxez4Lq8
         RsG5Afdv1+o2Ij51g52/IDRyeahruOQlk9SIjdNa5mNfKAjolVi/LJj3j6osb82deWTM
         6WArh05/1fjimzCaNiprx/6/+WEEflV99If0BntL5PCuki1alVdTIJjjH/gUIh9PiW0j
         rGgw==
X-Gm-Message-State: AOJu0Yz48BXlAq0VUwubjqZQWPFvp6PWOsqLxGJfH5D4BSmCyZd56V+A
	ooHxxf+4U+AomLYLh6iTbfqXToVZecU3Q+eSKBeIOQQhke+u6Hme
X-Gm-Gg: ASbGnctqY7FAP9RKdSCq/9YiHt4qLbaZLHQ2BloQWMucEjPlDiwdEPWGV6wLxVTEkAe
	8GnKOr6srF6UieD+pXcHwo6d89FLnHY8oxjK3f7qp2oqFiPPPr+/bhQin6Z0HdKmOUvDMIEkbTC
	ZQTpc4mZPPSuLYBd12PvLkVtcsoDj+6plHT3C3dgZjgYqr0Y0ilsv3DPzIt3JM6jafWbYjYFaE0
	lhH3SEKsXHKGXpAbO2FvtL786NASnce6Zr67qiaHnueqoO6COuoTu5pblOGYAAL0TEfpOJzwsV5
	UMW3hPEx0Mhsus8S/CO2Z3MHha1DIxV8cY8p
X-Google-Smtp-Source: AGHT+IGzlAMis7tl2EVSgLdaY2DseVVv5g9k5Haau/9G05mGhfNdDZTLX2I+/ibHr28f1lVHHGiJ5A==
X-Received: by 2002:a05:6a21:1:b0:1f5:6d6f:28e with SMTP id adf61e73a8af0-1fe4331ac2amr23173237637.42.1742834029977;
        Mon, 24 Mar 2025 09:33:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:29 -0700
Subject: [PATCH 08/21] which: Drop md4sum for SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-8-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213540

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/which/which_2.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index c6142759e55565ce5715e378c13b91371bcdd605..6e855bca3feb2f0bf35f4c7de42638fb75281180 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[md5sum] = "097ff1a324ae02e0a3b0369f07a7544a"
 SRC_URI[sha256sum] = "f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad"
 
 do_configure:prepend() {

-- 
2.49.0


