Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNnVO-0006bt-DC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:59:23 +0200
Received: by mail-wi0-f173.google.com with SMTP id ez12so4912439wid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8qTSQRrNrr9TxHTVks/NOvr6T+UTUjjcYIm0jBQHf6I=;
	b=LSu/IyVQTBWqSA2YAHTFmqgEEkaumGtPmWOsYekdpLivI6cECAGrUna2lsVf3PvXzl
	jPkrAtpcW/lbdPnclnEXflS2uyIZEcQh4WhJuRCHZT5fy5wSwLTt82i4vKVfdUZDaQdG
	lwRngiGdhQPoxkPievfiiNfEMwIAYZFAd31qmw/syawsBBWlbmkWv57HguL9YgV5To/m
	NUOG4+vtBgIcdBiW5FYuOG1IzsZ/o6UB8YgRGodlBxNcm1QnKNZlHt3jSnwfdAWss4uv
	+EGtdRSdCs7RNpYNjM6Bpr/YJHtqqGoT+87yoZTGgmxRj9oY7DZft9Q2zRIghiLWXr53
	PJqg==
X-Received: by 10.180.85.103 with SMTP id g7mr30719369wiz.23.1365093725584;
	Thu, 04 Apr 2013 09:42:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ej8sm32160616wib.9.2013.04.04.09.42.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 09:42:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 18:42:12 +0200
Message-Id: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 1/2] systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 16:59:25 -0000

* fixes udev configure in run-postinsts failing with:
  update-rc.d: /etc/init.d/systemd-udev: file does not exist
  because systemd-udev is installed only with sysvinit in features
  but update-rc.d was always called from PN postinst

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_199.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index ba1d133..e574548 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -239,6 +239,12 @@ INITSCRIPT_PACKAGES = "udev"
 INITSCRIPT_NAME_udev = "systemd-udevd"
 INITSCRIPT_PARAMS_udev = "start 03 S ."
 
+python __anonymous() {
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    if "sysvinit" not in features:
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.8.1.5



