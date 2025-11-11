Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE76CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19440.1762873136063706097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CwK0LnO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-343514c7854so959759a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873135; x=1763477935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJRqeP9i2oPT3xv7hEPgEA7CwqGRGS+Mu+lCEkhZpHs=;
        b=CwK0LnO9L+UvxuGd1GJmk3TmDxz768yImbafXLUqcrPuifE8mR9kMBn3195q9psqDB
         a6cCO1F9xAUr/qxXpl3s5Q2Cz1HqWwJM64ZX9tpaKzSissy3f0/3eAJgJsG3X2dVxMmo
         gMvEXf2fQddC9oxH7ZgO3lmFiDrbTdOx5/fVgSJPzXPb44H0OpFxtbeKa1mWxRiWqpCL
         wTrVCGVSQmwy3C/BONYCPEpsNJdLy5GhW4VUZF0B9O9DTJBwablph+5MhxJG2WWATp84
         yF0NuAz9m2U0qvuEQVYSM6nxj0T84CNd2R9nNm1RlJMypDDX8/KRIGOuDJlziwN3v2/2
         OmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873135; x=1763477935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CJRqeP9i2oPT3xv7hEPgEA7CwqGRGS+Mu+lCEkhZpHs=;
        b=QlLSdsf1zHJXKQmVk5oFxtYW2H+nq5krEE27uIyZi127NjVoDBFPNUg1zXGZyR2g+A
         59WKKCwMPy1R/od/8REWCmZglfvUGnQbJXtnWVCWuneTDOTVlKu9DVJg6C1dIMc+9UmG
         VnTD4TmlW3EGPBQHPMWGk/2B34pJFbhL7gtrsNA1MwBd7NFGhOB3HWL/Utd3t0nvsBmF
         83LASr4TnUxUnE5seSx4UDVnEsQ4bxmwfZyCeVy6xX0naOuiWXkxXVXo3wy0uXwFe52d
         F/SD5O1oNwf6pYTJ88Oz0XDdFX5x5j9E8lsoFvVfJfLaa6ELkyceMD11tWCDaprlMmpl
         8Wkg==
X-Gm-Message-State: AOJu0Yz90M1mnPqt39ZhOZfniO9WSJzyFAa6HMJiUa3Qe6KRGoGy11G3
	m72hDxBaUNyWyMpffuEC+EZS/agENX76rdI1LPCOr3sgSUVIXUu0UILWuPT0yEBPmzuQUhHi5PH
	0AQsEgFg=
X-Gm-Gg: ASbGncvWXXLafln2qbrrg/nGn1I0RHHO9tF2UWqKOPIOj6evforeV32OTv7ZrQLDuRM
	513HG4C12YuSqWvRJFUDZWNR2tamgjPdWsMpG2/wwKQyY21FCSGQ8Ew+XvV53qWephb8CN7RePP
	9HhS6PkQ3MnOIYlB6uLIZmFioYke6N8MXBx78LdHhpfOk61UNWT7RkJO3OClSitg+Rm5yyaLe7r
	Vy8FxCoXA3xwltkYkyLWgVG5cEaGZR4/FirfxdfmLfyGQE5SCLM3wqH3Kk2qCcU207wsyB+Pd9Y
	CQGns5jXzu/5MIS5ivcFr6t/cUG/DDo2adkX/Z0AdAOf/6g6lTSdb6S7FSyX5U7nX6G4d8opPEy
	wZo/+3ChDW+8qfZPKS5SU+gJgkDj5LxD1l08//SI87beqY0EynTOiyxgaHlc37Hiufpu/Om3ka7
	LT0A==
X-Google-Smtp-Source: AGHT+IEN8/Nf2RcsW0sxLW5QqcfmtuxQiB/hVCCXlH4res9QdYhvgROK/DLM3inwHGSBLuPG+9IjhA==
X-Received: by 2002:a17:90b:4c8b:b0:343:85eb:4fc7 with SMTP id 98e67ed59e1d1-343bf0bbc72mr4290315a91.6.1762873135285;
        Tue, 11 Nov 2025 06:58:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/19] go: fix CVE-2025-61724
Date: Tue, 11 Nov 2025 06:58:16 -0800
Message-ID: <512c36af3b9d344606b2ebf54bc2f99b88dfea63.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226173

From: Archana Polampalli <archana.polampalli@windriver.com>

The Reader.ReadResponse function constructs a response string through
repeated string concatenation of lines. When the number of lines in a
response is large, this can cause excessive CPU consumption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-61724.patch                | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61724.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 9996cfb870..825b8f4d68 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -27,6 +27,7 @@ SRC_URI += "\
     file://CVE-2025-58189.patch \
     file://CVE-2025-47912.patch \
     file://CVE-2025-61723.patch \
+    file://CVE-2025-61724.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61724.patch b/meta/recipes-devtools/go/go/CVE-2025-61724.patch
new file mode 100644
index 0000000000..a91c24508e
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61724.patch
@@ -0,0 +1,75 @@
+From a402f4ad285514f5f3db90516d72047d591b307a Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 30 Sep 2025 15:11:16 -0700
+Subject: [PATCH] net/textproto: avoid quadratic complexity in
+ Reader.ReadResponse
+
+Reader.ReadResponse constructed a response string from repeated
+string concatenation, permitting a malicious sender to cause excessive
+memory allocation and CPU consumption by sending a response consisting
+of many short lines.
+
+Use a strings.Builder to construct the string instead.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes CVE-2025-61724
+For #75716
+Fixes #75717
+
+Change-Id: I1a98ce85a21b830cb25799f9ac9333a67400d736
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2940
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2980
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709837
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-61724
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/a402f4ad285514f5f3db90516d72047d591b307a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/net/textproto/reader.go | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 7930211..0027efe 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -283,8 +283,10 @@ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err err
+ //
+ // An expectCode <= 0 disables the check of the status code.
+ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error) {
+-	code, continued, message, err := r.readCodeLine(expectCode)
++	code, continued, first, err := r.readCodeLine(expectCode)
+	multi := continued
++	var messageBuilder strings.Builder
++	messageBuilder.WriteString(first)
+	for continued {
+		line, err := r.ReadLine()
+		if err != nil {
+@@ -295,12 +297,15 @@ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err err
+		var moreMessage string
+		code2, continued, moreMessage, err = parseCodeLine(line, 0)
+		if err != nil || code2 != code {
+-			message += "\n" + strings.TrimRight(line, "\r\n")
++			messageBuilder.WriteByte('\n')
++			messageBuilder.WriteString(strings.TrimRight(line, "\r\n"))
+			continued = true
+			continue
+		}
+-		message += "\n" + moreMessage
++		messageBuilder.WriteByte('\n')
++		messageBuilder.WriteString(moreMessage)
+	}
++	message = messageBuilder.String()
+	if err != nil && multi && message != "" {
+		// replace one line error message with all lines (full message)
+		err = &Error{code, message}
+--
+2.40.0
-- 
2.43.0


