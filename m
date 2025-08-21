Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3641CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:23:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.3576.1755760508013166733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 00:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZBYHbiaP;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: falkbauer.git@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce52b9c8fso149277e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 00:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755760506; x=1756365306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgvQS5xnIGiMkGRFBhiys/NwK++3TXLPmT9Jqqo3IVw=;
        b=ZBYHbiaPTmgh82QNpTqr1/q14GP0B9pw1UX05bpAnMKAIfx22pSFQag8ygzBIUNldu
         P8U1pM4834CTQtZNqiZYgm6TAnqZ3HipEU8O1VbHxBGnyppbgXXeMvPw1eZhWhej8fRT
         oFcUFP+MBoJgrwFAx4u6Y3jVOoBCm3UJ3r8XLzW5KmG8qrKqvKmTiaomUHi+FxNJp4sZ
         /e7dp+onaveR+vnRVT3IvWi7LWggG8NVxiOu/mfz//MqkMVucf2fAhq0uRSP5Hp2Nqu3
         xmaaBLctuumsXk+736qzKK/SBT+6IWpcrK/3AsWFMiIwg3QUzQVoWAfZWf1w/JlXU924
         nfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760506; x=1756365306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgvQS5xnIGiMkGRFBhiys/NwK++3TXLPmT9Jqqo3IVw=;
        b=pxbmPRC9VUR9YrtUwFcMIXZsHNrxxsp/3V3mslLw4qGv5w6sKr0VobZ6mMdA3/eHWu
         33KbsWw7Pp58uUdE7BWkSF5E289snCMBMI72PQBoGp3vEpNZf9k4UViVNlKFzd4r90TM
         AJLWa4HwjcpdzGG8gXpQDg8ouX5gKKPQ6UgQWRc3NJA9b08U56F9QLc0X2E95gFn+wQF
         EEst6oxZ1tECBX61W8BVd9RkGTkvjap+FD7F4t6+lq0PSn/i70XYJt5F7p8N53785umP
         nggse3YWfPrQvpqUG/GA/6KL/9BZaW8pPXf38Kruffz931xKYhqW/jn6gck7QlodDZBh
         FZdw==
X-Gm-Message-State: AOJu0YxoBRSfsPefV9HG6fX/+oFArg+jNDafVgZBnjqSeVRbGQFHLM0l
	+c6+3Uo0GMimXsz/x/holtmR2/F60AJjVuBZzwEVn6YFuBdSUssnDP8zBG/6E45F8F8=
X-Gm-Gg: ASbGncsOYAe2f1j6U+GVicExJ19BVf5x/kRYOJ23jF/UymXmdLMfK5f8LZsS4l+hILT
	RkPtPGn0mmq/souMahHjfirS6xbudJIQZ/yEBkD7B1ickJO7FfyQcLHuLawQBNqo7hbv9hR/Hbx
	YkUvOTzf+eNnSR5nc/v1/SoXzCyCuWqPkVIygp0zAUjtK9TPDKG/uNRu52EigsEmdb+KbpQImSD
	ssX3PjuKglrDGsp9Wne2Ml+cefhq+HlYZakCsmdZs81rcfPAgx46rI9n+9d7YbF94zY+p2IocVG
	3BB96Y8jKXCSn7MDLdjlYSeEZZ0ov0MYyALTq+gdpJALTFDhePncjiA7uuvh/FvL/CWZZv7Mhf7
	GnvWNogaLB/zsjfepXIp35vsXwMlWscj6prFQxutKVVdvVA==
X-Google-Smtp-Source: AGHT+IGS3k25IxNuDqz8xaEurvgqff1CQYO9/bHKrbOFbO5GGlycyL+ms4kmHE5f38827z2ZEl8Q8w==
X-Received: by 2002:a05:600c:314d:b0:453:6332:a98c with SMTP id 5b1f17b1804b1-45b4d7cc92dmr5290925e9.1.1755760187931;
        Thu, 21 Aug 2025 00:09:47 -0700 (PDT)
Received: from yocto2022.igi.local (kreuztal.igi-systems.com. [80.152.229.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dbbadf8sm14457375e9.26.2025.08.21.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:09:47 -0700 (PDT)
From: Falk Bauer <falkbauer.git@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Falk Bauer <falkbauer.git@gmail.com>
Subject: [PATCH] psplash: Do not mount PSPLASH_FIFO_DIR if the env variable is empty
Date: Thu, 21 Aug 2025 09:09:44 +0200
Message-ID: <20250821070944.1152876-1-falkbauer.git@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 11:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222231

The script file psplash.sh tries to mount the PSPLASH_FIFO_DIR variable.
If the variable is empty, the mountpoint command returns a usage text
(busybox mountpoint here, util-linux mountpoint behaves the same):

BusyBox v1.37.0 () multi-call binary.
Usage: mountpoint [-q] { [-dn] DIR | -x DEVICE } :~# BusyBox v1.37.0
() multi-call binary

The return code with this console output is 0 and the mount command in the
if statement is executed.
Then this mount also fails with an empty mountpoint argument.
The source code of psplash respects an empty PSPLASH_FIFO_DIR variable
(see psplash.c) and makes a fallback to "/run". So the psplash.sh script should
also respect the empty var.

Try to mount the PSPLASH_FIFO_DIR only if the variable is not empty.

Signed-off-by: Falk Bauer <falkbauer.git@gmail.com>
---
 meta/recipes-core/psplash/files/psplash-init | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index e0f80bcdc0..69496a48bf 100644
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -26,9 +26,11 @@ for x in $CMDLINE; do
         esac
 done
 
-[ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
-if ! mountpoint -q $PSPLASH_FIFO_DIR; then
-	mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
+if [ -n "${PSPLASH_FIFO_DIR}" ]; then
+        [ -d $PSPLASH_FIFO_DIR ] || mkdir -p $PSPLASH_FIFO_DIR
+        if ! mountpoint -q $PSPLASH_FIFO_DIR ; then
+                mount tmpfs -t tmpfs $PSPLASH_FIFO_DIR -o,size=40k
+        fi
 fi
 
 rotation=0
-- 
2.51.0


