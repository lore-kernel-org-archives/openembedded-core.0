Return-Path: <robert_joslyn@selinc.com>
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id 26AEE6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 18:27:53 +0000 (UTC)
Received: from pps.filterd (valiant.selinc.com [127.0.0.1])
	by valiant.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w17IQukS023094;
	Wed, 7 Feb 2018 10:27:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=from : to : cc : subject : date : message-id; s=SELinc2017;
	bh=6HuBn21ZKhrSoKnNXnyXvdauAEP3Fcx257vRGfB4Sc8=;
	b=lD1np6S/NDaaXZTIiNCaQPdpjSOj4jFOX98vHZ+Er4qjHcGU/TqVUenSrGbM9CyJke7W
	2n4Isukb53Mh8zxwIpd77UzQs93vwdvObmAAIbIz9sHvNoh6ICtI1fSVeSHcH49xyqDB
	Al1ipfoz76QyK0KpJR94WoonMXV9NG5Bgb7NqFrdyr3Cn7eNey+TyZj+kR9cTlU1zEVg
	nrmTRf1uXVwcEkJdwSHrqyeV33ceHoscXm5V4SZ7FY8jYLqUoa+ef3LzZVyxE3plRAu4
	kfn2GArIjFU17nYz1jWAFmPivEh8XOooKG+6kvZxR3YdPoLuc9skDBLba4sZWM48+ufK
	ZA== 
Received: from edison2.ad.selinc.com ([10.100.0.115])
	by valiant.selinc.com with ESMTP id 2fwc1v75em-1;
	Wed, 07 Feb 2018 10:27:53 -0800
Received: from robejoslpc.ad.selinc.com ([10.202.51.92])
	by edison2.ad.selinc.com (IBM Domino Release 9.0.1FP9 HF139)
	with ESMTP id 2018020710275321-219593 ;
	Wed, 7 Feb 2018 10:27:53 -0800 
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 7 Feb 2018 10:27:05 -0800
Message-Id: <20180207182705.25862-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.13.6
X-MIMETrack: Itemize by SMTP Server on Edison2/SEL(Release 9.0.1FP9
	HF139|October 06, 2017) at 02/07/2018 10:27:53 AM,
	Serialize by Router on Edison2/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/07/2018 10:27:53 AM,
	Serialize complete at 02/07/2018 10:27:53 AM
X-TNEFEvaluated: 1
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8798
	signatures=668663
Subject: [rocko][PATCH] grub: Fix device mapper dependency
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
X-List-Received-Date: Wed, 07 Feb 2018 18:27:54 -0000

The lvm2 recipe in meta-oe was split, so the libdevmapper library is
provided by the libdevmapper recipe rather than lvm2.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 28f96bb162..5bc7bf6f13 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -47,7 +47,7 @@ EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
-PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
+PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,libdevmapper"
 
 # grub2 creates its own set of -nostdinc / -isystem / -ffreestanding CFLAGS and
 # OE's default BUILD_CFLAGS (assigned to CFLAGS for native builds) etc, conflict
-- 
2.13.6


