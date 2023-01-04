Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADAFC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.15530.1672847242002948597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KeoCVRxk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so29845881wma.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbtd9hUsrEmnaMofo+tU8eDm/LIRVOKHL4+jnI5juUU=;
        b=KeoCVRxk0nvLolUUfSVjhuC1Lxo+rftrVTQVz6TY1p2y6HJqABEid1+Zw9SMa8oOsX
         MKqfWBVc9bpCKP/JkCoAoDZj/JaL/el1sIaM2pgbz2N9tE6hQHBOzS05+BnFgFAlDhY6
         LamqNwWP0PhSkqo8AA+oEXdQjaJPiXiVjhGQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbtd9hUsrEmnaMofo+tU8eDm/LIRVOKHL4+jnI5juUU=;
        b=dl9jKnl2kjYlCQX6UC/Td7AsYTdrOWpfe+7GdXzjNt8tdtvRXQVIqMp+Lw0dWOJ7TB
         TNEHBGd2zzDM9cSpN68TKWtpan2De4Ho0YUzd5BW3dflCbEJrzURuDZDwXAsRe1hTYPV
         xs0IZHvY1X6e1FKXyXQFeW3qGBNmlBKSdhZcZigFZUwGFm/PX+sLxzo9L5ZAwpcCh6tf
         nwuA5fHrHLANMePi2UEpTy7CLslBG0Un2SYtGZnvWVZ/sW5YIL7xt/t0kxEYfp6vP9Lm
         D5WxN7Vun8qZZp2YDT/ocbGPDSJ/ayS9lr9C/4ctnEZYH5dvjp2knfGfGasi9eCpZYen
         r6nw==
X-Gm-Message-State: AFqh2krvnk/9Bc3BmeIJ+tOdlI5XzflGoGwqT1Z5IffzGhlhaCKC73c7
	9k1JeggufCSShvxdWEGT8E3/wmlUrIkz5Dqs
X-Google-Smtp-Source: AMrXdXvL6EpZY0QqbWOQIxwqrOzPbH64CchHn7fR0MiIxOsCE/iEDXqLJj6fBnn2LXIfMTiS/seusA==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id z18-20020a1c4c12000000b003c6e63e89a6mr34168212wmf.2.1672847240236;
        Wed, 04 Jan 2023 07:47:20 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] package: Move mapping_rename_hook to packagedata function library
Date: Wed,  4 Jan 2023 15:47:11 +0000
Message-Id: <20230104154714.1168535-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175494

This function is used by the packaging tasks/classes and makes much
more sense in the packagedata function library.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass     | 13 -------------
 meta/classes-global/package_deb.bbclass |  2 +-
 meta/classes-global/package_ipk.bbclass |  2 +-
 meta/classes-global/package_rpm.bbclass |  2 +-
 meta/lib/oe/packagedata.py              | 10 +++++++++-
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 5c250776f8d..d334da6fb3c 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -607,16 +607,3 @@ python do_packagedata_setscene () {
 }
 addtask do_packagedata_setscene
 
-#
-# Helper functions for the package writing classes
-#
-
-def mapping_rename_hook(d):
-    """
-    Rewrite variables to account for package renaming in things
-    like debian.bbclass or manual PKG variable name changes
-    """
-    pkg = d.getVar("PKG")
-    oe.packagedata.runtime_mapping_rename("RDEPENDS", pkg, d)
-    oe.packagedata.runtime_mapping_rename("RRECOMMENDS", pkg, d)
-    oe.packagedata.runtime_mapping_rename("RSUGGESTS", pkg, d)
diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 99e377b4551..5aba3837bde 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -174,7 +174,7 @@ def deb_write_pkg(pkg, d):
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
 
-        mapping_rename_hook(localdata)
+        oe.packagedata.mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
             # dpkg does not allow for '(', ')' or ':' in a dependency name
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 9b75f5cf1c3..b4b7bc9ac27 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -167,7 +167,7 @@ def ipk_write_pkg(pkg, d):
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
 
-        mapping_rename_hook(localdata)
+        oe.packagedata.mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
             # In debian '>' and '<' do not mean what it appears they mean
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 16631688b10..85d0bd7fce9 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -365,7 +365,7 @@ python write_specfile () {
         translate_vers('RCONFLICTS', localdata)
 
         # Map the dependencies into their final form
-        mapping_rename_hook(localdata)
+        oe.packagedata.mapping_rename_hook(localdata)
 
         splitrdepends    = localdata.getVar('RDEPENDS') or ""
         splitrrecommends = localdata.getVar('RRECOMMENDS') or ""
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index efa600ddcd3..162ff60d72f 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -340,4 +340,12 @@ fi
         and not bb.data.inherits_class('packagegroup', d):
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
-
+def mapping_rename_hook(d):
+    """
+    Rewrite variables to account for package renaming in things
+    like debian.bbclass or manual PKG variable name changes
+    """
+    pkg = d.getVar("PKG")
+    oe.packagedata.runtime_mapping_rename("RDEPENDS", pkg, d)
+    oe.packagedata.runtime_mapping_rename("RRECOMMENDS", pkg, d)
+    oe.packagedata.runtime_mapping_rename("RSUGGESTS", pkg, d)
-- 
2.37.2


