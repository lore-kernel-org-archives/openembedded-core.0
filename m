Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 56CC079660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 12:44:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s17-v6so9689422plp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=IK1HC+B8Xr0gmuB+h5XVEmWlVh12TEGZ+3aWDGmLWeE=;
	b=enlgPuEyj/zfhWI40WbHVHUlqe/foV+cN3K68bl7nbjQsToSWVsZiy9iMz4aUcXUkd
	HEJLuv0yCSBCCYsQ+7gQDi5Ma9pSokvkjH08C7ejarARBvWE79u1h7eH9BPkjvM5VEjL
	JJ1EsG4hhO6tNl4uXAdlKqRqX6w2+HmqIQtWGZBJ8tcESH+vXtE9AsEuEm8DCRbCus+L
	SypBid/5Xmi/99ymxuXHJpnu6s5Zg70AYuXrfS3caichXYxFOXQIrq4wH/e0IRwFiJFU
	4SfnbqBnfZmubyJ5U8vh2mLPvhKHu/Kcxu5mmkeQndIqK3fFLD6FrmdAQvCGzEM6BQBy
	54Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=IK1HC+B8Xr0gmuB+h5XVEmWlVh12TEGZ+3aWDGmLWeE=;
	b=ordfMOx/Eu8KFlOHKJuM0cXXiEdNt/vXOvMOnuvnHOmgyi1qTTFvio/c0ptjjSg7jZ
	A++3NDfxhV+R7VMKQko1ALW8FwRgJpLgUvxZODgSR23iQXLPf9iuIwc4/ZUxQM3Z3fmg
	Jp/Look4TLo38B+64PFNKXYTGk3qvjt3B5eto4Gck4Ysck6brj1KVfRfmkrXZWLi2L/v
	X84gEwjnRrhv7+8nD/0B5tAl/7wTBsoFRtTOprdfNFmw+2fZM/65rYR0HIPdP7VfreUf
	glYEOjn1FkQg/2i9PYM35mol09MslYexvXUD9mVHH9vBQGx4OVPF+4zI2UJM4DbXEcFS
	zLUg==
X-Gm-Message-State: APzg51CFnGvs2iKfsIXxVlny45bcJyappgXENEIAAX26M/H8ZuFUe98+
	EJJeR6al13SFOYYoGlVbFLnqYr7v2lc=
X-Google-Smtp-Source: ANB0VdZUVSusV4o9DWW9cSmf7mWmpuWUaKDkT2E4gsID5VUs8zcYPD2v79T8uggikRgjeyUOZamq+Q==
X-Received: by 2002:a17:902:8bc8:: with SMTP id
	r8-v6mr10856280plo.100.1536583459242; 
	Mon, 10 Sep 2018 05:44:19 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	82-v6sm22319374pfw.159.2018.09.10.05.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 05:44:18 -0700 (PDT)
Date: Mon, 10 Sep 2018 12:44:13 +0000
Message-Id: <20180910124413.20946-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] tclibc: For newlib and baremetal disable some security features
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
X-List-Received-Date: Mon, 10 Sep 2018 12:44:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

With GCCPIE being enabled by default with security_flags.inc the
compiler will by default attempt to compile and link programs as PIE.
The targets that use newlib and baremetal in general do not support PIE
or are otherwise unable to use it due to how embedded targets are
compiled and executed. As such it makes sense to disable PIE by default
for these libc's in order to prevent build failures.

For baremetal tclibc there are no libc features or implementation as
such there is no implementation for the strong stack protector by
default.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 6 ++++++
 meta/conf/distro/include/tclibc-newlib.inc    | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index 1bf44c8591..b00917913f 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -28,3 +28,9 @@ TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "libgcc-dev"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "virtual/${MLPREFIX}libc zlib ncurses"
+
+# disable stack protector by default (no-libc, no protector implementation)
+SECURITY_STACK_PROTECTOR_libc-baremetal = ""
+# disable pie security flags by default
+SECURITY_CFLAGS_libc-baremetal = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS_libc-baremetal = ""
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index dc631d8ada..896c0b16d7 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -42,3 +42,7 @@ TARGET_OS_arm = "eabi"
 TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "zlib ncurses"
+
+# disable pie security flags by default
+SECURITY_CFLAGS_libc-newlib = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS_libc-newlib = ""
---
2.18.0

