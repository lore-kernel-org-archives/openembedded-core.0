Return-Path: <mateusz.cz.nowakowski@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5623860557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:18:25 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id h96so2456899lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/zSZjaOMSY8ZUUy0cL0/AJQweYWlS31r0JGv1lG82bk=;
	b=Qcnj8qJdJtXdxtSHOADpXd1jt5bLJaxcG3yOt0fPwOa/ERdSbPSgbbGlmBPGPwfw8T
	ZxymqRCVglLZmMMqOEE/NaFF9rZOXXHntuwX7DpyOHPBMul7oL47CmWypoGl1oTfIuVc
	2rmjz+2s2xpz5I/HCh+dQMEwduiQ300aqPH0RIYESLF80H/zBbaOdIOFQgREvG+9l2lH
	qH8yGvfK3i0Gdwx//SaiiJHTxfYmJatLFgPItlc9rPDrJJVkZU5Abh+sJCjk9Ed2+mFq
	knIzBBT/JulaD8RkQq8UAJpNU81zmG2id6SvJ6awFyuKkwJ2VeUvwOpodmE6G6R5Zi0V
	IpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/zSZjaOMSY8ZUUy0cL0/AJQweYWlS31r0JGv1lG82bk=;
	b=WEwf5xvSmyG4jErPaG8i05BR9bXKe/Z4BgqgQlC0aFk5btxt/Ng+1Y2p4AQJH6Kg2j
	r2bLuB9wCtyBsA/MemgVn+q4dDchHf7aHVv7XSosRhF/ZhSocpx8RcZCKof7QoUHcokU
	5F3XWGiZ5LuvF83LRzQWQQ6EiF5Y6NK3/fVDKTLuANmnxsN25S43qujZFVodGKRb8rwy
	lUKsRwDgs4GDK57m4Z9LV8gOCRU1oqEjBcAanRl/HSigACYEiXMWOc/ZjNYv0G680WZ1
	U0v2FVF2sHTdIE4aeqDhgjw1C9f+ParM6IcX19RaEB5clTGpcmRfx2AbaoJQKu/HlPLm
	jjBg==
X-Gm-Message-State: AA6/9RlvnzrVOLvjaLpCEKzzDiGSBzW4SN8bzxCCKY39DmfgZg1DR+9HGfmsGyPwEAKG2Q==
X-Received: by 10.46.1.231 with SMTP id f100mr3936541lji.21.1475266706676;
	Fri, 30 Sep 2016 13:18:26 -0700 (PDT)
Received: from localhost.localdomain.pl (87-206-133-125.dynamic.chello.pl.
	[87.206.133.125])
	by smtp.gmail.com with ESMTPSA id f9sm3321280lji.19.2016.09.30.13.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 13:18:26 -0700 (PDT)
From: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 22:18:13 +0000
Message-Id: <20160930221813.4209-1-mateusz.cz.nowakowski@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gmock: fixed installing pkgconfig file and libraries on x86_64 architecture
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
X-List-Received-Date: Fri, 30 Sep 2016 20:18:28 -0000

Signed-off-by: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
---
 .../gmock/cmake-Add-install-command-for-libraries-and-headers.patch | 4 ++--
 .../gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
index 92a6393..0dac998 100644
--- a/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-Add-install-command-for-libraries-and-headers.patch
@@ -29,8 +29,8 @@ index 572d044..90e797a 100644
              src/gmock_main.cc)
  
 +
-+install(TARGETS gmock DESTINATION lib)
-+install(TARGETS gmock_main DESTINATION lib)
++install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
++install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
 +
  ########################################################################
  #
diff --git a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
index aa38fe4..8ffe1a6 100644
--- a/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
+++ b/meta-oe/recipes-test/gmock/gmock/cmake-gmock.pc.in-Add-pkg-config-support.patch
@@ -27,11 +27,11 @@ index 90e797a..98fd824 100644
  # Project-wide settings
 @@ -87,7 +90,9 @@ cxx_library(gmock_main
  
- install(TARGETS gmock DESTINATION lib)
- install(TARGETS gmock_main DESTINATION lib)
+ install(TARGETS gmock DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(TARGETS gmock_main DESTINATION ${CMAKE_INSTALL_LIBDIR})
 -
 +install(FILES "${CMAKE_CURRENT_BINARY_DIR}/gmock.pc"
-+    DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig/"
 +)  
  ########################################################################
  #
-- 
2.9.3


