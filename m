Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6382178944
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:27:08 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u46so4579652wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8kURFxRT4PBVNSELlUxuatpw+TRFz0ZnC2VxcDAhbX4=;
	b=sn0a8JOPN0naPIr149hHtZJvaLx+qitGJZ3guZvVRZqcD5eWzUOB96AZ+oGRHaxb4m
	ihgmIrD/K8Ns6cWhJJ1N1I2jAwQlS4bcYT+CuA3xsy+lFWS+YYGBlj0B+RD9UJDZeI5T
	ZBy5UdepXfUXhjZ951eH/DpRr/mYTO+QUbshC6W6Ma7flglp54sStKVaAT/mVluvYHVb
	SVPGjT7izYJjeaNeScrcClEVXi8xAx4QpmYzaXE6RUwXZfh7/irZjxmVoHWwoUoInvCn
	i1i5LFsDJTApbcMZ2FaUe18JmyoNnip8mOEfP7NHTvGQ5aFyoSkEY4Z6RNPIpmHdplLF
	UwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8kURFxRT4PBVNSELlUxuatpw+TRFz0ZnC2VxcDAhbX4=;
	b=emPBTT81x1PakhBAVFjeqKqPBFh3/roannb+JuIrTMt4Muf1CJb5AscdZ7W4YplOAz
	mt/aAKE4CBitkpLmsnV6W2GTa5pIl+GZsFEtEbGJ4KkQ3yXgqLDrWd7DV/pgyOWALTNh
	JhPnAkf5vE5T2vowf5ytdoQrK2z1McdFo3tSqOIbpiLWrW4JeBWppctCBle0WZnxXYmz
	bjtnlMjlNaN2E3fCrV+DmZVAYaLDXnzQouKeRAFXqMGYJpvyPdl3NbjrkohdI3xG0uK4
	zP1CPdNq+uNuyf5Og2H7xn6Vq90mzmcL9Ke2Zecn6WSTa1yoN5cCvDYNUPpm42x4EqJJ
	0WAA==
X-Gm-Message-State: AElRT7E2M8tweeMNBTlbEaJaJSzmwmG+azHJKKRT7gCNUdsx2TRfhvwg
	cL5cuiimV+0lmfJZlNg5pK6ow6bz
X-Google-Smtp-Source: AG47ELsdKreSdw8Pcbqng8+VoXhee7VYefJlIl6Wk0Bl9TpILYkPwezD+IISq6elqlbczHmP9dBbeA==
X-Received: by 10.223.225.142 with SMTP id k14mr9279734wri.38.1521466029677;
	Mon, 19 Mar 2018 06:27:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id s125sm482877wmf.4.2018.03.19.06.27.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 06:27:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 13:27:06 +0000
Message-Id: <20180319132706.15790-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] opkg-utils: use multithreaded xz when building packages
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
X-List-Received-Date: Mon, 19 Mar 2018 13:27:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../opkg-utils/opkg-utils/threaded-xz.patch            | 18 ++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb   |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
new file mode 100644
index 00000000000..13a49f9170b
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
@@ -0,0 +1,18 @@
+Pass --threads=0 to xz so that it will use as many threads as there are cores to compress the packages.  This makes qemu's do_package_ipk run in 34s instead of 275s on my machine.
+
+Upstream-Status: Inappropriate (ugly but works, discussing with upstream now)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/opkg-build b/opkg-build
+index 0050c2b..93a7956 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -230,6 +230,8 @@ if gzip --help 2>&1 | grep -- "-T" > /dev/null; then
+ fi
+ if [ $compressor = "gzip" ] ; then
+ 	compressorargs=$zipargs
++elif [ $compressor = "xz" ] ; then
++	compressorargs="--threads 0"
+ fi
+ 
+ tsortargs=
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index 081d8d8b7d3..0487c5f3059 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
            file://0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch \
            file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
+           file://threaded-xz.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.11.0


