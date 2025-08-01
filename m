Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A003CC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:27:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.89121.1754058467470545012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0lEl0+G;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so386522566b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 07:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754058466; x=1754663266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jV5QhRYUk9VruCxkVo6BAYrehNJRfesCbAkRjrZuCJg=;
        b=V0lEl0+G4msc7MfJ0wJA6VQIB3Yy1sh8kwW5L9vA2Ej4NGQ+c8zMfn5yzPzAuEzKIm
         y/emh3m0Bvb+GMPhExsgzaZ1OQ2t0OFUfpU5BoPickaB1pxdye/YL3D4Qa5fbVM/QHTF
         d+oGW5x5dyDD5RwgOYjcdlAiwKtT4MKXoA6Xv9HbZZrUUy3pzWAta9pTDjFo5WXrCagO
         KI+cInE9K3DbOfRLLaREsylnVm9nK8uayHMGsoUAr9u779zs1de6BR6iTwE6E/mm1pHd
         pOL40EXOcw2J6XvEdPiMCklnpIvN2fwOQNeo+Al+vGy1lfeYJEx4kwTwFmeA2yj1EP3L
         /9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754058466; x=1754663266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV5QhRYUk9VruCxkVo6BAYrehNJRfesCbAkRjrZuCJg=;
        b=EzmY1rGpUlovxmygmW2Wv7IxAfjnM27r+xRuzth9DOfeNfPxla9ZXuSUDIecGXFekl
         LEugyJByQTks/ADvZ9PUPVgeSHn82y6m1S7ZTjhGWqi+i3u1APVaj/7Teaq3ZvT29Hos
         CzgGgGaibw70YOH8N56/Ep6SQ4pOAgDcfqvCvY5Yf1Rwi4/b7WWiTsieGUUtzVH0bWvL
         87Gl8zCr4Q1BDnEA38vKhKKmaw74ZzrsWJYaXoHuQS7riRS1Byg73b9UsZhWoSoBQNVg
         K9lj7ZsEthIDv9lHZJMQHMIx98vhcnkrb9D4d3s+VnQs8r0WvZ9GUGSeYI7FA9iSYZ/S
         +oIA==
X-Gm-Message-State: AOJu0YzK/5egBnSDfJ1g7akzuxCx1zuqL1v8QLc5wwm6qghGsut/smzZ
	ZjwyzavhzLIQoBPTwRqyrwZlRF1CKPX9dfjoEPxNyi98g5SeUN1DanY9EbbnGQ==
X-Gm-Gg: ASbGncucmsBnQq31pNCtzceQX3ORuWcf/OLvWqIDor0a4qJGJmTo0Ie9shD7s6pW+m4
	eoaJNAxRekC8G1avebvHCsjuB0HZVzplAXacuEDBnDIDa9mjO9fsTaUNAqdLV1uFqsGBBsWx0dQ
	UzY5y5vjpwknp72DF+fpXTDbaqkFmXodfIqUD+EEdABDy9kvkBDU8lNYiSqGmj3aVmdM3qb6JcX
	yJZW9d8w6wsMI0JC7peX12MNe/id1+GB72k0ZVYlMbc/HRRY52Lkpk+5ZncGme/ytQmDzaCl+hv
	SEqmPCOWeofCcSV/OnvWRWANkGIKnPy8sDx+mPm+DQVAUNG9wYVxxMo2ZtWCINppYFfJcLmuEHQ
	dAPM3/5qTHCdP9kutk/tPVFoGGnCv1g==
X-Google-Smtp-Source: AGHT+IH1/V+ummdz1p5moO5siFjnz7WZAlLtha2bPPCpq2RduDBJlauHE7HoJqeB/QmZnHLFvYtCsw==
X-Received: by 2002:a17:907:60cc:b0:ad8:a329:b490 with SMTP id a640c23a62f3a-af8fd6e4f45mr1286730566b.23.1754058465417;
        Fri, 01 Aug 2025 07:27:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c050sm291688266b.104.2025.08.01.07.27.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:27:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nettle: upgrade 3.10.1 -> 3.10.2
Date: Fri,  1 Aug 2025 16:27:44 +0200
Message-ID: <20250801142744.1551451-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221358

dropped 0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch, as
it is fixed in this release.

Changelog:
https://git.lysator.liu.se/nettle/nettle/-/blob/master/ChangeLog

ptests passed:
All 116 tests passed
DURATION: 2
END: /usr/lib/nettle/ptest
2025-08-01T14:21
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...pt-getenv-signatures-in-declarations.patch | 44 -------------------
 .../{nettle_3.10.1.bb => nettle_3.10.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch
 rename meta/recipes-support/nettle/{nettle_3.10.1.bb => nettle_3.10.2.bb} (94%)

diff --git a/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch b/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch
deleted file mode 100644
index c6f75e9150..0000000000
--- a/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 20eb61eded3bf2ef03e1f37c8c1535b9c246d0f7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 13:48:29 -0700
-Subject: [PATCH] getopt: Fix getopt/getenv signatures in declarations
-
-GCC-15 complains about this when trying to build on musl
-
-| ../nettle-3.10.1/getopt.c:139:14: error: conflicting types for 'getenv'; have 'char *(void)'
-|   139 | extern char *getenv ();
-|       |              ^~~~~~
-
-Upstream-Status: Submitted [https://lists.lysator.liu.se/mailman/hyperkitty/list/nettle-bugs@lists.lysator.liu.se/thread/R6BDHRO44KSRDAOZQAREYICI2RG5PVNC/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- getopt.c | 2 +-
- getopt.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/getopt.c b/getopt.c
-index 9d29de7..5b89302 100644
---- a/getopt.c
-+++ b/getopt.c
-@@ -136,7 +136,7 @@ static struct _getopt_data getopt_data;
-    whose names are inconsistent.  */
- 
- #ifndef getenv
--extern char *getenv ();
-+extern char *getenv (const char *);
- #endif
- 
- #endif /* not __GNU_LIBRARY__ */
-diff --git a/getopt.h b/getopt.h
-index da1a01f..ab50792 100644
---- a/getopt.h
-+++ b/getopt.h
-@@ -166,7 +166,7 @@ extern int __posix_getopt (int ___argc, char *const *___argv,
- #  endif
- # endif
- #else /* not __GNU_LIBRARY__ */
--extern int getopt ();
-+extern int getopt(int, char * const [], const char *);
- #endif /* __GNU_LIBRARY__ */
- 
- #ifndef __need_getopt
diff --git a/meta/recipes-support/nettle/nettle_3.10.1.bb b/meta/recipes-support/nettle/nettle_3.10.2.bb
similarity index 94%
rename from meta/recipes-support/nettle/nettle_3.10.1.bb
rename to meta/recipes-support/nettle/nettle_3.10.2.bb
index 267a6ed449..e651f68cb9 100644
--- a/meta/recipes-support/nettle/nettle_3.10.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.2.bb
@@ -18,10 +18,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
-           file://0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch \
            "
 
-SRC_URI[sha256sum] = "b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132"
+SRC_URI[sha256sum] = "fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 

