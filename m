Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UcoVP-0005Nk-VT
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 05:05:29 +0200
Received: by mail-pa0-f41.google.com with SMTP id rl6so2076178pac.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 19:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=i+64HULGehdItPUf6VLV2nnIQV27Ja5OfeVwgqzF1VY=;
	b=zE6kyHh+4pHI8HtUUegDV4eIBln8fRLoQ4WcLjHlDYUpXIuKAUYJQdOHedHokdolIr
	OvWZYN0bmi9kiST7inT5BkVTF/YBNpZF0FTNPhGY7Q06IhffkCD3j//XOXey/4E6w0MP
	E7akwuhj/YSR84Lno2ZKpWFXKQ+aLMr8dK7AF53j3+UVuF1C64Of+Qe28pMjeWY4IQhz
	5jhwJVE8gyaCHpXYXzKHA7oPDPaSK/+oPvX77cMjaJk5Z0u2uVLbVUaUIMJPYEhu1sAr
	mtWsSHMfbYNgjh8GwwE/a/pNyOk6J1RgiVwc9Lc9g6A7nFigRof64FymXcGAX5g5dzSs
	IZ2A==
X-Received: by 10.68.189.164 with SMTP id gj4mr40884357pbc.193.1368672429809; 
	Wed, 15 May 2013 19:47:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vu10sm4858236pbc.27.2013.05.15.19.47.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 19:47:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 12:59:47 +1000
Message-Id: <1368673187-20121-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] systemd: fix ordering for machineid and run-postinsts services
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
X-List-Received-Date: Thu, 16 May 2013 03:05:35 -0000

The remount-rootfs.service unit has been renamed to
systemd-remount-fs.service in systemd v183 and later.

The run-postinsts script writes to /var/log (a symbolic link to
/var/volatile/log), so systemd-tmpfiles-setup.service is added to After=
in run-postinsts.service to ensure /var/volatile/log is created before
running the script.

[YOCTO #4490]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd-compat-units/machineid.service     | 2 +-
 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units/machineid.service b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
index cab8f76..f586c6d 100644
--- a/meta/recipes-core/systemd/systemd-compat-units/machineid.service
+++ b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
@@ -2,7 +2,7 @@
 Description=Machine ID first boot configure
 DefaultDependencies=no
 ConditionPathExists=|!/etc/machine-id
-After=remount-rootfs.service
+After=systemd-remount-fs.service
 Before=sysinit.target
 
 [Service]
diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index da6fe76..02c1d86 100644
--- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -2,7 +2,7 @@
 Description=Run pending postinsts
 DefaultDependencies=no
 ConditionPathExists=|/etc/rcS.d/S98run-postinsts
-After=remount-rootfs.service tmp.mount
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
 Before=sysinit.target
 
 [Service]
-- 
1.8.2.3



