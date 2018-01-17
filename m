Return-Path: <robert_joslyn@selinc.com>
X-Greylist: delayed 1037 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jan 2018 21:30:16 UTC
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id F206878726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 21:30:16 +0000 (UTC)
Received: from pps.filterd (valiant.selinc.com [127.0.0.1])
	by valiant.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w0HLAUxj002460
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:13:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=from : to : cc : subject : date : message-id; s=SELinc2017;
	bh=QHhyI5Ogz8Fz/sIwzWG2hADM8rqi1fNtRgnPZpbY7vw=;
	b=ug6qUgObZYm5iUqB5wrZX6xkWueHbT2eHXg2y+aSPNvXX74QyxWhC5dvltsWprUe/uNQ
	CrsVH73/2Von7TcofZMp744rMOe5ZXptTdUzXR+XT9ZXJw2mqOVORZqDJXjbq/n6ORXD
	Nm7s/mA5zZR3EqTKVidjHGQdfiAolSqopQSZ/TgowZ5BozEslV1KDggNlC5MzLQRGJrv
	TTzCd3ViPL3B9DvHdC6+2eFTUPFOjIIOo1CVjXI/IGBeupv/vnfnEeAWqbJWp/86ooTQ
	RQs8vzasXNXUu+TKmuljM1lAqZNPu0/0FK4eP+7em45TIKZdiw5bCQ9hzZ+NsejIcpp6
	2w== 
Received: from edison2.ad.selinc.com (mail.ad.selinc.com [10.100.0.115])
	by valiant.selinc.com with ESMTP id 2ffh2tsg5k-1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:13:00 -0800
Received: from robejoslpc.ad.selinc.com ([10.202.51.92])
	by edison2.ad.selinc.com (IBM Domino Release 9.0.1FP9 HF139)
	with ESMTP id 2018011713130083-726139 ;
	Wed, 17 Jan 2018 13:13:00 -0800 
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 13:12:34 -0800
Message-Id: <20180117211234.18578-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.13.6
X-MIMETrack: Itemize by SMTP Server on Edison2/SEL(Release 9.0.1FP9
	HF139|October 06, 2017) at 01/17/2018 01:13:01 PM,
	Serialize by Router on Edison2/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 01/17/2018 01:13:01 PM,
	Serialize complete at 01/17/2018 01:13:01 PM
X-TNEFEvaluated: 1
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8777
	signatures=668653
Subject: [PATCH] grub: Fix device mapper dependency
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
X-List-Received-Date: Wed, 17 Jan 2018 21:30:17 -0000

The lvm2 recipe in meta-oe was split, so the libdevmapper library is
provided by the libdevmapper recipe rather than lvm2.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
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


