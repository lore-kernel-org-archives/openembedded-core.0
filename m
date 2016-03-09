Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54A70605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 11:18:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u29BIn52006004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 03:18:49 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 03:18:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 9 Mar 2016 06:18:45 -0500
Message-ID: <d32227aaa1bf8acd225f695857056f1b5dc77efc.1457522031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457522031.git.hongxu.jia@windriver.com>
References: <cover.1457522031.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tune-ppce500v2.inc: explicitly set gcc float
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
X-List-Received-Date: Wed, 09 Mar 2016 11:18:50 -0000
Content-Type: text/plain

For powerpc*-*-*spe*, default to with_cpu=8548 if --enable-e500-double,
and to 8540 otherwise.
vim gcc/config.gcc
...
    powerpc*-*-*spe*)
      if test x$enable_e500_double = xyes; then
         with_cpu=8548
      else
         with_cpu=8540
      fi
      ;;
...

The with_cpu is used for SPE version detection
vim ./gcc/config/rs6000/t-linux
...
  7 ifneq (,$(findstring spe,$(target)))
  8 MULTIARCH_DIRNAME := powerpc-linux-gnuspe$(if $(findstring 8548,$(with_cpu)),,v1)
  9 else
 10 MULTIARCH_DIRNAME := powerpc-linux-gnu
...

The variable MULTIARCH_DIRNAME is the output of '$CC --print-multiarch'.
Without this patch, the output is 'powerpc-linux-gnuspev1' which caused
python3 do_configure failed.

Since ppce500v2 -mcpu is 8548, explicitly add --enable-e500-double could fix
the issue.

[YOCTO #9226]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/machine/include/tune-ppce500v2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 20a5f25..70d3078 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -18,3 +18,7 @@ AVAILTUNES += "ppce500v2"
 TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
 TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "ppce500v2"
+
+# For powerpc*-*-*spe*, default to with_cpu=8548 if
+# --enable-e500-double, and to 8540 otherwise.
+EXTRA_OECONF_GCC_FLOAT += "${@get_gcc_float_setting(bb, d)}"
-- 
1.9.1


