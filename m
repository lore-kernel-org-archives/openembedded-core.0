Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyRGA-000847-Di
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 19:10:47 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 09:55:07 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so10713077bkc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 09:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=W9W2XEFInDeGMZvwSENVJbHlPXPpp8g1lzBEAV6PCHA=;
	b=lOyfF1BODX8Rjxk00c4yrXXKKMEm1rSPFjdvtbXtFqRX0iIKVOTq7wzICiURCLL4uf
	FCN0p73Il7SeU7U4AAd5dz0mu4qV4+tN+12qMxIVK7lC5xlBSwGNdmo5GxgrtwsmchnJ
	GgPTddq9/np++W+HvB8ivipDkuaY8e2Z0bHE/NiSg5U+Nm6dZCVaA6sKccQDIw7StELe
	xP5+pgdoRw72VsitwJx+2g/YMRVYPisqlklYCtbJQqPCRRbZey7eGDErAM2nDqTYYvgV
	Rv4CJbcG6bXdqdi5zF3T3XzptfAWfHXx5/jphG/fbl/hIGw7xKUfFhgv+fTH9XbThtOT
	tz4w==
X-Received: by 10.180.84.193 with SMTP id b1mr4721368wiz.26.1359050096202;
	Thu, 24 Jan 2013 09:54:56 -0800 (PST)
X-Received: by 10.180.84.193 with SMTP id b1mr4721360wiz.26.1359050096138;
	Thu, 24 Jan 2013 09:54:56 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm3681314wib.5.2013.01.24.09.54.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 09:54:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 17:52:55 +0000
Message-Id: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359049755.git.ross.burton@intel.com>
References: <cover.1359049755.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmWBLQ3bzcFkWKnbhiNJwNEMeypyhLexS7MhU/AGyRoUewdrDsG4tj2vxXp8QhGB24tUO7vGk6TqpD92WAsFkFx9A3tmK88tSiJJiJLYCLBRqscNFp3tWK08gTD6ClbsqghSiAvrPSN4ZRJ+Bm+uwJs3NCuTSaFOdYuMuU3teBujW9CSHjZYUCM/bmv2sRyo5oSHSRP
Subject: [PATCH 1/2] bitbake.conf: unbreak all builds with custom DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Jan 2013 18:10:48 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Commit 9e7c64ca9afbf27edd0d35a1830ce55ee6d778ab broke all builds where
custom DISTRO_FEATURES were used.

Resulting images ended in non-bootable state due to lack of initscripts
(unless someone had sysvinit or systemd in D_E already).

https://bugs.launchpad.net/linaro-oe/+bug/1102910
https://bugs.launchpad.net/linaro-oe/+bug/1099405/comments/12

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dc50ca..607fb70 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -738,7 +738,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio"
+DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 MACHINE_FEATURES_BACKFILL = "rtc"
-- 
1.7.10.4



