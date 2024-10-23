Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5313CDDE6D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 11:11:30 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.6366.1729681889452063075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 04:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjOTTEJF;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso955246866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729681887; x=1730286687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B90uiVfzIGl9kClqC+55+57CAPiDqx43c0Bi6dzFtGc=;
        b=mjOTTEJF7pM1wOocUv6I86E/y3G+1rNfv6uxwx1nVaA0PRvhevMOvOIix/apazx4V3
         /aTUzOJxs9aYo4nZvhawI3xJStFsleAg56PSAySa4fk3g9l0GtA6GmSEIKqrPVXsPOSL
         gMRaa3pyG7IXdnWZotq1D3/mI/n/fFglT78XS9+vy777imnSwT1c5zaoeXQodxJrbN/T
         opjZ37QcZ9CibxJ6HrFRYHkiBPHtikiUt+0MYXnl+92mY6g57ydcOnqyl1vFNHCEieM/
         wXxsFvQKq+skfx7MpULIo5Yb647Z6JpRd8LpOqTwaYHq28oVtek/W2Vp2C6ye3s0vyyw
         9fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681887; x=1730286687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B90uiVfzIGl9kClqC+55+57CAPiDqx43c0Bi6dzFtGc=;
        b=cioVVRsYHvr36VKYFjkmMphjK6BRafsqlJKWCux1Vbkhv5WoL14wUmD6Vyir4yV8xR
         LztKQ1sN9Za6GKYx5hyZO2jYaj5rA4CaUZEw6REhKHrx/TPXCDAjDR6lP8EFTZl3RwH3
         JIREviH9ced6fGXkojB2po5T1IEDb8V2FwACG3+ukRGq2db3jwpHg5oixZ3eb1sQ22vc
         SpbMXDenp5z100o5V2k9DiYNM9fZqw9yLQId/Sn+lsLEKdsl8/Hyq2D7j5a+91kpZIip
         r4eT+ScqiddTcjgTz2OGfVyB8I2tj59WAW4I0X0zXdeDdJefzzH1gnsxtDHbzOAYF1cO
         BG1g==
X-Gm-Message-State: AOJu0YyEM+sFfgl4DdXMTQyloKXdrNnhskAgtwH0O0TTehgWFGqZQHWK
	f6l+ApPmZv1bkP71qZu/ZUPMF4j6oZkw3pNeiOsxlkFUtWt6H2RV9qUYmw==
X-Google-Smtp-Source: AGHT+IGVhWMRM1ikgURkgirulHng93zOPRClb4Jn7rHXFvluG+xAgOiJpYDjAwcYewk7ftYJgkEvuQ==
X-Received: by 2002:a17:907:9720:b0:a9a:4a1f:c97d with SMTP id a640c23a62f3a-a9abf851e38mr230725066b.7.1729681886983;
        Wed, 23 Oct 2024 04:11:26 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6267sm463392366b.32.2024.10.23.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:11:26 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH 1/2] toolchain-shar-extract.sh: check required tool before extracting SDK
Date: Wed, 23 Oct 2024 13:11:20 +0200
Message-ID: <20241023111121.3437045-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 11:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206196

To extract the SDK archive, the proper tools need to be present on
system, check unzip for zip archive type, check xz for tar.xz archive
type.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3b4647fca7..9b72499ccf 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -245,6 +245,10 @@ fi
 
 printf "Extracting SDK..."
 if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
+    if [ -z "$(which unzip)" ]; then
+        echo "Aborted, unzip is required to extract the SDK archive, please make sure it's installed on your system!"
+        exit 1
+    fi
     tail -n +$payload_offset "$0" > sdk.zip
     if $SUDO_EXEC unzip $EXTRA_TAR_OPTIONS sdk.zip -d $target_sdk_dir;then
         rm sdk.zip
@@ -252,6 +256,10 @@ if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
         rm sdk.zip && exit 1
     fi
 else
+    if [ -z "$(which xz)" ]; then
+        echo "Aborted, xz is required to extract the SDK archive, please make sure it's installed on your system!"
+        exit 1
+    fi
     tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
-- 
2.43.0


