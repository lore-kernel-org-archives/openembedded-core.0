Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D17CDDE7F
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:11:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.11702.1729696294375473453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K15AJXcO;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso992644966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729696292; x=1730301092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B90uiVfzIGl9kClqC+55+57CAPiDqx43c0Bi6dzFtGc=;
        b=K15AJXcO/I3WmFAKIPdaRI8G4ADvaJNaqU1WtlAeLMejYIsjPxppCrc9+ayaD5z4Ng
         fnbJwZ0vyzUqiTvaqNhP5sYOHpy7uVgvGA+j5u/h1SFM0ysGlacZ8+1QsPZMhNDBrwO2
         AkvQIVAuIVMhV63dTO0/Pem8FTE9nAFW+wB+cWEBe2Th+h8tulr3w6XESa5K9XjKFysp
         7JvIMSk+RRY9/y20tPHVPq8vA65SzGXACdzXCOnpqsqEDbO8A7RaG9b+GnKDUH91aWKI
         z2vQLqEBjKyt1TeayN0JCSWeXQCG/qqyxRMbJGtiiocvNNXqkS8CLsI7dN0HZHGiR9T1
         cstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729696292; x=1730301092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B90uiVfzIGl9kClqC+55+57CAPiDqx43c0Bi6dzFtGc=;
        b=Xdf+DDnYosiVRtyva9KYLXPkn9h8Mxu8xFdSuI6BwL/VcbQdcvrBCthqP3VefW5CUS
         gqou70sMNKnyI7+95EtGeQc27vtBO1WapX3+F0pbMx3qlcTrLIh8U6CMZEUWjdseYnh7
         BKuWyJNsa8EOjti6XWShI9RGZELVYMD9inB3/Hu82P0Cxmx7oLFC+ZL+m56vjih8v52a
         R63dVdTZSP/w7F2LlMNnnugsiJUnEtlaOgQztkkTJzHP7PMTiNcJ7qvYjkRSKwj8uV+q
         CjqRUyzD+asEZ4lYv2ttMXyU5qp+eFTgql8QE1Bu9I437QIx/ncu8sdohdGJOykoVrEr
         Lqgw==
X-Gm-Message-State: AOJu0YzYb8R3pJVrYDxjLqdfJZTt52145DWscA/JVurbLGyCpZuIQvKD
	Ez41SvLTW/O5bwKIa9vq3ukRQ4tGzuR+CYElkqZvNiWJqssRmarkHJeQaw==
X-Google-Smtp-Source: AGHT+IGSGi5Ikmdvc1Zk/ByT/hnbj1fwl//7GXtvHOlOwvsqo0HM4fsZFRE0TB0McNa5uqaEZf9NTw==
X-Received: by 2002:a17:906:6a28:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a9abf851b96mr295460266b.8.1729696291699;
        Wed, 23 Oct 2024 08:11:31 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6312sm489090566b.2.2024.10.23.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:11:30 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 1/2] toolchain-shar-extract.sh: check required tool before extracting SDK
Date: Wed, 23 Oct 2024 17:11:26 +0200
Message-ID: <20241023151127.3611757-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206248

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


