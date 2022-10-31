Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF3FA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8158.1667216859470766473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WQUxqApx;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j15so15596220wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8t431kAywv13IkBs6xw+a2qvmVt0M4V1XdgpNer+Skw=;
        b=WQUxqApxJRzf7EGUNHmPx53Vp5xd2mjlDCQVyveTFmTWQYTWfsMqszal6xEkNUkKUr
         tJ7NvP6LyrOAuSRX8gLQsuNutAKaRgxZJkUBos66WHZmB7kub1gXGLThZybMsa4g8K8z
         NbBAzOAsVzKlyzddZxz8T5eenPAj+8GmQkYCmqlT6IXWpXUf5jkfm9AYPxq413AOHz7G
         dY2wWx+AddDOOlaxSku/ioDWPkxOhtKiTCMlDy9wNipbb2lsbZgX6vLGyizI4r4hUhbQ
         Ij1WVO75uNGJ0hFr0cXB8vd6W/kmdObnRNXPHeg71kxAWY5HwdpiqtbWsY0w7vXYwr8u
         TDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8t431kAywv13IkBs6xw+a2qvmVt0M4V1XdgpNer+Skw=;
        b=Y7iE7kWLyufCn0rt2t0uHM1vG/kyH6bjaMsQppWmzL16ox19BAOWAFLH5/0uSFkEKz
         X4h582/xL+YQ5OezPJGSmne0yc8aBYCFOB5qiDz7ctr89ZP1DmJO5DjRQLdSMmm+3KC+
         GkKSZwbo7OtZLKDgtjIq7wc9ZtFhDv9CbhnBCqi1n34/0YrRjZSc258uVPLMUE9rO+on
         POuSwSSM+mkswkMVk6yVUf46tWMNU5lpFnuFVzg2x74UNE3/TcwUlSr7btV9BLHBjq7j
         vNHyDL6CZqxuv81dLSGdPWPE+07QMHepBohwCCR16KLqiqw6Yus2XF1rkY165HAsLhQ6
         9r1w==
X-Gm-Message-State: ACrzQf2zXLpW2chAAlHLDJFp5myLRaEmu6Lpq0Oegqf+LLf3eROnFFU4
	O7zs5ajCt5Es6umrCk16vCVbGn+1iVY=
X-Google-Smtp-Source: AMsMyM46PTsb5PtpWLO6tehDr6rAh2dNlaz8UfCDaYFIX/h0xfj8GNCtdjGWwmfj3ltPRPClnKn28A==
X-Received: by 2002:a5d:4572:0:b0:236:ccbe:3513 with SMTP id a18-20020a5d4572000000b00236ccbe3513mr2716490wrc.497.1667216857812;
        Mon, 31 Oct 2022 04:47:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a class to generate SRC_URI crate lists from Cargo.lock
Date: Mon, 31 Oct 2022 12:47:07 +0100
Message-Id: <20221031114719.2725967-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172303

For better or worse, more and more rust components are appearing that do
not include their dependencies in tarballs (or git trees), and rely on cargo
to fetch them. On the other hand, bitbake does not use cargo (and quite possible
won't ever be able to), and relies on having each item explicitly listed in SRC_URI
with a crate:// prefix. This however creates a problem of both making such lists in
the first place and updating them when a recipe is updated to a newer version.

So this class can be used to perform such updates by implementing a task that does it;
the next commit shows the outcome for python3-bcrypt (which has been tested to work
and produce a successful build).

Note: the python script relies on tomllib library, which appears in Python 3.11 and
does not exist in earlier versions - I've tested this by first updating python to 3.11-rc2
in oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cargo-update-recipe-crates.bbclass        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes-recipe/cargo-update-recipe-crates.bbclass

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
new file mode 100644
index 0000000000..f90938c734
--- /dev/null
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -0,0 +1,41 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+##
+## Purpose:
+## This class is used to update the list of crates in SRC_URI
+## by reading Cargo.lock in the source tree.
+##
+## See meta/recipes-devtools/python/python3-bcrypt_*.bb for an example
+##
+## To perform the update: bitbake -c update_crates recipe-name
+
+addtask do_update_crates after do_patch
+do_update_crates[depends] = "python3-native:do_populate_sysroot"
+
+do_update_crates() {
+    nativepython3 - <<EOF
+
+def get_crates(f):
+    import tomllib
+    c_list = 'SRC_URI += " \\ \n'
+    crates = tomllib.load(open(f, 'rb'))
+    for c in crates['package']:
+        if 'source' in c and 'crates.io' in c['source']:
+            c_list += "        crate://crates.io/{}/{} \\ \n".format(c['name'], c['version'])
+    c_list += '"\n'
+    return c_list
+
+import os
+crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
+for root, dirs, files in os.walk('${S}'):
+    for file in files:
+        if file == 'Cargo.lock':
+            crates += get_crates(os.path.join(root, file))
+open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(crates)
+
+EOF
+}
-- 
2.30.2


