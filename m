Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.13169.1623163474834009248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nVZ/gO+x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so6802811otl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6g9FmjHOmmZ2e/vdUuDnqjzXMM4GxlNkiKOhieoYK6Q=;
        b=nVZ/gO+x3Q/1vDpYWxPG1IChj/brjvOekmGESH9WOfUrV/DsRUXP8LGYtLsDRK0DAf
         SrQRJ1yXElaQRii87T20ORCg9WwyGP9qaVF90v934pGdNKqmdmUQfsG4W7fx4+SWFjzv
         hH/h0SV1hBYlPkIYBwda5/7rwc9milC3GoXVcSI1PhnEqcpxejEJglhLiWWPcCXzmZa3
         FMk6Z7/8yYMbDzfPO67uINWsiAhsUlMz7Of72NQBZrZD7F7vXH7H8TY0AYrdu1S+N91E
         q7wnpt/veT0J24sWcrWL57p47ohGsg7htaMryoxm3GQ4CoI1nT7psaqpED8bR/59E5GS
         zHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6g9FmjHOmmZ2e/vdUuDnqjzXMM4GxlNkiKOhieoYK6Q=;
        b=I9QTOMhPmObakvdHKZSZq8y4p3yB9EFBbHeNTzvQEq18I4SHH648RrHwAjh3udGosm
         40z43yhqtgohCgK/wMpsKIgAs53RGrfbI+b/exBjmTzSDRZc4E9RNz9WnCuZEZ57OrhU
         wN0Qwr35dzJTunz7QjpVhN6YI+HJeulL9pLzWkXbK9py7oflFEvs+CPX9+HS2tWPEF3T
         37IxCY7N1tD8/mK9JYD+V2hQ1soDztj6nhCn2RP5lDq5Lzlq7IAUh3/QdmdvW8xG9EOM
         OrQk43braQoV4Eg2XmbtuHKnry4A4YH1NqsSbaPP/0qw/wNoZu01Rb7LsvpZws4KK81w
         y0AA==
X-Gm-Message-State: AOAM531harkXbZB7tI+jWsc5PMhktzlAOJENj7HIWBx6xBSBe4CSra4U
	d3jGtK2rVJvX6ne0AJp+Dwt7IEShfH7IfFfT7T4=
X-Google-Smtp-Source: ABdhPJwt4iStAVMtqFEdplzCOtEoUoKRwrStQBy4O2mHbm6a/WB1qiThxlXYfkOFriHvH+WKAsK68A==
X-Received: by 2002:a9d:1ec8:: with SMTP id n66mr9061570otn.314.1623163473715;
        Tue, 08 Jun 2021 07:44:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags
Date: Tue,  8 Jun 2021 04:42:35 -1000
Message-Id: <2246b0d7a71c69eb2e89c55991d1387069895466.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently DTC_FLAGS kernel makefile parameter can be specified directly on the
command line by adding it to KERNEL_EXTRA_ARGS. However, this prevents
scripts/Makefile.lib logic from appending flags that silence dtc warnings (all
assignments done from within a makefile, to a variable specified on the command
line, are ignored).

Because of this, the do_compile log is cluttered with dtc warnings that should
only be printed when compiling with W="123":
...
/soc: node has a reg or ranges property, but no unit name
/soc/gpu: missing or empty reg/ranges property
/soc/firmware/gpio: missing or empty reg/ranges property
...

To fix this, introduce the dedicated KERNEL_DTC_FLAGS variable to hold
dtc flags and export DTC_FLAGS in the environment before generating the dtbs
(make allows "+=" operations on variables that come from the environment, so
the warnings are silenced properly).

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 063b5de86624a42b0aa784db6dddc7552a6dee7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 81dda8003f..d4f8864200 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -9,6 +9,9 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
 # Generate kernel+devicetree bundle
 KERNEL_DEVICETREE_BUNDLE ?= "0"
 
+# dtc flags passed via DTC_FLAGS env variable
+KERNEL_DTC_FLAGS ?= ""
+
 normalize_dtb () {
 	dtb="$1"
 	if echo $dtb | grep -q '/dts/'; then
@@ -50,6 +53,10 @@ do_configure_append() {
 }
 
 do_compile_append() {
+	if [ -n "${KERNEL_DTC_FLAGS}" ]; then
+		export DTC_FLAGS="${KERNEL_DTC_FLAGS}"
+	fi
+
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-- 
2.25.1

