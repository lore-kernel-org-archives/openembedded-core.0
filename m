Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 395356E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:25:23 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z48so15153635wrz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ilraV5y/YHyYZ/kDZn/IGFOidXQ7ZXVGy8J1pZyMaLQ=;
	b=dmaWld7P1n0eTu8mtLocgQeRdnTwOsK6jNpJf3Egh46RupZpPSZgrzOP96t3zA4KoD
	z88NdfB8vwVc5GT0Gyx1tKL6IMXbtA2GanhyYFvrixUMpoCo8NDL/6+V0kxL7UrC3/Mt
	z2m+Wj7IyOBOL2PG/anzlKnsIdNZlZRVD7p7oHg8zcMSjoLH1WqX0CU3mE6KKOQSRO3V
	B7nvLHsFcQQ61e+V9/FOo0ehq+Z5X1ouCOn+7RCBwMaNzCMeB0pdbHF0hdqeyZTW1Y81
	1kF4KNgX1zAJcGK9Ts7x1MBgjUVOpcC8UBsSvRkGPdVpdaSpj2ZoOveuU+C/iwluUTqA
	6gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ilraV5y/YHyYZ/kDZn/IGFOidXQ7ZXVGy8J1pZyMaLQ=;
	b=D9egqJYLwDPM9ZBY9y5s3G5M9N6XWklG94Gfw/kfV7dK+r5CPk8m6r1EsbjmyppffR
	+6ZHoXzogyQQnVfzIK6LdpJtG8yNoOMNSz7mrsmaEny6kuVFYpSXLbUhpd7sfKjCIX4I
	C14aS90f2PZBWZ+XlrOKiRW6YixQQI5Jq4aZR84EHBNHHAJIItoIpA0XOe7NOV3S6F7F
	6vI2BfJG+BN3qbBD6TUdOVt5qzM3lE56OcwmebAUQwCEhGXnftHEL193cmsTkm9VuLvH
	ziiwTfQttumldXOrgoEOlWM0jl1mzgf9XhqccazR0MG/se4r/5h7LC0vm+1WT3X3swDN
	u/4A==
X-Gm-Message-State: AKwxytfmhDM3uP2szBkj4YH+tjwXyfvzFu5wcSYiteLjAEhNjkL1BAgo
	JbOLUSOFea4AUOIBL3LfeaQMkFw0
X-Google-Smtp-Source: ACJfBos8ciF9/wNbqVf3n0uLKtG2Hk7RsXooK7F/pr9KmNPPgpT+vfClfWCM4gMqMZqeSd4iMGIkuA==
X-Received: by 10.223.193.71 with SMTP id w7mr10099739wre.88.1516109124557;
	Tue, 16 Jan 2018 05:25:24 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f76sm1731576wme.2.2018.01.16.05.25.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 05:25:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 13:25:15 +0000
Message-Id: <20180116132516.27653-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] cmake: allow target names to be overridden
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
X-List-Received-Date: Tue, 16 Jan 2018 13:25:24 -0000

Don't hardcode the targets used in do_compile and do_install, instead build
"all" and "install" by default but respect OECMAKE_TARGET_COMPILE and
OECMAKE_TARGET_INSTALL variables.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a4079dab0d7..10c4edcf1a5 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -34,6 +34,9 @@ EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
 EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
 
+OECMAKE_TARGET_COMPILE ?= "all"
+OECMAKE_TARGET_INSTALL ?= "install"
+
 FILES_${PN}-dev += "${libdir}/cmake ${datadir}/cmake"
 
 # CMake expects target architectures in the format of uname(2),
@@ -140,13 +143,13 @@ cmake_do_configure() {
 
 do_compile[progress] = "percent"
 cmake_do_compile()  {
-	bbnote VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OECMAKE_BUILD}
-	VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OECMAKE_BUILD}
+	bbnote VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
+	VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_install() {
-	bbnote DESTDIR='${D}' cmake --build '${B}' --target install -- ${EXTRA_OECMAKE_BUILD}
-	DESTDIR='${D}' cmake --build '${B}' --target install -- ${EXTRA_OECMAKE_BUILD}
+	bbnote DESTDIR='${D}' cmake --build '${B}' --target ${OECMAKE_TARGET_INSTALL} -- ${EXTRA_OECMAKE_BUILD}
+	DESTDIR='${D}' cmake --build '${B}' --target ${OECMAKE_TARGET_INSTALL} -- ${EXTRA_OECMAKE_BUILD}
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.11.0


