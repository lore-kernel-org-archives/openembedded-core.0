Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 450D7781C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=3rMk71eh5KszYdaXsmNolO1wcnPmmzqQpduKrANCr7M=; 
	b=nZJii7e4KdYQfuoT7KwMGxik48A1+OTTm86jr8FRsM1kgL3s2qOQPM1d8w820lNvNU2l7gUiwlkOfd/bVX4f2QCfQI5+blyMSdMm2cVJm/hpe787Z576Epm2DmKC4kc9AXJ1aPxm0eOTjafF1AYd63fIjqYXVwvv7fYSnII237CfU0ASnR7QboXo9923oftQHBb8Xjk0rCO+Lf9yl0qsRpM3HS/8dhnC/iaKdiWd9FVHJIl13xrPTtZqZM7pUHKXA1dIyrxfhhzfi7iXQDCylzQRDDI+L9p3fww3Im3EYwvOdv8Wt080jkO5klsF4adiS2D/3gp9j1ZClGkbx8QZZQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQG-0005Kd-2N; Thu, 20 Jul 2017 16:23:20 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQG-0003G6-13; Thu, 20 Jul 2017 16:23:20 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:22:48 +0300
Message-Id: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 00/23] cve-check related fixes
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:22 -0000

Results from cve-check are not very good at the moment.
One of the reasons for this is that component names used in CVE
database differ from yocto recipe names. This series fixes several
of those name mapping problems by setting the CVE_PRODUCT correctly
in the recipes. To check this mapping with after a build, I'm exporting
LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
packages.

Mikko Rapeli (23):
  buildhistory.bbclass: add LICENSE and CVE_PRODUCT to recipe and
    package data
  buildhistory.bbclass: add BUILDHISTORY_FORCE_UPDATE option
  acpid.inc: set CVE_PRODUCT to acpid2
  bluez5.inc: set CVE_PRODUCT to bluez
  eglinfo.inc: set CVE_PRODUCT to eglinfo
  flac_1.3.1.bb: set CVE_PRODUCT to libflac
  gcc-common.inc: set CVE_PRODUCT to gcc
  glib.inc: set CVE_PRODUCT to glib
  glibc-common.inc: set CVE_PRODUCT to glibc
  icu.inc: set CVE_PRODUCT to international_components_for_unicode
  libpcre_8.40.bb: set CVE_PRODUCT to prce
  libpcre2_10.23.bb: set CVE_PRODUCT to pcre2
  libsamplerate0_0.1.9.bb: set CVE_PRODUCT to libsamplerate
  libsndfile1_1.0.28.bb: set CVE_PRODUCT to libsndfile
  nspr_4.14.bb: set CVE_PRODUCT to netscape_portable_runtime
  python.inc: set CVE_PRODUCT to python
  lttng-ust_2.9.1.bb: set CVE_PRODUCT to ust
  quota_4.03.bb: set CVE_PRODUCT to linux_diskquota
  sqlite3.inc: set CVE_PRODUCT to sqlite
  wpa-supplicant_2.6.bb: set CVE_PRODUCT to wpa_supplicant
  cve-check.bbclass: use weak assignment for default CVE_PRODUCT
  kernel.bbclass: set CVE_PRODUCT to linux_kernel if not set by recipe
  cve-check.bbclass: use "+git" as separator in PV instead of "git+"

 meta/classes/buildhistory.bbclass                  | 28 +++++++++++++++++++---
 meta/classes/cve-check.bbclass                     |  4 ++--
 meta/classes/kernel.bbclass                        |  2 ++
 meta/recipes-bsp/acpid/acpid.inc                   |  2 ++
 meta/recipes-connectivity/bluez5/bluez5.inc        |  2 ++
 .../wpa-supplicant/wpa-supplicant_2.6.bb           |  2 ++
 meta/recipes-core/glib-2.0/glib.inc                |  2 ++
 meta/recipes-core/glibc/glibc-common.inc           |  1 +
 meta/recipes-devtools/gcc/gcc-common.inc           |  2 ++
 meta/recipes-devtools/python/python.inc            |  2 ++
 meta/recipes-extended/quota/quota_4.03.bb          |  2 ++
 meta/recipes-graphics/eglinfo/eglinfo.inc          |  2 ++
 meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb       |  2 ++
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |  2 ++
 .../libsamplerate/libsamplerate0_0.1.9.bb          |  2 ++
 .../libsndfile/libsndfile1_1.0.28.bb               |  2 ++
 meta/recipes-support/icu/icu.inc                   |  2 ++
 meta/recipes-support/libpcre/libpcre2_10.23.bb     |  2 ++
 meta/recipes-support/libpcre/libpcre_8.40.bb       |  2 ++
 meta/recipes-support/nspr/nspr_4.14.bb             |  2 ++
 meta/recipes-support/sqlite/sqlite3.inc            |  2 ++
 21 files changed, 64 insertions(+), 5 deletions(-)

-- 
1.9.1


