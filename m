Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6506EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 21:23:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.18029.1689974617588385871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 14:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vexwoXPy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b8b4749013so17660575ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689974616; x=1690579416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/X+zgyWt+fNYJOkD0bKZi/GCOwIzRFQXvvYbK/++YI=;
        b=vexwoXPy2JQWJ84j2yK/l8IggjIXDYduG5oO8MejJ3F2bCp+PqveUPJkatzfv8AJA6
         Sj8JkNJFuD/vEqyFgx1IjiAt+hEGuy47z7jvDi6udGWrsbJyFh4KZAVCEQRckHiM9Sfc
         fFvFOMkjDWRwKnbJAQBua+kHl6NVJeo53OxPmknmvlfgk0Oj0wAiiF9YTZRtN9dyGaUW
         /gZrRD51Y9g3sHCukX+sfnbS977UeEVE8NEoBM8Ed8FeXS2O2dZL5iC/TE8PFd5WsFoF
         iQKXuu3q2A1Sz+k7s3M2/tbG9+j42FhE8rzmfWzDURcBE0b8J6FtGbJrOeORq5JNk6sZ
         /fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689974616; x=1690579416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/X+zgyWt+fNYJOkD0bKZi/GCOwIzRFQXvvYbK/++YI=;
        b=IgZfevJrN16LcLxhWQvmX6S/EsXKYmdZTIttEnXQwH5w/Zn1rtdyqT5I4uPR1AFsw4
         tiwc/4SCBYnNqhpZLwWAKamESAzguLMsDgCEA3VYkM/5XoXfsyvbBPfEdjA+v162TPZ9
         zyZGXbBCYxDb6knc2p0AsQ9E2mFpoqHoi113mfN2TEPQGuga6Oiu9KjiA7nZdNbzJCru
         GS7E8Tln7AXcLBiYyl0mDI4BosTxzHhemL2NllqcipNDMUnMCUlBHdwknHOH5NchnlEh
         SyJCbNQmv95amHvxQL5FZHsQgM9bePb//7jnZvjnmhjBTr+hcxJt2SLCB1TJJcZY5QQA
         ZNKA==
X-Gm-Message-State: ABy/qLZ+6erE4TFM5RW7Se/mDWHE1CQbdIJ/g3ewfexs5ppUlA6vN5Hv
	VRAHFJafZCjVjTWud1WcrZd1nZyGiGNMQG82y2U=
X-Google-Smtp-Source: APBJJlHOK51HYe/AaLI5MPsyXQD/1tJ1GbIoTGpaOvmP3Z4G1kWLCSqjgdiFh/mHprnVyR97E4CS/A==
X-Received: by 2002:a17:902:c405:b0:1b8:8af0:416f with SMTP id k5-20020a170902c40500b001b88af0416fmr4251976plk.1.1689974616504;
        Fri, 21 Jul 2023 14:23:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902dad100b001ac6b926621sm3911420plx.292.2023.07.21.14.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 14:23:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell] openssl: fix intermittent openssl-ptest reproducibility issue
Date: Fri, 21 Jul 2023 11:23:27 -1000
Message-Id: <6c505ef6c9950eb6d09bcec683fefe6edc7b2e6b.1689974522.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689974522.git.steve@sakoman.com>
References: <cover.1689974522.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 21:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184709

Adds two missing key sorts in generation of unified_info

Backported from a similar (but more invasive)  patch in the 3.x source code:

https://github.com/openssl/openssl/commit/764cf5b26306a8712e8b3d41599c44dc5ed07a25]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-Configure-add-2-missing-key-sorts.patch | 38 +++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Configure-add-2-missing-key-sorts.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-add-2-missing-key-sorts.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-add-2-missing-key-sorts.patch
new file mode 100644
index 0000000000..e2a65d0998
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-add-2-missing-key-sorts.patch
@@ -0,0 +1,38 @@
+From 679ae2f72ef8cf37609cb0eff5de3b98aa85e395 Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Thu, 20 Jul 2023 04:14:42 -1000
+Subject: [PATCH] Configure: add 2 missing key sorts in generation of unified_info
+
+Otherwise generation of this section in configdata.pm is not reproducible
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+Upstream-Status: Backport [adapted from 3.x commit https://github.com/openssl/openssl/commit/764cf5b26306a8712e8b3d41599c44dc5ed07a25]
+---
+ Configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Configure b/Configure
+index 2a01746..8fc5a2c 100755
+--- a/Configure
++++ b/Configure
+@@ -2326,7 +2326,7 @@ EOF
+                      "dso" => [ @{$unified_info{engines}} ],
+                      "bin" => [ @{$unified_info{programs}} ],
+                      "script" => [ @{$unified_info{scripts}} ] );
+-    foreach my $type (keys %loopinfo) {
++    foreach my $type (sort keys %loopinfo) {
+         foreach my $product (@{$loopinfo{$type}}) {
+             my %dirs = ();
+             my $pd = dirname($product);
+@@ -2347,7 +2347,7 @@ EOF
+                 push @{$unified_info{dirinfo}->{$d}->{deps}}, $_
+                     if $d ne $pd;
+             }
+-            foreach (keys %dirs) {
++            foreach (sort keys %dirs) {
+                 push @{$unified_info{dirinfo}->{$_}->{products}->{$type}},
+                     $product;
+             }
+-- 
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 75fc3c5c1a..eea8ef64af 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
+           file://0001-Configure-add-2-missing-key-sorts.patch \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
            file://CVE-2023-0466.patch \
-- 
2.34.1


