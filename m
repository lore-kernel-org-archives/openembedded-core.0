Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB45DD10C1C
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 10:43:32 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.27518.1730025807376615962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 03:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ERq0jobI;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb51f39394so32711701fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730025805; x=1730630605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gX1UeK9Lf1HeybkSCfAOJYjCOOPieFUmDq21T2t6WEg=;
        b=ERq0jobIurRjHj0ur0BLN/NkIuBw2n6aPh0FYQQ+ukP0tesEuBDCUp7NAsXgJg2/MQ
         OqeI4n8u5hxgcmI7Ofunqxkk4CAHV4jtnL2JLrPOXA2bsFnGsjec7yXw7E9LVaiK7zpJ
         Us7XuaSiB6HMp+iPjV+qCdbdnlbSYO7aiA0vWY1kxTinHP9HUkAHr34Q/GoGWjIXgJIm
         /2z+Ki83SmEqBULs7ogicB9vFQJHSU9oEOUbPp88Umbgi1L/wDWp5kV3bAkcnyTYKVmz
         nA8cpxLDyK5Hp82DIsY2oD0wqHzsDvebGOc9fNLyADvy0clf4glkH8t1hZbwvBlqZN1j
         ZQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730025805; x=1730630605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX1UeK9Lf1HeybkSCfAOJYjCOOPieFUmDq21T2t6WEg=;
        b=hbH72pCQl8T7fTy1RpGP+G+8TQPaPF4hjugj9hazgZ0iEkagRAaYshHNek+Z3s3KGN
         8LMlSH4uaLkCT0kswUIvGXo5y6Ssh6eGnppX3lzIh+/1X7staAOSVBc5wSXIC8GLrLWn
         xyGijn3QneqywrbI1jJ5NrmwxKtxnVOFyR/zp3zAgVMmYs+NCCQFA9P8pO1Ylzix4FnH
         eQoZHRd8AUPBwGv4Y/rgTVkLLEyU9T/GPKe4sJhRQedTaFmVw2EQBntn0/w6ApiDLS4Z
         WawwmjIQ6ZhlDPN29lVOF3KAQiSMVzBRxBSpm9uWK4nnJMFeyuJVvsts0dIPwUfF/b5p
         Arxw==
X-Forwarded-Encrypted: i=1; AJvYcCVAn6nMQ1dPBTcRdYem7dke/Mwh6mK/3eL8Tt7UYMZWrlgIRGoUjYdSFCO8DziEsp2bMik/g5drDa3GgdR0PMcZjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNJ9KAsBzCc/XYiWf0TNUllDp9NoWlfP4Lij3kDrBx3NJfEh52
	yVGZDm0PX4DSuxdb/TVJcGDAMcY4rRgtJh79t/Y7AAqwlN8rqH5a
X-Google-Smtp-Source: AGHT+IHpyysjaIPyvMz746vnuifiDriQIHahJmtoMmU4sRi1LrmNamoizH12ED3ENqDEXIZ+EoEBRg==
X-Received: by 2002:a05:651c:310:b0:2fb:599a:a8e9 with SMTP id 38308e7fff4ca-2fcbdfcc4aemr14968391fa.15.1730025805004;
        Sun, 27 Oct 2024 03:43:25 -0700 (PDT)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4617007sm8089771fa.126.2024.10.27.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 03:43:23 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: ross.burton@arm.com,
	openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 1/3] toolchain-shar-extract.sh: replace which with "command -v"
Date: Sun, 27 Oct 2024 11:43:16 +0100
Message-ID: <20241027104318.8326-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206394

Command 'which' is not POSIX or even universally installed on Linux
systems, replace it with 'command -v'.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3b4647fca7..7e40c67374 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -2,8 +2,8 @@
 
 export LC_ALL=en_US.UTF-8
 #Make sure at least one python is installed
-INIT_PYTHON=$(which python3 2>/dev/null )
-[ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(which python2 2>/dev/null)
+INIT_PYTHON=$(command -v python3 2>/dev/null )
+[ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(command -v python2 2>/dev/null)
 [ -z "$INIT_PYTHON" ] && echo "Error: The SDK needs a python installed" && exit 1
 
 # Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
@@ -229,7 +229,7 @@ if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; the
 		exit 1
 	fi
 
-	SUDO_EXEC=$(which "sudo")
+	SUDO_EXEC=$(command -v "sudo")
 	if [ -z $SUDO_EXEC ]; then
 		echo "No command 'sudo' found, please install sudo first. Abort!"
 		exit 1
-- 
2.43.0


