Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955F6C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 09:22:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6996.1633339375000947762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 02:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fb1lkY2d;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id r7so14086428wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eTtKdIULe/u09kAjPq9lq4EgXMcZ/AcpgeBn5hnisNg=;
        b=fb1lkY2dxQFCB6pqIjxCKOyF51Iux4taZcM39GdLmCkZJMdKb5t1pjtA6o4RyqEpeB
         1G83KFCuk8Qa/fpi3U+Kbsly80TE061k5S8M1wvy/f6kR4W966FhPwmkPZKfz4arFssZ
         JdC9Gqd5drbp+YHzkDMUNDZfI35mnGGwstAnqZjph1W2JLj55LfRjLmgxH1SiMUSHXvq
         hIgLfpSqZttYY0Elohqyi0eYBEvgRxrdZPOQi/3IC42bPopIFPqVQlPv7eBUHy73VDxG
         UYC8E9ppJ55yMhhZMfmDSTNiWcH9zNAELUnENIuV7Z74NtA7rN91kxGhb3D+XVbGtqcX
         zW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eTtKdIULe/u09kAjPq9lq4EgXMcZ/AcpgeBn5hnisNg=;
        b=sBP1Lp4X5hYiwHYzmnkav/sgtg6O0Y1AdIFHlCHG8y01erb/61xkXSgcvBnB+bUxrO
         pbogDg1BhIMt0P59BGnxEmZdgiY/+fBUDieKGzgpgBh5NBp4GmhyYA9EzH+QE54J0DFb
         jCbhmUWsvhVw5SPDpvYTHi332qTnjHeDdwXjcnyi8bV4to2ZF+ckXEEjSKcD7ehRUEvS
         JWtYgCVEX/m3uNTHpHDm25qGoHp/r69Gnhmn4tnJW+usi34WdSY8b+P0atHCbX81ftXs
         Twue1+1j3CB08DWHAehdGCD1csD0M1967qZTyAY0Eu3da44RPfwzolh6arLVJt8Tzi0w
         /y6w==
X-Gm-Message-State: AOAM531Lg/md6tWTJA+UBUDvgMOfAzQ6+OfViGFZ+VAifvTcNaouZ1rr
	XQK8qkue5D5uzPlIn3/si26cXruyBOo=
X-Google-Smtp-Source: 
 ABdhPJxjW+gmexRFwGzI5Twaw1meGeEHciVLPISyZ+kFCLxi8OhQXBBW0KNj3c1Z+5rEz7ZsdQ52Vg==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr2668306wre.315.1633339373452;
        Mon, 04 Oct 2021 02:22:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id
 v23sm13754884wmj.4.2021.10.04.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 02:22:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] package_rpm: use zstd instead of xz
Date: Mon,  4 Oct 2021 11:22:48 +0200
Message-Id: <20211004092248.384346-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 09:22:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156578

zstd has similar time and space performance in compression but is
vastly faster in decompression, which benefits rootfs creation
(especially when installing very large packages) and on-target
package installation.

Also, ensure ZSTD_THREADS doesn't change sstate checksums. The
detailed explanation is in the commit making similar change for
XZ_THREADS.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 meta/conf/bitbake.conf           | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1c62d8283b..e738806fd7 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,8 +684,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
-    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
-    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
+    cmd = cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
+    cmd = cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e25d632dc1..1ae377750b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -815,6 +815,10 @@ XZ_THREADS[vardepvalue] = "1"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
+# Default parallelism for zstd
+ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
+ZSTD_THREADS[vardepvalue] = "1"
+
 # Limit the number of threads that OpenMP libraries will use. Otherwise they
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
-- 
2.31.1


