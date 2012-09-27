Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THFAv-0008Mv-0A
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 16:34:49 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2012 07:21:55 -0700
Received: by wgbdq11 with SMTP id dq11so1231930wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 07:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=P1EJ/bHwvj4rWuGdYqZ6UR5rDOUEd4fcECR7064iXp0=;
	b=T29JRJFgKEM0A9qkCGf+6JvGjGrg55AI2ZDdJx+mRHrQ45Leqjsi4yleOO5ty+MWcR
	qLkmdJf/gZTJ5D+lisFDma4dQ2EV160X8mCoWgihN9iq45ZHNtgvxtWYOh5IFS0IjDj6
	ENlP0pEx8EDS6x4C1rOE0JZSk8UUegJKya5PTgt6tSEgm4nFMS0LTYqF/puT4V+b6j4e
	ZVRyBxnMp6QIwZCaX18ifpxB+GO98ikZqPEPfVBrQ3aDHwzIWyxc09fA12ck8dBa9yIO
	m1/aydi1oXZwdZBrQVwQGD8iHvAJYXq9bMt66TD3wlw9RQ7fnl5y+24fWVbDJQ57z1HE
	FS3Q==
Received: by 10.181.13.239 with SMTP id fb15mr8737243wid.22.1348755713603;
	Thu, 27 Sep 2012 07:21:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm13426611wix.6.2012.09.27.07.21.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 07:21:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 15:20:51 +0100
Message-Id: <265e1e50186d5982b40d87f37f0662a0e09a7daa.1348755513.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1348755513.git.ross.burton@intel.com>
References: <cover.1348755513.git.ross.burton@intel.com>
In-Reply-To: <cover.1348755513.git.ross.burton@intel.com>
References: <cover.1348755513.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnl7bWTIUwAvWCInPWkQJu7FdzCeGg3Rvt9uSrBql46r5Fs0/4AOY9CEGB7j7wElupFSqo5
Subject: [PATCH 2/2] initramfs: Make mkdir not fail
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
X-List-Received-Date: Thu, 27 Sep 2012 14:34:49 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

This patch make "mkdir foo" not fail if foo already exists.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index fb7af31..2639308 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -21,15 +21,15 @@ ISOLINUX=""
 UNIONFS="no"
 
 early_setup() {
-    mkdir /proc
-    mkdir /sys
+    mkdir -p /proc
+    mkdir -p /sys
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
 
     # support modular kernel
     modprobe isofs 2> /dev/null
 
-    mkdir /run
+    mkdir -p /run
     udevd --daemon
     udevadm trigger --action=add
 }
-- 
1.7.10



