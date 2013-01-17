Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvscL-0003kl-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 17:47:12 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2013 08:31:40 -0800
Received: by mail-ea0-f200.google.com with SMTP id d14so2974180eaa.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 08:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=IXDjdLTsbTyRVnc03AQQYp/b6Lna4Pumtifyi95IKjI=;
	b=MlYM6TAho05Kh7MWNdrfHc5gWVUyk1RvlOTgYHdJmQefNXm2hb54Dy+xf3pY8mK11e
	kPtLgC9W2U43rQFm3G7nqZM9ckw/ZwR6rZP/NTbe75ZCl1Kvs01GF8eIWzs0mt/Ff6Zu
	wJ8bSypeNyORxHwqqrWLXF7og/cnup+/1aAdKZwx29kq7GQ3jQqKJQY19g1T3GhNXXIL
	v0ggBJRbmf83Oz/8+ukQCiGS8YCGhvbhkLjLl85GhPs9B2Yvd/grex6qXxnSgQSL0O/H
	9De7lQlhgz378Znel5cFAFB8j12Q9i5Px/S6xRy4T5fS6LiyK9uuKjHpXSc2+sj8OunX
	hI8w==
X-Received: by 10.180.107.130 with SMTP id hc2mr16929153wib.12.1358440298977; 
	Thu, 17 Jan 2013 08:31:38 -0800 (PST)
X-Received: by 10.180.107.130 with SMTP id hc2mr16929122wib.12.1358440298562; 
	Thu, 17 Jan 2013 08:31:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm3028322wib.5.2013.01.17.08.31.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 08:31:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:29:39 +0000
Message-Id: <1358440179-32242-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkmew9QMjwgFn7pywmyC2oeBuwzrD1oarXmZwnq6j2YmNSV4PtnsJzjMhDQmXWjNNLpF14sNiJRY4pkxX5Wfys+hJ4MonMS0mh8umGloBht5AT0EzOPyurltPnx2ngDJ2Zn8PaoLI4DF4lT7bU7CP862rUwCJQwVylBwToThqRcx63Endd54UYZ8RO+vuL8w5eCFrXR
Subject: [PATCH] initramfs-live-boot: handle multiple udev locations
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
X-List-Received-Date: Thu, 17 Jan 2013 16:47:13 -0000

udevd isn't on $PATH and is in different places depending on what version of
udev is being used.  Copy the code from initramfs-framework to search for the
right udevd at boot time instead of hard-coding a location.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 0ae359d..f0d4f22 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -9,6 +9,23 @@ UMOUNT="/bin/umount"
 ISOLINUX=""
 UNIONFS="no"
 
+# Copied from initramfs-framework. The core of this script probably should be
+# turned into initramfs-framework modules to reduce duplication.
+udev_daemon() {
+	OPTIONS="/sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
+
+	for o in $OPTIONS; do
+		if [ -x "$o" ]; then
+			echo $o
+			return 0
+		fi
+	done
+
+	return 1
+}
+
+_UDEV_DAEMON=`udev_daemon`
+
 early_setup() {
     mkdir -p /proc
     mkdir -p /sys
@@ -21,7 +38,8 @@ early_setup() {
 
     mkdir -p /run
     mkdir -p /var/run
-    /lib/udev/udevd --daemon
+
+    $_UDEV_DAEMON --daemon
     udevadm trigger --action=add
 }
 
-- 
1.7.10.4



