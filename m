Return-Path: <nathan@nathanrossi.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id C13F87F2BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:47:33 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l4so3153478pjt.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 02:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=LDmYUJAmTY+0GCDgIUuGcnd4whzlH7vFursr3aN2L3o=;
	b=Y0orb5plqCA5gRl2W5iZzxGJiHjQtBA7ZwI3Vp2vdaIYsiLhoAVQXw7kzdZORIj7Jl
	bugEBHXUAAsIIVkTfwsLXJSeuXYJ+tCO3gxOsdSQi8jh3+IRZwFqps9RCmYQ0ro1C6p2
	rufauQXVw0FtucG02uK5xOp3zKwS909eg7Bfcgz7uHQgzBOrRmpnwNoY1KSaXjuByVcL
	HVCFIVLxMM1rRTgJSM/RRQs8EkHNt2UKS1OUjsKHCOJb3CoTlJ7q9g72Dr2NlOYF4MaO
	1l1lcTIaiitr2rsxiRV2XlgKpexZIuk2J40KiEb/jwJVuaoo4IhCwIjld9XGcLT1E2Nt
	FviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=LDmYUJAmTY+0GCDgIUuGcnd4whzlH7vFursr3aN2L3o=;
	b=EDyJPgch4evKM2u2M5OIufYko2TRRYGDHV0X7qgItRO+hXKNNYHStnaCA4K98BPYuy
	JlnPeX8TN/6DCuOcnPx5H9XXnkOHx2GIkIL3cihU/3INQ7yxDaw6jZO1WWSqSxbOTgOl
	Qnv70dLYmWA0N/vBFxysbEwcrS/xEWPFcUk7htS/O3y70b42jzce4Chm1e3bjQkVqqeQ
	++qy++9G3Gfb755gBJBsbfDB8vfN2xfWMhHmhdSfvalvIiTPrISA1fpGtS5KwUExZZ8t
	hC0JP3vV21W0jVrxFK6x6KB9tDss975sJNIkJwEs66nHOprYtnE8Yi3bz0Ka9RqCuRdb
	Uv6A==
X-Gm-Message-State: APjAAAWWkoC+KdFuDoM98OjLPhryVEUCQaQvkdQQ9CW6vUfCH7PMZgAo
	+VbeK9nG+9HwI87PpXugjhwzQh3pr8U=
X-Google-Smtp-Source: APXvYqzjaOkk3B7fBKuNCnot8V4PJKMQnFd1qsL7uO0nMd3zPIO0+0t/VMoVp4jSKAmOTPd89Z+BnA==
X-Received: by 2002:a17:90a:ec10:: with SMTP id
	l16mr444833pjy.19.1575110854296; 
	Sat, 30 Nov 2019 02:47:34 -0800 (PST)
Received: from [127.0.1.1] ([101.184.60.82])
	by smtp.gmail.com with UTF8SMTPSA id
	u65sm27621616pfb.35.2019.11.30.02.47.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 02:47:33 -0800 (PST)
Date: Sat, 30 Nov 2019 10:47:24 +0000
Message-Id: <20191130104724.584271-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc-target.inc: Prevent sysroot from leaking into configargs.h
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
X-List-Received-Date: Sat, 30 Nov 2019 10:47:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Prevent the full recipe-sysroot path from leaking into configargs.h. The
configargs.h header is intended to be static and unchanged as the
content is used as a means of determining that a gcc plugin is built for
the same gcc. This also effects the output of 'gcc -v'. Due to per
recipe sysroots and staging, the sysroot path would be replaced with the
sysroot local to the recipe thus changing the content of configargs.h.
This change also improves gcc binary reproducibility. The sysroot path
is replaced with the base target root "/".

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bdc6ff658f..987e88d32c 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -137,6 +137,14 @@ FILES_${PN}-doc = "\
 "
 
 do_compile () {
+	# Prevent full target sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins. Additionally the path is embeddeded into the output
+	# binary, this prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
+
 	oe_runmake all-host
 }
 
---
2.24.0

