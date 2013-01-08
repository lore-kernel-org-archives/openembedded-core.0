Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TsVMf-0004CA-29
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 10:20:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0895kqO000746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 01:05:46 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 8 Jan 2013 01:05:45 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2013 17:06:05 +0800
Message-ID: <239f0850af3e3f0ed83263e4306420f4f0684088.1357615514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357615514.git.Qi.Chen@windriver.com>
References: <cover.1357615514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] runqemu-internel: add 'debugshell' as a default kernel option
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
X-List-Received-Date: Tue, 08 Jan 2013 09:20:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add 'debugshell' as a default kernel option for ramfs booting.

If rootfs.img cannot be found under /media, init-live.sh loops
forever without showing any information. Silently looping forever
and blocking users is inappropriate.

Now that the 'debugshell' feature has been implemented in init-live.sh,
It's reasonable to add it to the kernel option when booting a ramfs-based
image. In this way, the system doesn't loop forever and instead drops
to a shell after a default timeout (30 seconds).

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index a11220d..9d570ed 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -472,7 +472,7 @@ fi
 
 if [ "x$RAMFS" = "xtrue" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
-    KERNCMDLINE="root=/dev/ram0"
+    KERNCMDLINE="root=/dev/ram0 debugshell"
 fi
 
 if [ "x$QEMUOPTIONS" = "x" ]; then
-- 
1.7.9.5



