Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5EDC27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.9098.1718111270273992007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DvkYW4n1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c2e0ca8f90so2486596a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111269; x=1718716069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js/ma3FMcyRBVK9vlxQIBsiHAANEkueZyL6SudyOc8Y=;
        b=DvkYW4n1BYCtJ16hw3tf9vVvSmfeTjhHy4X6QYN2hJf2Nq3dqWj7YDieeyd+2R1QUn
         obcCqrTQi5vYtANP/oiaFUMAfKLkQ2GT3nKGNShFJ5eDJQL5BeHchAIi2RS35ZhvSQkC
         06zQbSsC6VMAo1CyZAFDdiPJN/2y787V9tNd84oOZotX5VLF3q2sN6BC9mztITdYbrEq
         yTUQSGpbkHz7V6oczDuqvPgj0SVc5CYcbnavHHx2kOVdDNzULdPIg9D3KhOv31SyeoEo
         K8N7PvMf53fobqcrIV4yqZLQHywj2Vt0p1xQ5mH8cVG+DrlSPzl8rEkbPURDGsWZmRJ3
         2LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111269; x=1718716069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js/ma3FMcyRBVK9vlxQIBsiHAANEkueZyL6SudyOc8Y=;
        b=Hw8deR7HcdxL3K2+RrC9c0tutFAbOr+OII2IzjTadnxjXV0X7xfWDDjvKTe1H6MAeP
         BVjkxymTMttfTNOXF6/z9JhGKShruIq57+RJl9Y/cSeFkBuiqlhPZq55z6m4KDWgc0DA
         FgTVhh3hGeLq1Tc9ccgsz5RI1rOzFVsiLcUlgGphVlp29MfMdmBnsRJKBo78PZLN6eYh
         AAfFers151sa/u1XbRZvasXNHcCEAWEZ3lArIDWeyaDzPiElhg7Pe80yzEz3NSPdzd0C
         /0pKjzcdVoVIiQlbOVOYOD2BfWLIBBMss5/yVtWASSmXWgOTzumgR2ap3/2dP8vEr+MI
         mhRw==
X-Gm-Message-State: AOJu0YzhjpXGLVNyQCgv5tAPVEBSdnms27nMIk8w9daqmdTXsC1OwSup
	2q7i/F3f+AVewvMkW6q7t+5J+l7Tr4+RZVgMQnDvRpIkdS3Kdg4BUi8sXPxcoUwHuYefA+iCBh3
	Y
X-Google-Smtp-Source: AGHT+IGMcES44SbjMc8zc2U2L8QL6N8qnkYdMTpDIXAv/Ei2wBjp+jYwBcTJm3Rt7Rs8dg/eLrXPPw==
X-Received: by 2002:a17:90a:5381:b0:2c1:a9d5:9b58 with SMTP id 98e67ed59e1d1-2c2bcad11f0mr8646330a91.1.1718111269528;
        Tue, 11 Jun 2024 06:07:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] libgloss: Do not apply non-existent patch
Date: Tue, 11 Jun 2024 06:07:24 -0700
Message-Id: <71231580e9e5d0060a0ea41d29152d43846a00f1.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200518

From: Robert Joslyn <robert.joslyn@redrectangle.org>

When newlib and libgloss were updated to 4.3.0, SRC_URI was updated to
append a fix-rs6000-cflags.patch file when building on PowerPC, but this
file was not added to the repo.

Remove appending the missing patch.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64561d8b81233a19df5f51d26dfbcd15835bec1f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/newlib/libgloss_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/newlib/libgloss_git.bb b/meta/recipes-core/newlib/libgloss_git.bb
index 7e34e33c7a..3c97a7f296 100644
--- a/meta/recipes-core/newlib/libgloss_git.bb
+++ b/meta/recipes-core/newlib/libgloss_git.bb
@@ -6,7 +6,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/libgloss:"
 
 SRC_URI:append = " file://libgloss-build-without-nostdinc.patch"
 SRC_URI:append:powerpc = " file://fix-rs6000-crt0.patch"
-SRC_URI:append:powerpc = " file://fix-rs6000-cflags.patch"
 
 do_configure() {
 	${S}/libgloss/configure ${EXTRA_OECONF}
-- 
2.34.1


