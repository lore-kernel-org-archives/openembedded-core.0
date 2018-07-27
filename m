Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C740378D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:01 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c14-v6so5657373wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A8d2AV8fc/lCY5LtvYoV67zs0XugMkYabMan2N1we7Q=;
	b=THvxGUiJ4sgoXx0WEbFXUx1DITqJt8aSJlxnEu0r8yWkgUMcpX2ahqVPVm3ugJUdja
	Y4w+wS/1itlCHEjmdqL/YQpwiryG5M6066dcTqhQrCVfDpO+AIzru7mTj2bBXH0X10TC
	8h8Dl+XzK1cHms0AAQI/zUB9hZKuL0JXBr2nLCdLpspGB1ZRz7684cxzscoOTfk/bdDE
	p/ead6UqrKhwf9IaLgtdEfK/TH9nemYwAQ7RiYFcaLQmMBz8d1CIjmxpHxM0IruRLhum
	2FU0mkgF4wfnoa7TO5pZFTQfOGkEZ+qzBDbxAP29eyl7jtlaJEmUaFdKlrYdIVLeiRGE
	xQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A8d2AV8fc/lCY5LtvYoV67zs0XugMkYabMan2N1we7Q=;
	b=k61/30j9PNYKMYtM+2bkVOClBOgRrVXj9jC/NAbvvdV8tkLf6WXmgGuNEffIZ4OxPk
	7T2uGWpnDII5nAgSV/sOxXe0tKALtzYJXcj49Jo36GNH0oURGW1DEbJXACoE1nBewGd0
	phihVXVB66oPhrvmNpJM8ixmuUUIwhkas08a4v3WruC4YeZoIM8962vvA6LiyiY46f5/
	V/AaMqgWX8CCYEXCD8ZoD45PRwD1js4wS712CBGlyoW24rLUARrnFTycaS7z07GxyMgK
	FThRsL3IpQ5bAFUzUDo13WcXYiXobjYXPpUX0sXSj+PrkyYqVwC8LjaaQadUVBb5hppt
	KO/Q==
X-Gm-Message-State: AOUpUlFGxk2ig9DbkKcK1AU5bH+UJ7ckpofUU7G1g2qZGV4FPLUtZOhX
	n+kUXue5pm6d+T4teO+6nV49UTAHt44=
X-Google-Smtp-Source: AAOMgpfJ9cfDomIvnLd1xQ9GG+IIFeVPMPQ+aUE/2CYnjtZM8rLYiIlkDQKU7DrX2GsNd5Y2Qdi2hg==
X-Received: by 2002:a1c:570a:: with SMTP id
	l10-v6mr4799814wmb.56.1532705582152; 
	Fri, 27 Jul 2018 08:33:02 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:41 +0100
Message-Id: <20180727153248.22838-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 09/16] unzip: fix symlink problem
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:02 -0000

Large zip files can cause unzip to crash, take a patch from Fedora to fix it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/unzip/unzip/symlink.patch | 26 +++++++++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/symlink.patch

diff --git a/meta/recipes-extended/unzip/unzip/symlink.patch b/meta/recipes-extended/unzip/unzip/symlink.patch
new file mode 100644
index 00000000000..a38f6f16123
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/symlink.patch
@@ -0,0 +1,26 @@
+Unzip doesn't handle large zip files well and crashes:
+
+"This only happens if you have more then 16k entries and when one of
+the 16k entry infos is reused it happend to be previously used for
+a symlink entry."
+
+This patch is taken from Fedora (https://bugzilla.redhat.com/show_bug.cgi?id=972427)
+
+Upstream-Status: Pending (upstream is dead)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- unzip60/process.c.sav	2013-06-09 12:08:57.070392264 +0200
++++ unzip60/process.c	2013-06-09 12:10:08.641696988 +0200
+@@ -1751,6 +1751,12 @@
+         = (G.crec.general_purpose_bit_flag & (1 << 11)) == (1 << 11);
+ #endif
+ 
++#ifdef SYMLINKS
++    /* Initialize the symlink flag, may be set by the platform-specific
++       mapattr function.  */
++    G.pInfo->symlink = 0;
++#endif 
++
+     return PK_COOL;
+ 
+ } /* end function process_cdir_file_hdr() */
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 105d048f55b..dbf4112a4c6 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://fix-security-format.patch \
 	file://18-cve-2014-9913-unzip-buffer-overflow.patch \
 	file://19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	file://symlink.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.11.0


