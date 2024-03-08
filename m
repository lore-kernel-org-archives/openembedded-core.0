Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCB8C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:02:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.14156.1709874149572843937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WliVhNlY;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29bb557cb05so49762a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 21:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709874148; x=1710478948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udZbOD8KqlisCRDiaRMr1gjp+Z2kqgNbnnobnHEfmaY=;
        b=WliVhNlYFvkdNFkM5qkPui1onvO0AYy95QrjwHC5y8wgktlzxdsQFyX3KP1auGL6uj
         OjoXY/8d3KsrY5EowmxwkPavYL0yi8lkQ4EPZr9kKnE1DzA7HmANdHD70rXc0EUIISua
         7TmrXzN+RHAuJwEyhQ3cd5RFZCXAFKnaSZmi8p3A1zfegN2XOXJeDJeTk99QH5hxBpcn
         VGqN0nqnTNnuCf7tRyOBmr/0fgAQuim9wysoI6ksF0jNM4hxNTXV3hiVtXdxjYkX+6CT
         kz18jzSSVnVohWc1CIs7y/bo9+3HyDIHnFJ78JXBmoG6zKLa7oIWQRoxMvxH30AFp+6V
         fTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709874148; x=1710478948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udZbOD8KqlisCRDiaRMr1gjp+Z2kqgNbnnobnHEfmaY=;
        b=AbYXtaje8Hxat/fKvSXk/jIt9GPdZOGYAOmIxa36NrLwjPYcseRQ/U7h1pN89QePL3
         HLMRB81KLZ90DR3xVBJyaq0RAqJtCgcJJeKeWZa6Kp2l7XjmLzZj012wmCi36ja6yr5h
         OjmPyJqQrItrnrCrYPjgnRzjOZQDecc2wly7ZnQz0Dnh/gjW8Tsju/qIZJIsl+uG8b1R
         N1/X74mWETQiVr3RrjrRbzpsHiEdDFeuYQ0GofxpOJjOw0TX5C84Cb0Cd8dCO0+032V8
         TskDSZSYawpqqpjpbNtNNHcTpwZDKe7SnM/XHw+ZXEXC+2kYkcJuzXdkwuOoeRfNncqj
         6SYw==
X-Gm-Message-State: AOJu0YzqhWfvYdTQkX8jjywNj7ElHoPe0IXOZ83SGAnlGkt5tmwaz/v6
	OBepkSZ2rkjk6mmZ1f9xnrc7/c6hlWzi1donKBCqCIyPv/MrN194vrZqgx8OtQ==
X-Google-Smtp-Source: AGHT+IH4sZmZzo0+sNoFMeMBM6qiBNFjDBisSlff78Wddkev1fBzbeZba542IJULuChI2+/madSpew==
X-Received: by 2002:a17:90a:c404:b0:29b:2779:2a69 with SMTP id i4-20020a17090ac40400b0029b27792a69mr18227546pjt.36.1709874148082;
        Thu, 07 Mar 2024 21:02:28 -0800 (PST)
Received: from localhost.localdomain ([103.146.224.223])
        by smtp.gmail.com with ESMTPSA id gz8-20020a17090b0ec800b0029baf24ee51sm441597pjb.48.2024.03.07.21.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:02:27 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][kirkstone][PATCH v2] librsvg: Fix do_package_qa error for librsvg
Date: Fri,  8 Mar 2024 10:32:21 +0530
Message-Id: <20240308050221.32931-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 05:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196845

When using meta-rust layer for rust below
do_package_qa error in librsvg is observed

Fix the below error:
ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
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
2.25.1


