Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4368271D97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 18:34:10 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id v77so100315538wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7fvz/we93Z0TjMXW/vbUEJltzu5wZLzoN02SoAsBf+8=;
	b=ycThZRVJcJpp3j0IONTq61xWB2ovY6Q69dC9wBnnjoI/Uf7Gui41T9hFUR30h6g/ZS
	QNgmMgUszlXlIQkMIcHWyZvgUx1+gW1zaHYQB5JOh3k6sLLytkhf9XnXRcoZ6NdfjTyQ
	2gZWoUW6rpJOb2amgWBXMg1Qqj2KsT8Mx1klReoaruO3uDuUY+XPAWD30xOTkyUGUc+h
	95UZtwttW0u+OjRzoesJj8RTLEkM98ROYfYHETroOeRKNhQxGZoTX+d5MNnE2FmXAnh4
	j8fC6mkWhc7YdToiQate3l0j13EyhSWZ0Ya6d2ihZml1xsLeb8XQlRws/HhKejUt5svm
	Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7fvz/we93Z0TjMXW/vbUEJltzu5wZLzoN02SoAsBf+8=;
	b=ZYRUsHzCc+fUXWPrutYUkjpE5HwkXLXsWNX+/xyy+BmyIuAvis/yqGPrUKJLnOUrZK
	A7nUETamJ7r97/TinWkyHpMfIVXGIfXDh1WmKV4uZGsN7hp30NbaoeNtmjGAgRJFsYNJ
	GXCePLlq29lhOepL8d1f8J4fRYeGffHXQ/gLPT2vYrpU6tkXSMDdfXYjrsKaOP3NMQ+T
	dwDGUsJuPsPJKolvlYNJeD8wSRBVnyCOc5ZKu4WzgqH6kJNRk8RyJsid8+X1fw7zDLdm
	/XV6hv8Sf9tFggUvqXmep5vSuau2Dlo9eaKH6SbSWi8jB+glxjoLk1k9MAPgwFaxlMR+
	gY0w==
X-Gm-Message-State: AIkVDXJHvOpFFrZW9NLppNffqZi3L6QNQPNEx7J9zf8+ityE41oraDS7LG0TCMm9qxEwm1mv
X-Received: by 10.223.171.66 with SMTP id r2mr8752029wrc.71.1486060450072;
	Thu, 02 Feb 2017 10:34:10 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k195sm4495562wmd.7.2017.02.02.10.34.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 10:34:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 18:34:01 +0000
Message-Id: <1486060441-14847-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] eudev: add RPROVIDES so eudev-hwdb provides udev-hwdb
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
X-List-Received-Date: Thu, 02 Feb 2017 18:34:10 -0000

Otherwise the common name udev-hwdb is only provided by systemd, meaning that
other recipes can't depend on a single name.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/eudev_3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 385ee7a..11931bc 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -81,6 +81,7 @@ RDEPENDS_eudev-hwdb += "eudev"
 RRECOMMENDS_${PN} += "udev-cache"
 
 RPROVIDES_${PN} = "hotplug udev"
+RPROVIDES_eudev-hwdb += "udev-hwdb"
 
 python () {
     if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-- 
2.8.1


