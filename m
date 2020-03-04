Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0A76178A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:13:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m3so1240550wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m9BEYb5gMAX+ar/6cFl2SLLXWqXVvY5Xs1dZRXbU2dE=;
	b=ptsC85FKldO6OpwmKYHpmkvE9UAmV3vCWcfteqlwZ0Ee7TssFA8txVT6aNM7OhX+1B
	pHr9qeA+P3+0x+1g5sikCGeCAocQUlvWHtIwXkwdwqz7peyR05XlY2awvksA4H1e2Psf
	pbUPcOAXXHahdmxP/mtswlM/xTwxJl99nAWEGkqF9C3vSBTCX5b28Q+74tpmiozpt2KY
	E7WuPgFPQUWniK8rK3y+MJyKkVwUCIzVLIDubVPxv7S7Gteu6vDbjaMb67PpSfctMoGB
	xcEE/FeiIjsfWzpAB4ibnEy+ZfANQ+L7res+EchHjTY3MnIsB+OmM2IFH53GfvaJxF+j
	wO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m9BEYb5gMAX+ar/6cFl2SLLXWqXVvY5Xs1dZRXbU2dE=;
	b=N9bhdDq4WgNSgwR85GJF6Cyim20+jEl4sSKd0iH5ZzFtTNj3vnZ4SzizmHz5dk34Lt
	W9TAOzRTHyjHaHucC6WStZSZzqpmxBBdsltVqku5Cf3ctCsice81fuLs0C1mTbEwelz1
	zcUMJUypJmmavoOPiXxVGL+xq3qZEyAyc9qX3cDXNNBSOTkKbz4fQJK4lKh5QZOA9NNE
	yJOK47Pmo8x/dUwUSsGWDy9EanU+y6BOYQxslCdUe7YekQXATMUbq0rWaxMavIeLFwVr
	NKo5lr9J+sycPcl4UGoalmdLy217EXrrvAO+K39hhv2eEZIH0eNh6q990r/QagATLCx5
	Gipw==
X-Gm-Message-State: ANhLgQ2M0V9lAWTJdHezYKUbtp/y9EOKwFiMa3SYpGHvVZhTwu1kZyhd
	Y1sYqVoTrdiaYrCaFUT8zILFPGCU
X-Google-Smtp-Source: ADFU+vui3Nk8hs16qFz1rKqEgaDFiQNpT+XiTRQOlG/1+G6hhu2aD5Ad5UpRdnbGcmD1G75DOiz+YQ==
X-Received: by 2002:a1c:9646:: with SMTP id y67mr2900309wmd.42.1583316816288; 
	Wed, 04 Mar 2020 02:13:36 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t1sm42257127wrs.41.2020.03.04.02.13.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 02:13:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 11:13:07 +0100
Message-Id: <20200304101307.31198-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: use 'make install' for installation
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
X-List-Received-Date: Wed, 04 Mar 2020 10:13:36 -0000
Content-Transfer-Encoding: 8bit

Copying the source tree over was missing important symlinks
that since recent updates can only be created with make install.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../linux-firmware/linux-firmware_20200122.bb | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 0d1422cfca..f7198cb56a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -208,27 +208,7 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}${nonarch_base_libdir}/firmware/
-	cp -r * ${D}${nonarch_base_libdir}/firmware/
-
-	# Avoid Makefile to be deployed
-	rm ${D}${nonarch_base_libdir}/firmware/Makefile
-
-	# Remove unbuild firmware which needs cmake and bash
-	rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
-
-	# Remove pointless bash script
-	rm ${D}${nonarch_base_libdir}/firmware/configure
-
-	# Remove python script used to check the WHENCE file
-	rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
-
-	# Libertas sd8686
-	ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
-	ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
-
-	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
-	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
+        oe_runmake 'DESTDIR=${D}' install
 }
 
 
-- 
2.25.1


