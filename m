Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFED47F02F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:01 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id v12so871584pfn.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=gmE6hm1NcnZaVg1B4pDS7tm6YQvioFPC6JR/SSM/2B0=;
	b=BCcwmOSfgZ2NpJu4Pq6vbCzrcndBAbnVLRu4WLhjK0Oss0MZPcEPC77n+nwUpEcUva
	mCBtYqzm7yPDyodBYdfvUFELoFQp/pxf3e6v2tRzoyUetA3QM0mPTcPGGpygqWwL0RG/
	U5ywE89rNYCqDwcUCGdZyXv/i6NS2en9KuQtzxKYjBFaK82kXaxts4H5Bi0bfu5ya4u3
	zXCOXmWadZ/0JdscIsrn1kaOblwBdK+Y6r5tQ9Knw8Pi5BGtgCBlWRr+pULBEs78Z5M5
	D1Vp8Wtp14I/h4JpxUxrrmEMR5m4Jz1sl3GiGLGbt1CAg00U1cWrx24zc+vVWkGTGYpF
	si/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=gmE6hm1NcnZaVg1B4pDS7tm6YQvioFPC6JR/SSM/2B0=;
	b=o8jnacyf6pM2YTO2f7vl/qfxSIVztfbFqElnD/Swg7UZU9r/ba5Fnd7Cbtva+z+VF3
	wCkciL/UlGhd1uxTmgOOPVJSp4pVkL0WQQmfl/btmbE8SDDIhx4+pyA094ibdAbjmGkO
	9YndYUUR1k4gL4MiuG4lhQSGVA/1HIB6Gfdjtn165ynZ+4NAOKy6BkQ3ieu6aWCTGtVw
	Isve05mSyJLbjUL0QFrRxaKBw2wXxIZhzK11WuHlDwDHuk1gXS3fH8Hbo4ATQRZQQwgX
	LX/BPhNt45mDvd6KhvMUoW1jS/1rClDezKsHvQd74MGhiAXU7nUVIeiDXVmJ85rnnwpm
	jAUQ==
X-Gm-Message-State: APjAAAUOHTvgzaHTr1uLzOGby9o7hQhbomZpfQ0auvLKoxhZp5Od0Bcd
	BtG7un9o/Xdeq/H10xfv59oxTg==
X-Google-Smtp-Source: APXvYqxmwRwPF9px2UT+oXBEWS39KCNtXPgy8b1KxM1kyb02HkD2HNgNeuH0xLhYhKqq9JsvvUrGkg==
X-Received: by 2002:aa7:8808:: with SMTP id c8mr2442614pfo.67.1566968822905;
	Tue, 27 Aug 2019 22:07:02 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	e13sm1154232pff.181.2019.08.27.22.07.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:02 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-4-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 4/11] gcc-common.inc: Process staging fixme with correct target/native sysroot
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Correct the 'staging_processfixme' call so that target sysroot and
native sysroot paths are corrected when extracting the stashed build
directory. This is required for 'make check' to work correctly due paths
used in configuration and scripts which point at the native sysroot.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 96334e54b4..a8f4b60c32 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -17,7 +17,7 @@ python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
-    staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+    staging_processfixme([src + "/fixmepath"], dest, d.getVar("RECIPE_SYSROOT"), d.getVar("RECIPE_SYSROOT_NATIVE"), d)
 }
 
 def get_gcc_float_setting(bb, d):
---
2.23.0.rc1

