Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 27A267557F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 22:34:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p14-v6so6682417pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NlLvqMtfxPQQHWCfHIGLtHUlTaXtFsYmTaIx61BGY24=;
	b=h18EkjXkAZZrWq0GW7eZnqrIEdU0JujJvp6G3jv4Wb5IKjc2UGjBjsN4i51JVcCzZJ
	i1ELWrdTUojg3UgGveWYZweyrdqkUR3q7klD6DNILcOoq0VE5TSaoPeqKgrpsXaWMHsA
	E/of6gR6Ir7AChYbNZiLvTEY67XTk/xVietLrqn3saJjtHZk78YuioeOegbZIBGF1wqO
	FsV63t1aVaECMOd/gKqqmIja63/aujp8xmxqxZ47cRSLVr54NEQ8kROFMy3v9O5UgGO5
	Gy7gORmI0OrxzB9AbdZp4VAYJrEyiU4YR4iW3hObA/ijG4ZlmBK6XoRdQtCztZLK7zcB
	r/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NlLvqMtfxPQQHWCfHIGLtHUlTaXtFsYmTaIx61BGY24=;
	b=ub4Id8nhmiz1JsEoqz2QNjfWUdFsDoBuMRLHj3mnhSJ88HEflTe1O5elCUFs3yV23r
	sJqsf1qr96Kg+Io/y69HfTPFnT7fthB1UvcQtYfZoCItsALldiI6co4xJcRONotSZctI
	l1g8agjKZDzBPVReVOBfbHgibwUREfMwDUgli7o3TuPb3rG4lfhyKSk+5LrKLr/TRHuZ
	RJjWjweJ0lpI6K+ZAPgBwyO3yilhhr7e3rWMk45mWyOa6nlgYxKBQHDxDVnJHcIq1F1g
	AQdA8vcERMU5gtBgEPs91wEx+cZdAV2d7uw+2bSaw8t2uUEtgurIhBxRWfN+37fK7H1P
	tbOg==
X-Gm-Message-State: ALKqPwdpjg6KDL8jQci4cFs3sAdKhI+m2qmy9XmHDR0HZzFdCkjDQHzc
	tSwDWvMU7arA9TkESQO7Z8kS7Q==
X-Google-Smtp-Source: AB8JxZoPoP1++kJte4WvEHPm8DW0/M+w+pNTkZ/8ZS/94fI3000MYHX07+7qnWl/PlwmW4FGxDu9aw==
X-Received: by 2002:a62:104a:: with SMTP id
	y71-v6mr12077779pfi.188.1526337248857; 
	Mon, 14 May 2018 15:34:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h23-v6sm16996863pfi.175.2018.05.14.15.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 15:34:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 15:33:50 -0700
Message-Id: <1526337230-25723-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] kernel.bbclass: avoid duplicates in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Mon, 14 May 2018 22:34:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if KERNEL_IMAGETYPES contains both vmlinux and vmlinux.gz,
KERNEL_IMAGETYPE_FOR_MAKE will end up containing two copies of
vmlinux, which will result in two calls to "make vmlinux" from
kernel_do_compile().

Avoid duplicating vmlinux in KERNEL_IMAGETYPE_FOR_MAKE plus some
minor non-functional updates to formatting and comments.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 v2: refresh + make typeformake a set based on suggestion from Martin Hundebøll

 meta/classes/kernel.bbclass | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6595a04..68d2185 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -62,32 +62,36 @@ python __anonymous () {
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
     types = d.getVar('KERNEL_IMAGETYPES') or ""
-    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     if type not in types.split():
         types = (type + ' ' + types).strip()
     if alttype not in types.split():
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)
 
+    # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
+    # by the kernel build system and types which are created by post-processing
+    # the output of the kernel build system (e.g. compressing vmlinux ->
+    # vmlinux.gz in kernel_do_compile()).
+    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supported
+    # directly by the kernel build system.
     if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
-        # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
-        # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
-        # is built (such as using gzip to compress vmlinux)
-        typeformake = types.replace('vmlinux.gz', 'vmlinux')
-        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
+        typeformake = set()
+        for type in types.split():
+            if type == 'vmlinux.gz':
+                type = 'vmlinux'
+            typeformake.add(type)
+
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(typeformake))
+
+    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
+    imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
         typelower = type.lower()
-        imagedest = d.getVar('KERNEL_IMAGEDEST')
-
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
-
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-
         d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
-
         d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
-
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
 
     image = d.getVar('INITRAMFS_IMAGE')
-- 
1.9.1


