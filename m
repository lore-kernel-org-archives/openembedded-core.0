Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E83CC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.12144.1651248150144123805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sR45Snk0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so10894228pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qCR2uVod6YZAXV6nKwh8X9F9vwYhOz5CfERZcIaGABY=;
        b=sR45Snk0iM334tb4VGJzl/qsjkWJ3QOvINS2yKS8qSOBUKPdmLKRCpPNrUQDhFyfvZ
         HykPCN/0gzWP/R8icxB9vz5z7AUYhmVL+HYgCV6t1FEI1R0fiSWoVWd8l/ACV3JHGb++
         BuN/lyCYIInnk/NrHyLSz4sROwWa8Qx0iWQdD5oDxJ69IjarxzMTzAdTCAGRWYoGOytz
         CDU9uvSsOFu1L665+/WYk5vhi8QiPcABevpa/hhXTxbWSayU5D9kLQAvjmn2+w/p/eI+
         KiCML/Ef4ti8t1plq5IJKdmERDbCnBoFnXyRgGK9YNZIwZAMspC71K9tAl7K7pIsNU5+
         YkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCR2uVod6YZAXV6nKwh8X9F9vwYhOz5CfERZcIaGABY=;
        b=ko69x9ktjE7f1pH3uiKWQ7XPzLADr6U+949myosiMyJPIlJaqO9xuifnHpjndCJQWs
         iGj6xvYz9bUKk0sEbsoUL/XKmhNVpfB8uLdODf9y/eQw9ESM9G7az8sw4nCJsp2aLb0h
         IF6WZBcllqzvia0u8gWZqhBUD3vtOnK2LyX2JNHN7/4sSyMAf7+MdUKNEl04q9dYZZ/M
         PzWWDNnI8PNzSDNcbsf7EVGgHH0AEpe25bN0VV/9IM7DGFbD1S0ugAbk5+gFcBSJNdqq
         8E2ztbWlacC1GZoSS7yRICcoNlcM7mMquhTfjrSTwmAgt2pmJLRYak5S0IY+F+RqGozl
         kgNw==
X-Gm-Message-State: AOAM533UlHQaq5OPf4ePFK14lp1y0mFK4ry8LyZE3VROGDroIovfkYBO
	Nk86f4oWd/+UU9sSocva3koz3GQ1S1MNY+uztlw=
X-Google-Smtp-Source: 
 ABdhPJyGaf+8Cm1BTVTCjaOSWqQXO96YushFdQwxv+vqUPa6WcSGc94s0Gq0ILHSihLqcY0qsthMCw==
X-Received: by 2002:a17:90a:bf0a:b0:1db:d98d:7ce9 with SMTP id
 c10-20020a17090abf0a00b001dbd98d7ce9mr4698504pjs.155.1651248148953;
        Fri, 29 Apr 2022 09:02:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/34] install/devshell: Introduce git intercept
 script due to fakeroot issues
Date: Fri, 29 Apr 2022 06:00:46 -1000
Message-Id: 
 <3a320c1555bf39b2d3c218ffc36827d9dda60fe1.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165046

From: Paul Gortmaker <paul.gortmaker@windriver.com>

In a devshell, recent versions of git will complain if the repo is owned
by someone other than the current UID - consider this example:

 ------
  bitbake -c devshell linux-yocto

  [...]

  kernel-source#git branch
  fatal: unsafe repository ('/home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source' is owned by someone else)
  To add an exception for this directory, call:

        git config --global --add safe.directory /home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source
  kernel-source#
 ------

Of course the devshell has UID zero and the "real" UID is for "paul" in
this case.  And so recent git versions complain.

As the whole purpose of the devshell is to invoke a shell where development
can take place, having a non-functional git is clearly unacceptable.

Richard suggested we could use PSEUDO_UNLOAD=1 to evade this issue, and I
suggested we probably will see other similar instances like this and should
make use of PATH to intercept via devshell wrappers - conveniently we already
have examples of this.

Here, we copy the existing "ar" example and tune it to the needs of git to
combine Richard's suggestion and mine.

As such we now also can store commit logs and use send-email with our user
specific settings, instead of "root", so in additon to fixing basic
commands like "git branch" it should also increase general usefulness.

RP: Tweaked the patch so the PATH change only applies to the devshell task
and is a generic git intercept rather than devshell specific.

RP: Also apply the PATH change to do_install tasks since that also runs under
fakeroot and several software projects inject "git describe" output into
their binaries (systemd, iputils, llvm, ipt-gpu-tools at least) causing
reproducibility issues from systems with different git versions.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3266c327dfa186791e0f1e2ad63c6f5d39714814)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass     |  1 +
 meta/classes/devshell.bbclass |  2 ++
 scripts/git-intercept/git     | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100755 scripts/git-intercept/git

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3515720bf9..b54b56d624 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -367,6 +367,7 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
+PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 26c01c080a..247d04478c 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,6 +2,8 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
+PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
+
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
diff --git a/scripts/git-intercept/git b/scripts/git-intercept/git
new file mode 100755
index 0000000000..8adf5c9ecb
--- /dev/null
+++ b/scripts/git-intercept/git
@@ -0,0 +1,19 @@
+#!/usr/bin/env python3
+#
+# Wrapper around 'git' that doesn't think we are root
+
+import os
+import shutil
+import sys
+
+os.environ['PSEUDO_UNLOAD'] = '1'
+
+# calculate path to the real 'git'
+path = os.environ['PATH']
+path = path.replace(os.path.dirname(sys.argv[0]), '')
+real_git = shutil.which('git', path=path)
+
+if len(sys.argv) == 1:
+    os.execl(real_git, 'git')
+
+os.execv(real_git, sys.argv)
-- 
2.25.1


