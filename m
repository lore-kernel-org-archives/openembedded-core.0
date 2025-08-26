Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B2ACA0FEB
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.64949.1756215698874571076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WH2oRFfx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3252589a4afso3400025a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215698; x=1756820498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TarIp+dj8FBYGljXo4JALBrQGu3X3JpFm5KoP6zLX+A=;
        b=WH2oRFfxq1kgKLuTI+lJAq1/+p4Pl8dgj/wM341hZCr+Y8Ijo9dWtQYEDgWK3p0NmA
         G6v9nx+jxsH92FNHlaGCRryzI6Fjxj/WTBjGHwTgs+WoWlmShCvvh4lJVhIfRyzFCiha
         lhZm9Dy17gEQuKVE498c+8j+ydpagnuQqLTBycrp+2UzPmY8Im/2QRmHW1tV0tAxk1XY
         Dy4o/GdmlKKWS/JXY/Nok9QNv9PUURvA1tvgXrjAYt2YeVnae44M2C3c2FUmJ7bs+HCu
         RsTrQFN394egmLDp55VxtO8Qz5y7yXXlEQ1UXXB0pgYTa6hKG/Grj8RagWczBytfDK9q
         Af5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215698; x=1756820498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TarIp+dj8FBYGljXo4JALBrQGu3X3JpFm5KoP6zLX+A=;
        b=P0m7xmjYnJwrTkjEL1+AjM04xVC8JsUtGCU1kNc/qEIfhJ/4pCQh72TyjpLq/RO8J6
         bsABE7GLPTr1lNdvd876aAwzsQS67q84Qglj66hpzLfUsUpJg/RiRfS8Se63fnVX464y
         fkI/Mw0eb/dhnv611iT0CZoIZk+kCx7dduNNulrSjONqLdnyTS7KOMccnPAWwKQaHdqg
         MNolfmt3dlrG29Dl0eIFT+nmEiH1tm5TBEaq7VPRK3YO8avPCmfk1vXae4KF3XcqY+Dr
         G3DAOOHIYWARLEZDdbirU1wpGMRFpsg5eIZOnv0EZJq3+r2aYt6/OrfyaTfe+fxXxzjz
         0SIQ==
X-Gm-Message-State: AOJu0Yy2mI+TNEOlIHfedI8XjGuNQqYUO6G6ig9t6D+1U389obV5nC6Y
	6dD9KkeZ2w9cUvMXBAASvHntiMdM0CKhiZU6OzfCF7X4KMuUw4AltlanUWbtGt0PoQDaGvfXjBl
	JpvzD
X-Gm-Gg: ASbGncuSIjXH6OldmZGEVb9q5kYmcFJ5+kyTTm5LRG0llJBf5Bhy1+AZFGfFUjE7bUO
	yIXqLLHZhsehKw38e4n/Qro93w/8i3fuVQF+aeYRjncq+RItZpRy9J3abSI+JsYsV9rwkIqwMU4
	90L6il6Z3XuPMHhAzAlddAYNBc8Iu6ha8ygBEOkwXLMFXSVCBmqqrrDoeIL6GNHGrl7ewnZJVaA
	DRr/PNLeCYqmaiwhxMjUqgxtjJESQ/KHGUnrHD3b3LYGXYDKFZN0jEK7qk0/HS8HPHUNufT4L2r
	ks7A4FIcOOaV1qr/kzHZ+NEKO4kpLPCpj78D7HaK5T0RN/kEOctFHSQX24Zo6Ge8kt0YHPC0mlc
	MnHK7UgIj3h8spw==
X-Google-Smtp-Source: AGHT+IHjr4JZTSIqmHHB+TDP/oj2j00IT0kMRmuHDiV+rLa5Twih9bKv++tqNnyH9qYtkkcN8cGkOA==
X-Received: by 2002:a17:90b:55cf:b0:325:8f87:7361 with SMTP id 98e67ed59e1d1-3258f8774d6mr11764244a91.33.1756215697808;
        Tue, 26 Aug 2025 06:41:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 17/19] gstreamer1.0: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:51 -0700
Message-ID: <340b182d5fc972175f1d2a89127f807073c10255.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222457

From: Archana Polampalli <archana.polampalli@windriver.com>

Below list of CVEs are addressed in this release
CVE-2025-47183
CVE-2025-47219
CVE-2025-47806
CVE-2025-47807
CVE-2025-47808

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
index d224b80eb3..6ed00f9aa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
+SRC_URI[sha256sum] = "ed4678e1d0708db01a469ae5dd31c10cac73c0fb3f7c2c471b0d3cab0affc7d1"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


