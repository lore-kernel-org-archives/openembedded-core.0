Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51035CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 11:14:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.10513.1757416432978757273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 04:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHBoe/9K;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b5b113eso2353800a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757416431; x=1758021231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SYijx/gD1480RBPLZ1g7/xaXR9fGw9Q8f7DPgd4bCks=;
        b=kHBoe/9KWwPijGAkj25+P3bdP/YyXmuI1/ms3v74Wnd4Qrmh3kDgSnPyZGxc0VtvbX
         iRxoMP6BjIALEamwu/2wQY27mcH9Te7gkEkf4xcvFeCkJKX91YzPUpg4nmtfo21LlhC4
         0BKuXtWVSjXFCm7Qhn4LTuTG1nwn+47Mv32IYf+3pNSt3EQ9zFj9ncy1bwnkx8SdswH+
         A5vx0eqVmc07VlvkAz0rxUvlDQklUXhgkZLizga9men3mo1b11xBnSy9aac2KG4SjSKY
         zGvyjGeBcNmM0yNr9IH3Bn785H16E27w0cvlT2Q1/jVlT99kdbH4hn7hShA4u1wv+wdz
         +EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416431; x=1758021231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYijx/gD1480RBPLZ1g7/xaXR9fGw9Q8f7DPgd4bCks=;
        b=OjJOwtG5bmAo5+J9XnicBX96dCy/XSK/gBWFfyt6WxOy1QizDe1R6BBpa5vRdPFKp/
         zDQKJCol8nIikUZEJMxp52DeZFAROK7YsNw+18G7mV8HqgCxSFBNPcgHuUTuJOB/LmZo
         QU0u2vGPlAjnaaoEyoQjGnTZ29oAUtk9gNfKpueWHC8NiTcVk4Uq02kduL9cR5AZvcHD
         8vKf2BDuZ4GOM/cH27+lJwzeWRWnqqbK7Hcwj0061h9eJj/Eur3K6kLUIs/URjBrQrEU
         Qy4KtjaQSvv29JD1DkRyJyfodP4WAfB6xG8HvU/MRFM4Dnn8OnIDv8Q6AW5V4uwnDpdJ
         2eYw==
X-Gm-Message-State: AOJu0Yzbu9S40Z6Q2JyVo9aZjKGjem1lJgbCweJ2wr1ltUZY1pxNPU7U
	u5U7D0XSB0qDBX7QjR4YfXseCYtA5nlmwShUE2qzdFvYWFaTHXr3H1ePZO5Myw==
X-Gm-Gg: ASbGncvUF0CaTS//kFpViiv+eXdPva+btyOPVLJSPFJsjvabqC1mEPRjXZyLv3RocfL
	eG7VYVwfZ8tBGsgGtQmBmhkdNYTb0ULWpXHB44CfKSNfhmRvj6liR1yjhY1DTCELPHRSVAiTB7q
	Qxgq+9+GsJnp/FkSKMZH8GiSnm95rdRrYt7/NvjhhNyIjGyuiNSUhLhSdY+uY7b1aW2Pgx0cegH
	jmlVVP2h9GNWImtaslmz68sVKkvouAf6o5mulKTOROtUfXWAT0H85O/FelsbCwmtUPmPXQmDPkk
	M2sakodoM6cAi84HZbcHf0i2EvB+cFUKWl5z4nVsnRbvBi70J9ZyPdbaFCkEJ6I/Pd24q0SNYG0
	fal/0RxO5sxG3HEJ0dF7CJ/EelGhPqxY=
X-Google-Smtp-Source: AGHT+IHGVXpu+H/49kYE62jzAA/mOfUaksYTFmjlSedt+U2pgbT5RCMEl9kQjL4erYgVdXtUOYphNA==
X-Received: by 2002:a05:6402:5113:b0:628:6af4:595 with SMTP id 4fb4d7f45d1cf-6286af40c26mr6524865a12.20.1757416431139;
        Tue, 09 Sep 2025 04:13:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f65c8sm1016880a12.39.2025.09.09.04.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:13:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] hwdata: upgrade 0.398 -> 0.399
Date: Tue,  9 Sep 2025 13:13:49 +0200
Message-ID: <20250909111349.190196-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223103

Changelog: Update vendor ids

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.398.bb => hwdata_0.399.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.398.bb => hwdata_0.399.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.398.bb b/meta/recipes-support/hwdata/hwdata_0.399.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.398.bb
rename to meta/recipes-support/hwdata/hwdata_0.399.bb
index a0abf4c03b..81dede96ea 100644
--- a/meta/recipes-support/hwdata/hwdata_0.398.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.399.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4c97c196390e16a84d3394e7e6f0608046f7ba81"
+SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
 
 inherit allarch
 

