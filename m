Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A249378554
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 19:11:56 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 189so165011wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ggfvTfFccjYJel96ujeC9OHuz2BMU7Rxb8L7DNHhDFc=;
	b=s0vExkN5ucVk6Y3nItNBQ5Cp5wbyzYZn+jKz2ed7OttoSvmIAz8E1S+4mQ/E3Ut58C
	LSehW53AKqBHJKJVcNxDd9NwIkMNwictCPtvQmBqtFYmXsJftdMEvBzxbBjB27nJ2mj6
	0r+XDH+nX0yR76N7zU0wxG91O4gMy9EyQ4qoDhUkNaj/4wOZ4GqMA9/BLuCnU1x5F3pE
	UBt/1QmufGs74fHUUxXcNMrbUgyOBaWP3KfhcIG0bU5gTTfe00LCAF2fEoxIgQwbd6zn
	JCVkVD89StWwAV1DGFnWGtXBH8dxFKy/jJ7k1EDITSRbp9oBYlDprUplF5al9qA0qLTz
	wIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ggfvTfFccjYJel96ujeC9OHuz2BMU7Rxb8L7DNHhDFc=;
	b=gDp6gMol0bq9ge/ohtOwPzh4NZSW6l6TY50pD5nKXLnA5W651RngFzy910lN7TiN77
	OOTTGsmusJeXYG+Ep70zcaAZ9yHfXmnlA08/hXcJtcYWbgUniuHIsmRYfUhGriICge2X
	NCC2Y8n6hUxWBPshOted/+WYlA/9T/orjzcdzA9b1VB7ooYFZtK4h9Gz2t2s4ApP+C+O
	/e7XJYCdKPjy7008c9kwdYlgIHitukfBOE5/MGEWxQDmtjopyEaJeR1pwOJi84C31jLp
	bklZFN2PdhfISZynbHeb/qeq8pBlqhgtnlmw5JQPwVPdUjlhbdtagqlMH2KsOpoDW+72
	EX/w==
X-Gm-Message-State: AHPjjUi2z6u2OzI0EJ04VIpFH1vCB/GRqpHr96Z3vybh+CKQvmyR8Fq7
	3pAzItJmmKLB/8VzAAk=
X-Google-Smtp-Source: AOwi7QCOZ2vzeKmXXI8TX25PyGbygdOnSUASF5a5INsOFmR8Mo41NoqBUb0vn3iNuIoZvC7awEMOBg==
X-Received: by 10.28.193.5 with SMTP id r5mr3666609wmf.153.1505329917586;
	Wed, 13 Sep 2017 12:11:57 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v82sm2605471wmd.44.2017.09.13.12.11.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 12:11:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 20:11:52 +0100
Message-Id: <20170913191152.5288-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Wed, 13 Sep 2017 19:11:58 -0000

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
index 527e4033fe6..2ae4553d489 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -50,6 +50,7 @@ SRC_URI = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
     file://0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch \
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


