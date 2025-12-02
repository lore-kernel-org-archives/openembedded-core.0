Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4722D11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:10:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9923.1764688199604400918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=si7myve5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4720978b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688199; x=1765292999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pR+tOxR9Seg/opEM/qlPdmKbj0O/E6so1B/TfnmI48=;
        b=si7myve5nyPT5YY+4d4d4/KLLVQHOlBdWUfEtUeOPRmbAO+aM1imFGgIOJhrqWolil
         WoN/XQYceuYLT3MNCMWdrHHDQY6x1X4d9E88sQASMf8Czdhfn9mAx1HZAZFrcxW3nw2g
         LF46H0BlpG61ruJpxAaUaXrQ77ergdJX+wTh7gctM91k1HnoSxd9zEfhJePef64DFVHQ
         Mci+Rhv8svIDusqfqEex/C/fplvicDI+V7HKehLnz43+kvvqaoHGA4lVnENQeDBwzWdF
         JUMSlnivjm8+gmtNHKTaXYi16sbdTQE0RG5S8uknVf4z3UJEzppmqQ89YBk+XS/16WLo
         +Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688199; x=1765292999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8pR+tOxR9Seg/opEM/qlPdmKbj0O/E6so1B/TfnmI48=;
        b=iEvqE70TgCN13Cz42e6lHwKu441DSC2vjeLpVLdcm2tx2JptMDn0ji3RKui6w8iKRr
         UOmx2ml+tVmgDI7EszRck56MGs47dJnVw7teICaemReYCevty/3iIR6GHZeFk7JiFw8k
         ePsJQsJa/CW1mHL7pHtso7DU4R1YGQK/k+wkdfVW1icxrlXCJVRxVViYMqfqZxx0kJ9j
         ytq5NQB6w2O06AOpbAjsI0K2mJKnyv/FXt6fY/v2nGifK0vPC702myXfH8n1F2okOd9b
         Iock+rSW7xASNdsnwbAdcPSmt/ujw6KTzLYxMmVNFaQfcCj/4hocDgbNdZvspZqEQnO0
         3kOg==
X-Gm-Message-State: AOJu0YwNfSUhj61ZgsLrK5rR1IVZvRsLBjA5EPstuNYTZpqIVrPSbFtM
	VNVoX/zRh1SDmD9kwli6UtpI3dmno1Lw2a70H5f8VgM6PKnl1QGC+GDCrR7mDCyi794HUh/eaRY
	7k0Xt
X-Gm-Gg: ASbGnct/jGg0Q2q4smxro0Ec68v8jIU87skLNziN0bGOsK/tJQZzQWmw7G38Yeqyy1m
	2std7/mtUdz9mMbPOgnXXpQw4yrT9hJSYgN+6BQWJLvUgPO0WV8e0cvsv/Q/LhV7ku5VrS6fGXS
	ZjrxQ8pg+Vu5EAP11FVK4UtzYNEig/b6w+HlFcXMJRkAxiXGdFuIiEy2e5VW2JQZnfuMmaIbh8v
	EsEEwc/grKcphXr8TVLzPWfft4dBNHhLTcp8f7J81/jlYUGtw+Vj1301EHAhnwfZTR7CKyGTjlg
	d/8czPbYIzWPnQyS9j97XsvV8mwoukOfRVwP9nXeysXglSk6+G+IXUpatbHCyoFdY92loJRLJnF
	w7IgNRBH9vE5ItrxiZ+4b1A4/jGZ5WAnmfv+MqIqUw5RUMD96Uqb1vyPev8wSL83AWFtphSI5eR
	Qhng==
X-Google-Smtp-Source: AGHT+IG+K3ht3O61koIU732cvtjuOG8LBFv2c/euCHSc/kameZ2CeYc4PawJUOcNZ7u4BenBapJB1g==
X-Received: by 2002:a05:6a00:853:b0:7b8:9da6:146c with SMTP id d2e1a72fcca58-7ca88e8dfb5mr31868470b3a.4.1764688198514;
        Tue, 02 Dec 2025 07:09:58 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] go: fix CVE-2025-61724
Date: Tue,  2 Dec 2025 07:09:32 -0800
Message-ID: <188dbac037809d6e8f0e1667f563fea997ea04b8.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227168

From: Archana Polampalli <archana.polampalli@windriver.com>

The Reader.ReadResponse function constructs a response string through repeated
string concatenation of lines. When the number of lines in a response is large,
this can cause excessive CPU consumption.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2025-61724.patch           | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b621fb189c..bb5e839950 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -72,6 +72,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-58187.patch \
            file://CVE-2025-58189.patch \
            file://CVE-2025-61723.patch \
+           file://CVE-2025-61724.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch
new file mode 100644
index 0000000000..8c63022909
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch
@@ -0,0 +1,74 @@
+From a402f4ad285514f5f3db90516d72047d591b307a Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 30 Sep 2025 15:11:16 -0700
+Subject: [PATCH] net/textproto: avoid quadratic complexity in
+ Reader.ReadResponse Reader.ReadResponse constructed a response string from
+ repeated string concatenation, permitting a malicious sender to cause
+ excessive memory allocation and CPU consumption by sending a response
+ consisting of many short lines.
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
+index 3ac4d4d..a996257 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -288,8 +288,10 @@ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err err
+ // An expectCode <= 0 disables the check of the status code.
+ //
+ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error) {
+-	code, continued, message, err := r.readCodeLine(expectCode)
++	code, continued, first, err := r.readCodeLine(expectCode)
+ 	multi := continued
++	var messageBuilder strings.Builder
++	messageBuilder.WriteString(first)
+ 	for continued {
+ 		line, err := r.ReadLine()
+ 		if err != nil {
+@@ -300,12 +302,15 @@ func (r *Reader) ReadResponse(expectCode int) (code int, message string, err err
+ 		var moreMessage string
+ 		code2, continued, moreMessage, err = parseCodeLine(line, 0)
+ 		if err != nil || code2 != code {
+-			message += "\n" + strings.TrimRight(line, "\r\n")
++			messageBuilder.WriteByte('\n')
++			messageBuilder.WriteString(strings.TrimRight(line, "\r\n"))
+ 			continued = true
+ 			continue
+ 		}
+-		message += "\n" + moreMessage
++		messageBuilder.WriteByte('\n')
++		messageBuilder.WriteString(moreMessage)
+ 	}
++	message = messageBuilder.String()
+ 	if err != nil && multi && message != "" {
+ 		// replace one line error message with all lines (full message)
+ 		err = &Error{code, message}
+-- 
+2.40.0
+
-- 
2.43.0


