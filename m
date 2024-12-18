Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70203E7718A
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.116961.1734559367191698230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G0mU3NqZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725ed193c9eso155050b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559366; x=1735164166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQgd9qTf/ohWXUFXrQsXtbbUSgtB43IJ5zWOg6LpA4A=;
        b=G0mU3NqZhFrfoP4yR9hXP8Ysx2wChl3X2E5/AFK47cdDTMK+3fRhrRuTX1Bm7E6LsW
         1BjxN+NZK+uOkIUcCpPirq490RF4G0/EUi6ncDj1TMoE38NLoImDEsLn4f+MyfZ8rTGA
         /mP3Q51CqrxxeJWHCpJ1riLYLRnrD9VMMWTZFxwSy4xwgDk6cBi8kCdeWvIpejR9vDdn
         fPLpGiWnAKHyRaZ0VSBJDr+LqMcDq6fUvUDoGtfm8LnOTocf5943ZZGCgz5wlKfoqksR
         EOb15TtHA5h88kq/GGBUqgS5be3qnpn+a4X6uzp3n/2yiH2w9WC1VmZxLqH31I+1TZmJ
         3kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559366; x=1735164166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQgd9qTf/ohWXUFXrQsXtbbUSgtB43IJ5zWOg6LpA4A=;
        b=aq5dc7G+rPvxyL+FxEaGKm9ffgZJUCXBedCqf4ORUEQgzQTXcyBI8+S25AKulgCisM
         uq3sPm3UcAP8QIAB4aE630GnyN/qL6mjBJWO/4pfIsuZMnDIpfw9L/T/LKZpyPBY7MZ4
         Zj3c4uLDy9itin5EeSpHx486MZjERi7Np/of9YcEW0sVEgSKnlCiu16x4vth+Eyok0oc
         Jv+bDH7T/jOZ8uUXbZJ19xGvykCCNSNnceQEhmgqwOoeAF9qOGH8A83YrQ425m8HUjqR
         yndIGvklcePrUuJlHcsBY2IF58xVOtyJ6Dff0uMH1kT4DOTm0qvK1nea4fJtD+Sa+wwx
         lCMw==
X-Gm-Message-State: AOJu0YxMALs9JFPCtwCpTy4Lc2RmazE71nearrMq8+BFFT0EN9LOH+Yb
	JN9VTWtR3xAs4ltfYQ10GBduZr6e6SglQHDedEAD0bq8zJcaPVVNUevEuonJC7EryeNXlijeyU9
	w
X-Gm-Gg: ASbGnctU+KjeNAHSuiEsXmnMwwoydrionD/kzyjzUCfpXZhmcaZC1xWPMYxZlv3+mUT
	ZAd3mUll542EmloBKvV/Qr24Xz4nnIjMQ9ndv+kvjoLAsdj/62YVK2y3FHQYDX4qwispnI3v6OG
	6qCx4Z1TphdqIiJ+uIJWbJ/qUyGo7lzhvv5Wu93JYVld4ZbLvgjb/G/5wEdnnvDTSNRCe6tG8fK
	gxH6f+JA1tDYJvLZf/IHkMf2en/UtLjRngKsvTc5OsIXA==
X-Google-Smtp-Source: AGHT+IENHvCQF+giu/LJdlVw1S/Dk6rWDCZcx5dy00bTD8AmT2Be21lWYtCUFuy5zYorQ1KmeBpuLQ==
X-Received: by 2002:a05:6a20:a10b:b0:1e1:ae4a:1d42 with SMTP id adf61e73a8af0-1e5c76aeec8mr1661686637.31.1734559366367;
        Wed, 18 Dec 2024 14:02:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] kern-tools-native: fix SyntaxWarning for RegEx calls on Python 3.12
Date: Wed, 18 Dec 2024 14:02:13 -0800
Message-Id: <fb0653a8b95be95eb2553b7c939444683cb11eed.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208889

From: Hongxu Jia <hongxu.jia@windriver.com>

Python 3.12 emmits a SyntaxWarning when using unescaped
character inside a RegEx string.
'''
recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid escape sequence '\.'
  if re.match( ".*\.config", opt ):
recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid escape sequence '\w'
  x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid escape sequence '\s'
  if re.search( "^#\s*CONFIG_", option ):
'''

According to [1], use raw strings for regular expression

[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...yntaxWarning-for-RegEx-calls-on-Pyth.patch | 60 +++++++++++++++++++
 .../kern-tools/kern-tools-native_git.bb       |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch

diff --git a/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
new file mode 100644
index 0000000000..e87067c8ac
--- /dev/null
+++ b/meta/recipes-kernel/kern-tools/files/0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch
@@ -0,0 +1,60 @@
+From 1f64368e4e82e47cd0e0dfe37b0e1b8958566d21 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Dec 2024 01:25:29 -0800
+Subject: [PATCH] symbol_why: fix SyntaxWarning for RegEx calls on Python 3.12
+
+Python 3.12 emmits a SyntaxWarning when using unescaped
+character inside a RegEx string.
+'''
+recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid escape sequence '\.'
+  if re.match( ".*\.config", opt ):
+recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid escape sequence '\w'
+  x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
+recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid escape sequence '\s'
+  if re.search( "^#\s*CONFIG_", option ):
+'''
+
+According to [1], use raw strings for regular expression
+
+[1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes
+
+Upstream-Status: Submitted [linux-yocto@lists.yoctoproject.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tools/symbol_why.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/symbol_why.py b/tools/symbol_why.py
+index 326e84f..4864378 100755
+--- a/tools/symbol_why.py
++++ b/tools/symbol_why.py
+@@ -158,7 +158,7 @@ for opt in args.args:
+     elif re.match( "--ksrc=*", opt):
+         temp, ksrc = opt.split('=', 2)
+     else:
+-        if re.match( ".*\.config", opt ):
++        if re.match( r".*\.config", opt ):
+             dotconfig=opt
+         elif not ksrc:
+             ksrc=opt
+@@ -213,7 +213,7 @@ if not os.getenv("KERNELVERSION"):
+     hconfig = open( dotconfig )
+     for line in hconfig:
+         line = line.rstrip()
+-        x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
++        x = re.match( r"^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
+         if x:
+             os.environ["KERNELVERSION"] = x.group(1)
+             if verbose:
+@@ -492,7 +492,7 @@ def split_option( config_option_str ):
+         opt = m.group(1)
+         val = m.group(2)
+     except:
+-        if re.search( "^#\s*CONFIG_", option ):
++        if re.search( r"^#\s*CONFIG_", option ):
+             # print( "option is a is not set!!! %s" % option )
+             m = re.match(r"# (CONFIG_[^ ]+) is not set", option )
+             if m:
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8eff00821a..7d11889eda 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,9 @@ PV = "0.3+git"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https \
+           file://0001-symbol_why-fix-SyntaxWarning-for-RegEx-calls-on-Pyth.patch \
+"
 S = "${WORKDIR}/git"
 
 do_configure() {
-- 
2.34.1


