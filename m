Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D13FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:05:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1331.1778000738084308156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WAt3vhYH;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe62837baso3040447f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778000736; x=1778605536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFBH8TQ1xic6vvxyl4wFJCNvvfa/4Q4+8Tf2aXsivUI=;
        b=WAt3vhYHFKNhg7NMQL+nFbcTjsL3uyEh1VG61BWJBQ8dcepZ7eIy9QOpH9SBrRc4fF
         +E6cAhOg2N903ECDfTWDNH+JdM0GkzDMWhvdPKO+kSkzfFbh/iXYJNH1tyBmOMwVjRQt
         tS1ybErR2R8vx1KEx62uGP8jewZ4oRDIseqBIoOtdHxcV2ouo0/JtUCV4E73sn9Ans81
         ZKBgAGx2Ej+OgIMFSaf78m047QuWpPT5c9ZKfv+nUoLWWq0zM84BemhCsDBp1/130edm
         QwxOO65FcYf45ADwn1ZYkvpNY6dS1qH67vi540+tLc6LWk0Qc6WJ8J85UQ8QokQpLQXW
         H2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000736; x=1778605536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MFBH8TQ1xic6vvxyl4wFJCNvvfa/4Q4+8Tf2aXsivUI=;
        b=tNp8pF9UxR0FHoA0iBtEuLmcDivi+k4ICDGGXu2hxBvMF8akmOKKqJ8leWwpW/j7ao
         HvEF1GTQLZ1M0Mm8xASN7OpoXkqcj/NlLCiyGRF7awawZS5IsE152RPHrL1XSZoexNQj
         Ah9KReiotuPwaRJvRUDd1YeM+z0a9e+iJtrx+au1uSYb1SBfi9cqTvs1dY1rjj4cWwM4
         X/to3SeKpCmp4MqCeHK5Vx8PWdFTFM+OPp/4kIoSfnDxORgnC4io9oBZmU9CNs9D5UK5
         C/8zbISkeXFoLv/6FP0v4p3+LMT6ocIPsh2Au+Z6TDFXY/bOhkEc5LsOcdME8Yune26+
         dbVw==
X-Gm-Message-State: AOJu0YwNuCl/T7B1MVAGjbx/DO07l3JcHSsaA4GATGppUgtnXHrfMnHK
	2RCLSaUV/DG/pD44j+zH/q0Wl7aIDr9MZ+Zh1PBGHKAH6OZbQVsTHwFj7vcxtcTfm68rgA==
X-Gm-Gg: AeBDies8GZKGxheodpgeruq1gY4OWdr5OAaY+VrE+As1Kgk8e1x3B8NfcYJSWa/QaSF
	m4tByHjPdz+gMYvfyWd8KOyrb/HMPpwTsG8HMpnSb5AeikJ6eHufEEok/KvqKDiiC7v1bHk4pBT
	N0/uda1hw+eR6zbxbdGflfj7AdtSuTk4zBWaL+Fw0EwKIZ82LEvQ9wQLPXxC1NHoogRmYPtUoA2
	1Yk72hnoAiTkxuwBZXFdJpKK5DqYqncY0haSl/8A3xPDw5j156xXdiA7h7cedm/iUKxbuLZVHSG
	0BeFHx324MtrQUpdsRGiBOQirW6M1zAbQ56MQxHDp5mQy3a7QingKCGkOpcQjXyL69PyKNPy2y0
	AQVuSBxCb8TktJh37MSREVEbWdObUmGxvUsAAuuopYzxqVu/ToCRn5qYZHz8ez18bvKnurPwJfU
	fvbYBfKpfRncWAvC63ZzNo9xRkR1ulMlOXfke2pUMbofRfyj8SZcQHv5qATIx6+g3L/igQe7kjQ
	wGAfr8=
X-Received: by 2002:a05:6000:228a:b0:43d:67f4:91aa with SMTP id ffacd0b85a97d-4500670ae2dmr6711123f8f.40.1778000735770;
        Tue, 05 May 2026 10:05:35 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6521172f8f.28.2026.05.05.10.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:05:34 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v4 1/3] oe-pkgdata-util: fix empty runtime-rprovides directory handling
Date: Tue,  5 May 2026 18:05:19 +0100
Message-Id: <20260505170521.1129945-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429124524.2890648-1-sam.john.kent@gmail.com>
References: <20260429124524.2890648-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236515

An empty runtime-provides directory caused lookup-recipe, package-info
and list-pkg-files to skip the runtime-reverse fallback.

Use os.listdir() to ensure the folder is not empty and use
os.path.isdir( to ensure it is not a file.
---
 scripts/oe-pkgdata-util | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bbfc6a2..904008b 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -289,8 +289,9 @@ def lookup_recipe(args):
 
     for pkg in pkgs:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -355,8 +356,9 @@ def package_info(args):
 
     for pkg in packages:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -507,8 +509,9 @@ def list_pkg_files(args):
 
         else:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                for f in os.listdir(providepkgpath):
+            rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if rprovides:
+                for f in rprovides:
                     if f != pkg:
                         print("%s is in the RPROVIDES of %s:" % (pkg, f))
                     pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
-- 
2.34.1


