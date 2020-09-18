Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.421.1600445741285451687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c0LEODd6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id l191so3754856pgd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=veYj3rnqs76M8e2m9tclcZ7FtQRHvFUHC9NNvFGCQl4=;
        b=c0LEODd6KPpHu/12H3Nxq67f/WaJHg/4JdZmZXlkOodQHlfQDt1J4fEIUzl0b4qtzN
         yaW/DFHyy7E1kv1J/ijQEBhmupjWus8vPBx6kSVeEaRb68dIF3XTQjwC+IPsidqUHI82
         hXmURj+R15XUAYWbzyNc2UZIPMjlmv4aPlOGIYW3uuFEH313xGSTjRpmaz86kXJZV8Ep
         Fp34m5muM9pKd38gf2XzfhUWl5j5T3yM40WM2xcbSoq/kV98fn5iHRMGFRVgCbmnpbs/
         lb452G+rpchXIlS/erweYeM+ixl67wamxlWz3rDiM4sAuMMAfgTq24hbIiHGZ9/+kuNs
         sJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=veYj3rnqs76M8e2m9tclcZ7FtQRHvFUHC9NNvFGCQl4=;
        b=NKcOuDWc6EuhdP7w/AzByBwwQTlyogFiUoN0f3CAKBNyYZn8/rXJoeTKhB2I/l/n8g
         44KKy7tVmchFJm8S76+KtWQGJ0oDB8lNG2FpAh003WB1uVP95O3GylNigvj5DqR3QAi3
         MOIC8+G2/dcX7EQFiATVerAdpSQgXz4cC+O28yFSqTsiFXfyvcT/CAN6L8nPX4JEcL9h
         hAY/GASvcKaisDhXnIg0BC4yPNvH6bW6LBoyQ0o6l4r11m1FJLtpPXg8d5AYGnvef8X1
         +R5oXGWVVXPe9oiBE6jp1yjjq/w0zY2E8yGqCWacGGvh2uJDnhUE/2x0C7AFBmes6GeF
         edHg==
X-Gm-Message-State: AOAM533Z2rLHDvGEnIHFejl/zL3f05r1ESQJIyO2Pelogpxw8L6HWro6
	t7dHSzFoGIXfsb6QwGKU+yykfLQV52L4rOK8yxc=
X-Google-Smtp-Source: ABdhPJzeLByu691gu2LsCgw6bbck+nR8PMRBwL+UXQlD3aXEuV/3PctLw/YjrPbxoT7pjUMdDgjHbw==
X-Received: by 2002:a62:3207:0:b029:142:6a8f:c40e with SMTP id y7-20020a6232070000b02901426a8fc40emr5695779pfy.69.1600445740391;
        Fri, 18 Sep 2020 09:15:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] sysvinit: Remove ${B} assignment
Date: Fri, 18 Sep 2020 06:15:13 -1000
Message-Id: <c8ad554db100b9fd16097fc8616b2af5390772e7.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Michael Gloff <mgloff@emacinc.com>

The VERSION variable is not set unless the
top level Makefile is used as the version is
derived from the Changelog.
If VERSION is not set, none of the binaries built
in the sysvinit recipe will have a valid version
output.
Before:
INIT: version  booting
After:
INIT: version 2.96 booting

Using the top level Makefile does not cause any
additional builds to occur.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10992ad4f343d0f92d9d6246cc2e58effd3f3eeb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index d2b85ed9c0..7358f02385 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -25,7 +25,6 @@ SRC_URI[md5sum] = "48cebffebf2a96ab09bec14bf9976016"
 SRC_URI[sha256sum] = "2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587"
 
 S = "${WORKDIR}/sysvinit-${PV}"
-B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
-- 
2.17.1

