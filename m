Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B588CA0EDD
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.25452.1694526832353687783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3KkuqsXJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bc0d39b52cso41827765ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526831; x=1695131631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+OqtOQFHLuwY2cIM/AEo00//oe/5PUK0JH8ZHhC3wI=;
        b=3KkuqsXJvG9JRBRlXXG4lisqTYyJ60RFlmO1AGbz/Q5wnZr5c4hfVdzaut9jSkIc9o
         Yv+7uJmdF1YSassSYVldWNbO2pYgcmxWkGLBO6zI/sA96z8y/R7Zin4jOMBExmqsMtlZ
         ymUxsFVaGUqLlyN2qj9o0IthbUkGzTrOC1br5f1iatR2rNvF4Ajbbmv4+7GREtU30kra
         KzUBc9F/tl9NxY3xTl2mLR74E5REFAfxok5/Naa5HOiCkrTieLJX5mkfgfy4u3elZGhj
         aZYl+beBPoLcr7BdFFNe/WBYF8B4itfzPFDiSnz3YiLbMRC99Tb/BX7hrY8Vw9hjYMqU
         BDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526831; x=1695131631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+OqtOQFHLuwY2cIM/AEo00//oe/5PUK0JH8ZHhC3wI=;
        b=Hw6xerHcv/Bq+5b6vlrf0q4iZfTk+35ZE11MqsAiMl8Qi5s5XIhqwED9aguwkRKou+
         I/aI+yfuc/A20W3Z98dC6OzW55ZVNsOU0grekd7pqJgxg400F4To92idBaV7IVNzV9yp
         xrzsi+vPSy+bAvK1NlOUqigMSguw0NAjBXSAb3H4XRFbJx1do4COJ9eIQonym3NUD5pW
         EVgrZiZr1n8dUIestWZoklrlH1GixYOHK8a0dgCQneY90Mwidz8cWRLcZ7giqoEk2T3h
         H7K4EUBvx1D5Ldrg2Ew6/qrZ9LzD/Cjgm6CSmJ3QM1DGJIAjC7ePNpXWeAEJ/9BP/d47
         4x3g==
X-Gm-Message-State: AOJu0Yyl2abwdjb3tHyykoCtR9tYAOQCW0JQ6iUCD01KmABQiQsu1+Rz
	obXiUDw7SRAiwkExkxPcujDwWZwODKrH4x1fa00=
X-Google-Smtp-Source: AGHT+IG06OStX9iIA65zagNfNp7g9qNLQX6WS2O9b/gvb/mROxobSdt8d/wvQMJn1HfKa+eBWF29Dw==
X-Received: by 2002:a17:902:d501:b0:1c3:bc7b:8805 with SMTP id b1-20020a170902d50100b001c3bc7b8805mr5457697plg.52.1694526831404;
        Tue, 12 Sep 2023 06:53:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] kernel: Fix path comparison in kernel staging dir symlinking
Date: Tue, 12 Sep 2023 03:53:17 -1000
Message-Id: <27a982807caa7ffbdf2d4ef02bc0b037150b1b3b.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187523

From: Staffan Rydén <staffan.ryden@axis.com>

Due to an oversight in the do_symlink_kernsrc function, the path
comparison between "S" and "STAGING_KERNEL_DIR" is broken. The code
obtains both variables, but modifies the local copy of "S" before
comparing them, causing the comparison to always return false.

This can cause the build to fail when the EXTERNALSRC flag is enabled,
since the code will try to create a symlink even if one already exists.

This patch resolves the issue by comparing the variables before they are
modified.

Signed-off-by: Staffan Rydén <staffan.ryden@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit afd2038ef8a66a5e6433be31a14e1eb0d9f9a1d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5d8b3b062a..ba5b6cf384 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -143,13 +143,14 @@ do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILD
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 python do_symlink_kernsrc () {
     s = d.getVar("S")
-    if s[-1] == '/':
-        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
-        s=s[:-1]
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
+        if s[-1] == '/':
+            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
+            # directory name and fail
+            s = s[:-1]
         if d.getVar("EXTERNALSRC"):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
-- 
2.34.1


