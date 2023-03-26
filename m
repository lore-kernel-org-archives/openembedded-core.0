Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088B0C77B6D
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:56:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11691.1679842575379242046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SHK6d/Hf;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id l8-20020a05600c1d0800b003ef6708bbf6so1550611wms.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=SHK6d/HfunIZjs4WfgAZtkkdGtUpzuxMq6W9ZB4gVAmnYr940+DMA8FB+/r2zArhaL
         hfzQ9EpQigRymy2rQ4yGwc7NlxNe6tGkiD4rIZYBT45DUhR+43nw2fs8uFIRNNDhTOLG
         OWCVyUnrUDSSvAzm6AYa6tKOUKQLRxYxSbZpAHtEVifijhghKMj7vCIBUwmBtzZ6HEzq
         /fVZSFAiz0i761OKKyb3CQe07VKw8D3RuIOyGoANI/2xWwqSkadnYm6utxJ3sCN7IyHh
         L4Aix2Z7/8AN4uF4iGf15ALn90ryGNXZGwR2Vid5JknsBc0wbAtvPH/PP2QLGzsrg/TU
         imiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=kFfZ+N9WYcpl07GHW1dW4U6C3HEZn6esh2PzwGPpd4q7Xkh9zW9mE4CA49bpQ3VC6N
         36QEwhtLTCKfhIbb7iYHiV9Mrzk2n4bqIlUcTDSAnaEtBCJhxijYA1AANtEzWoM2QHq5
         tToYhPlzHiQU42V3kP1fgdfMmx5jOaDaeM+Qa43CbztyU0eG4LXRY7Row9Prgiytbfw9
         lJnVwDnb1bv13JkOHycGAso21woT+wxnZER2DaMa1EIsZ6B04i4TAzSriIe83cmYDHXu
         cUnJBzt+83s09Zr1v6nH+cvr0Z1rO+iSGOxdXTqgzZ/60XJ3m4H5+X1fE2MRVroKNQeO
         bKKg==
X-Gm-Message-State: AO0yUKWXhux/0YeufgEON8Lb6QICW5Des/JgkiR1vww6GfJqb+sM1MjV
	OUWM1ew0JXvVvI0pByQ2zkaXGMyAt7Q=
X-Google-Smtp-Source: AK7set8r1gSZMNNaQqM5y+UjgSOD9eSVOlzTcqXe9hVVcU2o4HKuEurjVspeZjoRjPA2wxifApYzgw==
X-Received: by 2002:a05:600c:204:b0:3ea:d620:57a7 with SMTP id 4-20020a05600c020400b003ead62057a7mr7487479wmi.8.1679842573314;
        Sun, 26 Mar 2023 07:56:13 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:af58:462f:1cbf:cab5])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm10797549wmm.36.2023.03.26.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:56:13 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV2 1/5] cargo_common.bbclass: Support local github repos
Date: Sun, 26 Mar 2023 16:55:59 +0200
Message-Id: <e014cfddcd6b82c6dd605291502cc492c476da58.1679842454.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679842454.git.frederic.martinsons@gmail.com>
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179122

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


