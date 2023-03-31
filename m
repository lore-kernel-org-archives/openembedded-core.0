Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73873C77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.48110.1680241534169424006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fBRXdHhg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso14649832wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=fBRXdHhgzqODY+TtcwTeL1pnlBRTq/TUDzHkDyiRfUQQogzuUGoatKAoq/k58blJIc
         Y1Z9KxR9vA2K4KRenx02VbjxYWMF006fJkZnZgyWLK7y0bKEpwgHcRBpNl9z/ZZyMYCN
         erEdRU6dZY4c5Z98GhoSYyWWQlqx0ZbSWxUlxT4Bk9ORz/Ta0sbdafNee0dB8L8j/a8y
         zI0f5kgq0NE80y/kkZ3L5+iIis4FOVXBOEkok38SgSRs2k75OHDyeMKyC+hZI9OYHUn7
         c+M1gvl7XjPrC4Y3NF+jmElr9WIrpxPqbSYthapPa6XDApkb41oIYd5CMiWwUzlKOIIB
         NvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=3NF1LbdI0K8yCGQQSuY2f0De+iEAaXnxEk4jQ7xaz5MM286w742+pSHJ4B9tLhVnLm
         hQynkRRurPAH44tun40G6AEXyqb+fL7sA+AlsZOY43RW5n7ZM0RA3NIzd+wZx4LGIo4p
         6l7U+Lf6LyfPSSZozYBugKG22665mRtYlxLuliPyUBd0QlmQJbAEMXWxhT1k/o6y9sOW
         X63VkLods6Ldx+NWQ23Zti+5RCC+FYBw4CvAziWrtVfpOYnHDDq4uj4Cjyj1z+cLHb5Q
         VARofEy/gP9jEHmv54WzC8qGHtmnw0WhYNomKp35rk/hpZ2BEklxLNelZH+LrdsNMgpF
         Jd5g==
X-Gm-Message-State: AO0yUKVhZp2BWtjdrFhyf7orpH79+Zp95zPyWndSmg+hGfhYdutqSEB0
	pM705x788Ef+pR8gFs6lt6Ao6fHUv+w=
X-Google-Smtp-Source: AK7set+lBmenT2fVJUgMjs5LGxd4CnlGEfGhrq7hY97xBTIzZfyRGw5PG6SmxFt7Iwv/gM9O0HGcxg==
X-Received: by 2002:a1c:6a13:0:b0:3ed:ec34:f1 with SMTP id f19-20020a1c6a13000000b003edec3400f1mr18812416wmc.35.1680241531966;
        Thu, 30 Mar 2023 22:45:31 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:31 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 1/6] cargo_common.bbclass: Support local github repos
Date: Fri, 31 Mar 2023 07:45:22 +0200
Message-Id: <ea287e57d752f05c32c1bfb3d97c64e23997c5bc.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179394

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


