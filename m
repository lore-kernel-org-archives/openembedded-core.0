Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BB0537D5AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44q7dF5YYCz4R
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 20:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556129394;
	bh=q4nrGc+PDEdOpZk7oXa6MKnhXocDJP79wZxiZk4atBk=;
	h=From:To:Subject:Date:From;
	b=tHj7KPcMqxU2jheL9qYd6ZrwM7oW5Ww2TUhmRYzVG8BahGSvHR8TRu7mF+hyL5PeI
	ac/P5Z/SqUn33QGduIkRuMS/HNanMSUv+vn3iW1aMN7E7XlKBsedSDoi3jgCJ1yvYL
	6SgOqGpDJ2hj3XrCOTC79rDihRtlac8yPVjxAcWINW7FX9GnEckCCyVucv0xct/doy
	hzWetrqyo9Ia/OxirUk5qNsFi+ccLjqF3hvuXv5jFkE2gyHDHeEawTG4TpCi5LKMJX
	BsiJQRv2Msz0jP+GrEsD3UE6h92yTaKPu7qG9QfBEqQi9r6rOUv1v4ifbHEMqFsDbk
	9nc8r4YZAheBYtU7nj42xqBMSlpx9FmjaAbD/wEXC0Ezs2+48k3Za8mO/xDS3AF/nP
	tRtbdmGuLVxdMxzECj7s9QNknnAxgEi25EIsIANVSl+8d221fRgheaq9LCCSAyVl6o
	3bV7wN3HOaJ0F94R6HbwLxW/Jeu7G/d1MAjrUlaXETAmU7LatmCrFdW9i3GNZLzQ0m
	uDAEwC56Y4wSpeRnGPLv1hAMmJ5UA9oYU+xuksMWH19IepGhofJctL87n5UfsowXjh
	fSO/lmsz5mhqa/conxmQBWamtE2yk6dXvh4zWEMHgaKJmUq81vZZQHC7y75VVisC7A
	7KyI4MIszYk5+XOvB/UGVYJI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:09:52 +0300
Message-Id: <20190424180952.19762-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Use the best xz compression for the SDK
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
X-List-Received-Date: Wed, 24 Apr 2019 18:09:54 -0000

It saves 23% space for me, and decompression time is also shorter.

Compression time and xz memory usage should be less of a worry
for the SDK.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ebc30d39b3..efaa5b99e9 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -226,7 +226,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | xz ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | xz -9 ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
-- 
2.17.1


