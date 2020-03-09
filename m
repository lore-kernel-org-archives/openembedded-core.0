Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7050660630
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 23:46:57 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a16so612607pju.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J1ociXCy9j84sP7ZsKHXsIXZfC0iKy1cdbXATzD6GqQ=;
	b=oJaB+NXraILuSMUl8zX0wV2tsMXGTYvpbHA26+zpOqM/Bs2gVPHn+lIoeaIN4MkwZm
	Q9Opflcnsk32qNGAf7NLqjbuhM5CGc7CJbBKWQ7l95chvNe3w7XE+S7ltVklkrsClzNz
	kBQ4h0qLlC+wRifup96ObgF9vmJkY45cvH2BoYHLdJ8+v7iAX01tY4SUX37NhlUyHtIq
	WoW8rzUgjvnR13+ItU/i34FUacuyv23+7ePQK265pbNQdg4WVvVzODI7dwYHvce1wlv5
	MYUdzzG8wdwpnCGnjsjsgjRiSLzWNkiJdF61ZnIsUVhv9QKEharMDoK+k+pnG6+FapO9
	30Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J1ociXCy9j84sP7ZsKHXsIXZfC0iKy1cdbXATzD6GqQ=;
	b=pY83yd6ArmiRO1pW9ZTbFJSYgHu8FYcjxbMAfnXZ/b7LhodIA3d28q38tvuQEYJey/
	Eo3TX+byTohqjPDisrBPIQtNzSQG/7SBWXDbqba3oRsgeKyOVW2NRLz6peEtsFZXRIuz
	b77e0JpmzQILUZh9PDURiSqrs6lhTmSHaWXKRQQfBvovRBtToOuRe80otrEwFquZXuPo
	t/DwfHC+PrhLCaAcb2Zj5FJiURK/xBYhYDk9+EKcKHTIPDHs2x+D1X79I8nijJweHqH8
	zTuYDUpIaQMW7a3P66sIMZJpP3ZBzJvVsLAnscglagfpHP2p0aAw50QSQrjA9QcNq7mk
	ifRQ==
X-Gm-Message-State: ANhLgQ1HPbgRQrdpzq7rnEOhI3QlxfLHxMHmycUXdjCvM9k0uXW9wOfT
	9U5J9ZaMGoEF/PrySiGT2guyVkUEazQ=
X-Google-Smtp-Source: ADFU+vs6CYt5eQoD6TVuB3BPIsWiEVXmgLE4QmSDv6vIw5kSo6yuTwX3Cab/7UFIUsMvCgGrVCsJ7A==
X-Received: by 2002:a17:902:bb92:: with SMTP id
	m18mr9403465pls.46.1583797617984; 
	Mon, 09 Mar 2020 16:46:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	j38sm41654390pgi.51.2020.03.09.16.46.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 16:46:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:47:09 -0700
Message-Id: <20200309234709.1463471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] dbus-test: Replace cp -a with portable options
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
X-List-Received-Date: Mon, 09 Mar 2020 23:46:57 -0000
Content-Transfer-Encoding: 8bit

-a option is linux specific

Errors like below are fixed when -a is used

bus/connection.h is owned by uid 1000, which is the same as t
he user running bitbake. This may be due to host contamination

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
index bea0e74ed0..91e2ba69d2 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
@@ -70,11 +70,11 @@ do_install_ptest() {
 
 	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
 
-	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+	cp -R --no-dereference --preserve=mode,links ${B}/test/data ${D}${PTEST_PATH}/test
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 
 	install -d ${D}${PTEST_PATH}/test/.libs
-	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
+	cp -R --no-dereference --preserve=mode,links ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
 
 	# Remove build host references...
 	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
-- 
2.25.1


