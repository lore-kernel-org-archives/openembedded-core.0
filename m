Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9C771F23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 14:59:54 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id bs8so17241092wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 06:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i33JTXndm/fRnavYLS3+MT0igh5f+BHJIw9YsHP9ssA=;
	b=Fw6ZGO5cNJPOT/9Yp/YujYyaFFe0jQFNTGCnyN/TOW6+tZBvNCsP/sh6Hu6zvYnPWY
	EfUE5GU6xsba1AY1XVwON3XH+QDTKbtZZZUndmP+GGT2RHAFJJujOusUFUiaSzcxwAhf
	X15jkXfCazElvRLnMDs3sWRgfa7XAct0IqBl2SlWitbTndFoZRRspLe53LZNY2qvmFdc
	USxELwp75hxan3yabduUABkhKG7NOAv3s84aF0CQ5OP4xIVqPh0gkp5eXrzb21Zx8asB
	3LHwCJrOCxc/3lwkQqvdJ8vztMbFKzJh87TPddjIvMQoYbpFofZeitsERObemx+btLyv
	cmvw==
X-Gm-Message-State: ALoCoQmhTnclU290AKN4Xdh3EqLUbpIMYXHGsB932m90ErJQ1WdvyQhQQYeqIzxM+Cm92SRoQCis
X-Received: by 10.194.110.69 with SMTP id hy5mr61328786wjb.121.1421679595023; 
	Mon, 19 Jan 2015 06:59:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id bj3sm14524406wib.3.2015.01.19.06.59.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jan 2015 06:59:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2015 14:58:26 +0000
Message-Id: <1421679506-1269-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] at-spi2-core: pass correct path to dbus-daemon
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
X-List-Received-Date: Mon, 19 Jan 2015 14:59:56 -0000

at-spi2-core tries to find the dbus-daemon binary and hard-codes this path in a
script.  The first dbus-daemon it finds is the one in the target sysroot, so
explicitly pass the correct path.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
index 5865166..8d01124 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
@@ -13,6 +13,6 @@ DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
 inherit autotools gtk-doc pkgconfig
 
-EXTRA_OECONF = "--disable-introspection --disable-xevie"
+EXTRA_OECONF = "--disable-introspection --disable-xevie --with-dbus-daemondir=${bindir}"
 
 FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-- 
1.7.10.4


