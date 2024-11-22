Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FA8E6ADC9
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.35424.1732310835945913217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gSM+oc6X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-212583bd467so25665495ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310835; x=1732915635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgcxJQInlSDlU1ZPZCnb+/0ZsXJwXQ21vyWhse9ncug=;
        b=gSM+oc6XpegSFoATNnRWO9Ar4VcPSDJLepuW8gpc5xl9aUnJgtUftETkJXaC1HOyDv
         Fot3zTvEUavpyLA/rrwiZC29HiJsM30/9Qi4j2LpcCTFfM65v5+lxDdjHgARiSTJBxtc
         a6dxXVVxsnWufF+LKYDKXO0JlBkPRAmIBBHgHnssrpNse1Ihx743ouTBpimgFqqFc2c9
         aKSvbNFGdoKxApLNavEugFy2yJP7Fw3uyfW6E2B6M6X+4QdcRmpBa7dnSdkzgOl7U7v7
         zph84JuPwQynCUE8zcXLT2Or0dY57tRmJwqS5fkgZswwQycxgbZdgNomiRoyJciOS7fu
         mwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310835; x=1732915635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgcxJQInlSDlU1ZPZCnb+/0ZsXJwXQ21vyWhse9ncug=;
        b=DhFbbrvC74XMODbAWhHufGKFX2kHKUSMDK1k8COrSvFrq3tCksgx4IptTJ+iXGT9gP
         YUHZY5Rh5CpeIsLTk5L7+Ihky6B5xgseoJoC+Q+ytiN4DFZfdn2tWFErfbC1qApAyLnd
         QtovUydeJCS0Lvco3dNCk+zzBjTQBUC1J4BXlGRUbdrVDdxBDB1N+7UVcJhjyngnMYLz
         2byJmStU9bLekB41e5izN4E1g0GnGtJ/mPn9KqPWSMI22d3mc+bhC9oUEajBzPegK9ED
         3Xr0hUjidGKPPsCDrWDQKgb2mUiBE+re0glb40lQEAY8re+JFqmqzjhUoo/ffSHC9r4+
         eZ+A==
X-Gm-Message-State: AOJu0Ywj9tBiIpGLfZztFyspESVo1K3DgHnSXYtuxcSjuopUo5gjno4k
	YC67LpPLPo7YDiNRNUpPfafEJ36uSHEBvFPM29fMNwan1Sd2V5tL77esIvbWsmxljjGUu33rE+S
	J
X-Gm-Gg: ASbGncvLfRBbVf5swZbdoj9SNKcxAHmXvZC3g+MzDSUHCZ9N/zYDVkeGLhZD8BCYdum
	Z0yCTf8Bu/lYsT4+ybKSTfNp77eyeb8Ab7aUIwpTPAl6VQBOdJj4sx14tgPXgGfqL5leBJcHMNq
	mvXnmkcblTvwlaPFOljCVb3nfQZtY+a0NHNrQ2r7VfxcdvOy8K3H7keh0Y6VDgUtcdJuA2KvmJh
	3HZ9Vv8uUQ+cwwrgjbMjVvGeAnqvR3kUQag6i8=
X-Google-Smtp-Source: AGHT+IHpZHX89qGMwo6Ksx6FHEycgriqLrA5V54emxWgzKVjsNZPKFYWdfDQDUBw0bKjxsmJhitItg==
X-Received: by 2002:a17:902:f605:b0:212:536a:57b0 with SMTP id d9443c01a7336-2129fd7fc07mr56413985ad.54.1732310835284;
        Fri, 22 Nov 2024 13:27:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails
Date: Fri, 22 Nov 2024 13:26:37 -0800
Message-Id: <7050f445081801555614b264e1932e55538a7127.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207668

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
index 4386b985bb..ec5e4aa922 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -284,6 +284,10 @@ post_relocate="$target_sdk_dir/post-relocate-setup.sh"
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


