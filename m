Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7600EE20A3
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 13:28:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11130.1770384499872586593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 05:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuqiCglt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so32012265e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770384498; x=1770989298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8zGjzyihVPGjoaYF13le6PEXIIay56XeBB0LE1m++8=;
        b=NuqiCgltPM381jTJ3gMRG3+vxK/6I7lOWQpSyNYVwa/H95N9yvSw0FW54yqbrTSSSq
         92TfaLi7mmJewhDzjcKPHan44b0kYX/YgFGmf6Ng9acwhFummFtROI0xf+X93T8RvH33
         0EvyY/Brv5574YWvMJXmuYZNT1MEqv8pCZl7TWTcERCjD816zCMxKCh7lLVXWMTVMuDm
         7D5GckCWndx0egWAppJLP2u79G5IsZvBfryRqACV7+gBV3WdRB0RklMczfHMXZYKSnog
         zx4DhuxtuWBJ97u0mRfmOU4OCiak1DMjlUPKtFs3ZDvhz89enPhVeI7spdSONxbKKuOZ
         mU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384498; x=1770989298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8zGjzyihVPGjoaYF13le6PEXIIay56XeBB0LE1m++8=;
        b=H/KljesSWD3BiI828elaiajUsq1fwvJAPsPyRUzVaoV2TDXgl23TtM3TfuKgVfkCdl
         5w5v8+B03em45iWnRAofblFkrgsnj2Y9dOtf36M1ncUyD18SLNUY26o/xNf9+cqWq9+4
         mNWNh0i43US099Axg/6HIcRRX5jeaAqILqIDMicy98rFT84fiBEwBeDDephmK8IrOYnT
         vKTWidQ5/20t6sPyDMAvy+Z7I3+Fn+2Coo50nF4zo3kUq/RZFEKHZHqm6bfJCs3ev9yz
         V6PYTufm8Xx2NztqgEEL2n3JwDkzeJVYgKiOErJWpnKyPlw4vMYDsY1AIpRCmBXj48KT
         /ioA==
X-Gm-Message-State: AOJu0YzIr6psnAX587a4D+bNaOcPo6u1zI3ySUh0/VpF4Ys/nSAPA1Ru
	N0dAHz6gf6fbS4aNL1anAyPyEkRve4dDObFZTRY2VXCyiZ4kZuUgNBnlGhVGqQ==
X-Gm-Gg: AZuq6aJoqUAGnVuv7OT5KebXbHQFHh4Vec/WcE8K0k7xFDRn6gbZQsd+GhrXAHoUH6Y
	SPTX4Qra3U1WA8nsv/s7jdZdvARv1cGFitWkSvJvZCviiWDZ9bzMzB6S0LMDaq4p7u96fuhdux2
	bPJWd3dowxgK5ET8RVM1uqaA/CLhtngRxc1/O7JTPN9r8j3aDxdjNOLRMrPnn58d2fFREsRYXHr
	AbQUhptpeALcNQ3z9scTBm5zWdrM3OrYVmjPQ2JcQBOWQm4AneJkL+t08UxOrXcN+jdqz81s51o
	ArAtV0DxZH+Al6tfKSQrZfqFyHQFYCRRQiqGwkMQVoRMLLlAeFpuoJps/ARjFfGb44Lln1KPuFE
	GysxQRGJvYi1ZM5pLvuD4YFmADCWuVzGTRlwQSTUFA2tiMuec8Uc/u+amCyM15iGamZEMyLGUC/
	w/UqgYPOa5kLhhwmrNDl0sDEk2hulQBHhxi7in+ejKKmXPvdA=
X-Received: by 2002:a05:600c:8b56:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-483202311acmr35134715e9.22.1770384497933;
        Fri, 06 Feb 2026 05:28:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a99asm139627965e9.11.2026.02.06.05.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:28:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] hosttools: force a --no-rosegment option if host ld supports it
Date: Fri,  6 Feb 2026 14:28:11 +0100
Message-ID: <20260206132811.100628-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 13:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230620

From: Alexander Kanavin <alex@linutronix.de>

Please see https://bugzilla.yoctoproject.org/show_bug.cgi?id=16087
for the tricky, unpleasant details. This is addressing an issue with
recent Fedora distributions where they can contaminate sstate with
native executables that don't work when transferred onto alma/rocky 8/9.

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


