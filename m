Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D365ECD343A
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 14:09:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.24184.1725372589985383733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 07:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C0U0hy71;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so35477715e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725372588; x=1725977388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8h/w+ab/u+xdn8YcQ5yMMpgO+54oa8i4F/9dp+zd7S0=;
        b=C0U0hy71cpTiKhC4KkHeSK7Bl0CDHnotjgZQgiQB7Y2CDYA/N0Qs60UQXtnFiMImuX
         jGVhVE/HVCJWPzk2zAPUVIoGYkzVzvHN/0lVntERaeU7cYNV16zEqAddwvzEQjDq0K1F
         D3J1fCtWLEYfXETnA/hWBvS7zMfnUEIjUHRqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372588; x=1725977388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8h/w+ab/u+xdn8YcQ5yMMpgO+54oa8i4F/9dp+zd7S0=;
        b=hWPczMf4ACnlzEAvXQWvU1bBEnz8I42khc8RRs19AVlAP7cr4Wv9gzxOJK2k3Vjkgq
         9b4Jct63BR0X4RdSeq6UzR7wyNG/WyGZaAcODeCk1xsUNLuxpTfETIOwFnMMy2FKHYsB
         u24VZpuJ7NuWregB+xlbl8pDfSvvbq/KC6vpNRk+C6hsNifYJPbP2mtjNoG+XwDwvPWt
         PMmXMqR/THpTVAqvy2+ZcZlfUw2EmKvv/TpwtoswMkP3eGnat/C2XEUC0RQ6S3LqPcZd
         41GMPqsaVA/4qEkn3bCR/udFmHAyCxup2X4It47u1TfcepYtvNwasxbnGhgOMPJWeDek
         F6uQ==
X-Gm-Message-State: AOJu0Yx9o86JRSC77h6bSZ8jIkHLNVAcCthCcGuD1dCvHnUNhmcYTbZZ
	GElWwlABr+zTGp9FJN020OMqhycKK0gqj8P8umnFRJPQsDJIkRU7vkbXMQY2gWgPKfJm7T1qxLa
	2
X-Google-Smtp-Source: AGHT+IFEAvRmBqwYvcBpMQZMzblsyb6sUL0K6FoDWyj8DLcrdyhqRfdW+J4Yv3jxn/Xp9I2YlXp9Pw==
X-Received: by 2002:adf:ab18:0:b0:374:b69f:8 with SMTP id ffacd0b85a97d-376dd71aademr767808f8f.33.1725372588009;
        Tue, 03 Sep 2024 07:09:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:30b4:4276:8ea7:8aff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c96a88ebsm6437970f8f.108.2024.09.03.07.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:09:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] elfutils: Drop obsolete ptest conditional in do_install
Date: Tue,  3 Sep 2024 15:09:45 +0100
Message-ID: <20240903140945.625408-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903140945.625408-1-richard.purdie@linuxfoundation.org>
References: <20240903140945.625408-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 14:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204166

The PTEST_ENABLED conditional is no longer needed since the task is deleted
if ptest isn't enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils_0.191.bb                | 70 +++++++++----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 76bd2b3a99c..95364cef975 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -66,42 +66,40 @@ do_compile_ptest() {
 PTEST_PARALLEL_MAKE = ""
 
 do_install_ptest() {
-	if [ ${PTEST_ENABLED} = "1" ]; then
-		# copy the files which needed by the cases
-		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
-		install -d -m 755                       ${D}${PTEST_PATH}/src
-		install -d -m 755                       ${D}${PTEST_PATH}/lib
-		install -d -m 755                       ${D}${PTEST_PATH}/libelf
-		install -d -m 755                       ${D}${PTEST_PATH}/libdw
-		install -d -m 755                       ${D}${PTEST_PATH}/libdwfl
-		install -d -m 755                       ${D}${PTEST_PATH}/libdwelf
-		install -d -m 755                       ${D}${PTEST_PATH}/libasm
-		install -d -m 755                       ${D}${PTEST_PATH}/libcpu
-		install -d -m 755                       ${D}${PTEST_PATH}/libebl
-		for test_file in ${TEST_FILES}; do
-			if [ -f ${B}/src/${test_file} ]; then
-				cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
-			fi
-		done
-		cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
-		cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so
-		cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
-		cp ${B}/libcpu/libcpu.a ${D}${PTEST_PATH}/libcpu/
-		cp ${B}/libebl/libebl.a ${D}${PTEST_PATH}/libebl/
-		cp ${B}/lib/libeu.a ${D}${PTEST_PATH}/lib/
-		cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
-		cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
-		cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
-		cp ${S}/libdwelf/*.h           ${D}${PTEST_PATH}/libdwelf/
-		cp ${S}/libasm/*.h             ${D}${PTEST_PATH}/libasm/
-		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
-		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
-		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
-		cp -r ${B}/backends                     ${D}${PTEST_PATH}
-		cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
-		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
-		find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
-	fi
+	# copy the files which needed by the cases
+	TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
+	install -d -m 755                       ${D}${PTEST_PATH}/src
+	install -d -m 755                       ${D}${PTEST_PATH}/lib
+	install -d -m 755                       ${D}${PTEST_PATH}/libelf
+	install -d -m 755                       ${D}${PTEST_PATH}/libdw
+	install -d -m 755                       ${D}${PTEST_PATH}/libdwfl
+	install -d -m 755                       ${D}${PTEST_PATH}/libdwelf
+	install -d -m 755                       ${D}${PTEST_PATH}/libasm
+	install -d -m 755                       ${D}${PTEST_PATH}/libcpu
+	install -d -m 755                       ${D}${PTEST_PATH}/libebl
+	for test_file in ${TEST_FILES}; do
+		if [ -f ${B}/src/${test_file} ]; then
+			cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
+		fi
+	done
+	cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
+	cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so
+	cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
+	cp ${B}/libcpu/libcpu.a ${D}${PTEST_PATH}/libcpu/
+	cp ${B}/libebl/libebl.a ${D}${PTEST_PATH}/libebl/
+	cp ${B}/lib/libeu.a ${D}${PTEST_PATH}/lib/
+	cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
+	cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
+	cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
+	cp ${S}/libdwelf/*.h           ${D}${PTEST_PATH}/libdwelf/
+	cp ${S}/libasm/*.h             ${D}${PTEST_PATH}/libasm/
+	cp -r ${S}/tests/                       ${D}${PTEST_PATH}
+	cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
+	cp -r ${B}/config.h                     ${D}${PTEST_PATH}
+	cp -r ${B}/backends                     ${D}${PTEST_PATH}
+	cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
+	sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
+	find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
 }
 
 EXTRA_OEMAKE:class-native = ""

