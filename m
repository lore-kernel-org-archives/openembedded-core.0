Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D99B79064
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 18:34:50 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id a14-v6so9471366pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yRanPuwhTdH3OPD/uAatHlGUXYWbsbWCIljwBMgudfk=;
	b=F0ycuBiFnJ+ebySmSs0XZ66OzoLYgxh0P6Ni7EB6+X00j+HEPufEJVhdIAazhWu9Jd
	pWOQw/KWiHQe9T5jvSSkYd9aUXnJbuo79SLl6jtQQ6ySaKlXDYHN//0qoKUAU7OVf3Jd
	0Li8j8yINPR7rgoTQBSW91SAmXEccdTZ7IVslPmwha9coijfhP4LjqBPetMe2eX7J1R2
	I7wjvNkxHGKKWqnNKB9KA5xsciLfkX/L+bgY4OJbDrGDCcAlY+m/ai+c5jW2A15H143F
	yW6xzjEGi3ZrYq61V79irF0wlMHhBIf/Mj29zhaAplExw8BZryda5B0NcgzCY3YTR0pW
	AdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yRanPuwhTdH3OPD/uAatHlGUXYWbsbWCIljwBMgudfk=;
	b=V9sSxSnsdOoXTm4wxyWjEDOJyg+zuvRD08m9PWNqHdtie3bgoASe91cQJSRMpHoG1k
	ZhQwhavJJtjdBUJdrOTpllDzimFaaEUPKmY498ZUR+x1tSQQvGyBCJukP5eMtJoFjiwP
	wJjxCd862+yK6/UXwzY5ctpxQ6rztkUycIQKrmxpwcIoaoTk8NzSf9tZeC4JdqYRkcTo
	PDiOfj0+c/K1WZpcM4hvHFenlZLOnmEiuAYkx08M+ZexJdOHJJrr/6+uqN3HohY1VFvL
	6fCH+WYhmtpiGMBeTwBU3Yj61+Q3gauwpPtokH+LmewODAKzfJAmD60NFflAAsG7rmig
	5OnQ==
X-Gm-Message-State: AOUpUlFInOWRySCW7jbpi6ZCjJcxpFP+6hDvu1a6nDwJO3zW/zpKg2+D
	s5z3um6CN+bTqfnueXihlRpPXf42
X-Google-Smtp-Source: AA+uWPzEA1f/+NeDJzVpreqAvEcmXK0MFcqD445ycn6AY+EsScuC5R4TlznnNMm3md5HkhKZYGwiig==
X-Received: by 2002:a63:b445:: with SMTP id
	n5-v6mr22598853pgu.104.1534271691257; 
	Tue, 14 Aug 2018 11:34:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	n80-v6sm48690807pfb.95.2018.08.14.11.34.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 11:34:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 11:34:40 -0700
Message-Id: <20180814183440.38619-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] mesa: Disble TLS for musl
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
X-List-Received-Date: Tue, 14 Aug 2018 18:34:52 -0000

See https://bugs.freedesktop.org/show_bug.cgi?id=35268
mesa should infact stop using __attribute__((tls_model("initial-exec")))
until then we disale TLS in glx for musl
The problem could happen even on glibc if static TLS sizes are large enough
which would mean that additional space the glibc leaves for such rogue libraries
get consumed and then same problems show up there as well

Fixes errors seen in xorg logs e.g.

(EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: _ITM_deregisterTMCloneTable: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1

enable readonly text segment on x86 for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Use --enable-glx-read-only-text instead of setting CFLAGS

 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 860a2d94cc..2671d4de4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -36,6 +36,7 @@ export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
+                --enable-glx-read-only-text \
                 PYTHON2=python2 \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
@@ -105,11 +106,12 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
+EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
+EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
-
 EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
 
 # Remove the mesa dependency on mesa-dev, as mesa is empty
-- 
2.18.0


