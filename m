Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id F2D79727DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:49 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so28990931pdb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ErueefPCUeXJmiuQA0dnnexl8sRAh5u/lWM2LfkLUrQ=;
	b=h6K8RYB+/ucTMWIX2+whSWnRja/28EAiPSBK4kYsoxcXm9XBKJE3QB2wR6SL4NRuyP
	9VysGt8saL8L7jNrVKEXpQu07dU2FBj6Y/pncpto5wWJlIUFY9OXQtlZXLuK8sfqObCt
	FZtE1qVkM4tTr3HcHHlwzzKwGsIoUcjCO08i9w/E1FaLKIVZ+j8/AXpZ1upOhx91d4yq
	4w+5jPSlucJNHKZjglPhRil2zrqLl8zKs9zT+gbimaq62S+XtmUK1LQx+7YRw9AARq+x
	3lzxUjZgJiay6iA44RdAhAzsEAtNhn6Wcc5dxqUNqMCUELsrCGUThvN3a7UUNkcUcQEC
	jJaQ==
X-Received: by 10.70.37.166 with SMTP id z6mr147754967pdj.102.1420490450494;
	Mon, 05 Jan 2015 12:40:50 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:38 -0800
Message-Id: <2225954ddcda5a8283c7ef4d1ddde87338a150e3.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 04/12] image: Avoid race over directory creation
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is a race over the do_package_qa task and the do_rootfs task
since rootfs recreates a directory. This patch disables the task
(which isn't used for images) to avoid the race:

NOTE: recipe core-image-minimal-1.0-r0: task do_package_qa: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Started
ERROR: Build of do_package_qa failed
ERROR: Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 497, in exec_task
    return _exec_task(fn, task, d, quieterr)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 440, in _exec_task
    exec_func(func, localdata)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 212, in exec_func
    exec_func_python(func, d, runfile, cwd=adir)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bitbake/lib/bb/build.py", line 237, in exec_func_python
    os.chdir(cwd)
OSError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/qemumips-poky-linux/core-image-minimal/1.0-r0/core-image-minimal-1.0'

(From OE-Core rev: 0550d112ad9c2ca9f8167dcae35200210923f2c5)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6bbfaf8..326fa9b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -410,6 +410,7 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 do_package[noexec] = "1"
+do_package_qa[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
-- 
1.9.1


