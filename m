Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF53861B2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 09:35:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so1607444wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 01:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QsE7xATJ1xX3/T8HcEDXV4g2sY87qF7XVwuOmh3igM4=;
	b=fO8NIECyGrPd0aoCb/wFp4GtcTtkBaSRfdbV6/QIqiji4+e4Tpyv877cc33ZRZ93/A
	ob42YHihucOSDb5jPW9A8KEgQsGwJiG0PksIPmeVv33xsWC4OzJ8bqYLGMrY5lcpcSwV
	FMPzTwAu4EompAep5HSe6ziserEsCJml5ZzsaXg1OvY8tJ/G+XzYC5kyyWmXqVUbmN4A
	NBXrRXwb2TAlJ7/Ha8yhKNOhFJBERSIAT17aLPR8OJRmLXgSmf75FHtDJ427ih9EFxVZ
	wHniNWSfZWrDDLNq1ULp83oDoe/FO1DmzY2NxnXWS9wZ0nxs2WbjOyVTT/+T8Gy4+2P/
	U+gg==
X-Gm-Message-State: ANhLgQ3MjCm8hVPPGgCCl++VfBd8m6BqaQHzQMOKp+eK4pohyVt8btFa
	PgRR6NZNofiiRCuYZC4Uc5iYvC48
X-Google-Smtp-Source: ADFU+vu5PS6fZOhpXNfjHcrOYXYsR0onvRdUwBDcUeLH0rWoZ94y5lpCFWlppzrCpJT1GlW/u2cl/Q==
X-Received: by 2002:a1c:f401:: with SMTP id z1mr2152987wma.32.1583487317396;
	Fri, 06 Mar 2020 01:35:17 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	12sm12921480wmo.30.2020.03.06.01.35.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 01:35:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 09:35:15 +0000
Message-Id: <20200306093515.25244-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200306093515.25244-1-git@andred.net>
References: <20200306093515.25244-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-firmware: TI: fix wl18xx support
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
X-List-Received-Date: Fri, 06 Mar 2020 09:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

wl1271-nvs.bin belongs to the wl18xx driver (and respective
package created here), see kernel source.
Due to the way packages are assembled here it ends up in the
wrong package, though.

Fix by placing it in the -common package as it's merely a
symlink to wl127x-nvs.bin (which does belong to the wl12xx),
so that both drivers have access to it.

Signed-off-by: André Draszik <git@andred.net>
---
 .../linux-firmware/linux-firmware_20200122.bb            | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 798e2b5c7c..e9fedd1602 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -511,8 +511,17 @@ LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
 FILES_${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
+# wl18xx optionally needs wl1271-nvs.bin (which itself is a symlink to
+# wl127x-nvs.bin) - see linux/drivers/net/wireless/ti/wlcore/sdio.c
+# and drivers/net/wireless/ti/wlcore/spi.c.
+# While they're optional and actually only used to override the MAC
+# address on wl18xx, driver loading will delay (by udev timout - 60s)
+# if not there. So let's make it available always. Because it's a
+# symlink, both need to go to wlcommon.
 FILES_${PN}-wlcommon = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/TI* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin \
 "
 FILES_${PN}-wl12xx = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
-- 
2.23.0.rc1


