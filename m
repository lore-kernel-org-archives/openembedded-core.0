Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046B1C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.11125.1751377109278028759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BuZ7aDYC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5632737b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377108; x=1751981908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLpFczgN2jYS8ZQSS7XhA+YuHRw8pUKb66dc7ZdivyQ=;
        b=BuZ7aDYCIwazwH4XSdWsgaS9UrJYUxWYKezUXFGr9tnJo5XWsl1lDHRram77zis9FE
         m+qghouabDh0Q9iaxg419K3qHTCEzkPmndH70uLpEyYJTdZphuLwKq8RyKgZ4RlGupAL
         Fil1jp0G2gQfOR+Ma9yd8Wu5pNzAYWPKPWUA6RrEy3c30QTsbKzpIDQ4sXz5D6t8kYge
         8eIv/YozeB5u2YFC4QnJ8b4GSZqUZeWpNvvArAgmC3i0oGLvVXKHIg4WYUu9oheDZ2sh
         V7Z+adcKMDYgWTezTu/fWbvMGffGqITZrBwlSorppiiP0RNYRzcRu+pbwZ+5XcbNlLr9
         IaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377108; x=1751981908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLpFczgN2jYS8ZQSS7XhA+YuHRw8pUKb66dc7ZdivyQ=;
        b=XwjzNxZZzcJ1izGLPlGE1wabDhcxX4aI+LqPcR6SZ7h9Fhc4HfNc8AIVQ+1eoWaZYd
         C6S+o3xw6hE4Tf2dyQtkHnCYJtb/dP4ERR7m/nkf2RCs+qqETRrQkDxIw/DrzvGUdVJT
         mHQy4TaGAbLd3ai4onsfGrq7TjOAqkLw37ZRYFjTxILQXQCCTwQwS9hOtQwaA9pZ1Ffv
         asWkUxvHdq0kJyrCVadgmvicx3V//zyE7Uugnq9XNWDXML5VbBkilm/OY4RLgJgWdL+u
         LFQouejIYd/v3/LajXKeRs1/WbKsL9lTz/QabSBwIt7UL8Tpe4+7oWz1hdu15YOis53/
         poQQ==
X-Gm-Message-State: AOJu0Yw/Iy5u0bZ7JW5XFNjBCMYfCmspcA2R4zbkxSDHGN1lYxrjxbyL
	4YL2V/dHMc1Ymoz1Em6l1LoadKKJlItBva7v+Oh5gzysWqJ99RSNNav4fOrSWzQE2/WatA95215
	CVTEw
X-Gm-Gg: ASbGncstpNN/qSVpDsdzGtVmmcqu9rT0kRZhe5l76mYV3iNupMgSXrQwceQRFd9SM8o
	52jqMOtUCekRutBo4O++wgJ2dQX8aUdmGZq1DEjaw/W8Ojedohlf4sRxfnzMMCUvvLxJsBmnTUv
	j2O8rzUrNZn/EYbubXcLlji5uO33U1P2TjUg73ervy81MA8WK3CNRl0bu6AJy3eIyfJx5Z0Ep71
	PTV0kxUr8r8LbnSyYGpv1/wuK6v45LMQj3HlOpPSQ7V8ntCtKViS9y6VmYbrzHlT/oG5Sk3HnM/
	zjn2MQT1Y+2L41IiHyoaJtbw3Wm1wFLXqlMaeix7JK2b4BVq7JDLDA==
X-Google-Smtp-Source: AGHT+IEHyMlZSA/+1iftBrV+w9BuZFNk9LocwdLpnPaWhMdIv/RAVlfXYZTG4Kk/cTDyNuQ6wMemSQ==
X-Received: by 2002:a17:90b:2585:b0:313:d346:f347 with SMTP id 98e67ed59e1d1-318c9307ea0mr24699343a91.35.1751377108159;
        Tue, 01 Jul 2025 06:38:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/11] sstate: apply proper umask when fetching from SSTATE_MIRROR
Date: Tue,  1 Jul 2025 06:38:06 -0700
Message-ID: <e56aa6c62e41667d0eeec5a862b7004d21b4da48.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219579

From: Rasmus Villemoes <ravi@prevas.dk>

Currently, files and directories created under ${SSTATE_DIR} when
fetching from an sstate mirror are not created with group write,
unlike when the sstate artifacts are generated locally. That's
inconsistent, and problematic when the local sstate dir is shared
among multiple users.

Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
move the mkdir of SSTATE_DIR inside that.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6038553aaef3b88b834a09018c524c4fa41e625)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2c259a6657..b98fbba982 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -726,7 +726,6 @@ def pstaging_fetch(sstatefetch, d):
     localdata = bb.data.createCopy(d)
 
     dldir = localdata.expand("${SSTATE_DIR}")
-    bb.utils.mkdirhier(dldir)
 
     localdata.delVar('MIRRORS')
     localdata.setVar('FILESPATH', dldir)
@@ -746,16 +745,19 @@ def pstaging_fetch(sstatefetch, d):
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
         uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
-    for srcuri in uris:
-        localdata.delVar('SRC_URI')
-        localdata.setVar('SRC_URI', srcuri)
-        try:
-            fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-            fetcher.checkstatus()
-            fetcher.download()
+    with bb.utils.umask(0o002):
+        bb.utils.mkdirhier(dldir)
 
-        except bb.fetch2.BBFetchException:
-            pass
+        for srcuri in uris:
+            localdata.delVar('SRC_URI')
+            localdata.setVar('SRC_URI', srcuri)
+            try:
+                fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+                fetcher.checkstatus()
+                fetcher.download()
+
+            except bb.fetch2.BBFetchException:
+                pass
 
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
-- 
2.43.0


