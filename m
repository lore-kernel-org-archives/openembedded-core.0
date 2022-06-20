Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA797C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 05:16:20 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.26827.1655702173157522377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 22:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KtCipPzV;
 spf=pass (domain: mvista.com, ip: 209.85.215.175,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id l4so9274618pgh.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cvqrVhuAw4AQdMC2Vfi83OQ+Jy7wDQj1xYDeiWQqw=;
        b=KtCipPzVzdMSUre5Dh/gUptWJNrbVrVAO+cnxo/894abdbDwJnxvL00wAdhLf1HKxC
         4+M2r00FzckyJOZgQFBD+c67qmsLVz20xcqKkq6lJMYIRKpfYa1nF9FBIUFtW/JZMxnF
         V0I+npNZUvAf5r/ntxOAVCMKpFQYPlrcXvWlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7cvqrVhuAw4AQdMC2Vfi83OQ+Jy7wDQj1xYDeiWQqw=;
        b=hgdRTYEyyAx/MxaTZtLYdVtCZLCpCMJzfOQ5lRnZr/G0GAKaR+U8ybKP/GRig4BsdC
         Z1WvMvDI5sOPdljijiBbv/cUzyDGd3buMA+e5Cpo8fSrD0aiyx22UfzzZGX9MgXHiwLG
         /YeZJPmUPAfb4ROR6O99gwYq37ZKlzfmaQ2DH3fAqENPAjDwzwoG4154tGCzW7qS9k7u
         vO7OZ+duawkCpB8qW2e0n+CyCl77R/58QQM7uD70NTbFJ9LzhdccMImKTIKEerZJr7Lb
         UlzXz+QUxp08cLmxPECzdZJ3shXRn+Gk00h/1MGEvlRUqzPfa51bMZwNNaEaWwftSXER
         oEOA==
X-Gm-Message-State: AJIora8FFgdjnrCrP0CAhuzrQ2GmG1ItZfDm8lAJuBwN7GKx7/9cCK/o
	uVpb6hEri9XE4gm0SCqkbyAe4/YiDLEzGeYx
X-Google-Smtp-Source: 
 AGRyM1t2hzdY1HiWa99kySurYqQ0oZ0SekazaWoj1NjGN2xGQuPYAX/tffeim/7ABl0jFdqef+56jQ==
X-Received: by 2002:a05:6a00:1256:b0:51c:7065:53b2 with SMTP id
 u22-20020a056a00125600b0051c706553b2mr22645179pfi.85.1655702172289;
        Sun, 19 Jun 2022 22:16:12 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.203])
        by smtp.gmail.com with ESMTPSA id
 i22-20020a056a00225600b0051bac6d2603sm7941560pfu.214.2022.06.19.22.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 22:16:12 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 20 Jun 2022 10:46:06 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2021-44717 syscall: don't close fd 0 on
 ForkExec  error
Date: Mon, 20 Jun 2022 10:46:05 +0530
Message-Id: <20220620051605.7404-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 05:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167082

Source: https://github.com/golang/go
MR: 114884
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/44a3fb49
ChangeID: 7b28553d4e23828b20c3357b1cca79ee3ca18058
Description:
        CVE-2021-44717 golang: syscall: don't close fd 0 on ForkExec error.
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


