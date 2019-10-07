Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC3B7E468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 19:38:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r5so16626069wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JYHNh2A46J9K+EsYFstXtybzcGOqTmViK3Oc64saHbs=;
	b=Y508PVTrWdQf3ymW8iHdqC9b5zqobarlbFI70Afd6XiEOQtf5eJdjri/rZ+Akj992+
	wYeqfCL53QEY5itGu9VlJEo27RagYV1ysDw86k7AMoSgCp6Rd6zqG1sxJ+DZAklvmYL/
	dnSbOboM9Dfk2QDL+Q1Oj1pV1OYKXDmDTntg+bIlCCq4ow688/+tMYWMGrYoJbl5Jeov
	lPgbMGSzRkC5dhfI+5FTfuD7JwUVJBP93AVKuR62QuiMFsVsKQp6caS8kHhE6XwIujjP
	Lc1wNSipKSM05aqmGEQYy5rh7hZnvlIslWP0cK6YJ+toTmKpWqQg/O5cbrAE+nqja8v8
	vAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JYHNh2A46J9K+EsYFstXtybzcGOqTmViK3Oc64saHbs=;
	b=fqI6q0+tOOHzC2Vobz9+BQ6Qe16cU/dXZlVtbUAfR1VRwjTFRPV8lLra3YmCMVFD7h
	HN6EDgyxKLro77vjocautKa+DQ/lLsWZqffIIrz8XYqjPZbh6SvvreEFL4UEyoTX4Det
	AW5QADUcRufY3RVNSR1H464ywu5WRj1l7BSjdCaLjixOymWzQi9Busp77ETWb50/9zJV
	6aVwKp2W3CoL3GUdEJan8pt9zJxcVBzoY06zBELvuR14o/SwgvgFgzYY1G6pq53rfI5P
	1GL+KSPYBx2rv1+iAIi5AQKzHY40cJhzr6yigaYoEmMgi0lzXhu13pcgPiKLVj9IDZhn
	ds/g==
X-Gm-Message-State: APjAAAXc1YiYgStIzK62aHs5U1ObhURn0FAIgLk8d1+TFhpILTJxAyfG
	TiIvPGJvA/Q0/jB73mqWxa9xTC2skfM=
X-Google-Smtp-Source: APXvYqwfRWL2hVt3QKaW7Hy0So1CJZcC4afnDy3T1j9bpH4mgiKLu9+Q4BDIJ9Z1okr7EwRdEmjLaw==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr22276807wrr.370.1570477089929; 
	Mon, 07 Oct 2019 12:38:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a10sm17356942wrm.52.2019.10.07.12.38.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 12:38:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 20:38:05 +0100
Message-Id: <20191007193805.13219-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007193805.13219-1-ross.burton@intel.com>
References: <20191007193805.13219-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: don't install udev.pc manually
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
X-List-Received-Date: Mon, 07 Oct 2019 19:38:09 -0000
Content-Transfer-Encoding: 8bit

This is already installed by the install target to $datadir/pkgconfig, so
there's no need to install it again to $libdir/pkgconfig.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index a4a744ce9ba..6e7f95693b8 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -229,8 +229,6 @@ do_install() {
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
-	install -d ${D}${libdir}/pkgconfig
-	install -m 0644 ${B}/src/udev/udev.pc ${D}${libdir}/pkgconfig/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
-- 
2.20.1


