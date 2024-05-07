Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27826C25B76
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.4736.1715060009378704111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OL0NGbCP;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eab16c8d83so20125375ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060008; x=1715664808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7AnVRSxIKtYuf0ywbbYH2gMA5NjwE30SWIXQ4oYqb4=;
        b=OL0NGbCPXxbdTbvh1V3KMsUIsF0ffL9Ro/HWvnH6zmxpVnMizsmNaQrIxH0gKuJWbJ
         8YpzXLjTd5Aw6eBzRryJUlZVMyJp5ibH9rhJsovbz9fxhOf6b1982OsS4CDyHjVWYCa6
         ezEzHCa0f+Av6JpKsEu9IyyKnX6BtcFqasKfMd34DbGD7jBhgLM+9Qtpsi0ASkvaiq7L
         rXQc1ktkFHBEqi/HVsjI2rnKLITuqUf+VUqt3U+jHYr2Kq32DnTIBn0VfqLt+Bbg4iSS
         mSg5Pzj85dkTzRixlH3HxYaT0Xy+tnl4sbqqdUPTc53qTngUCRNpQTE5Kw11ymQ3DVTz
         mwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060008; x=1715664808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7AnVRSxIKtYuf0ywbbYH2gMA5NjwE30SWIXQ4oYqb4=;
        b=AvEd1o9mM0MCA/Cn7day7b0N8UANuoykqE5tiGLZKKiR4MV54BNZ+TFX4I4DcVRD99
         jCXvxH+80zDg3MQ78GyxgBsF203IwreJSdFZficRYk9GhRvyfLD44e3J2VzFOMqGwjg0
         lePqRdpl3Y/KzmdM7g292sRvGNpik91fnWZEW4Xah8j+/w0Qgp2MyurcG6xvM+OjVK9r
         0QsgnzUImCDHy5H0kYvbMVaoAxIaeVPeSxSz6YhmEqLbNNRd1Z9/1Bz/Lr0iKJNo6orl
         Gm3zVyR2jignW/+ki8UdtV+4us31IcI6DHGpEsPN4Jwq7smwuyBMVurZrOXjLozljMjZ
         aeHQ==
X-Gm-Message-State: AOJu0Yz/4iClANSclX/8TkK9RvYlxxhvSbvL3lHBvtFPOqIgAvvtzC76
	ModTq+iyEtqVlACfI1tTbhofuaC8En+zFXj+nXFe3mRU0ZNr5F6SgtaNiD9k
X-Google-Smtp-Source: AGHT+IFiv61brRGSn1beO0DnkDmWuvocrU6hmAqDxcXIr5ckTK17YOb5AKrNKsiVGxjhbb+9SJMkfQ==
X-Received: by 2002:a17:903:2349:b0:1e5:3c5:55a5 with SMTP id c9-20020a170903234900b001e503c555a5mr13060313plh.8.1715060008426;
        Mon, 06 May 2024 22:33:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 06/11] pcmanfm: Disable incompatible-pointer-types warning as error
Date: Mon,  6 May 2024 22:33:17 -0700
Message-ID: <20240507053320.1566814-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199075

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 22c9fa59dcd..2e463cd7b36 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -27,6 +27,8 @@ inherit autotools pkgconfig features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--with-gtk=3"
+# GCC 14 finds extra incompatible pointer type warnings which are treated as errors
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 
 do_install:append () {
 	install -d ${D}/${datadir}
-- 
2.45.0


