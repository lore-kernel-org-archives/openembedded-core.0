Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603F7EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:54:24 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.8110.1687182859444841245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ouSlo5LN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7625719bac0so52457285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687182858; x=1689774858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbmsFz3DoTZ0SAEEUAE6IJRqG37Aj+CVySuFg/81lws=;
        b=ouSlo5LNVUx7poQvJazrrz/9BmVQWe9iHIThmE/Pi05iuI6TJUT8Fdserc3oaktY6B
         3cJlikVMvo7ec/EEt9NG0C5X+NhL3uUCFlRVnlKaDRLRjgFzilr8VEBC2MwuQluDnWvw
         r7EjDcmbGlrov0cCAa5EnfMhdgBD/40S6p0An85S/Lzj4LepFzAfTGgzvDleJ9y4L71O
         waZWDpWCiMAeuVz8y7lmjLtQpXeUFu6+I6y9wXeM7Ao/9tZ0cO4GZt2DNnEUvORjNFaj
         /ni1NXuKKnzjHfuLEvnGB0cw8AQ148QD5jUAxE8DUarft7fM77SufX+NT6UszUBxayk9
         vYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687182858; x=1689774858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbmsFz3DoTZ0SAEEUAE6IJRqG37Aj+CVySuFg/81lws=;
        b=XZUoTiOpFWi0DbZL+GEH61sWEXuPjH8+VG3hpxTo1aj8kt+7FEhvLvA3GnC5k+PwJn
         NClBgHfMhrkknMjqeNnk1UE4/4ziN7LpBSwzYohM00Z/czN39r5CZpYDHI/BWRSIoA+M
         80US/ZdK+DFA26LmTpsF0QSm9JSdtX5phLXh6Dhbw9IHqxqddSye1HTQs3/sCGQ0LEVx
         NtyKO/KYx/6KjzB9c4Kl+PAPnV+I2F9GC5NXrF+rrgMlC/XOAhRjLc8DyhuZ/3DRmE4T
         RnjOf0LSKHe/+TpW010rQMsbDPA62rlAOepf7NxbDK8MoPvv/81SZz3oMeiix2ctthfT
         ySDQ==
X-Gm-Message-State: AC+VfDzUjJ8vnhEXrORnh9ray2NUKVDodPkp93gy2lVrPpmOppWJqmyA
	jQ1ztvH50WVd3FgpXpzhMZ23ATWtfAYuMWTshXc=
X-Google-Smtp-Source: ACHHUZ6sT02YKu5b4xx8tuJO7CWmCteUVF1ai/Nrejo/1UpJX0x8jVqbb35vnhLSpm5wpBYNHOrr8g==
X-Received: by 2002:a05:6214:1243:b0:625:b491:7911 with SMTP id r3-20020a056214124300b00625b4917911mr17974714qvv.21.1687182858138;
        Mon, 19 Jun 2023 06:54:18 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x19-20020a0ce253000000b006301819be40sm1865192qvl.49.2023.06.19.06.54.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:54:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] runqemu-gen-tapdevs: pass STAGING_BINDIR_NATIVE to ifup
Date: Mon, 19 Jun 2023 09:54:16 -0400
Message-Id: <20230619135416.1640748-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 13:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183109

Without this, runqemu-gen-tapdevs fails with the following error:

[tgamblin@megalith build]$ sudo /workspace/yocto/manual/poky/scripts/runqemu-gen-tapdevs 1000 1002 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
Creating 4 tap devices for UID: 1000 GID: 1002...
Creating tap0
Error bringing up interface: sudo runqemu-ifup <uid> <gid> <native-sysroot-basedir>

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/runqemu-gen-tapdevs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index ec3ecb03b9..dc730e413d 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -79,7 +79,7 @@ fi
 echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
 for ((index=0; index < $COUNT; index++)); do
 	echo "Creating tap$index"
-	if ! ifup=`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
+	if ! ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; then
 		echo "Error bringing up interface: $ifup"
 		exit 1
 	fi
-- 
2.40.1


