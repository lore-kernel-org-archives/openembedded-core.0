Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65377C61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.10887.1700620303585371783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jq9fbST7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b2018a11efso6365570b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620302; x=1701225102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgitgLAckBmqQ+XCJ9ibuZFRBdUdF/BSG77vPBcKcMU=;
        b=Jq9fbST7J2Do/yeJtARnRlz7E0XxqAtEkVTDb0wdEumXHsMelx0gIN0DMsXZBEKPRl
         hPJLHou4B9mjAf7RON0W1dKE1vfjC9AzAhU/oPf5eSSHQdLlrg8zem3bVws2uxDREmBJ
         +foYU5m0qrc3n4IkUbbKd3+SfgloC34UzK0zp/xX1leoFvE5UUZqcXlcfkML63QarkxH
         qyw0nFoAGDQmkTDyM2KICPpj0ggCnVoIoEKpJ5wMosJSieVsisXpTsDhNHHwSx37Mi1l
         EOF+oBK1/D8BKDDcj5YTRQnzXpiTnIQcU5c3qIW3bLI611s+Q57CWHdb8GMtlvjtSAhm
         ttyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620302; x=1701225102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgitgLAckBmqQ+XCJ9ibuZFRBdUdF/BSG77vPBcKcMU=;
        b=OZWXHdOy7hJW5GGmuSIOMO7kFL8mH6xRzfv0DTdaO/nqRsjGa0LOQwg98jmAIg/199
         0AI/vmgMQRgwPtAoaoWVizzZhYSEFJGtCt6YebOti0Gkn1Cp6LBtkLUOds4nOcS0yIZ7
         LsSbi/wpazgoQ0EPZd2xQrE/ikTASljsDO5JRkGca6KAltXzxsgOSH96hs3Db+rmgDAO
         VYnVejv4oVXtJU5HAA8jXlbSDKwLZTszv5oa9d0iKEgEDENZdADg58wsBM07bYjzX0ZT
         n4W57lgt48HnzES8m3Fn9vP1cTWYm8BO0mtk2xF9SU/JTNlzHINQ4Nd601DQfPdyyw5C
         V9jA==
X-Gm-Message-State: AOJu0Yy7RUtlzoojgNLk/PZZIsejnZ+svYOGVMG4MD/bmPYsYC4D6SrN
	ZhH9xG44jt/weTIR6sVFgeTp2RcN7H8JjFYjvC2yhQ==
X-Google-Smtp-Source: AGHT+IGyynGNcbVBkWhBj5MKcT91peFrRwD/dC7rZ+Mw7uInj2NfLT4rbTEuHPZo0VvBfHWQrpz3wQ==
X-Received: by 2002:a05:6a00:230b:b0:6cb:a1a7:ebcb with SMTP id h11-20020a056a00230b00b006cba1a7ebcbmr1330366pfh.24.1700620302184;
        Tue, 21 Nov 2023 18:31:42 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] go: Fix issue in DNS resolver
Date: Tue, 21 Nov 2023 16:31:11 -1000
Message-Id: <8c8b01e84844a7e721c668d5ffbc7161e67f0862.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191013

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>

This change adds a patch that is a partial backport of an upstream
commit[1].

It fixes a bug in go's DNS resolver that was causing a docker issue
where the first "docker pull" always fails after system boot if docker
daemon is started before networking is completely up.

[1] https://github.com/golang/go/commit/d52883f443e1d564b0300acdd382af1769bf0477

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 ...Fix-issue-with-DNS-not-being-updated.patch | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-being-updated.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index a0974629fb..330f571d22 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+    file://0010-net-Fix-issue-with-DNS-not-being-updated.patch  \
     file://CVE-2022-27664.patch \
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
     file://CVE-2022-41715.patch \
diff --git a/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-being-updated.patch b/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-being-updated.patch
new file mode 100644
index 0000000000..6ead518843
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-being-updated.patch
@@ -0,0 +1,51 @@
+From 20176b390e28daa86b4552965cb7bd9181983c4d Mon Sep 17 00:00:00 2001
+From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+Date: Mon, 6 Nov 2023 20:11:19 -0600
+Subject: [PATCH] net: Fix issue with DNS not being updated
+
+When dns requests are made, go's native DNS resolver only reads
+/etc/resolv.conf if the previous request is older than 5 seconds.
+
+On first network call, an initialization code runs that is
+supposed to initialize DNS data and set lastChecked time. There is a bug
+in this code that causes /etc/resolv.conf to not be read during
+initialization and the DNS data from program startup ends up being used
+until the next 5 seconds. This means that if /etc/resolv.conf changed
+between program startup and the first network call, old DNS data is
+still used until the next 5 seconds.
+
+This causes "docker pull" to fail the first time if docker daemon is
+started before networking is up.
+
+Upstream commit d52883f443e1d564b0300acdd382af1769bf0477 made lot of
+improvements to DNS resolver to fix some issues which also fixes this
+issue.
+This patch picks the relevant changes from it to fix this particular
+issue.
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d52883f443e1d564b0300acdd382af1769bf0477]
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ src/net/dnsclient_unix.go | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/net/dnsclient_unix.go b/src/net/dnsclient_unix.go
+index 6dfd4af..520ffe6 100644
+--- a/src/net/dnsclient_unix.go
++++ b/src/net/dnsclient_unix.go
+@@ -337,10 +337,7 @@ var resolvConf resolverConfig
+ func (conf *resolverConfig) init() {
+ 	// Set dnsConfig and lastChecked so we don't parse
+ 	// resolv.conf twice the first time.
+-	conf.dnsConfig = systemConf().resolv
+-	if conf.dnsConfig == nil {
+-		conf.dnsConfig = dnsReadConfig("/etc/resolv.conf")
+-	}
++	conf.dnsConfig = dnsReadConfig("/etc/resolv.conf")
+ 	conf.lastChecked = time.Now()
+ 
+ 	// Prepare ch so that only one update of resolverConfig may
+-- 
+2.34.1
+
-- 
2.34.1


