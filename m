Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183DC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 04:36:17 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.17805.1719376568410831461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 21:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YTHfuSYI;
 spf=pass (domain: mvista.com, ip: 209.85.128.169, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-63186c222eeso59835137b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 21:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719376567; x=1719981367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Lf6EloDn5ubV/abMFctYs3ZDq3/FSMP2hUZ3pGcFpI=;
        b=YTHfuSYI8n1RFZSb8lEHl8J0B/xaJkoZxSs5tk41dP2dBahdifjXbwscw5CFUZXgo+
         vS7WH4wCRyvCh4jaYu4wd6hTMKsWvnGKpc5oMGtvmxjyuk91DP9MLbgm5JziSAVR5Tum
         7QEBsH/7NVJBms8SP2dQwvokpLIL4XMLE/EsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719376567; x=1719981367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lf6EloDn5ubV/abMFctYs3ZDq3/FSMP2hUZ3pGcFpI=;
        b=mxykMbwMLh5I+wl45xTt/3hOlpkFfhTrOrvnycs/g+IW/EsdVWJjIu744JZeYcs7N7
         Dttnn+YE00fwpuphbRZSZPGE8nN9OLxVtQvO7TWwltScFfrmyB6Z7N5vIkNFuOtVjNI0
         wErqOw/86UlSmp8hNi+YzUZ0TmKiDMcQgDrUgiZ7mApHodUJX8A7+XhzIW6228p4PetV
         uMGpg2YTIGNizqh749ZrhOp/i8VRI52DuHTEnvsBJT+P/6f0U8HrL9/ra8x0nguvPrT6
         beilbfYGKPSR111S/xVBE4iOcUYZCuzbXTZu8o7WMzz5+Xn8qpOWlciwV9W5K1k3KG7X
         ZmPA==
X-Gm-Message-State: AOJu0YyOyw563e5ldDuujSSH8e4/EDe1yktXipoQOzrynaYeUwgk2KzF
	MFTpsoDvtcpqM7Jc4tg4/ajq59G88INiLziyCnPJFbAmXOw9nFV5zN33hnECYEVH0tDkM75j3ep
	2
X-Google-Smtp-Source: AGHT+IG0b5cl0ZtAtq2K4HjC7eW8PFmGAD/OLXD1+QB/209FXbhYMJ02qxMgfnlqWtoTUpSmIgAJhA==
X-Received: by 2002:a05:690c:98d:b0:62f:eab8:7a09 with SMTP id 00721157ae682-643acc1636fmr80662057b3.44.1719376567064;
        Tue, 25 Jun 2024 21:36:07 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f1107eac9sm36795587b3.18.2024.06.25.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:36:06 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go: fix CVE-2024-24789
Date: Wed, 26 Jun 2024 10:05:53 +0530
Message-Id: <20240626043553.41521-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 04:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201149

Upstream-Status: Backport from https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.2.inc        |  1 +
 .../go/go/CVE-2024-24789.patch                | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2024-24789.patch

diff --git a/meta/recipes-devtools/go/go-1.22.2.inc b/meta/recipes-devtools/go/go-1.22.2.inc
index b399207311..1a57a1bae6 100644
--- a/meta/recipes-devtools/go/go-1.22.2.inc
+++ b/meta/recipes-devtools/go/go-1.22.2.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://CVE-2024-24789.patch \
 "
 SRC_URI[main.sha256sum] = "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
diff --git a/meta/recipes-devtools/go/go/CVE-2024-24789.patch b/meta/recipes-devtools/go/go/CVE-2024-24789.patch
new file mode 100644
index 0000000000..684407112d
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2024-24789.patch
@@ -0,0 +1,77 @@
+From c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 14 May 2024 14:39:10 -0700
+Subject: [PATCH] [release-branch.go1.21] archive/zip: treat truncated EOCDR
+ comment as an error
+
+When scanning for an end of central directory record,
+treat an EOCDR signature with a record containing a truncated
+comment as an error. Previously, we would skip over the invalid
+record and look for another one. Other implementations do not
+do this (they either consider this a hard error, or just ignore
+the truncated comment). This parser misalignment allowed
+presenting entirely different archive contents to Go programs
+and other zip decoders.
+
+For #66869
+Fixes #67553
+
+Change-Id: I94e5cb028534bb5704588b8af27f1e22ea49c7c6
+Reviewed-on: https://go-review.googlesource.com/c/go/+/585397
+Reviewed-by: Joseph Tsai <joetsai@digital-static.net>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+(cherry picked from commit 33d725e5758bf1fea62e6c77fc70b57a828a49f5)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/588795
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc]
+CVE: CVE-2024-24789
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/archive/zip/reader.go      | 8 ++++++--
+ src/archive/zip/reader_test.go | 8 ++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
+index ff6fedf..60b34b7 100644
+--- a/src/archive/zip/reader.go
++++ b/src/archive/zip/reader.go
+@@ -699,9 +699,13 @@ func findSignatureInBlock(b []byte) int {
+ 		if b[i] == 'P' && b[i+1] == 'K' && b[i+2] == 0x05 && b[i+3] == 0x06 {
+ 			// n is length of comment
+ 			n := int(b[i+directoryEndLen-2]) | int(b[i+directoryEndLen-1])<<8
+-			if n+directoryEndLen+i <= len(b) {
+-				return i
++			if n+directoryEndLen+i > len(b) {
++				// Truncated comment.
++				// Some parsers (such as Info-ZIP) ignore the truncated comment
++				// rather than treating it as a hard error.
++				return -1
+ 			}
++			return i
+ 		}
+ 	}
+ 	return -1
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.go
+index 631515c..9a77c1a 100644
+--- a/src/archive/zip/reader_test.go
++++ b/src/archive/zip/reader_test.go
+@@ -570,6 +570,14 @@ var tests = []ZipTest{
+ 			},
+ 		},
+ 	},
++	// Issue 66869: Don't skip over an EOCDR with a truncated comment.
++	// The test file sneakily hides a second EOCDR before the first one;
++	// previously we would extract one file ("file") from this archive,
++	// while most other tools would reject the file or extract a different one ("FILE").
++	{
++		Name:  "comment-truncated.zip",
++		Error: ErrFormat,
++	},
+ }
+ 
+ func TestReader(t *testing.T) {
+-- 
+2.25.1
+
-- 
2.25.1


