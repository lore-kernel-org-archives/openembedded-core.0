Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34229C38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8897.1720096063823148255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BJm16uM8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f9fb3ca81bso3452105ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096063; x=1720700863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzQtVmdFKmD7PsTnhZ+6IrDMGahG11B5B7Ir+zi9B2Y=;
        b=BJm16uM8qF32Q4PFh6ho+TWv6TcwmMVaYhuGK7CRhNnY1trzcoR3EmVuu03hT6OEvC
         ImTapy5llyV3d9HzfmQpz/SaQo5gGbTHep2ZrfzTEU0yazR/aDUi/vFo60ivUTEeOWce
         fsvDqzrzTKLYk5OybRp7PdGM8gTKZCamnrZPFsHtDEs6yaNhowx6dqZpUThv/Rr42uVo
         pYenVPOHd31vdL9C5JK0UlxtohduLk5yPQkuS0qxDSgFoFL34CMNptmPKUhA0QP81giH
         h26yUURx4kKMXqUAKqeEZsgOFPhUtkHm6ubo+Hf1jx8tkFQKeJXmnb43bex3aBbhqYRn
         9hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096063; x=1720700863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzQtVmdFKmD7PsTnhZ+6IrDMGahG11B5B7Ir+zi9B2Y=;
        b=xIP3TDSJOdVuM+zFEzsUrXsvX7uyujuo6kU3VGxVj3TybtpHnCr7FAWnQ8QhLX1cL0
         8BBCGqVNgfT0TkBGdWJhRSe9Ude+Bt4vjIPZmSQe+neAuJ5dHfrpn5+K0ra4OC1LYooZ
         HkcUh9Fh4Tz5GR5fiteX+TR6CyCnN8+r8gts70G2UFSAqNiv9D5Gjh6fCa8NZ4CnyNej
         Jf9mHOluVWCiY2y41mM6woCNbxAcPsTj/pFzDFS2jFYILNvSg7ZtVu9SYjKe6WALX6aS
         R+p82gFXh3PaASCZUkxIKdqY2uTwSxFGExUzF6YS6P2+OcM8yf0ZNZ35+E5PnXLVEpZn
         fIdg==
X-Gm-Message-State: AOJu0Ywreya7UFCst/r5JeHPkzQ23g+qEibwCSYGxKCcIO108G5/tg6j
	0XFMfw1G00rCQSWt8/31FG78sl4X9dBtJrrwTnsFTgi7uTUaDcd56Ps7H3pQ/FYiXbegtSwkNrX
	8
X-Google-Smtp-Source: AGHT+IE2nNdWlylWBl7CuD8N5uhAVB8cGwcMShPLScqwzah1GOdfMMsoiUi3LejJ2ExkknpMlolAyA==
X-Received: by 2002:a17:902:c403:b0:1f8:67e4:397f with SMTP id d9443c01a7336-1fb33df6110mr11912355ad.7.1720096063091;
        Thu, 04 Jul 2024 05:27:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/21] python3-setuptools: drop python3-2to3 from RDEPENDS
Date: Thu,  4 Jul 2024 05:27:04 -0700
Message-Id: <0d5cd1d867a826cf83fcaee3e8390b9defec47d1.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201554

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

2to3 module was dropped as a dependency in setuptools 58.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-setuptools_69.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 77d4e0aa03..67475b68eb 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -16,7 +16,6 @@ SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\
-    python3-2to3 \
     python3-compile \
     python3-compression \
     python3-ctypes \
-- 
2.34.1


