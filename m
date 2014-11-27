Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4A01272318
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:42:52 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so7015723wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=xX1aC9AasSDzJRJlJ1JwvuIs9bftYlFubyLpzOXhsf4=;
	b=m2CalCHczJxkk1xeON/tbvl2byfGCYRwMBdI/TS03yhPbSmMtnLMXV38E3h4G7cbK+
	84nwWzr1ZPf+fmXJGO4VpHZb7WgiUGvkIv6Bz6KA/J1rODs+q5tV1ArRWgsIGOAwboNX
	ci6yvv6g1hn6K62xCnCDqcnWWUIoAz9XsSZtryYnLLLraJYsRaV7kMlnUM1eBb5NKR12
	jAKEk1ADkuhVgGXDJyZAyLpzb0AibvW106rvG667LbobtwkQSvKG3HHNaup6IV4UPlKQ
	MMSD1HY2TnTH3wUV05JpLFPnp5lKUL/+8KP/fS2zYi26pWj2lnKX3RzRbz/55hTSAAAr
	6rUw==
X-Gm-Message-State: ALoCoQlIOLjbtgR6kkGLpfj10WsA/qnq7r1kfNh8sLnkUsQGmTXy73YlBPmRlofcdkLPTRDtCo2c
X-Received: by 10.194.241.194 with SMTP id wk2mr60753571wjc.132.1417110172559; 
	Thu, 27 Nov 2014 09:42:52 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id
	ec2sm12512000wib.23.2014.11.27.09.42.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 09:42:51 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Thu, 27 Nov 2014 17:40:52 +0000
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 17:40:51 +0000
Message-Id: <1417110051-20003-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 2.1.3
Subject: [PATCHv3] toolchain-script: Add support for ccache builds with the SDK
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
X-List-Received-Date: Thu, 27 Nov 2014 17:42:59 -0000

It is necessary to have an SDK for developers who build their software with
ccache to speed up the compilation. Without resolving this, unfortunately the
compilation will fail for them.

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/classes/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d5b9675..9836db4 100644
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
2.1.3


