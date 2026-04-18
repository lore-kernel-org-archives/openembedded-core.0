Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4275EF99C88
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71726.1776537247671809652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I5VpYQ+Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7d984096so18653621fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537246; x=1777142046; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0Etaddj/015AodtU14GaW0PUhkDGRoNlsQEx6C5paA=;
        b=I5VpYQ+QqFCB1EZ+nBB80EhjUiBK38i8H2ImfXRfUpxZnwn032vlsqESBEz38lJBkr
         9oJLh3qnvJRNQQHRMh2ZS+pQr8usYDkMRBGm2vFNcIb2NpHK22IeaXtsWrEn+ZzVc6YH
         5i7GV5a1CaZURdJWDaQLoAEvVFKWHtbEzjnQ7XCjO73Bm7NIIvOdHrjDKyfFKEU4DqLI
         w6T2Wf1buerJQlPBmk5vG211WD59JClfugV8dXqX7LAYThW0KWFVw+b7Yt1pTXoVIFYr
         pNuKJbb5FFBzFC0JvG7Xi5tXn5YBe553PVSMj8YxvA77Zvq3GbSTU8RT+XRulVqQ0TJU
         1yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537246; x=1777142046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e0Etaddj/015AodtU14GaW0PUhkDGRoNlsQEx6C5paA=;
        b=kMFLXdkWk6/Oa/CAb4QKDaFFVFRzuuhpshBQMDRzrFjsuXeHRKXGl/7d3mJ0EsRF5/
         ZwPEWyf4dOdU7FP/iKO4jp1cCz/BxvELzM/Nb290yC7ksiEy9nl7SjkonyrWB7f72nD7
         aikaxMGBh67+QcVGO69yobHe8m5kTfFLQP1BVSqE/wGK4xVjLin9wAoBQRM4jgOxgCxb
         ZjhDcOJzkz3mVhNUQxJcsYpBHnVi990/TujAmjd+hxLbp0YfaLKhL+5raTFjbHZmBk9P
         sZyTIwiCQZFtYlbxNLtbUf/iMYJsTZPd/PNsZPmZhFvdpSz1tRYA8LTEdNwKKxjdkT2e
         Kpjg==
X-Gm-Message-State: AOJu0Yy9yzF+LpeAF6wY1H/+gV2aimifZan3CdnuxwJyUOuR1hzQqEyt
	9ABoNfJ3CcP0l49cuq/U33J+ssf5rx2r/JDNReZgwrQVMxV9Qr89L1nJ
X-Gm-Gg: AeBDiev13DvOMTCH5nuGlBnw+mynqGlOgJecgLZQx4mWwW6Vc0CPH2c822aJqsoGtl1
	4KAoMKsHOkthMIKBvmg+lA9mj9Z9L/t9DgCToIts9R+yMtcuxU5NvBRODUjratJSLnIcFUgY4rR
	uAVivhBBubeBIHhEkUHzWGfu+0MjLU69duLGDEs9vzn27pqhenHd15g8H9Uh7W0E3zMqG4RjbtJ
	ldU8tbvtSt5hZ5yZUc/52OV0VDQdyJjI6HTZ/nuu3Pu0JJ0q4FXkBItAIT3BTr/GLJeZ2xPiRsT
	oKWk7SpCggiCZ7kTlair8qYl1VrIYDwQLP/P4v/syoBshXBAa50DIOTq4z5c/LdJ0q6+huPgY2k
	DXIwi7Tes6+qrCvcjvkrNKgXwR4m46gThWmcQ/p8vYL/nyE+L370SHmLTwxRKPc9tSxCF/5xnB5
	k6JalHxLvhU9chx3fwUGDxT9duZs4DvZLOESdVWlPwVpBq/iNZURw=
X-Received: by 2002:a05:651c:2120:b0:38e:a8ef:b61 with SMTP id 38308e7fff4ca-38ec7b479b6mr21770591fa.29.1776537245636;
        Sat, 18 Apr 2026 11:34:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:05 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:01 +0200
Subject: [PATCH 1/7] package_pkgdata: fix typo to stop calling undefined
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-1-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=1160;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=C+X4lSdXMNMVkvUy4xnHRxAGYH0lJQdZ8DKB6NgBW3s=;
 b=EN7EVwdtJ/WbstLHjxrQX1hJ4QsYzvn07KvDk2QfXnV8jEgt5ozthZ5t5irt/klgAr/HMJpPI
 uV6TZlgJYxcDu7mZRIodvqoNH4Da/H/+P7ZO25zL4ezBDNIXckgj/2k
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235515

The function is named 'package_populate_pkgdata_dir' but the
call was to 'staging_package_populate_pkgdata_dir'.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/package_pkgdata.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index f653bd9240..b2f4e7594c 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -31,6 +31,8 @@ def package_populate_pkgdata_dir(pkgdatadir, d):
                     except FileExistsError:
                         continue
 
+package_populate_pkgdata_dir[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS"
+
 python package_prepare_pkgdata() {
     import copy
     import glob
@@ -47,7 +49,7 @@ python package_prepare_pkgdata() {
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps:
-        staging_package_populate_pkgdata_dir(pkgdatadir, d)
+        package_populate_pkgdata_dir(pkgdatadir, d)
         return
 
     start = None

-- 
2.43.0


