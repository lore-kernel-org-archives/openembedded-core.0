Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B5AC38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 17:38:25 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.286.1667151503491006113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 10:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHpbOWXQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id f5so2834559ejc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m6Vx2G+gdXq+icdmEgQYFCrmbOemT1fEpiiG41pz+g=;
        b=OHpbOWXQfQKIbM/eiaXGU2chFbG2zKFUVcBdxP8+CTypi2Bl+IQxVSjpF2r+V/kREy
         5UP/nW7XiAUYK7/Gp+y7oznEgXUdd4N8aTdnT/e97td/m+ZUsuEsSEdazB+clav28HDM
         +RIgHLjFbQl5frtvx9RQZH2bYGZM+VGS5sG09eQa5+p9CqHJYGtrIV5Hr49CHK4MFB0J
         ZG8oZvVFRxr+GbQjL4lP15rxma5eWeyIDDW7fOPcYKhqoSnjPIzhWXEktsKX8/Egpi0F
         u7qy1t782Rb3GuPMOBYzxxdXOd3FwrWajOFGIG9nnQ9dpmUB6nGIkTeuqhT9ozs1L1Vv
         fbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m6Vx2G+gdXq+icdmEgQYFCrmbOemT1fEpiiG41pz+g=;
        b=IM8XGuX3L5K0MRL3YHldiQdW6Qz9HdFva/4Ta39yOusE2xQcigR5FyqnJR8y2AQXRL
         BX0LmDZGpzGgMIJZO46A85I8F+VJMgpBXuVw9jZfzMNFcICxh8Qi76NvYbjxswIig1Bj
         cuX+5rLPzxxWy1PTIBXYboOakuKxxfTi94aQ1+6qYaw9jbUXwUEls9cfDI1fuJEfcf9h
         6gX5fCvnk/0SJdptD2Fao2id+laV6RpYv66rmTKsMebsop8U7Midmjz1X2vRP7qt/SjK
         2LsCMqpn82jVG2VPFRlHlPFwEvmtkQ2KWAX9RkdQfPWDyNQ01LZ840eOUXaoTb649sDb
         EGWw==
X-Gm-Message-State: ACrzQf2NUpC3vkZ/nzVEe4F0/5/b7zSu5NNzK66mrES4FA5dqkXyoIFC
	auQL9HIPSo14XtwHxhFU1UdMCf0a4yQ=
X-Google-Smtp-Source: AMsMyM4nTVwXgOH//i5xIDmItuB+BEPt8WFY66wT52okUKZ40C6//Mp16wa31mToFP4lS+unNneoXg==
X-Received: by 2002:a17:907:7b86:b0:78d:cb21:da0c with SMTP id ne6-20020a1709077b8600b0078dcb21da0cmr9590194ejc.24.1667151501835;
        Sun, 30 Oct 2022 10:38:21 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m24-20020aa7c2d8000000b0044dbecdcd29sm2258549edp.12.2022.10.30.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:38:21 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] cargo_common.bbclass: Support local github repos
Date: Sun, 30 Oct 2022 17:38:15 +0000
Message-Id: <20221030173815.10212-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030173815.10212-1-alex.kiernan@gmail.com>
References: <20221030173815.10212-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172284

Since disable network was added cargo configurations which reference git
repos fail as they attempt to fetch across the network as part of
do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths`
is used, as this is documented as only working for packages which exist
in crates.io.

Add parsing of the SRC_URIs for git repos and include `[patch]` sections
to redirect to the checked out source repos which the bitbake fetcher
has already populated.

There are still cases which don't work - if you have multiple copies of
the same repo with different revisions, there's currently no way to
represent that and anything using a repo which has a virtual manifest
will fail to build (see https://github.com/rust-lang/cargo/issues/4934).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index f503a001dd8e..63b13829084b 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -116,6 +116,36 @@ cargo_common_do_configure () {
 	EOF
 }
 
+python cargo_common_do_patch_paths() {
+    cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config")
+    if not os.path.exists(cargo_config):
+        return
+
+    src_uri = (d.getVar('SRC_URI') or "").split()
+    if len(src_uri) == 0:
+        return
+
+    patches = dict()
+    workdir = d.getVar('WORKDIR')
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    for url in fetcher.urls:
+        ud = fetcher.ud[url]
+        if ud.type == 'git':
+            name = ud.parm.get('name')
+            destsuffix = ud.parm.get('destsuffix')
+            if name is not None and destsuffix is not None:
+                repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
+                patches.setdefault(repo, []).append(path)
+
+    with open(cargo_config, "a+") as config:
+        for k, v in patches.items():
+            print('\n[patch."%s"]' % k, file=config)
+            for name in v:
+                print(name, file=config)
+}
+do_configure[postfuncs] += "cargo_common_do_patch_paths"
+
 oe_cargo_fix_env () {
 	export CC="${RUST_TARGET_CC}"
 	export CXX="${RUST_TARGET_CXX}"
-- 
2.35.1


