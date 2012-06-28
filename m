Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sk3QL-0005sT-In
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 03:21:33 +0200
Received: by pbbrq2 with SMTP id rq2so2239812pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 18:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vO3q+/xNgBFKHsK/+RMYoQNeyGMUBStTar6FhQw7WAE=;
	b=VGywacAHb3qxcf28bS47swY+QXtf2UcR7QAwbBX1xXNOjsE+gKAA8gbvKg334FaZPL
	nY8aPwYwCDO4cHuNioDCZdY3H/BTufDULrSoF0wXiBmOSLZKe4asXdL5QIQ7iU9g2XIr
	Wop+h0QKqBneS5pQPGZasQjQ22d43oGAwhHs4C8zFXk58unT7rMbWdk7ZHAgcyxOab6R
	xMyjzwmp2IhtTb93GpEsVLB1P1xYJ1befanbAkUjodT52Ne+kf8mWqwhc2XiwaQKcT9m
	RFoEk8F83QS5JM+inU093GIbsVY0uj08pkX2irEuO69gn/i+xmrzC/JFFlPN/TXyiNzO
	6/1g==
Received: by 10.68.227.197 with SMTP id sc5mr1222839pbc.58.1340845838875;
	Wed, 27 Jun 2012 18:10:38 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gj8sm368275pbc.39.2012.06.27.18.10.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 18:10:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 18:10:19 -0700
Message-Id: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340845612.git.raj.khem@gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] libgcc: Remove unpackage unwind.h
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
X-List-Received-Date: Thu, 28 Jun 2012 01:21:33 -0000

Fixes build warnings like below

WARNING: For recipe libgcc, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
WARNING:   /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc_4.7.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 891c03e..55aa03c 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -58,6 +58,10 @@ do_install () {
 
 	mv ${D}${libdir}/gcc/* ${D}${libdir}
 	rm -rf ${D}${libdir}/gcc/
+	# unwind.h is installed here which is shipped in gcc-cross
+	# as well as target gcc and they are identical so we dont
+	# ship one with libgcc here
+	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 }
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
-- 
1.7.9.5



