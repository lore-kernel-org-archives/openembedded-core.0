Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70052C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.29697.1679904761215209596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5Am4uGu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id p34so4491182wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679904759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=X5Am4uGusUEqUJHhgtPd+QBWoEqkSvVsZ/9QxSiKo97eQF93gEz+Pv31Wj4uz95aRu
         ILkb5pRYUcP/2WvPxSK7Rge1T7VnbvkwIXerFJhgNYqqNg//PI4mgdBivCiptCZTqkrn
         KTghKayt/0eJDoGNvph28WoCCpKs9al4RNgO+9zEdZ6xeYirBS9ttlOmUtaDC9pAABZY
         2Bfrxa1UpqZjOQaoalYPOmdzQhfDgi69TjVloJIOJ25aPap98ur+iG1/CBLK63yuWrDp
         PrdyCwHomUQYvMZPzVM3bflicmbwacyFXBVizv3dvHwr5wMI01Dmk+1+I+Hk8j0SUV7T
         qLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=W9eaw6jnFoLq9V9ne1pys6eb8v0T2lUSThucGC+KjK5G55OdWNbhByDKE6oN5YM4qT
         aV8RbaGBQdh16wgNHEgn+nxx+BKZgdbmJUxe7X1XvBfMEqcJA0xusfwdg+L1sWnkUVPi
         UpCSadzm+0GzvVOVt8yi4nR7HEmfgPf29QwsfRlFqPhzbNZLXKKvLlfqR2qdq+bBt4On
         HiaJlYzGm7UkkcCQtOwR83PhylvSpa5xm/i+LkTqR/8D8WhFX7RpwpJikdZegX95b+B2
         hmHRTQRoSB1m2linnZ0gTi6Ik8fPm9KjrrOmHVAR1LD8ODpXN6uI6XddUDD4q3sj9TGw
         GMmw==
X-Gm-Message-State: AO0yUKVHzwlAexksGN2f1ta5CeVdPVUr9jOQvmk7S3KvkB9hzBbzw/hd
	lrF0exSLVWBq1Czduu9k3FmD7XY2yTs=
X-Google-Smtp-Source: AK7set+KUaTd2pwAs9VoI1y3usrW6VEtyvqAAu4dcdKAWgt6F63KUQJDtMGVZzSRoawjAH3zFLYjMA==
X-Received: by 2002:a05:600c:210d:b0:3ed:418a:ec06 with SMTP id u13-20020a05600c210d00b003ed418aec06mr8477454wml.28.1679904759074;
        Mon, 27 Mar 2023 01:12:39 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e313:787e:85a7:511b])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm6186380wmq.43.2023.03.27.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:12:38 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV3 1/4] cargo_common.bbclass: Support local github repos
Date: Mon, 27 Mar 2023 10:12:32 +0200
Message-Id: <e014cfddcd6b82c6dd605291502cc492c476da58.1679904677.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679904677.git.frederic.martinsons@gmail.com>
References: <cover.1679904677.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179141

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


