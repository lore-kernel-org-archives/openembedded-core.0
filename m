Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7320074BEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 19:13:58 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id y10-v6so1494649otg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/W9K0iNnLWdx5KBTHyPgQzCj1rHMDby+KjZvagwBkYw=;
	b=o7prbzW67+0OvbsD0vie7GaM9wHW5WRu2T6c+OhD28Wujvf2wQ7flgwvL67Fnv6WfG
	aYcMKlVprrL/CNWP2LMypDiE+fpF0Z0aXnWL1lXeOlFj5FiQ3Usa0buF22vocWWPG8Fx
	xiOlVvLIhfGGqwccOXap6et8TUyNnmpbw4/8sz8W4dhUF6NVqihKomAJY1lscOebNGOK
	KMubvWmn9rBZp+tzDeptZC3C77x+GaByasJJBK/jMl1VrkaMdfRyLvnk/7s36Ir9TQRa
	ntXZEo3fqqo8ctqBQvXqBDBuVRqlNNMREI0N/ox0BY6cElLbYHkD9EDmeNMLaKxZq6fa
	0vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/W9K0iNnLWdx5KBTHyPgQzCj1rHMDby+KjZvagwBkYw=;
	b=huxMRevP5/Y4VHBpluTaInIlybQpRdDPEhOmO9Tpq7JTh2Q3zNMHXG+K+AOqK+B6T9
	iMIn3fZCWVZ1hWbdjNoYWTeRP72rJ0j6Uyqub61Zw+YSsm/yF1CCgkcLcbNWTX2848Zf
	0zafVcmU8jeEVJyNj/hfqIbw30/Xi3t2HrzL9HCTJDnmx5Zs/CCOSVElWLUAKJrk8JNH
	MD1VcV4jNHzk/T0YVIpq3xDXciIvJhNLa6nQzlTbeYLZDdZ/pbKuZaREpyr7j7hC8CLG
	x9djDy7ZOb7LUvqs/XGN/29Oh1sKZnGlUt9N6t+XnsLCKkS2MvPWr4jWv4ec1T8djm0r
	X0OA==
X-Gm-Message-State: ALKqPwfILZbJuLT8HDQSRzSuGHsid8/x9KJ3sMfRKpGjBmGOa5I7zbjU
	QQe4veWFBKiaUkiWPCp02tOjXg==
X-Google-Smtp-Source: AB8JxZqKiLJKst9jOAXniTl44fqL7RFb9mBHFl2mZ97TL/12/5e5IMUBm0yLqQaZCAYy28WOAvbZ2w==
X-Received: by 2002:a9d:48c6:: with SMTP id
	a6-v6mr11085665otj.359.1526411639042; 
	Tue, 15 May 2018 12:13:59 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s101-v6sm425868ota.25.2018.05.15.12.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 12:13:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 12:13:51 -0700
Message-Id: <1526411631-28651-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] kernel.bbclass: avoid duplicates in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 15 May 2018 19:13:58 -0000
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
 v3: ensure ordering of KERNEL_IMAGETYPE_FOR_MAKE is deterministic

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
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformake)))
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


