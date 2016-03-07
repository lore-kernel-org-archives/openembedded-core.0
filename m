Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA72731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 13:50:39 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so86934152wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tyt5LVbzFFau5HksD7w9kAF5dTRNz5B/Bw5p8rPPxkw=;
	b=duYSDZrSr8vz+m4xBKLmreXWSEXe4+1dVf0cUke7bS7X09Q1Ps5sFYD1zi59u3mTZ9
	xWVp7Jprab9mJCDEZXw+zBXR5EMSsQKZb5t2TBGi1ahcqekBM3e8k8VoYk95AwpcyFY0
	NGaj/GeIB8Po3rgCiYJZgjQ0RyLA8i7RUmhOpSJJ3JhTDxXFxElKx2z2Z1EZqyqaUDrx
	tesTK5IzKH8QkY+Y8O/tFre4LRKuKFiQMKn/lNlPoTsG0l6ApwrLbr0Nsw0Ba+fbeEIu
	rOvZURKPZeloCo/AfW8H18+PIqRDf+XQJsQtQHA4dwRfWClR+GGW235UoIWu/iwHdiFk
	ipXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tyt5LVbzFFau5HksD7w9kAF5dTRNz5B/Bw5p8rPPxkw=;
	b=SemByDg+/eC0iZ19bA0R/XoGm9woJDwpChuT/ZPZq6h+kxDgD9YXItirPgFVISgzhs
	f8WoesSS3DjR3dJvQ0TXj3FT29zIFMu9toTlI/1yixSxVL09kxfRGhz2xvWrlcl99FfB
	GDKXrj/fIKjLCW89tnLZKANnPJPRJHXIRHX1rjMsg+YUb5+G1A2WNfPrGAGKb2Fi+Bae
	VCHuBuYXFLCK7sOJnEJBqHq53JKwzVbDzyTiFXcjxNzfzeuuceeaeaT6BwalVeGyiYMI
	nsUVbaT+0k4KoQI4Zknl0H6w7mx5Hofe+6x1xcc3mNVZzq6p5zDBwZVL2I133tpMP1el
	kapg==
X-Gm-Message-State: AD7BkJJysP41qbnCzGjViJwdek0avmgWaEOwX9sBwyBoQ0woiJnKpxL7lgYCsk+tqwauSa59
X-Received: by 10.28.226.6 with SMTP id z6mr12520168wmg.44.1457358639497;
	Mon, 07 Mar 2016 05:50:39 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	up6sm18089716wjc.6.2016.03.07.05.50.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 05:50:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 13:50:36 +0000
Message-Id: <1457358636-23353-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] eudev: remove redundant udev_run assignment
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
X-List-Received-Date: Mon, 07 Mar 2016 13:50:40 -0000

The path isn't correct as we use /run/udev now, also /run/udev is the default
value, and eudev doesn't let you override it like this anyway.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index c15dd89..ffcebcd 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -58,8 +58,6 @@ do_install_append() {
 
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
-
-	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
 
 INITSCRIPT_PACKAGES = "eudev udev-cache"
-- 
2.7.0


