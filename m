Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 950DB7861F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 19:12:12 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 189so166843wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Ydv0CWLEtnez3IhOt45uzvSwVwkKHVQKlaVVvL69LQM=;
	b=MIT1CDa8VYdE+C6Wtj4c6PCWDKDgWoeDVjpPpyI/acRSKYI8lPHlEvL8nZt5iRYi/C
	7I3MdxmXXZP4AayWI2VX7XIcP6/zVhVorRcL6y/x5oaMZ96VIvS4lQS6h20xEqa653/Z
	+1hOc/iUrJP4YDdgR/xmTnAZY4a2f9fpS84XAuT3wDjBlkP1IBNKGp7B1HKD2uhpBXxC
	PjaSDw/w52odjcsw58OlxjnPwnzKz/wwVMB9Kh0YnKss2MqI/rTW1UMB9Pi5K9dpcv4o
	pQTOt/c61y+ndJ8nKHv58ue5D8C7Zpdjp7/AYrAW45fB9R1QiA6clwM690qhOR3K36U6
	0usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ydv0CWLEtnez3IhOt45uzvSwVwkKHVQKlaVVvL69LQM=;
	b=LLYMopsFfSHDd2lCJ9e3zXAWS7GdTNfHo6QKTPQxme8f1Id8tD4OIBfSYkPYwdPGy4
	IydC30gylHRNUkR5alkadedsMZsWIgygsX0SnXsaCa18HArb3Y/yytyo5ExoSABuk/75
	zwPV06kOzARBqnyGvivkscVfsNcvX/xv9u8zswsVISbB4jTp3Y+MomLL/x34BCPefu2j
	pc85lMkxpI5jNW7amJzCrf9JwBF/7RPAatyeQl+ifnGwN3eMw7FraRBSsGE5ljA7sdpS
	uYFE3Zgz/7UUuf1JVvrz9KK9l0leA2C9T53y+CBeKvFy/feuvMXXYcBnytmE0rSWVgCq
	3aiA==
X-Gm-Message-State: AHPjjUiTyRyiMIaHyHZuxZL9KAZvyXuCwbJKyMb3WnehWocRqWSCzp+m
	wxv5nGDXQwVX6rZTuFocTE1eRrdV
X-Google-Smtp-Source: AOwi7QCpdJxEkHjJbqrooVTkUJiRZthuaNLxtBw09e46zDbQ7nirCBM+Ce9onJx3Q9358oigD2zlnA==
X-Received: by 10.28.184.141 with SMTP id i135mr3607862wmf.143.1505329932936; 
	Wed, 13 Sep 2017 12:12:12 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o27sm8055640wro.72.2017.09.13.12.12.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 12:12:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 20:12:08 +0100
Message-Id: <20170913191208.5379-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][pyro] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Wed, 13 Sep 2017 19:12:12 -0000

All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
information disclosure vulnerability which allows remote attackers to obtain
sensitive information from the bluetoothd process memory. This vulnerability
lies in the processing of SDP search attribute requests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ccb10aaad9a..882873a486e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+    file://cve-2017-1000250.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
new file mode 100644
index 00000000000..9fac961bcf6
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
2.11.0


