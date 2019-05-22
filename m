Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id F38417C124
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 17:58:36 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o11so1503298pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BCIF4Zt+a3sDkFd8V5Bf1R+638bK6Ly6d4UvMxGGQWw=;
	b=rUOQYGj+Q0qTU3aOGkBTt3v7QqCKaw8Qr7eX5oot5K19oKIQsY3Syk/U/CFbZe1l1D
	jaZcD/wNnpNuaBis4PEn9qb+kZlPpZ2nxNtdYuTR45OVA+WVFpJIhScMGivEtiVJUejh
	L9G0ipOrVjDfj8rhQ85WphI7S5Gasd9xUX+7TVGtbH4ILQ55lZCKJTG10jmk9CVGhyZU
	WfQ+mj2BP+qhtJfcYhMUFPSvDcW7dmHwvw373ROiOqoCaxIoXXsgEYbnOp8WFjr4SbdC
	xwxgdhiTL+8ppky1n1YTqoTvF6739RfA0vRhdyFoAzg/fLgUnGQbA4d+ie0BDoaTdqVA
	Yt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BCIF4Zt+a3sDkFd8V5Bf1R+638bK6Ly6d4UvMxGGQWw=;
	b=jISHuybOVJ4NpJN8Y1LCOQlo0PZdSs6Wt/gOmVH2/frdKA6VzmTCpzOjBZCz/znxgs
	xCP3kxRwCpdZrn6h/+pLMxWTjWEXr2a+loKreINm6xu8QnmqQLbqFkqk8uPlt/Y0mFE+
	hdED5ADWfOsiG7bi4/ZZlzcr/MXvYpSInRf5dDfyePs0KgYZbJvSOhWA02rzl0CXUASJ
	/GxOH3YnBvqFiq4eZ/Y0OhnFkf9XgK/mTmdGE8S/N45RejAWGAw37KcFzgO2sh6Vrf+e
	9RJHpUeI57YHTJ384LJd4ASA9jh13d5Rjxb8g7CBBSXY0G3xLvx/16Bbw3L77t9YGVkB
	lDAg==
X-Gm-Message-State: APjAAAXS5gqMdpPjXzFNKbfkaZLwqshqOlP6l8UQWTRHASXlqw8Jd4RI
	56iPDtFzGvHveB+CL3gZEDRsqqXlS/Y=
X-Google-Smtp-Source: APXvYqzx89NUBuS8ZVgKguGpRWDzRjeiF1+9MsM5skdfou/qrIIbIy8q3hkbstwiEZWdphLmImblQA==
X-Received: by 2002:a63:9548:: with SMTP id t8mr92364805pgn.256.1558547917374; 
	Wed, 22 May 2019 10:58:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	p14sm33491155pfa.112.2019.05.22.10.58.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 10:58:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 10:58:27 -0700
Message-Id: <20190522175827.3530-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Fix a case when gbm is enabled but DRIDRIVERS is not defined
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
X-List-Received-Date: Wed, 22 May 2019 17:58:37 -0000
Content-Transfer-Encoding: 8bit

This is a typical scenario with arm platforms, with meson if DRIDRIVERS
is empty then dri is disabled automatically, but gbm needs dri2 enabled
for it to have proper backend, in autotools we could use --enable-gbm
--enable-dri and get correct behaviour but with meson enabling dri2 only
works if DRIDRIVERS is not empty

This fixes mesa-gl build for rpi machines when using userland graphics

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/files/dri-drivers-auto.patch         | 31 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_19.0.3.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/dri-drivers-auto.patch

diff --git a/meta/recipes-graphics/mesa/files/dri-drivers-auto.patch b/meta/recipes-graphics/mesa/files/dri-drivers-auto.patch
new file mode 100644
index 0000000000..532b2370b3
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/dri-drivers-auto.patch
@@ -0,0 +1,31 @@
+Fix meson regression for --enable-dri --enable-gbm combo equivalent
+
+For arm if DRIDRIVERS is set to 'auto' then respect that
+to enable dri support, this is required for devices where
+we use mesa to provide gl/libgbm implementation and rest
+comes from some proprietary driver, typical case is userland
+graphics driver for raspberrypi devices.
+
+This would mean that when we set 
+
+DRIDRIVERS_rpi = ",auto"
+
+Then the meson system will build the dri with gbm backend
+as was the case with autotools where --enable-dri did the
+same thing
+
+Upstream-Status: Inappropriate [Might be specific to arm systems]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/meson.build
++++ b/meson.build
+@@ -98,7 +98,7 @@ if _drivers.contains('auto')
+     if ['x86', 'x86_64'].contains(host_machine.cpu_family())
+       _drivers = ['i915', 'i965', 'r100', 'r200', 'nouveau']
+     elif ['arm', 'aarch64'].contains(host_machine.cpu_family())
+-      _drivers = []
++      _drivers = ['auto']
+     else
+       error('Unknown architecture @0@. Please pass -Ddri-drivers to set driver options. Patches gladly accepted to fix this.'.format(
+             host_machine.cpu_family()))
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
index 36faa4a99d..c1703e04d2 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -3,6 +3,7 @@ require ${BPN}.inc
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson.build-make-TLS-GLX-optional-again.patch \
+           file://dri-drivers-auto.patch \
            "
 
 SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
-- 
2.21.0


