Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF3C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 15:10:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.17518.1658675425601222968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 08:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8bOf4zC;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 bk6-20020a17090b080600b001f2138a2a7bso9559143pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFjselkRJAysS2B1lUvByCjcUBCoMRrYZGVcwUX0kpA=;
        b=n8bOf4zC6EtS76++TU5s7dRFWYFBgdS3bItA1Fp9RYZL4d7mniw391j+HosUrIQWec
         UooBsUDVcj24bmgap0tBoIGwH8gqQErScVA+O4Wfk5q4wksX0pSTQK8yBB1CfVhSUy3s
         0DMswojiK5PLXmE7lqeD+GSkSUm0piRCd02sO6ZgTC+DkRq7xj4jnVKlu/f07yqDohqC
         iRB4+JnXMEOe9/APQEwBiM3Qc78Zk/ZvYtXMCldraitSZ1xWYMBrBUo55OzX65huZVFj
         GY8pqxW2QV/C+uO+BLm2hHPf/ijg7kJnUHmI9Dp8Wf0TKRcWAQli+FBWSsID5VoI+ggs
         59ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFjselkRJAysS2B1lUvByCjcUBCoMRrYZGVcwUX0kpA=;
        b=XMA/Tel8A4D1fOuAfHKBL/8VWK0ld8fFSH8KUpdYGidDiqIVS1DTLSpktTrzKhpz+H
         SnqxDXvjz7sWZYNWtnqialPFHk0tl8CKSCS5TPHyNPgWLZwEMbUIYXxm9Nfq9lk1xS5j
         xSsqP0afhvTndRMLSAkLYhu4S5NfV1jOKgEUWvRWRDmh9W0JPPDifdAKpqQyP8U1QJ2J
         oHtODvlYCaHXbE5KJi+k1eNsjsbbsLCr7aOMeYB7brZkZ+xpuSvsfCpP+MbZlo1NhUub
         sH46+eqgt97VNHbFiPiwxmaviZDmhUTttTmcsKI9wncXUupAcyEr2slyejMroFP36JQh
         l4Xw==
X-Gm-Message-State: AJIora8X4HDlqPhfC1OWxUfn4FYRBU24XA+Xn4oInCzaFKgFHjxB/dUt
	l6rGuXS/2UhaN2sWbGoF2kdloj00WU6rXA==
X-Google-Smtp-Source: 
 AGRyM1uCmGxr4M+uTPUoyu1kQx928HzJRJ+1nR0VaCYlmpyEiQGtv8Ic/cRLAys+y6BkwoxUIBfWkg==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id
 m16-20020a170902f65000b0015f3a10a020mr8544986plg.61.1658675424527;
        Sun, 24 Jul 2022 08:10:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 r7-20020aa79ec7000000b0052b4f4c6a9csm7588342pfq.25.2022.07.24.08.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 08:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc-runtime: Use static dummy libstdc++
Date: Sun, 24 Jul 2022 08:10:21 -0700
Message-Id: <20220724151021.3396652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 15:10:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168458

some standalone targets e.g. riscv64-elf disable shared linking for
baremetal ELF ABI in ld, therefore lets make it a static library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use ar to create usable .a file

 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 3e1c799ba13..c88954bef84 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
+	${CC} -x c /dev/null -c -o ${WORKDIR}/dummylib/dummylib.o
+	${AR} rcs ${WORKDIR}/dummylib/libstdc++.a ${WORKDIR}/dummylib/dummylib.o
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.37.1


