Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 12DBB731DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:13:15 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id c192so117454208lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+0JrnkLxzM8uqNv1++5vSOEKcBz1g4elZXu3VrHvUUk=;
	b=OnhDHHwJwOjHU0Zq6fQcDygkE5cDlQu/L62AtdAQQSjSHyI0j2JV+o+zRwgPUyeH2A
	KdDnxCC70zyIP9XyWEkleXaqp05TIkIV7ke5RGqChmENw0HSBNYD4NlFhdP5TJqcvRhM
	UQojLy4CtrJZ/J4CS8v+fLyivqiaieHfkXjUSH1d5F0dRVfNOQM6vwEYGIEowYZTw4LU
	9NEiVDq0QUzRVxdoFkFNTLofF6LW3uMcyi7PBxXfoq8Url/aom1nxIlXJ9YBNEYKEFDs
	1S8ylaip4V7Kklb+1ZWFAinFpLK5PoHPgc0Yl8hdRzGM0957/HOhJHKNrL3JZ52B7Ove
	Aoyg==
X-Received: by 10.25.90.13 with SMTP id o13mr21564246lfb.114.1451999595881;
	Tue, 05 Jan 2016 05:13:15 -0800 (PST)
Received: from localhost.localdomain (m77-218-242-32.cust.tele2.se.
	[77.218.242.32]) by smtp.gmail.com with ESMTPSA id
	a124sm9615341lfa.40.2016.01.05.05.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:13:15 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 14:12:43 +0100
Message-Id: <1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Tue, 05 Jan 2016 13:13:16 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It makes no sense to install a initramfs bundled kernel image since
do_package does not depend on do_bundle_initramfs at all, otherwise, it
leads to a implicit kernel-image package depending on do_package run before
or after do_bundle_initramfs.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..d1ca614 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -179,10 +179,6 @@ do_bundle_initramfs () {
 		kernel_do_compile
 		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
 		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
-		# Update install area
-		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
 	fi
 }
 
-- 
1.9.1


