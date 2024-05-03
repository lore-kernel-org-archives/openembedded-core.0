Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE212C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:10:38 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.12190.1714741838193969231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XsYUp60v;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-69cb4a046dfso39646936d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714741837; x=1715346637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlBmKDg7Jont2O8D87JsmaK3VQSul4h2Fpa+2WqxJ7w=;
        b=XsYUp60vzboJtwjJrIg9TkJvT1GvA3DmgaLNpZa2CsMAVX9pBZ0qlPs2hQbZFXywRr
         I3AqgIENNVrBKoaZQprs1Y3PT0XsNrjswqLNdWxkVR8fwO5IGe42g8qJH2v10GazXVI8
         GnwggKbD1W6cJa1jDSsxia5EEl+Gq7yWnj3VXQ5IDJ1JjbKydSdpraAgMQhr+LMpRj0H
         wPeiXeH7rOReHH+LQUsofj/IDp5tZfwkdtkJ4U/dkr863Mm1GEbVyj3RvnWk8G2AHtDc
         yPrmveNMSMjM3uE215ZkbL3X2CLL6oZTPQJU1hhktTU9YQmLNDzTXWPlAknzrXUVKepN
         8Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741837; x=1715346637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlBmKDg7Jont2O8D87JsmaK3VQSul4h2Fpa+2WqxJ7w=;
        b=AR9oGC6YJ0UsP1hCq6co08CCjyT084uemaEMQfPC1yUxYynYGcaH8oSOVZHMCXSuyi
         R71I3H2i9oP+j9r+uXuxdoAwt4QuawGOlIzxY7xUOPwVD2HyAA/qLNKLsIoOH4AWUf3D
         jLqfcITqMjEIWKzqB0GNbbnebashabmloucMCQ5gzTf+QUhBrChaIgXblP1kbETKIzAT
         qHwKe7FWB81IBoRXiPKqTcS2+hN68q+Re6WiKIi36aclAE88sHN6aV1+RoM9HT9H/yqT
         a7gf+R4ZgZ3MvONXE/KqMMH+SM1NUwAxF+bRn32VJRaFpjWk3WTADSMuXQuTS+Kkt1K1
         4CiQ==
X-Gm-Message-State: AOJu0YxKJnj5liydSdjtlyKf860uZoiqaYNrrxrWFiUcuRtDSeLh5ysG
	ttjJYFf7yRIlQBCpLvLrQKKQ699HrrYQpreof4b3bxTQ2hY7pAeOhW++Msv2aYr8M4v890Uxgtm
	LWhY=
X-Google-Smtp-Source: AGHT+IG1/qWlJJLArfrw/8CV2AK539HpRnK1mxgUldSHGVROxmu3N3/mRuEdCeSEOq0dx6vszIEy+g==
X-Received: by 2002:a05:6214:5191:b0:6a0:cef7:c54d with SMTP id kl17-20020a056214519100b006a0cef7c54dmr2639277qvb.56.1714741836840;
        Fri, 03 May 2024 06:10:36 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id jh20-20020a0562141fd400b006a0e94eb3e9sm1193510qvb.34.2024.05.03.06.10.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:10:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] patchtest: tests: update bugzilla_entry_format.fail testfile
Date: Fri,  3 May 2024 09:10:31 -0400
Message-ID: <20240503131033.1665297-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503131033.1665297-1-tgamblin@baylibre.com>
References: <20240503131033.1665297-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198988

Update the test file to target a more stable README file.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../TestMbox.test_bugzilla_entry_format.fail  | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
index 80f409e952b..854d7eb8c7d 100644
--- a/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
+++ b/meta/lib/patchtest/selftest/files/TestMbox.test_bugzilla_entry_format.fail
@@ -1,25 +1,26 @@
-From fdfd605e565d874502522c4b70b786c8c5aa0bad Mon Sep 17 00:00:00 2001
+From f06e14633723c1e78bc7a4b0fd0d3b79d09f0c68 Mon Sep 17 00:00:00 2001
 From: name@somedomain.com <email@address.com>
-Date: Fri, 17 Feb 2017 16:29:21 -0600
-Subject: [PATCH] README: adds 'foo' to the header
+Date: Thu, 2 May 2024 10:21:45 -0400
+Subject: [PATCH] README.OE-Core.md: Add foo to header
 
-This test patch adds 'foo' to the header
+This test patch adds 'foo' to the header of README.OE-Core.md
 
 [YOCTO 1234]
 
-Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- README | 1 +
+ README.OE-Core.md | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/README b/README
-index 521916cd4f..cdf29dcea3 100644
---- a/README
-+++ b/README
+diff --git a/README.OE-Core.md b/README.OE-Core.md
+index 687c58e410c..9d863891134 100644
+--- a/README.OE-Core.md
++++ b/README.OE-Core.md
 @@ -1,3 +1,4 @@
 +**** FOO ****
  OpenEmbedded-Core
  =================
+ 
+-- 
+2.44.0
 
---
-2.11.0
-- 
2.44.0


