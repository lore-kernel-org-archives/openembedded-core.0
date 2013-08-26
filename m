Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA9ED6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 06:43:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q6hf61001862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 23:43:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 25 Aug 2013 23:43:39 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Aug 2013 14:43:54 +0800
Message-ID: <c2a824978312335e761499cd810acbd3812d2091.1377499381.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377499381.git.Qi.Chen@windriver.com>
References: <cover.1377499381.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] checkroot.sh: check for conflicting configurations
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
X-List-Received-Date: Mon, 26 Aug 2013 06:43:40 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

In our current boot scripts, two ways are used to determine whether
the rootfs is read-only or not. One by checking the READ_ONLY_ROOTFS
value in /etc/default/rcS, the other by checking the /etc/fstab entry.

From a normal Linux user's point of view, the way of checking the
/etc/fstab entry is preferred. However, as there are several boot scripts
that need to know whether rootfs is read-only or not, checking /etc/fstab
in each script brings too much overhead. Thus, these boot scripts
use the READ_ONLY_ROOTFS value in /etc/default/rcS.

In normal use cases, there would be no problem, as both /etc/default/rcS and
the /etc/fstab are modified at rootfs time. However, if the user changes
the mount option for rootfs in /etc/fstab to read-write, and he/she forgets
to change the value in /etc/default/rcS, there would be unexpected results.
For example, the udev-cache would still be disabled.

So at a minimal, a check for conflicting configurations between /etc/fstab
and /etc/default/rcS should be added in checkroot.sh so that there would be
reasonable warnings if users have configured the system in a non-consistent
way.

[YOCTO #4880]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/checkroot.sh       |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index cf84cfa..dfee2af 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -54,6 +54,16 @@ do
 done
 exec 0>&9 9>&-
 
+# Check for conflicting configurations
+if [ "$rootmode" = "ro" -a "$ROOTFS_READ_ONLY" = "no" ] || \
+	[ "$rootmode" = "rw" -a "$ROOTFS_READ_ONLY" = "yes" ]; then
+	echo ""
+	echo "WARN: conflicting configurations in /etc/fstab and /etc/default/rcS"
+	echo "      regarding the writability of rootfs. Please fix one of them."
+	echo ""
+fi
+
+
 #
 # Activate the swap device(s) in /etc/fstab. This needs to be done
 # before fsck, since fsck can be quite memory-hungry.
-- 
1.7.9.5


