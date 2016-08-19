Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC64B70031
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:18:15 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id k135so2827757lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TH6E+fR70fMjCszTiPA5z+n0r0HiewV+XG/JvYl6Zd8=;
	b=lDo0aYZfYw4k6TmL0Pjgb/FbgjJL203HsN005mD+ji3BqZKx3qDKXMtw4m3aa2l4Yg
	N2u52lRy9y5hWqQ9yvfnIbWPVfGKTRlzqupXJQZ2S93UzOCm566ZkRqMffqme0tKxLwa
	BCLPmufN5wPz+t/aEoDEE9wA4VxB0ryoGBEq2Ihm79kYikfozk53sIXh086XcUsIbrfP
	YNEdO/9k9Z6lc7Nu/dJ2iMDIKy0RdmAkss/67CxKpNqUu7OUxcbRG0Wz3eeF/+uc6YCQ
	vPhFFRv6qP3SYaR3h7BgEHODTVcyct1ENUHRf6U5jx7xXE1IhUbAuHxeeVC6dPZP9BQj
	b7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TH6E+fR70fMjCszTiPA5z+n0r0HiewV+XG/JvYl6Zd8=;
	b=V74VYxkfq8Gz5uJ2w7lBu+FjdIxs/Ym7gH1sDhxitn3SsZZRxq+eS7L7tOeBHwrNRG
	bGcLBQiHqIEFk0q/w+13NHVGFKppqGsGrsc3INv3J9wJlqlS48sgRoPK3iKADfD3++TP
	0nLqICnjh+Rt2f/KvPOgiEC1++2Tl/qZl3ebVXn9p6pNkiMC6uMt21HgVw4ZMz7FSIeg
	OxXppkPqSOeC+PaPujldNG1NxmAdN4sA6zuUCaIJoAZVGfWjOMQDbRDhtJWvbgRqfmPs
	mVnWFt3iE2Ig25z8Q87pJo4ww7xdtEGngkS6hJ+5OZLw9rGBsSomB9wPEhsHjf7SxLBm
	2U+Q==
X-Gm-Message-State: AEkoousGpOI2hG6qGViMOmGkz3yf1ZFAfEFFpX2YNYWPvbPIM4KsCsZjPrhrFDUmb6Cylw==
X-Received: by 10.46.32.203 with SMTP id g72mr1639366lji.30.1471598295725;
	Fri, 19 Aug 2016 02:18:15 -0700 (PDT)
Received: from localhost.localdomain (m77-218-242-3.cust.tele2.se.
	[77.218.242.3]) by smtp.gmail.com with ESMTPSA id
	h88sm1066151ljh.23.2016.08.19.02.18.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 02:18:15 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 11:18:13 +0200
Message-Id: <1471598293-5254-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] bootchart2: Add ALTERNATIVE configuration for bootchartd
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
X-List-Received-Date: Fri, 19 Aug 2016 09:18:17 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Since busybox also provides the bootchartd command use the
update-alternatives mechanism to address this.

Also let bootchartd-stop-initscript RDEPENDS on bootchart2, since
/sbin/bootchartd is being called in that script.

Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index d039b1b..bc8c1a8 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -97,9 +97,11 @@ SRC_URI = "git://github.com/mmeeks/bootchart.git \
 S = "${WORKDIR}/git"
 SRCREV = "48e0071048564c6af75ab969e842d6dec808da09"
 
-inherit systemd
-inherit update-rc.d
-inherit python3native
+inherit systemd update-rc.d python3native update-alternatives
+
+ALTERNATIVE_${PN} = "bootchartd"
+ALTERNATIVE_LINK_NAME[bootchartd] = "${base_sbindir}/bootchartd"
+ALTERNATIVE_PRIORITY = "100"
 
 # The only reason to build bootchart2-native is for a native pybootchartgui.
 BBCLASSEXTEND = "native"
@@ -142,6 +144,7 @@ DEPENDS_append_class-native = " python3-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
 FILES_bootchartd-stop-initscript += "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
+RDEPENDS_bootchartd-stop-initscript = "${PN}"
 
 FILES_${PN} += "${base_libdir}/bootchart/bootchart-collector"
 FILES_${PN} += "${base_libdir}/bootchart/tmpfs"
-- 
1.9.1


