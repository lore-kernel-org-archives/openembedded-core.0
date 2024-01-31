Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648CCC4828E
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:39:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12873.1706704768970386443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M21AZiQX;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40eacb4bfa0so52232275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706704767; x=1707309567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLQMCs1ZetI3OguaqrNJCbkxa3dflVXmcMdDNOHosVE=;
        b=M21AZiQXUuNTDUEI9vSfodM/wDaLfuP+dXkYYgQR5mydhMUryyRdT1ruNFgPd6++Cv
         L5smRwOUFMKfrC7goJXtzQcH1ynqtx9TFvaU/bDbNoy26LOrflIHAjpUHjI74EqS3b40
         ZGG9k6uea2s4m5EVK9SwpXeWdZn9CVHYoSHxLAK74AVM+tl859MChrPpe4G1G7iPc3di
         NZ3tfXeaO6JubDy8tdcCxTgvb7IrxSChKX2RE1IaT1PgPcactgXsUFssgE7vuEiBI0BX
         czfxi3ldVKSdD6xY1q4nEd1NxL5q9bxqBThYPGqOcHimRhiiiMoxpJ9z430waTzrk8k3
         oUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704767; x=1707309567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLQMCs1ZetI3OguaqrNJCbkxa3dflVXmcMdDNOHosVE=;
        b=kkIzKmMr18d7BdBmTt1fiDcmbwn+6oILjDOUXS9BLgn7D53duqg9wqsh8ybp5piLk1
         ma7GjVlZWYvXsF2G0QS8yZKmQZsehxSFyK4lkdo8TCAf/CKWXIUrOg0HfzVHez78C2+i
         qebZf14L5hpIax08h/CaejK7XLK/cG7whhmmSxUHztNbUWU0UyX76UK6YWitwnfUyUyM
         TJw7fr2CaJtfCptW66eIg3GiNCc5YMTzygFeOUJl5MQdmlfX6qtdKWu6u4v5pysODymC
         +WyuZj1ak6x5CmKYgTmT3RertUsfTUW6wilA4CuRrRDuEGezOBom7GsmCYQ0Ud+TUp92
         HJ+w==
X-Gm-Message-State: AOJu0YzY2LGWFBW2nAMQbuHUShi1D5iFCuOS9ane6k7WSrKbtaWD2UMn
	MiNMs0nsn3AtrFNs42ZhjVyFDphlm8wGUkVK9UpQl2INu0WQXka+G2hhiR28
X-Google-Smtp-Source: AGHT+IFLi8zaeIk5S3+H6zXiJ8HFQCAnkuEavRPMSEmTCHBwYaYSuI3YXWh5zJ72gHic8G8hxzsXaQ==
X-Received: by 2002:a05:600c:511e:b0:40f:b5d2:1b17 with SMTP id o30-20020a05600c511e00b0040fb5d21b17mr788355wms.12.1706704767469;
        Wed, 31 Jan 2024 04:39:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033ae593e830sm10898058wrb.23.2024.01.31.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:39:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] scripts/oe-setup-builddir: add support for configuration descriptions
Date: Wed, 31 Jan 2024 13:39:06 +0100
Message-Id: <20240131123908.1098544-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131123908.1098544-1-alex@linutronix.de>
References: <20240131123908.1098544-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194521

They are handled exactly same as conf-notes.txt.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 678aeac4be5..1b5dc55743e 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -57,6 +57,7 @@ if [ -n "$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECOREDESCRCONF="$TEMPLATECONF/conf-description.txt"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
@@ -98,6 +99,13 @@ EOM
     SHOWYPDOC=yes
 fi
 
+if [ -z "$OECOREDESCRCONF" ]; then
+    OECOREDESCRCONF="$OEROOT/meta/conf/templates/default/conf-description.txt"
+fi
+if [ ! -r "$BUILDDIR/conf/conf-description.txt" ]; then
+    [ ! -r "$OECOREDESCRCONF" ] || cp "$OECOREDESCRCONF" "$BUILDDIR/conf/conf-description.txt"
+fi
+
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/templates/default/conf-notes.txt"
 fi
@@ -108,6 +116,7 @@ fi
 # Prevent disturbing a new GIT clone in same console
 unset OECORELOCALCONF
 unset OECORELAYERCONF
+unset OECOREDESCRCONF
 unset OECORENOTESCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
@@ -124,6 +133,7 @@ EOM
 #    unset SHOWYPDOC
 fi
 
+[ ! -r "$BUILDDIR/conf/conf-description.txt" ] || cat "$BUILDDIR/conf/conf-description.txt"
 [ ! -r "$BUILDDIR/conf/conf-notes.txt" ] || cat "$BUILDDIR/conf/conf-notes.txt"
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-- 
2.39.2


