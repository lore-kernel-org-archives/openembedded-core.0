Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6BAC433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.4277.1651532600624870880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Rug/c4ej;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id i24so13408208pfa.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OZ8lPv8ypxQfolXlwtCUrIy8hIWB21PRNsM7swQWGe0=;
        b=Rug/c4ejPvx/xWbcRWGVCMGebFkQOJM+fydRzQ1fEpY2o5Cn4VRdpfrJgv4kwzPV+4
         v7trkN0jK3EzHsz/fs+j2uaKcAb5FbXHUt/w0YNYycr3/TDm8uJW4TKZQzKGyIDCDgYY
         26uSGPKaN7nzZasVjvjMfDm3HcFId3CQ1c59Is3Kxku2Eky8zMhvZLYuukZDXR+k0rSo
         +3CdNzG4AvFBx6kIIGh2xu2LF9mN34yeH7SEMxQf8ojhe342bF6+sCfsZYbercEUiX74
         NAbaPdQ8LjYk269TihEB6LI05ZlWa6qIc+/Gh/KFyMj+lnvvhGC80K/CeDVlZ5RAkQBa
         fulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZ8lPv8ypxQfolXlwtCUrIy8hIWB21PRNsM7swQWGe0=;
        b=DwtqVPh0J19yZ7+VW2e+FHxocpuI9gFfub7+A0g3v67H8ylICRo1eUp3u+s2jkh17B
         VeoE+ccBWoUzQe9Ry7OQM1118IrjOmZ+HPPacE9GTtZKxGeBp8FeWIGkGc2aWjLGu1cw
         /b8eCEojrcMoMkDlxGjlOJb4ULAPoxH8/HlVrrtkNead/HKUlX0/VDvdvDB3NN7br5IU
         uQ2uvSAvjtJzl+7u2/8+6IN5V2LBpS0IB9qmIZh2jsvHWpQtJjCwi4/FIXSyt7JHVJuz
         /ZVsnreTgQeKbAUDEQW28OGUPemzM0BjDOyXWm9PiURwtJLB3uI7hYFom55kQEMzj4Ba
         xQlA==
X-Gm-Message-State: AOAM531PDCSQ/EF1r/s17/jv3xgTDtgKQZ1ooSj1JJgAffmm4Fas3oCO
	78D4VS4lpX7rZA6CNoa/7DnviltNbIOPBt/yP9Q=
X-Google-Smtp-Source: 
 ABdhPJxr5dtf4+ctoc7UQNU5R/M8UEfgQK1p9pYqtUeqQm0kpaZgSaVIyF9rS5QrI9CwTPuR/8kX7g==
X-Received: by 2002:a63:6806:0:b0:3aa:a481:63f0 with SMTP id
 d6-20020a636806000000b003aaa48163f0mr11575826pgc.44.1651532599473;
        Mon, 02 May 2022 16:03:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] install/devshell: Introduce git intercept
 script due to fakeroot issues
Date: Mon,  2 May 2022 13:02:50 -1000
Message-Id: 
 <2ef6841a1aaade0ec89c174e4168ef0629ba08a0.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165184

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
index 9ed736b0e1..398b098651 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -335,6 +335,7 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
+PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index ad9f267848..114a50b20e 100644
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


