Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 92B816FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:24:31 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n129so37196472wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WQgI9L2eKyKbL0ws76S9j7q6FUZOCck5s2IOV7pDZMg=;
	b=dpNYxM7YyRlwsnG7fFFsHxt/mpOcbEqade8pRJUyHp4GRP8FD/Fh7cAtHHNZ4m2V++
	yzAVzNw+r0QOjyAMfor7E6+ftrsFX+50F+JNcTdtxfG2EtcpYq4bFV7YqiEmB/uXEUFF
	m6/nu4fv4UjpeNvMoaAkydo0dx3QFdrRNKbRYW9JUuXsgH0ZnA9DK3Zij8SP1kmzng7k
	mcsUuQJh9NlSwqcUzX2fR2u9AjHObIk1AEJgax1HJhx0miwL6xjxisdYSybsmzIpIqe6
	no01uFFTlP8kk2chk7wGHr9tzTwGfEtYaAw797V+K516ax8o9Q/kfK5f4w73ErHDi/Wo
	tbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WQgI9L2eKyKbL0ws76S9j7q6FUZOCck5s2IOV7pDZMg=;
	b=fHLH5rDesgxVZTDNnRD+fwyjVXQYVrKBCAoXvbigJ8pXzBErvpgv2+m7DKKNKlb6br
	a1AWWwD3oRc8+/lkpKMYL2z2ch3Nk0kLsy7xfC8qTtwTbAHwtvLfuzVieo3Mg/bPZ5cT
	fJACmVv0jQpJJnq5kCCqRra3s2MTrWwaYh263pW0bRumoixGBZMmPhfGfWLLe3hZHlJz
	PQfFPAYnKC7lvjqXQyJPnbjlGD58zDWqRRzNFGdFavNGCaRW6350Tu5ByDm4M4n3QTqq
	qLdyL1F6PEKO8vi9ycvoIC/TJhyHcYTTOyAGSM6DbwsfoBD6rwJC75tMZvELB+C3zPc9
	1V+Q==
X-Gm-Message-State: AOPr4FVnuBl6jWDYuCSb1juL2EnuMeWS/ibtXHX6SfOqelg+7e9y2YOa6GyT9XeES/XzanKT
X-Received: by 10.194.172.228 with SMTP id bf4mr10507792wjc.123.1461777872412; 
	Wed, 27 Apr 2016 10:24:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y70sm9528934wmd.3.2016.04.27.10.24.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 10:24:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 18:24:30 +0100
Message-Id: <1461777870-27397-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] dbus-test: install executables not libtool wrapper scripts
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
X-List-Received-Date: Wed, 27 Apr 2016 17:24:33 -0000

All of the binaries are linked with libtool now, so install the binaries and not
the wrapper scripts.

Also remove dbus-1.init from SRC_URI as dbus-test doesn't use it.

[ YOCTO #9528 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-test_1.10.6.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.6.bb b/meta/recipes-core/dbus/dbus-test_1.10.6.bb
index a768a09..3748fe6 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.6.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.6.bb
@@ -12,7 +12,6 @@ RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
-           file://dbus-1.init  \
            file://run-ptest \
            file://python-config.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
@@ -49,13 +48,11 @@ do_install() {
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/test
-	case1="shell printf refs syslog"
-	for i in ${case1}; do install ${B}/test/test-$i ${D}${PTEST_PATH}/test; done
-	case2="marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
-	for i in ${case2}; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
-	case3="bus bus-system bus-launch-helper"
-	for i in ${case3}; do install ${B}/bus/test-$i ${D}${PTEST_PATH}/test; done
-	install ${B}/dbus/test-dbus ${D}${PTEST_PATH}/test
+	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay"
+	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
+	l="bus bus-system bus-launch-helper"
+	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
+	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
 }
 RDEPENDS_${PN}-ptest += "bash"
-- 
2.8.0.rc3


