Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpO4S-00028y-6a
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:25:05 +0200
Received: by ghbz2 with SMTP id z2so2534863ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 11:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OKumogI/khK162zodrPcaO6KmTLLr/KMAYRqAxmgqEo=;
	b=bqTK1xiWaV30LpP2uc7sY//U1h9Ko+XWDQIQpD/dVx050OOel9UZmh2th7dqMtF+GO
	DN1JGlacd6fIQruzDu59PVRAOUS91U9acsbUhYYZB6jTedc+i0S3lKlkuILoH1qSVczM
	447NUf1A52SQGUDouomo48FvH3bmOVR5p3i4Jd/SWOhBsGYLizWYRCJPiomOGS3VKy7L
	AlLvQYxmhlsHrudJiwwYVJLwBSI5CvKWpcCC7wX7hONUGC6Ch4gTqnTN/owBa9VzBUcI
	WHgpMaOAp0tOge6jHnwEVbwWkwYO1MRKCyuPsDAza1XlfEeuOX2Nch0CP718BsS/DrRJ
	Z+VA==
Received: by 10.50.236.71 with SMTP id us7mr18386667igc.16.1342116825787;
	Thu, 12 Jul 2012 11:13:45 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id if4sm35476igc.10.2012.07.12.11.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 11:13:45 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 21:13:35 +0300
Message-Id: <5f8d84b63b15ef27f5bad8187db54cdd7d55fea6.1342116650.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342116650.git.andrei@gherzan.ro>
References: <cover.1342116650.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn3vKkH0zJRr+wc40+hIiEHBy9MA+egcJLUT7B9L11s3aosCvnodjVgKwNMo+nqdCdPM2K1
Subject: [PATCH 1/3] image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed data to file
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
X-List-Received-Date: Thu, 12 Jul 2012 18:25:05 -0000

Having -c modifier makes xz to output the compressed data to stdout. In this
way the needed data will be in the do_rootfs log.
Redirect data to ${IMAGE_NAME}.rootfs.${type}.xz .

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5734edf..0e79820 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -236,7 +236,7 @@ COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.9.5



