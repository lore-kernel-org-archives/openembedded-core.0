Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA24CE7A95
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:05:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.56864.1695629100135755391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OeUQRjmo;
 spf=pass (domain: baylibre.com, ip: 209.85.128.45, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-405361bb93bso55225665e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695629098; x=1696233898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHTP2xUV0AoiWxyMWH18f9u1yEcIKbYCSeqDXUokSwM=;
        b=OeUQRjmoIP2DVAycRRMf++H2Gdn3je/nqpD0G0UyaETzHb+DU3df7QC2DOD7tIImXs
         VxHzUcQ27M2cpV6j4YhwreH9zVN9XbdmSzt31EN7Ia5tyeT6BTKXPl9gzTn45dZu8mUp
         8zLopa4pQae/duSvLectKUfeGtcAMBx4VmSL9nCCX0fi2sRudmXA0sl/Jbr/t0vs1l23
         nx4TQbv71vrqffnUWnrObr2I4PfFlH8Oe4ViJtTGMB1hiB6HNs/VRqoCa5fJSR78UCZY
         x5n7MTgWRrNqzkd0WpQHTW1DLyMUlvc5PBotxOZp3Yg56zbIIgi1oBaxdPvaduKRwnQe
         V2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695629098; x=1696233898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHTP2xUV0AoiWxyMWH18f9u1yEcIKbYCSeqDXUokSwM=;
        b=RJE5N6qAfpL6FDtVlJpznLGD5V79oanWm69VN6QppR1iL5OQRnbkRQGaBwAVmY0SDC
         18Pph6z2tsiL7V5QUuY8BTwMf5yBNVfOFQEPUNb0xJzJqvinEu0F+GogNX30eKNzQrX8
         GqyWSHiHjjDYLHoSkg4mvY+I345EgNsY4MCwg8OIxw4wtbwrDGiyPa6HwMIlTK9EO26N
         wZ/VSfaZyDis3ZYlTZdH6r1kLpRM5EnKanQkxLq8RDYOroKblAd/b9wBghXe9hS/puIe
         itKfwe84ju656IxtYlb05tge580cXox91/p5FOom50dGQCUiU+bEFFxPAv3uhLiW7Q5O
         me1w==
X-Gm-Message-State: AOJu0YwVptTNvvbUTyE2rqJpkxQrk6aYZGrLqXuLjPkIqH007bU7ugfJ
	6dYHYt2A5ZgguzPPNsD0ni48e4Z41ambbTmkhEU=
X-Google-Smtp-Source: AGHT+IHYyMnxmHhtwVukKGm6cWuC517ULfu6E2wMQUUNXECGJQ2xLFR9pDT3Gl/QPQkqf59R23JqwA==
X-Received: by 2002:a05:600c:861b:b0:405:95c3:e79d with SMTP id ha27-20020a05600c861b00b0040595c3e79dmr379387wmb.40.1695629098415;
        Mon, 25 Sep 2023 01:04:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm3196950wmb.17.2023.09.25.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:04:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 3/5] sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
Date: Mon, 25 Sep 2023 10:04:50 +0200
Message-ID: <20230925080452.803540-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925080452.803540-1-jstephan@baylibre.com>
References: <20230925080452.803540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188177

as of now, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK can take 2 values: "warn" and
"error", displaying respectively a warning or a fatal error message
only when a task is locked and the task signature is different from
the locked one.

The "info" level is introduced to add a "note" message to remind the
user that a recipe is locked even if the signature is equivalent to the
locked one.

The "warn" and "error" level display the warn/error message for each
task having a mismatch of the signature. Doing this with the "info"
level would result in very verbose output if there are several tasks
locked, so the info level will only print once the list of recipes that
have locked signature.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/sstatesig.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd4502..5bf1697e727 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -104,6 +104,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.lockedhashfn = {}
         self.machine = data.getVar("MACHINE")
         self.mismatch_msgs = []
+        self.mismatch_number = 0
+        self.lockedsigs_msgs = ""
         self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
@@ -187,6 +189,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                 #bb.warn("Using %s %s %s" % (recipename, task, h))
 
                 if h != h_locked and h_locked != unihash:
+                    self.mismatch_number += 1
                     self.mismatch_msgs.append('The %s:%s sig is computed to be %s, but the sig is locked to %s in %s'
                                           % (recipename, task, h, h_locked, var))
 
@@ -267,6 +270,15 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         warn_msgs = []
         error_msgs = []
         sstate_missing_msgs = []
+        info_msgs = None
+
+        if self.lockedsigs:
+            if len(self.lockedsigs) > 10:
+                self.lockedsigs_msgs = "There are %s recipes with locked tasks (%s task(s) have non matching signature)" % (len(self.lockedsigs), self.mismatch_number)
+            else:
+                self.lockedsigs_msgs = "The following recipes have locked tasks:"
+                for pn in self.lockedsigs:
+                    self.lockedsigs_msgs += " %s" % (pn)
 
         for tid in sq_data['hash']:
             if tid not in found:
@@ -279,7 +291,9 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                                                % (pn, taskname, sq_data['hash'][tid]))
 
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK")
-        if checklevel == 'warn':
+        if checklevel == 'info':
+            info_msgs = self.lockedsigs_msgs
+        if checklevel == 'warn' or checklevel == 'info':
             warn_msgs += self.mismatch_msgs
         elif checklevel == 'error':
             error_msgs += self.mismatch_msgs
@@ -290,6 +304,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         elif checklevel == 'error':
             error_msgs += sstate_missing_msgs
 
+        if info_msgs:
+            bb.note(info_msgs)
         if warn_msgs:
             bb.warn("\n".join(warn_msgs))
         if error_msgs:
-- 
2.41.0


