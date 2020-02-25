Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCDC60646
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 08:18:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p18so9900574wre.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xc7aMuoSFNOaIt4E80y4wha7/sKcazZLOLJdRFj5Pk8=;
	b=YMrw2GFwOAQySwwbpIJPHBCvbj1eznnBwQ2HGtyejVoXCTvHkMHMP61zbz/IUuoAwj
	03Os4lQz2cckh0CMy+mN+5eaNEnmBze3CfewhvBnX/KxQTtrthSRjR/pR8APDZMQX/7o
	otmSMU1gR8Ev+XqTgR9IIY8sUFKXQecFV1p1w+fW4P6Wp85QitI+mH8FGfrhxhnH5huT
	wRwgB9UjohjB6OeGB247gvrmOMavBPanazW0qWSU6stQlsxy2IVyadoBe4a58Z4oIJWd
	TV0awzgBf3GH5/mtivJ+t7HfgHNWo2nDlqQxTQ3DFkKKBJqGRcYcaAX+/HPR8ld7NUHV
	DNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xc7aMuoSFNOaIt4E80y4wha7/sKcazZLOLJdRFj5Pk8=;
	b=pqaqKEaoHY4R1qA6y3IzGO7xWQJbemDY2bGW1LijKVHh/Zb9XlXlN4eSZuGplqF2NU
	6Xvme9OpidEHAL1NWOs/GMJVIGMk0kMcYkXzkGGvlYXnP9NSzAobJ9LlR0bHyrHJ/VsS
	bN6JmrpCptlxyNTQIQ0Hi+ZQhvgf4zYPJiLSdGuwxJGdjW5i5ig3m0dse7Rh/7SMExjZ
	pez91rB8SGk5RxhBfVWICzLAYo5Pd6iB9G6DhfcGG3yxilOKxmi+5b4Mb/xYo8uaPC/m
	aTUb7MOvpihpekT1td6N4U9FyJnan41RhwQLTpkZJX/R75QTJpvJY8b/C2KXuvlgu7mS
	jdSw==
X-Gm-Message-State: APjAAAVZaHfSzWzicrhEqm8uNJiK5SCpCExMr+TlfbaT3oCkeKZXn1wD
	FQKJg/A5G8jl2bLiEz2m2D81Sw==
X-Google-Smtp-Source: APXvYqz72H+JGwG1HUdG3mQ2k/saCbD/FFALmRrIZ3vGIinqHIRTvH4GaGyK0898X2tnmKqfUfhLjA==
X-Received: by 2002:adf:e742:: with SMTP id c2mr7328322wrn.262.1582618734790; 
	Tue, 25 Feb 2020 00:18:54 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
	[2.15.156.232]) by smtp.gmail.com with ESMTPSA id
	m3sm23112862wrs.53.2020.02.25.00.18.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 00:18:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>
Date: Tue, 25 Feb 2020 09:18:52 +0100
Message-Id: <20200225081852.14328-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] hosttools: add utilities for all supported checksums
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
X-List-Received-Date: Tue, 25 Feb 2020 08:18:54 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Only md5sum and sha256sum are currently provided by HOSTTOOLS. Trying
to use any other checksum conversion will result in a build failure.
Fix it by adding other supported checksum utilities to HOSTTOOLS.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 954c06b313..e201b671bb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -489,7 +489,8 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
-    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
+    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
+    sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
-- 
2.25.0


