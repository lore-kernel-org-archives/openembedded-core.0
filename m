Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356ACC87FC7
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.23457.1650557181336863591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 09:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iv8bTfsK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id bv16so7331365wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLVeyTSYlHVJlWCuo6uf/OgiozoY5EcPcFGgoOTS+/o=;
        b=Iv8bTfsKv9VUBx3SlAb4Jcf3sxfRhxDegDZ8STjWhUxEewz1kU1RWTywDTGsiXR+Kc
         +mY54dWdGhi0AEPR9Ng1j/TXhiouWK0MtMPDZXlCH/diR2d3SxRu78tF1FMQpoRmlqQ+
         XFGHlwr5kYJuVDQ8L/5o53Tozmbr1sxnq/X3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLVeyTSYlHVJlWCuo6uf/OgiozoY5EcPcFGgoOTS+/o=;
        b=QE/z5JY2QILDyjnBrzC6jFgWuHREUTjBP44x6IgO6SrlFfB49m4QG0tEDNauZ1HEZr
         7IAJN5+A6kwtxvvZh/BcbJlWYvPJoTPK6TU9Q4kAIMqRirNELCuLFh/FmBiaq/bq54XI
         eWtQtqT87UfbgeTRZwc4hQLu8KE36/mAzkt7YXITiicShaO6b1lDcJKBkn2CEkx2Nyag
         geJjm4HbgDBky1vm/COfcHFBu24x2oXzj0bUc5jNJ3MnCY1wo9N8Bq/SM9OFQGk5D2do
         eBLdaioL6o+8HOH66eN9qDnojyYwYPyh2G2GPpGuUaMHm14RyEjpSONhsmjERI4dQDv8
         3w2w==
X-Gm-Message-State: AOAM532xgAgBMPw1FL3tCk1Ds/cKoBz+O39tIzwRqYihSfNwnBxwhprA
	4D7UJt758o/TBbwHz6meb2i6L1d3Ex5Ikw==
X-Google-Smtp-Source: 
 ABdhPJzFqWskM1w6lk2vWbm+4TF7IoJAtZ9jdtZvPF40DjSZkBu43wUaF3GLIcM0GGZmcBxFhUXzDA==
X-Received: by 2002:a5d:5887:0:b0:20a:9e33:8e4d with SMTP id
 n7-20020a5d5887000000b0020a9e338e4dmr384391wrf.2.1650557179370;
        Thu, 21 Apr 2022 09:06:19 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm2432384wml.10.2022.04.21.09.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 09:06:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] install/devshell: Introduce git intercept script due to
 fakeroot issues
Date: Thu, 21 Apr 2022 17:06:15 +0100
Message-Id: <20220421160615.2600165-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164765

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
---
 meta/classes/base.bbclass     |  1 +
 meta/classes/devshell.bbclass |  2 ++
 scripts/git-intercept/git     | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100755 scripts/git-intercept/git

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3515720bf95..b54b56d6248 100644
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
index 62dc958d9a4..75604d0c076 100644
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
index 00000000000..8adf5c9ecb7
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
2.32.0


