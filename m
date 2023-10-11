Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64569CD98E0
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5199.1696982542597088984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e1mEdfdl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690bc3f82a7so4767993b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982542; x=1697587342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc4UKL3dzwBPOrWwWnPHnDGaZZfQt0D9yISdIPSnz8Y=;
        b=e1mEdfdlDYJcmC9U7cWSPYX3hmmc8W2wf+GWJppFNIXuaykOQS48K5hXFA51Ql0DMV
         oI04uTd/Xp6ZC8N4pm4Tkc+HGiVusqhoXW0LcfQrPsHT/lQhx8JFFyGIj9nRoGFgvRbq
         ip3IguDAQpUB7xE3HRAh0jVLy1cdXkU3GTzUXGGfzOvk9Io+WRUcutCy6WFekitmRLVj
         o92VvEe2+IkfErJkgfIql6Lc6s54rT8tbcnoR0OBLY9rwsscJowM9U9fJAI4+vY3fSWV
         kDCQHj5URAAyEhs0NrzUxDNS9MNR8K0xeuPUETTK2HnBfwXscTAQ3fr0P4uoZkgm6hPi
         e4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982542; x=1697587342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc4UKL3dzwBPOrWwWnPHnDGaZZfQt0D9yISdIPSnz8Y=;
        b=lP69QSSQ9chkpv5u8xcExpMVg1hfh9qMXEbFsBYc3g8oivdB4/LoeHsXSHH9lO11pb
         srruuZdN78YhKvoQQ1TgZptpMMWHGlLGcAV4XnJmiKZSxtODdK+SleuXrA1kzn7+izR9
         mLQ3sIgxKytJHeO/0eIzSWURpiw2E+c2h6K1m9JtM0SJQCzxWKO5rn1F58yLd2kZt3To
         39xCLGMBqmO3VYNHuQJybvGR/e0v01aY2n/1G9SgGxy/q+SPDCMRuLRIJbmZqbPPQAqf
         JbGoTQ54+srYcUEE7wbzyQHx4mAZIYJjI/ONB23J2GSSZ+lwajypSOgE2qJHJAsw5aXQ
         Fs1w==
X-Gm-Message-State: AOJu0YwXppknNt2BCFe1a3Nb3GhFrF7nSdDzxdfTIrjQt0B+yehWIbRS
	cmSUR4zuhw6VLVeRfGQ3MpklKbXpwiaRU/FDOR0=
X-Google-Smtp-Source: AGHT+IHBDxb0Ri7sy1vpoewwc9zf+Z/Fo/woH2Mp0MGzGAYk/ZgaGCCrnWqkdydVg4JFLz7m9xTLrw==
X-Received: by 2002:a05:6a21:197:b0:16b:cc6c:d728 with SMTP id le23-20020a056a21019700b0016bcc6cd728mr12972799pzb.44.1696982540892;
        Tue, 10 Oct 2023 17:02:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/20] libgudev: explicitly disable tests and vapi
Date: Tue, 10 Oct 2023 14:01:33 -1000
Message-Id: <24b711439bac3ed2c76711d2d562afae1e8eaea0.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188938

From: Ross Burton <ross.burton@arm.com>

Explicitly disable the tests and vapi support instead of relying on
defaults and missing dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 575e2e29e00bb4492e7ee7f10b753e3f17982caa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/libgudev/libgudev_237.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
index 5aa94e58f5..d3122de8a0 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -25,6 +25,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 UPSTREAM_CHECK_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgudev/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+))"
 
+EXTRA_OEMESON += "-Dtests=disabled -Dvapi=disabled"
+
 # This isn't a GNOME-style version do gnome_verdir fails. Just return the
 # version as that is how the directory is structured.
 def gnome_verdir(v):
-- 
2.34.1


