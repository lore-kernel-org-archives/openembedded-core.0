Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D489772882
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:06:50 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so7573310wid.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JkaJwC0g+xAiHBFG82agcxEzQ63efV0QDC3AH8WvIWw=;
	b=hoanWoaIv4LMgtLJSnY+s3LoXyVCvrT3+sEU1KuGXERXRqzuAKo7JNUeJ5N7/3F65e
	Kw1yuiftYCiIWTM9zzyOaKHKWQ1yBih5KrUiHplt39qB40/V1q/9vf4ofCWRwmDIb4ze
	scOqffCu0IPGIQyIM/JVVkZhERM1bMdgvtVZBs4SVpqMMa159A0sy+XiVt4Gukk/7Ku4
	PW//VHiVr7tTzWfkTOpqpflNbuLu7kAUuWr3PRENsrBDXnGV7LpPdayD0k8RfXYrJmPB
	RBcvUx1YMsizkzhbmWRHpkmKkGhzjLttRzsEBAekSoOjDUzPYd+0QMgSzOvy/k3LNaoe
	rfUA==
X-Received: by 10.194.238.104 with SMTP id vj8mr6590682wjc.107.1420639610131; 
	Wed, 07 Jan 2015 06:06:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t12sm2272660wju.19.2015.01.07.06.06.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 06:06:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 15:06:49 +0100
Message-Id: <1420639609-3198-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1420639609-3198-1-git-send-email-Martin.Jansa@gmail.com>
References: <1420639609-3198-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] kernel.bbclass: fix do_unpack function when S ends with slash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jan 2015 14:06:52 -0000

* slash at the end causes os.symlink(kernsrc, s) to use s as
  directory name and fails with:

ERROR: Error executing a python function in /OE/build/owpb/webos-ports/meta-smartphone/meta-samsung/recipes-kernel/linux/linux-samsung-tuna_git.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'base_do_unpack', lineno: 26, function: <module>
     0022:        subprocess.call(d.expand("mv /OE/build/owpb/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-samsung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/git/ /OE/build/owpb/webos-ports/tmp-glibc/sysroots/maguro/usr/src/kernel"), shell=True)
     0023:        os.symlink(kernsrc, s)
     0024:
     0025:
 *** 0026:base_do_unpack(d)
     0027:
File: 'base_do_unpack', lineno: 23, function: base_do_unpack
     0019:        bb.utils.mkdirhier(kernsrc)
     0020:        bb.utils.remove(kernsrc, recurse=True)
     0021:        import subprocess
     0022:        subprocess.call(d.expand("mv /OE/build/owpb/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-samsung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/git/ /OE/build/owpb/webos-ports/tmp-glibc/sysroots/maguro/usr/src/kernel"), shell=True)
 *** 0023:        os.symlink(kernsrc, s)
     0024:
     0025:
     0026:base_do_unpack(d)
     0027:
Exception: OSError: [Errno 2] No such file or directory

ERROR: Function failed: base_do_unpack
ERROR: Logfile of failure stored in: /OE/build/owpb/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-samsung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/temp/log.do_unpack.17042
ERROR: Task 0 (/OE/build/owpb/webos-ports/meta-smartphone/meta-samsung/recipes-kernel/linux/linux-samsung-tuna_git.bb, do_unpack) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3b77d00..5541c94 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -43,6 +43,9 @@ python __anonymous () {
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}"
 base_do_unpack_append () {
     s = d.getVar("S", True)
+    if s[-1] == '/':
+        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
+        s=s[:-1]
     kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
-- 
2.2.1


