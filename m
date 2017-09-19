Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 600FA780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:17:12 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id i50so3634233qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ap1KxS42DauOFrHO7oDVnr0TKUP2cMOIAsRJfs76m1E=;
	b=Eno2bX9yv6mq78B+SK0VU5NPJZe7XCVUAY+lXrggIddFri4ZmJNv8c6Go53B/5RYuD
	3igeMdLIyvnHyYnrYf0gRRX0wZnspj3rIpb2LWFCUMTelOQ7/VcSvCk5Nuvo+gh25B9y
	BR8AumzaZWBTc0HmyMlLLJLUPWDxVUuIbhhk3kqU97NYtCxsBi7q+mL1+6T0G7t6leBw
	qmt2t8Z7l8SAqMp/2HfSkEFYT1gqOeA24sbEwxAvnk/FOQJm9iDzepYKKi0uyUCTla2d
	Lf9xAhgrJq81un5R+6LSgdMXAFIY403bebi9MQLF/8Ng8tsKayUMuYP5wYcMKEmktrC0
	0ecQ==
X-Gm-Message-State: AHPjjUjbikrAQCbG0TD1HrCwo+aofWB2N9hY1JSMRRAW0CjMIo3FwRKP
	xwLTA4+eKR+y3YeS++iQretJcA==
X-Google-Smtp-Source: AOwi7QBvBpyEI3UXs543YM03GI2A+IehAlgn2n0NRUYyBrumM6ODW9XBV3ioiWoQSG51NVcELTOTVw==
X-Received: by 10.200.2.141 with SMTP id p13mr1985025qtg.45.1505827033113;
	Tue, 19 Sep 2017 06:17:13 -0700 (PDT)
Received: from localhost.localdomain
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	q204sm6853461qke.37.2017.09.19.06.17.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 06:17:12 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 09:16:39 -0400
Message-Id: <20170919131639.28283-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bluez5: Upgrade 5.46 -> 5.47
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
X-List-Received-Date: Tue, 19 Sep 2017 13:17:12 -0000

This release includes:

- SDP fix for CVE-2017-1000250.
- New bluetooth mesh profile.
- Various fixes to GATT, A2DP and BR/EDR vs LE bearer handling.

This commit also drops the following two patches which are included in
5.47:

- 0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
- cve-2017-1000250.patch

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  3 +-
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch | 36 ----------------------
 .../bluez5/bluez5/cve-2017-1000250.patch           | 34 --------------------
 .../bluez5/{bluez5_5.46.bb => bluez5_5.47.bb}      |  4 +--
 4 files changed, 3 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.46.bb => bluez5_5.47.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 2ae4553d48..3a8d3476ea 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -41,6 +41,7 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
+PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -49,8 +50,6 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-    file://0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch \
-    file://cve-2017-1000250.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
deleted file mode 100644
index 46794381f7..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
-From: Andy Duan <fugang.duan@nxp.com>
-Date: Wed, 23 Nov 2016 17:12:12 +0800
-Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware download
-
-From the log in .bcm43xx_load_firmware():
-        /* Wait 50ms to let the firmware placed in download mode */
-        nanosleep(&tm_mode, NULL);
-
-But timespec tm_mode is real is 50us. Correct the delayed timer count.
-
-Upstream-Status: Accepted [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=76255f732d68aef2b90d36d9c7be51a9e1739ce7]
-
-Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
----
- tools/hciattach_bcm43xx.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c
-index 81f38cb..ac1b3c1 100644
---- a/tools/hciattach_bcm43xx.c
-+++ b/tools/hciattach_bcm43xx.c
-@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios *ti, uint32_t speed)
- static int bcm43xx_load_firmware(int fd, const char *fw)
- {
- 	unsigned char cmd[] = { HCI_COMMAND_PKT, 0x2e, 0xfc, 0x00 };
--	struct timespec tm_mode = { 0, 50000 };
--	struct timespec tm_ready = { 0, 2000000 };
-+	struct timespec tm_mode = { 0, 50000000 };
-+	struct timespec tm_ready = { 0, 200000000 };
- 	unsigned char resp[CC_MIN_SIZE];
- 	unsigned char tx_buf[1024];
- 	int len, fd_fw, n;
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
deleted file mode 100644
index 9fac961bcf..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
-information disclosure vulnerability which allows remote attackers to obtain
-sensitive information from the bluetoothd process memory. This vulnerability
-lies in the processing of SDP search attribute requests.
-
-CVE: CVE-2017-1000250
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Wed, 13 Sep 2017 10:01:40 +0300
-Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req function
-
-Check if there is enough data to continue otherwise return an error.
----
- src/sdpd-request.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sdpd-request.c b/src/sdpd-request.c
-index 1eefdce..318d044 100644
---- a/src/sdpd-request.c
-+++ b/src/sdpd-request.c
-@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
- 	} else {
- 		/* continuation State exists -> get from cache */
- 		sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
--		if (pCache) {
-+		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size) {
- 			uint16_t sent = MIN(max, pCache->data_size - cstate->cStateValue.maxBytesSent);
- 			pResponse = pCache->data;
- 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent, sent);
--- 
-cgit v1.1
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.46.bb b/meta/recipes-connectivity/bluez5/bluez5_5.47.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.46.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.47.bb
index e1f85879ce..49666f226c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.47.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "913f35d6fa4ca5772c53adb936bf1947"
-SRC_URI[sha256sum] = "ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28"
+SRC_URI[md5sum] = "783e15f65e70cdb8f721c659e140dd56"
+SRC_URI[sha256sum] = "cf75bf7cd5d564f21cc4a2bd01d5c39ce425397335fd47d9bbe43af0a58342c8"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.11.0


