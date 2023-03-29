Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D445BC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1029.1680103849594932018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ifKHCPaz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso11746953wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680103848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=ifKHCPaz1uuZFu5fFVf4W4Moh2O6EwwQGkTRL6URL0fPGY7ds60W+Jn2T8+7Y9QCAc
         s5vpBZQhVcT15owyMI2jXLa/haGMaF16FpC7HEHZXZaCmOCzj45kBAvapxvoaTzLNNT2
         zTheC7hfEt8BNUhiM5KMIpF1Jt260uPxBmdTQIUh8SXONkp8HBXygcSYKEiJzt/9KZ2X
         gc4zdNhaBL5A7/dTlWmPGyREx3U8Uup8o+7JyhPtvi9O84lN8VFUT2b/XrjzecqzZqm8
         7SBYG5wS/Psqc71k4OLSslRgE9d9dA0n8MnU4KJJHHq/sDR26oKQh6k2KVU8ox3DfyYn
         Mb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=Z/RWBNfNh8HSXXdyZFHsDchbRfWDsqCZ3+/1cnVSF//NZxO2CZJzbLoj3nnQU/Rh4G
         YPW7V5o0+SfwGFPuV+zqlpbkxBXe8+1FBbb/U1vw7lV7KyV1vbkMXlMrE4bSKz2avSMd
         ook7LlBDqD1RKUqP8w4onkHVtQ/KiQFCboT/LAdxXKGFK3A7sBbsaUrt1KeGHxGnkxW+
         In03Eqgwl9/OXRA4ONwbOgkposdCkUyMl/dpoiazPtRXduBkeehuXrXX0dQEqdgIptPX
         2QBOKoakjfN2c7unEa34bgRc4o1OZfIig+CDLZyg7njzdm1o3l3+zN8CxMthi9S4OnZC
         yVGw==
X-Gm-Message-State: AO0yUKX04S8kIQVgNmFVwHKUsDEj2sOZnn6yKwFeK6uvOG34zgKV81Oj
	d/yPyps0c+UckYkl2X2meauxhByTcVE=
X-Google-Smtp-Source: AK7set+WfgjGXSx/mfoTMBvw23VqVxUwif5Gq5dfeJAbWyj6DdXYGlemGf8Y9ejyamz2PR4DjIDVbQ==
X-Received: by 2002:a05:600c:220e:b0:3ee:a205:848f with SMTP id z14-20020a05600c220e00b003eea205848fmr14305408wml.20.1680103847618;
        Wed, 29 Mar 2023 08:30:47 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:f236:1d99:4c31:5762])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm2607378wmm.37.2023.03.29.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:30:47 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V4 1/5] cargo_common.bbclass: Support local github repos
Date: Wed, 29 Mar 2023 17:30:30 +0200
Message-Id: <09a3ae010aaa2617dac03ff602c4ce68e0cc4060.1680103647.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680103647.git.frederic.martinsons@gmail.com>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179286

From: Alex Kiernan <alex.kiernan@gmail.com>

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
index f503a001dd..63b1382908 100644
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
2.34.1


