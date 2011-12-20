Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd56U-0005Cm-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 20:11:59 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so4037925yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 11:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=N2HMGbk2okCWCou2xuDcTmePDAyFrSmdXRsYCt4yfVg=;
	b=UVR+j24w6ne0rvynLoWQRiRMKRK8PN6dewk9kC07yOp1S9wyHVipSLsQIly9XRhhx5
	UFlsk4NGctSTQfOLqWQAvDUNQKTEYs46b58sWetlLyM5Li4viLvLp5WpGnmsp1KpeGGy
	0gwBAlLgroFkv1INXjmoR95POaKiz4pfYf+78=
Received: by 10.236.156.5 with SMTP id l5mr5894581yhk.29.1324407895666;
	Tue, 20 Dec 2011 11:04:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm4771379yhl.9.2011.12.20.11.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 11:04:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 19:04:13 +0000
Message-Id: <120e5fbf9d945fb2f918c265f831a6c2d947b1a6.1324407759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
Subject: [PATCH 7/9] udev: use 'echo' instead of 'echo -n' in init script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 19:11:59 -0000

Avoid using two stage progress output to avoid text garbage during
parallel boot.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init   |    3 +--
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index a2b6f53..7bc6488 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -26,7 +26,7 @@ kill_udevd() {
 
 export ACTION=add
 # propagate /dev from /sys
-echo -n "Starting udev"
+echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
 LANG=C awk '$2 == "/dev" && $3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
@@ -67,5 +67,4 @@ else
 	/sbin/udevadm settle
 fi
 
-echo
 exit 0
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c89eab4..6d71f4d 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



