Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 184557E417
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 10:51:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so20521466wru.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Pzfc0b2TQQ4N9SeplxZUpjt/8u5/e2GHytKBmhNzTzU=;
	b=IbWB1XNK5U+qkIlu6ISkTecFtR4JprR+CwepNNjT7YDKAyqMHO6Hj0L6bOzqXm4aLg
	zdzPtSjwm+hy9mV3bG9CB46Z7mmoDv8Y0uoXw0jerBIdSbk69PVRvlZRzTbMykdDJh+0
	igLAkk1U7FEPyZxJ1dxLTs/vN0cMOOkeYBXJAN59w6YFK8mZk/gU+SEgAcDWHsoJitKM
	Bd6rpGdFbfamoFINToZqPTMy4B0MnL2UczOmmujg8RIy6/t8tG5mkcI6WLR/JvgGHQA5
	IThfTd6Bi+XDwofKy3AoSCzaYN0LAI5tMM9vjmcLELuaoJuO5w8usi8lNOuru+k2aAGd
	voJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Pzfc0b2TQQ4N9SeplxZUpjt/8u5/e2GHytKBmhNzTzU=;
	b=Ea+pqVVj62fsInHCogGpOpAyNRWUld3m3sT3tV87h9hBL2zs16w/KDx5B2joAeyMjA
	tICmKpBSyq1qkVUwuF5P8RY4+fg1jCHajc9jwXOcvR8c5erHiAp2gs0HAaNDsniM8ywY
	/SA/GO2coKt9sMYcEJTk2nBcrZdSXxVcTrec23VvzobwuX+up+H4JfqxwEhZ9umMK0ZL
	E6lyhFaR/Iuq5FLffV0phRpUIBQFU/etsa+rrOqmm4+dcOdCmNE3xCsgvAok/+ALNeGa
	BJUxRT+SqtJwENKDkjx9gotentF89AFBECBBCrcf4rygH+FtZQlFFnJWVmS5pzxoBiFr
	NWbg==
X-Gm-Message-State: APjAAAUUFpMuRSs8SM+NmjAoIwzHTKVbaWR88r+AsDU+hmldXecoatPF
	IcpkCVJq68ovjc3RGevOnarUkmgh9OA=
X-Google-Smtp-Source: APXvYqz9dYGYJkWiHkk+ccxNS6fxatslwO4JNemNcWfmlDkt8ERQTQO2JHZkNJ/U8RJ+Lcvs/UTZlQ==
X-Received: by 2002:adf:e504:: with SMTP id j4mr4363199wrm.222.1562669461715; 
	Tue, 09 Jul 2019 03:51:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h133sm2775142wme.28.2019.07.09.03.51.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 03:51:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 11:50:58 +0100
Message-Id: <20190709105058.18759-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709105058.18759-1-ross.burton@intel.com>
References: <20190709105058.18759-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsndfile1: remove redundant autoconf seeding
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
X-List-Received-Date: Tue, 09 Jul 2019 10:51:01 -0000
Content-Transfer-Encoding: 8bit

Twelve years ago libsndfile was badly detecting large file handling and
generating bad code[1].  The detection code in libsndfile has had many fixes
since then and this isn't needed anymore (verified by comparing config.h when
built for qemuarm).

[1] https://git.openembedded.org/openembedded/commit/?id=875cfc6f23ae68c6215bf32eb01a486f0387cb92

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 7dfee4e96fa..ffb45855a4b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -33,9 +33,3 @@ PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
-
-do_configure_prepend_arm() {
-	export ac_cv_sys_largefile_source=1
-	export ac_cv_sys_file_offset_bits=64
-}
-
-- 
2.20.1


