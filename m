Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83833C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:55:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.313.1664560528986224232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jfU0LNoz;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r6so7968207wru.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=8t431kAywv13IkBs6xw+a2qvmVt0M4V1XdgpNer+Skw=;
        b=jfU0LNozzcpbDGPV0fgfnNwk8W8S9kI9ZzWTL95VrTXLsb4qR/nhtHgWljmTp1cmA+
         54xfClan+YhNznCJFrmc60M8WCPXArcSJ78fL2iC2y74ptCeS2jTLD2wfeOVg47V30eM
         smtqhKHTedO/iTM26a433yny6dpLBfyM2VYcy6U04HxUQR0rYmlj88Pn5gVV5tw7u0mF
         fz149czOYIb7giZPvATPyslyZZ0637pv1qUV5DfDBJJAAQkGZhhjOct6VBaDe+/1egXa
         3IKVXu5cg5opKcOb82fe/Q8ZHaS9aD/2Ui9G3e3s9j215Fsdq1Acu7QtlAMJWd+VOGW6
         RFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=8t431kAywv13IkBs6xw+a2qvmVt0M4V1XdgpNer+Skw=;
        b=vEXhGzivasO+5epFIuLWla55uXqyQSOuU6De/Z7ZT0v8d5r2D5m/EXpCcB6nGYHQ+D
         XhwcO6sCfl51BTpUOBaxxf7Nsvh7EorLbw8xdmEH61mOPXSnmy2hNFrDvsGLaxekYJCi
         GZVw7VQH7M5qYMPl6DVykHteXPB3UFTUyJwUm/6xTHgkrb27UV7AzAXdt9rfRhcVfHlo
         xGkgbuKU5LTJIZwJS8Fi/pa4LaJTlLoyvhQB1/XzKgihJP3VNvzD+W7sVjaC68e4cD+4
         EPufLzxIPNWKiESs2O22dtsADCtpVA1iv3JX9Go05DcGIgx/z+L8yf4RfibMW+6YqRWx
         dZVA==
X-Gm-Message-State: ACrzQf2vWcbAyQm8Of5Jpx2sFlTjofZnScKgLTaneyOX+AMa05jRyUbm
	A8k/2g3G2cXwNuuCvBfHW7Z8bffachA=
X-Google-Smtp-Source: 
 AMsMyM6bPkW5ZQkN0Zs/SzwsAFb9GoXGBWttE+372fStfnWm0OWXUlZElJtwLMk0W3tW1aeD1cUwIA==
X-Received: by 2002:a05:6000:1ace:b0:22b:113a:461 with SMTP id
 i14-20020a0560001ace00b0022b113a0461mr6229011wry.545.1664560527255;
        Fri, 30 Sep 2022 10:55:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a1c5459000000b003a5c7a942edsm7420797wmi.28.2022.09.30.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:55:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add a class to
 generate SRC_URI crate lists from Cargo.lock
Date: Fri, 30 Sep 2022 19:55:19 +0200
Message-Id: <20220930175520.2850089-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171236

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


