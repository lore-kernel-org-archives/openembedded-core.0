Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.61441.1594051909386564532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GdrG/FaS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id l63so18575452pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yvcgOIU9iPNUu9ioHbfaN6ItvC6rhRN7jjyeACTwMdY=;
        b=GdrG/FaS1fleFevAFrE8BAL+4TPW/GW7iRhd10Fjc9KePDS0e+BcvkClGmN0ldvBxX
         EV8HzdWKHshflbBiPh5iLIFbMM4J7L5QtXIsnvFoP92Vda9lDW7b99DHG4iicMMOK41h
         VmN0/yCvdjcNLXabfRoHDFwb4ZiGBWyAtTYB2E5YW3pjSbHY2kvp1f2ajNDByl8CrbyE
         roa2JsSkOykGEVA4VADxW1G4EuoO2gTXYUP5XE5uDk5ESm4sJfdeH99ygiG8BZn0PyJ8
         wRxQII6JgbVOSc1ybv6BS4bHouYo7UveYM6amSQroJ0oDknw6YSCoxJPTE7+WF/b/WF9
         22GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yvcgOIU9iPNUu9ioHbfaN6ItvC6rhRN7jjyeACTwMdY=;
        b=MZis5SxNAG8fdDPlLSGcqNmySSnVW87ki6CWj1FkG8EczwOpUEe2KuOxLl+yUbiVeY
         cnuUwx1z4M3Fmw6RMkX8/B9UAkM2HAzmabT8U7G6LIw5WjF30Ug6jVfG7a3wakJIRTVc
         0jMU9C9Ic0Ent5t1Mvdjasq6tjrkUoIt8zQUETPaBu/2cagXED0MJ23tNvHpmmY91Rxo
         eT+Iz1+Apg0m+6YpTTd4M0G9wM1/AAOMS1bDNQ/GjKdSaaRzpEUq9n//1iruJd0JWosA
         uBaLPmaSPLltIBSNuNo/GJeUErf2iHIkKbUGsnrtDfecrmVeO9rNHNTOQ3eDh4NwcFru
         MDKg==
X-Gm-Message-State: AOAM533NExdSdVrfK6xB9n/D7eRWglfFEp9EFN8CyUFT75JdYEB6zSlg
	Ocnif3hNUYUKlk5BSDeZ81KzL7iAFdm0Mg==
X-Google-Smtp-Source: ABdhPJw8nk24QEPp6/yn90Szgqodcs+mG2bTVwYb/n4Pt2ZQNwQy8Co0lBoVJSM/aOjHKp5K7kvUJg==
X-Received: by 2002:a05:6a00:1507:: with SMTP id q7mr42865645pfu.131.1594051908464;
        Mon, 06 Jul 2020 09:11:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/25] oeqa/core/loader: refine regex to find module
Date: Mon,  6 Jul 2020 06:10:20 -1000
Message-Id: <8069333ddcda263357bfc9bcf81e1aa566ad3c8e.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

test case in format <module name>.<class name>.<test case name>
this is clear when test cases is only 3 item deep.

but confused when it is 4 item deep, eg,
oelib.types.TestList.test_list_nosep

in this case, oelib and oelib.types can both be treated as module
since module name contains only lower cases and class name should
contain atleast one upper case.
so, always treat leading item without upper case as module also allow
module name to contain dot.

[YOCTO #13941]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad81ea90a815389e45ff302a85151724c71f71c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 0d7970d49e..73c5788508 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -46,7 +46,7 @@ def _built_modules_dict(modules):
     for module in modules:
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
-        m = re.match(r'^(\w+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
+        m = re.match(r'^([1-2a-z_.]+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
         if not m:
             continue
 
-- 
2.17.1

