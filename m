Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0796F9B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:47:04 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id e16so1399175lan.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 00:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r/eubFh2ukJtR88I2GHeekAUMoovq/QUsXLxd/qnbdo=;
	b=IFNHMVO8KTzFTXSZ8u9HcpNWBJhXWmuAn3MXpOFjRye+6fu9zedTk9TjKk/1CD2Hii
	jIupjvkjFjnTnBsPbanPjhzsxPqt3EiBXV9dfe8LfRJE4PyUma1olcyAkAQcTrVd2gr9
	s4tbNAgAacTegmnKvJYpKUg1uzkRNuB4KzU76BdaQP/M5Xt9urjB7RAKQaRf4yK9BoHI
	xL3lij3We1WmG6OPtDOFBLdLoaYV2c4HZWhRQiS1eV01bNk8x5XH0eTq3YFBjF7GNXmp
	m4QG1dRZjAQJgnOIzcD4z0OOVfxa17BMQo/uC70mKL68ys/DmzFZmOKpv9y3azA3bwDR
	FV2g==
X-Gm-Message-State: ALoCoQk4LbsrimnWcxGL4CXLGLPQKc5l4tdMgTiOP81hjKnWDFdKrDb3uvn5XDA21Nw18gTXKpe0
X-Received: by 10.112.94.229 with SMTP id df5mr4773747lbb.36.1395388024424;
	Fri, 21 Mar 2014 00:47:04 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	ml10sm2816686lbc.29.2014.03.21.00.47.03 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Mar 2014 00:47:03 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 09:47:01 +0200
Message-Id: <1395388021-12469-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2] kernel-arch.bbclass: add arm64 support to U-Boot architecture map
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
X-List-Received-Date: Fri, 21 Mar 2014 07:47:06 -0000

to define UBOOT_ARCH, we map kernel architectures to U-Boot architectures.
In the case of arm64 kernel, we should map to arm U-boot architecture.

This patch add the exception rule to the map_uboot_arch function.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6a6ad91..bbcfa15 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -40,6 +40,7 @@ def map_uboot_arch(a, d):
 
     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
     elif re.match('i.86$', a): return 'x86'
+    elif re.match('arm64$', a): return 'arm'
     return a
 
 export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
-- 
1.8.1.2


