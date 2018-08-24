Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 61B46795DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bGSS3H1b6oPrGXhS3tqf1/RXVkT96/nrX5eBMKwXkiA=;
	b=sNIhJslOTkicqXOS5eULe6Y7mR
	X+WqsLPif8oD/iFLNW0yLLCAalYAejzU8R7Mcb9iy/Oww4ImF4wuTre3Kj74rjr4BTkHkrbRyw6Tx
	JZCzYxrcRCIEYu6zgPS5Kt196qsNKb+3Dxr0uu6F3FfIfXdktOA427hEXRMREH4+5jZJ+IbZgm2u3
	EU+FiX8zra9Snip/UJJ6glI13nUKlg92KrH+tiF+I1A65y0PD6Mg9YSvhWNtPOtrFYy+2ew6oNPS3
	q2dJPPEpAydyBhQdYwNp2MSd8JANd7kaFvH8Ql56/xh1Sj+ZJxHitYT43EfEgNj46Cxjwj5pWU5ZT
	eKz3gQLA==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1ft7rm-0003ll-KA; Fri, 24 Aug 2018 11:54:51 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ft7rS-00013Y-Gx; Fri, 24 Aug 2018 11:54:30 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 11:54:23 +0300
Message-Id: <1535100863-3331-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] nss: fix postinst script for nativesdk build
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
X-List-Received-Date: Fri, 24 Aug 2018 08:54:51 -0000

It's better to refer to binaries in postinst script with
full path which also works on SDK when
/opt/nativesysroot/usr/bin is not in PATH.

Fixes install of nativesdk-nss:

Configuring nativesdk-nss.
/var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not found

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-support/nss/nss_3.38.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
index f3e5170..90b6933 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -227,13 +227,13 @@ pkg_postinst_${PN} () {
             DN=`dirname $I`
             BN=`basename $I .chk`
             FN=$DN/$BN.so
-            shlibsign -i $FN
+            ${bindir}/shlibsign -i $FN
             if [ $? -ne 0 ]; then
                 exit 1
             fi
         done
     else
-        signlibs.sh
+        ${bindir}/signlibs.sh
     fi
 }
 
-- 
1.9.1


