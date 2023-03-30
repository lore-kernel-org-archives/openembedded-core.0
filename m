Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E84C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.29128.1680191100538166915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MX6PeJy8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r11so19545491wrr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=MX6PeJy8oCh4kQTWznMlfTlRmb7JERgelBoczO0B29lYOZ+jdTMGZzU3d6wxv+vpXd
         EOFiVZKtF/nbGuxIk4LIM51lN2KZJuYHeJpArmiTIIUEng+gRU5IWA+oyIjAScYjU+Yi
         XPXWvospV/lJmpnRjIjlqYaijJNKSOPoRbr/fbcu66d9w7DhlKNs7i3cldgusjrHDlbs
         aDEcHwIogVjlVJZS44PP3jk8YZEU0DWILbIauTyI8/AVslbGe2/0cA0X68Ye/fJItwG2
         MGTyetejNgDnMqG0CuWeKU68qXsr5N+PEfoDmi1wTA+oFb/KCzUPW2tu6EohbF/Hsq/7
         pTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lzaowPBGNyClSitAu7sVLJ9GXQv0xYa51QvIRhfNm0=;
        b=Jo6H1TQwQf4Eh/9251srt32/InLKLDIYMdzCWOr5I5re8qElBCEz6Z+F+zVhnSp6oi
         RIg/0nj3hpMgmnUdl4Hko7xylHTjKnM304MspRPiy8AVSqIzOwTH9qm3VJEFhjo3r2Kx
         0j2Q6ieY6ZW/Z5J/Irksnuaqja/zyrRhLXe3L/AMXlFBu7bwITvSV4ixoWWXK6lkAkD9
         jG4GQsKAJUtWaFXXfRKSUc79huF0hdQucn8Sx2h39oTCGQnDSTQuRuoW0r1i3MNNAUbc
         zwX0jC/Ec+oR2ELf09+zsrbfrOnp/7pYFjfd7eyBhOj3eSVBnNbGn+AbD2ZQbKxXCUMS
         qcIA==
X-Gm-Message-State: AAQBX9cKdObT/DaABcmxXv3VRw7bBZT1izXaC8uSwALKe9B7O0QpxihY
	Ll4MvcL/aX7PTYfML4aKFU/hg4OK//8=
X-Google-Smtp-Source: AKy350aZhciEhVRrZQAtiWiUGQ+Ep1eUr01UbvpaJW53SeuyKr2cbJEY9F4+AmqKSzDZE7nskqBZeg==
X-Received: by 2002:a5d:464d:0:b0:2e5:5439:6b4c with SMTP id j13-20020a5d464d000000b002e554396b4cmr629012wrs.27.1680191098426;
        Thu, 30 Mar 2023 08:44:58 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:c898:b1f6:d5c7:39c5])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm33151056wru.89.2023.03.30.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:44:57 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V5 1/6] cargo_common.bbclass: Support local github repos
Date: Thu, 30 Mar 2023 17:44:48 +0200
Message-Id: <ea287e57d752f05c32c1bfb3d97c64e23997c5bc.1680190966.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680190966.git.frederic.martinsons@gmail.com>
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179338

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


