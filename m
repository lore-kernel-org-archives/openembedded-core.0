Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887E1D6C284
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:56:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.27953.1732038997981092683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bbq3UjbD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43193678216so11555705e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732038996; x=1732643796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve544kH4Lw5KcuWQ/I6w3CNBjuQhwAcEKLUccMyesxY=;
        b=Bbq3UjbDnfqovkhCFtgfNDwOuwngFR9KqBjg7EEolTYe5tXSfYLAgAuES9/mkS4zvH
         M7D8V2NxfKklE06Wx3gRY0XgHEamRAMCaV/eXrngqxlEfynavGwhd0fbgn56IFvL+NBS
         kLey7ybpwOttdiboyrtF1dYeehD7pBnKnwiJ9FOWxoMCx9o1Klu7dsEGdcZ8QqKG7k67
         pjGaiTkVYM2YgM2YMlcqmwwbmOCZba/mwQH3scrV2jpUOk3thRJ8OJhC6URETGfsAMPm
         fn2J+sYMo0e17kM3XgSKtd2S8amzFloqkNrzm+sBdbnnGv9DJweAPMzyxVBOzOlNzZZL
         fblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038996; x=1732643796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve544kH4Lw5KcuWQ/I6w3CNBjuQhwAcEKLUccMyesxY=;
        b=b8IrvAycAo2ADlmGKVHpG+gub6ucbCouOLasIZX6vYP52TGCFEv1TrFKzIWZEeSUQC
         9u2D0+H5wypmjAP+WRq/2Rjjhs/ral2NBbamja2/pM03IJGVYjOuaOzzWEel5O+yoTYj
         wIqwhAIAPa5Nh+y8uoo5mqIYTJ9SMGmT9kOHaY20lZJEDl1AKLwgB6XQddmV4+Z9SYFG
         Uw6IgRcZT/FrhnP+qnCWV40U/diwlyTRT1j625wm7emOx/DLoaw12q3hJijBxq8LlY60
         ySlQnQfO8h+v0sL48bktaLmRdTbyKUNwKkHm6X5G2Zro/VpOyDSiiPwxqhJnZvMCNE4U
         eocg==
X-Gm-Message-State: AOJu0Yy6bl0OHwN6MJEvBY66Q7OL2dQLgWxziX/93mLSikAyYeQHbb7A
	cxCcFwap/tRTSzjfgqKAM6b3FAEfXKBdVlv7d199pxGGrT0oQeMHcaycEZx3
X-Google-Smtp-Source: AGHT+IGOLB+hrz3rKMJojCugmUdTZxxgmguVtK2RyNzYaffGCTPhikrzM+/jJZZoLIQgD3RhhGMs6w==
X-Received: by 2002:a05:6000:784:b0:382:4aa9:b620 with SMTP id ffacd0b85a97d-3824aa9b82dmr4749194f8f.5.1732038995929;
        Tue, 19 Nov 2024 09:56:35 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823e0c910asm9405250f8f.39.2024.11.19.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:56:35 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] shared-mime-info: drop itstool-native from DEPENDS
Date: Tue, 19 Nov 2024 17:56:25 +0000
Message-ID: <20241119175626.2155200-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207403

itstool was dropped as a dependency in shared-mime-info
release v2.2 (2022-03-27)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index ef5df44ad6..b8a377e2b2 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
+DEPENDS = "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-- 
2.43.0


