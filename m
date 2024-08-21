Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2094DC5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.18878.1724244652568897795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aHj2Ouzb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7142448aaf9so477054b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244652; x=1724849452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP/5vnbXU5nT0ydhoMB0geFvc23fmCMSYedhT3oDEMM=;
        b=aHj2OuzbzPxQw3vx8hVs7sqzkcWFmc41MOhFfzLcn54hrXrMf9cLQU0wDpRiqw/V7Q
         bNuwxEH0mqqNe9pJBiZYgHYCJQkmX1hb0fFUWMc//Pvr59YyQ9F/BhztsZzJZBs7R/9w
         nh7dlJTtGh408oYwlSjZ9nRTVVKL33FI3aKY0dAIa4X6td1ntYvdJsCnR1lxUlnKijEi
         54kraJnTSN6nFJeY6rzYN9RdoLDvp2n+AFOO5iQunD3l3kTjrUy+u91DwlAHZxa14cDW
         NOvyKaliTPEVPPcpHtdf8y62F38zC8pb8KolWV+OHWxIuEGEfm7t+eOuvI1vjZftK5Dh
         /v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244652; x=1724849452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP/5vnbXU5nT0ydhoMB0geFvc23fmCMSYedhT3oDEMM=;
        b=hGGE8yjCmgR64d5Ytfazblitu+OYx33aDzq8NXBZETdBExzuENNBStf/kQTYgSbyNH
         68R2a1txVj9tijhMKj3Ho23OxRmxhLKK8DHdZhYvfWJ3asxUMDQiKYlNWGc6AiD+B6AA
         dJO5XgARilPsR/ZDrbIT7NIrYO2v+Pcy2dr5l3zCQ6X+jYKBm1deqJrAEXOpx5qAdotO
         ph8vK4HAHds9ckwLCEutO3RSBUCtPoXtfdMpkfspvvePRffCVC7nkYOi+X9LazffgH+H
         cIeUIAuGRTjofOfzITy+QWvcx8PIQuCqZaJ7FhsZ+8HY8187/7hfWqxQydHrBu6tSJ+h
         Y+uw==
X-Gm-Message-State: AOJu0YxEclbayX7k6JlCSpwuR6Hh7/Z+DXxtJbzkVJvpzdFxswBEqD1m
	ZC+wGAHgYmKpM2LsJ00wmtIXKxjqthKAexVJ5BQmNvYuEwtyNtwFjIEi2dTqbzMRFaOfkSKN9PO
	C+Fs=
X-Google-Smtp-Source: AGHT+IE0+yCKW2u+baVSNK3FF5i4W8hlMcI6SmhoDlF2YHfCb3NzBL0HikfXRk+v99Bz7Zsb9zGhkA==
X-Received: by 2002:a05:6a21:b85:b0:1c3:b148:690e with SMTP id adf61e73a8af0-1cada1476bdmr3587814637.5.1724244651778;
        Wed, 21 Aug 2024 05:50:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/18] populate_sdk_ext.bclass: make sure OECORE_NATIVE_SYSROOT is exported.
Date: Wed, 21 Aug 2024 05:50:23 -0700
Message-Id: <bdf07c1eb23dbb53ad1df415b665c8f459320420.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203600

From: Gauthier HADERER <ghaderer@wyplay.com>

Fixes bug 15464.

OECORE_NATIVE_SYSROOT is correctly set up and exported in the SDK's
environment file. But it's then unset in buildtools/environment-setup-*.
The value is restored in the SDK's environment file but is not exported
again.

Signed-off-by: Gauthier HADERER <ghaderer@wyplay.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 825c996b7995d3ad510933b1a88229831ca5ea29)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 09d5e2aeb6..e76ef60720 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -732,7 +732,7 @@ sdk_ext_postinst() {
 		echo "# Save and reset OECORE_NATIVE_SYSROOT as buildtools may change it" >> $env_setup_script
 		echo "SAVED=\"\$OECORE_NATIVE_SYSROOT\"" >> $env_setup_script
 		echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
-		echo "OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
+		echo "export OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
 	fi
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
-- 
2.34.1


