Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id C5D4D7CC65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:50:52 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id n74so8569245pfi.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GNmRaIK0EjY32gNOmGfs8t7hykX+x1YPGOxn29vdqjA=;
	b=ff/BLfINiuV1rPEgN1K6ov8NEEgR5VYaXQkrBMC5HrXmxDzGr7if26j7aZgEdb/uJj
	DMXkmMbGhel+rACL9Ny4pTKDIZLM+3zfxieMzK8ll6nrev7K4QzdAU8DTk1qlDjdOwdN
	nXItMfj5QyEi6QMJveD8XmyRLegb78gND9UATTZnOdkqcy+7dZo6TM59jwrgu0z9vuXq
	bN+MPodl999c0FfpQi6QKYAgTWf+qTCIB3nXgulE9M5IEUNRKcekimsLEH/uq8yz/M5/
	jAf91H7XkQEA6QZw/SSU46LDsfi4+KpXTimqGnbQCo2yD9lkhBXmylTJffcfWJK7BULB
	4vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GNmRaIK0EjY32gNOmGfs8t7hykX+x1YPGOxn29vdqjA=;
	b=CboJsAggLs6D6DwuzjriZxERRJ/HjIE7Q+/8wjh2vUOcjt/XhLtmudEUoreefans5N
	1eV2rlSLAr97+F8aTcBqGeWqSG2/Abh+Xy7J3n391bQocvbuhslXzrt7Ek5RuTGFHc8h
	pUV2XuGqcve7L34/V/hIEKPabD9rJJYPupV87Js6OspxecN6E7rEwX3Mw7LTUopXFQnB
	CAw5ViCxNINVdngOl1R/ANbPwVL3nnKfCsnJoBMxHDn5gp+j446NF4SOMOoK9NBQGsWe
	kSvCgeIGm//j4l1nuq3Sj/gwQf9yYB41l3MD2TH+DjtuGb3LuxFUgKQV+bXm9eGK5aaC
	xivw==
X-Gm-Message-State: AHQUAuacjDfc6KRCYO0Xb0+d6tQnDWdBDatRDkh+WbczWa9CY2OWZ5dq
	MDu56vFsc7AQHyHIa05/ydVbdB76
X-Google-Smtp-Source: AHgI3IYtGGWgtBkGwFLO/iuZpiHIguwFmSz7fwwRy+iW2fl/Xj0dvCB/OjnUCTss+VM0bKQ7lUGzQg==
X-Received: by 2002:a65:6154:: with SMTP id o20mr4792533pgv.205.1551300653313; 
	Wed, 27 Feb 2019 12:50:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	l12sm27913766pgn.83.2019.02.27.12.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 12:50:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 12:50:42 -0800
Message-Id: <20190227205042.44813-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190227205042.44813-1-raj.khem@gmail.com>
References: <20190227205042.44813-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc: Disable Werror when building with debug options
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
X-List-Received-Date: Wed, 27 Feb 2019 20:50:53 -0000
Content-Transfer-Encoding: 8bit

Since compiler does not optimize away a lot of stuff we end up with
Werrors e.g.

./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  114 |        + (k * ln2_lo + c))) - f);
      |          ~~~~~~~~~~~~^~~~

which otherwise wont happen, so lets build with warnings-as-errors
disabled in debug mode

given we disable werror, now we don't have to restrict user to compile
without -O0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc     | 9 ---------
 meta/recipes-core/glibc/glibc_2.29.bb | 1 +
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 67af396133..a382a22b73 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -2,15 +2,6 @@ require glibc-common.inc
 require glibc-ld.inc
 require glibc-testing.inc
 
-python () {
-    opt_effective = "-O"
-    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
-        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
-            opt_effective = opt
-    if opt_effective == "-O0":
-        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
-}
-
 DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index bd8aa6d503..9b6fab066b 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -90,6 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --disable-crypt \
                 --with-default-link \
                 --enable-nscd \
+                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
-- 
2.21.0


