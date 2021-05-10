Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.32697.1620657056215714597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JE4UVtTl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso14609881ote.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zqBAp7HIV0Tg6IbypXpVEMfD2Cz75fpChebJAMuKWc8=;
        b=JE4UVtTlKjBx0FD+Oo079JKofLUWPqa90fFssGY52QkJyq55aVPzbOfz2W3EJLXzO4
         QdGZsqEGMeFHZZY/NcCqCQedIxWEpMto8xrvbTrahvpcLo5grJFm2wKn7lBkEyckbRNL
         IsOx6N1aIKpqtwFA9/6rfvrqrn+QRIcbXF0PI53mTtpNu0CbwWjhGF6sPgAFK7+WqCfw
         1L2y1OdcBD7n0rMHfPHs8Daop5ZjoFgJgucJpqEtNm6343+FWRR90NBsOXvGgr6C72mU
         lHg3M3EL/na+LSPUJnCfIR1/AxBxIN5iO7vzPv2Bzv296cHsOhrNcQSBr8Uwm6PTW3xp
         46/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zqBAp7HIV0Tg6IbypXpVEMfD2Cz75fpChebJAMuKWc8=;
        b=MQVEVjjCxPh3TVHJw00N3rfDjHXjsCUw/Mn1EurUEfFjq0IeHLAZ2IJweLeAXme84U
         6pDG5cKQEmRtHf/4DWjolIkByJIR8LIkXw01hvGnTJnTLOmXfPTi7JpOpWYfGF3M0VEt
         b+Z2bz7jY+AeFV44fSva8U8k+czDTi9uN91oZeo+5FrkJvoOGesYtm3S+lds73OI707m
         iSdMxWg9Dmuolw37UF/QFKHXzVSbFRvY6yOzxfGm14JtxGKIgRMP50JdoeD4WjIiA4S0
         LqSLgCudiqpjM9zjplIHswRjOnPj1bLZacgm07UdIPrPve0ouD3QJOZVdqWJp9IBJTyG
         G3pQ==
X-Gm-Message-State: AOAM531QqaA/BcZWDSfGJHsYU7ML55pHV3DN7ivYMKsslqJh20CyrBsD
	lsMjrLRSVuqviEzuSaJpulwGIWVa698ZnngLsM8=
X-Google-Smtp-Source: ABdhPJzxWj+4lTj5IrN5THRdElHOz1Sj0R/blGwvB1TJyEJAWgHWtgEigOSNJS4R5mrj5a1OWnW4cA==
X-Received: by 2002:a05:6830:1d5c:: with SMTP id p28mr17034974oth.280.1620657052151;
        Mon, 10 May 2021 07:30:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/25] perf: fix python-audit RDEPENDS
Date: Mon, 10 May 2021 04:28:55 -1000
Message-Id: <489541edb82b0d3de68f60b38e7465b2f5511ec0.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When doing the perf python3 conversion, the audit-python RDEPENDS
was caught up in the regex replacement and was incorrectly changed.

The audit recipe continues to produce a package called audit-python
and it is that package we should have as a RDEPENDS.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7eccb9c0c2ea00685451c44cb8faa96c4a2272fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 578b871e9e..b6f50583f7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -265,7 +265,7 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
+RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python3"
 
-- 
2.25.1

