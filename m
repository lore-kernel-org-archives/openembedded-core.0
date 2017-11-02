Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 394 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Nov 2017 13:55:16 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.199])
	by mail.openembedded.org (Postfix) with ESMTP id D43BD6078E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 13:55:16 +0000 (UTC)
Received: from [216.82.242.35] by server-7.bemta-8.messagelabs.com id
	A3/C3-02225-B322BF95; Thu, 02 Nov 2017 13:48:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsXi5LtOQNdC6Xe
	kwb8JWhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bEXU4FFyQqOudPYW5gvC7axcjFISSwilGi
	p/MPM4SzmlHiwulWRghnA6PEov/HgRxODjYBPYlvX2YBVXFwiADZV/+JgoSFBZIlVtz6zQxis
	wioSLz5soYFxOYVsJb4/34nE4gtISAv8X7BfUaIuKDEyZlPwGqYBSQkDr54ATZSCKj3+RNbiH
	IFiWvvF7NPYOSdhaRjFpKOBYxMqxg1ilOLylKLdA0N9ZKKMtMzSnITM3N0DQ0s9HJTi4sT01N
	zEpOK9ZLzczcxAoOHAQh2MK77GHmIUZKDSUmU9+7GX5FCfEn5KZUZicUZ8UWlOanFhxhlODiU
	JHjDFH9HCgkWpaanVqRl5gDDGCYtwcGjJMLLDpLmLS5IzC3OTIdInWI05ui4efcPE8ezma8bm
	IVY8vLzUqXEef8oAJUKgJRmlObBDYLF1yVGWSlhXkag04R4ClKLcjNLUOVfMYpzMCoJ80aALO
	TJzCuB2/cK6BQmoFO8JH6AnFKSiJCSamA0bPBbuG75A32dv0f2dwQqHbf4kLZ81rzKWSJPK1g
	Yplo/LtXsOnBtS+d5R/snBvqzSh7Z2pqsjdJytT10n6GNT8K4yK0+pjp8NWNJE8+6iIzsn6f8
	l//66v6daT2X0psM8Zkxt2uOcHJuu/v5qdeLrc0cy3hWpsgWRa3Vn6X3zN9qwWH+PB4lluKMR
	EMt5qLiRAC1De0+qgIAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-8.tower-75.messagelabs.com!1509630520!55324308!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 108878 invoked from network); 2 Nov 2017 13:48:40 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-8.tower-75.messagelabs.com with SMTP;
	2 Nov 2017 13:48:40 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 2 Nov 2017 08:48:37 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 2 Nov 2017 08:48:37 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Thu, 2 Nov 2017 14:48:35 +0100
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Nov 2017 14:47:26 +0100
Message-ID: <20171102134726.6925-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [PATCH][jethro] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Thu, 02 Nov 2017 13:55:17 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
information disclosure vulnerability which allows remote attackers to obtain
sensitive information from the bluetoothd process memory. This vulnerability
lies in the processing of SDP search attribute requests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7351e0b260876b9bbc8660c2bb4173ab4c130f8b)
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d1af31ea45..d5b86c7925 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,6 +19,7 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
+    file://cve-2017-1000250.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
new file mode 100644
index 0000000000..9fac961bcf
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
@@ -0,0 +1,34 @@
+All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
+information disclosure vulnerability which allows remote attackers to obtain
+sensitive information from the bluetoothd process memory. This vulnerability
+lies in the processing of SDP search attribute requests.
+
+CVE: CVE-2017-1000250
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 13 Sep 2017 10:01:40 +0300
+Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req function
+
+Check if there is enough data to continue otherwise return an error.
+---
+ src/sdpd-request.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sdpd-request.c b/src/sdpd-request.c
+index 1eefdce..318d044 100644
+--- a/src/sdpd-request.c
++++ b/src/sdpd-request.c
+@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
+ 	} else {
+ 		/* continuation State exists -> get from cache */
+ 		sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
+-		if (pCache) {
++		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size) {
+ 			uint16_t sent = MIN(max, pCache->data_size - cstate->cStateValue.maxBytesSent);
+ 			pResponse = pCache->data;
+ 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent, sent);
+-- 
+cgit v1.1
-- 
2.14.2


