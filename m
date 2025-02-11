Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8270C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3295.1739304583928413893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T1XRCf5K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so44946a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304583; x=1739909383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDH7eHfHKnNOGE4pRi4OT3QfyHv3KU365dLGczpPjss=;
        b=T1XRCf5KdqCgmXB4yS/hmtN5N6AoRn5NYFgrwmK+GsLsDVZ9Tc7W0w0T4Pg8aGEQDd
         BtF3yx7Bd2wfZWQVJnzZfIiQJ5ed3AtDPLWpx5e7wr+3OTeiJ4XMSUOHcabj/lTWmtld
         Chd6X+khWivMHpFQh8jY/lUbN0Pd/O4IDATglMcjjBQkss1ZIStuxUSgzYzPuC2d7St0
         nVM21cZPoyysPTEaZtKqJKhd6tTFIBL2JNVMfiip+ejT1BMioTvmp2ALRVEJRC/VNmKu
         bvfGlQeYvLFYP18HOMSnqWGYcpuX36wTxaLnq1eqNzzGycyniFXLoPlkcMKGrQJCK7q5
         2qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304583; x=1739909383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDH7eHfHKnNOGE4pRi4OT3QfyHv3KU365dLGczpPjss=;
        b=Q3hHsXjCLlulcDsrKXGXjXdO3cgGhWOA/J9J3K88w/oWrOgoNtCwOqTT1PCHRkCT5S
         5WU++6x6xKmJIvJDCKqZYjdgGfXCE08VHaXShF39oMT2p4+zyyawNukOasyGiN5dC8jj
         Kujl7he9yHHWGCPatKKaXKHJKUmUC5OMGaCnf6LAytcuYxtM5gAL8yE6CWHaDpJYywUp
         +dKonwKTRteUBALXLk+jsa0qFp+Ri0aGdIe1OlBPQTWclZQbXwOtY4zMra/GMgpvC7Wq
         O8oYDOEklmA/177nHoTELA8jLmfrTAMv5yVtuYFpE9ZYpVrSEgsmnnOJ3Z7KErLwBfLV
         p9PQ==
X-Gm-Message-State: AOJu0YzdiNNASt0u5UNfU071ZQUISS6Xk0Xr34Pox7xFzAWpNrE/kgWM
	SATPwOm5HOJ3DrYuukid9Sr5+WhIFgIu/YcgS9is4FMFib+uN+NLwojo93MPj5UMgdbrpwr5h8h
	x
X-Gm-Gg: ASbGncvZAb089cFKFZvqvu7blIE0lE39GDJcYJgHR1C/rBE1Kth9HRkoLUp2eeYITOO
	04l5pg7FDBD/rcTEBgAQ1W5g5kOLG/fYjQWdeYtzUSLpCPm3++45bRW1f8YkduzSh12YAPn6eop
	kl7WC2gPRR30AqcusaJYii1a2Vy6jLIW+EOu9nY2ANnwfZjxg5hVbq7ZJmA1KXpHJ6MFcFps/FA
	IQ3M2NIDb3qhg5rSZBONSF+JN511bvEdkteMerqpjood26+FEdCodpqnUFf/HGitnMDOYJjCNCm
	9qpg
X-Google-Smtp-Source: AGHT+IHgBEVbUwIAapD4XXYjlM9/q28iBNvyV+OlUTYjFahlk2Wr/4JcvWPV6cjNe+eKvpk0qZnbxQ==
X-Received: by 2002:a17:90b:2e44:b0:2ee:9902:18b4 with SMTP id 98e67ed59e1d1-2fbf5c5e16amr598331a91.27.1739304583217;
        Tue, 11 Feb 2025 12:09:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/14] base-files: Drop /bin/sh dependency
Date: Tue, 11 Feb 2025 12:09:13 -0800
Message-ID: <61880aac34ff408a8bc5060c6140bfd086b27524.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211182

From: Marek Vasut <marex@denx.de>

Remove /bin/sh from bash RPROVIDES as this has a side-effect which
confuses rpm package manager when also busybox provides /bin/sh and
base-files depend on /bin/sh . The problem is broken down below.

First, bash depends on base-files and bash pkg_postinst must run
after base-files was installed, because it requires /etc/shells
provided by base-files to be in place.

Second, base-files depends on /bin/sh, which is provided by either
bash or busybox in this case. This is the actual problem here, if
bash is selected as /bin/sh provider, then there is cyclic dependency
between bash and base-files, and that confuses dnf which may install
the packages in the wrong order, bash first and base-files second .

To make this worse, if busybox is also /bin/sh provider, it can and
does happen that some systems pick busybox as the /bin/sh provider,
while others pick bash as the /bin/sh provider, and that cyclic
dependency does not always appear.

Attempt to break this dependency, remove pre-inst script from the
base-files recipe, which removes its dependency on /bin/sh and
allows it to be installed very early, and always before bash.

(From OE-Core rev: e71b64a9b22c7db316e92e78a4bce8b9f994a4ae)

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../base-files/base-files_3.0.14.bb           | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 9fab53ce63..5d13b6249d 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -70,29 +70,6 @@ hostname = "${MACHINE}"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
-# In previous versions of base-files, /run was a softlink to /var/run and the
-# directory was located in /var/volatlie/run.  Also, /var/lock was a softlink
-# to /var/volatile/lock which is where the real directory was located.  Now,
-# /run and /run/lock are the real directories.  If we are upgrading, we may
-# need to remove the symbolic links first before we create the directories.
-# Otherwise the directory creation will fail and we will have circular symbolic
-# links.
-# 
-pkg_preinst:${PN} () {
-    #!/bin/sh -e
-    if [ x"$D" = "x" ]; then
-        if [ -h "/var/lock" ]; then
-            # Remove the symbolic link
-            rm -f /var/lock
-        fi
-
-        if [ -h "/run" ]; then
-            # Remove the symbolic link
-            rm -f /run
-        fi
-    fi     
-}
-
 do_install () {
 	for d in ${dirs555}; do
 		install -m 0555 -d ${D}$d
-- 
2.43.0


