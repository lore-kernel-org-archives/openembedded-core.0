Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CDFC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.2181.1743577928210443097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uj8uihG5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4585673f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577926; x=1744182726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXlfLb0vk1wT4LZNuIBFhuUsQyH17G4CGKDDmgIMWYg=;
        b=Uj8uihG5Rgt+xEgPwBMESXbwCaiuCkBhuXBZvTL2HpmdMLg+irHKI/tA0hJOzVV7VP
         BPRI+/clRHYWkCdd2LyDx/LsSUWWeGu81fWtf0olT/yKMayDcgF8BQ7vlgT0MTJQIKsk
         bakuDnEJ5lbC0oNI71cTiBVnMob5inh0UQfwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577926; x=1744182726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXlfLb0vk1wT4LZNuIBFhuUsQyH17G4CGKDDmgIMWYg=;
        b=FgXPNHpuOvnqu8O0ghjhyE4h7sXh03cmasufex02G52MtNdK7wQb9yoDsZyYHOBIim
         fILFUokgRzcinOP4/NX2wTYTPPjL4juFteQcctZPLFsRz9znkwMhx29j7llru/pNp9sv
         z9hO7Qa9Uy5g4md+siBPPH/ryLdhV4STv1iyH3gzRm1V6FZXYTEuRGUlFSTYDIw85pfG
         AJA4okAc2YGu1xOZMs6o9j+ncZWHmTHmLeOtxmoE7F/HgYGKBO2CGjgsRc4gtbtlxkOW
         cgl7hxAdWKs+WNvgmKwXCyGF92yOi4HI20acSzvrLNAVALyRwS6sSK0ceHR5UhUdQlR3
         OXfA==
X-Gm-Message-State: AOJu0YyLNvLo4mb6un6VURrrsahIIr50vCgLJQBql+lk37jpZrzIcaUB
	chlzFN/SfKeFb6C393DZyPOqN9dK411OVekqdKU/brlqo0R+Utj8FKGMEcWXLECzOUAlDkq2qXP
	J
X-Gm-Gg: ASbGncvmstDezjZfSho6NojGLuWMjYLqrRBfytmS+2zelfjXFKqj1VK74fUE1E3WH69
	qnhhK+HuoBNoO2Azl8/FJJAc+DCx14QRCkwdHCtkpzn5XxPNjeCJ0S3a2uo05SM6netysl7aW2W
	D+b+do548rR2OS3F9cCyfIRJbeB4zuIFZYQaBVXswlbG3kHZwiK8ohTwG18OVl7r4nRKiY9Mfd/
	+0wsWikFqPurI9hvbX8jMq3sfT1Fe/v+9+kZVDO7YXie41SQ/C4Et7o3kItsR16tW8IPETOpcQ3
	T3BNV8kDFK2tGgb0Lt5WGO8Z1PzlGJqZTFjothqcCE2AVNUTKXYy7mbqDManroVoek5bTbsM+GC
	bo8DLjWr9
X-Google-Smtp-Source: AGHT+IFMv0GtghTTdBMCPjxhWy7G5QNpiRP0Kl87CXsChklS+p0UZTRdEH4W9ZmfANCFp3eQcft58Q==
X-Received: by 2002:a05:6000:1843:b0:391:952:c730 with SMTP id ffacd0b85a97d-39c120cca4emr12727464f8f.11.1743577926037;
        Wed, 02 Apr 2025 00:12:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 42/48] python3-yamllint: upgrade 1.36.0 -> 1.37.0
Date: Wed,  2 Apr 2025 08:10:11 +0100
Message-ID: <20250402071017.2157620-42-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214215

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-yamllint_1.36.0.bb => python3-yamllint_1.37.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.36.0.bb => python3-yamllint_1.37.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
index f6c1a1dd90f..9ba0e8bc6e5 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "3835a65994858679ea06fd998dd968c3f71935cd93742990405999d888e21130"
+SRC_URI[sha256sum] = "ead81921d4d87216b2528b7a055664708f9fb8267beb0c427cb706ac6ab93580"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 

