Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SskUF-0005PC-Le
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 02:57:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6M0k5EK020340
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 17:46:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 21 Jul 2012 17:46:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 08:46:03 +0800
Message-ID: <1342917963-2253-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] busybox:udhcpc: fix the root_is_nfs() function
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
X-List-Received-Date: Sun, 22 Jul 2012 00:57:32 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2788]

The system will be hung when udhcpc starts, if nfs is mounted
at "/" directory and default route is different after starting
udhcpc.

The cause is that root_is_nfs() does not work after kernel-2.6.37,
since the device name has been changed from /dev/root to
${IPADDR}:${NFSDIR} on /proc/mounts. which leads to remove
the default routes to nfs server,

Now we use a loose match to check if rootfs is nfs.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/busybox/files/simple.script |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 27368f0..dc2121d 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -10,7 +10,8 @@ RESOLV_CONF="/etc/resolv.conf"
 
 # return 0 if root is mounted on a network filesystem
 root_is_nfs() {
-	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
+	sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
+	grep -q "^/ \(nfs\|smbfs\|ncp\|coda\)$"
 }
 
 have_bin_ip=0
-- 
1.7.4.1



