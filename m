Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DCAC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 09:43:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.18490.1739958190172941826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 01:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FVpEKYgt;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439950a45daso10262105e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 01:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739958188; x=1740562988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GEZ6ax/PajB1Nxjy4Qc4JS75uIFesD/2w4/SYSB2inw=;
        b=FVpEKYgtnBSCq2676Ovs2OIP08zshWspeb3ua94Ti+FGpFKmqCkfU/3kXiJC172wNu
         VzilaNxSDe2BGnRR871wLkLd8o/IsUpMstwSEkzwC2ClSO/JnqnAD5GoDAahDdLCD57t
         YihMHH5Je6+YAHflQ+khTQ38BOOsj0iKJzhyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958188; x=1740562988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEZ6ax/PajB1Nxjy4Qc4JS75uIFesD/2w4/SYSB2inw=;
        b=O3bcVa00HVMZLkWqtGFGOwWJXJcoMJN5OcScfF4YLXSHRc6AM96vHQ94vEJ5Dq1p0a
         hj4FK4IPhqTJdiyTSfT/oGEUB5sFHiCLrqxwnOhfh9jvr40mRsjwlju1vUTBMqpsy5Wj
         SE7Mz2dE73E1yFybP8F+V0uvRgdfrn0+lR13pfbu84GAmC0LZKyMIwtfjhcjiMXaEX0V
         4uyLpFbUxCSn7ghvW/3OabQpxBZe8i18waYsRtpGWz9vNiun1IlAbjP/87AEi0Zwjaas
         ktO071Z6JYYJujLfI8HgvqoX94m3icH6cZyUhGWYLVfNmnJk4LqMbB8I+kYVfGxDycWd
         IGWw==
X-Gm-Message-State: AOJu0YyB3Fzwymh3fanizyT++qZF1CDua0RX9CfeDFPV22SMxqcht4YW
	i9Uhc0JFfotfUZqg3W7bMme/30cdEklda7h7+yztLfOdrf5A6fKcixG934nE57sGMOZtBtq0DWm
	b
X-Gm-Gg: ASbGncs/xpZCOTopV2+VgtgClvUlwH1klTt6M/6ZXho6LC6PwMRmC8C9lNXeR7lcx7V
	6jsblDKhjP3tKdY0/I090lCMZmu1EQcJuPXIPI5u09KpeQwy6jgU+t74MyjFbXwgXrIBUV1YiVX
	mXQfCY+Z+XHjDGeQaU7VRxAtqz573E5aD7keCK9ppwIpL7me2h3GdQUCmm6FX3DUPH0Em9hfTJR
	IN9Vv61NhxtTcIEkc4ye79lp2jhl/FOz0BSLaD72NLkr2OyMaBMcHy9KPdGK2nvnFY/8XSEmuow
	/+e7mkw7kCGagtjJ23Ljo+xuo6WcMcsNMSHE6LioXjFYXcTh3B6BLUFgRNI0VwoWBfGXmDiLpu4
	76kCEiwnf2o93AaTNnGiH33Qf
X-Google-Smtp-Source: AGHT+IGDz0nDxbHK2Sdwrdna9xwT/uU6O8W7cF0Cn5c/zxRJme+BiPWuGMURqFp9ob4RcshodT2EEA==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-4398c806da5mr75672005e9.21.1739958188320;
        Wed, 19 Feb 2025 01:43:08 -0800 (PST)
Received: from FRSMI25-BPYTOP.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b431fsm17163887f8f.2.2025.02.19.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:43:08 -0800 (PST)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [PATCH] sanity: Check for non ascii chars in TOPDIR
Date: Wed, 19 Feb 2025 10:42:40 +0100
Message-ID: <20250219094239.3283023-2-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211693

Some modules (like Perl's MakeMaker) do not support non ASCII
characters in build folder's path, which leads to task failures.
A sanity check is added to warn the user.

Fixes [YOCTO #15764]

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 meta/classes-global/sanity.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 66693fc9b9..5d33ef9d73 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -299,6 +299,11 @@ def check_path_length(filepath, pathname, limit):
         return "The length of %s is longer than %s, this would cause unexpected errors, please use a shorter path.\n" % (pathname, limit)
     return ""
 
+def check_non_ascii(filepath, pathname):
+    if(not filepath.isascii()):
+        return "Non-ASCII character(s) in %s path (\"%s\") detected. This would cause unexpected errors, please use a ASCII-only path.\n" % (pathname, filepath)
+    return ""
+
 def get_filesystem_id(path):
     import subprocess
     try:
@@ -719,6 +724,7 @@ def check_sanity_version_change(status, d):
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     import stat
     tmpdir = d.getVar('TMPDIR')
+    topdir = d.getVar('TOPDIR')
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
     tmpdirmode = os.stat(tmpdir).st_mode
     if (tmpdirmode & stat.S_ISGID):
@@ -785,6 +791,9 @@ def check_sanity_version_change(status, d):
     # The length of TMPDIR can't be longer than 400
     status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
 
+    # check that TOPDIR does not contain non ascii chars
+    status.addresult(check_non_ascii(topdir, "TOPDIR"))
+
     # Check that TMPDIR isn't located on nfs
     status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
 

