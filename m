Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E8EC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:12:57 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.36563.1721045569971373127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WxggHZ4j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso602856e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721045567; x=1721650367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLd036pqw8duubktlMbh1mhiay3sZArYvs0o6gwJfTo=;
        b=WxggHZ4jROntyK1GHiU6pplEoIug4LBdPv0viY3Thco9j01QtmY7gDyCv52cIBccsA
         7hmpLTX4J7zizXJ2GFhvihPJDRGoY0TvYAlMFTYVkMvWzOo585K2EqwvFBfCgI0iwjpq
         L3+hysKmhV2mJJ+DLQW7QGvIhcXEIweDqJWkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721045567; x=1721650367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLd036pqw8duubktlMbh1mhiay3sZArYvs0o6gwJfTo=;
        b=MClaR4Wmq1TqNTmiyqC2TPrhzzrUICHPscdTulWf/bC9qps/aOYxdO9fevU/9u2i+v
         jwnQ8ZcKHVvUZrIsiT/wUDmpWIDX+NycRIOZb9Tm+RpZGz8sNPs0IU0vxyDWtaljLUyO
         iQ7PzXNEH6FizP8mBv3EpQBGRfeFhqtMzSXO9XsRK4pwlipmnTS33+359PQ2Tu64fT3F
         uPx+tb1Nkh3fkwBYBhPwc3Ajs/EqX41Kii+1MFppj2GeUpC1iLevJTZbqimSlfAsUkye
         zCA5pPEGqY/EYnc3Lc51aFSKOpLScZde7UnuC205l4AcjxPyEAkK3FcR/F9bGsRgO+D2
         AXCQ==
X-Gm-Message-State: AOJu0YxTUPaPZ9QyJT+vJ5vxXhCIcOCy8FaAz0a3sDOECOJcgis1XA3F
	NfAN/AqRHvpuRGplpabbgB8d20gzvQ85IvwuFamXbP/CPMxatmiyCwchicsAFw5RbcP0Nvljt4O
	Z
X-Google-Smtp-Source: AGHT+IFGjC0iEJ7dg8eMlhKHJbtSkRlaHxI4CTvp/0kK9KOiWFdWbBpByLTctOBNFZ2LEaEqBWTNuA==
X-Received: by 2002:a05:6512:31d2:b0:52c:d819:517e with SMTP id 2adb3069b0e04-52eb99a0e9fmr15809955e87.30.1721045567382;
        Mon, 15 Jul 2024 05:12:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b820:e15f:2b8d:2478])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf0d7sm6235991f8f.27.2024.07.15.05.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:12:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/fortran-helloworld: Fix buildpaths error
Date: Mon, 15 Jul 2024 13:12:46 +0100
Message-ID: <20240715121246.2788139-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201917

There is a buildpaths QA error in the test recipe that somehow didn't show up
in earlier testing. Use a source directory and tweak the build command to
avoid embedding build paths in the generated binary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/fortran/fortran-helloworld.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
index a8979666084..11928dc95a9 100644
--- a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -6,12 +6,15 @@ DEPENDS = "libgfortran"
 
 SRC_URI = "file://hello.f95"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 # These set flags that Fortran doesn't support
 SECURITY_CFLAGS = ""
 SECURITY_LDFLAGS = ""
 
 do_compile() {
-	${FC} ${LDFLAGS} ${UNPACKDIR}/hello.f95 -o ${B}/fortran-hello
+	${FC} ${LDFLAGS} hello.f95 -o ${B}/fortran-hello
 }
 
 do_install() {

