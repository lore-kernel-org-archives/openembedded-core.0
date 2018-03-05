Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B34DB78A6F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:02:02 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id f14so16759498wre.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=B7mhhfys3sr2L542YIwm6NiJvuL3JbokzeUhKRnFGxI=;
	b=j1YtlLzYLj1IlEVOLwDJOtLK8ceUarposvhFJcgernzlIXtnpxKUuMDsrvLtRL6o80
	rGIYi8++EMptNXCxu0oNgoAdYkXogoxiJr5ZMWKsKDJxKRJ4tKdyRNGhjvDSZNh8QoNY
	ye6i/LAf2p0p5AflG6D6uW7Yllb6f0yEANL/x1/Unhhw/Nt1u6qoSVTDDKiSXlZLl6ob
	+m+JPvnRBJWJICd/z7FifnnmaWuVL2GDjar8ku+u9eLolWjHjKGnflL8SJjyWR1nikdI
	MXNYbni2syum1xCQbCmVByBbfUmxAUqk2W0gzdy+xA24GT1DqIkXS1IXX9Vk/lyk5qeu
	/0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B7mhhfys3sr2L542YIwm6NiJvuL3JbokzeUhKRnFGxI=;
	b=eETtgd4vc4TAJBs35A6D1ivrPvetLrwkMZ1Cr929sC5ycyrxzWFqNGk78twqy04/cf
	mjAnbr6DZJeIid6PIwPVfh5gx8xR8CAoOJ6ZaDlBYp1Mn5PiXQ7q0AK4lv8FFlPMal/A
	m8qFiIMk0dcUIfNYrMwwTChbtLu8kWK0F+R6j9sCAPhtkmVcPhBwtudAex6cW2DrIHZ/
	V5qkf0Q3Q8icdEoVadG54ScWei0DZt89Eik+1cBfIoRmvFI1pvdXzgkq0lRJkJlaPwkC
	uDKbY0GoPMM37vIjRKqp45Ns2KM+ucn38ITrD9Pnx7SY4vux0ETzR2bbPRTAruz4WWq0
	5wfQ==
X-Gm-Message-State: APf1xPCirDGYHpT9yjaYDujEYYdotXexv4qswMZlYGMGAiqMNgaWf0rA
	019e6JyI8Vr+LmeE1q4Bxqx8sb2x
X-Google-Smtp-Source: AG47ELvt/NRnSn8mR1RTPIKqnSKidl9bZla2pUUiVp1LQo+rjl2aw5/nPPiV4IpLKpGUCpwisi4TzQ==
X-Received: by 10.223.176.228 with SMTP id j33mr11554188wra.67.1520247722856; 
	Mon, 05 Mar 2018 03:02:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm13042874wrf.43.2018.03.05.03.02.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:02:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 11:01:55 +0000
Message-Id: <20180305110158.10308-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] xcb-proto: solve python cache colliion
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
X-List-Received-Date: Mon, 05 Mar 2018 11:02:02 -0000

Because I didn't really want python3-native to be at the bottom of the
entire X11 stack this recipe jumps through a small hoop to use the host
Python to run some modules it installs into the sysroot.

The Makefile compiles the Python module, which is good as the cache file
is recorded in the sstate manifest so when the package is removed from the
sysroot all of it is removed.

However in an enviroment where the sstate is shared between multiple hosts
it is possible that a different Python is used and this will generate a
new cache when the code is executed, which is not recorded in the manifest.
Eventually you'll end up with ownerless cache files in a sysroot which
conflict with the same file coming from a sstate upgrade.

Solve this with a SSTATE_INST_POSTRM which is ran when sstate is removed
to ensure that there are no Python cache files left behind.

[ YOCTO #11809 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 712ab6c59ab..25a8373e0b9 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -34,3 +34,20 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Need to do this dance because we're forcing the use of host Python above and
+# if xcb-proto is built with Py3.5 and then re-used from sstate on a host with
+# Py3.6 the second build will write new cache files into the sysroot which won't
+# be listed in the manifest so won't be deleted, resulting in an error on
+# rebuilds.  Solve this by deleting the entire cache directory when this package
+# is removed from the sysroot.
+SSTATEPOSTINSTFUNCS += "xcb_sstate_postinst"
+xcb_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		cat <<EOF >${SSTATE_INST_POSTRM}
+#!/bin/sh
+rm -rf ${libdir}/xcb-proto/xcbgen/__pycache__
+EOF
+	fi
+}
-- 
2.11.0


