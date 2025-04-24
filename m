Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F996C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9649.1745479259404642663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHlD+f4r;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227c7e57da2so5399325ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479259; x=1746084059; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=VHlD+f4ryFFHVOrWfte15vGlrEhdusMD3rYn5uKsbs3cr5ZoTECV9Tf6gnv8pe5L7j
         oAwqewxOLZG0oDOr/7vr/QtYucWiBz38EYj8m34nnohqZlasp1fwOB0REQ1g7EYQKCqv
         iHXtKiVOXD/9ZHbIAVVZ8NgZcb4CMacNPqdgfc3JIkdasKLD2nQRdWArSR+3k81B4WP/
         jIc9R37m8sjxr+/8P8GuBblGKSnIll13nSSnqD8u+9T9DMbOGsDvCc0UwZSSBJVv6YOK
         pmcCuDpySvVwicqwliEwp9oMlpPiS4boPI2UP4nwIgp+o8fL/Sis+4klBXII9M0wz0zx
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479259; x=1746084059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=M8NMAR5yVZKP6IL3KUYB9TWesoXJ6fvK/llsbSYToO7NDQaJJfEYcJ5yXMrauaPiTk
         8bYGzGiGhfeIucKxyuAIyarg5+NXQ6sAEssgVcyQra6QfTC53k1E2RJCdj1HOGr7peI3
         9zht9+5P1btCjFys7Ifb5qP9wGxHOnHgKR7H63upWJBqzx+pulQoKU1cedq2hXMnjQfK
         PVUHFk71fOwwkW816DXoD6/RmrlzoA7nhDEDRF8LJmGFA1HgZKfHPDi2WZwSq552q+dH
         zWorEGjgPlkvJKWJRROckRZXdrGoaCV4NRYTrWK/rI0OAQDXyUvMpDZxXXWQxMfL4mkK
         5aaw==
X-Gm-Message-State: AOJu0YzCjKdW5vwu1iRpQr3ncp0BzWNdO3JdWklzlSiJuAn27NVcQd3A
	W/owTC1CtiauLjViWwOmVrZ8jEKQUeK5Slar0AvhIVnamB1GeKeq
X-Gm-Gg: ASbGncszaon8o/GqD432Ylb+WteYw7iqtK+N3QTTDx8lQfz3DvLi+mfe8PqltcLIsTu
	TcTzPNIvKFYGu/XgUGI0FCIO+vLP30VBESpJCnH/EOjLeUk4WzuPj47IUYby2zw0j6R+j24D/9X
	KrLsSYY8ta74OnT15WUdxh/p0q90elo5edsqSyYo+fxyNj+GCua+Fu3AiKX/7qNwDwr2Wc5gzXa
	OnlxgZbX5BTpNwEvW9tXQYeqW2JcHAMIlnqwUOupo9y4Ki15qe/iMelJSm/o68lchQORIosnc1G
	jqll425Z5kYy5eGJJNYibm++CJpsYbHC
X-Google-Smtp-Source: AGHT+IE8Z7N/Y0IQtypQitmAaDpLbpDVjNfnLRRyc6QcYCIUo/ImpzndecXPqhbmgu1UgLBgxmQ0rA==
X-Received: by 2002:a17:902:ec82:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22db3bdb06emr21070665ad.14.1745479258820;
        Thu, 24 Apr 2025 00:20:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:41 -0700
Subject: [PATCH 07/11] clang.inc: Remove duplicate RANLIB setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-7-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215334

Its already assigned couple of lines above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/toolchain/clang.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index 40bfba2fd4febec0d7316a51b10fccda3363c43f..0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -7,7 +7,6 @@ CCLD = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 RANLIB = "${HOST_PREFIX}llvm-ranlib"
 AR = "${HOST_PREFIX}llvm-ar"
 AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-RANLIB = "${HOST_PREFIX}gcc-ranlib"
 STRIP = "${HOST_PREFIX}llvm-strip"
 OBJCOPY = "${HOST_PREFIX}llvm-objcopy"
 OBJDUMP = "${HOST_PREFIX}llvm-objdump"

-- 
2.49.0


