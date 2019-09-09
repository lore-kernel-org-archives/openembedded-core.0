Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 416747EDDD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 10:25:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46RknX12R8z4t
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 12:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568024720;
	bh=uSFAO7Giw5Ze/4cDF+kCLHi1UPx7zlcbRSrm+lmY+kY=;
	h=From:To:Subject:Date:From;
	b=mOViYceiw89fB2b71+BlMtljCPK3wzwRdIOkjlKtN0D34BX3or35SKaIv50AHrv2j
	Mt4FiInCDSfN1oX97/3hQ3NJDDz73VzHraTKAPJEt8g3+YgaxxV3Za4jzTWgJGePbu
	mlSYVGgDWKEWNdSKa72e4xkEflGOd0tXiuIaTx9cAlxt6SZzEsFr+/AXpg7cn8qr3m
	RkrZupMp6rgXopZTEwBAY7XnRTTnGJLorFPmTJZotJMK01fE0sHbmJTJ3cwv92wCsk
	2fdCs5MIOn0/WCeYzAik7FgbVDv3se+6y99WsJlhZWFUFjw6eMRExWg3BvGTGMf/Mm
	L861mmYxX2hRIqr4arJT2PmcrWZamG5kxMB1KbXGMH84O7P5rmm19mDa8hEWz/rFiH
	uTVKZvBnQL0wDsruM3/g1aPFlZCv9wsL2Yl9Dd5lN1vk5Yg4Lop8AnaWwRX1zFiFZ/
	TpWQqkQnf9c+/k4cLypfNOLwbUU5tB8NtyUUSM38tIPZsK+QVqm5QCHlb9280QjWCb
	UGaJLKDHGuA5GsYEwZsh1YYMIrZVjsEztwdEoauikBqddOZE3r3gXuwrUnrZRSM4vg
	PzdP71nwfB3pCsE+tCKEW+DOpfRJgsgxKtaPWGo20JkTaRxX1kznnNwAl3/3TAejEc
	3+RLV8W3tnXEcXyowyNdezH4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 13:25:19 +0300
Message-Id: <20190909102519.30418-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libxcrypt: Fix the build with -Os
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
X-List-Received-Date: Mon, 09 Sep 2019 10:25:21 -0000

| In file included from ../git/lib/alg-des.c:66:
| ../git/lib/alg-des.c: In function '_crypt_des_set_key':
| ../git/lib/byteorder.h:24:1: error: inlining failed in call to 'be32_to_cpu': call is unlikely and code size would grow [-Werror=inline]
|  be32_to_cpu (const unsigned char *buf)
|  ^~~~~~~~~~~
| ../git/lib/alg-des.c:81:13: note: called from here
|    rawkey1 = be32_to_cpu (&key[4]);
|              ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.bb b/meta/recipes-core/libxcrypt/libxcrypt.bb
index 3b9af6d739..a712e72914 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt.bb
@@ -24,7 +24,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
-CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
+CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


