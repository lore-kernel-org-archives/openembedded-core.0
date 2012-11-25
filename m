Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TcxZc-00035U-RB
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 13:14:07 +0100
Received: by mail-qa0-f54.google.com with SMTP id g24so3748254qab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 03:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZlLxtSrQEH6UkqJ56J5ZorcxnERluzX/cT5RFH2fMus=;
	b=pq3d+ifG8rPs34ljZ9jwFlMTdzR/DQaO3Ml16mmg8WdnOmKHqcNzho5VHrkCzmaSTh
	MRrnQHvcX2ialHDB9YXtfqQ+e+47j5WjvYfQFR1LF1Lojxba59GaHWKYP3WgraC09S3+
	Crb+Lp8XCe6NnJb60UwplyyxcTKurtNLbeCvikwEdPNh9IvHaWdpP1N4BqV0xabU+bZM
	Zv9cZED8zhdY/cMCu1EJ4VX3/6zqEOZYpaVy2YEvtalPXPZkYXm2TFP0qYfXe3wVRBwP
	G/yoeByuBoPfFAYMtv/f3M1xx8JTEyuAzGSb1IxPTaAk5rt7mfqctKrSwLlik0dLz6Cp
	1u0Q==
Received: by 10.229.106.76 with SMTP id w12mr2254068qco.66.1353871511946;
	Sun, 25 Nov 2012 11:25:11 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id hw8sm7427056qab.9.2012.11.25.11.25.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Nov 2012 11:25:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2012 17:27:27 -0200
Message-Id: <1353871647-15156-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] initramfs-framework: init: Stop mount warnings during boot
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
X-List-Received-Date: Mon, 26 Nov 2012 12:14:07 -0000

For a completely quiet boot using recent versions of utilities, the
/etc/fstab and /var/lock need to be available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index fc4b0db..0be8f4d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -68,8 +68,11 @@ MODULE_PRE_HOOKS=""  # functions to call before running each module
 MODULE_POST_HOOKS="" # functions to call after running each module
 MODULES_DIR=/init.d  # place to look for modules
 
-# initialize /proc and /sys
-mkdir -p /proc /sys
+# make mount stop complaining about missing /etc/fstab
+touch /etc/fstab
+
+# initialize /proc, /sys and /var/lock
+mkdir -p /proc /sys /var/lock
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 
-- 
1.7.10.4



