Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8202BE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:30 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.91805.1734468927883110204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vDLRL6uI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-728f28744c5so5364544b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468927; x=1735073727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zI3+eTbEVDAgCfm5eO4/6Ei6247N9xzFs6dU5gxOS2E=;
        b=vDLRL6uIi11aMMv20/sFDe1dbKbNwzMBPvERz7P+c9AwfCa9nWojNVmiaWfv1QIGqi
         emaU/Fk8DakFnBmE4MU4L3X0H5E46XoC4yjCCDSpPiQ2/blApTQDx1oyT/+oGCbFTMj3
         Wf6bQqCEnPuf1w6hwtx/oH2w+0EhLIVUE73g96SRq06sgnmNBYhBVaBxAEoRZw+409n2
         4Yy9/HsF9ETC5KTo6aqdFq4iFdw+if8bzIpBHNeqBXvyi8GIwgw+WrJad6X2ljUZD/KP
         XbSEG5jqbdLOSL/5o147HctbzCW3r8Xv2DehDUDzqmnu9xafzV+M9WkJVVrSZIQMB/2t
         ipHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468927; x=1735073727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zI3+eTbEVDAgCfm5eO4/6Ei6247N9xzFs6dU5gxOS2E=;
        b=txg5RV6MbxtOCacQo2vEMZwpdeVjd3TbcYVy/SBj7e2Q7VPqYaFjbcwqne2EUzuIZ0
         g4YUqRdj7ubqZfpv8uAQrmwFz91E7kdlWQVZ9L9oQPZEKsrELBNUv9DHCiom6kqp8Biw
         sjxyppMURG/a/ajpxIX7ZuUrsUF+2mZYlTXWLY3aH5A+TmuVIlb8Lz/plSk+2MhPhRwj
         W3TLwDW0in/lytboTPybV0DmWOFv/Z1puYJrIeYsCwEofHm1/X1/OdDbgbYOWBysyil9
         xjn7PtyM6jgr7e8dfr1nXo23ZzfZ1h6/48PC3TcI6BoiP4lmWkTIoe8ad2pYOU/Apr8H
         VWpw==
X-Gm-Message-State: AOJu0YwaraRFUB6n0JxunbPDSbKg5KRoIJFfmSngPA5HyPGtEY1wQTqQ
	poa2ruKzguNSmjcbZDgKTBJOfFzGezWYe0g8seroZS9JMcDjwCduRJUeckky3bjiwipTF4xxrDz
	m
X-Gm-Gg: ASbGncvbC5+IssGxIby9mtpwGYptxPWB1iEzMQYEZsQpIx1PYSGN1Jwon2i3up7ksmF
	L7s3EqGhxmEgVeC8JMIRlAZqgHfmHF+Hb/ZxSlpQ5TSzy7742cIJ35BKc9yWNqG1GMQVkiXQdnk
	cx6BqkEcStx5k/JCccftHckgdMVREvx8VX0bAnvdrH6msnBdhgFoCsXMR2YyaMpSQicYGyuypzF
	mNnMCjs/6p0bWkALDFLBANcEvbVKY4zXjrGTr602D+TTg==
X-Google-Smtp-Source: AGHT+IE353cUW/m3woC4CPr3sAXOat7sBZWS9STdr8+whBr3qEvEfS5qwJP9+8oy6BsPgCYnflPilQ==
X-Received: by 2002:a05:6a00:8008:b0:726:41e:b310 with SMTP id d2e1a72fcca58-72a8d24a875mr567945b3a.12.1734468927130;
        Tue, 17 Dec 2024 12:55:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] base-passwd: Update the status for two patches
Date: Tue, 17 Dec 2024 12:54:57 -0800
Message-Id: <d3cb6839a7a6ed32f33af315f36f19d7b10d5da5.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208852

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The two patches to disable use of debconf and generation of
documentation have been merged upstream.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aca8844d7c05b4ba937625e59275d3f7953d3da7)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0006-Make-it-possible-to-build-without-debconf-support.patch | 2 +-
 ...7-Make-it-possible-to-disable-the-generation-of-the-do.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
index 61ed1641a1..6e236993f5 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Make it possible to build without debconf support
 
 Not all systems have the debconfclient library available.
 
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/c72aa5dd25a952da25e307761f4526db2c8c39ec]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am     |  1 -
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
index 2bec065cdb..5c63599143 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Make it possible to disable the generation of the
 
 Not all systems have docbook and po4a available.
 
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/2a6d16e595c93084e279d0dcbef37d960b44fd1a]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am  | 2 ++
-- 
2.34.1


