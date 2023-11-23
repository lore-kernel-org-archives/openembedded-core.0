Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F4DC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:59:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.92893.1700751546565956508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DB/E1Q/v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4083f613272so6478115e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700751544; x=1701356344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUlir2p9X30Cdq2ZZRnUnp7ebcJ00EUeXi/0JjKMVhA=;
        b=DB/E1Q/vvndcMY0O+n+D0C5ki1NdWeSh/0QxMRCOepIYknCBrAgiWHlZEjTo24kYhH
         AqTVbbOBPHN7XV8Fo20BGoHTDIq7wIDoI2NvcoxbVSs6g8lrkd2EGFSXs3hsgLc4JWut
         BSmaxv4nN9O9FVAnPx5Y55IGlcuAvnMY2UTJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751544; x=1701356344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUlir2p9X30Cdq2ZZRnUnp7ebcJ00EUeXi/0JjKMVhA=;
        b=UbIKykQ3ftCJWslBsX0Sexya6mUNSgUuGDa7PigzBDpBf6p+/KQYXoeFvGjUbgNEDz
         pTWWK91lC5v7hAU7z1AKnKCtigmaV6XPJfQDT0b71c2ocWDkG0sZVRQm6r9l/NjA601r
         qGBHF3MOyPIr22GZ11z6jYRIbfEU7KMT+2DRUXYqO3nef4KMOqDCBcecBk7ayGjByRMo
         k9mdSwHvwTlFVUdkvTwRUsVfUNXLkmgwY7sV/YZVz5KvGS4DimYgX/6Lyo8j/TtfRbcZ
         0sPzM5cvjfgUD8Y/u9wEVg/IiHhuics6TCTqBhAaGIrzOVyQoMQYMiJ358hIbUye4KJ6
         lCVQ==
X-Gm-Message-State: AOJu0YxvUlacqmpo1mD2hCJmNAm4xTM975heRjRRW56rhxqlRBohiRs5
	lpxy42NQzqb2bAdmPwl0L9P33FzTDRXmKbymQ1c=
X-Google-Smtp-Source: AGHT+IFz+us4OrGW6QGrRKD0Xr6T8LjXXclbQuIuHE0zWFQe7IK+S3I/aYFcHNDt/g7VSTuFCOpdwQ==
X-Received: by 2002:a05:600c:3114:b0:40a:3e41:7df1 with SMTP id g20-20020a05600c311400b0040a3e417df1mr3985925wmo.37.1700751544554;
        Thu, 23 Nov 2023 06:59:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d500b000000b0032d2489a399sm1831167wrt.49.2023.11.23.06.59.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:59:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "binutils: Fix CVE-2022-47007"
Date: Thu, 23 Nov 2023 14:59:03 +0000
Message-Id: <20231123145903.3607252-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191167

This reverts commit 3f335913bbbabf48db1749d197c3bfaac9fb7236.

This CVE shouldn't affect master, it is for binutils versions 2.34
thru 2.38, while master is 2.41

See: https://nvd.nist.gov/vuln/detail/CVE-2022-47007

Later in commit:

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=19cacf672930cee20feaf1f3468e3d5ac3099ffd

elements of the CVE fix are reverted deliberately so match upstream for this
and drop this 'fix'.
---
 .../binutils/binutils-2.41.inc                |  1 -
 .../binutils/0016-CVE-2022-47007.patch        | 35 -------------------
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index bba87abba2c..b4934c02a89 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -34,6 +34,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch \
-     file://0016-CVE-2022-47007.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch
deleted file mode 100644
index 75ad6ad3ba0..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From: Alan Modra <amodra@gmail.com>
-Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
-Subject: PR29254, memory leak in stab_demangle_v3_arg
-X-Git-Tag: binutils-2_39~237
-X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb
-
-PR29254, memory leak in stab_demangle_v3_arg
-
-	PR 29254
-	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb]
-
-CVE: CVE-2022-47007
-
-Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
-
----
-
-diff --git a/binutils/stabs.c b/binutils/stabs.c
-index 2b5241637c1..796ff85b86a 100644
---- a/binutils/stabs.c
-+++ b/binutils/stabs.c
-@@ -5467,7 +5467,10 @@ stab_demangle_v3_arg (void *dhandle, struct stab_handle *info,
- 					  dc->u.s_binary.right,
- 					  &varargs);
- 	if (pargs == NULL)
--	  return NULL;
-+	  {
-+	    free (dt);
-+	    return NULL;
-+	  }
- 
- 	return debug_make_function_type (dhandle, dt, pargs, varargs);
-       }
-- 
2.39.2


