Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AADCD7E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 11:25:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v14so13408754wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5BDEpbcsDf/ZFhn/Rk0SQXrcpJlpyaxnW/cD5UZFJ3c=;
	b=o56YmKTNAjmrknp8jpMPDyfYI52/5UKw7+12zz699A4kwcNHBM8Gwi3iJvpjDvULcv
	6S7MXPLpc0RmlT4AywGkGPaJzhgc7imzuUlhDkFaKjR2qw8ZCoG5d9DgAzbQOqiMMi+N
	ruDLeVaatLTdi3re84+ZKmaD16H/tBCblomgLub/W4cboddm+YjxE6AjVpdeAUvKOl4b
	JwoK8jeTiljUpjiWe2MsBBhxXqDXw4PVdEohrTPjkYHOI31GntnI0rIy4gWPqx3iqTyq
	I0n/s2dmhiVNr5XFcKjTs73ZVMezDjwuKbhyl0aqEUKOUy87T8DgBqUUf/8O6QPC/YoR
	QXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5BDEpbcsDf/ZFhn/Rk0SQXrcpJlpyaxnW/cD5UZFJ3c=;
	b=Y57Q245T+UbdmXpDiSgfiN/aE+8Y2dYUWzs1mN992vzrPJhq8K9MnMTrfkFKLd4+s2
	8hVqdMhqoHTEckOrhZIm8ST3yykeMkbBqFJ1PxexAX6uetANv4WMjf6REihPYHUZtuLe
	JWgxUo3a+qjRqV6Buh73ykRFhryfsfI42jeqrRmeLNOLYMvNunO6N8rKTfmOen2cRpW1
	3/7B/85ft6+N4W8ixT53fVX/OZk1mkg3f1hGGlR2Qp2v869EViMhFSZwOIHjiFIvz6Tx
	T1HuqZ/VytkGOulFZEFCdMmwT5TFh4T+MI85rryeTAfCq7l2i5uGCZvlAuDMz2+7ete/
	XXmQ==
X-Gm-Message-State: APjAAAWdpOst+3ZjFuMComU3BNZYvnl5mgYiaQpr9Z+Uj9uNv5DA3mQQ
	kNj+uI7kjHvbLDjxargl2DmPWk9LCys=
X-Google-Smtp-Source: APXvYqxJxjiyTn4cDAePjHCKc3x6FIFVbVxlWgb9xw0uyubTCkHs1WNw28b8qe7RrTvxf+5HGVLM/Q==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr18831839wrr.273.1561980323010;
	Mon, 01 Jul 2019 04:25:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v15sm9414354wrt.25.2019.07.01.04.25.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 04:25:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 12:25:19 +0100
Message-Id: <20190701112519.19576-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] efivar: ensure that target security flags are not used to build native code
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
X-List-Received-Date: Mon, 01 Jul 2019 11:25:23 -0000

Also set LDFLAGS=BUILD_LDFLAGS when compiling makeguids to ensure that any
target compiler flags are not passed to the native compiler.

[ YOCTO #13423 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/efivar/efivar_37.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index c4254c70d91..9b95721a4ec 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -23,7 +23,10 @@ LDFLAGS += "-fuse-ld=bfd"
 
 do_compile_prepend() {
     # Remove when https://github.com/rhboot/efivar/issues/130 is fixed
-    oe_runmake CFLAGS="${BUILD_CFLAGS}" -C src makeguids
+    oe_runmake \
+        CFLAGS="${BUILD_CFLAGS}" \
+        LDFLAGS="${BUILD_LDFLAGS}" \
+        -C src makeguids
 }
 
 do_install() {
-- 
2.11.0


