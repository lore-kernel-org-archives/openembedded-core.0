Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id D12B679572
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:30:31 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id x6-v6so2279175plv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=I6P5r/079VNcHnrghmeasSNF18Is26hP64gx3sosLM8=;
	b=k+HVQ9ej2ExnLPCdUS1gSiXjloIx6SQ76wJtohlq1ThgBK+Q5rrimNaV0khyidtnhz
	cRUFKdaBnPeQZGHyEjDGONHl8Tis9zpbuyp7kXaEuum/1Vy90eDy7xE3hscaPOTlWG9q
	U5PVz6jw+dv+0vEHJqgESjoQYcswAKH3e3g66TI1OAmW0ZBA1clvtKaAGjvdzlM8e7x5
	Gm2quSrmvG0S9kiwZRURvx9PeBdosCX/3YKop0NObnTEoco2TCplvMU7x2g6QSo/dqoM
	5UkuL7zwheqDQeckMgjptUOjnk41S1wPRi15Aw1E2Vy+NNQiSNDs/NaxMevyBg3K8OVj
	kp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I6P5r/079VNcHnrghmeasSNF18Is26hP64gx3sosLM8=;
	b=P4BhxajiG1Q4inYExluxsWtxCBJknGo/VlwH3X74K90VGcxeBeH/WjiURKd3DMJVHg
	PZHS+vQrFK2iqEnMd07/G7ZZpPIU8XC5whzTwLfBLjvB3yuFmvliHt2lBudxWBiVImoS
	pdtGqFbDow39+Cf7XHuGRtf76Cq6iDyVxpgNngjQATUv6BK1IdO8m+k8lRgZvFZabmzc
	SCOOUgAoj/H11rhK4Cvddl+hPlCHgSDvWgSA9td6wYp9+OUK3kSplDEKiYh3XBJkwquz
	GmrcHW/Gqjo+wdpq0TVO+DFsJW6/AcQ/t3pDC187SnArNNdR6roOWmLFt7Fb2jsSLzyZ
	0xug==
X-Gm-Message-State: AOUpUlEdGs0KqY3VcR+iyn10BUoUBSpWYREfrj18YsVztIaSVNnixr8L
	xEbg5t/ugaJhv68HkrdFaUzL5zIFQlRTSA==
X-Google-Smtp-Source: AA+uWPxazb0ZTGaBlRPr/Yw4lziXx11l2nzbpOLH4pb/X6mblQLbuobgvW++64LbXnOYjv+FgoUCJQ==
X-Received: by 2002:a17:902:2f84:: with SMTP id
	t4-v6mr58182525plb.87.1535023832782; 
	Thu, 23 Aug 2018 04:30:32 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	h69-v6sm11822156pfh.13.2018.08.23.04.30.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 04:30:32 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 17:00:16 +0530
Message-Id: <1535023816-11364-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Thu, 23 Aug 2018 11:30:32 -0000

From: Chin Huat Ang <chin.huat.ang@intel.com>

The environment setup script generated in the build directory sets the PATH
variable by expanding ${PATH} which would have host paths filtered. Sourcing
this script to run runqemu will not work as it complains host stty (/bin/stty)
cannot be found.

To resolve this, the script no longer expands ${PATH} during generation time,
instead it will now source oe-init-build-env to initialize the build
environment so that all host paths will be preserved. Also be sure to prepend
STAGING_BINDIR_TOOLCHAIN to the PATH variable so that the toolchain from the
build directory can be found.

[YOCTO #12695]

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index eeb320d..ee411dd 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -62,7 +62,8 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+	echo ". ${COREBASE}/oe-init-build-env ${TOPDIR}" >> $script
+	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
 	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
 	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
-- 
2.7.4


