Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 43F0B7E584
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 10:09:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JyyZ467sz2Y
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567073382;
	bh=y59uvejm5axaHBAI6PRkMST2A4OK3bTVmVU4lRLrN9g=;
	h=From:To:Subject:Date:From;
	b=Vl84d66GKKlQBq9jwKgBXnMS5tWDfJqB5RTEiN5+gKhz5dEikO6xOkyHBPvFnYK8W
	9KXjku2927ZHDCiCjciKI/bQ6R8uiRXGH0rPAl8r/6KI842rUK2jSN2aUe/fgJ8pYd
	H4aIwProBQ5SP/CKhf5sXe5VWDMauU5Qq2xTxnqBeJsnDZZ01ovkBNmEDQghtyoDDI
	BKqiCsFwHxzCp9W5gNzn9Y+IR+snm4U52ghNAO+xefCuP+v2yYp86/XVJxrMJ0DZ1T
	9ZGeKjgkW07nJU/6lY/UgPA0n5GE/j9a8Wqm0vevKspE6vxpdhb/PXa2wfpKLSoMXE
	2IFZ+YvXHvvtXlqhX8n4zD+2lEdZnYpnurFeYYB5Dxf7r7xoqifetq8KgRWsVTGqPN
	wpD6Jbi4sLN+7XQ5qkJnrGUHUjvZt4Ybj+PVv4538Sh/9NN/XEZ3JF/VVQp7aqcCEl
	CXGaqL0uHKoPgk1yAAYrZyptz0UVjGpUoDHvqxjoJjLftoc3nfHRNNa/dlzVFx9r2S
	DXF7HJxWLLNR74wWYzzP7tGhobyuRyzaPmHR5KDdl5+84dD32gVwexD3T0VkEMwyKy
	tAQniY96QNUMN8S7z/B3vGrCMapKivyxoa70uBKgHoLlU1YtFi/fEC1C+FKztD5YPK
	UYKU83XA3UZfC0A3fFRBtpQY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2019 13:09:41 +0300
Message-Id: <20190829100941.12733-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libxcrypt: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 10:09:42 -0000

| In file included from ../git/lib/alg-des.c:66:
| ../git/lib/alg-des.c: In function '_crypt_des_set_key':
| ../git/lib/byteorder.h:24:1: error: inlining failed in call to 'be32_to_cpu': call is unlikely and code size would grow [-Werror=inline]
|  be32_to_cpu (const unsigned char *buf)
|  ^~~~~~~~~~~
| ../git/lib/alg-des.c:81:13: note: called from here
|    rawkey1 = be32_to_cpu (&key[4]);
|              ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
index 893f5e7379..5270e58c2b 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
@@ -26,8 +26,8 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* \
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
-CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
+CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
-- 
2.17.1


