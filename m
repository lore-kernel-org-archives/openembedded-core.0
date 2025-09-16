Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC38CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:18:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.21514.1758032278104564666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Iywsd9G1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7725fb32e1bso5651500b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758032277; x=1758637077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhS8mHT0/K1yfaeW2jctprcIrv5buZOU1UlBvD4F7Nw=;
        b=Iywsd9G15S8BCa1D0pyJTRs+BgTGLIjLM3/2f3Svj5thR8xTmwONTwNpMIz5Fw8V/w
         qVOqGOmBGlEuNud4ZH2wJGRUu+8qFwFhV1uiCCPrCImyWU9y9KLrCL7aD46QyDUqrSB4
         a+cNxALjojm6b2JgGlAea/+Mis+E9ZOblwhXRey77sKyC0gSJWxYbyzqKWEiZ7cTvYBv
         TIdX5InRoNpIBQ24Uzjuy1Mr9kUNKDg5Euha4A9yq6MiTjz8054/NKJWJ4/XzQMUvtkI
         e/1GgUPrtscvhKD1P/kQfo+UuFey/0I/QgTErqB6h5ord7R0nJjEwJ4dqDPVBYt1DaId
         Q26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032277; x=1758637077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhS8mHT0/K1yfaeW2jctprcIrv5buZOU1UlBvD4F7Nw=;
        b=mlyJYHXGjb6W0oe7tRLubPB/YP/6MuDF9wDZDGeQQMJ90h++872UlkN+AoQn0zF1ml
         V8v2p4qx3O5ImkZsWZYkarUpuuYRHR4BD7izqeEAzaYS8KcMNQABCu/wbq7KVPRezY8I
         72nyHYwauvIoMrmbEH13wZ14l3ZA/1M8WR790srFbs9+ZW27WI45Rmcxl6olJ+Av359o
         Hlb0CkLojAZAK+VslPZDz0DZNfHzVU5O21tkmUD4IcQsay+kai2afFTX9G6W9XCJWeDS
         0sHepJf9dKvtOrpPX+Rdzv6mflmp2wf8MR1QXr86rjWUiOO5fi2kozMr6nzOxgTYRlPV
         JWxg==
X-Gm-Message-State: AOJu0YxEoxVL8BnSfbD2UdD0vzInxKRFww8zlCZNkCIgPydDLsNfiNE2
	MUgAEP3UrZsaBK7PbSXLs5m4O/ctaOzy25Wmn1SfUumbz4LpNhErFnOqTuSPgt4/uzGC9QUS6Jg
	NJFE1
X-Gm-Gg: ASbGncvNhDmbjBArfHUhrtNbABPLfKz2S5j/hngjw595jT/MDXRwHOCrI60aWfHrfM/
	5VqYoLLgd0rNQrG+rOMhNVB+4tHFLVz6lfUnSyj0au3uUvtkfnbqjX7SprUy3/3UpyYeRF7yhzh
	XiA2CDtphGjnvUEPcS3VK6ZQqqlmWX/jEy2sDQDuRQAXkJf06R9yJS3sQ1tBt6F4Qu1eW3yBAU1
	tHJnetNKoMhKEX2GUygSzsA5QmnWP1rpG2kRFuf/kvmOkxmEc1BwXZH7D0P8eL86o3Ejbv+IqJQ
	Q+IANZ6qasnNcYQP4hBuQUFSf6PLEcRlE686g4RIqrAPBVevPUTuBvKkAB/oEQIQ9QJpUi6xe5K
	fzqVBLquJNuAT4VFffdOGRp3i
X-Google-Smtp-Source: AGHT+IHqzg6lUXM+uTe7mmJ85woPqd9hUELB0f0B1rtubCTuoo7k+ofxQZthYWNsvqRIEcDrzta76g==
X-Received: by 2002:a05:6a20:9145:b0:24d:9042:c82f with SMTP id adf61e73a8af0-2602aa809a3mr22216760637.27.1758032277246;
        Tue, 16 Sep 2025 07:17:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a7d1:d8f6:b364:5fab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa47c0sm14534083a12.53.2025.09.16.07.17.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:17:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/3] insane: Improve patch warning/error handling
Date: Tue, 16 Sep 2025 07:17:47 -0700
Message-ID: <4899961965d70281e63582234f0ed299431eff32.1758032126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758032126.git.steve@sakoman.com>
References: <cover.1758032126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223557

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, whilst patch errors or warnings are shown, the errors don't stop builds.
The configuration isn't very configurable from WARN_QA and ERROR_QA either.

This patch:
 * Uses the standard mechanisms to handle the patch fuzz warnings/errors
 * Makes Upstream-Status checking configurable from WARN/ERROR_QA
 * Allows that checking to be used with non-core layers
 * Makes patch-fuzz an error by default

(From OE-Core rev: 76a685bfcf927593eac67157762a53259089ea8a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c3fd6a65e8103f74ae382d196d486b31a168b39)

The backported commit was modified to not mark "patch-fuzz" as an error
by default (which retains compatibility with kirkstone behaviour).

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f4b4c05e3d..99340c1752 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1182,24 +1182,27 @@ python do_qa_patch() {
             msg += "    devtool modify %s\n" % d.getVar('PN')
             msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
             msg += "Don't forget to review changes done by devtool!\n"
-            if bb.utils.filter('ERROR_QA', 'patch-fuzz', d):
-                bb.error(msg)
-            elif bb.utils.filter('WARN_QA', 'patch-fuzz', d):
-                bb.warn(msg)
-            msg = "Patch log indicates that patches do not apply cleanly."
+            msg += "\nPatch log indicates that patches do not apply cleanly."
             oe.qa.handle_error("patch-fuzz", msg, d)
 
     # Check if the patch contains a correctly formatted and spelled Upstream-Status
     import re
     from oe import patch
 
+    allpatches = False
+    if bb.utils.filter('ERROR_QA', 'patch-status-noncore', d) or bb.utils.filter('WARN_QA', 'patch-status-noncore', d):
+        allpatches = True
+
     coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
+       patchtype = "patch-status-core"
        if not os.path.abspath(fullpath).startswith(coremeta_path):
-           continue
+           patchtype = "patch-status-noncore"
+           if not allpatches:
+               continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
@@ -1212,9 +1215,13 @@ python do_qa_patch() {
 
            if not match_strict:
                if match_kinda:
-                   bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
+                   msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
+                   oe.qa.handle_error(patchtype, msg, d)
                else:
-                   bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
+                   msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
+                   oe.qa.handle_error(patchtype, msg, d)
+
+    oe.qa.exit_if_errors(d)
 }
 
 python do_qa_configure() {
-- 
2.43.0


