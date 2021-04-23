Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.10191.1619186408737542182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sn3pV9cA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id g1-20020a17090adac1b0290150d07f9402so1223530pjx.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k4PgJ5FFzBUEUj1t9r/Wmczefi6PiA4IEi9uvN/WGAY=;
        b=sn3pV9cAWTqrmotZ66E9Banemz6to5n76XcbO+3w3wjfX3AM21+d5ddLs5JGYpL/E/
         eFTyIN5MH79krtBGV5DsN7j4PNVDniFRrOfF+ihM9xHSt46q6rODfVAsk/njO5EfD30y
         ayYLkK8Qq5IujCSEFtrdzbtBI8K9dGu68Pq+v9lQ8HSzfOYwK8Ai/RYlbGJC44g0fGRH
         8ZbRo6B3TE3uRb9YMSz06KsjHfODc2oDCB5TDNN2fWKuaYxkn1TekENCAhvX9PskKYrG
         ySFv/E5l6B3D4iTwpVtUT2+S1kmQ6GLU+75j13T8J0OHKKT8t9Qwb71vwErIkX1GGZp2
         xqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4PgJ5FFzBUEUj1t9r/Wmczefi6PiA4IEi9uvN/WGAY=;
        b=q/F66fRfuThlZ8JEuAAyQQFmW9qzVLFg3//EZnpBH7tiAPbxmPmNQATkKQ8SH1h3S6
         KmDnEbu/KMeJkCbRWe6DSoINDQzA9PIHvWlgST3EvEjJB29nf8pcIS6dl67lExDydVGy
         KHwzPiZ/CabG8nsvm+IKt9GJhj+agaaHQrT4UCtLcjtFiKESKaEqBCWf2NMjqTHTdJu2
         df4BEW7RhyqlfQof1jCDU2nkzZKCEGuXgGUdzNAt/ATfnR6CfhVMv2ivjjH6pyzMTXQV
         4d/2OcSRWQkul6/CB9Ak3Lw/y1TxRE8hU110zbQuGWtjaL54nVJIlwH6qEJARk5iSqNj
         oCOw==
X-Gm-Message-State: AOAM533AErLKX14fHW1CPvmTRQX3LD/yoCHd39CuEQNXnEoUPXOLJCEL
	iDbcLsoGA0eq0mEMJBW0G4SaUFt1rj4/t9SnO0w=
X-Google-Smtp-Source: ABdhPJxDGDgkj9km6SeR300sXBRfjZvolBdSDazDWE0QCpTWzou470svhJKj43QqLqhrz1HFxDR5Kg==
X-Received: by 2002:a17:902:b703:b029:eb:59c3:a9b0 with SMTP id d3-20020a170902b703b02900eb59c3a9b0mr3760246pls.45.1619186407895;
        Fri, 23 Apr 2021 07:00:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/19] oeqa/selftest: Ensure packages classes are set correctly for maintainers test
Date: Fri, 23 Apr 2021 03:58:47 -1000
Message-Id: <8717bf4f3c875b094ee29b4f3420ff5ad9cad1f3.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The dnf packages aren't parsed if rpm isn't in PACKAGE_CLASSES which means
the aintainers test failes for OE-Core (where ipk is the default) but not
for poky (where the default is rpm).

Ensure PACKAGE_CLASSES is set so it works in all cases.

[YOCTO #14277]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 842b11107363357ed933cfcf619f1cf23f0d841e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index e1cfc3b621..8e5e24db3d 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -63,7 +63,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
                      return True
             return False
 
-        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\n'
+        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\nPACKAGE_CLASSES = "package_ipk package_deb package_rpm"\n'
         self.write_config(feature)
 
         with bb.tinfoil.Tinfoil() as tinfoil:
-- 
2.25.1

