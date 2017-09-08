Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id AE28C7827D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m9so1907727pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=87Dzv+vuHoL8Pqc0XkmedFUmnt5l5ACzOzpT6mpPX/Q=;
	b=Td/VNtn8rROusy/yKi6fop2JUt4djLHefwMHBZHWdUsG98irz/lS/R/mKeKfVjTX2j
	ZSf5Y5pnZZKj474o9sVbrmy2dAhSLiyLUW2ZPriNPw020O+Ub5/dMhJ0gMWH9o8mEtBp
	j0MP0S18EL5UKEnSj4QnxS83zmZi62/99nZWREqq377B5wsT2b7TZ6HA7P+emhZgP/tP
	OnKF/YyfCf5OC05B2EYimsMY6CcuYgR2xkdzKNFDQ3bZXH5Rvm5VC+bCAh/HxGjdFMe9
	Q4VnF69BkydjDfoQnGVVBgTVofSLQvCJclO+j4mubCWDnebOTg2k6SPRWPC7oEoZXN/g
	eXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=87Dzv+vuHoL8Pqc0XkmedFUmnt5l5ACzOzpT6mpPX/Q=;
	b=Ojtlzw0q/PmsOnc1ijuUOsOfKISMoPgHV/uSSvjDxCkYV7mds3u/RrU591oR/ds2nl
	eq4rtj9uUWifRKtjrkzOhNhDS9lZY+vtFTJhnXF7TNBetQuexwLV/4yvj3LOXG/rD5D/
	JxRtkE9brs8jxW5VSFwc/+VkILsoGiDuiyOrxqwcOHsNjGnCcAOv1BMJyuCsvig2mHbY
	MKEh/1whVtDtt6y1EvPv643mhUTdmAH3WcdwSNC2hZDXMbNRjDmhPhO5VH4uIDYzet99
	0pGOWi8y/mcjQejIWcaLdMWBCB92EPlya7wdiGkw2dxmDhyiVLfRiX+6MTZ+I5WGth2B
	L0rA==
X-Gm-Message-State: AHPjjUhk4BDS0iBrn53IDnmQH5SoPm8+WoiW+gnlq7MshYSXmODO7Noe
	wysT3k+ez53Ti8lX
X-Google-Smtp-Source: ADKCNb4aoupaPXGfnZzLMmY3q6mnTcyRHfAgH8TJm3xYpxwFgzX8eg5mYR3Mwxmxgn+F7+suMNnF0g==
X-Received: by 10.99.151.2 with SMTP id n2mr4636650pge.452.1504912945020;
	Fri, 08 Sep 2017 16:22:25 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:44 -0700
Message-Id: <1504912911-23120-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 08/15] ossp-uuid: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:24 -0000

From: "Maxin B. John" <maxin.john@intel.com>

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian. So, move all of SRC_URI
to the .bb so it can use snapshot.debian.org instead, and set
UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking continues
to work.

[YOCTO #10040]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
(cherry picked from commit 1b38ad4cb8faeb86c5e8cb6b7201194722c5ef31)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index e77be99..fef3fb7 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -16,8 +16,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6a
 	   file://uuid_md5.c;beginline=1;endline=28;md5=9c1f4b2218546deae24c91be1dcf00dd"
 
 PR = "r2"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/o/ossp-uuid/"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
 	   file://0001-Change-library-name.patch \
 	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
 	   file://0003-Fix-whatis-entries.patch \
-- 
1.9.1


