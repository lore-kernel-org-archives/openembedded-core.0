Return-Path: <lpapp@archlinux.us>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B112E72318
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:41:12 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so9018395wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=SO5GZWcM8RCfM+t+fapQiX8cBpiH19SNKeqziWgI7Zo=;
	b=kwPaaoS20A+Bybis9I1g5FFpi0yfD/n5LubYkX/KWSrxgSzxUVn+6Cioi/sHqx9A1u
	Zgm7sjqdrpRabXdhUr6OhGk9Jz430LCHD6scr23sfQO3+4n4TGcPZxnTo3ipgxfidWex
	339Hvw4ar3bNK776jfakBVzC1RQkJe6RI3Qfw+vYsJp2zXEtfgBSWyviKUahTmiqkkNu
	26pEcivfjC/M+7TZ8UYqlvoUWDdIp8MDqwoIF/X8Vmv+86a593sepklGmGqOd1RCkdc2
	1juyx3ELAudSBuyHsPcwKyCRxYM3P/4kRdHIG496g6vBvt+qagAUdj6U0pu24d967TRk
	EGGA==
X-Gm-Message-State: ALoCoQkj+Ew0lE0kU1NMJsNwPFklUDkxJYSBbVsmoZH71kITx1YIgnGhT7BdJAu/3BjMYrZa/A2q
X-Received: by 10.194.177.225 with SMTP id ct1mr26157809wjc.75.1417110073123; 
	Thu, 27 Nov 2014 09:41:13 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id
	fk16sm12519006wic.16.2014.11.27.09.41.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 09:41:12 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
From: Laszlo Papp <lpapp@kde.org>
X-Google-Original-From: Laszlo Papp <laszlo.papp@polatis.com>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Thu, 27 Nov 2014 17:39:12 +0000
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 17:38:53 +0000
Message-Id: <1417109933-19852-1-git-send-email-laszlo.papp@polatis.com>
X-Mailer: git-send-email 2.1.3
Cc: Laszlo Papp <laszlo.papp@kde.org>
Subject: [PATCHv2] toolchain-script: Add support for ccache builds with the SDK
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
X-List-Received-Date: Thu, 27 Nov 2014 17:41:16 -0000

From: Laszlo Papp <lpapp@kde.org>

It is necessary to have an SDK for developers who build their software with
ccache to speed up the compilation. Without resolving this, unfortunately the
compilation will fail for them.

Signed-off-by: Laszlo Papp <laszlo.papp@kde.org>
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


