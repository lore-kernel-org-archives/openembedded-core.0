Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.267.1590595440257739590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 09:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kHDnq0kI;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id n18so12002853pfa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLGTtc/di2+N1iW1keKvparreSq82YNZAS5lC1oLAoI=;
        b=kHDnq0kIRTb5XcfigDv7O9RrHmW9cG54rWoBGeOXlvPGEKjssKF/CTotFcLoCqPJHV
         FXtVRi2xPyq0LAyT2ISoP9mrLFKGIh2j4sXhCdUfvC3EJNm4WbPIUHKAG0nE4Zg+2xa5
         AA4Sv1/w/0k4FYagRrjKyoKqzcFnK20qVnbQQSf0lrhSbClUZdrVCv7EkeZl72ri0YTu
         uHi3IygWq7cUJ7jc5pEJRJb+LBHuXwS49OK3Fj5TGrpVckHsyI1vlCU//ufwuaViHFyW
         5vLJe4NRapv7XA73FhWqKT2jyIN0a7b7cfs+HFUiEGl1qQ7J8n+VP4YRo31xvcEHtbZg
         7Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLGTtc/di2+N1iW1keKvparreSq82YNZAS5lC1oLAoI=;
        b=SBLEJT4s/jbFb5zK/kSQMgIdjylkPPvu5BI+88Wf2JDwoihLQE+GFU0/Le7brezwBY
         GaV9U+9jOvisKjTNW6eFLTt3NNndBR081dcBuI1gPSFdC14tIGg8DNYFyRzWVmFEuioC
         KGmXYSHd96sMjgdLWto5+ETa0/uC7w/SuO20PVLFZUudlGAzNUBt8QB4n798wtzdLG2A
         PPYAmPTzKXa5mBns+JCt9ch2o+9+fzak8xOBwKvgK9ZuP7kiZJC7tI5NQ3ilqNb++VES
         D+FO4PfZ7B+/++BMX8MrcIgBkI2POKd7kiZE6AH60QL91DF0oceoLoQ7Upadln5Nt847
         z1Uw==
X-Gm-Message-State: AOAM530GqEwqmm99ylTGuun0B9qzBZ4zB2kjwHmqte/cD5WDNur3+SKM
	vIQ5TaaLtnGNytdCve+G4sHfDabjfKI=
X-Google-Smtp-Source: ABdhPJyG2fI6RYmddSSOrLBGjS2Nn1F97VdIJwzyWXynJGMVhTf5y9qH4oLZ5SFhoVTGgk4505WEGg==
X-Received: by 2002:a63:fc1b:: with SMTP id j27mr4860254pgi.251.1590595438500;
        Wed, 27 May 2020 09:03:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
        by smtp.gmail.com with ESMTPSA id v129sm2520385pfv.18.2020.05.27.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 09:03:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] make-mod-scripts: Fix a rare build race condition
Date: Wed, 27 May 2020 09:03:55 -0700
Message-Id: <20200527160355.3169339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a build break which often happens whem using 4.1 kernel

/bin/sh: 1: scripts/basic/fixdep: Permission denied
scripts/Makefile.host:124: recipe for target 'scripts/dtc/srcpos.o' failed
make[3]: *** [scripts/dtc/srcpos.o] Error 126

this patch sequences the build targets so it can work reliably with
different kernel versions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
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

