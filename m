Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA1BFF8860
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32000.1777064233267592194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PzXD+fyC;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891f625344so70032455e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064231; x=1777669031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vdU4n1K7lWxQK9DmCumAjHGqVeV8OpGms6tBG6nQgg=;
        b=PzXD+fyCOiutUDTv8Ldu+7i2kOstFKptjymK+IqLTIdFo/8hXaLCJR0bMLkUzM4F8E
         wgMzU5N2ml2qEN2enK1MBNnBOVpCKObMBFyPGiu6g0n4Kv4pByzbDrxrOb7oBAxxlTDD
         vmoCccxQw6pbVpEfHBYdgQ5WDZhbxVfdCQnkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064231; x=1777669031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vdU4n1K7lWxQK9DmCumAjHGqVeV8OpGms6tBG6nQgg=;
        b=o8YGWDVghseXRohr98BB0fAZx8/RFQ9sWoXN2kDskXyievn4sWU//X9cBtAe261pc7
         OKCNABjTMgtszTIOY3fIMvv1qdH0JoH5NzGRM/oSyugdy48eyyNS1oEtDZS0Gi+ifSSZ
         kziLJ6gmA2quGg2TlwEcCO06P9Icqx6PmcOQ/IF+j+6Ir2brFgS/JAuGwK368c7TcrLx
         4fdTUwNlDNu52SHyHwiZO1KtrLSQAVEU4VJ73OVBiH/EzmBG0NL9abtq21vv89qHM7UL
         9hE8x1S8X0Yvwu37LO0cfOKv3TXaVaZDOB/beP+fnvhQf71uylx7WXY1kTsrcc7yTvYW
         E8Ew==
X-Gm-Message-State: AOJu0YyOf5RoNr8DdpiyZfjPPRd/YOMIDvIGjL9x1DZJZBvXmOJ9EnQa
	G9bQYrE9uRTIR8Z/V30/BCBCEktFyiebrnztdFYD3JPyZLgbODfoelnSvo6HjpDOt9SzmVq2/f/
	p5zHdf3Oe0A==
X-Gm-Gg: AeBDiesqGTIVgP8yOaxmdSBYg7QPVkGw/na5/nNuk5ehsxZk7Ox0XrnsXkpMfDhPSbK
	44aT7oo1mDgyeGB8wTOLrl8T75z+embrGyFRu9PdcYxkWeaUAe+pZgvZJOgiqJlMDGXP1qqhjDp
	6JaNjtLGUjB9gyWbfChEjuvlqltoqmbF06+87NACk3/Ofa8qNbRQM1kf9SXG12Gv2OEzNtD0HxN
	3QZEb2r9ltx+byaAq6rMEzgpZgr43gH60fhmUEI6S7wm1atWRsV1MWN/HGY9nzAC7IyJKQY0OKz
	/r4l/BGFLaM4H2uUIGHxoIfWry0LF8I0X0CV/o6q0AabtmdqAUc6vY+liJGRIVCGAVE4jEazGL6
	gtg85i+DKAb5JqxvCuwpiZLuX0wPIHDw0k9Lq+0DqeoSuvrrkan1I0aUgPo5cFXcQlU4i7vox9c
	oQwROuoHTq0GsVXlpxrBfOvVficPJ2bY4cgwa3Qt1ouW71a3CKpCjfdcXLp33U2crM4K9JZ1jtZ
	ZXgsosbAMZX2yQOQVtusfpIvpVJsUtQIKPXMA==
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr276228945e9.8.1777064231380;
        Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 60/66] selftest/minidebuginfo: extract files from tar archive using tarfile module
Date: Fri, 24 Apr 2026 22:55:59 +0200
Message-ID: <799e2124cdcb27bd924598619da61cbd11730b56.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235933

From: Alexander Kanavin <alex@linutronix.de>

Python 3.14 added security checks around archive extraction, and by
default will refuse to handle symlinks with absolute paths. It's possible
to handle this using 'filter' argument, but it is not always available
in older Python versions on various host distributions we need to support,
so let's extract only the needed files directly using tarfile module.

busybox is itself a symlink to busybox.nosuid, so both are extracted.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d52d00a3bb4a1ba93e88f1d24d8bb99d6aa321eb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index 2919f079392..07577dce7cc 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -6,7 +6,7 @@
 import os
 import subprocess
 import tempfile
-import shutil
+import tarfile
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
@@ -32,7 +32,10 @@ IMAGE_FSTYPES = "tar.bz2"
         # ".gnu_debugdata" which stores minidebuginfo.
         with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "{}.tar.bz2".format(bb_vars['IMAGE_LINK_NAME']))
-            shutil.unpack_archive(filename, unpackedfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/busybox", path=unpackedfs)
+                tar.extract("./bin/busybox.nosuid", path=unpackedfs)
+                tar.extract("./lib/libc.so.6", path=unpackedfs)
 
             r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
                     native_sysroot = native_sysroot, target_sys = target_sys)

