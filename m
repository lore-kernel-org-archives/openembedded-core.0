Return-Path: <robert_joslyn@selinc.com>
Received: from scamp.selinc.com (scamp.selinc.com [74.117.214.142])
	by mail.openembedded.org (Postfix) with ESMTP id 8060060119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 18:31:38 +0000 (UTC)
Received: from pps.filterd (scamp.selinc.com [127.0.0.1])
	by scamp.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w17IVXYb023063; 
	Wed, 7 Feb 2018 10:31:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=from : to : cc : subject : date : message-id; s=SELinc2017;
	bh=dKwfJFSRi/sxnn1ennfVFexj6Z4Wz2dN56kbe/NmvSI=;
	b=m4SmKJSN0jBk1aIBFibMZo3atAWefS4UySF611RFFWbh/mV7kTKuoPycNyQDya4F6xVG
	ttYxTwc5CuGYXLpIhZOaQHJkme5T9e2IQ+URNlVmgUzmjB5JU36SUMvmJko0V49lyTW/
	VcSWgjpf1BQzXBppFX80SCtExP+SM3EP6Um3Wp79Fxtg7jBYbzowewkzlyElaSxaZRyb
	jSBAyHyCduhetM3JPPjEop0cvtXT8jwsUJxVdxR23UlHWWQXjJhjy9i05gk1HV8vBfl0
	F5QE36//jaky0ZrsO2DIhMblMgPXBt/JOpAchfM7NyKcoWnfyA3p5oW9Npn/R/zdtt3U
	MQ== 
Received: from edison2.ad.selinc.com ([10.100.0.115])
	by scamp.selinc.com with ESMTP id 2fwbx47f76-1;
	Wed, 07 Feb 2018 10:31:39 -0800
Received: from robejoslpc.ad.selinc.com ([10.202.51.92])
	by edison2.ad.selinc.com (IBM Domino Release 9.0.1FP9 HF139)
	with ESMTP id 2018020710313865-219880 ;
	Wed, 7 Feb 2018 10:31:38 -0800 
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 7 Feb 2018 10:29:43 -0800
Message-Id: <20180207182943.26372-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.13.6
X-MIMETrack: Itemize by SMTP Server on Edison2/SEL(Release 9.0.1FP9
	HF139|October 06, 2017) at 02/07/2018 10:31:38 AM,
	Serialize by Router on Edison2/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/07/2018 10:31:38 AM,
	Serialize complete at 02/07/2018 10:31:38 AM
X-TNEFEvaluated: 1
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8798
	signatures=668663
Subject: [pyro][PATCH] grub: Fix device mapper dependency
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
X-List-Received-Date: Wed, 07 Feb 2018 18:31:38 -0000

The lvm2 recipe in meta-oe was split, so the libdevmapper library is
provided by the libdevmapper recipe rather than lvm2.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a93c99e6c9..e3409b9250 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -53,7 +53,7 @@ inherit autotools gettext texinfo
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
-PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
+PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,libdevmapper"
 
 # grub2 creates its own set of -nostdinc / -isystem / -ffreestanding CFLAGS and
 # OE's default BUILD_CFLAGS (assigned to CFLAGS for native builds) etc, conflict
-- 
2.13.6


