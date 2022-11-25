Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8757C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:15:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.57027.1669410949546526209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WfMupObz;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so7036430wma.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnBN3sRD94v07KnWEeoAHs2Lxo7sljE7BSDlcTyidGo=;
        b=WfMupObzgw9S+7l5vNcguMoNvQEQgTK7HwVpx7z1laUNRavujjoG0rBn+VRsWXVKOn
         7cvJqSpEj05CbauFHCrzOS9lux0rDqEOJMr5rJr/Xbz+zlqSIqF3E4rUCwOvEdcdtpjG
         kd9vodBtLfs5X0Q10IjQ23OJ5BEbTFpbRoAnJTxgQGTjwueZg8Lf22vP/QoHq+LVFt7n
         Z69s8uhdd5VnorVKs18n64BU97VqDpl84U38bQDJHqynMPZsNNh0XFgHVCmSMLXOqMPS
         rqqtoQrszWN2cU6cb+lwoA7fGllJ0QY7iXJOCXThJdrg/YjA5d1lDR0+1PBCCWbxn5tr
         LAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnBN3sRD94v07KnWEeoAHs2Lxo7sljE7BSDlcTyidGo=;
        b=vsnkZv16Lhnco6o71mBkfZFc8naLXIDnXDh44h0TfAxE6Ki6YSX3vgqIIm+M4T9flU
         T7s+mIFae0Da4gLuVEtGvOwQwp38WZTtce+OB5O9tmSoW0jwq42eMmXXQODHt0K+N7wz
         lzRFAm+ZBDKZMmLTjuqhICtq68fgr+ssb8hLXmZgq5UhOZ9DwQk5mU055yc1B0CxAHjd
         0d6GtwZhTmHeVrRxJ8SmZ/raNd40leEXU+rG9jmQ3+3bvndRPCya8mIDS16GLyU2EzbB
         t1S6pGQdoyb2JzGITCW+9VyQAVB6Mi2hWD7iShkK3hMDsHyPRZ4dKLJvN/uEKr3fmyeE
         MPGQ==
X-Gm-Message-State: ANoB5pnJUBo6z05s/jgJrPetey0Wgctsp1uAQe1ulZ52cqAgmyNKXuEA
	egk+TocUsA234HEahA4HPvwA+Ocdp3U=
X-Google-Smtp-Source: AA0mqf5iQpFmH5XCQDBN5EBC9BG/k+BAnmBKVuI+Xwp6DpKROCluR+a7xuII4q1di4/4+2J0L7VIHA==
X-Received: by 2002:a05:600c:4fcd:b0:3cf:a11a:c775 with SMTP id o13-20020a05600c4fcd00b003cfa11ac775mr19663259wmq.153.1669410947589;
        Fri, 25 Nov 2022 13:15:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b003b4fe03c881sm9929119wmq.48.2022.11.25.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:15:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] gawk: update 5.1.1 -> 5.2.1
Date: Fri, 25 Nov 2022 22:15:41 +0100
Message-Id: <20221125211541.20926-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 21:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173784

Place gawkbug into a separate package, as it includes target information
which causes multilib conflicts.

Adjust ptests so they are correctly executed:
- unset LANG before starting
- do not patch /usr/local/bin into /usr/bin; this is not correct

Runtime fails:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6143/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/6081/steps/12/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gawk/gawk/remove-sensitive-tests.patch    | 35 ++++++++++++++-----
 meta/recipes-extended/gawk/gawk/run-ptest     |  2 +-
 .../gawk/{gawk_5.1.1.bb => gawk_5.2.1.bb}     |  9 +++--
 3 files changed, 35 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.1.1.bb => gawk_5.2.1.bb} (86%)

diff --git a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
index 167c0787ee..ffae55058b 100644
--- a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
+++ b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
@@ -1,24 +1,43 @@
+From 354d24baf7c51977d22ff61ad42e6a2cbd4dc8ac Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 21 Dec 2021 17:09:12 +0000
+Subject: [PATCH] gawk: remove load-sensitive tests
+
 These tests require an unloaded host as otherwise timing sensitive tests can fail
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
---- a/test/Maketests~
-+++ b/test/Maketests
-@@ -2069,7 +2069,2 @@
+---
+ test/Maketests | 10 ----------
+ 1 file changed, 10 deletions(-)
 
+diff --git a/test/Maketests b/test/Maketests
+index 3a667af..f117697 100644
+--- a/test/Maketests
++++ b/test/Maketests
+@@ -2137,11 +2137,6 @@ symtab12:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+ 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
+ 
 -timeout:
 -	@echo $@ $(ZOS_FAIL)
--	@AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
 -	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
 -
  typedregex1:
-@@ -2297,7 +2292,2 @@
+ 	@echo $@
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+@@ -2371,11 +2366,6 @@ rwarray:
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
  	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
+ 
 -time:
 -	@echo $@
--	@AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
+-	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
 -	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
-
+-
+ mpfrbigint:
+ 	@echo $@
+ 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  -M >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
diff --git a/meta/recipes-extended/gawk/gawk/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
index f67a95874f..2675650600 100644
--- a/meta/recipes-extended/gawk/gawk/run-ptest
+++ b/meta/recipes-extended/gawk/gawk/run-ptest
@@ -2,7 +2,7 @@
 
 cd test
 for i in `grep -E "^[a-z0-9_-]*:$" Maketests |awk -F: '{print $1}'`; do
-  #LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} 
+  unset LANG
   srcdir=`pwd` AWKPROG=gawk AWK=gawk CMP=cmp make -f Maketests $i >$i.tmp 2>&1
   if [ -e _$i ]; then
     cat _$i
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
similarity index 86%
rename from meta/recipes-extended/gawk/gawk_5.1.1.bb
rename to meta/recipes-extended/gawk/gawk_5.2.1.bb
index fe339805d0..fbe6e7040b 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -20,13 +20,16 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
+SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
 
 inherit autotools gettext texinfo update-alternatives
 
 FILES:${PN} += "${datadir}/awk"
 FILES:${PN}-dev += "${libdir}/${BPN}/*.la"
 
+PACKAGES =+ "${PN}-gawkbug"
+FILES:${PN}-gawkbug += "${bindir}/gawkbug"
+
 ALTERNATIVE:${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
@@ -34,6 +37,8 @@ ALTERNATIVE_PRIORITY = "100"
 do_install:append() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
+	# Strip non-reproducible build flags (containing build paths)
+	sed -i -e 's|^CC.*|CC=""|g' -e 's|^CFLAGS.*|CFLAGS=""|g' ${D}${bindir}/gawkbug
 }
 
 inherit ptest
@@ -46,7 +51,7 @@ do_install_ptest() {
 	for i in $TESTS Maketests inclib.awk; do
 		cp ${S}/test/$i* ${D}${PTEST_PATH}/test
 	done
-	sed -i -e 's|/usr/local/bin|${bindir}|g' \
+	sed -i \
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 
 	sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests
-- 
2.30.2


