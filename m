Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D506FC3DA43
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5046.1720077026470403183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTmoIg6i;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so3173391fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077024; x=1720681824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSO8mkDYASLZdBRhIJNhYyKjc8QBDr1qJaT2Qz9tmiw=;
        b=OTmoIg6ixEHLOXVernR7QDIZvtXwQe1ip60fgWwI75E9wGlXU9akCzM/IDtSz7X5B/
         SdsHS/gb4E3bl271I9n7ysgCUfnXuRqj6NKf97/9tsPaRFjmGlSpO2Tno/pBELXIyfQX
         fFNE/+LbgnQq2WE/CScF3yjRfPh6V6KXv9Zt9/55jJbvf/GZm+O4TZkHFqb0akt0aLw+
         ApLRHYqhn5YhdJ5SSDUosfxpGPYmLzZqDfMhoP6h269Ng1IJRnWQiFu7VCbfQpM8agEY
         87yLxz+j8HaMW8lTFzPzssgrZoVhSnIN242FxixRsqHcZe/ubDwBoNFFv5GoLQAJ/OZp
         V5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077024; x=1720681824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSO8mkDYASLZdBRhIJNhYyKjc8QBDr1qJaT2Qz9tmiw=;
        b=WHSeSigRRjwmC6das9eFU7nqYe5eDSV3h6t+7IvFRboWaf4dU9mxMdwiWB+QPIqDjB
         rYrWLwCmpBPdrPlRklontlrMTZ1FrPXiT3heRs9ED/V9QCkBDYJIo0QyuWLAb8JfPzEW
         uthfbD//qtARYtzoobMPOtDnCt6UB4SoZ9XxrsCz1CKcfijX/MRqUuonUpKQYYn1VvUb
         tBaO3+qNWb6hkbJtelbfarXJfsqY0RO8ALweQvuEG6EayJEGY7XzoakhVtDLjzVuiHaf
         LRAPYNeash81CKbDG9aCI9R4/o/jvemksLJNuWWDVpfRudpaD0o5eMUhh/eIL22MnwjM
         JUJA==
X-Gm-Message-State: AOJu0Yy0CjoYt7XL7s04U3XKF2eQYqOPw+okVUtuzBdAzratn7HvSDmN
	9Bd/AahzgwunFFoqHqWAewtx1TZtmeOryTpmAJAfXYydxjWgVOiywmlTWA==
X-Google-Smtp-Source: AGHT+IHNd/nPL8yhzkbO0ZHYQoPfSOVl2Wnak99ObIE1DrGqYwAAa7QMl3rrHlS7RRvnlFkxA5ruNg==
X-Received: by 2002:a2e:9eca:0:b0:2ee:4e67:85e0 with SMTP id 38308e7fff4ca-2ee8ed223a7mr4775991fa.3.1720077023602;
        Thu, 04 Jul 2024 00:10:23 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:23 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/14] kernel-fitimage: fix handling of empty default dtb
Date: Thu,  4 Jul 2024 09:09:42 +0200
Message-ID: <20240704071013.2982700-7-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201512

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Fix error in run.do_assemble_fitimage_initramfs.2779256:
             line 238: [: =: unary operator expected
if FIT_CONF_DEFAULT_DTB is empty.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 4b74ddc2015..6e6898e5f6f 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -611,7 +611,7 @@ fitimage_assemble() {
 			fi
 
 			# Set the default dtb image if it exists in the devicetree.
-			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+			if [ "${FIT_CONF_DEFAULT_DTB}" = "$DTB" ];then
 				default_dtb_image=$(echo "$DTB" | tr '/' '_')
 			fi
 
-- 
2.45.2


