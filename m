Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 971297D01F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:21:57 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b3so5990421pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=iJHaYjQ4J8f3ARmqMoCgYclAkKvH6RBiJvmEd7TcjO0=;
	b=LCU9msX0FS8OGdF9Xr/5eTjwjQIUHHZxaClQQNRPUTQN7wjZ8esC+HQ8safY2tegqi
	y8TESV7Szr8+g7rXFWnzjVirGyziSgSn3MnJsQMFZu092QI9GgjESBZt0g+qBEVtoYW4
	ElH3lQGL94vEpya3Haz+T19Y6Wrq0ZCz2X/6gIE+7NjJgE7HTaMDAumnhn9xWrjYEWkF
	DILP49CdGq2UqACyilN/XNA+KeQCAAh1M0cBoVMLeeQmEPEGf2niJ+BLAkH4B8VUvxsw
	4tE4KEbD/GKW3W/6VJyOudDnxUg32VxOW3sB1teF3gMq8iDbT+BxlFCYqztPL6YBzfTb
	6OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=iJHaYjQ4J8f3ARmqMoCgYclAkKvH6RBiJvmEd7TcjO0=;
	b=jMJR2ZWiXKwsHYWiFJyY2k0AKqC1Bn/5CRd4c9PzsjOK78aOGp40tlcir9Jg408w3n
	aF7PG5mYmQm5r3GpjIePP4KGzLygXbPWrfasrejz07vcts88EYza/a+zDF1UcsOuCQCk
	4I7oUrjAhoR/vCGa4/uL0TvPe47rvGXVaeEGQ+qcJI+3KU32OKiHiDl9xbRif1YwyeWh
	iagGwzkzVlM/IRVHH/Nlc0WdvSl7PvmfmUiFuY6sYTtHoqryel2nPdnypvO8NwWVOsTh
	esKLna97Whtnom8TKStBXaYCCrlhC7KUfmFB8pskEumwzVxIfh0gj1Kzkng3dsS7k84Z
	KbFg==
X-Gm-Message-State: APjAAAUnvkO7sQemRodF2D7gjzro8aK4/kIoKVssC2MisfFxfias3/5N
	YsK4kRvLKA+CNxC3ISxs0qw5kQ==
X-Google-Smtp-Source: APXvYqx0q8Rk5AvFLHDHKEUTts+nu/KzYs9Bab+e6gk4cWskFqLAde5gxdHf7zdwIJNUTTQgoko2Pg==
X-Received: by 2002:a62:2c91:: with SMTP id
	s139mr67588769pfs.196.1554193318701; 
	Tue, 02 Apr 2019 01:21:58 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	h184sm28372192pfc.78.2019.04.02.01.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:21:58 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:21:53 +0000
Message-Id: <20190402082153.3630-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/3] cmake-native: Enable ccmake by default and depend on ncurses
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
X-List-Received-Date: Tue, 02 Apr 2019 08:21:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Enable the building of the curses based ui for cmake. This depends on
ncurses.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
This patch suggests enabling this in the cmake-native recipe, however
this might be undesirable for bootstrapping reasons. Whilst ccmake is
not used normally the added dependency on ncurses is likely required for
other parts of the build so impact on build ordering and time should be
relatively minimal.
---
 meta/recipes-devtools/cmake/cmake-native_3.14.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
index fedcf3d4bd..b2952ee5f5 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
+DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
@@ -13,10 +13,9 @@ SRC_URI += "file://OEToolchainConfig.cmake \
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
-# Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
-    -DBUILD_CursesDialog=0 \
+    -DBUILD_CursesDialog=1 \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
---
2.20.1

