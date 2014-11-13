Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1C860167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 14:09:14 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so332971wiw.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 06:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Cgwqw0UBq1iPEaU7vz8aH5+pNBdZBrJ24Yn7GBgtI+g=;
	b=ObriEK1IypQPX4vWE+ZzZ5LF14zfukyNOhc8yNBzQw0QUIVzv6s1AHQkqpU3GVGpBy
	hRi4RycpUtvfkKKuQ/bH4TxWIQ7GIsjr+5+S2HwiIbBeryQvKaSl4mP7ywC1rQn3NiDC
	me5oX9rKZb9x9wUfcuyYZNZGsFoiVyRvmYz12k4ZazDaiyyP8WxpP/n+oZQ5Y2+0MPPr
	/ZCw27itjBq2bglzKK23nJbxAbWswMTn3NLlRNUACf4sXZLLzldR5qB+cDIsyVya+jfW
	XcLr0gqyvxheBj3ec/yy8z0jdgT6vn04sCYBZov9kaVPiuT30+gS8SvDrXtcD4kFGQp3
	ZyIA==
X-Gm-Message-State: ALoCoQmSSYDG6B89TlB3Mgw8fMi84SlXvR6R2X7siMGsOWDhWUlD1kg+8vPVOi6b2x03lkeas8nJ
X-Received: by 10.180.84.5 with SMTP id u5mr4374702wiy.12.1415887754829;
	Thu, 13 Nov 2014 06:09:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id s2sm25887844wia.3.2014.11.13.06.09.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Nov 2014 06:09:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 14:09:11 +0000
Message-Id: <1415887752-993-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bind: use PACKAGE_BEFORE_PN instead of PACKAGES_prepend
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
X-List-Received-Date: Thu, 13 Nov 2014 14:09:22 -0000

Appending or prepending to PACKAGES breaks when the package is built natively,
so use PACKAGE_BEFORE_PN instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bind/bind_9.9.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index ebd38ef..73f386e 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -46,7 +46,7 @@ PARALLEL_MAKE = ""
 
 RDEPENDS_${PN} = "python-core"
 
-PACKAGES_prepend = " ${PN}-utils "
+PACKAGE_BEFORE_PN += "${PN}-utils"
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
-- 
1.7.10.4


