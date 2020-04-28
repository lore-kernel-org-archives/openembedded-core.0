Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3778.1588064772341884793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 02:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03S96ASp006680
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 02:06:11 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 02:05:58 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] icu: disable do_make_icudata parallel build
Date: Tue, 28 Apr 2020 17:05:56 +0800
Message-ID: <20200428090556.9828-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Since commit [icu: Add knobs to generate a subset of ICU data][1]applied,
It caused Segmentation fault while executing genrb to generate *.res files
...
|1473 LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH
../bin/genrb -s ./misc -d ./out/build/icudt66l -i ./out/build/icudt66l
-k -q pluralRanges.txt
...
|1577 make[1]: *** [../data/rules.mk:732: out/build/icudt66l/pluralRanges.res]
Segmentation fault (core dumped)
|1578 make[1]: *** Waiting for unfinished jobs....
...

Follow Khem Raj's suggestion [2], disable do_make_icudata parallel build
and see if it makes help.

[1] https://git.openembedded.org/openembedded-core/commit/?id=5e5be67744d7ddf5a9ac433ecba02f697a84a325
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13869

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/icu/icu_66.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index f2bb344e33..86afef3f04 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -55,7 +55,7 @@ do_make_icudata_class-target () {
     LDFLAGS='${BUILD_LDFLAGS}' \
     ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
     ./runConfigureICU Linux --with-data-packaging=archive
-    oe_runmake ${PARALLEL_MAKE}
+    oe_runmake
     install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
 }
 
-- 
2.18.2

