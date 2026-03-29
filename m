Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18683F3D60E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29638.1774792068339942115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=UICwZD9Z;
 spf=pass (domain: essensium.com, ip: 209.85.221.53, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfbd17589so313772f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792067; x=1775396867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVvJJ+Gj8mlASHbywrVw9gIse80aNj0aD9a7Vi9D8b0=;
        b=UICwZD9ZlVp5PbQB9jB9PafNk9S1UraI/qwIR3zC18SY2FxCEWjmHKUi51NsrcQGZT
         dm0HuYVqYkIr5nWJ3j81ZyvjueP67cIdn6TyYyso1MORwBnsDYa2jg2Cgn6tP7VQe1gm
         6rvP0Go7roiyoolE29BfKAdyw2m73qcQQLLE8W67jzn11ZOLePfNIDH8PlW16meVBA3O
         8/HZYxPxmoWge/9UvpPi/DIdzzOF6cxoyIokQTmki+t3WXahAMi3rk+heSDqb90TckHo
         iOHi5Izl1K7wDCvikYuhxSTvDZ72thZ17AN7GIGFwQDsWEzkSu6UP+KZkYIDTpxiYcoF
         0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792067; x=1775396867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVvJJ+Gj8mlASHbywrVw9gIse80aNj0aD9a7Vi9D8b0=;
        b=RQkN0amGJCdYqDWlQSOJE7i18iI3fiTM199jkPR3K2goYjJ8EhG/8W+5LoZk9Wah9k
         WHnM+TOiC3VtJK0cy3ijBMwPX/raQV9dGLfDssKkbj+Ke7nw/K1FOYFG0DkZCVkcGAPo
         GsHio7YQ8aJWVgzeAGsszaU1DTqHjPyEmVR41YWTFQxq33/MFz+snnMqPMCkcNYKEj+o
         ockJf5q+OLyS480Fs0iMiNGQOIIUIgCYUGyxgniDZBg0oWyynVP2ZvpsC0PXSaH351WT
         XnLtj0rGL/FnIqTDI37T0TupIhUxeUPQec+Tr4j/XySt4hxY6xk+WhRsYo3tAHXdNyxb
         BxfQ==
X-Gm-Message-State: AOJu0YxbxEVwr+sQxkimc/TDBI22GSNHYBARs4GM4YiCtS7anQF3Vnbs
	DBl7hgvdko9ECih0HTsgxmUztA8mJA9Cy8WhfEIf6SO5z4UPLE5YdwVhPUMd7DnGgaRmEn9Rpy5
	AYQaQ
X-Gm-Gg: ATEYQzw+8iU3UihFqD6Z6GzO5Hcc8mOr6taHijL46EYybPyt/Mq8TwW8lsmd02fpG6r
	YEnjzG1/pka2DfVpxbcxeIl7W+4SjbGb57UNQq/7W4m5y/Yryu6wXjQN2UKqFzHfJ7mxkpCvne7
	qBriONm4vVlMHIi3zHerQjpIGKkFgRG5i9XAIIUG4KkDCICa7Igp0MRoA2HI/zGCEqtQmzyrAxw
	UuVNDdSQpZG5KUyf7G/zjb4RsFLm8Qw1ArkxWvVBB7qYP90Oj0a0AKXVoukyGqnSZgXcVgsGkUu
	vW6bQD8dgviYmj4UWckrHkf+mQeZ206m3RUJt+7Bs3GS+8OZr1PX4fwAd0gl61LC0+zyGRyjb2G
	C+5S6qwi7oU9tEk/T7lkVKJPJDePsav9mm0uczJ5BOFYEIZU5LN/ZxR/d116yKUajovh2h93aJK
	Ugs9YQ/dXwZw+vaDmTsPOuwvmaR4Uhicmuh2cQxXJWWmo=
X-Received: by 2002:a05:6000:4203:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-43b9ea771a7mr15221725f8f.46.1774792066545;
        Sun, 29 Mar 2026 06:47:46 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:46 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 3/5 v4] image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
Date: Sun, 29 Mar 2026 15:47:13 +0200
Message-ID: <20260329134716.3185469-4-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234146

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

If defined, this variable value overrides the size of btrfs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index bcb0c75b9f..125fd64313 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -118,6 +118,12 @@ IMAGE_CMD:ext4 = "oe_mkext234fs ext4 ${@get_max_image_size(d, 'ext4')} ${EXTRA_I
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD:btrfs () {
 	size=${ROOTFS_SIZE}
+	image_file_maxsize=${@get_max_image_size(d, "btrfs")}
+
+	if [ ${image_file_maxsize} -ne 0 ]; then
+		size=${image_file_maxsize}
+	fi
+
 	if [ ${size} -lt ${MIN_BTRFS_SIZE} ] ; then
 		size=${MIN_BTRFS_SIZE}
 		bbwarn "Rootfs size is too small for BTRFS. Filesystem will be extended to ${size}K"
-- 
2.53.0


