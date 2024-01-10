Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB9FC4725D
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:54:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9920.1704887688869994588
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUx1xv5H;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d88fff7faso41892565e9.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887687; x=1705492487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3itfnlLN5evVjWWwpCRFRFpM5eFRIG6Ijin8ZetZsTQ=;
        b=QUx1xv5HlixOxVtAVoryhV4Vg5VXDssOJRNXDNkSzxcW1wISx1HISglImIEPbde7OA
         rrNCvofrZMbHVWCulDDP0svhsCP3MnW4rJZtkLejQf6hABdA6Ng5lJVRwgxQCq/AOtU7
         j2OM2mT5FmToBAuYtxiWtW/xkbSBmOVIeIVBp+2vwCTmRfU1vB7cNGyrMmwK8e1pg7SY
         hlsPSUq5pr1342gqbgc07xTQzWO/Nu9BtMmXfUPyvdx0GOUolZUSu73IUh+4DDjgHBLH
         PWGjshUVRw2LK92yA9r8+6UsAKdSnDTx2lpR0itziRVUu2U8Vc4+qZbIC+/bOrNgidy4
         CeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887687; x=1705492487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3itfnlLN5evVjWWwpCRFRFpM5eFRIG6Ijin8ZetZsTQ=;
        b=sNhlAC9Q8Itm3IFjlpcS+VEZBNFBrB1+TsnWqLTHAWuGdPIP9M8qkB3/ehuYbwf8yj
         CI6S0syzVcXAli8PgueFCN+tgWzZJ/TRFTuq7OTh0HgSKkvo7hDjADbEdiT8c+P76ifL
         nx+9S6QAQvYzcNNIG6JlelHCC3Xv4melM3HS44HrWbw0RNMgSeAE/emJ/3MlXtZi6Tt8
         5b9DTXI7OKW8RcTQub+2rz34dYlWNTaQI3ea2cLjiNxPdmF/GL5N518VFzHvVZkppZI/
         jwro6qbb80TJ5khbiGhMBW2TgQEzxTDLysN/lLE8mYi2yEC5OvoYt4zRGNjt/7dNvyzX
         yKVA==
X-Gm-Message-State: AOJu0YyLr9tERrhdGupp+GTzuBBq8W9L21p4ddMB2RCojQ5ecZoAYqHf
	O2JfjgAsBn9Xr+C8Cd0YRIZUmzvmZk+Vyw==
X-Google-Smtp-Source: AGHT+IEzA0LCRndBtaFQhdXri9AFdse17We+C+ZmnavW4Wsfk/69itwFc/7EaxlITVWJ3w5z4EHEsQ==
X-Received: by 2002:a05:600c:4513:b0:40e:3edb:c87 with SMTP id t19-20020a05600c451300b0040e3edb0c87mr236364wmo.186.1704887686906;
        Wed, 10 Jan 2024 03:54:46 -0800 (PST)
Received: from slackware.local ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b0040e5a0515aesm44191wmr.14.2024.01.10.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:54:46 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 3/3] classes: go-vendor: Handle modules from the same repo
Date: Wed, 10 Jan 2024 12:53:35 +0100
Message-Id: <20240110115335.92914-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240110115335.92914-1-uvv.mail@gmail.com>
References: <20240110115335.92914-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 11:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193495

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


