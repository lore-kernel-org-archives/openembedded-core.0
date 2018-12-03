Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 401C26C660
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 15:30:53 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id x2so5523005ywc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 07:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hhtasKp0fa5D/vRByLffIX/e9EOAGxU8Z5mN963htwk=;
	b=sJevJFrre8T3/DAsoy4yyLFGqrGPSKelX7eGObzfzRBQph5YuenQ0YBAY6JObgjkt+
	HCMxoVVHFLXHQaeyZf5gkD3RJ5jkWwu54SoTAuO3OpbZ1N9lOKiWTTq1rOxxYQl0bYZP
	UMoiNtlNJtZY5AnsTfsCXTPxSneIeInL9NCtB+ZRbrd4Os7ebZufYlxMaIFXQkq3YtYl
	yN0v/H86jK5h31MwKGo0NeJ0blMWzjnM7hv3TTY69P2BvQWOy6LQmQzQ/3KPoxZS8lPx
	dytqoob0R/tMyhVyLNZDk8MBnWVNqAycpWQ5PmOQwcFcGAPJKskLZ8BzkpyptKZlORzC
	S7ug==
X-Gm-Message-State: AA+aEWbxCUNYrBAHTgaymiEyUtDyefiiA7K+lEfRTuAmv4uMizYcIAE2
	61L94AZUPtYu8X0HYn9QksumSzMM
X-Google-Smtp-Source: AFSGD/WEaBprTu+xA/XrdiZsl27I+3cnimdKW8ehbuY9R8CYTU1o86HjXr66LV+i+NmUFxb7Tsb7+Q==
X-Received: by 2002:a81:26d4:: with SMTP id
	m203-v6mr15922253ywm.327.1543851054073; 
	Mon, 03 Dec 2018 07:30:54 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y1sm4658215ywe.86.2018.12.03.07.30.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 07:30:53 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 15:30:51 +0000
Message-Id: <20181203153051.7141-1-git@andred.net>
X-Mailer: git-send-email 2.20.0.rc1
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: better packaging for TI wl12xx & wl18xx firmwares
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
X-List-Received-Date: Mon, 03 Dec 2018 15:30:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Currently, the linux-firmware-wl12xx contains all wl12xx and
wl18xx firmwares, except for the wl18xx compatibility symlinks
for old kernels and the linux-firmware-wl18xx contains just
those compatibility symlinks and nothing else. This doesn't
make sense...

Be more specific about what to package into each package, in
particular because the existing wl12xx package is specific
about symlinks already.

At the same time, we split the common bits into a -wlcommon
package, so that the wl18xx package doesn't need to depend
on all the wl12xx firmwares, saving several MiB in the file
system.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
Note that this patch has only been tested on a wl18xx based board
---
 .../linux-firmware/linux-firmware_git.bb        | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2525545bdd..3a4076e153 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -237,7 +237,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
              ${PN}-usb8997 \
-             ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
+             ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
@@ -521,24 +521,27 @@ RDEPENDS_${PN}-rtl8821 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
+LICENSE_${PN}-wlcommon = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
 FILES_${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
+FILES_${PN}-wlcommon = " \
+  ${nonarch_base_libdir}/firmware/TI* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/TI* \
+"
 FILES_${PN}-wl12xx = " \
   ${nonarch_base_libdir}/firmware/wl12* \
-  ${nonarch_base_libdir}/firmware/TI* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
 "
 FILES_${PN}-wl18xx = " \
   ${nonarch_base_libdir}/firmware/wl18* \
-  ${nonarch_base_libdir}/firmware/TI* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
 "
 
-RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
-RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
+RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
+RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
 
 # For vt6656
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
-- 
2.20.0.rc1


