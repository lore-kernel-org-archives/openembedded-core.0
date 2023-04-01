Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8352AC76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.17483.1680341457001012790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=POzg8OKg;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id e18so24688964wra.9
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=POzg8OKgIPgqybNWLw2sQJvd/lrkZPYCmmPfcHlj8l3unXKCt3tX1+BBib+Ac9DY0V
         2EMoxixoEIr0sV4LT8QCW0JabDmUK9vEw2mmoZ81UGXoiKSWbJzxhj4f7rZueASQfn1U
         IeJTg5juvse9RR7Tq8HsPvspeSHjjNujMUXShrkwDgBrnu757EJHayMVIlg6vntH11Y+
         GBYbNGVA34PHOho7EW2Y7pcsgSDXxBCIUUrR6kNysMEhHKLinvFCXD91WNVMGl7fbsMS
         PJT/NrKTUrjYYU4jispudfPG/4FXwZmCtHSR65Qks0QU5c73jaWtcXi3m2QEUglsDOs5
         xOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=o5AHd8hbgoVvjEXnc2qQZCy2ql+9Volsxrf/D43gvsLglDa+tGvvfg26/SFdIHXkXm
         TJr/dQLGIW+C4cd//NNrcwRt/UZH31vC1GVaDvzqISghUwd3XC2QSsxFOFtxaImmtauf
         xOwScWCKbYkP8NWBZI1XGOG3vD/vk2+gFMNx+KNrBFXOcp5P7lRa5EHM3L/boGPXbKJe
         uTDGIXdvTI1P32s53B/FzllYOwzokvQJ0fDUv6BjWE7RXadT05HeF4qAzNdJC1oyYGa3
         Szuf8+8wcb/jy9Vq9SyZzkkGzxfjQiPnViwxJf7pQ9NFz4f1UxHdaRZzI98vMm7k+gxb
         nTwA==
X-Gm-Message-State: AAQBX9cNq8pOA/ZIQK7iAaU7qNTvPzNDa26kLAVcc9aDF1BpzBtfmnqr
	LblKdRp4rDroZM4Q/NOLZPVlfYkqpwA=
X-Google-Smtp-Source: AKy350ZCD1EDwq+fFrEtLmFrq1ktzUmADD9V1ovsMA4+MVW5Q6WGwya6LDNEYEX85Lm1UH4z97jxYw==
X-Received: by 2002:adf:e748:0:b0:2e5:8874:d883 with SMTP id c8-20020adfe748000000b002e58874d883mr4415842wrn.8.1680341455139;
        Sat, 01 Apr 2023 02:30:55 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:54 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 1/6] cargo_common.bbclass: Support local github repos
Date: Sat,  1 Apr 2023 11:30:46 +0200
Message-Id: <fe2b90021b535531a6500ceb123d45b088de364c.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680340685.git.frederic.martinsons@gmail.com>
References: <cover.1680340685.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179460

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


