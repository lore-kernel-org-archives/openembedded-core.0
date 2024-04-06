Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2114C67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 17:10:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.37224.1712423452586497162
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 10:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWJoMm/b;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so1707725b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712423452; x=1713028252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0rphsaQ3qQl2161RdMJOf+4ZpnoVxZP7Y3yhKTKh40=;
        b=nWJoMm/b6CAYYcYJqQHFBz4Ll2d6HMJbowq7AUVidFOXbxa5mh5i6sY+jdLGOTK0jx
         fh1VTDI1LwGDgjt3aFhMHdQf5WqKcZqUivyPtJbfgD2QJerFaJ+AzUMVlzwAO/j5R9ZP
         M6SNsDkZXpuOJVHWH+3wQshaOUFaGR/YnFsU1EmDrVqXgG5JWWXoeNwgFHNXaky08DMG
         WJxOAGhA+ahMlqPEm9SuTAD0qa66gQ5YrBd0ymmlh2mwh0m1PljYaAP5zmuPCBaSPoEh
         1ShJSDtVfXEbIrWilDx+2DEHj7ydX0gGQejSKbdU9/ArCTgFOxpIssrgJ1wjHCzvjoe4
         0lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712423452; x=1713028252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0rphsaQ3qQl2161RdMJOf+4ZpnoVxZP7Y3yhKTKh40=;
        b=BsNvq6oSGy2zq5/eothXd3PHAZZFe+5sBwzXvQZxP2o3Zyn/+LyGZMxqTJZeCdJbYQ
         JJdFLuN0Q5U4RbMtX6DtIE1MTp8z2ZqP0wAHIJz31mAyMVxYZGVbh6Sr8K4Tr86PsEw+
         jpuc/nOjSkgtlZWnJK1SvzF1V6B9RgxfZ7+nYrOX9r13tEdBHSit7Ze8qqQU0lgtcVjK
         IYRs3Lx1JWRchvKD8/BgKkN2adxTUefSaQh6Ou5dvLE5ps6oY4JJG9Gw9ylXxpEFO0ss
         vb64UOhzNNnvsDKCTDwTyDxVNH1r+BuxzECpTVif3RtFGolWz/UdAFA88c+GClFmQO14
         uw1Q==
X-Gm-Message-State: AOJu0YyaCeB7X/HppFhVAU6EzHNlbIHxq08UxPi14Qojqlfq3dHuGZxm
	q7aFKDrm16qofCTCZVABGSoO7OJ/wRlzpo5yZTJPaDmbdqnEXROdGoCQ1Zwo
X-Google-Smtp-Source: AGHT+IF8h1VDRGRtud2ZWiH7G9ZpTa+wWIkUXWB9FLeiZSMIdC0Ymuh+Yy19YVkSLFuVbkC3GPUqfQ==
X-Received: by 2002:a05:6a00:a13:b0:6e6:fb9a:fb45 with SMTP id p19-20020a056a000a1300b006e6fb9afb45mr6028697pfh.1.1712423451573;
        Sat, 06 Apr 2024 10:10:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::84f])
        by smtp.gmail.com with ESMTPSA id b187-20020a62cfc4000000b006e6b7124b33sm3533425pfg.209.2024.04.06.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 10:10:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libseccomp: Fix build when python packageconfig is enabled
Date: Sat,  6 Apr 2024 10:10:47 -0700
Message-ID: <20240406171047.1527823-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240406171047.1527823-1-raj.khem@gmail.com>
References: <20240406171047.1527823-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 17:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197995

It needs additional tweaks with python enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
index 06ba5e9c98e..478e5f4289e 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
@@ -17,10 +17,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest features_check
 
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+
 REQUIRED_DISTRO_FEATURES = "seccomp"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
+PACKAGECONFIG[python] = "--enable-python, --disable-python, python3-cython-native"
 
 DISABLE_STATIC = ""
 
@@ -48,9 +50,13 @@ do_install_ptest() {
     for file in $(find tools/.libs/* -executable -type f); do
         install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
     done
+     # fix python shebang
+     sed -i -e 's@cmd /usr/bin/env python @cmd /usr/bin/env python3 @' ${D}/${PTEST_PATH}/tests/regression
+     sed -i -e 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@' ${D}/${PTEST_PATH}/tests/*.py
 }
 
-FILES:${PN} = "${bindir} ${libdir}/${BPN}.so*"
+FILES:${PN} = "${bindir} ${libdir}/${BPN}.so* ${PYTHON_SITEPACKAGES_DIR}/"
 FILES:${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
 
+RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3', '', d)}"
 RDEPENDS:${PN}-ptest = "coreutils bash"
-- 
2.44.0


