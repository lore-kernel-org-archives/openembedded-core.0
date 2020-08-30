Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.36649.1598811493540145226
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fCDlw2G4;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id c6so4682100ilo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=z5hBpvyLAee27qa0ADb7d7pgoVf5uGg9dGs87Roc7dM=;
        b=fCDlw2G4EjMaD8IPDMjrkRpnyWEOUZynMyzrOrhsT+WPggc5xo5fhosLQqcuqjgS+B
         y0dptJbUpiiX1+ULYiYRghIwDNhPMFnl2NutW8kYXedNLSvGJK8CMrnqvipXB06gsP/e
         egbDNGRKWx0tHRooUNDBzyphmt4wGHeWejgcqswxcfZXT+5+kdx0ggWJvnsFm714MNdb
         8Y/oSSt0r7it9BFK4oniK2ACB5JoZlnGzdZ78aGDvyVGYB75I4UpJ0fIXUy/tv862i6c
         WaWRy4GZEs7XkdPloTftXOx4CnYoo6CehQBwZqRbQ7EH8us8gQJ8bGfkZxG2uEaPi7e8
         p9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=z5hBpvyLAee27qa0ADb7d7pgoVf5uGg9dGs87Roc7dM=;
        b=W32+jW8/f248yb5M01JDXujPPzt/9gK4cOWz1Vmq4cPfC1lZN2AkqCv2SGlMxhtLaB
         uAk1q/qg27nn4V4NJ9ibo/fpuFFV3NYbIgzFSbLKrXZzzUUcQGJAQpi/v0HA5EHva0Fx
         LWsx+fMzuCvN4ndCl4FVXNNbEKDOssJO9E40H0W8Zlt67tEQbevSrRothJSxTRsTgC+2
         ALHzj2mX+z7gMNiFwGRhRDTCpdp7gsAJiLTxLIuzbwXpPmL2hciffGAKJhY2uYdbA8tn
         0a+MxUN4S8T5U6G5vBlTXpQUWmHoVZDQj9UYiWWC2+CLLd3pS99ShYiiB3aWY8x7ka08
         zXLg==
X-Gm-Message-State: AOAM5310jfFsdkf05efVTKoPO0JQrVcBLe7kEXb7pCO+TqunYeg0wePp
	xC6vn/5bKr6YBGN68fhPPEQaogdDTNubWgyQ+u8=
X-Google-Smtp-Source: ABdhPJzw35+I5p6soE5pFrlQe9Lb4+QvaI7VL+gLPEK6xgvSMn6STJ/rjjBC6pLWUWUlLr43t4Vxug==
X-Received: by 2002:a92:a302:: with SMTP id a2mr6248154ili.116.1598811492478;
        Sun, 30 Aug 2020 11:18:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/25] package.bbclass: Sort shlib2 output for hash equivalency
Date: Sun, 30 Aug 2020 08:16:00 -1000
Message-Id: <07d15b83a998d6a80eba2cf8649486bfe302f94d.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Mark Hatle <mark.hatle@kernel.crashing.org>

The output was unsorted, so different versions of python, different input
ordering could have have changed the files, and thus changed the hashes
making the system think the output was different, even when unmodified.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23cc846c92219c5cbe3fc6a0024579195d3cbd78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 099d0459f3..2d96e646da 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1842,7 +1842,7 @@ python package_do_shlibs() {
         shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
         if len(sonames):
             with open(shlibs_file, 'w') as fd:
-                for s in sonames:
+                for s in sorted(sonames):
                     if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
                         (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
                         if old_pkg != pkg:
-- 
2.17.1

