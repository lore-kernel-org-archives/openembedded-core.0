Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEACAC54E68
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:48 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.10091.1710251627738046158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZTklFFF9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dd6198c4e2so39193965ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251627; x=1710856427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/faRK0MODddGJuZtRg2ee9uB4RqEhiZpOXdKMTjo50=;
        b=ZTklFFF9pEzUJz7Z0N1nMN+b/oye8zLVIsr1TnN93Ma3Dnv8xjSwqhoFmoAgLs3oPf
         Kuj6DnvLZ3bWQseqCurfbxvfeB1/fqjWlAirpS91MMaDrGT3fHNvd59EBkouYJrB/W2O
         yLZ8jQellyOmdOmL4peIFvpKEUTBY7JnMWFDU3dxec1vtFTfrFWQKu3vC+iu4M5BtS3B
         fgRwZC64HRzlZVL+pCVVyNspR6Y/p89A59KpuDmEt19JQt21xSiBIki3+k/iD7Ro4qpc
         Kgf/CXXabDtaBKB81aQCuaYdwIJfkFoHZWw15S+8dFT99vpOSkNxxUI7+6k8jxMUzgYN
         SCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251627; x=1710856427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/faRK0MODddGJuZtRg2ee9uB4RqEhiZpOXdKMTjo50=;
        b=K5pUXE64vgZjuAJb//PMZYsPjpBEFCf9WGaxSHsQinPGO0a0Y0IeOXJ8DqYCw9O7WI
         jAre6CblKRNHwxv7VrKylbLahsU3swV2ng+uMMQjl5yIlML7TIML+6lUV/wzdznZIJOW
         ZJs44RT9L4kLpxuqqy/Umiv65TXCw36nL1Rvx/fijUtDQm+mH0c0QENy1ISlXBfSMHC+
         DSoEEnHUj9QqXoc7ZFKB+MyEpbjXVbi75qdf+3MJal8lLWbxaJAJIygeMfkfx9Yz1pP3
         9TeQLTeHPJKoe22oLzG1K5ZZtII8wTmU2/w/leP6JoEfkpmci0KzY1MaHhxHbn33vByh
         GIQg==
X-Gm-Message-State: AOJu0Yw7dg/RE2rFlu/5Vf2Caoq4dUbPlJpl2ioiZHiBOudzsNOv8KJ5
	M2AEFET5d0dKMSd9CNbodZxGTQWCNDw/PjYvU6+oLUWVcJqdbL2nK2S19qdvEOymbDXnGdQmLL1
	GK/g=
X-Google-Smtp-Source: AGHT+IGf3x/Fl9MDCwovHZo2TCy8mqEjapz9qjopWlysi1nHLS4R6UY5/VYnIPeia4o8GAyA+perqQ==
X-Received: by 2002:a17:902:e806:b0:1dd:96e5:d22b with SMTP id u6-20020a170902e80600b001dd96e5d22bmr6675211plg.49.1710251627037;
        Tue, 12 Mar 2024 06:53:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] librsvg: Fix do_package_qa error for librsvg
Date: Tue, 12 Mar 2024 03:53:23 -1000
Message-Id: <8829495c716d48bae47b5f738abb3c85ad3f21b1.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710251458.git.steve@sakoman.com>
References: <cover.1710251458.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196990

From: Nikhil R <nikhilar2410@gmail.com>

When using meta-rust layer for rust below
do_package_qa error in librsvg is observed

Fix the below error:
ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.52.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
index b79e95a04f..21f502444b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
@@ -73,3 +73,5 @@ FILES:librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
 RRECOMMENDS:librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.34.1


