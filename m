Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id EDE9B65F37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:15:48 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so10936587pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rZTv+qK49DRfDeojAZf1OcVRRkqRFoVTr5nMYOHQMJ0=;
	b=sIbvSig4LAiDEyBmg02n8YNI2ib+rXyDHKWLFH5gj72lcwFDZgPmivzZaJLgk8RGHo
	ks8UC5senvC9O24scA1lDClonISMAP/JY63sb5SoROwIl+qF6x4vSox9y05qgpGNIaw+
	2A5b40cxlcQBjK3a3+wjKzGvT/BSqAtdaYjT4ONOMHCnQGXU6UOtVVGMyVVGr1VaPwhw
	YGl2K29MwM25PoWKbl6nRGISvk1fXCMkOK9Wl2xx5bdUheeOBdp8yElU+i0/CYW4W/oU
	zG80pxrpIKd329zuHWIMNTf7O1N6ZXIEV3Xrystz5ZwLEu6CUWiyfxKDIiBjIubGB6UL
	dFwA==
X-Received: by 10.66.100.170 with SMTP id ez10mr40957637pab.12.1407752149724; 
	Mon, 11 Aug 2014 03:15:49 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	v15sm16817326pdl.33.2014.08.11.03.15.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 03:15:48 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 15:42:42 +0530
Message-Id: <1407751962-13365-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Mon, 11 Aug 2014 10:15:49 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This is needed to deal with the situation where we're using ipk packaging, so
opkg-utils must be built regardless of what update-alternatives provider we
prefer. The downside to the current implementation is the need to adjust
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that way.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 693c216..6fe04ea 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -19,11 +19,15 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python"
+PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+PACKAGECONFIG[update-alternatives] = ",,,"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+        if ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'false', 'true')}; then
+            rm -f "${D}${bindir}/update-alternatives"
+        fi
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
1.8.4


