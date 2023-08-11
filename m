Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589BBC001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 13:04:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.42231.1691759091405141244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 06:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SfNVjyLI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so1750350f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691759089; x=1692363889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xI+hQexzq/SPuOZD6Unv3YCEclDXWo7VxOky4GzGC+I=;
        b=SfNVjyLIeT/cxneo5yXj9hVIrNPL9DsNaGPKb/STYjfPJrW+XDMQzjta+AhIx6Hg/7
         BSRDenkFvdzSdOqSufD1e/gyCQeTG3Wv9yyh1xhGXG5ItF3lVoQtMeiHafyolUWPXhnh
         N9jyFG/ads+RkOIEUasqjyWOU8BvR1ZsXRDn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691759089; x=1692363889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xI+hQexzq/SPuOZD6Unv3YCEclDXWo7VxOky4GzGC+I=;
        b=By7iNFI6Y3LCd6xW0c6G+zu2GodU3Uhcsi0tscjNvHBqDfdQVEuHnkSgZgYxgvQ6LE
         uU6xHAmxrT8Flrly7ovsgEM86Kr41kw5sweII6HXSVStAdb5RIHyuaLsPo9YoGH7/sBn
         VCDT9mcquFpivYpGXuTK5ucNE6a8nv71y1k6UMd1bcU4s0c1K3JXZEJMn724azqlRYem
         MD+QWbcKWAdtBi4tvI7/B4QUt1QwIX1Gsg17hN3xlR7AozuE2NGkukFOI77XNyWOd0oo
         w1Z0qIyMLKptpVsURLvlAagVsRdQibYv3A08L/l6KHEWg5VLS7ugXy8F6H/nQU5gtbvT
         kCoA==
X-Gm-Message-State: AOJu0YyLVo7sgtiT4ucgj3nUJQaETI43c1g9VOxYhDN62iGhBxok18Y4
	/JI5WZYPsePI99UB7JHf3M6ijw9e1RiQCwx/J+A=
X-Google-Smtp-Source: AGHT+IEWTf6vcT+bn3uTLZA0KyIscf170Udf7acdBxMdRmO6mG95m8JtlT+euP+P4VJtKu1DGeUYAg==
X-Received: by 2002:a5d:5443:0:b0:314:748:d59d with SMTP id w3-20020a5d5443000000b003140748d59dmr1472568wrv.27.1691759089480;
        Fri, 11 Aug 2023 06:04:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b003fe17e04269sm5165752wmj.40.2023.08.11.06.04.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 06:04:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base/package: Move source revision information from PV to PKGV
Date: Fri, 11 Aug 2023 14:04:48 +0100
Message-Id: <20230811130448.29263-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 13:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185841

Source control information being present in PV used to be a hard requirement
for bitbake to operate correctly. Now that hashes are a required part of task
stamps, this requirement no longer exists.

This means we can defer the hash pieces to PKGV and simplify PV.

Use new bitbake fetcher API to inject the source revisions directly into the hash
allowing removal of some horrible code from base.bbclass and avoiding any hardcoding
about how SRCREV may or may not be used.

Use that API to object the string to append to PKGV and append that directly.

The user visible effect of this change is that PV will no longer have revision
information in it and this will now be appended to PV through PKGV when the
packages are written. Since PV is used in STAMP and WORKDIR, users will see
small directory naming and stamp naming changes.

This will mean that sstate reuse through hash equivalence where the source
revision changes but the output does not will become possible as the sstate
naming will become less specific and no longer contain the revision.

The SRCPV variable will no longer be needed in PV and is effectively now just
a null operation. Usage can be removed over time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass    | 26 +-------------------------
 meta/classes-global/package.bbclass |  6 +++++-
 meta/conf/bitbake.conf              |  5 +----
 3 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index cbda8d12f09..271ff13d62c 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -130,7 +130,7 @@ addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
-do_fetch[vardeps] += "SRCREV"
+do_fetch[vardepvalue] += "${@bb.fetch.get_hashvalue(d)}"
 do_fetch[network] = "1"
 python base_do_fetch() {
 
@@ -606,7 +606,6 @@ python () {
                     bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
                     raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
-    needsrcrev = False
     srcuri = d.getVar('SRC_URI')
     for uri_string in srcuri.split():
         uri = bb.fetch.URI(uri_string)
@@ -619,24 +618,17 @@ python () {
 
         # Svn packages should DEPEND on subversion-native
         if uri.scheme == "svn":
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
         # Git packages should DEPEND on git-native
         elif uri.scheme in ("git", "gitsm"):
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
         # Mercurial packages should DEPEND on mercurial-native
         elif uri.scheme == "hg":
-            needsrcrev = True
             d.appendVar("EXTRANATIVEPATH", ' python3-native ')
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
-        # Perforce packages support SRCREV = "${AUTOREV}"
-        elif uri.scheme == "p4":
-            needsrcrev = True
-
         # OSC packages should DEPEND on osc-native
         elif uri.scheme == "osc":
             d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
@@ -645,7 +637,6 @@ python () {
             d.appendVarFlag('do_fetch', 'depends', ' nodejs-native:do_populate_sysroot')
 
         elif uri.scheme == "repo":
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' repo-native:do_populate_sysroot')
 
         # *.lz4 should DEPEND on lz4-native for unpacking
@@ -676,21 +667,6 @@ python () {
         elif path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
-    if needsrcrev:
-        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
-
-        # Gather all named SRCREVs to add to the sstate hash calculation
-        # This anonymous python snippet is called multiple times so we
-        # need to be careful to not double up the appends here and cause
-        # the base hash to mismatch the task hash
-        for uri in srcuri.split():
-            parm = bb.fetch.decodeurl(uri)[5]
-            uri_names = parm.get("name", "").split(",")
-            for uri_name in filter(None, uri_names):
-                srcrev_name = "SRCREV_{}".format(uri_name)
-                if srcrev_name not in (d.getVarFlag("do_fetch", "vardeps") or "").split():
-                    d.appendVarFlag("do_fetch", "vardeps", " {}".format(srcrev_name))
-
     set_packagetriplet(d)
 
     # 'multimachine' handling
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index e8055a9cdc5..7f55b123c4e 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -316,8 +316,12 @@ python package_get_auto_pr() {
 #
 
 python package_convert_pr_autoinc() {
-    pkgv = d.getVar("PKGV")
+    # Expand SRCPV into PKGV if not present
+    srcpv = bb.fetch.get_pkgv_string(d)
+    if srcpv:
+        d.appendVar("PKGV", srcpv)
 
+    pkgv = d.getVar("PKGV")
     # Adjust pkgv as necessary...
     if 'AUTOINC' in pkgv:
         d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 599bbc4ba85..c7ada2c49e9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,10 +735,7 @@ SRC_URI[vardepsexclude] += "\
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
-AUTOREV[vardepvalue] = "${SRCPV}"
-# Set Dynamically in base.bbclass
-# SRCPV = "${@bb.fetch2.get_srcrev(d)}"
-SRCPV[vardepvalue] = "${SRCPV}"
+SRCPV = ""
 
 SRC_URI = ""
 
-- 
2.39.2


