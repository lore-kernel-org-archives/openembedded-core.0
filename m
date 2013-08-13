Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6AB60593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 11:26:57 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so5680494lab.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cWZw8AVmES+UNywa7Als1/h3J/aC3ckE/7LRaBYYH4I=;
	b=h4HU3nCys0+JWNuZQkBD/6WytsdBofl4kj5SSroEI8gz9DZkWdJhWUmJONt7u9bK6Y
	DW6caFdZ0D0ckrlzljp7V++JO/ohqvWdOdddY/7rWN7c8cMTz9j1NVzVU+otYBqiOERb
	9swR9KOau5rabvWT4FxhyWrC4IwyFw6LC/g9qRQehCs1d4qnhWAdkKHAcWSgB81hdIy6
	N/Q3nFhwn5/iq2xYYW2ceqsj9rYPtO5NfEzAVTvBhOBV0PFlHubHqIALbtP8nX8n4V2J
	0+BQg+D+qCwNGx4HNwTwiT1yBo+Mklr8bhoZVRyN8r8wpSaVBiUtrrD31tRUOvqPZSjo
	Kg7Q==
X-Received: by 10.112.210.136 with SMTP id mu8mr3295054lbc.25.1376393217578;
	Tue, 13 Aug 2013 04:26:57 -0700 (PDT)
Received: from ubuntu.datv.net ([194.44.185.28])
	by mx.google.com with ESMTPSA id 8sm13691437lbq.4.2013.08.13.04.26.56
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 04:26:56 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 14:26:46 +0300
Message-Id: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v2] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Tue, 13 Aug 2013 11:26:58 -0000

This patch fixes systemd's postinst/postrm script generation.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6b5ea0b..37ce3ec 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -56,6 +56,14 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
+python __anonymous () {
+    systemd_packages = "${PN}"
+    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
+        systemd_packages += " ${PN}-vpn"
+    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
+}
+
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
-- 
1.8.1.2


