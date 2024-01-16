Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA94C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8417.1705393472435345957
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ilFkLwwq;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3376555b756so5259079f8f.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393471; x=1705998271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3itfnlLN5evVjWWwpCRFRFpM5eFRIG6Ijin8ZetZsTQ=;
        b=ilFkLwwqBArWMuAkSqhmYHSJ9ms33r3VSqKnypaPdVSqJtKYL5dGOapuB3gsSemoAK
         0VRkz8F8tYz+AXISB8vO6q658dLAytEP2M61iD7ygo0pVjZ1ROk3L4ukITzTlYJhLGfU
         E2hXRyUBiSRCiOppX70CKlMgzZvIJr8zNJaVUjJfUSTo2GtjPtsXa9FxQvcz9ZwQibwl
         aW6b/9kDe1YzScef6ji44PWDpX2GwYX8P/0j3LtNVyE2tMhLufb7jN47HgnLmGsC30HO
         rIrDI6OvawbUpWOCOLCp+JdL9jSjtU85hpggecKhiqBHg0hUTMAcWnWQjilWKCCOahxy
         ocWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393471; x=1705998271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3itfnlLN5evVjWWwpCRFRFpM5eFRIG6Ijin8ZetZsTQ=;
        b=g7anTTe+rm30rq3UBR6gDnRxDle7CRhfpV1lHRuKTVD9LFtt64NEyo8Pe8+mNGLXOl
         iOgJvRZyA01Ozcxw8dg0FdvpLungY5/fSYU3Tg0kayrtLY6mLxh7ZJJs1ehGU9vb4x8S
         WUvdnq3JdANTUHVgTZR1iwVgGUIUhxcz10aEqI2CJPJWdzzPLcAClimC6fFhbdQh5r79
         8NrHFOq9h6FO8hR38ZCrMVgnQvabJf3j+cJAAhv+varVA6ygC85KOmeVIGcu/uxtw8Kj
         nXm+CyXxuTllWedk1pikqs7DAFQqKLqdUbEazzxbaAQ9e3E4Y7Y7F4jgExzKjr5ig0vf
         GRxA==
X-Gm-Message-State: AOJu0Yzpu2tUdQRPL7XBny9IhMTgX8tgqsQyczjyq4xqRIrcK5yyJwGM
	lrdOEOjiHVZ8Bm3dss6QvWpSj4RCdkqcbg==
X-Google-Smtp-Source: AGHT+IHf/Mcq9fYP8SqhirhcvnVjJ+0l1qF8MYRvO8wYdBuHF988nmV8vt3omHg+ODGt20NHWE07wA==
X-Received: by 2002:adf:a2d5:0:b0:336:5b1e:ee66 with SMTP id t21-20020adfa2d5000000b003365b1eee66mr3545832wra.31.1705393470679;
        Tue, 16 Jan 2024 00:24:30 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:30 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 3/9] classes: go-vendor: Handle modules from the same repo
Date: Tue, 16 Jan 2024 09:23:21 +0100
Message-Id: <20240116082327.128990-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193826

Take into account module version when populating vendor directory,
because a module with the same URL but with a different version tag
could be used as an indirect dependency.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/go-vendor.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index b965428dd1..48f4d1041c 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -103,18 +103,17 @@ python do_go_vendor() {
         pathMajor = fetcher.ud[url].parm.get('go_pathmajor')
         pathMajor = None if not pathMajor else pathMajor.strip('/')
 
-        if not repo in modules:
-            modules[repo] =   { "version": version,
+        if not (repo, version) in modules:
+            modules[(repo, version)] =   {
                                 "repo_path": os.path.join(import_dir, p),
                                 "module_path": module_path,
                                 "subdir": subdir,
                                 "pathMajor": pathMajor }
 
-    for module_key in sorted(modules):
+    for module_key, module in modules.items():
 
         # only take the version which is explicitly listed
         # as a dependency in the go.mod
-        module = modules[module_key]
         module_path = module['module_path']
         rootdir = module['repo_path']
         subdir = module['subdir']
@@ -139,7 +138,7 @@ python do_go_vendor() {
         dst = os.path.join(vendor_dir, module_path)
 
         bb.debug(1, "cp %s --> %s" % (src, dst))
-        shutil.copytree(src, dst, symlinks=True, \
+        shutil.copytree(src, dst, symlinks=True, dirs_exist_ok=True, \
             ignore=shutil.ignore_patterns(".git", \
                                             "vendor", \
                                             "*._test.go"))
-- 
2.35.1


