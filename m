Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1706 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Nov 2018 12:50:22 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 55B1F6D6A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EyjumUmTg4S9D5WYT+WetdQKsLs6gnLbaOPdUKE/Tw8=;
	b=BThj3fQT6nP7DrJ9LGKgIX8Ayr
	UZrVbwzRlQc2zNk/5Pvy9ZlI3fBHJXuYu93aFRrvizXa1aCxfThISkwFYLvHgn/fp0Jkq1AXTN2Vl
	Fbzm8UDiyRV0JUOiZTe231j9Q0k4TAdDlymJy7ia3foZ+RYsY1Sc2+Il5KsH68LDN2dlLnNKU7ViJ
	Y0f+t1NTYAf+2R7dlkne+XxLCqHtYD7vi78SM+rbCIJ3CEY+BkUA9JBXLdxkaKy2p6o8gqB3K4oi8
	NYFPKIY5qODgHEYR+ZkQpHPOiEDxCY4XTqgawXUcKPOX6p/189g49k5+dgliTvRDnTwAAl/EKT/Ou
	0IdvsvqA==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKa-0004Rn-9l; Thu, 29 Nov 2018 14:22:08 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKa-0005vd-7o; Thu, 29 Nov 2018 14:22:08 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:35 +0200
Message-Id: <1543494097-19534-4-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Michael.Ho@bmw.de
Subject: [PATCH 3/5] cmake.bbclass: append includedir to implicit include dirs
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
X-List-Received-Date: Thu, 29 Nov 2018 12:50:22 -0000

From: Michael Ho <Michael.Ho@bmw.de>

This resolves issues with paths being marked as system includes that
differ from /usr/include but are considered implicit by the toolchain.
This enables developers to add directories to system includes
to supress compiler compiler warnings from them.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
Cc: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fd40a98..485aea6 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -108,6 +108,10 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 
+# add include dir to implicit includes in case it differs from /usr/include
+list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
+list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
+
 EOF
 }
 
-- 
1.9.1


