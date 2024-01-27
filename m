Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA094C47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.8493.1706323079842129805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N5w9HpNr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso728239a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323079; x=1706927879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMzqdiE2cVstQh/0ARV5dhFg4Ykk8KVuGFDcOA6XCv4=;
        b=N5w9HpNrCjkmFK1ew8DGys4S4LfYHUhxRwwPLBEhrwj6ozryk80hZApMQa8SSJuwRy
         Xd7iSYIaVbLO3uUx2y6XdcbgnNDgxJQeDRRMWowwt47LYULQuDml1OW0shNRaQKkgkW4
         U2udk2u50sNvj/hGIe6DqbTvS4M7VLL28V3hW29r/U8bYMooAsRUqgXopy4hQlLi+hBK
         R4YkSWq90kUJOiGoLB1+k2UZ4ts4ku5Y2W+BY0vddU4Ae00yLXYArAWqAHjtR/Yga+uB
         e2PMgk9M+WCFF6ArMR0VkK2tAetU5QDSmTGQ08157YtHDBgcIybJ7mAuOwHciHaS36d/
         rKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323079; x=1706927879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMzqdiE2cVstQh/0ARV5dhFg4Ykk8KVuGFDcOA6XCv4=;
        b=ShLvuEyTosqz1YVbbgrs8YjoXALRlVb2sVeNRCvAQcszPzMW8ZbnWjHuPa/kqxT4tl
         z2HjIyEtvhcYMQrGLc23dNO5CPbEGB2Nj1MkDmQDLXmWkcU2JmPUx+JITbnGsfO1OxpC
         +QLt5qv6RoYQbPK395KgVl4R/M0GgB+pMYbmlZ+4kAX7n2hImNDg3j6crAYoV1GzwhZR
         HoVpu3g98RzYlgR5IJUsF6q5/sB6N/Z8JC6EDIa7RIJE9hR84WjlgqndcuzW0Jo2b67O
         1pVpxaizMHMtmroY6xqa5OsZrAeAMhoZsPVtvI+g4UZE5i1hDYAEYTH1D0IaoPgQv18Z
         cyLg==
X-Gm-Message-State: AOJu0Yza4EUESe/Kb8W9uYS57pZdkHs7KCNAHMULoTrNPD/D965JiHQ1
	Du5WH5DoGT50hEQQRAqm68g0mIiU40Onczq3woeLtOljLoIJwZt/REYRKo9flY8PqGbE5P+TSzW
	7kCQHEg==
X-Google-Smtp-Source: AGHT+IEZ6Y1xy37jBQ5fGfNWz/lA+wGCy42pyLqZ7snLL02UIpuDPpwqpcEGqzkqJKbr1ocXyntShg==
X-Received: by 2002:a17:902:ecc1:b0:1d4:be46:5325 with SMTP id a1-20020a170902ecc100b001d4be465325mr1058299plh.78.1706323078945;
        Fri, 26 Jan 2024 18:37:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/23] linux-yocto/6.1: update to v6.1.73
Date: Fri, 26 Jan 2024 16:37:19 -1000
Message-Id: <84a86b91de33a048b8a4aafacb051c9dbc3abbca.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194420

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    fec3b1451d5f Linux 6.1.73
    f9ee31dc7fcd cifs: fix flushing folio regression for 6.1 backport
    0f22c8a6efe6 ipv6: remove max_size check inline with ipv4
    b2c545c39877 Revert "nfsd: separate nfsd_last_thread() from nfsd_put()"
    db5f2f4db8b7 Revert "nfsd: call nfsd_last_thread() before final nfsd_put()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27004956fb5ce3d4c2a48e64681b743763641f04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 857197b211..06c07b70c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6d67557b912380b57b6081da7ac106e9c003f4d1"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine ?= "6fd0860ac9846438f226257ab515bcd612fdc379"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 55f78404b1..e391074f8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index a75efe66de..f520954646 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4b6d6ef48b0d11dfdcdc9ae25e1c83be9396a116"
-SRCREV_machine:qemuarm64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuloongarch64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemumips ?= "8a0e36da16bca1553532936c198c43362be35a82"
-SRCREV_machine:qemuppc ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuriscv64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemuriscv32 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemux86 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemux86-64 ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_machine:qemumips64 ?= "3407157586b654c9932356124429ee9dc9f56f18"
-SRCREV_machine ?= "d08880e7ec70e70249f80b8305da8e90bd47c606"
-SRCREV_meta ?= "74fa91143e9076e0d1d5ff0cca93987b3330bf27"
+SRCREV_machine:qemuarm ?= "45e6b64447b888e94af6fa8529cf976bf8116624"
+SRCREV_machine:qemuarm64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuloongarch64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemumips ?= "90ea25826ce7ef511d0d93ae33c3888f3b583bf3"
+SRCREV_machine:qemuppc ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuriscv64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemuriscv32 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemux86 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemux86-64 ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_machine:qemumips64 ?= "59248cf67c17a987f898d9d0c81292cb5fcda858"
+SRCREV_machine ?= "6c78fd37122b29c40bd8bb6f43aaa1ba7d6fb53a"
+SRCREV_meta ?= "40dede8a165ea5894f172fede6baa0dd94d23fec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7c58bfa711cb556ef1edc48e7dfa6d84e5fb8912"
+SRCREV_machine:class-devupstream ?= "fec3b1451d5febbc9e04250f879c10f8952e6bed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.72"
+LINUX_VERSION ?= "6.1.73"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


