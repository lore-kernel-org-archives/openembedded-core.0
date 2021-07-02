Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web10.8346.1625227161361912999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 04:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=aQH+/dL7;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=um6AE124Mh/a+0qQaVnFgsuZc2Rv+JMyfeBvs1KFAAY=;
	b=aQH+/dL7aQFnjs3vcVJeh8gCx8jr0oh2dPSklxQgA6hRK2Z038WQaQ5Ndt0cMIH2YxWFLSTBnulsF
	 ZaaMYZ6UAq9/0FZOzHPgTqiO48snnoiKQZWe0cDQMj/Xdlnpr05ZM+if+XKtMNnJ1s6p1fvgYQCyMa
	 SPa7/IDDCz+bYoTrYNvTwk+m/w+jWVYpw7cbA0RL2WoHBAWMzQCIFjRRUInkoVBWpUizuA+vNwveX8
	 pfzZH9pipkBWLqZ2l04i4BgnC2R3+kwN0gj4nJrPePnZY4EYpG6QaeSPt9OdeEVdUlfhDghVCkh/pT
	 VUf6jT6dGo7uq81lq8pu0L+pDiLQn3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=um6AE124Mh/a+0qQaVnFgsuZc2Rv+JMyfeBvs1KFAAY=;
	b=ZueKiQuTn4kLjgQcmCIfUPPQ82M9az22CvSAxj/XBUg3md3H6JzoTu3gZO7CtwQJBKhgGzw1Aoz/f
	 rugTmMwJEjb0YH5e37w9NqIqIZX6s0pL0ktKozeSo/Zi6etWzUBdr9jxGuejIjKWi1isFnd3WyqbAD
	 eD6g3wb0UPwLCcrofzzSFQDEA0cEdW/ouip1GjVr0DDyvgGTvtYvb5eaeDzj0Xeabv3FYmWbeOY49B
	 AfdakjS7o7Thudn9ydKthwHsos3j2YSZqEmcndBnv74K9ik3Zi9mDetWc0WSSTzkAEt9YeWW5zQ/60
	 6OCoP5NbOAuye7U58Cr1f0Ug6a9tPYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=um6AE124Mh/a+0qQaVnFgsuZc2Rv+JMyfeBvs1KFAAY=;
	b=+4DPn6r5hn+y3qWsOYSa69y9t99xUjZkTNfyzWnnY82ft1LvsBSYUsh06CZtOTGVjU4uaHXOlTQjb
	 mgKZ/XlDQ==
X-HalOne-Cookie: 84189450937382db5e490cdf7b8cdda44c600a06
X-HalOne-ID: ebf6a772-db2c-11eb-a90d-d0431ea8bb10
Received: from localhost.localdomain (h-79-136-99-68.na.cust.bahnhof.se [79.136.99.68])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id ebf6a772-db2c-11eb-a90d-d0431ea8bb10;
	Fri, 02 Jul 2021 11:59:18 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br,
	liu.ming50@gmail.com,
	Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] Revert "libubootenv: inherit uboot-config"
Date: Fri,  2 Jul 2021 13:59:00 +0200
Message-Id: <20210702115900.19417-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.

As there is no build dependency between libubootenv and the configuration
of u-boot there is no reason to check for UBOOT_CONFIG or UBOOT_MACHINE
by adding the class uboot-config. Revert this in order to remove useless
workaround in bsp layer (meta-freescale).

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 2cf87c794e..306296922c 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -15,7 +15,7 @@ SRCREV = "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
 
 S = "${WORKDIR}/git"
 
-inherit uboot-config cmake lib_package
+inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
-- 
2.25.1

