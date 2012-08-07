Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyefH-0007n0-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:57:19 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1114468eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=fxRgSJ+St4mfznPXMGxmk3I8h7g3NA58BFOAOL6F0xo=;
	b=jqAt/0lEg0QnQSaKdn+4U4nK12GLiVFRGDcUQaOnC6RzyuhDQD7OkzVfrUjnLafbFu
	+5E+zZBoS9YToaH/KaYAAY2+Xt1YM4jHEgOvVJ4ZuKr5uy5SJGT7ucHrZ29WjjXwwYl4
	pqg6DbTpARTM5gwq1vuND1S+HsdnU3VB5ghNJr8nvH/egs7omzd/gPv/H5j7nxUsMT41
	NCXFrYuV/rENpJ/aQaJPOJIAJC6AR5M/7ZdAf4qmwKHO2oQelz+THLuS8OWvP2Url10b
	5znqd+tm0ae6KDQGPttF0NugEb88M2i0wXz/z+WKyvp9MrjHd3A41L8n5xO8Vhbt9yhh
	raRQ==
Received: by 10.14.210.132 with SMTP id u4mr2175907eeo.6.1344325536433;
	Tue, 07 Aug 2012 00:45:36 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a41sm39615890eep.7.2012.08.07.00.45.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:45:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:44:46 +0200
Message-Id: <1344325488-20479-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnREQlqUIdkf3JnDeoNHfAb819BLI33oVL4v11NmVeViPajJklcQjUiUf8EDkitec9nvBny
Subject: [PATCH][for-denzil 6/8] image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed data to file
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
X-List-Received-Date: Tue, 07 Aug 2012 07:57:19 -0000

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



