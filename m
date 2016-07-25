Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5B452606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:16:33 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i5so172510508wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=C/r0W5mc/g7b0YXLn3EMpQ4NfQL8vZbM8MplcwWmAZ0=;
	b=Zj0yPJgA/bRaCfc/269+6y/RedRe6wwsjWrzvH4zujkaOheYkunEVv+2XI7tYcW2a6
	v3AzUaYH4KouXqooKvMxiQPoMkeTpxJiHURorSKvb6dRWNZ9z9V1Y9CAq27SKtVmJrYc
	qZm2PYUz8NlHgKYEsLZk5C6cqhDBoqUFMBC4jpCPjwrONt/H6cBV4PbbQRVFFVPz+94w
	Y089n9NwApXQedp0oG5Jh1kamRJ1L7vPuX80BNuELv23BtoKSXkfHPELp8kzzQh2NT0U
	E9tJNO0IdXYt059RU6/Gg1Vt4EUmyQe+nzSxUVVA4zmoMAsJgMbAxWe7ZLGU2qp4Ste8
	9euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C/r0W5mc/g7b0YXLn3EMpQ4NfQL8vZbM8MplcwWmAZ0=;
	b=QMq88eAX2r1EViXW58BwTtRLu9EKBTJsmOST8TwxKQXK60GuPYyHhuxOv2EN2V+d0m
	2JcewMaESA514sEsiVd4jpkPu8aeDJuCRWLHJGZXIw3PQzhb9KD4MTOq/ExPteO5S9zR
	mRdR5QdOQsPmaSMrX6IjIPAjDzl6GZznln8I0vzqkauWVREjcjZ3NxV5w9zrGXohdpWY
	2NAHD10J8EgLhoUojvioCGNYBZw6WqQZH6pe7hqXHBV7fa9Sm2kdzer3T3fAKX1nf0w/
	zA6y/eXm6HvgdIZcNWSpDGCWJ6VdN220+Yxaakt6CA8invqfPBrAakjWF1idFy2axO0d
	LDeA==
X-Gm-Message-State: AEkoouv6gmVZgQFxaHJaY+ZgDgKSKdl5i7CW3G5zd59ePGYFqmAKZQ4211h4GCRefIQyCeVj
X-Received: by 10.194.107.130 with SMTP id hc2mr16727442wjb.7.1469477793577;
	Mon, 25 Jul 2016 13:16:33 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	hb8sm17401162wjd.13.2016.07.25.13.16.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jul 2016 13:16:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 21:16:30 +0100
Message-Id: <1469477790-20655-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] rt-tests: rationalise compiler flags
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
X-List-Received-Date: Mon, 25 Jul 2016 20:16:37 -0000

This recipe uses some convoluted methods to ensure the build is using the right
flags but they don't appear to be needed anymore.

No need to prepend HOST_CC_ARCH/TOOLCHAIN_OPTIONS via CFLAGS as the Makefile
picks up CC from the environment and that includes these options.

No need to append the default CFLAGS as their special options are actually in
CPPFLAGS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc    | 3 ---
 meta/recipes-rt/rt-tests/rt-tests_2.0.bb | 4 +---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index fd6500b..d832828 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -5,8 +5,5 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 
 S = "${WORKDIR}/git"
 
-# need to append rt-tests' default CFLAGS to ours
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnull"
-
 # calling 'uname -m' is broken on crossbuilds
 EXTRA_OEMAKE = "NUMA=0"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
index 83869b8..4336c50 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
@@ -15,9 +15,7 @@ SRC_URI += " \
             file://rt_bmark.py \
            "
 # Do not install hwlatdetect
-EXTRA_OEMAKE += "PYLIB='' CROSS_COMPILE=${TARGET_PREFIX}"
-
-CFLAGS_prepend = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+EXTRA_OEMAKE += "PYLIB=''"
 
 do_install() {
         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
-- 
2.8.1


