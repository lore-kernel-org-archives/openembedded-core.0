Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrkfE-0004r9-2Y
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 08:56:44 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1431924wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 23:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=fxRgSJ+St4mfznPXMGxmk3I8h7g3NA58BFOAOL6F0xo=;
	b=HwT10zTlho0DSHbCc5rj60O+yMGe3PwMJiQpgaUYQn+lbcph43+mUX7TX9rk0JJTkb
	M3+iU6nPVVEkWXmfyqzncHtcnRbcy1fBfXz1Ji3Zy+ijtWp3TiwU2Xtham3qaoc5e4Pu
	1KCgpweQZuIv9WIwAG0uoSG7R1ZhMiVApAlkl7B/DNKpDT2G6hjDqRxbooMJTZM4uYx5
	+zZ15ps/odepUViYB5s9P8Ii6MDuA8hXpaeee5ZEUMPjBlvgi+/4RxwKe+VBaRMym/Lu
	LzDLtXrRnjJ34+HLBjscw9j9H9HfhaNr82Ao52ZncuS5nZGvNFC4tXmDah0/d6lVfeUS
	RAkw==
Received: by 10.216.90.19 with SMTP id d19mr410399wef.113.1342680324774;
	Wed, 18 Jul 2012 23:45:24 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k48sm2964193een.10.2012.07.18.23.45.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 23:45:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 08:44:44 +0200
Message-Id: <1342680286-12886-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
References: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm+IzhZhpJXoGIPhaoVeHuBsAChjqgGL5bxI5vakmS/F9stSAAniwgexApjdewG/GpeKM10
Subject: [for-denzil][PATCH 3/5] image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed data to file
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
X-List-Received-Date: Thu, 19 Jul 2012 06:56:44 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Having -c modifier makes xz to output the compressed data to stdout. In this
way the needed data will be in the do_rootfs log.
Redirect data to ${IMAGE_NAME}.rootfs.${type}.xz .

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b590ae1..007c8a5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -215,7 +215,7 @@ COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.10



