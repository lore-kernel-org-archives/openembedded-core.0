Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0103060AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:04 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j5so5110426qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=96thOFLTrdL7VxPCvbk2egsU3MtC3r918mqbaIeQHcE=;
	b=N4obcuI1nLLFIaXejRviyZ2u+X3TDUvkUPkgm4WzS8h1RV1alDHWN267Ozm2vJ0REL
	amjKWNTSuEQMKumXRzgjsblVOiyWTipPX4C/OBUsQi0980sNjr0ADrwSjd8vmepmo6uV
	F2TN4WNtrH2u7EGlxaRiRgVGV4BQnPxupec0sE2CU5SoPRemdHN7z7q1MUyojTfM+3J2
	48qqY/O+MEt0Fp40+QY1clI7vcqGrJIRol5juAE4Y12JSzMQ1I5mUuE8A7mtEZEUo/BW
	/JVGBFPJnP7LPSh7bV9hW8+rQuNzH8b8mxDfrGwWRtXTFzu8yhBkHNRR8OY64AHuuvAh
	5oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=96thOFLTrdL7VxPCvbk2egsU3MtC3r918mqbaIeQHcE=;
	b=KNXL1357dGLouT1697/k1CT1FT+APyZXQWyYttHWmpe9BDZsVbatl54D4uMDnIo+FM
	3aNlGndgSo3eOm1YoEanwX6+MN+w/sLILW6pGZSzCA/oWGwl7Z1F3uqm0wrH47e7eaYt
	mTf76xeRoQecb6CEwhciwR/H0TR8q/sW+WW3UcoZhEi87atx6EmgyUexBKgjQLG9hE88
	4XN41EjL78ehGG9T3zIVYwiQqanu05pk+IC/+Upr6jEt6/7dn66gEb4wTSZQ/uJypA2T
	KE1y0yIxkZzxpNGsVW319I3BPk+pPHX5XQsVdbh+AV4vlkBw0ljWc3vVsC793zSrwLOM
	EuYQ==
X-Gm-Message-State: APjAAAUFrH6SrS1L3CLuYkufr5ix/H8oqlQoq3sUkfJNf8Jkly83mISv
	1aUBcnFlN9Ji6i3JV9TEhD4=
X-Google-Smtp-Source: APXvYqzKa6FmQ4IYRclB4Os0DYtPhbWoWqhSaQYNkJnuOFAruTW9f0HplSmMTqlKnJo9Hh+Sp4zOJw==
X-Received: by 2002:ac8:3fa9:: with SMTP id d38mr3479750qtk.333.1581010564990; 
	Thu, 06 Feb 2020 09:36:04 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.36.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:51 -0500
Message-Id: <a7dfcd09a44a35ce8cd109c3084486347782e8aa.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] kernel-yocto.bbclass: do_kernel_configme: don't use +errexit, merge_config_build.log and fail when /.config wasn't created
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:04 -0000
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

* for whatever reason, instead of silently continuing to build default kernel config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f71aa7d0a6..d961901b74 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -327,8 +327,6 @@ do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
-	set +e
-
 	# translate the kconfig_mode into something that merge_config.sh
 	# understands
 	case ${KCONFIG_MODE} in
@@ -354,8 +352,9 @@ do_kernel_configme() {
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
2.19.1


