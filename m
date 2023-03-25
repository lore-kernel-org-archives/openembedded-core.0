Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40355C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:01:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.17973.1679734854156038401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qOXoFMVy;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r11so3897370wrr.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679734852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=qOXoFMVyEZ0JcWBdrzBeCwnt4dLfcxLbPdYWWJA2yQl/0LG3oGTfc0lPfClZ5tCyPj
         jOIrmMrJUA9qD4Z43B9K3bRrslbYJZYy8GlFRsBWp+O0YTN7HwFCBDvWB8PNkkzgNlEt
         r+Ut+DCbZGX2HU5f0Djl1mpQ/bkqCYeKWD9uH6P+iBnJ3AzOyTrmLyQ/rYr5wEy7SOhd
         Efv3QmVMpkHXCm9Ovz/BhULzVUvHX+k1OSIqMzd7sfb3q/PAzdZqHf2MGfF2VB+8/fdj
         8K8o67v1+8LvZp/K1d6s/BZfnNUWR/ep0/hU4hLkymYfS9nECoyHo0fg/4hRsD4iaFBa
         utPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679734852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=wDrxGRhTs5uoCLt8FTmjY7oFHnyLMaKz+cFV4W7EP8zjeWFJjRLi2QIjx37G9LSUFC
         itte8B2XmkLm4pEy93E5iGVziuoL5r4RZFg6xQgVk0iojGZ2OfuhywP+4s9uEUC+2L4r
         V5LoFBlMH3Ev0m4yrEFMfcvgH2e7dLrt2P4j6Gwq4YN5wKHZi26TZl8NtmrUnsHd2MZe
         nFd1MV9VTJgZ2VErdXr9RaBQnYKEHswqim6WKnht2JlCNDNFgP+u5qcXpLROxknbunFw
         gzXIIzEFdoTc92bXFIlXIXXNaw4lVmGUTAaVMh7JlHSnOkrI2c7ewasQmXQdYVEjKixb
         2vow==
X-Gm-Message-State: AAQBX9fOnT+JWOPMlraEqs2SkIMcEIzsu3J97zxJjXiPWuUzpr0GSmea
	VwW63WeSLSQCJymGtEnbK/67/QVg00w=
X-Google-Smtp-Source: AKy350aSTYvFtMwxpeRnE3pkAi61h7m1K9bYvrv1TmwTDYj/czOSNE0xN9ih/HsD/dFeLlRqRXHFlQ==
X-Received: by 2002:a5d:46d1:0:b0:2d2:2a9e:2312 with SMTP id g17-20020a5d46d1000000b002d22a9e2312mr4410074wrs.59.1679734852271;
        Sat, 25 Mar 2023 02:00:52 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:a02e:c702:681f:71a5])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002c56179d39esm20226621wrs.44.2023.03.25.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 02:00:51 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH 1/5] cargo_common.bbclass: Support local github repos
Date: Sat, 25 Mar 2023 10:00:31 +0100
Message-Id: <e014cfddcd6b82c6dd605291502cc492c476da58.1679734210.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679734210.git.frederic.martinsons@gmail.com>
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 09:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179090

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


