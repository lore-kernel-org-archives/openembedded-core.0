Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F6DC4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2507.1698880282554186402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=NpX30nO1;
 spf=pass (domain: essensium.com, ip: 209.85.167.52, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507a29c7eefso313261e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880281; x=1699485081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPkSr7ECjACBiOXbSwkVaMT9agDEBfFY9xLGpIpwJrs=;
        b=NpX30nO1+iD7WIctiXoe5sDTx6vuCU6UrvQLaw+6A8oGKzJ7by8D8g93PeU0YPv+NC
         Cp1VVHqmIk07eLd2ZwC8DkOby9i6LucqFp9aT2iERdco0NiknxKYWlqO0l7p9pFx1aQY
         AbtRiQRiyf/FyApC6Iged0WG0p9t2Via52Uv2hCK9+22ZZuTvUrPwh1IN1qOF3xUkjVF
         Q2rUKUsTuWVfElFzX+CcKsS+KEREh4/ZFDvdJReSsKMH0qzTXZq550S2WkEQJnDApHZe
         g6fUPoOn63IgA7qlWNlvRU+zV1IZcxfVLFxvM5eEMjLivgebErervYtU3NDDLF9A4c3q
         woew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880281; x=1699485081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPkSr7ECjACBiOXbSwkVaMT9agDEBfFY9xLGpIpwJrs=;
        b=XTRd++Q+qnWLFew9QpbFzPoyQb2oXlvmOWCsgOu95jORjyPXqfmdcsNh3tld6lftzr
         8WhPOakCHiTacLwBFaM276nNS+PFi02REggTnDqPjc0R5NaYp6rKq1/pP0H4HfnAoX8r
         pe1hY7jyXI2+ri/XstU5c0RgrQum3H2AVFy3YTx4Jx8HY2cyqcbOzVEq9Ocdra7DBVDr
         xS60uQ+JYdi3il4+LZUoN1csSES+ElFNoiUT8aartLO5kqzizz4aomma60iRhSjPesqO
         7sercfaeFD/SiiFZOMDecqrAn+gC202JTYyV9LupHvq9weBT+FG63CwwFZIq3eeCTXdF
         5AoQ==
X-Gm-Message-State: AOJu0YzJ0mzzGd4CYB3OFO9Dr4E+iIlx1ys30wueQL/1Y1RiF0dSj3A4
	iXJvZts8U9je6cW2W+pzSmK09JsV7+CiOmOW+Ig=
X-Google-Smtp-Source: AGHT+IFKgl1wM1YDjLV65hHj96rbC1rWiGtKNeDk6tT2mUtVvWE8NXNfLBAIPslhCDcMqRpQnDvgUg==
X-Received: by 2002:ac2:46c3:0:b0:507:a70e:c619 with SMTP id p3-20020ac246c3000000b00507a70ec619mr10652189lfo.67.1698880280580;
        Wed, 01 Nov 2023 16:11:20 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:20 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 4/5 v3] image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
Date: Thu,  2 Nov 2023 00:10:53 +0100
Message-ID: <20231101231058.86928-5-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190052

If defined, this variable value overrides the size of f2fs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 1356552445..6e3190fa3f 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -272,6 +272,12 @@ IMAGE_CMD:f2fs () {
         # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
         # space here when under 500M
 	size=${ROOTFS_SIZE}
+	image_file_maxsize=${@get_max_image_size(d, "f2fs")}
+
+	if [[ "${image_file_maxsize}" -ne 0 ]]; then
+		size=${image_file_maxsize}
+	fi
+
 	if [ ${size} -lt ${MIN_F2FS_SIZE} ] ; then
 		size=${MIN_F2FS_SIZE}
 		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
-- 
2.41.0


