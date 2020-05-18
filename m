Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.45351.1589817646991793902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04IG0E1f013200
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:00:35 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 18 May 2020
 09:00:04 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] classes/image_types_wic.bbclass: fix racing risk on rootfs
Date: Tue, 19 May 2020 00:00:03 +0800
Message-ID: <20200518160003.7429-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Since wic image creation will temporarily update rootfs/etc/fstab
to add UUID (*temporarily* means rootfs/etc/fstab will be recovered
after wic image creation), there is a potential racing risk with other
image creation (such as tar, ext)

Such as UUID was unexpected in tar.bz2's fstab:
$ cat unpack_tar_bz2_dir/etc/fstab
...
UUID=219B-2933 /boot vfat defaults 0 0
...

Explicitly make do_image_wic depend on other do_image_XXX (listed in
IMAGE_FSTYPES except do_image_wicXXX) to avoid potential racing

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 96ed0473ee..79bafeb818 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -25,6 +25,7 @@ def wks_search(files, search_path):
 
 WIC_CREATE_EXTRA_ARGS ?= ""
 
+IMAGE_TYPEDEP_wic += "${@' '.join('%s' % r for r in d.getVar('IMAGE_FSTYPES').split() if not r.startswith('wic'))}"
 IMAGE_CMD_wic () {
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
 	build_wic="${WORKDIR}/build-wic"
-- 
2.18.2

