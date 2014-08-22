Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DE37870E4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 15:20:13 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so10555901wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=WNv/W0BdUUiwZ3dD+o3KHJhfS0rv2wFawv6JNuHerA8=;
	b=ct8oZ4x7nPAZBca8Cw+jGws7MyaNOlnnF3byw8X/2Mxp9KqNaBsmruP/SCLkB7IIY8
	q6+0DXpakpidjSbkU3iZRjn0yDLxxjCmddEmd5eD43d6on9uUKzOvdd8jYMO/xwYD+0L
	/SXor+qGTtmRDAw/BhcFbNCeXja5R4gB4k+vSmhPrjFPxWGHAnemMHtxS0IUGTB5Q2N1
	+ChuGcGPARehND0v8A0P5KGM0SJK7UiO0QCZWVdRHbqvDgsc4uysihnsEy4IRE+Pv0Pz
	GnPRXv3DoF20SdBI7TnkiB5ZWkGY0bQjotDDtf1/7RH7sT1PhC7YwPzj7lLWFC1r4uh9
	NAog==
X-Gm-Message-State: ALoCoQnBLFEHOk3cFmbNlpyhG5NyrHssSDhD2Yiu0Ic1SA62GKIrCfJNATrBF6wGv47RWfCMBT4+
X-Received: by 10.194.19.165 with SMTP id g5mr6021233wje.65.1408720814266;
	Fri, 22 Aug 2014 08:20:14 -0700 (PDT)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id es9sm75886410wjd.1.2014.08.22.08.20.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 08:20:13 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Fri, 22 Aug 2014 16:20:06 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:20:03 +0100
Message-Id: <1408720803-11737-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Fri, 22 Aug 2014 15:20:22 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/classes/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6cc8eba..60278d6 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -19,6 +19,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
+	echo 'export CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
@@ -37,6 +38,7 @@ toolchain_create_tree_env_script () {
 	rm -f $script
 	touch $script
 	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+	echo 'export CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.0.4


