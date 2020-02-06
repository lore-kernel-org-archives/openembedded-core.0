Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id A888B60E3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:06 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id s7so3225264qvn.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6cMLxphimiAc1g3V5Za7DJmtsLO1SyOerC9QIWsTG28=;
	b=j9pc3PhI8FZpkosuO98Zf+ilooIKnmRNgG9RwZrfP5uEX2wuO78EbvSx85W6q2zEK6
	fSP9smmhGJkrR39rhnYAU0LRrbZ0ucFfVa0XnpGrXUWadtWbFBpucERueTxapgBmmKoQ
	jCdEwCosCz4sFWE8EryajnB+o7Ib5R5lInS2jRzuMYI3OttOZtOmGG0p7bVNChiS12nl
	tYajYWk5wPnbzHGZVPs+RCJBfUAfC4Pq3KeNhoxOAqGWM2T+YC26uW1ZIwhiRK/XYcFV
	P4pLDANqqBBj3MhYA3YTVTOY2EVhQSpxRzCdcmWs+HxdU+E4w8cOQgJ6atkwUpz+Jjus
	T1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6cMLxphimiAc1g3V5Za7DJmtsLO1SyOerC9QIWsTG28=;
	b=WFmMjmpqd++KFCtMoxdT+YQQxcP2Vgcyo7Dm62S2kTEmEnjDe2DyAUhOqQK6rGOCXE
	Fjjlu4rfZ51tUgfX6jkIVKC8InpzMU6ocMKDIrBxg4Bo/8+/oyBJ8UVLm2sjLEujH3CM
	WejVk1GLaL2ZhKtFuPFmqBbys9imxQK0fei11H0OGMgLa7wyVRsS/cArEzQUT52I9MWJ
	XK3ksC0fbkdwnmKfAhxea1P3ucmh7RqsirdlGLs63lGVYVsaq+6x5ZsepODRCCrLz/mm
	IaZsdlRW2anOV62PWJNpJrbdzKXCjcYArFxvux70dzEd3mpZckElydged6NxfDMhzxU/
	oTkA==
X-Gm-Message-State: APjAAAVCeTrDNcg7hCPMn57Wg0IzMjci7RiyDz5bogBQFVeck/vcOmr9
	QgGMR0mLe3WFDfS3hR52uyU=
X-Google-Smtp-Source: APXvYqx8ECK+0gBlHUFixWlsv0PSjNx4dhmD5g9F2DSJEW7din2zUAmrIgY0hnrjEquJV8Ih4tngUQ==
X-Received: by 2002:ad4:4e09:: with SMTP id dl9mr3275854qvb.137.1581010567578; 
	Thu, 06 Feb 2020 09:36:07 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.36.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:06 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:53 -0500
Message-Id: <fc9272a1b06a8efeb155b229967eb25ef4dff7c9.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] kern-tools: fix merge_config when LD contains parameters
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To ensure that the kernel linker is used when allno/mod/yes config
merge_config steps were executed, the call to make was tweaked to
explicitly pass LD.

But since the variable wasn't quoted, any parameters to LD (like
the sysroot) were mistakenly passed to make, and hence could trigger
an error on some architectures.

We also tweak the logging to hightlight errors like this in the
future and avoid losing it in the noise of merge configs sometimes
overly verbose output.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass                      | 10 +++++++---
 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 918d101d3d..31ea42580c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -352,10 +352,14 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
-
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
-		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
+		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
+		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
+			bbfatal_log "`cat ${meta_dir}/cfg/merge_config_build.log`"
+		else
+			bbfatal_log "Details can be found at: ${S}/${meta_dir}/cfg/merge_config_build.log"
+		fi
 	fi
 
 	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index f263421234..4f1af731d6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
+SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


