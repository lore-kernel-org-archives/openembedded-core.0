Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179D4C761A6
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.44007.1679494919199296907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qi59cQu4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id s19so5332905pgi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkKNKmblJcSbD2+fQ5Ls0RkcIvQHHFsMLj9xrlMFsi0=;
        b=qi59cQu4EBov1EvOejTF93SXHysch3bqBklt0cB22AFE0WRWIMfxMQsYEkDLDMmqCw
         nyH1WKtOWYgtUnoNGIF50aYPEnZ1L2PvzHwXmP6bh3UlCvWiQ/Kg27MWquKyrVKkRbVu
         enbcRYvs5ksjU8DygOIn6D8Vstvwe8JmHbX1okXe5ycKoakxcELztKS4+78FOsbJTZS+
         RQxRpUkpT1goUDyNjhKetOWrqvTfLqsAOfuUikyAouTPoSJtRPZVOVhHU9WiL9UlQs8b
         lJrQR6TWvtIElqAyLVRSIXuqHC9aZEzLHhDGS6PZE4hxbUaaRO4BhYSHP/G86NHZ21o6
         Bh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkKNKmblJcSbD2+fQ5Ls0RkcIvQHHFsMLj9xrlMFsi0=;
        b=pOZbwMWFlZRPd4GK+v76kztzNDu9sBf9gopey0WloY+58H9/Rbq5Ft59ISOGjZHLp0
         uJfLVNE8xSJhRC/YMbRv4QgnRaOjhPU75jPCUEFf8++kEd0vt/Eis9IyXudE5EDZWv1C
         muKCHB9fovzdeMwV61DWmBBRKrva1TnpxK/PvYfYst1WvP7TJib+ndOOPHYLhVIfi4g7
         SJE1xs6cnbZRIZku7pSfsKQ3GBv8uz/TMOiQiqI9mx7ua9ELrBXVIK+o1mwK7wLQPQdx
         g7azSPnn/K/0kIjSp5ROplUpvWZypdCo9vp/oIx+aOhZldDnTDNHzvkqQulMLvfMonyS
         Vt8Q==
X-Gm-Message-State: AO0yUKWoKwDZ6+jRrn5o5m+X665hBWdlu+SOhKcWfy2WuToUELqnd/Tn
	AwgRozWhAZCZYQcPW8qYE3q9J6P3UT2EVStIH9M=
X-Google-Smtp-Source: AK7set/LN2AjMsruC/gF5eoeSeWtMuFWLvC1lwXALGb4cY0L5AFQk8dGDYM0UFVDbxdknGDZTtAM8w==
X-Received: by 2002:a05:6a00:d4f:b0:629:5d35:3be with SMTP id n15-20020a056a000d4f00b006295d3503bemr1747333pfv.3.1679494918216;
        Wed, 22 Mar 2023 07:21:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/21] image_types: fix vname var init in multiubi_mkfs() function
Date: Wed, 22 Mar 2023 04:21:24 -1000
Message-Id: <705b5c51610a1d5a267a3f6559667a5f70fbadf5.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178930

From: Romuald JEANNE <romuald.jeanne@st.com>

As vname var is needed in multiubi_mkfs() function, we need to keep it
defined and use it as parameter to the new write_ubi_config() function.

See [YOCTO #15027]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b5e1cce35e129b21d871ab45b03811fdb6eaf8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image_types.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 764e6a5574..c6cb8f5336 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -157,11 +157,7 @@ UBI_VOLTYPE ?= "dynamic"
 UBI_IMGTYPE ?= "ubifs"
 
 write_ubi_config() {
-	if [ -z "$1" ]; then
-		local vname=""
-	else
-		local vname="_$1"
-	fi
+	local vname="$1"
 
 	cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
 [ubifs]
@@ -183,7 +179,12 @@ multiubi_mkfs() {
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
 
-	write_ubi_config "$3"
+	if [ -z "$3" ]; then
+		local vname=""
+	else
+		local vname="_$3"
+	fi
+	write_ubi_config "${vname}"
 
 	if [ -n "$vname" ]; then
 		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
-- 
2.34.1


