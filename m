Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D330FED3FD
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31966.1777064207602097906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rxt4NhGH;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so105874495e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064206; x=1777669006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fe8FCftxG6H36GzZtbInjJCULYbuXNivwLRqvOXn1hE=;
        b=Rxt4NhGHdOLurbanTmZwZzMczEcJTBloleqqndibqMf41Df/gG8EIn0nM8K5id5uHS
         tjtks2CNgift4NpD1pvDp8WwIsf0boM+UPvV4u8Ddbvkz+TSaomU4kuvn41miNQmTh9P
         12uG7R8wuc0awckchfRUaVNt6UWHbjcWa7mig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064206; x=1777669006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fe8FCftxG6H36GzZtbInjJCULYbuXNivwLRqvOXn1hE=;
        b=qITZlApJy2Ct2abTbhpuBukw89c+gzkolhIq82iHudyyagSU6U/xo+S4b9N18TKAGr
         xcsqefx42+V3bIR9rwQtM7Y56QfBHUcRb5SyAB9bytmLXvrWmShwYF+5t9zkg4vOEta7
         0Kw/1UA3CpVXodt+m2B4J70WBliBzGMVVaTi0ecvl7clHBGf50OjFhK4crEqbTs5hkpH
         +8j7jVMxnToWN8hs6FGA9BVva7eLMKat2bXt+uOtUoA0aPnbM3eguMzxJEwfd4vihqvB
         pVfFjo+FZxuQOCklq0EVcgnGOIRX2KO6S+pTOvr3iHmgqQCV1xMpq1Ogu3S3iJGPoJko
         J7+g==
X-Gm-Message-State: AOJu0YzIcNdfHW9RqPsafbpaj+/oLbnYLZYg39yokFoDSjD1hoursZk/
	js9ZP3suwJEgeQiCpkoyh0Fxc+DTBP1M83HX6d2r2tInDbR0vqq80mNuu+vpRS7r4metv5YGqVE
	cs09aujZjRicF
X-Gm-Gg: AeBDievJSon/K/G+vsRGoAK6rT8sPJK6o74YZrqX3t4RB5KPErFLtgGLdZuKWC29Djr
	JeH0qkeR/ENXnq11myotuJz5R++qMPp61Csg/jWUIGAfIBzNkSkw9yeo7MEFkP6kOO5fPm4v18y
	n+uWMD2lA2lZAGP7P1EEx/OMm8fs+cFA5R5R99fE2Z96+RSWoomjDXZZSeksOMwvXo77lzqk0AU
	z22rARbCpsGTXL7tzusvuFxXerxMRWpFlkYztxeut6Cg8EooNJkLkJXnfJ2nOMZl2rImtcDredB
	oR3Pkyz4dW5MkhJ59qpa5wE10wDNSR1U8j+vKE4+4ab+hnKiCglg9zJfAT/MQKGEp68AIxPQK/J
	oFMWF6kNK+6mgbX0NKV90muXl+ha321NSIsJOjbAGwj+fk6KH/2Q06WNiYVjRWxCqKg716Crt6k
	AXcv5jdnS2jnCfAVB9JuHWcrqPZuFCGO8E/Eu+KXc8hikue9K5HA+vjCcUPdftPCkInutHDBlhE
	5jM5ioSwSinWdulab2C4/R0pUcTWowEYRWQQQ==
X-Received: by 2002:a05:600c:a086:b0:48a:568f:ae82 with SMTP id 5b1f17b1804b1-48a568fb009mr246314725e9.10.1777064205682;
        Fri, 24 Apr 2026 13:56:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/66] sqlite3: Fix CVE-2025-70873
Date: Fri, 24 Apr 2026 22:55:13 +0200
Message-ID: <e948f33fa6bf69619b406ccd8dc4e5470e223335.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235887

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2025-70873.patch       | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch
new file mode 100644
index 00000000000..2125110f6af
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index ecace5a..8c3740c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -10277,7 +10277,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 05bfaac1af9..1b3ac83b58d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
            file://CVE-2025-7709.patch \
+           file://CVE-2025-70873.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 

