Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8140660144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:42:39 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b15so13634eek.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cqVZuj+0mkqtZcIfgw+PQ+uMvHJlRgS24Mj9bhyBNp4=;
	b=epuTaj6D0ttl2djAKlQ3sn3lnFTVBYkhV84bbHy0FWvGVY91mxVLN8aF89mUQjmTQS
	SpX9+6rdsaA7gy43vpDanNQVuW5d5gVWL8gfwGxIKjIplkQ4zPF1CeLbAsWEWa/hMbHW
	qa3t+AwpbOi8YUSFXzlxyibtnljyB3p62XosJWDAtwQfSK2UBGr8HNjDdgdygQerw/hk
	tIGXJkybKjSWoPRI1m9KrFbxuPZxp0c4Bo/4WuTxQLcQ9TdLTnkhhcBem7lMqT7GnvDs
	Waa2FFXs+Ec/KuKONzuGRCLAKdje0ZZUCprY5v49+bwmBR6rLjB9TAwR/21bZH6OnAR+
	Z0Vw==
X-Gm-Message-State: ALoCoQkUqZICMqWLq5nM0eYXI05XSjJCB9z9yGfAECHQicQqIwf/2PLGkq64jWCcr4uoiAPL5Wv/
X-Received: by 10.194.175.202 with SMTP id cc10mr102638375wjc.27.1417534959751;
	Tue, 02 Dec 2014 07:42:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ud1sm32403169wjc.7.2014.12.02.07.42.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:42:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:42:14 +0000
Message-Id: <1417534934-21746-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus: don't use PTEST_ENABLED as recipe doesn't inherit ptest
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
X-List-Received-Date: Tue, 02 Dec 2014 15:42:46 -0000

As this recipe's ptest support is merely a shim to pull in dbus-test-ptest it
doesn't inherit ptest.  This means that PTEST_ENABLED isn't ever set, so check
DISTRO_FEATURES directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index d38ba7e..fb5d017 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 DEPENDS = "expat virtual/libintl"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
-PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest', '', d)}"
+PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
 
-- 
1.7.10.4


