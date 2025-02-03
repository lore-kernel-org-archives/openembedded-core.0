Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DD1C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.92305.1738600917878183083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFneqVwA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso2162436f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600916; x=1739205716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R26aFKiJyEdVH9Y6JLR8xTuPSMNLCCu2Hv/1CpshIg8=;
        b=QFneqVwAy9QeOCvJedAsO3Ao8TGBPLFRMDDoLCFN9JgVv5Jx0PqWmhI1mhLgXrRGvJ
         iv0LX/aw3oe11x/NtX8LDiNgJxjPhRAXYa24XzysdPQqdPJyRx338W/JxG2Y+cOTAIQr
         Dor8s3LGsPEm8itMbLAQuMKztx5FSbgC7qgb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600916; x=1739205716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R26aFKiJyEdVH9Y6JLR8xTuPSMNLCCu2Hv/1CpshIg8=;
        b=qOpbkKXlBIHalN1+kPdxtblS2dSK03XkA+oT/97PeaZKDnNCDOMICNEkHVlzjyHw4z
         DLAndWUP5bcHfkRi/N08wsr//TcmB4atDYTF7rmc3nqS2PkrlQ+fBQODj4BA5mK1hfbo
         4JE7DNsWvdkxWfpqbh50Q5VqiwCkcmBfz3rrR1KrHOyoN6lBIpU87AajJqV2Nt6dCEhs
         POWdlTrF6sNhqNBGouWzVhZEIh04K0XJ4TdltgjM/kBDLI7xO767YKS0TlypHGF+vskR
         n6cj0rNle+p2b3YkENUuOFsF9weMzKnJnyEfi8sMSqRm5qrDLEdU4GinDaZmrHHapwz1
         jyPQ==
X-Gm-Message-State: AOJu0YwEg8K+0x5Ih+rnOpvnObmHlL8vWboSkk//E5y21OUaBFrrnyGM
	lLU3/3oPTFMLmyU3LpAh6lQjpgAvjoIPOP8b5igx8qVu9+7/8KSdsuZsZ29mqPxo5XJ47HCGw7z
	J
X-Gm-Gg: ASbGncts/CwZFuJGiVS1JbFUXeqTzac8Yp+hnI4jcNxv1K6HrKfeCTLTLas4mU9luGn
	atggPblb1y/WSQLzsPRgWYCVaBrYgz2/HSQD1GkpL/YF0W6KWER338eJUOklozrt0Qu8KMP+ms9
	DXrSdgemGUwd7rcXVfBIUT94dMTcVP09j1G4rt0NYsMFjceBwSUiD1LjnWuJXFbsWaH0Z4Quxiu
	iCCys4zrR8st+s0EL5g/JKjK93U9rM+siy0pwe+hVege/X2g9FEnFtOKMQi2XubYjxiYlsqDB5E
	B+tYDKMniqsQNFcxQdvOCTUIsSNIHytXWbA397Dj21/p
X-Google-Smtp-Source: AGHT+IFzLDKeZ1FZvMF1cm8gQNbPXfy+CSafNK/sGIrM+IlnlHNPFbvdgpz4HXHOm+uwptziU+s3/A==
X-Received: by 2002:a5d:64a1:0:b0:385:f17b:de54 with SMTP id ffacd0b85a97d-38c5193112amr18008898f8f.5.1738600915900;
        Mon, 03 Feb 2025 08:41:55 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/46] msmtp: upgrade 1.8.27 -> 1.8.28
Date: Mon,  3 Feb 2025 16:41:08 +0000
Message-ID: <20250203164130.3403325-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210697

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.27.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.28.bb
index 3f10be9f5e9..48c597de246 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e"
+SRC_URI[sha256sum] = "3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4"
 
 inherit gettext autotools update-alternatives pkgconfig
 

