Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC43EE20A8
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 13:57:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12095.1770386269164864488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 05:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPhOFly6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436309f1ad7so40837f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770386267; x=1770991067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDG673DUhhRqpDvSVxKkEsrxfI+8zQtJ8U2NhwE83B8=;
        b=ZPhOFly6GpsVdwvsPPE6ILORavjLacRujY3vgQeJ05ki0cG/dyKixzC7DExpsCE80y
         1DzlUKFtGy10Ea4pRhwqTh1C1FmimqHOIKghPsD5FtFDQRWMIq8veeboc0CpUyeKx+Er
         bBJKjKCYtF9ULux2l5LnkTxhyHGbFv4+3yKaZjcdeM45ogEEWoaVnzTkuGWBLadhp2Mz
         gUfGIDCYx34kv92T+ohOK9Aag++L6eFQclMF79E1y84rbOQkfOz1PfXxU6cGiv/3fqZI
         jVCYb3L2+Qt6GWAVd+JRgfLiJtr2Thprc40WSk8pPCdi1wlFL9SJNPo8f8qxurPmley5
         3x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770386267; x=1770991067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDG673DUhhRqpDvSVxKkEsrxfI+8zQtJ8U2NhwE83B8=;
        b=Dbh1+Pe8bctvE9//Xyu7azkVo3qCrecku95C7u5zqv4LjfjA0L/5XIeA5BkTP9l/Z7
         A9QbEz5AdB2bJOs4G7ha8wenqpiyeU9+XkszbN+adHu1O882EVRcQ4L8cyjNcn69HAFw
         U0unp5OIjY50KESi6wjo+Ni6CMRwMFqa3NEV3cdzOLQL4Ch7VwhCvD7vJuNXny4k+x3+
         qvfbu6QE6HZj4ZYXXCTh9yOj6INfYuxPCx+LDD8J6ey9eO8ti9SY3vlHLXIJJJkCBROw
         Qd6aftLQajLO8QQkvKxHazGfv3j8zlnaLa8ICCu5Fsqf1P6lHGdOs8YJWGnKfNPKoa+Q
         SU5w==
X-Gm-Message-State: AOJu0YxBcTzBQh8stJdkHm6du/7cFFQEzi2/wwlO9DaCyD74XNRsn7Ol
	fbCN4Pm2HDWwukdjXYMA/OM0YLSEToXkG7JG+gWr9yj8vXBDm3p5cuNNeInY2g==
X-Gm-Gg: AZuq6aIX1iB8Miqxd+PWWJf3bfHKT2vfxJN1Fd2RQU5kkAD9d7ecZ482pd72GmgTBdQ
	5geLLCMGtnWPCifh6nItpiepwiKpwA0RYF+HST3HCPVidDXTWy9DhphZIhxjAmNZ240YDnQM0UV
	gD2xeFZPXDGLfAiKBcgJgRvPrdml1xSeW35biA1wmmsnBr2EAR1xF45xW3/SeBRqhBicz5qiR0/
	XrpJebLQhMkX8/lElnwUxImJRoFGhFLvgaFvWV0oFRN6Eg8oet32m6MT/BdEhM7V3k34BvFDm+w
	0IWT19kClytuT7JLMCSdmVEVDfGLuvceDDNU2bcmOdnS+ZhpSSQ8Ay/Ey6LDwmJOWApma8hlxon
	JrBpzQhupHp/1/uXa1xvaT/h68NsQ/7WBsXPZciBURuj5W4x8Emlr7YmGzwj8I6UVJWYGCSTW3T
	QILv+cbOc6AWcM5y2pkyq5VMHv5wF9YkZOprQ2hsaU9DpAMxE=
X-Received: by 2002:a5d:64c4:0:b0:431:808:2d60 with SMTP id ffacd0b85a97d-4362924485cmr4715965f8f.12.1770386267207;
        Fri, 06 Feb 2026 05:57:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436309ed238sm253765f8f.19.2026.02.06.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:57:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] hosttools: force a --no-rosegment option if host ld supports it
Date: Fri,  6 Feb 2026 14:57:39 +0100
Message-ID: <20260206135739.106102-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 13:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230622

From: Alexander Kanavin <alex@linutronix.de>

Please see https://bugzilla.yoctoproject.org/show_bug.cgi?id=16087
for the tricky, unpleasant details.

The summary of the issue:

From Fedora 42 onwards, the --rosegment argument is passed to the
linker by default when building native binaries. This triggers
re-arrangement of sections by patchelf, resulting in binaries which
are loaded incorrectly by older kernel versions. These "contaminated"
native binaries end up in sstate and cause build failures when they
are used on older distros such as AlmaLinux 8 & 9 or Rocky Linux 8 &
9.

[YOCTO #16087]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/base.bbclass | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index cf303c237a..22b427a521 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -111,6 +111,22 @@ def get_lic_checksum_file_list(d):
             bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
     return " ".join(filelist)
 
+# Please see https://bugzilla.yoctoproject.org/show_bug.cgi?id=16087 for details
+# This can be removed after host distributions with kernels < 5.18
+# (e.g. rhel 8/9 and derivatives) are taken out of testing and support.
+def write_ld_wrapper(srctool, desttool):
+    wrapper = "#!/bin/sh\n{} --no-rosegment $@".format(srctool)
+
+    stdout, _ = bb.process.run("{} --help".format(srctool))
+    if "--no-rosegment" in stdout:
+        with open(desttool, 'w') as f:
+            f.write(wrapper)
+        import stat
+        st = os.stat(desttool)
+        os.chmod(desttool, st.st_mode | stat.S_IEXEC)
+    else:
+        os.symlink(srctool, desttool)
+
 def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     tools = d.getVar(toolsvar).split()
     origbbenv = d.getVar("BB_ORIGENV", False)
@@ -139,7 +155,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             if os.path.islink(srctool) and os.path.basename(os.readlink(srctool)) == 'ccache':
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
-                os.symlink(srctool, desttool)
+                if tool == "ld" or tool.startswith("ld."):
+                    write_ld_wrapper(srctool, desttool)
+                else:
+                    os.symlink(srctool, desttool)
             else:
                 notfound.append(tool)
 
-- 
2.47.3


