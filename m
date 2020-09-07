Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.1763.1599498178927365931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=upGxK82c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id n3so7632905pjq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HDris6fyFYD9/SfswWqqqSQB7UzYPOAsTlOUn1keT2w=;
        b=upGxK82c0KD0EFNk8P/9SPCasnTTtrjFgFlZ37eU1eDrFy1Vs8dmfBcFwN/UQXq7n9
         e+3fve/62tYGY83aj4b5nrbIMHbp8kcYJ81nzzsZCiW5XFkkw/tfpJcb+hVvrDjeFcre
         1q2dOBOg3YXPcEm0TY6pzb+RcJm88BA8JsX3P/3hv+6wcYxonaD46QEPH9Zwp55JuLlZ
         eo4SYBk9/q5Q2Yu2BWLOSQC8bQ+pb52IU4UJqlPzZnfWCgtwUs/iXcIirONjkuMJtsdU
         m2A9L8nyw+tlbfNAbg1w82isFvV/dUq12iWV1VseLBEPIRSUt8TtCaerciCqxsJvf5pw
         +2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HDris6fyFYD9/SfswWqqqSQB7UzYPOAsTlOUn1keT2w=;
        b=O2ivzBCPmEqt1oRqOD/NyY2j6ARN9T8ye3gyY1q04CrahJucsCJy2Sy2dx00FrOdDo
         Qh4JU8dQ/LWSLrdv5DQtrFIcwe2aAAuxTx9DigASoWl/TwP9RDkUHVEc1/f3uetIfoyA
         sXXVbglI39bi7a2yxg4Q8sHA7rirUNuPAR1N30oIM3edTKU2a7RonMK2sXdzG8NwskIC
         SCOnrnKUlDdczd76XjvgtfAqZXw5ZoR0kH8OBlyjpajspZpeIEgKo4t4zC/dqIqMILub
         t64xRKF5hsy7e1FXHX5aE3Doed8aSdUOGlvJvCHK9+LZIMxzXSjEDNBKx/vvPZ+51Cqh
         UL0g==
X-Gm-Message-State: AOAM532W/JY3XxgQyVPyyGekyoJr7kX1JrGsVtEG1ivi4rK1avzxkCuo
	2bo/SJI4zufvu9zHpZ3HLI6KHW5q+CMZGI5O
X-Google-Smtp-Source: ABdhPJwpa1iugfpr1pFct9Lgl6INFHmcPNXxbMuR6o/R6onWlGAZ0xXqXcC2ZaG/BUmAE1NU5oca1g==
X-Received: by 2002:a17:90a:7bcf:: with SMTP id d15mr210523pjl.230.1599498178038;
        Mon, 07 Sep 2020 10:02:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] insane: improve gnu-hash-style warning
Date: Mon,  7 Sep 2020 07:02:12 -1000
Message-Id: <60b474320e2dd36bff9f0ef5f1dc491cbe734919.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Instead of showing a filename under packages-split, show the package
name and filename inside the package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f78fc65bb0c9bff05651d9e543bab3d75998f79)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 12ae44d4d1..c595080bdf 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -442,7 +442,8 @@ def package_qa_hash_style(path, name, d, elf, messages):
         if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLIBC') == "musl":
             sane = True
     if has_syms and not sane:
-        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the ELF binary %s, didn't pass LDFLAGS?" % path)
+        path = package_qa_clean_path(path, d, name)
+        package_qa_add_message(messages, "ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name))
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-- 
2.17.1

