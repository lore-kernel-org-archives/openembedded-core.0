Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 638EF6E650
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 13:43:30 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id t196so25831211lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HCRgo7xvSqdq1QES6avwpjWD84CBEMUmoYLmtcTB70o=;
	b=emqBd6JNc8TkRG9Lsghq8CNdVR2OAgpgz6cumm7CjylET6abH2P97pdWwnNRTS6XM8
	IU/oDlNVOEwygN5SlGSJ8tFam+bP3ZTU2w6sd9+LdeDH7TRnyODDPnnO4YlCueqgcApZ
	aQNmfUgjEOmYNvlbqkvdv4PCDhKPmBCioEUDPLz+9lPhFRAFBhlucBy+EGrFG64M6P6r
	VQQVEyVKL66SToqaYHwHG5jHQ4n8+w9qA7KEyOUegHrKUD9P6/G48WguLjY5+KuU5Nct
	nQ+/QiCEJObNPjYKsDQCBweJAMLS/tWOrde8WWzfLDhkjQHOXckOCoLoSppSdIseDiqq
	CElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HCRgo7xvSqdq1QES6avwpjWD84CBEMUmoYLmtcTB70o=;
	b=TT+/mj2O1xydJ+zRsFiLSuNCIFgy95JsaPESa87DGbj7HOtKMGbJItVmibKZsaN9pj
	2iMowuez0H4R1mU38D8oqSz74TI/XaKNDH0eymayB5d2jg0w34GP3RYSpAsGvGazBP2G
	KB9rZbX099QbFu4Vl/sYK3Pbxdf5dstAhAJwfj3tKbfkR1ct8AWsaQj33nE0ke1ys6le
	q1SuL5V2cNBKGO1RbsysomfPjF6TYDYfc3tMmxNFPex3lqsrJwS0C8anjX7NrkDiHSHR
	zj24YNTzQfue96B1l0ZVSkf6i0qHjygLV0pEasg5Jupv0vMRw/vqH2H5kqMPWDSdSliO
	IkSw==
X-Gm-Message-State: AIkVDXJkBva8WvgLuSgBjTcSt13klIqet29BdghVkCS14bCe/YFWyLpuJyfzKuGPs1j+TQ==
X-Received: by 10.25.44.66 with SMTP id s63mr23364011lfs.159.1483451010887;
	Tue, 03 Jan 2017 05:43:30 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	u203sm16802712lff.9.2017.01.03.05.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jan 2017 05:43:30 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 14:42:56 +0100
Message-Id: <1483450976-22741-2-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1483450976-22741-1-git-send-email-ola.redell@retotech.se>
References: <1483450976-22741-1-git-send-email-ola.redell@retotech.se>
Subject: [PATCH] Append KERNEL_VERSION string to kernel module package names
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
X-List-Received-Date: Tue, 03 Jan 2017 13:43:31 -0000

From: Ola Redell <ola.redell@retotech.se>

The KERNEL_VERSION string is added to kernel module package names in order to
make the kernel modules for different kernel versions distinct packages instead
of different versions of the same package. With this change, when a new kernel
is installed together with its kernel modules (e.g. by upgrade of the packages
kernel and kernel-modules) using some package manager such as apt-get or rpm,
the kernel modules for the older kernel will not be removed. This enables a
fall back to the older kernel if the new one fails.

Signed-off-by: Ola Redell <ola.redell@retotech.se>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index efe1b42..8365448 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -122,7 +122,7 @@ python split_kernel_module_packages () {
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern = module_pattern_prefix + 'kernel-module-%s'
+    module_pattern = 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
 
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
-- 
1.9.1


