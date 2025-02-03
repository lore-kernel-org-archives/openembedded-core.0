Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AF7C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.92326.1738600938774346398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YWZgeSsJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35281405e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600937; x=1739205737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAQAVj2MhlNSHBI+nHjTXOVN8/0Ot0AamzmmBoxw+kk=;
        b=YWZgeSsJjVREry+tjPF+jCXtXyW9Sn+GZSaJvIrxzFA8XB3OEnXCxGA2EyDSTBzbzB
         Avw2gvyZBj9LkfKXRRUb/vhaT100WK7DoMJyvFL5qJtSnw3t8KMOBp9on1vDv12C51sM
         RWLgxBBtXL6Pb/nlKq7Ktz79cO47Hm8RUQjbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600937; x=1739205737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAQAVj2MhlNSHBI+nHjTXOVN8/0Ot0AamzmmBoxw+kk=;
        b=PHOPA1TPAgkU3REVdazafsQYgjmbUZ52iMN8lLc88rvvNxgDWfCDAomXsM3ePJu8Cg
         Ap3UsSLkp+lPPA1WmpQEGRxx1cSl9PetJp8gW5lJuZ9mrZk0qQeTNtQzuOU/k6n1bFPw
         JPQsJ9tsAUhlt/kl37jvu+x2s2/tdFhW32Ecx1E0xyxjs1HtOHaybcMVK+Xj2IGLY6M+
         Mee/wSYGFqXFcRLHFQkduMLzUpXqMBqbbUJwCjc38KKQk5+10mO55wcJaMbzOIiq+aWw
         hKKvfAyMu6XTzMzPDs61u+oEFccBJIjYGL1USkyEQS7Hy3uCl7BXZjFlPnd/rmsrWS5H
         6SMw==
X-Gm-Message-State: AOJu0YwpezK7rhOj0ekQdq8rPCNdEVmUgFUiqqSxPEXe7vSYFM6r4PIh
	sN5DRkBetaTPFo6DTfm8r+4kOcxn4kRpl1GmsxNJB3HKBO+JGGpgjbUjG2FpbSfE26KpqZVXXzS
	S
X-Gm-Gg: ASbGncsXT+JMv0uD2FF7PdleGPRcGsxaLP0rbBsSPdQCLCYbIF4DORiMa+8xweCPh+o
	Rf5zuerw/6avwpDo4niGUbL1/84pU5DXK/UlDurSLk7YEZhI7VJYa0euFb2fNqSQgk3f3gAdjvL
	eXZG44i2cFGFPOaOIb0ycSpSixuct5RqESejwqaIeXQYPqh/6eXllPV/P0w17tlMuSUHnT8UCVl
	oQqXHvirZMBAstFefDky/i9NsnhXqLVDMBAdhTU4IzoIQUeIwDQdYmVddzUT+jGwFBjPS3gjcxC
	8jK2pHDIkrkmtm0Mba3xJ2YnUXjTsKhsYd2+Asv/8Hvv
X-Google-Smtp-Source: AGHT+IGTICJy6VBVrV3Q81PDAXjxgtm6uyt06Ez5QXmLQiRIl0v8b2GiNtuOEnTE0+BhtdQCXTiq3g==
X-Received: by 2002:a05:600c:1f8c:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-438e1708a35mr143584335e9.14.1738600936804;
        Mon, 03 Feb 2025 08:42:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 43/46] stress-ng: upgrade 0.18.08 -> 0.18.09
Date: Mon,  3 Feb 2025 16:41:27 +0000
Message-ID: <20250203164130.3403325-43-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210716

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.18.08.bb => stress-ng_0.18.09.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.08.bb => stress-ng_0.18.09.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
index f779f6fe6a8..25ac66517aa 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "0b0317597016ea89498570ed2621ee5ebeea768c"
+SRCREV = "c84c8d5f5edb1ca8961d3bd97816d24e90392895"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"

