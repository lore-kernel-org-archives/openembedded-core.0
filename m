Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1599D73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:08:13 +0000 (UTC)
Received: by wicge2 with SMTP id ge2so6681161wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CtD+uFB0d8WTzbVmdJUCtuwxTYPgF3edar/33CEBVvI=;
	b=GvFukVT0XQwv4EWZmMf+KsdY8uFBIuvdzgiEn0UQOBMvqJ2KnS5hC4d7gkM1oKZRzY
	x2KfR0NzayaEkmvAuCyp1WHWTPyQ6ymnrC2o5BA3ffjgaT+9eNMLgjWvjcmYAbxOoURw
	DNMcIug3FkaZKca9FaeIvX9RLsxRizu2wmHMJ9BIRbbkbM+yC7/PdWnm8bimX/sgkz3s
	GXdunmmJilRKZeO2QZuVQeSFEQNFx2lJdSBcrB1XGEMGfQcRwzxdXRD6c7CEPBOm92WI
	Y4EApFRpVVUGayHYi+G11oL1OR82F5EWNfqWgg0xS/VULNYTU1XvMWcdgikpRR2FKb0W
	VLAA==
X-Gm-Message-State: ALoCoQlYbpDVktUXz1k+bAWadcUZd6l+yqIjjoNTvYUE/0FmTWJooqj2+Brhe6EnAYI1BUD61T/O
X-Received: by 10.194.9.42 with SMTP id w10mr5574686wja.146.1440691693330;
	Thu, 27 Aug 2015 09:08:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ej5sm3760654wjd.22.2015.08.27.09.08.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Aug 2015 09:08:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 17:01:41 +0100
Message-Id: <1440691301-8285-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bind: remove dependency on bind in bind-dev
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
X-List-Received-Date: Thu, 27 Aug 2015 16:08:14 -0000

bind doesn't ship shared libraries only static libraries, so the default
dependency on PN from PN-dev is pointless and means that an image with bind-dev
installed (via dhcp-dev's automatic dependency) ends up with named installed and
started on boot which is rarely intended.

If and when we ship bind's shared libraries we should ensure that the libraries
go into a separate package.

Also remove an old comment about --enable-exportlib.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bind/bind_9.10.2-P3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
index 52244b0..151eec0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
@@ -24,7 +24,6 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "a810d5d65fbdcf28dcda80d646913c3a"
 SRC_URI[sha256sum] = "78079a66dda455ffecfe93ef72d1ffc947f17b1c453d55ec06b860b49a5e1d4a"
 
-# --enable-exportlib is necessary for building dhcp
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --disable-devpoll --disable-epoll --with-gost=no \
@@ -49,6 +48,7 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 PARALLEL_MAKE = ""
 
 RDEPENDS_${PN} = "python-core"
+RDEPENDS_${PN}-dev = ""
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
-- 
2.1.4


