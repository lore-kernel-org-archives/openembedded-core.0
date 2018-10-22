Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61AA6746A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:07:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9MC7P8R019774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 05:07:26 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 22 Oct 2018 05:07:25 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 19:58:38 +0800
Message-ID: <20181022115840.38029-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181022115840.38029-1-kexin.hao@windriver.com>
References: <20181022115840.38029-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] udev-extraconf: Use the canonical file name of systemd
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
X-List-Received-Date: Mon, 22 Oct 2018 12:07:25 -0000
Content-Type: text/plain

The new version of systemd has changed the symbolic link between
/sbin/init and /lib/systemd/systemd to relative. So the output of
the command 'readlink /sbin/init' become:
    ../lib/systemd/systemd

Then it causes the following check of "/lib/systemd/systemd" to return
false. Fix this issue by using the canonical file name of the systemd.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 067d4e2a16fb..34ef98a6a882 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -4,7 +4,7 @@
 #
 # Attempt to mount any added block devices and umount any removed devices
 
-BASE_INIT="`readlink "@base_sbindir@/init"`"
+BASE_INIT="`readlink -f "@base_sbindir@/init"`"
 INIT_SYSTEMD="@systemd_unitdir@/systemd"
 
 if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
-- 
2.14.4


