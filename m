Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.113.1590608801635406726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 12:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q9z4lo0e;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id q8so12346746pfu.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AUhz2jlypst5ihFJ3OerAm3157dEFWEJk6SoNQ6TVQ=;
        b=q9z4lo0eqBay7novc2FS6OZY7bEUj7fra8Ixk5prJyhvp/Xcw1XRSBXAwUEFiWsXQ6
         YWLjyr1BsiPnQloWM0YhSopZaHENHOcUzSDW8A72SOqhTsb0+HMQztCivtcGDwP3a0b5
         bh0m8T4D+9l5VmAAXyWUD7ys1dqLDrlBbqFAzXJwz7Ak0d9Co/XrbsOIj85d4GpmPBgV
         bVqAnwVRB4z5l2zwmQF7geDSoqGRVuy5GuBqwj1kK6fqdFojyMylSjNoMe8NngQZshq5
         XgLNzodS2ySvROGIUAwB1RQTZqwVawvZa6CAZ9+hqeslC4LAUuBHtT7LKcYwtl1w9Cyw
         y5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7AUhz2jlypst5ihFJ3OerAm3157dEFWEJk6SoNQ6TVQ=;
        b=EVZl0Ff3CHwFmltLqbzikAKynVFbN2pglvOXVzy+rP0zIPT79W80up4E/mVA73FwFu
         0yzdblyPIr+InwhBwKpa1sQ78jt5vvZfc2JA3JCf1T3NZJc9zOM8flvcgbXqiq9La0zf
         vVl/Vy7uIoALfWGyZI3IFPt9bhqtwQUVuCIO245s+SSY4Xuj4mvbOw739z0WkgUqr974
         ENxO1DP0NzCDcp2LhnUEuAWFHXMLhp1RGkzQJxqZ8JFz6RvT4F5yHsEh4MzANCn5jwfv
         WSqxk+mHnp8a57Qr2gCwtZXOaqju/N2/DVXWUMmwG3f/ODxSkkTHWZr/gB8z15+BedlT
         d8MA==
X-Gm-Message-State: AOAM531tqOVA0O0sy5fzetiVM5BNcDSSt0tYnsWwSO9zyj9c89F/bSud
	b6JOZWueaW5djowwsaNyIYLdf18mzFA=
X-Google-Smtp-Source: ABdhPJzRG7vMkeyWUWj7BRirMfb4J3UN9JuaRSBswXM7DgrXiph+xYVYjpu2lx0XANPHgd7iQwMs5A==
X-Received: by 2002:a63:dc44:: with SMTP id f4mr5812429pgj.442.1590608800662;
        Wed, 27 May 2020 12:46:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
        by smtp.gmail.com with ESMTPSA id dw13sm3196900pjb.40.2020.05.27.12.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 12:46:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH V2] make-mod-scripts: Fix a rare build race condition
Date: Wed, 27 May 2020 12:46:38 -0700
Message-Id: <20200527194638.981828-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a build break which often happens whem using 4.1 kernel

/bin/sh: 1: scripts/basic/fixdep: Permission denied
scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
make[3]: *** [scripts/dtc/srcpos.o] Error 126

this patch sequences the build targets so it can work reliably with
different kernel versions

Divide the target into scripts_basic scripts is not
strictly necessary and was simply what was used for
testing on kernel 4.1, which is quite an old kernel

perhaps just using scripts is sufficient, but it is not tested to not
known will cause the build race as seen above.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
v2: Improve commit msg

 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0be1422a24..c7edb20ee4 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -23,7 +23,8 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 #
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
-
+	for t in prepare scripts_basic scripts; do
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
+	done
 }
-- 
2.26.2

