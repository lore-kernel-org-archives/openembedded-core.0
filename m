Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Txtk6-0002pN-19
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 07:23:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N67tpO007363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 22:07:55 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 22:07:54 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2013 14:08:04 +0800
Message-ID: <3f7ab91ee6c5f7e36bfbd0e600d4aaf6c3fbedd7.1358919866.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358919866.git.Qi.Chen@windriver.com>
References: <cover.1358919866.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] init-live.sh: move /media/xxx over to the real root filesystem
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
X-List-Received-Date: Wed, 23 Jan 2013 06:23:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the /media/xxx which contains the root image was not
moved to be under the real root filesystem. Because of this, the
output of the 'mount' command is somewhat confusing, that is, it
has some mount point that is not even in the filesystem.

Besides, on some machine, it caused the recovery procedure when we
booted it next time.

This patches fixes this issue by moving the /media/xxx over to be
under the real root filesystem.

[YOCTO #2064]
[YOCTO #3705]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index f0d4f22..4f8618b 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -82,6 +82,8 @@ boot_live_root() {
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
     mount -n --move /dev ${ROOT_MOUNT}/dev
+    # Move /media/$i over to the real root filesystem
+    mount -n --move /media/$i ${ROOT_MOUNT}/media/realroot
 
     cd $ROOT_MOUNT
     exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
-- 
1.7.9.5



