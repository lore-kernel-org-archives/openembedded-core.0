Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 95EC861023
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:42:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so747436wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7WbrPup62agUrw0KJzoixrxHh7VBz3UtwrlpYb0/KIk=;
	b=Pj5xLwHh8iIYjbeBVsOQhETgx+vNIZMTLKkHjbX+4k9Ox8DCACvU6Vy58wrKaif2bX
	YIBAvtP8rcOaRYWtcrYx463qq+3dLC91dAO8oRY77UC1+AqLyeRuSR6/bz7Td1do2oOl
	IOnFB6c03xFvap7oqvIv9AmnrZ9enQvUL1ooyJwl64fqDwDEk8jTpCVRd2v+QZEFEsOk
	vQGQrNDbc3/m2jltpwTGDIZ1ia+6MsF18cbfT60eHzQk0k7Hu+X2uOyEGNdym2hm5ba4
	DTnwXngSAPu9xDbg/KLe/XYKagacA9SOFCGvHB6rdBN9AVMjOdFYAwYDkhwPiCf0XD5V
	nLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7WbrPup62agUrw0KJzoixrxHh7VBz3UtwrlpYb0/KIk=;
	b=XLYpCwF4TVcT/u/x7LNGANFCp8p/hGQ1IHI9NOCEOqMb77xkl+MaAPEaA+8iA4CT0z
	aXLEc2t1Rk2mXNyyPC62WNop+puhtD4mVBqFEdv0KPGL86Dk/do+dtQOKDcdAepErJPg
	XVDu0CtrkOFyNaVMCASsx0QIp6QHmDr3VZ6uypES+X3jw6Pwoqk48htwL0v0EkSG6qrx
	tJGFe2M9D+Aisy+Qe2GVr38Ve6cuhxE1h2i2xK5VjrzcrWKtKMmCf2oQuA84Ocu8zv5k
	SwnILoQwSfg0RaDIQzIUhMZ05OXWuoAZ6KatMxz2Q0uWUvvgvROjtzW7FYXqYOUT1vmK
	lpfA==
X-Gm-Message-State: APjAAAVd4gPgeEpnCjzUjjpc/JZaPd3BMX+vr5s6j1OFfh560aI5T1Ti
	7pZg3v//vyLXwzXoT29tmBjwWEYD
X-Google-Smtp-Source: APXvYqwtzx8jJ39UQ9fmagkSQBzR4qsi2YR5DX/a9GyRgv9o/6LlX9L2Oc/jfncTBVh6n2nlcX6M+w==
X-Received: by 2002:a1c:988a:: with SMTP id a132mr2274237wme.113.1580870565930;
	Tue, 04 Feb 2020 18:42:45 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id r1sm9681144wrx.11.2020.02.04.18.42.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 18:42:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 03:42:39 +0100
Message-Id: <20200205024241.27828-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205024241.27828-1-Martin.Jansa@gmail.com>
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] kernel-yocto.bbclass: do_kernel_configme: don't use +errexit, merge_config_build.log and fail when /.config wasn't created
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
X-List-Received-Date: Wed, 05 Feb 2020 02:42:46 -0000
Content-Transfer-Encoding: 8bit

* for whatever reason, instead of silently continuing to build default kernel config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d2796b01bf..8e642cd999 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -318,8 +318,6 @@ do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
-	set +e
-
 	# translate the kconfig_mode into something that merge_config.sh
 	# understands
 	case ${KCONFIG_MODE} in
@@ -345,8 +343,9 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
-	if [ $? -ne 0 ]; then
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
+
+	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-- 
2.20.1


