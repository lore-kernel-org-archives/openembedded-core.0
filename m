Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 870DF6086F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 05:21:07 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 6-v6so1101904plb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 22:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=S0y8Mx1xBHJ59WzlYlL0CgtKI/us7ulRR782mKfzisg=;
	b=ibXIINmGn+eur7Gk4qUR7EC2aD9a6oQTM6zuuadohD4Q61VWn5wTcgIXa85HruRsUX
	j30yIFRqL929SQpUaexeMRVnQwM6SRrluf78chqWOb9WFuOSHaPulMJQLlwcndlWDmQA
	2ZskwrnnNVSE+LwVYBYOO5bTZ67awir1NeZLj1FBW/zESTa8bsW43JpNdxwyjb3KEPE2
	j7wXEZX25nNGKLCO7MMaG/9bFawSISNFl1ETASbrlTJexaczPvF7dsxX5uQTgcgIyecp
	Rom7ZcdAicvkzZi33AVB+tnXLgIV2zQA20NPY4Z9T6o3tTGbEyMUwH1+XK0N1VZD7gVr
	q0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S0y8Mx1xBHJ59WzlYlL0CgtKI/us7ulRR782mKfzisg=;
	b=n4jCVR+iEFD09aYzL6zS/DJOlzWhBu2fSkrHThkdAE+u02EDtC3h6o8c+0ZoqoTUDf
	z3BEoMNw8i4aBRBV+8eFtgOOtJB/TILOfBSSrMe8sZJdqGi0p8+NVHc0GihGC219tCJK
	cc6uay4swCdbyG65bEsUpG2bXVebzyRqRI2b5qTlBqlDSFYvh8OCEqC+QhGkLEzVPX2l
	wsF3GbM/WVdj8XatpWB9D/VXD+KLX6ReBGggddSJ7cLsJJCBQuTyCY3dcPBON85CS2DB
	nY79gATUQNbZxZyDiG36Rv7CbXls6VJhxy5QW+tIZL/1X9eN9AN0hRyadqr+GEGmvK27
	3cDQ==
X-Gm-Message-State: APt69E34V2ozyQD65dkZr5OtMAnoYM8G2rjLoTnlo5D5FI5QHbmMrzo8
	ttCT8734Mp6FrwTzw7KYVyMbUA==
X-Google-Smtp-Source: ADUXVKJE0ccrjSngSknymzMibUDRGQMxy/JKNyCRDplZeedVE9GJPLbh5T8aouHow2Q5pFLPGOsKiw==
X-Received: by 2002:a17:902:778e:: with SMTP id
	o14-v6mr21795024pll.214.1529472068218; 
	Tue, 19 Jun 2018 22:21:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	j127-v6sm1317656pgc.10.2018.06.19.22.21.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 22:21:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 22:21:06 -0700
Message-Id: <20180620052106.22306-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gcc-target: Enable fp arch extention when fpu is available
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
X-List-Received-Date: Wed, 20 Jun 2018 05:21:07 -0000

This is especially needed when defaulting to hard-float ABI
Fixes errors e.g.
cc1: error: -mfloat-abi=hard: selected processor lacks an FPU

Fixes [YOCTO #12795]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 56e4b95af4..92cad28b7a 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -14,9 +14,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 # specific). For example, for ARM, ARMv6+ adds atomic instructions that may
 # affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
 # target to always be passed -march etc, its built-in default needs to be safe.
-EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
-EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
+EXTRA_OECONF_append_armv6 = " --with-arch=armv6${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.17.1


