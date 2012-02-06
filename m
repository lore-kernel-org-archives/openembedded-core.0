Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RuW6n-0004z0-H9
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:28:21 +0100
Received: by yenr5 with SMTP id r5so2534728yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Xq0zt09GK9tZKo5lPHD+5I4ktiQkxSalbkcSTdLDp+U=;
	b=XFHNW0ieDWg6xMOBEmkO3rJEN2TC3OuHHpIZbcYIFmfVKlyuD1RXovfl2eaNUr5Xq7
	HiEpJInNPZWWqc4Af8xeFEXrDDkajgcOMCHwBw3AGRvV05sfE0hzYowCeiLdvizD2ZSW
	aXHTVsKQbNOPKXmlDaKsuci+IZCW9yCSST9zQ=
Received: by 10.236.75.198 with SMTP id z46mr26990259yhd.45.1328563219518;
	Mon, 06 Feb 2012 13:20:19 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id u11sm37999299anc.12.2012.02.06.13.20.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:20:19 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:20:11 -0600
Message-Id: <b1e91fad932b1294e2df4f190ab7733b5ef22c30.1328563142.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] external-csl-toolchain: fix mtd-user.h issue
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
X-List-Received-Date: Mon, 06 Feb 2012 21:28:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

The use of __packed, which isn't defined in userspace, caused busybox build
failures.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 7dd8da2..e81559a 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -60,6 +60,7 @@ do_install() {
 	rm -r ${D}${datadir}/zoneinfo
 	rm -r ${D}${libdir}/bin
 
+	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
 }
-- 
1.7.7



