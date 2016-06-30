Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A4730600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 12:21:16 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a66so116015496wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xEghEJfCfx3vz+kMBuCGMJt6NafeNDARf0F61Q71K2E=;
	b=H3AgBB80jxfd4S4tL+NtOSu81i8KYtYxtzxGYdIQYHSkgCBH1EwRmMKVMVFDiSxOGV
	p69hYgqn9NOiwYciz4FTQ/OO0CJSoz4tZ27mnkzwgX474tcgSRj4H2YGBGg5MyA9Q6y9
	qMLc/E5RORDUwtVNMEnPW+2eGEo/Nmbr5lDBNshdWKNbYw2zs9gyYElqgbSt1NyWjpV1
	PJqekThueV4nmgP0U7RDwxS/aZ65/GqQettt5kER5GlwR8nGWkiDwv48omsmyQP8qB+6
	rK6OUEJHuEjpFE8Fa0BgkRtv6w2nEyUq24weE01mMfnOPn5FSV2CdtG9+tC/TxRmVFFL
	+T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xEghEJfCfx3vz+kMBuCGMJt6NafeNDARf0F61Q71K2E=;
	b=Bk6M+7IrbX4eWM/TRWnIstBxqL/i8O0PVYbbTDv4KqLdO5av3uvE7uZeCi+Iegzu0f
	lOeB8cEraRGv5G5IFQ9MagCpYPaApo9wwYTx2sF4a93B3UUtkR+A/8T676ScZRsMzTgv
	40Dnr/pNVmoCuZHJFwEMAb0atk75TNOkz+SzAv+R6kECOpkwYLXY5bl/eiJZienE1bPK
	QvsLbkfMxWatDECudYJ/go4AR7xtKIUdvDZ/je2a44qtbr1gs6H9cawbFzB8zlUQTyS3
	vMxvYiIkJb+s7Ip1ttimv3+pelHCCG84zTe/wTgIyCUhNveu29euUFscsIJ2zwN3WxFY
	9/wA==
X-Gm-Message-State: ALyK8tL4ydqIreV+un1nwqIyyZV3rK72IjfZsRuf8WLH5d/VpdNkq8LixKKcIyHUZ/gSfC9N
X-Received: by 10.194.88.5 with SMTP id bc5mr14720927wjb.100.1467289276923;
	Thu, 30 Jun 2016 05:21:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r6sm3866649wme.14.2016.06.30.05.21.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jun 2016 05:21:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 13:21:09 +0100
Message-Id: <1467289269-9956-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] toolchain-scripts: add sysroot/usr/share/pkgconfig to PKG_CONFIG_PATH
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
X-List-Received-Date: Thu, 30 Jun 2016 12:21:19 -0000

Otherwise architecture-independent pkg-config files such as wayland-protocols
won't be found in the SDK.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 02e69c8..32d8c32 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -8,7 +8,8 @@ TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
-	# Create environment setup script
+	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
+	# only be expanded on the target at runtime.
 	base_sbindir=${10:-${base_sbindir_nativesdk}}
 	base_bindir=${9:-${base_bindir_nativesdk}}
 	sbindir=${8:-${sbindir_nativesdk}}
@@ -29,7 +30,7 @@ toolchain_create_sdk_env_script () {
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
 	echo "export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
-	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
+	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
-- 
2.8.1


