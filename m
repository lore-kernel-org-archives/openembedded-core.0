Return-Path: <justincapella@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id BD72B7258C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Dec 2014 23:40:40 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id p10so16087407pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Dec 2014 15:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pKY2txHjfuUwMlQ/u2TlYgWj+r4qIo7AO4hjjNZbhuw=;
	b=XCvSyn+ZvVyBCOFEBOPNcjIytYdJnqRNE8QgP/zgYH3ANFf+ykMmX2MVrTdvOn/2sZ
	uzI9SI4LRby1BDi0P52fUyMKRLrF9udRisdCnG28jz5K+nOCgyNKaApivygwHYi9NcZr
	92XWmsvsddh3Itsa6h6rlzR/8x9KiX8IkmXQnUYOlRa1a67by/iNgRT0RcONtZRLLSX1
	igtW7STpGUagiKTeDJDpQEbS6baye0Vg3lIG7KmtvsYXhl5U5RPgy+CT3+JKx/ZCYlpL
	NAMw32e2b/LuIlzBbakNzLelQzTHgCqc5S1lsoiYtWXUY03E6PHaCfs8Mv+RMerGHeOU
	Fxqw==
X-Received: by 10.70.130.205 with SMTP id og13mr85251867pdb.72.1419810041408; 
	Sun, 28 Dec 2014 15:40:41 -0800 (PST)
Received: from ninjalappy.localdomain (c-98-255-226-244.hsd1.ca.comcast.net.
	[98.255.226.244]) by mx.google.com with ESMTPSA id
	xq16sm34090707pac.31.2014.12.28.15.40.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 Dec 2014 15:40:40 -0800 (PST)
From: Justin Capella <justincapella@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Dec 2014 15:40:23 -0800
Message-Id: <1419810023-4230-1-git-send-email-justincapella@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] wpa-supplicant: avoid host contamination of drivers by libnl3
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
X-List-Received-Date: Sun, 28 Dec 2014 23:40:44 -0000

(See patch refrenced from OE-core rev: 1c3beda0015da9a0fec2581af7645c9ea122c7e3)

Modifies do_configure to inject DRV_CFLAGS variable into wpa_supplicant/.config which is then included during make of drivers.

Signed-off-by: Justin Capella <justincapella@gmail.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 2bc9339..6f0de3c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -41,6 +41,7 @@ do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
 	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
+	echo "DRV_CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
 	
 	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
         	ssl=openssl
-- 
2.2.1


