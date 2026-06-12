Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66488CD98DB
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71896.1781274412938399772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rqs5579N;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4602e2a0372so797628f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274411; x=1781879211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM88nTCaEEH/SjpA203cRsZ/dy04dnI6IYh3PQI6Bk0=;
        b=rqs5579NsZNUmo8YtmhYsq0EQ5yxYC4Jxk5WyuKyU/XDBZkCK53tdRAnJnViSVJYu2
         2gwjOXEuMhbES/xCQBS5ZKyoIx24OnLuQnpJfOdCjmVEPXP9TpX7jAy4KhKNTJPe+yi2
         0yKZ+u2mgYCQbGuG0o7hsCJBzgBK+5J2CLxyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274411; x=1781879211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JM88nTCaEEH/SjpA203cRsZ/dy04dnI6IYh3PQI6Bk0=;
        b=hOysumRE4DSRfl91qHa/FIHvPv+PeZUD8Ix8PlrPc4aprZuDH1/WlEDEkGet2AGu6l
         Qw7pQLQcxOQ6EIIkDRNpYm3GhZzM3lw7zKGgYYU3LoC+EHaUrvfAU6+of0MRbonNDr/n
         +i0uinmo5PQqJXzW5qGnXsrYFJG178mJ/D0TNO/EyFsXx+6r8JIcBUx4xCYtpFVyterW
         LFog8w6DcQ/8MntaGjNWmRwWZRNTN6Jyrz5UrmzwT5mD8Yvkz0Jz+tVbjrDIK6C3zBF5
         LFsEAR/Il9cpuGZSky2HDvqb2FgVqE180HsXwg9kLJcTO7j+GEVKK3k7R4kmMz/XTaWo
         hxGA==
X-Gm-Message-State: AOJu0YzjlGGNHqYJA5Ifk1rj7kwUoIYzn5UH4tHYv4HV7AyWE4Ww3iok
	tY3paqx4k6DDK9LvWCsVsTB/erOgs83S0GWOfYMuNqhsvXtNOD0UEeWdtXic/4R9eZArDv1DWrH
	U7WvEkw==
X-Gm-Gg: Acq92OFmUhZIPt0Xr8Jms5XQEnYOP9mojNIXIfEVPWAyU1QwgJAm3SvrpBpk2kfXY7T
	4qySOF86GDVEdP9DI4jRBHE+HZ0TpR+Ai1trpZZ5IFOXZxu77lcDlvQMDpK+NtMVclSfXkKoamU
	skodCMtfQZ1uY9ZY4XiNMB9cQQMO945AvcU4yDjEdxsTMvSyGlJ7heO+z9ROtDpZTOizC02evFo
	tRKPhDE4eyU8eIHy8DzntRacg586WTxSfSXkh18+wfoW+QzLnXH4Unl6UNfNxJ6w9KRLP6jTxpM
	OeUE8gIJLuUUCDXMcpBd2959SnwVGK/EohLii1NQC5EGS5SK2KhMSllwNvaqfRNw6SYzFJeZpwo
	ArosT+J8FRqhpVo5mAZNPHMxz1tvcF87BquJdT5gFpVQbeSydcBvuZSSdc8QDT/c2nuAvKcNEqh
	+MX62IsFSuh3uXhYYy+dXcGnY=
X-Received: by 2002:a05:6000:2384:b0:45d:7bf0:c7d3 with SMTP id ffacd0b85a97d-4606dba9c0bmr4729371f8f.19.1781274411042;
        Fri, 12 Jun 2026 07:26:51 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:50 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 19/21] go: patch CVE-2026-42504
Date: Fri, 12 Jun 2026 16:26:09 +0200
Message-ID: <9af7a3c0808380058979b6cf0a3c62395ecff396.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238641

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/774481

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-42504.patch                | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42504.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 03a1a81fc3..ba4fe9a734 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -53,6 +53,7 @@ SRC_URI += "\
     file://CVE-2026-39826.patch \
     file://CVE-2026-42499.patch \
     file://CVE-2026-42501.patch \
+    file://CVE-2026-42504.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42504.patch b/meta/recipes-devtools/go/go/CVE-2026-42504.patch
new file mode 100644
index 0000000000..1ae104ae19
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42504.patch
@@ -0,0 +1,58 @@
+From 41ca50d68cd74e0a68f3917cd902885c84fedbf7 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 5 May 2026 15:20:34 -0700
+Subject: [PATCH] mime: avoid quadratic complexity in WordDecoder.DecodeHeader
+
+When encountering an undecodable encoded-word,
+skip over the entire word rather than just the initial "=?".
+
+Fixes #79217
+Fixes CVE-2026-42504
+
+Change-Id: I28605faa235459d2ba71bd0f3ae3dce96a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/774481
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-42504
+Upstream-Status: Backport [https://github.com/golang/go/commit/f230dd8a1d0a63d73e92685e378dcd725f7aac00]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/mime/encodedword.go      | 4 ++--
+ src/mime/encodedword_test.go | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/mime/encodedword.go b/src/mime/encodedword.go
+index e6b470b1fb..a7059f3bc4 100644
+--- a/src/mime/encodedword.go
++++ b/src/mime/encodedword.go
+@@ -275,8 +275,8 @@ func (d *WordDecoder) DecodeHeader(header string) (string, error) {
+ 		content, err := decode(encoding, text)
+ 		if err != nil {
+ 			betweenWords = false
+-			buf.WriteString(header[:start+2])
+-			header = header[start+2:]
++			buf.WriteString(header[:end])
++			header = header[end:]
+ 			continue
+ 		}
+ 
+diff --git a/src/mime/encodedword_test.go b/src/mime/encodedword_test.go
+index 2a98794380..befc3cd996 100644
+--- a/src/mime/encodedword_test.go
++++ b/src/mime/encodedword_test.go
+@@ -140,6 +140,10 @@ func TestDecodeHeader(t *testing.T) {
+ 		{"=?ISO-8859-1?Q?a?=  =?ISO-8859-1?Q?b?=", "ab"},
+ 		{"=?ISO-8859-1?Q?a?= \r\n\t =?ISO-8859-1?Q?b?=", "ab"},
+ 		{"=?ISO-8859-1?Q?a_b?=", "a b"},
++		// Undecodable words
++		{"=?UTF-8?b?garbage?= =?UTF-8?b?QW5kcsOp?= =?UTF-8?b?garbage?=", "=?UTF-8?b?garbage?= André =?UTF-8?b?garbage?="},
++		{"=?UTF-8?b?QW5kcsOp", "=?UTF-8?b?QW5kcsOp"},
++		{"=?UTF-8?x?y?=?UTF-8?x?y=?", "=?UTF-8?x?y?=?UTF-8?x?y=?"},
+ 	}
+ 
+ 	for _, test := range tests {
+-- 
+2.43.0
+
-- 
2.53.0


