Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 03D4C71B45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 22:07:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so10902918pga.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZaAM72blBG0+Fw8h0gIJxzt0xS+ApgUqZo/ZcNCSlzk=;
	b=vAl6dlKyMrdpIem6aePejGnp3j+SLtFJf1Bgvh4jR7dqdbXjojrfUjuIbRNSHxDz8u
	UpY0JqCAmDK227kzx/Ky1bTq2RQal9M6cZ+/wbNTxkObzSSLaAAyrHulpcTn6whFACgF
	oslva1aVd+yivN6PKMsd/5KaD868CoJEk4oCQaM8Jgg55Ax0zRVP67OO1OxXQ3GSdNOC
	y2jwKfpCUb/6v1Td+8q9rxiAK3W5VlVSnA1mjXg9cf3ccB8VHwqNGcFKIsWWQ9P3UP+D
	6i99oIdipufmVyULD476jMF21LkjLVoBXQR70a+c8I68Dq/YqsumKebrzELuu/mGm9+9
	DZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZaAM72blBG0+Fw8h0gIJxzt0xS+ApgUqZo/ZcNCSlzk=;
	b=DD/uUib2ZYjfgk4j5oAYkgmOQdg2sZAAvu0iUBkTqmzDEBftiVd70GaEGBDNgy5PcR
	S8E6nYsJigwx9x7TUqEiUEFHaKHKvRoeM7ZLWERRaoNrQFcocW+BuxUlH3wdEENK4bve
	aBCGAyCmGPl2ZTnYuuDIGljDwipSzPEl4KHMR8gVh4t0NcbD7gBC3CbD+WkbUs5dF0GP
	26Qc5q9ZAK+ITEu8QBISBDawM+WrrlCDHiYyM/gHnSFx+NT2XUJG8NAkSWCwG4Yh3eYb
	ockj3/Joion9aA0A7SETnrpMpe0ZKS0AM97hyA5sPFFe5qHvPtLY6fJMxTEEDlNxLith
	1riQ==
X-Gm-Message-State: AKaTC00orMXo/+HLUlvN2+SrHSVWna9FRcTei3lRT/A46iSLt49sTZlKvmigZBA3Q6d01A==
X-Received: by 10.99.111.201 with SMTP id k192mr9533972pgc.176.1481926060127; 
	Fri, 16 Dec 2016 14:07:40 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id p5sm214418pgk.23.2016.12.16.14.07.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 14:07:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 14:07:31 -0800
Message-Id: <20161216220731.16452-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] systemd: point to correct resolv.conf when resolved is enabled
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
X-List-Received-Date: Fri, 16 Dec 2016 22:07:39 -0000

latest systemd has changed the resolved defaults which points to
127.0.0.53 port 53 on local network. If someone wants to use
host-local IP address then it can be pointed to copy in /lib/systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index 5b45eb2..9b76b69 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -237,11 +237,12 @@ do_install() {
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
-		# if resolved is disabled, it won't handle the link of resolv.conf, so
-		# set it up ourselves
-		ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
-		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		echo 'f /run/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
+		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv.conf
+	else
+		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
-- 
2.10.2


