Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE8BC28B22
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18103.1741079371187619553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eZwMCUGV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079372; x=1772615372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JN8t8r680oKOngxUs0sMJYcMattdZJlc6yMBGtDmmGU=;
  b=eZwMCUGVEXlsdB/A7hu7v34WWKGpJcIdr8/VqeyhpVRvPd4w/akCFqoO
   eePSEg+MM/j+X40qpytpBrcIzkQBx5z9b6to0lPtFExmLHVtaDn9qCm1s
   PWtoQOQmuUUgnrACoRbpq6iCo4+JELrCIZYKEuXoChMrcdtSDSm2efvh1
   zErq0xKdY2vbAR70PUrnQP2kG2VLggcmI1qSEgphNpPm0kwLTBS3SV43P
   fTlu9j4R6+QBia0hQClQG351zAztss+ZRYNg5vVN5Es8TbdzQoQlCU/Pn
   hBRZpYaHf5FAVVf4bWCSiulS0sWAJ/z/iAQvGs/7xsnw40vdbVG14eGAy
   Q==;
X-CSE-ConnectionGUID: Wf2csTxfQGeUNoNs8mYxuw==
X-CSE-MsgGUID: BQZmY4rARne3FohrXwvQ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="179242840"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="179242840"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 27004E6142
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DDFAED8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9EC791A0071;
	Tue,  4 Mar 2025 17:09:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/31] python3-bcrypt: upgrade 4.2.1 -> 4.3.0
Date: Tue,  4 Mar 2025 17:09:03 +0800
Message-Id: <1741079356-13445-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212246

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Dropped support for Python 3.7.
- We now support free-threaded Python 3.13.
- We now support PyPy 3.11.
- We now publish wheels for free-threaded Python 3.13, for PyPy 3.11 on manylinux, and for ARMv7l on manylinux.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-bcrypt-crates.inc          | 94 ++++++++++++-------
 ...crypt_4.2.1.bb => python3-bcrypt_4.3.0.bb} |  2 +-
 2 files changed, 59 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.2.1.bb => python3-bcrypt_4.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 576abcd7cb..e0a2926519 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -4,81 +4,103 @@
 SRC_URI += " \
     crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.16.0 \
+    crate://crates.io/bcrypt/0.17.0 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
+    crate://crates.io/bitflags/2.8.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/cpufeatures/0.2.15 \
+    crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/getrandom/0.3.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.164 \
+    crate://crates.io/inout/0.1.4 \
+    crate://crates.io/libc/0.2.170 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
+    crate://crates.io/once_cell/1.20.3 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.9.0 \
-    crate://crates.io/proc-macro2/1.0.89 \
-    crate://crates.io/pyo3/0.23.1 \
-    crate://crates.io/pyo3-build-config/0.23.1 \
-    crate://crates.io/pyo3-ffi/0.23.1 \
-    crate://crates.io/pyo3-macros/0.23.1 \
-    crate://crates.io/pyo3-macros-backend/0.23.1 \
-    crate://crates.io/quote/1.0.37 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/proc-macro2/1.0.93 \
+    crate://crates.io/pyo3/0.23.5 \
+    crate://crates.io/pyo3-build-config/0.23.5 \
+    crate://crates.io/pyo3-ffi/0.23.5 \
+    crate://crates.io/pyo3-macros/0.23.5 \
+    crate://crates.io/pyo3-macros-backend/0.23.5 \
+    crate://crates.io/quote/1.0.38 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.87 \
+    crate://crates.io/syn/2.0.98 \
     crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicode-ident/1.0.13 \
+    crate://crates.io/typenum/1.18.0 \
+    crate://crates.io/unicode-ident/1.0.17 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.13.3+wasi-0.2.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/wit-bindgen-rt/0.33.0 \
     crate://crates.io/zeroize/1.8.1 \
 "
 
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.16.0.sha256sum] = "2b1866ecef4f2d06a0bb77880015fdf2b89e25a1c2e5addacb87e459c86dc67e"
+SRC_URI[bcrypt-0.17.0.sha256sum] = "92758ad6077e4c76a6cadbce5005f666df70d4f13b19976b1a8062eef880040f"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
+SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.15.sha256sum] = "0ca741a962e1b0bff6d724a1a0958b686406e853bb14061f218562e1896f95e6"
+SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[getrandom-0.3.1.sha256sum] = "43a49c392881ce6d5c3b8cb70f98717b7c07aabbdff06687b9030dbfbe2725f8"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.164.sha256sum] = "433bfe06b8c75da9b2e3fbea6e5329ff87748f0b144ef75306e674c3f6f7c13f"
+SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
+SRC_URI[libc-0.2.170.sha256sum] = "875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
+SRC_URI[once_cell-1.20.3.sha256sum] = "945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.9.0.sha256sum] = "cc9c68a3f6da06753e9335d63e27f6b9754dd1920d941135b7ea8224f141adb2"
-SRC_URI[proc-macro2-1.0.89.sha256sum] = "f139b0662de085916d1fb67d2b4169d1addddda1919e696f3252b740b629986e"
-SRC_URI[pyo3-0.23.1.sha256sum] = "7ebb0c0cc0de9678e53be9ccf8a2ab53045e6e3a8be03393ceccc5e7396ccb40"
-SRC_URI[pyo3-build-config-0.23.1.sha256sum] = "80e3ce69c4ec34476534b490e412b871ba03a82e35604c3dfb95fcb6bfb60c09"
-SRC_URI[pyo3-ffi-0.23.1.sha256sum] = "3b09f311c76b36dfd6dd6f7fa6f9f18e7e46a1c937110d283e80b12ba2468a75"
-SRC_URI[pyo3-macros-0.23.1.sha256sum] = "fd4f74086536d1e1deaff99ec0387481fb3325c82e4e48be0e75ab3d3fcb487a"
-SRC_URI[pyo3-macros-backend-0.23.1.sha256sum] = "9e77dfeb76b32bbf069144a5ea0a36176ab59c8db9ce28732d0f06f096bbfbc8"
-SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
+SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
+SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
+SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
+SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
+SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
+SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.87.sha256sum] = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
+SRC_URI[syn-2.0.98.sha256sum] = "36147f1a48ae0ec2b5b3bc5b537d267457555a10dc06f3dbc8cb11ba3006d3b1"
 SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.13.sha256sum] = "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
+SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
+SRC_URI[unicode-ident-1.0.17.sha256sum] = "00e2473a93778eb0bad35909dff6a10d28e63f792f16ed15e404fca9d5eeedbe"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasi-0.13.3+wasi-0.2.2.sha256sum] = "26816d2e1a4a36a2940b96c5296ce403917633dff8f3440e9b236ed6f6bacad2"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[wit-bindgen-rt-0.33.0.sha256sum] = "3268f3d866458b787f390cf61f4bbb563b922d091359f9608842999eaee3943c"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
index 004e8ce8b1..931aae4310 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "6765386e3ab87f569b276988742039baab087b2cdb01e809d74e74503c2faafe"
+SRC_URI[sha256sum] = "3a3fd2204178b6d2adcf09cb4f6426ffef54762577a7c9b54c159008cb288c18"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.43.0


