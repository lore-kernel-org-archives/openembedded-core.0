Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FD8C3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8996.1720096068824205763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SgepVgbW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1faad2f1967so12878325ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096068; x=1720700868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctQd/PIORonbDusPeylzxe3ZeUXgwRLY+yX8Org3T6M=;
        b=SgepVgbWSQwRwuSReU65W6pLAqTLhdNkPvuKeX3iVtblrY5rFh4A9/lkTYgJqP+cjL
         LvcgPXZhY5yPsvIyK8qFjEyuioy9+8AmXOjgdWL/DxuxJanO5kVPmH9r5kNnN8BVo599
         7UjXG6LfTGFAFCqKzXOx158LDcI1HZmdiae4Rdi8R4gx6jVnwxvDsizkpIlRWdB2VTA8
         xuSuvTQjN6sA3cRqcjthlSPMvjetptOyzTtFfr5lw1a3o79eGZ0hg9S3z5x+rGvwRlZu
         xWI1gBAHGbSktbzcdf57UYaYuU09vrRvCyNIrXdU4udcL9eOZ0pGxqQ1bbbxrXTkh/Tc
         TFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096068; x=1720700868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctQd/PIORonbDusPeylzxe3ZeUXgwRLY+yX8Org3T6M=;
        b=UED5z6LPWT5lZAZOAoKfB4Kb+y8njizxRsAw2B320unB1PO+ha4bpSetcmUB7YJ8dd
         k1bcWbtf8/uZpsNKY5s9UwHd/edYZ7iM/4VDgpKh/n9W72asVvBpi7KgaaxLu5Kqo7H+
         6SixHCzvAW6BsvgfXK+5JJoA114BTcpIv/9yPqpliGNkeoi6r+t686h10SHZ5thfH3uF
         cbbM5J+Y567oEDd7wG3MTtU1VZqUNdbGd9g/BoWnWJgEKm82XG/vSWQsp1cBGStLAB6O
         CVmIoCtmaUMXW+bKvfXgQSLp4sVLgKfk5F4Y3FSbVT/WKUhogp4HBNa0E0BBjw3INoVM
         E3mw==
X-Gm-Message-State: AOJu0YyDtijqdVo+rx25hd+Zt4xVfH6YiMrrorbANbxarvh2eKyyDgy1
	ylyb5nLz+lADFuXV4uefhqg0awHnxcn173MU3XoVUhsdFIah5ZjwI1y/gGz7PjEOQ7yX40mI9Lf
	5
X-Google-Smtp-Source: AGHT+IGGg+Jnk/GvwJ2iRhPlKJw4uBuOh7zIhmlaDi27jsz4kkej9PkfmZAsHH58LiHmlVBZopFv8Q==
X-Received: by 2002:a17:902:d2c1:b0:1fa:3a30:dc8b with SMTP id d9443c01a7336-1fb370162f3mr20546095ad.3.1720096068129;
        Thu, 04 Jul 2024 05:27:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/21] pcmanfm: Disable incompatible-pointer-types warning as error
Date: Thu,  4 Jul 2024 05:27:07 -0700
Message-Id: <e439d630b7d574ba49e0dc88a06639b0d5498704.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201556

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af1290104b58693df69457454ac2a0d35a7e8c60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 0c5ed5e55e..fc913c86b3 100644
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
2.34.1


