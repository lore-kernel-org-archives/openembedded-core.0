Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAE6CD13D3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:13 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45181.1762770126440029318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZ/PStVQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so1130851a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770126; x=1763374926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLfl/5dcgLmg9godtGqvLLQJBqFZndu1oAmDU3OYoO0=;
        b=IZ/PStVQyE8fCOoQtDRaZOr7nqYfyYg6hnHhUUs//8XwVXCe89GQWJeVfQrIQAw9ok
         6QA3OYF/7DyCU1getQnCpdXxVupe7Jri+fLRiPYYkceKvmcEo3h/tFKKXh8EbMeP5qvq
         eT5MBbYdf+9lKOfNE9pAKPcyL6KwjUyuJMxwCfPMOOkVvKlB1H3PCj/bMftLUcTI64D7
         w8X9DDaPbjvKt8D9TBPd72BszCWUA0X+Goj5i/V6Pf2VX/Q17dTZrpuHLP+DkneU5cdi
         /sNsnYkC/kDdvIYadQeK0y60OGUdbJCLsWUB8G6HtmlAKbKTDBqOqllRinImTnVxs3Wc
         P39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770126; x=1763374926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLfl/5dcgLmg9godtGqvLLQJBqFZndu1oAmDU3OYoO0=;
        b=pxEGraenqOzH337YrGrOpafUX8D7NO4GuS4SsmS14IfCBm5naMaBDlEdF991VikBFg
         KPDD5vba3I1QJEuIluqytGf22tVSmHOH9A1XYu9VA6FI4cLMwRgSbRKCNqYI0VBwnBdu
         CvjANICQCDLfkLqlZNVQLtldkq9Boo7Z+atUN6MneMLELpnBIo4z+zr0+OhWKhiVfid5
         F813BXuEwQlaxVYiStjBVWhcHvrOi4DkmQJDh5MsVkcsFuh35wIdpkSA4rcDwVrddPhI
         XHy+D0SHD30zWMCUVoXBIzFBE+BT6lMigtC86mS0YjmdMiKMhokbRFteLnTmI+fPqitk
         feIA==
X-Gm-Message-State: AOJu0YwwcLxtOKb7WXGeqR5FLTO5Z9VG8JAEtPhzcs1L8aDfYnHKWhwO
	fgduibvBHSljLDgQoQ+HVOIrLiS2RXk/hxW/kKy+GpuCEJaUBbxMj0SQXmJQSg==
X-Gm-Gg: ASbGncs7mK8qU9YEkGFRkR4tBWN8MZBVZBCMSpJlqiYvsx8y5SZ9BlyYcraG35ZGhuz
	bOpqtg2jRBzy4eWXkQf6NGuc9epNb4awK5cswfEDQ2W2mFWKrTKR4YAFoDHuUSxH4VJb2N2XyYb
	MGjNcKbpbMZl+77nhfFrerjOAPlTmmcSI6K8l1qo8AVWGaL0xJeSudNef7Cf7d6a8AS9/QfUxay
	AWB0CNKSgI3JlrVW0mgmtKV1KPcRdEIZ4+xjKWJ/WeLinNyHDbYHlV6DpgZR5xQqA4L0q0P7aZf
	2VlbXBBnJzFIfqIajYmkBPGqnv0uif6oiqiRNkdaZ72XcPL7rZXIlxVYVcQArWBUNpuHv/gmtSJ
	bZwfCw56rF57DyqLSobCqRwgj0D19HWROvhNTetJ8wvjfb2nDBDrHm7bbV2f87Z9UkcSCxyua5P
	RsZf1Fb/kZHZf/lwC2HoE668YW
X-Google-Smtp-Source: AGHT+IEKlT7qovP/3R7FJLuetSG3nKkUuzwxFJMrT7qKpbITR0aHGWeIuZPl5UrfqkZarGrFL40+Tw==
X-Received: by 2002:a17:90b:3e4b:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3436cb73f36mr9678499a91.6.1762770125565;
        Mon, 10 Nov 2025 02:22:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:22:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 4/9] ca-certificates: Add comment for provenance of SRCREV
Date: Mon, 10 Nov 2025 23:21:42 +1300
Message-ID: <20251110102149.2915435-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226107

From: "Theodore A. Roth" <troth@openavr.org>

Provide references for how the SRCREV was arrived at for the 20240203
release.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6916cdb0f05f6644edb1e432a9421595abb9f0ca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ca-certificates/ca-certificates_20240203.bb            | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index b198ea77a9..ac0756471c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,6 +14,13 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
+# Since there is no TAG in the git repository, the SRCREV was determined
+# through comparison of the git repository and the data on the following
+# package informatin pages:
+#
+# * https://packages.debian.org/trixie/ca-certificates
+# * https://packages.ubuntu.com/noble/ca-certificates
+#
 SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \

