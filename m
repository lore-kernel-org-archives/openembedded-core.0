Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02AF97CE60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 18:15:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u10so15045388wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4NK3OzTEi4oqMudwxHB7OrDF0Xsj7hiFu20fdKTesn0=;
	b=A6gyiOsfFFWZQh/+3ic0JR4fbvMXZVmdnTmbZ6NQjpfr99lr3Z7nJZlWYTms+LoFFm
	GEoTWTWt6Xlm2+KjOjTcTG1ZbloOyQXLz1fqMh+y2cZgzB9DtBP/7NeDZ4+Tjfz16cWP
	ideqPKuKS0TYdPoH4bEAaxDiJHb1W9XUJCd3vbZW4FiowLok6i68ODlVS8MNYbbSWOkJ
	Nnjgak81eR8aZZrEb7pPH3odMHCitwnCRjRimIRZKfUyPmROsCN0+iDR7fLlHk25hgUj
	3WMADKsoOj0J5UgXUHxoLm+WNZsdzSv6DXonZzGF3nzTK/zLi8R3Wzi/J5K326AYrs+E
	k/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4NK3OzTEi4oqMudwxHB7OrDF0Xsj7hiFu20fdKTesn0=;
	b=abf1YsqBBUeaBEWQd+CEQtSVnUn7ZyyGDi9qViYhprqYmH9SGJxJfJ5ImVwqV3t7pt
	RoMw8sGN1pwD0bLZjKthqlH4rXVROQx5HxzFg901Pzj+xaLIfzRkYRnUqjIEieL8mcAu
	W5/+ZTSatl0HOLpSW4RuNtzUe3P+D8kOkEBVaFhivy6MRg5pYNbBP68334NYXPLsWla1
	5YnwGBOVDOG5jDWHUlYb9mn/TkKPJBsPhyenpmgM6C4iSVHg8i62u2R9Oit1+U4qP8Rq
	N3fQ11utuP8/ZB/NT7kenHo9nTL1cqHU082AVeIKjsJevahc0mjoSSAu+8FPwZ/xcoTu
	x2Mg==
X-Gm-Message-State: APjAAAWVc/VXD32Kc5R/UKAAHh5PYfpwl64abVnuyS5b2trCNS+oenRD
	bfUZa9KOrZwbzSp215kRgdi9P2D3aOk=
X-Google-Smtp-Source: APXvYqx6kAzCK/zua5+OOl8fAh/dUsJiBo/Le/Iy4WkViDosnm4ZUhxMuThNyNdzcbJzyZbaf/PIEg==
X-Received: by 2002:a1c:f10f:: with SMTP id p15mr4769691wmh.27.1553019347183; 
	Tue, 19 Mar 2019 11:15:47 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	l3sm15209964wrt.62.2019.03.19.11.15.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 11:15:45 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2019 18:15:44 +0000
Message-Id: <20190319181544.314-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Tue, 19 Mar 2019 18:15:47 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Dumpimage and fit_check_sign can be used to extract kernel and ramdisk from
a FIT file, verify them and kexec for a faster reboot.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
index ff26e32482..c487849bb2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
@@ -45,6 +45,14 @@ do_install () {
 	# mkenvimage
 	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
 	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
+
+	# dumpimage
+	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
+	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
+
+	# fit_check_sign
+	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
+	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.20.1


