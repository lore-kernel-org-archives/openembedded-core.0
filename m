Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B65D10C1E
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 10:43:42 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.27490.1730025812978441572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 03:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mgVDWU/D;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb51f39394so32711991fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730025811; x=1730630611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdG8KY/RBhpHf9SFVQ3TjTtUz9JQP2YYR4r/fip3VDo=;
        b=mgVDWU/DKKZgbucWes38dGf56HHjcjZWRIEsfOx644J0mbzjt5iYXWl56x87BZquc3
         8u4EIvplkV/M3/FRGo4F3vyPUf7OX/u+0BACug4et6dffGhZhfYkDdXvOf343zBFJsl3
         lJ3q/cwOuFhVnBrEY8KOfj+lFu5xPP95lzeqquzlr1pJaExlBvtuBKBRvFlPwE6DwqcG
         bzC5Dc0kaPhZYXYIX1t53adbZuYeLCzepAIqaUm2heX/eIxdsrG2YdUyUnnvgH4IvoTK
         QsremrPkMGxDtKy8zz5hBgAtOQKOF18mbnpi/H0GyJzvRLltF8P6jqEn45OcZPuAS+Qs
         qXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730025811; x=1730630611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdG8KY/RBhpHf9SFVQ3TjTtUz9JQP2YYR4r/fip3VDo=;
        b=G+y1v7zFDV8XvdOINv/neGbJRanYMgztfb/ZX7ZyjJmvvLR6IP8IhGKq5XR7AMjlIM
         e/LfAJkk0DPxSQkCGrxCT1isTRxFSRSFAHkjYu66+LLOewqcEZ0b72RzPCW17QdpAHBm
         tATXlhuJPDE6jsQWZAw4tGXuwwMBbwRfKPrnlWZs9BSQnfM1DvFn3bidEtH9+/jnarK+
         m1BOurSdy7GlUaUe7Loux5G2vGfBUb+avAh0H+qha7JeH13G9XWHRbL8SPz4noNNfz+b
         U0elC240BaC/2prfc79qde6aHr9V4ZplQA7Xlj11sWkU0mzE+DZqLo+4EgLJI+wXn4Pn
         LMRw==
X-Forwarded-Encrypted: i=1; AJvYcCWYF4kMLcbZBRrp4shUQcUENB4bnaehD4FOX0sfkaGp/ejUc2kO38sPKjIdzP3qSC45J+hoNwJNAtrDTlixxgIzyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDCGy5me38fCtHabd6TQfgmUE8KeZbO1+GhZ1bwZ00eGo9umpf
	oelH9i6TWNvh9V7KHVAmGcmn4QnGd903L91fDh/3J+U3p+cQDjAy
X-Google-Smtp-Source: AGHT+IGGuzBm6k6qHjt8pcCa9Kd7XQaj+fa4Mv9SeHuvF7Cxxr/+/TmxRCl1p6eCzJuYqR97CQUJBA==
X-Received: by 2002:a2e:4c12:0:b0:2f6:57b1:98b0 with SMTP id 38308e7fff4ca-2fcbe0c3a14mr15703521fa.42.1730025810585;
        Sun, 27 Oct 2024 03:43:30 -0700 (PDT)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4617007sm8089771fa.126.2024.10.27.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 03:43:28 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: ross.burton@arm.com,
	openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 2/3] toolchain-shar-extract.sh: check required tool before extracting SDK
Date: Sun, 27 Oct 2024 11:43:17 +0100
Message-ID: <20241027104318.8326-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027104318.8326-1-liu.ming50@gmail.com>
References: <20241027104318.8326-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206395

To extract the SDK archive, the proper tools need to be present on
system, check unzip for zip archive type, check xz for tar.xz archive
type.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 7e40c67374..8368a81196 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -245,6 +245,10 @@ fi
 
 printf "Extracting SDK..."
 if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
+    if [ -z "$(command -v unzip)" ]; then
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
+    if [ -z "$(command -v xz)" ]; then
+        echo "Aborted, xz is required to extract the SDK archive, please make sure it's installed on your system!"
+        exit 1
+    fi
     tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
-- 
2.43.0


