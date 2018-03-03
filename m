Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 917727886B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:34:49 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id i6-v6so7394475plt.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 08:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RAiH6v3v+zGduW77SbnqsoUrUX8nKXRdewWi7y6t0gI=;
	b=OdwRVuunUxendPaC4E/RenbZ0tuAuHFntI3YaF+Xr+fAOug+4Jrz87oE+BBD6xsgih
	EXSCjloZcwzaJivqfdwf/k2Ajb+vueZ5hYXx7hdFsSAmTDH6BCguc9QPxUr9/YWEs+iK
	Ky3kZQWA3Eos/qohwlZ7Lg5WuEzUYsWR4meR1TshKDMk5tAmwAW7+qu8ocqm7loa+07q
	R6mIRv5kaPCMINbTioWF0afyMDFz5Em4XbRHTAuRWPdoAwRwVRyz+yPR/1mveYzTqk7C
	xnuljBaUwWabgeXjef025K/V2xujE4+Lwc+FSVYxQSBGSs+QeCqrrUrct0uZ1m0qclZa
	BJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RAiH6v3v+zGduW77SbnqsoUrUX8nKXRdewWi7y6t0gI=;
	b=tDJ8TUW5VsGAstKWauQbguD4eU+BfaPR6xleaSbmfqdvaoAbdd1hpxXB/9ST0E2e/F
	XPBzcz3mviG7/VohGNttrExxg6H/QXLAQcxsCl6QcQyw4XnZ+Q/+YE/0HTdsDBQgeRxd
	aeVBEAywJxgJ41o2o5jfyNZaOYuk6XtAFEwkOknTnX8ELebt5SuSoRWUzLaB0Qx22fDD
	qIA3x72KTTQaBmJjrkS/DwC24YTE3YLxKrTN6LQYmqLlsEHck7YAIzk9S1sQQN5FMx/j
	7IDe3gZ5c1M1N9uCP6YXn+D/PwIw1eJQaaaGT++pAC/odQUo8YULSyTvHGBI3kzabtRW
	mFzw==
X-Gm-Message-State: APf1xPANHseLpiucA/hiOOKqWwD1mOJ8ZpEEpIR3IEOAxu/wYU6M0ykP
	khly8KQ/x3B+6B9ZiSAwXWgQ8Q==
X-Google-Smtp-Source: AG47ELtPBqJPGK6JNw6ere1XpYFKnT0VhR/9mMPM/8s+T7ozFAsVknRvcY5OAmhAR0Kd2cxjAeflRw==
X-Received: by 2002:a17:902:be02:: with SMTP id
	r2-v6mr8551291pls.234.1520094890397; 
	Sat, 03 Mar 2018 08:34:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a6sm17276352pfi.22.2018.03.03.08.34.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 08:34:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 08:34:36 -0800
Message-Id: <20180303163437.8684-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 1/2] go: Fix for panic: branch too far on arm64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 16:34:49 -0000

see https://github.com/golang/go/issues/23889

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.10.inc               |  1 +
 .../arm64-fix-branch-too-far-with-TBZ.patch        | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.10/arm64-fix-branch-too-far-with-TBZ.patch

diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
index 3a93773e2a..8c70de934e 100644
--- a/meta/recipes-devtools/go/go-1.10.inc
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -13,6 +13,7 @@ SRC_URI += "\
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://arm64-fix-branch-too-far-with-TBZ.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0008-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.10/arm64-fix-branch-too-far-with-TBZ.patch b/meta/recipes-devtools/go/go-1.10/arm64-fix-branch-too-far-with-TBZ.patch
new file mode 100644
index 0000000000..9378ede132
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/arm64-fix-branch-too-far-with-TBZ.patch
@@ -0,0 +1,50 @@
+From 0893ca552f7dddba10d8209bd28c69f86fcd791c Mon Sep 17 00:00:00 2001
+From: Cherry Zhang <cherryyz@google.com>
+Date: Sat, 17 Feb 2018 10:31:39 -0500
+Subject: [PATCH] cmd/internal/obj/arm64: fix branch-too-far with TBZ like instructions
+
+The compiler now emits TBZ like instructions, but the assembler's
+too-far-branch patch code didn't include that case. Add it.
+
+Fixes #23889.
+
+Change-Id: Ib75f9250c660b9fb652835fbc83263a5d5073dc5
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+diff --git a/src/cmd/internal/obj/arm64/asm7.go b/src/cmd/internal/obj/arm64/asm7.go
+index 423f55f..38f1d24 100644
+--- a/src/cmd/internal/obj/arm64/asm7.go
++++ b/src/cmd/internal/obj/arm64/asm7.go
+@@ -723,9 +723,16 @@
+ 			o = c.oplook(p)
+ 
+ 			/* very large branches */
+-			if (o.type_ == 7 || o.type_ == 39) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like
++			if (o.type_ == 7 || o.type_ == 39 || o.type_ == 40) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like, 40: TBZ and like
+ 				otxt := p.Pcond.Pc - pc
+-				if otxt <= -(1<<18)+10 || otxt >= (1<<18)-10 {
++				var toofar bool
++				switch o.type_ {
++				case 7, 39: // branch instruction encodes 19 bits
++					toofar = otxt <= -(1<<20)+10 || otxt >= (1<<20)-10
++				case 40: // branch instruction encodes 14 bits
++					toofar = otxt <= -(1<<15)+10 || otxt >= (1<<15)-10
++				}
++				if toofar {
+ 					q := c.newprog()
+ 					q.Link = p.Link
+ 					p.Link = q
+diff --git a/src/cmd/internal/obj/arm64/asm_test.go b/src/cmd/internal/obj/arm64/asm_test.go
+index 369c48f..3e0c9c1 100644
+--- a/src/cmd/internal/obj/arm64/asm_test.go
++++ b/src/cmd/internal/obj/arm64/asm_test.go
+@@ -52,6 +52,7 @@
+ // gen generates a very large program, with a very far conditional branch.
+ func gen(buf *bytes.Buffer) {
+ 	fmt.Fprintln(buf, "TEXT f(SB),0,$0-0")
++	fmt.Fprintln(buf, "TBZ $5, R0, label")
+ 	fmt.Fprintln(buf, "CBZ R0, label")
+ 	fmt.Fprintln(buf, "BEQ label")
+ 	for i := 0; i < 1<<19; i++ {
-- 
2.16.2


