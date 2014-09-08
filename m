Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 62ADB7136A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:59 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so2082185wes.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=pkpiFqYUIhjQRSyNRHKoEItILCQxRG4eTW2OPnnSUoE=;
	b=WWgK8uetGHbkn8kzSoSv7RPGy80Dfv8YxQZa/C/pqDB5nppdB+9gafHLogrcbxv9bD
	qOf19cqGCUfdQuB8FXZTp7rsx0FVlEyEQpmW5fnd2waLp+VSVkuGtWI5OGddfSaSV8wj
	HCM7/JWXTCSORqW/9RGRYHvP67HSE6CIuIEcULDYDfd+3I9NnWzqSmbWXOjr/aOWPRc5
	z4wM1D/v1eLSzuVDgrQcVPrwfHoBcAI+V1Zjj/B3ti+2KCMUXwrsKHC5oi+IlFpbEUYK
	1CzKJ9JRNg9ttoyu4zglpytq9XRmEEP7L1rQmvZ6XgbVjvDOTjO1Ch61LaHhoF3Z3Nsv
	rf8Q==
X-Gm-Message-State: ALoCoQk43UP+kcT9R55OIkzx1qzgfjvFIP6oHtif5bNnmr7BWDDGiauU12y26h0fSv9/9qM05McU
X-Received: by 10.180.37.108 with SMTP id x12mr22617052wij.16.1410177540266;
	Mon, 08 Sep 2014 04:59:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:24 +0100
Message-Id: <304541e7c965561cf520928ee8b7d9fe21a9830a.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 06/27] libunwind: add recipes
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:59 -0000

From: Chong Lu <Chong.Lu@windriver.com>

Add libunwind from meta-oe to oe-core, since perf depends on it.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libunwind/libunwind.inc    |   30 +++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb |    4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
new file mode 100644
index 0000000..b27b9e5
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -0,0 +1,30 @@
+DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
+HOMEPAGE = "http://www.nongnu.org/libunwind"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
+
+EXTRA_OECONF_arm = "--enable-debug-frame"
+
+CFLAGS += "${ATOMICOPS}"
+ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
+ATOMICOPS ?= ""
+
+LDFLAGS += "${LIBATOMICS}"
+LIBATOMICS_armv5 = "-latomic_ops"
+LIBATOMICS_armv4 = "-latomic_ops"
+LIBATOMICS ?= ""
+
+DEPENDS += "${DEPLIBATOMICS}"
+DEPLIBATOMICS_armv5 = "libatomics-ops"
+DEPLIBATOMICS_armv4 = "libatomics-ops"
+DEPLIBATOMICS ?= ""
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
new file mode 100644
index 0000000..bc38e36
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -0,0 +1,4 @@
+require libunwind.inc
+
+SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
+SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.7.10.4


