Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11AA87FED7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 01:43:09 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a15so5682053otf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 17:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mp+mUP1SgbF/5hk2D0JWgzlWgcPbPD6LiovOrfBiSFU=;
	b=J7EgcvuF70K2j1dgNLEw4yVnXpQHWLxhpodFYxfl0cb9GmNywJEhO8GdzfQgVOJOsY
	rTaOVDFXo/wXX1qltM1ctDwgs9gZBRVKmcOGvJwKccryvqk3RT9t98tg62BJ0hVbichM
	G+k94WlUe7yU6AwzfNOLMdZlb53vyAu29icuBhDo9TKTu7Yh1EPtAu1oK3zWDXFVFzhU
	Hwpfzkue0YJ+o33t0JTNTRr24wInTrAM2tmttNYch1ZUMBjiyoOIS2YQxzYshpkivB21
	XJxOkHg3ngVN3H1qOlq3ykM664riyVVwBIfR6bzKV8T32sC6Go0FEcvLH/nSNZ8/W/DZ
	ubpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mp+mUP1SgbF/5hk2D0JWgzlWgcPbPD6LiovOrfBiSFU=;
	b=pVXD8/Vjik+x7HOxK2ISMW5hN1mpqWJWIRwOOTiKMv+SHzIIJ7yV/0XmOimemeUl63
	+jk/Zeb8/RgQbgeVIO44X+3BNqkMRvD/faC+MD98lk9XYzHNR65TuSvXDH8cAKalokVI
	SXcAkmOy7tzLKF2tpzNxFrvRffHT3ioMbFuKrsInITtglvWbKASXA/Fz4IJegPK99BP4
	sJhmWLxIcl/oSIDUxWApVZYmhGEBc6YdJyWHc3erUYzg189LIttm49lDaGas/VGs6/sM
	tVuRfj8I5VeVoOGNbv8w4LQWkYA0FX381orIfJnyekZjDiLEC+eoQkNx0Ialpf/u7Zds
	o99g==
X-Gm-Message-State: APjAAAUPsVi095pRP6NDuYIHXY/1bKNnvt/9Lg3fQVmhPTmRicvJiBmZ
	oWjOHc1BqT7WYOHt5VflKZsowEqg+rs=
X-Google-Smtp-Source: APXvYqybrk377DFBRbHGsosLD0mLeEtvbJNdZwBtWThAKxFVzznI2gW7daYg+nga0tAHWiTWD/gKmg==
X-Received: by 2002:a05:6830:121a:: with SMTP id
	r26mr6461310otp.225.1578534189957; 
	Wed, 08 Jan 2020 17:43:09 -0800 (PST)
Received: from blackbox.rga.ip ([2806:109f:4:e36:908a:c7ff:fe6a:e9f5])
	by smtp.gmail.com with ESMTPSA id
	a17sm1785832otp.66.2020.01.08.17.43.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 17:43:09 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:43:07 -0600
Message-Id: <20200109014307.37924-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] meta/classes/menson.bbclass: Add python3 dependency
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
X-List-Received-Date: Thu, 09 Jan 2020 01:43:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The python3native.bbclass set PYTHON_{LIBRARY, INCLUDE_DIR} pointing to
python target build, a patch was add to use target _sysconfigdata too [1]
but is not available without python3 dependency.

Fixes waffle build when trying to find _sysconfigdata module,

...
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
|
| meson.build:36:0: ERROR: <ExternalProgram 'python3' -> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
|
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
| WARNING: exit code 1 from a shell command.
...

[1] http://git.openembedded.org/openembedded-core/commit/?id=02714c105426b0d687620913c1a7401b386428b6

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 5c0139f02a..203efaf8ed 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,6 +1,6 @@
 inherit siteinfo python3native
 
-DEPENDS_append = " meson-native ninja-native"
+DEPENDS_append = " meson-native ninja-native python3"
 
 # As Meson enforces out-of-tree builds we can just use cleandirs
 B = "${WORKDIR}/build"
-- 
2.24.1


