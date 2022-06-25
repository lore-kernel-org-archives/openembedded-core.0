Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE5C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 20:13:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.23506.1656188019346159864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 13:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TUr/3WH2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id m184so3088461wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaMSqH81mMe4H8Iaqn8Oviw3efwdiyJ95wVYsjcz/gk=;
        b=TUr/3WH2RNi7q2rnNwpodDPBVUyDi7/H4KnPTHS/H6AkKV/CwR3zCk0Z+VYO2nHguQ
         04Ab7hHhPVMYlmNtzRCNgWjrlo3vPwQ5i+FGi4IS4okYObO+031URzieaHk1VR+c+VtM
         zzK93QOXkbl4vcZLSHtnwQJVad1QBJ7OE4d70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaMSqH81mMe4H8Iaqn8Oviw3efwdiyJ95wVYsjcz/gk=;
        b=mAj3cBjS/vQCHd2f2Slm57GJAFRch6ffLhhd44Af+zcy15R9thiD98u15QFcI80hMP
         gsFuphlzc9qwe32pRKR6MZbrqkvbiEDIqmvDGIeDSYST5xWiW2fc12RjKOtqpX322UNG
         93SHLKt7QmM/jpzB1ou7zzBKTNTMZqmDkKiI/im0X9ObOkktLFziPGrSWobeJPChf7eF
         nuiek2ZIjG9Y3UptgQ7GRLGzgIaZ+mVtnaltF8sOfjLg+RAzqOGcMhYHoue+cl8dX3TE
         8obbO1McaO4HkH13bA/Gs33FWoD2KPtlXk1pU7u05PimfvWsav3T4eS1VWZQYZFdOzwt
         63Ig==
X-Gm-Message-State: AJIora+sz8L4Gh1Ef1EZkOEkKHZOhXY13+gVpeO01y5OhWKffBYRZKgx
	QECngtJ1K4/1vvgykHMuWoNGo+RarQIL6A==
X-Google-Smtp-Source: 
 AGRyM1sIyRiDzOM0MOFBBzUyYJVaY8bxB+G7UxSgzKDzBLrgsQme4rVQiLSPMZx34F7F8/UpBKuoiw==
X-Received: by 2002:a05:600c:646:b0:397:77ab:5eb7 with SMTP id
 p6-20020a05600c064600b0039777ab5eb7mr6205041wmm.166.1656188017092;
        Sat, 25 Jun 2022 13:13:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 k19-20020a7bc413000000b003a02b135747sm7289607wmi.46.2022.06.25.13.13.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 13:13:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] elfutils/flex: Disable parallel make ptest compile
Date: Sat, 25 Jun 2022 21:13:35 +0100
Message-Id: <20220625201335.317473-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jun 2022 20:13:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167298

The recent change enabling parallel make for ptest compile/install caused
autobuilder failures in these two recipes. Disable parallel make here
for now until someone can debug the race and get it fixed (preferably
upstream).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.187.bb | 1 +
 meta/recipes-devtools/flex/flex_2.6.4.bb         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
index 31983dfd6ba..d03da613539 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.187.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
@@ -56,6 +56,7 @@ do_compile_ptest() {
 	cd ${B}/tests
 	oe_runmake buildtest-TESTS oecheck
 }
+PTEST_PARALLEL_MAKE = ""
 
 do_install_ptest() {
 	if [ ${PTEST_ENABLED} = "1" ]; then
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index c7cd9653470..8736b3585e0 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -60,6 +60,7 @@ RDEPENDS:${PN}-ptest += "bash gawk make"
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=${B} INCLUDES=-I${S}/src buildtests
 }
+PTEST_PARALLEL_MAKE = ""
 
 do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/build-aux/
-- 
2.34.1


