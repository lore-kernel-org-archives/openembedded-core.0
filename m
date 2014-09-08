Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 43F21713DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:20 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id z2so2494691wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CtaxKZPVbTjG7q8hh8UZe7NGLz71ASw3wLIjqOMvlMM=;
	b=cTq34h2DfR7DNTOkPiG1BB8+TFPo7klPOCFKLGgF0nKfoHubehL4VMeL6RXGINY6rL
	eEDD6c1cKQRfS6+GnYOn4vWx+9khSGcqOI84cqkkEuMGe387Fdx3rjE2cyUtHd8mA75r
	ylI0W9KgnYPAZ2drFewhYG/buDZ3iEhlLuSIrcAuWvQsIb2rLBdr3uF/BM0avoB+V1zN
	cNSxp17hWChGYQnnVn1yjgMCP1lvykPtJlPwqlQPi6/C21guDhhhc3MOxe4fbP/SvY5M
	xEeWlG0D7mOPr1hXCaKYyudrtLeOBTzEuzFch5wQkZ9MEPHwkJLRYGCX+tgW5GaE1BKf
	i7OQ==
X-Gm-Message-State: ALoCoQmVU31PxvPwjgJn2S6WVG7FgmswSFa0H+6pcPTOtVjHCZ/UUj3DWFX2GMIVbMsv4pQQixE+
X-Received: by 10.194.176.68 with SMTP id cg4mr2196177wjc.132.1410177562012;
	Mon, 08 Sep 2014 04:59:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:41 +0100
Message-Id: <685d5587640c71ae668d56d3e1e30805d174e572.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 23/27] python-native: disable user site support
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:21 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

The user site-packages gets inserted into sys.path ahead of the
system site directories, so a site package installed there will
be used in preference to what's in our sysroot, causing less
deterministic builds, and potential build breakage, depending
on what the user has installed there. Disable it for our native
python, so they don't affect our builds.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.3.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 827654d..e55f5fe 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -58,4 +58,8 @@ do_install() {
 	# (these often end up too long for the #! parser in the kernel as the
 	# buffer is 128 bytes long).
 	ln -s python-native/python ${D}${bindir}/nativepython
+	
+	# We don't want modules in ~/.local being used in preference to those
+	# installed in the native sysroot, so disable user site support.
+	sed -i -e 's,^\(ENABLE_USER_SITE = \).*,\1False,' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
 }
-- 
1.7.10.4


