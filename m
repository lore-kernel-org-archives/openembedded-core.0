Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 55BD3785D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:28:02 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 189so5584804wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AOIA7Q8deetocsk5wEQSMbJxAODkg3XNGwiNvaymYLo=;
	b=SHngL/Stq6A//NPT1n+apnVtrTcJ0gMGplfwJKmwi6e+rmKHtsQVx4Btm3jm5GiRS5
	oZqC6rENAMyy7u7tXu6ilCCXCGMdHmURV1GaEhOdQf0SpGAWLKtfndtHuDiLqljCng+i
	WhFXgnu0RTqOpeNUFkZHBUXXNNWtl9fWdyukty+Caj7jaGQXQQsG8JzaJnFGmVvxGAIa
	B9+4sla7MvFQcDj4ivirizUNN+OCbkHOzbSt4LJk8BCVOJymAj4MNl9Ml85XtkpasD/d
	W8YVhn25u00F0LkUzPL/QVPJ+1faNQSRdzEE1+cG1WScCDHy3jSgXn4awdx2hIROETO+
	RIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AOIA7Q8deetocsk5wEQSMbJxAODkg3XNGwiNvaymYLo=;
	b=D3yVOmU5qTaFWHaLMT8DlGMyF2bTkNSYcICX6+zsDpyy6ZSg3J7KWTl0N1oMYb83P1
	mBDJ4tIHlfKVOfHxtdIDDQeSTdMheG5WLqTZGbtIhYYjRRuhY0K/WdIlEh6uO8xZa+08
	UNuyTdK/2K0zUb3JWX6J+ZNr77OzCSTUyXHZqxGsaRyazYN476xU1uaB4gLjYJx7v5Wv
	OS2cw/tx6e60eIcE4hL1fL39Ty5ubxkJ/UZ8P8lusaTEHm6R/Ffr9PYsxWj/xFi1zMes
	3/Dcu6/rD64OyyEhzN7c39YmtA0PFiwqDH0EBV1NRFeaf6aFY/MnUcimy6FRLo7kFyjs
	ig1Q==
X-Gm-Message-State: AHPjjUjh6qhYLntKUeSAT7ZZLlb4bQl+2YAA7QUQ43hyFs+uyW3RR2h6
	xb2FPN+Zewl7nWuO8IU=
X-Google-Smtp-Source: AOwi7QD9DO+DYYGPae9jHcwadDz6FshaLIuzbQ5mwT9/qRfWvspDCBmwEFeqfaYaGN2kJ2l86ySX2g==
X-Received: by 10.28.211.1 with SMTP id k1mr1843876wmg.94.1505392083442;
	Thu, 14 Sep 2017 05:28:03 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o138sm1592899wmg.36.2017.09.14.05.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 05:28:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 13:27:53 +0100
Message-Id: <20170914122753.12713-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Thu, 14 Sep 2017 12:28:03 -0000

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
index ecefb7b593e..3421c382063 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -23,6 +23,7 @@ SRC_URI = "\
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


