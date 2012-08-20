Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3QCv-0001oU-Au
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 13:31:45 +0200
Received: by weyr6 with SMTP id r6so4069952wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=udVVygQK3aWGFRfDYJTfLcIdIQis0wnK0V6i1FQ4YL4=;
	b=da8A6m15w/e2IrhIMJPxxDIo87P+2Tu5kXPXrpz6dj9wgESx/7Z+KVbDQEJCD1KOQ4
	CPTgk+Jjwx2bwxlFFdj8WPdzIwvClxsLIIdhcJcamVxxYUSyJwip2yMNg7Dz2H93KxsZ
	pW41fFP9OWT90vtkGL2mnGLFKOoVeUg+HJhNAhANmc//Y6DTW6q0YuQrqumhheYKwnLB
	ygj280laZa20jbfzoduhXRXxUFpYe7gg27ox8bdnBE7Uv7rdkRRExk4uViiUuEZDZi3T
	MomHOyWV2Uk1G6fHFZI7OvkL1ge0yOr+oibyuyCfOsUkeKya5+yCBMJKiCrKTrCdw+B5
	OZdw==
Received: by 10.180.20.204 with SMTP id p12mr28293615wie.7.1345461583072;
	Mon, 20 Aug 2012 04:19:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm27543401wib.6.2012.08.20.04.19.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 04:19:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 13:19:44 +0200
Message-Id: <1345461584-24086-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] kernel.bbclass: Preserve generated headers only if they exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 11:31:45 -0000

* I have 2.6.37 kernel without this directory and do_install now fails
  after 813256bf7bb6e26d542d5f769e2802564116ebe5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b24ab1a..f34e632 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -191,8 +191,10 @@ kernel_do_install() {
 	if [ -f include/generated/bounds.h ]; then
 		cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
 	fi
-	mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-	cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+	if [ -d arch/${ARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+	fi
 
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
-- 
1.7.8.6



