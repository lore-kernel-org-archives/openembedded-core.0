Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 41D1678A91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:02:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 139so14636423wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yDjhwm+v44UdSBpVXk0l1bbIwvMs3qon6nwtWF+bnZU=;
	b=Ot3TZDPgYWy8S2vv32OgL92P8P493AfO6Q2zPi0JIPKMpZdvA8dkSPv7Sntt9uJiwZ
	3sPd1TQQf4qkaKdO3HheitGAE5/Ihmy2uJ9gdppKJIbheDafGcwj+B04TeiBLBGtdxv/
	u9g4DFTLS/R3jg/KWDz95xvkUxQGJHqL8d3KemB+vu8PZkFQOQFw1oBWn4QeVsrt58n1
	mHOPNoymFKxcYcSGasDXWDq6QXcYBg8OZG2XKWGQIBxwwWYIH4FffI23BCwObnDZ54Yb
	0+24Ni46swg6ygGHy6+T7U8PRvFid/5PK0OQBTmh6BLyslOcViscOBCkoXBg4rKLELgZ
	buqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yDjhwm+v44UdSBpVXk0l1bbIwvMs3qon6nwtWF+bnZU=;
	b=rDuAp/mZ76bVUKBI306Mj6gE030YrKwBiO7L0ERPSnv3Z4Q3wm2+kexYQG3DFDZIyS
	rfkrX2dm8ZJiKNgFEM0OjIhxJZJKZYS/yx2rXbDmsAC8BZ8illfutN4O+s1ZJg4ebuB/
	bo56UG3ghZcUArpyR92wHcoZtgTK6fnniC4aSZonHDPWOSkGLFtIfhZfff6aiMw1MWhb
	zyG9GTNQrH+85DGQNURIzTp4Nje8LR3CLtvsUQRDOxcQyR1gvzu10pgTfMUAktj1a3tD
	iNk1+gfF3nkwXmk1T0XurI3RWZnxVeZLxv+SAWSApLP2azPsMdjednjlb0FEcmLitdLa
	YpSg==
X-Gm-Message-State: AElRT7E1pv873NrxJ3eoGk/q3vkdaOQYu8WNXFtitFSKdZtPsjm7Zmtb
	EoBzWToGnKBYIJsyMs9OqMCGDf0P
X-Google-Smtp-Source: AG47ELtIRqmjshFS2Qj2ljbbzDpHJFgruRsxLvRaILi5Z32TXPJj9pSfz7agpXfce8U0w/si94poNg==
X-Received: by 10.28.142.135 with SMTP id q129mr8638957wmd.112.1520247725741; 
	Mon, 05 Mar 2018 03:02:05 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm13042874wrf.43.2018.03.05.03.02.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:02:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 11:01:57 +0000
Message-Id: <20180305110158.10308-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305110158.10308-1-ross.burton@intel.com>
References: <20180305110158.10308-1-ross.burton@intel.com>
Subject: [PATCH 3/4] sdk: only install locales if we're using glibc
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
X-List-Received-Date: Mon, 05 Mar 2018 11:02:05 -0000

Using glibc-locale to install locales only makes sense if we're using glibc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 76fe02c37b2..6cd4115202f 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -130,6 +130,10 @@ class Sdk(object, metaclass=ABCMeta):
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
+        # This is only relevant for glibc
+        if self.d.getVar("TCLIBC") != "glibc":
+            return
+
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.11.0


