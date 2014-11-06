Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94E08717DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6Fd3IK019034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:03 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:02 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:12 +0800
Message-ID: <5265130ee6ea01a4e0419395cf8d29afbcc4bb04.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 09/25] libpng: add neon option for aarch64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:03 -0000
Content-Type: text/plain

Add neon option for aarch64 just as for arm. It fails with:

| ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_neon'
| collect2: error: ld returned 1 exit status

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
index 0c6fd1f..3d32bfe 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
@@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
 EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+EXTRA_OECONF_append_aarch64 = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
 PACKAGES =+ "${PN}-tools"
 
-- 
1.9.1


