Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6347856A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 13:25:37 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s75so4682911pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=RPN7bHk115y9Pqvd7ZNQDZA3JYGpbW5rhEV88079UWE=;
	b=LdM5f+xnl1ertzhOMWsUkftNZZtUT7aLZzWsnp2sm5MoHO27B3Lk3GB6iuz156kWh+
	0zQyDsgmgBNWp0hnjj7m8YIlhLfr3cLqcvT4rCqBeLXt6CdRtMq6V/PtDxVhmRPxuOTf
	yuT/M5cRoSFPT4LFKLgYBewHb2Qnw20bk+fGkhHmEC7sSAFoCgC2sXWtWbLEAYOyIkXE
	DzJRFI7r48jLph4QmNygXh2C3DNroXiSFT38NK7iQy1afZW6Eh0ZRJSd+pqd0HJ55L+e
	Kw+A2WjtbmrzLy/fUgMtbPZYaKcwgmjJ2iiI2xN+gK+Ly8O/5VG0HbYULfoCo1GO2Osr
	poBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=RPN7bHk115y9Pqvd7ZNQDZA3JYGpbW5rhEV88079UWE=;
	b=oNA0XeGO6JIgdNxHWBm3wSiiehi/oflnimCll7zyPbHNP+AOVynkOUbxQwLOdXx8kO
	a0CLHGQCEsmvv22pTu6Ze10WLm+Ks/aMMiZv8WVrZoZFhXvnPUsea1f3r1j4qtL8M2iK
	rQdC/lNd3f6n3PgcNYauzTxhu7wHjYd49FlThf5ep7motQ8H9dAit13Qgl/ST2f/P5vv
	C5GoOj6brbT9vxRxHaJti5CsnhhACESWae9REp+x3EM5P91X2yDcfJMeaJeL3+FgjkoM
	MkCQi+gjkmKiuoS3ywrEPoVZi3wWjn/HLOf+3pRAcEeyxDzTUgplpIyY3/yfFDIV3FQg
	HDtQ==
X-Gm-Message-State: AJaThX4yJUMkpyveN7TqGBnsYLr0nnl/e3SsXeHXahfUlOd9TWGcW7hq
	Fl+VnIUtHlUrj4x6ioYixj37M9hLNvw=
X-Google-Smtp-Source: ABhQp+TNOdoWvQ/ECHO5fHr+Sml0ORt/yRRlv8ykFCHwrc5XnLJb9yHW7opjp39dP9uLKUItCx+t4g==
X-Received: by 10.99.55.82 with SMTP id g18mr472681pgn.31.1510233939116;
	Thu, 09 Nov 2017 05:25:39 -0800 (PST)
Received: from [127.0.1.1] (CPE-143-238-146-54.lns1.woo.bigpond.net.au.
	[143.238.146.54]) by smtp.gmail.com with ESMTPSA id
	k3sm13579618pfc.44.2017.11.09.05.25.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 05:25:38 -0800 (PST)
Date: Thu, 09 Nov 2017 23:25:29 +1000
Message-Id: <20171109132529.26285-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] busybox.inc: Add sanity check to test if the suid binary provides sh
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
X-List-Received-Date: Thu, 09 Nov 2017 13:25:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a sanity check during the do_compile task to fail if the suid
busybox provides /bin/sh. This is considered as a hard fail since not
only is providing sh as suid problematic for security reasons but also
because the sh configured for suid is less functional than the nosuid
configured sh and breaks a number of required features (e.g. 64-bit
test).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4012f921c6..157aea3968 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -183,6 +183,12 @@ do_compile() {
 			oe_runmake busybox.links
 			mv busybox.links busybox.links.$s
 		done
+
+		# hard fail if sh is being linked to the suid busybox (detects bug 10346)
+		if grep -q -x "/bin/sh" busybox.links.suid; then
+			bbfatal "busybox suid binary incorrectly provides /bin/sh"
+		fi
+
 		# copy .config.orig back to .config, because the install process may check this file
 		cp .config.orig .config
 		# cleanup
-- 
2.14.2



