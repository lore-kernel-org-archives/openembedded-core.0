Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UST3n-0007LV-ME
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:10:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Apr 2013 06:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="296264262"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2013 06:52:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 16:52:32 +0300
Message-Id: <1366206752-26309-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: fix mount issue
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
X-List-Received-Date: Wed, 17 Apr 2013 14:10:08 -0000

When the mount command is not given the filesystem type to mount, then
it will try all the known filesystems. However, when a filesystem is not
supported by the kernel, the mount function call will return ENODEV.

The following patch, ecd90bc6aa63da2aef2513ac090d4b426b2b719c,
introduced a problem because it bailed out on ENODEV too. Instead it should
have only bailed out on ENOMEDIUM.

[YOCTO #4308]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
Saul, Khem,

Would you guys give this a test? Mounting should work just fine now and my
tests didn't show any issues. I didn't test the 'fail on no media' case
though... If you can quickly test this, it would be nice.

Thanks,
Laurentiu


 .../busybox/busybox-1.20.2/fail_on_no_media.patch  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
index aa2cd25..6745f16 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
+++ b/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
@@ -23,7 +23,7 @@ Index: busybox-1.20.2/util-linux/mount.c
 +		 * Break if there is no media, no point retrying for all
 +		 * fs types since there is no media available
 +		 */
-+		if ((rc == -1) && (errno == ENOMEDIUM || errno == ENODEV)) {
++		if (rc == -1 && errno == ENOMEDIUM) {
 +			bb_perror_msg_and_die("mounting %s on %s failed", mp->mnt_fsname, mp->mnt_dir);
 +		}
  		if (!rc || (vfsflags & MS_RDONLY) || (errno != EACCES && errno != EROFS))
-- 
1.7.9.5



