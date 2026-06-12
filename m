Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5ACCD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71824.1781274407489246200
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PI9leKNj;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019edc13dso550238f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274406; x=1781879206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeaPPdgV6Q82LRcqIiBFfUvWPRD9SHi5T/JOzDVqCO4=;
        b=PI9leKNjfsAP54bWVpqux1ENnlOS1j/OFy6UZaTvx5xKO3fG7EncE99km539cq5iC9
         Tc4tAza1h7zWWrt81eVZLKMg8zJaQNs3W8ZJAC4wO7r0w2Kz12C2+VWfW0uaJaZdi2y0
         6fPq+yKfnBb3zJLvAR1+gLMl+NSIfnyjqEf8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274406; x=1781879206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeaPPdgV6Q82LRcqIiBFfUvWPRD9SHi5T/JOzDVqCO4=;
        b=FXM/Z9SQicR4XlDgiArywHoGLpoW5i7nMzZP7jg2SFQRrq/QegqpJGFyTPnxiIuP1D
         ArfRqDHbAWVXLEcrgGjYAUwg6f3D7kvo+sIUuJUahtDSxj414LSluTCTz1Wk7803a+M3
         l9rvZ/V4xhi1TktpeN0QRWCEUUB52BQPUUGUAfMM9xQmNr3C8D45EGwowqoRVYBXGVsd
         M/RaaRXUiuz1emmiRjtryr03MjI1PDMf0gBNMH9UutEpqqUAHS+WIE/+H04ZZ1lPpNjv
         Wc7ay48gvC96qc7Od9HU+UPy7EM4zuLIQCQ8ppScCulflIMR28ouWAElyLdSi3eXoNFn
         LANw==
X-Gm-Message-State: AOJu0YwcWbkmH5lEyaplonLZXT9i4Se2OV/6Vs/PP/mgKt9M6f0P516v
	f37UkRHl5JX8jXmQfFNq9XiX/qIYVOkyTPB2UNaDLvhvrPY6V4zbfYE6wMaxhl/Sd5msIw4wdKG
	tfu+oPA==
X-Gm-Gg: Acq92OHT9v1AFVHa40Emn2zLFgm24RxjveoIKdTyEXUKPsEb9jPumQPYoHgIu7M0Ysy
	89U8T60/0FGqeG/ttNzdSUSGgMG4wbd5a3jLm3WozLRbiguQimowaAZ9eDChqWYB0CuFcUDQDOG
	WMPHEF2+TprjdCrd2/Z82Q12ey7SM2fk3MbpqGi0ohDh85nHgHtY3XLjuCrt9vuye9EHUWAlNi6
	7sH+oZNPuSDjpsBvoXkp+Snb3kXcz/I5y6WVUnUqoAA1L7xoKEaNe4RGOEL2LRAumI0S9BY7A4B
	/KyiZkZHGjHf+nOyndCSFKm9PXoTCxmKbEwv+pfZGOqZXVyHy+Z3Zv9+i2v7xqoQyIJgAFOxSIf
	o7QUJGU1zsOGjFYO/JsM0KHx0RFwnrsJWcX7PQ3l6AhZohYn27/hOAZngEXU72yOhqYAA9sTA7T
	nU7DEwh1o0UhT24GDnzNc6tUk=
X-Received: by 2002:a05:6000:40ca:b0:460:2d57:fcf2 with SMTP id ffacd0b85a97d-4606db9fd61mr5050162f8f.10.1781274405790;
        Fri, 12 Jun 2026 07:26:45 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:45 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 12/21] go: patch CVE-2026-39817
Date: Fri, 12 Jun 2026 16:26:02 +0200
Message-ID: <4b5d86a7c28fae1b4fb35c0076888e93f8d6ea42.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238634

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] mentionned in [2]

[1] https://go.dev/cl/767520

[2] https://security-tracker.debian.org/tracker/CVE-2026-39817

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39817.patch                | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39817.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 9a7695e754..f06b974e04 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -46,6 +46,7 @@ SRC_URI += "\
     file://CVE-2026-32283.patch \
     file://CVE-2026-32289.patch \
     file://CVE-2026-33811.patch \
+    file://CVE-2026-39817.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39817.patch b/meta/recipes-devtools/go/go/CVE-2026-39817.patch
new file mode 100644
index 0000000000..103fbedb7a
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39817.patch
@@ -0,0 +1,105 @@
+From 7d35508ad684c808ec11fb6ef3ab27f9258a9418 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 15 Apr 2026 16:27:23 -0400
+Subject: [PATCH] cmd/pack: refuse to extract files with directory components
+
+Do not write to /etc/passwd when running "go tool pack x evil.a"
+on an archive containing a file named /etc/passwd.
+
+Fixes #78778
+
+Change-Id: I4cf69b81af62321ffbb41ace679672a86a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/767520
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-39817
+Upstream-Status: Backport [https://github.com/golang/go/commit/7409ada33f99c0d74db2b0389c51a15de116e48d]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/pack/pack.go      |  5 +++++
+ src/cmd/pack/pack_test.go | 44 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+)
+
+diff --git a/src/cmd/pack/pack.go b/src/cmd/pack/pack.go
+index 412ea36d60..2fe0258f01 100644
+--- a/src/cmd/pack/pack.go
++++ b/src/cmd/pack/pack.go
+@@ -135,6 +135,11 @@ func openArchive(name string, mode int, files []string) *Archive {
+ 	if err != nil {
+ 		log.Fatal(err)
+ 	}
++	for _, f := range a.Entries {
++		if !filepath.IsLocal(f.Name) || filepath.Base(f.Name) != f.Name {
++			log.Fatalf("%q: invalid name", f.Name)
++		}
++	}
+ 	return &Archive{
+ 		a:        a,
+ 		files:    files,
+diff --git a/src/cmd/pack/pack_test.go b/src/cmd/pack/pack_test.go
+index c3a63424dd..c4a8c78cbf 100644
+--- a/src/cmd/pack/pack_test.go
++++ b/src/cmd/pack/pack_test.go
+@@ -6,6 +6,7 @@ package main
+ 
+ import (
+ 	"bufio"
++	"bytes"
+ 	"cmd/internal/archive"
+ 	"fmt"
+ 	"internal/testenv"
+@@ -409,6 +410,49 @@ func TestRWithNonexistentFile(t *testing.T) {
+ 	run(packPath(t), "r", "p.a", "p.o") // should succeed
+ }
+ 
++func TestOutputPathSanitization(t *testing.T) {
++	dir := t.TempDir()
++
++	// Create pack.a containing a file named "longpathname".
++	// Note that "go tool pack" requires that all files be at least 8 bytes long.
++	const validPathName = "longpathname"
++	if err := os.WriteFile(dir+"/"+validPathName, make([]byte, 8), 0o666); err != nil {
++		t.Fatal(err)
++	}
++	doRun(t, dir, packPath(t), "grc", "pack.a", validPathName)
++
++	// Create evil.a from pack.a, replacing "longpathname" with "out/pathname".
++	b, err := os.ReadFile(dir + "/pack.a")
++	if err != nil {
++		t.Fatal(err)
++	}
++	idx := bytes.Index(b, []byte(validPathName))
++	if idx < 0 {
++		t.Fatalf("%v not found in pack.a", validPathName)
++	}
++	copy(b[idx:], "out/")
++	os.WriteFile(dir+"/evil.a", b, 0o666)
++
++	// Extract evil.a. It should fail and not extract a file to /out.
++	os.Mkdir(dir+"/out", 0o777)
++
++	cmd := testenv.Command(t, packPath(t), "x", "evil.a")
++	cmd.Dir = dir
++	_, err = cmd.CombinedOutput()
++	if err == nil {
++		t.Errorf("pack x evil.a: unexpected success")
++	}
++
++	ents, err := os.ReadDir(dir + "/out")
++	if err != nil {
++		t.Error(err)
++	}
++	for _, e := range ents {
++		t.Errorf("unexpected file in /out: %q", e.Name())
++	}
++
++}
++
+ // doRun runs a program in a directory and returns the output.
+ func doRun(t *testing.T, dir string, args ...string) string {
+ 	cmd := testenv.Command(t, args[0], args[1:]...)
+-- 
+2.43.0
+
-- 
2.53.0


