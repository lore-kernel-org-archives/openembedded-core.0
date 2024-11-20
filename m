Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D2ED6394D
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.13942.1732111050700465501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FU7StrlA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21269c8df64so10615845ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111050; x=1732715850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xikLmiroHNHs9rHyNY1Pd2Lk1hzLmdNLLVa4lx2knPA=;
        b=FU7StrlAOD3U9q8I9p5+l118KQc2DW24Dikeja0GzeETUfcAmuHq7vlr3gBRM9pjG+
         9DyNFdq+TYKjnTgpIlmtVhoSNVXZvsmgBwbZd71lwIk7r6UcJ5sgHaI1cBUhpDsfVuMh
         T3rTbmHhEvos9GyzRhUpmgK5BYSd5QsAVrsKTVlyA0cl28uWCw519TqoeNT2+fxYDP/r
         2BVvEt4UDdCWiDfICcD5fr9m0ss4tXFBDtj3giThZHiH6nuNRJgL/cUOIrvAZrMrJP6L
         X28P2qkk2bxCEIc8+YEfosd/388l8FI0Se0iZumf2iFjsZc2fqinvlMNmrJvHXHSt02C
         QjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111050; x=1732715850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xikLmiroHNHs9rHyNY1Pd2Lk1hzLmdNLLVa4lx2knPA=;
        b=Lcw380/cEY4x6xATK9a/E/tXdYFdsMovF8C1LzFxK8dySKStMLAmUB1pa3uW0UYIXG
         TuC1F84OYs0YGS5RE/xPeAlcVn4h+vKGgrGoHqs50EDv+L2aV7Tm2+RnrCu+m5JjOYw6
         x3Y3PyhdXH/XdzPDaTQcO1iogHboa7s3Aa0Ij2OKFva111uPtaau4eD518SegIt9V+pv
         dQuZs2YPxaHiTFRO7/k8ZEHMlveLyhWpFbq0IXW8yEblQt2kceoqQ9lZHGImMVM2nxj3
         /qNJXK+N5wC6dSocPzNDnE+aZHExiPypwLumaf7PXA1j1lsGYL9B7jE0OV45S9fsC2yV
         Ua3w==
X-Gm-Message-State: AOJu0YzxPWou/x0LyZ7KYngLAxV1u2ji01x4n3CJsISUNCLskXoqnjIc
	lT+larlEZjZ0fjCnZWi22E6cRQbZl5LME79oVWN7aA4GZpxyAUhDEXO5/FIjiLh4b8wW+Je6wyI
	I
X-Google-Smtp-Source: AGHT+IGx0rpHEa2YpBZlEnhlKE0+dQRy6veyyKywyNqQJYhG7AmAHMzqdHsTQJxrqpTUBBnvbjCSrw==
X-Received: by 2002:a17:902:e888:b0:20c:bda8:3a10 with SMTP id d9443c01a7336-2126a4356cfmr29865775ad.37.1732111049900;
        Wed, 20 Nov 2024 05:57:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/31] toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails
Date: Wed, 20 Nov 2024 05:56:44 -0800
Message-Id: <6744c0c96a3d1137f84898c5083e1f974b2cc46a.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207436

From: Chen Qi <Qi.Chen@windriver.com>

When LD_LIBRARY_PATH is set, post-relocate-setup.sh will fail and
exit properly. But such failure is ignored and the SDK installation
will continue and tell user that things succeed. This is misleading.
So exit immediately if post-relocate-setup.sh fails.

Fixes [Yocto #15586]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8e2dcc1f71aa33cc6e56dfdebebbe7ef010c944)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 89d30005fd..3b4647fca7 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -286,6 +286,10 @@ post_relocate="$target_sdk_dir/post-relocate-setup.sh"
 if [ -e "$post_relocate" ]; then
 	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $post_relocate
 	$SUDO_EXEC /bin/sh $post_relocate "$target_sdk_dir" "@SDKPATH@"
+	if [ $? -ne 0 ]; then
+		echo "Executing $post_relocate failed"
+		exit 1
+	fi
 	$SUDO_EXEC rm -f $post_relocate
 fi
 
-- 
2.34.1


