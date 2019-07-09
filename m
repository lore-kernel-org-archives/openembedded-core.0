Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 746CF7E417
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 10:51:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so2568554wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J6NahXyySpweSUSkiFjRx9ID5GJwykc9exj7RHoydJk=;
	b=yjoBpGIQU8zRgf7co+EFHLOdBlM5nj48hsOPvnTNuVszwUewGapWQtw8hUY0HtPHMM
	0BTH2mLEYYKVaCVf3rtTuXbn771V2OXRd8LMojhqmjZ6LzDc49OJkk0MIBpmAh1PPOWt
	kKyRYoIg8Q5KxB4zk6Ug0SkCIbqLt7Ywj8nKROgU0s2/lK2zf4Z8fxUlZcON5w7vcNCX
	TcAE16iWdswlOj5YCVBeOJbgOlL5Juv+zU+0zGv2hbA0WzdpMjxbbGR95GFF/XXML34p
	p13SATKhlWPUKW5nvRR+WL/YhIHF/bseB6aAB5YpKI1XxckeRSiooEK4yXm0tOGaiYeJ
	QQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J6NahXyySpweSUSkiFjRx9ID5GJwykc9exj7RHoydJk=;
	b=LZgpUR57hT7RZAlWbFb1WPKhKtxpmeJ2paL8ByMVNrBHndKPL2rfjaLqDni/NEChaB
	vlhrhNOhzyfkqcLec6hoYr7RqAmj1cXCRzMBWKq5lKNxxgIgTmhjyyLvU76G56wK2KNp
	09rtk/2iM8NSzsD3KbyIG+/allCf7gko7h3kYNyoBfV7kOMyGvlRM0BhA7CHTrtk2YOC
	3gSShcuRw2nes/xYXAsMztsz8guvmMSSUmnXGKvGKadTzROop8ziogLAeqGF5MKTOAnT
	KDj/7K10RL8Sv8lLvPo8KHgWHgYJUcyQwBBmSRRpMFZ0TwumU9Q/4IyzbA8TIm1bPGoz
	j8PA==
X-Gm-Message-State: APjAAAWD/D9UkTz9KQXuD9j0NgdYBHJWAI25g9YvmN86JGkGOZpcTXSu
	wpcYK+Z5AeyrEUBi64yDAJxbl2KGBhk=
X-Google-Smtp-Source: APXvYqzGddhU411+IystAH6l0BztDqcrwP/AFLd3is4Q3lqok9xxGv+4YLxQNa5WD22mvceDKWpwXg==
X-Received: by 2002:a1c:5f87:: with SMTP id
	t129mr23157596wmb.150.1562669460596; 
	Tue, 09 Jul 2019 03:51:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h133sm2775142wme.28.2019.07.09.03.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 03:50:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 11:50:57 +0100
Message-Id: <20190709105058.18759-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libsndfile1: disable use of sqlite3 by default
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
X-List-Received-Date: Tue, 09 Jul 2019 10:51:00 -0000
Content-Transfer-Encoding: 8bit

sqlite3 is only used by the regression testing tool, which is of limited use
unless you're the developer of libsndfile.  Add a PACKAGECONFIG for this, but
disable by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 77393db8470..7dfee4e96fa 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Audio format Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
-DEPENDS = "flac libogg libvorbis sqlite3"
+DEPENDS = "flac libogg libvorbis"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
 
@@ -30,6 +30,7 @@ S = "${WORKDIR}/libsndfile-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
 
-- 
2.20.1


