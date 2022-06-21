Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FA4C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:38 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.1223.1655854171960070698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Hd98wMam;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id s185so8757417pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XsaUSxjltIiiTIRAFyzAPOEWUF5qP/NDLmYKCGtFOMw=;
        b=Hd98wMambEBMb6wVAqeWRYTYBsi3YFXW45R1GMzEGPR3xr/h+af61yhRTd7caSCCZJ
         EMYRQMGuyLV68BRSGkCRFfEJzfrmiyT2N++N2xLCRq6ZdM5h5Oi4B3Y13bNb36dQzyVs
         nlh95DfaTPlHnRMdcjLrAqgN975Bu12fHHrT+W2fT3N6cFlvvjiglcYbt2/ofNxqeaHj
         82NkWKKCvlLdNSmgm6SdS3xqdek8+FI/RV9IJSgpxjSyFblgXs5dAe43jzfVYmAi0xN/
         lFlBV4xk7nn1oOxmhjoX3fb4N4pT0mmTU6CEE0GIrfLH47xn4v0rl/Q5hN4snUSmzuhh
         Xrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsaUSxjltIiiTIRAFyzAPOEWUF5qP/NDLmYKCGtFOMw=;
        b=CyS0/VeeSHUhBwdilC01gO4mNKDym9NVnLUoNQLGzqN4LpjNP1W/bBYO6bX5obzxWE
         WVZPHM+7la/9MZg8Pyh1WcsHTegqp+xVKgXgRJF8MG6KyRMDFMM/UOeHp8vvfvMjERxU
         Ogm+lIRQivaG5rdSNiaPcQPmrU3qb/XzjYOtHRJ8xkuo3xU7UNfgXmGtKrr6QXofOrRf
         YQLT8G8VCbjYOMMBDY3oLvdly1Iaqc0ZyDN4rUHU5gu9GlqaA4+RbKQPfFTvZcbf9QQO
         UBE9+Ax39m58mmV26GItLsrvYEQUsY3rAVXEAec8ZvrIkyAPgyuyrb4rLiC8bEWbIaHC
         8Xig==
X-Gm-Message-State: AJIora8VJWvAVdezDpyXvoS+Ce5RjXNnOvOV7o2Itjo/qNfvpm8ggMlT
	sONs2diLfhjjYSrqFGKxv9I7WgtH1qTQDVaV
X-Google-Smtp-Source: 
 AGRyM1u3m+ci8GbcAh5L7xhWcoOi5RRqWCogs8X/0qADQxxCZMW9PJKiQdgQAIKx/9PmjuMtAIoiKw==
X-Received: by 2002:a62:1687:0:b0:50d:3364:46d4 with SMTP id
 129-20020a621687000000b0050d336446d4mr32500342pfw.74.1655854170945;
        Tue, 21 Jun 2022 16:29:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] golang: CVE-2021-44717 syscall: don't close fd
 0 on ForkExec error
Date: Tue, 21 Jun 2022 13:28:59 -1000
Message-Id: 
 <b835c65845b1445e1bb547c192cb22c2db4c7e6f.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167206

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/golang/go
MR: 114884
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/44a3fb49
ChangeID: 7b28553d4e23828b20c3357b1cca79ee3ca18058
Description:
        CVE-2021-44717 golang: syscall: don't close fd 0 on ForkExec error.
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-44717.patch           | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 08d547a837..4827c6adfa 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://CVE-2021-38297.patch \
     file://CVE-2022-23806.patch \
     file://CVE-2022-23772.patch \
+    file://CVE-2021-44717.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch
new file mode 100644
index 0000000000..17cac7a5ba
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch
@@ -0,0 +1,83 @@
+From 9171c664e7af479aa26bc72f2e7cf4e69d8e0a6f Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 17 Jun 2022 10:22:47 +0530
+Subject: [PATCH] CVE-2021-44717
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/44a3fb49]
+CVE: CVE-2021-44717
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+syscall: fix ForkLock spurious close(0) on pipe failure
+Pipe (and therefore forkLockPipe) does not make any guarantees
+about the state of p after a failed Pipe(p). Avoid that assumption
+and the too-clever goto, so that we don't accidentally Close a real fd
+if the failed pipe leaves p[0] or p[1] set >= 0.
+
+Updates #50057
+Fixes CVE-2021-44717
+
+Change-Id: Iff8e19a6efbba0c73cc8b13ecfae381c87600bb4
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1291270
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/370514
+Trust: Filippo Valsorda <filippo@golang.org>
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Alex Rakoczy <alex@golang.org>
+---
+ src/syscall/exec_unix.go | 20 ++++++--------------
+ 1 file changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/src/syscall/exec_unix.go b/src/syscall/exec_unix.go
+index b3798b6..b73782c 100644
+--- a/src/syscall/exec_unix.go
++++ b/src/syscall/exec_unix.go
+@@ -151,9 +151,6 @@ func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)
+ 		sys = &zeroSysProcAttr
+ 	}
+ 
+-	p[0] = -1
+-	p[1] = -1
+-
+ 	// Convert args to C form.
+ 	argv0p, err := BytePtrFromString(argv0)
+ 	if err != nil {
+@@ -194,14 +191,17 @@ func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)
+ 
+ 	// Allocate child status pipe close on exec.
+ 	if err = forkExecPipe(p[:]); err != nil {
+-		goto error
++		ForkLock.Unlock()
++		return 0, err
+ 	}
+ 
+ 	// Kick off child.
+ 	pid, err1 = forkAndExecInChild(argv0p, argvp, envvp, chroot, dir, attr, sys, p[1])
+ 	if err1 != 0 {
+-		err = Errno(err1)
+-		goto error
++		Close(p[0])
++		Close(p[1])
++		ForkLock.Unlock()
++		return 0, Errno(err1)
+ 	}
+ 	ForkLock.Unlock()
+ 
+@@ -228,14 +228,6 @@ func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)
+ 
+ 	// Read got EOF, so pipe closed on exec, so exec succeeded.
+ 	return pid, nil
+-
+-error:
+-	if p[0] >= 0 {
+-		Close(p[0])
+-		Close(p[1])
+-	}
+-	ForkLock.Unlock()
+-	return 0, err
+ }
+ 
+ // Combination of fork and exec, careful to be thread safe.
+-- 
+2.25.1
+
-- 
2.25.1


