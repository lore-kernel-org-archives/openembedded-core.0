Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108E9C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 06:19:03 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144439.1783318734166061373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 23:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Mk7TPJ7J;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso3196026a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 23:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783318733; x=1783923533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqpmGzCPgRnxLxc7lUUyDDDmBQiNWasAeloRVLYTqZI=;
        b=Mk7TPJ7J6wnHKJ4lOWvKJAj0phfH6acWkKURHb5gUZrhebAJ5gPy3R9CzdsnGJqA6G
         JpvCAetkgMvrbmFrqJiac1snInGOSIARdgwh5IH1uwpCMX5RGuNPz56I41l//ZN9M/su
         O6nw+lzSOpi59k14u8mbuicEESpVyEEwvrDys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783318733; x=1783923533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqpmGzCPgRnxLxc7lUUyDDDmBQiNWasAeloRVLYTqZI=;
        b=W2MPQlFCSgSnN+db21KZwPi8f0iVcGZHAHd8AiBLJ8MkNc+I5qmvGsoMdkXQhC0YuR
         mJ5qUT+n7aNRj6Np4Glblve0tey6xe1T1dHeDOoBYn9KNuDRP2SaJkLv7fN0afq4O2ve
         aiDbFGjJUzEpbsn35WORMw4ck+eo/a5PEo51TTOubXLpkpyP+aEiycu08tW3fYtVgfct
         hj51/shVG1kiK0nMtCm2As1oWtnWvkcSNI47jEJgl+vXhRdG+ziYb6kNkLsQ8/yBE64r
         JpoIGWO0Y/wXITVcbc8F7AONv02hnSGU9DKJSHEQAYgqHiqTrgrDOL/zhSPsVi7HqZnI
         Pzyw==
X-Gm-Message-State: AOJu0Yy61WjqA+PJTPCDKOYLUaIR8/4DPhKNJBnqXzd+Mn4PgSlAs5W2
	HvDTpiABbn42j4wopEdJF2U4SFwxYFoAAFftPqGm2hzaJ/WbdhLUES/b8mlxZxW8kR8eXZ28iVc
	MmmvUlVI=
X-Gm-Gg: AfdE7clU0yUtO73dRTxxKRI+vQzTJJ5jOYfg4i0GnR+bDnOLIP2FnzSoP2DcCodwvTH
	LtPFZ20gGy3oS67m8cFIZVwSQrHcFBE/a38hUSOnr7ym5hKOrzLpSCpP5s9B6aeagU2ZmfzfTBO
	9ZY9XyPmmN9thDIAWqsX4I/GGMVyqAOV5gyjrkvNn0LgX1nn6t6sgP0vhtnlo90unN3qJU1DSNb
	UZ0Ae1ec8WrL5Jz9z27+f0GoRF0L3VUsaBuhxiUgb1CDlD0cBYhpJWy7hNprO6GgnhVNb3aipHf
	6IL1RPI3e0LgpaytnYPE2LeQx/F0bTUiAm8SjqDUrl3PYbefy4qPFKCQvNv+uQcg2aCh01iafgF
	99bjcCY0CuguXSv6mCjresCQEJO1YzqnIdfL+mhLsp3aJqBrjvmV8uOjrztbGZyoKRHLJeU8p41
	0Hn2X2iwCh4+2gAz885m+35Xa3uH9nFeBQ
X-Received: by 2002:a17:90b:5824:b0:37f:9ce1:cda6 with SMTP id 98e67ed59e1d1-3829f7e68ddmr9881901a91.28.1783318733487;
        Sun, 05 Jul 2026 23:18:53 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm18293347eec.15.2026.07.05.23.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:18:53 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] libarchive: upgrade 3.8.7 -> 3.8.8
Date: Mon,  6 Jul 2026 11:46:43 +0530
Message-Id: <20260706061643.24199-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 06:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240213

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed:
CVE-2026-14164
CVE-2026-5745

For full comparison of changes, see the link below:
[1] https://github.com/libarchive/libarchive/compare/v3.8.7...v3.8.8
[2] https://github.com/libarchive/libarchive/releases/tag/v3.8.8

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libarchive/{libarchive_3.8.7.bb => libarchive_3.8.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.7.bb => libarchive_3.8.8.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.8.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.7.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.8.bb
index e8c3a3bfe3..2c8bf922a6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.8.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "4b787cca6697a95c7725e45293c973c208cbdc71ae2279f30ef09f52472b9166"
+SRC_URI[sha256sum] = "038918ea315cdd446cc63acfe880d6011832bbe1711c887de5de5441b306c190"
 
 inherit autotools update-alternatives pkgconfig ptest
 
-- 
2.34.1


