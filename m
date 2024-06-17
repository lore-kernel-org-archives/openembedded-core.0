Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794C9C41513
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:06:35 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.54605.1718625992969632037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=icE9ZroH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-705cffc5bcfso3749180b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625992; x=1719230792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Snp5+Jv/HGvwtnhePHLj/VcKjF9ogerzr+v4toW65rc=;
        b=icE9ZroHz0YGosTz2xlQSC/8alIJkbs1mPPZ9vwDoTtqDUwb7W+fHdAbXWg3s+eu+M
         w7qyB13P8OdTUQTr8GwoNQsKVSz5LX/kjM0nZr0HPtPbgU3KyVmbZUn44ecSHp9yT8PO
         BEdm183snaqNVbjvCQH1htLtogIqxaY8debuv7bdhfDTb6P8SzDasUt3fYbqndVQxklI
         uqBik/jMMWKsChs+4hT9cmu2nbcMp3jWXtBGvGuW/HdLSc7qYk9KUZJqAMkXCe0EIYaD
         SnZh2NsunOZ4xC8Tzv5MYCoWPFZ7GPaMsYP11gwCPp65ZLFVviLMQxcGvnVmrLCvmZSI
         KjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625992; x=1719230792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Snp5+Jv/HGvwtnhePHLj/VcKjF9ogerzr+v4toW65rc=;
        b=TH8OVyFkqV6wV3Xr743d03mNB2k+o+PeL6JFK39k/GvgqW8hh+bcQu6e2K8DjveWti
         o9feJ3Waih7q9rt/V/AJNArD7SGGA8RynSuqVHHUazWGX6O44gWl4///pdsObION6yYm
         Zgn+mWB80aVKzJx7O9NqCa9sIL89J1lVeL3yReXPEtXJyUW6URe9Y4K/cRaqAebB+4Ew
         SUM+fA+gcyK+sm39eZXLGBlCWw6ivYoMWQrhvRZat4Fji/kTcjJHq460+4GSgmZE2e9W
         8Tmvn63f6//AsBccHCoMwJA2wbbsgTCVZQES5V5HYt/MwPHebwWpZTRIxhEBQMMLXg8R
         2JAA==
X-Gm-Message-State: AOJu0YzcScJ/ca2yWLxNyClSrPzNmTNyLH6cedjBafxMNjPE4cUaw6tq
	8Zseanw3I6dcarJpWgaex3vUflUzVAwtRqx3a7yukC2plsI0hXRhbv98SCtg2oVl6Q8KYBZy5Mt
	q9ik=
X-Google-Smtp-Source: AGHT+IEAhq5p7uXIlRTJcxCqjG+gpBulFmnX6glP9haZooDib/uJhTzlkVuDlZ3AjW+7lrg1YRHPlg==
X-Received: by 2002:a05:6a20:6a21:b0:1b5:4c70:d682 with SMTP id adf61e73a8af0-1bae7d853a3mr13032464637.6.1718625992240;
        Mon, 17 Jun 2024 05:06:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.06.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:06:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/22] expect-native: fix build with gcc-14
Date: Mon, 17 Jun 2024 05:04:59 -0700
Message-Id: <9104d68ce54c870b4c8f4fd1b8dd5e250ca48fb1.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200832

From: Changqing Li <changqing.li@windriver.com>

* do_configure failed with gcc-14:
error in build/config.log:
conftest.c:56:3: error: return type defaults to 'int' [-Wimplicit-int]
conftest.c:59:5: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]

* this recipe set "BBCLASSEXTEND = "native nativesdk", causes "CFLAGS +="
setting not take effect, use append instead.
snip of bitbake expect-native -e:
   set /layers/oe-core/meta/conf/documentation.conf:110
     [doc] "Flags passed to the C compiler for the target system. This variable evaluates to the same as TARGET_CFLAGS."
   append /layers/oe-core/meta/recipes-devtools/expect/expect_5.45.4.bb:87
     "-Wno-error=incompatible-pointer-types"
   set /layers/oe-core/meta/classes-recipe/native.bbclass:44
     "${BUILD_CFLAGS}"
   override[pn-gtk4]::append[toolchain-clang] /layers/meta-clang/conf/nonclangable.conf:336
     " -Wno-error=int-conversion"
   override[pn-pidgin-sipe]::append[toolchain-clang] /layers/meta-clang/conf/nonclangable.conf:340
     " -Wno-error=cast-function-type-strict"
 pre-expansion value:
   "${BUILD_CFLAGS}"
export CFLAGS="-isystem/build/tmp-glibc/work/x86_64-linux/expect-native/5.45.4/recipe-sysroot-native/usr/include -O2 -pipe"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 18904ebc10..5e7b352196 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -84,4 +84,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 # http://errors.yoctoproject.org/Errors/Details/766950/
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
+CFLAGS:append = " -Wno-error=incompatible-pointer-types"
+
+# Fix expect-native configure tests are failing with gcc-14
+CFLAGS:append:class-native = " -Wno-error=implicit-int -Wno-error=implicit-function-declaration"
-- 
2.34.1


