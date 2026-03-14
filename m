Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D02F10706C4
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:48:14 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6674.1773481682528646577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cAwSOVIR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439bcec8613so2344194f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481680; x=1774086480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8twc1sOA2/dYC1HHYaHTu+sMn9FX1554xj9jq1GrUlY=;
        b=cAwSOVIR/chvIQK6NbCpCb8hWZYyhrjUkGccrX/Vj35sR1q23OU+nCHXQ96BdC73f+
         keDlQKxRyWNpLoB0H5KRarnrfWYGuT8uj9iHLbnOzKPb5Hw4qYjISrjH/KhieQQm56Fs
         WFDmzUsfH0IJ4bhXC6B6Ckz79WVSMeLZmXmCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481680; x=1774086480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8twc1sOA2/dYC1HHYaHTu+sMn9FX1554xj9jq1GrUlY=;
        b=g2fd02lpAJgB4r3UFG7T6utxMdapw2h9VAsDE3E2sxmUFSraR+D9VWJApHpCl7ksb1
         87SFOFg0onjO5GsC2MvH+Ru5wQSqXOKjgf8I8h3A7sw4ndWgtRZ3lnAk1R8fsWioT3iP
         tyZ0xXfqyYj4BldsukiOKti5dVwgxXGcf5ad19/TTsdJTox28yxqtbd1/8031T5aeqUP
         VgE5siFaWlb9IJHmvfbybRpfmmO973WRQoDw07aJXydMp5SZmdG+lt6Rh9xU2R+FSuZj
         PAYzPkXzArnnSUMOOt7XW0i6ngnkbz3Mi0EPWHvk6eMS6qEGQc6Wja9MKcLJHEwdKxIq
         mfYQ==
X-Gm-Message-State: AOJu0YxE9w8xFCaAD0IFQrj93YkHNhqWwV8nEwSkJWyIrVp0LJ4XxNs9
	7HXqTZV/+rG3idxtGSR2JM2YkXz1FzLG6/KLwftL4/Cb7G+XueZ6aSDXt6DE81cgF1llFKeqZ/M
	/+VoqTG0=
X-Gm-Gg: ATEYQzzwepAG9Z5jYnLQ0rI+REu5SKpD4jysnrZZjiJU1i6FeJvcgu1gaflrsKdaPe0
	X71wekk1hh11AhG0say+kOxnR4K9mzrR5erAYkClH3MlWWc64z/hu0TDXEUxzTjCQWIM4dpgOzq
	vwGuYgULEPrZ2Ib7U4avvjsu7vD0KUTuSz1boPUc/19sbhW91CDzeM1okbYuaoDKBHbOD4cyY8d
	DiXuxVfsgHTwtkOFMVYJxu7MJJoba4CqkM+05jyokkgmeJ5de+yKyLFcR9uaA5JiZ9g3DZCUoox
	bObA+rKLyOnY/W3Lcx1Dlw0xRncqlj30OtNmOEtlXmzRH+aC8Ch0ZEsS9aU0G6PSnEqXIzhftwR
	HLRqvxv6EHRJ5vwbvXifRHu8uGvjRG3APFs+gH1BqhqgSgrCjiY2uXB28ByuWc3O1L9+AC1uaNA
	iLIlmiqNqTGbnh+PjXeb5AAQukXLDUUoXNCCa1MFrjNWb87vHeIzs=
X-Received: by 2002:a05:6000:2503:b0:439:cee7:714f with SMTP id ffacd0b85a97d-43a04dce713mr12153900f8f.53.1773481680236;
        Sat, 14 Mar 2026 02:48:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26554680f8f.20.2026.03.14.02.47.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:47:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] sstate: Drop unneeded SSTATE_MANMACH variable
Date: Sat, 14 Mar 2026 09:47:54 +0000
Message-ID: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233076

This variable doesn't appear needed and just confuses the code, remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 13 +++++--------
 meta/classes/toaster.bbclass       |  8 ++++----
 meta/lib/oe/sstatesig.py           |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 3b2e307134e..fec4d88c4cf 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -9,7 +9,7 @@ SSTATE_VERSION = "14"
 SSTATE_ZSTD_CLEVEL ??= "8"
 
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
-SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
+SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_PKGARCH}-${PN}"
 
 def generate_sstatefn(spec, hash, taskname, siginfo, d):
     if taskname is None:
@@ -96,8 +96,6 @@ SSTATE_ARCHS = " \
     ${MACHINE_ARCH}"
 SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
 
-SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
-
 SSTATECREATEFUNCS += "sstate_hardcode_path"
 SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
@@ -148,8 +146,7 @@ python () {
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
     elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") == "all":
         d.setVar('SSTATE_PKGARCH', "allarch")
-    else:
-        d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
+    # Fall back to the default of SSTATE_PKGARCH=PACKAGE_ARCH
 
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
@@ -320,7 +317,7 @@ def sstate_install(ss, d):
 
     # Append to the list of manifests for this PACKAGE_ARCH
 
-    i = d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
+    i = d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_PKGARCH}")
     l = bb.utils.lockfile(i + ".lock")
     filedata = d.getVar("STAMP") + " " + d2.getVar("SSTATE_MANFILEPREFIX") + " " + d.getVar("WORKDIR") + "\n"
     manifests = []
@@ -353,7 +350,7 @@ def sstate_install(ss, d):
     for lock in locks:
         bb.utils.unlockfile(lock)
 
-sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX STAMP"
+sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_PKGARCH SSTATE_MANFILEPREFIX STAMP"
 
 def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer
@@ -520,7 +517,7 @@ def sstate_clean(ss, d):
     stamp_clean = d.getVar("STAMPCLEAN")
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
     if extrainf:
-        d2.setVar("SSTATE_MANMACH", extrainf)
+        d2.setVar("SSTATE_PKGARCH", extrainf)
         wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
     else:
         wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index af7c4578088..10c728885ae 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -343,15 +343,15 @@ python toaster_artifacts() {
         d2 = d.createCopy()
         d2.setVar('FILE', e.taskfile)
         # Use 'stamp-extra-info' if present, else use workaround
-        # to determine 'SSTATE_MANMACH'
+        # to determine 'SSTATE_PKGARCH'
         extrainf = d2.getVarFlag(e.taskname, 'stamp-extra-info')
         if extrainf:
-            d2.setVar('SSTATE_MANMACH', extrainf)
+            d2.setVar('SSTATE_PKGARCH', extrainf)
         else:
             if "do_populate_sdk" == e.taskname:
-                d2.setVar('SSTATE_MANMACH', d2.expand("${MACHINE}${SDKMACHINE}"))
+                d2.setVar('SSTATE_PKGARCH', d2.expand("${MACHINE}${SDKMACHINE}"))
             else:
-                d2.setVar('SSTATE_MANMACH', d2.expand("${MACHINE}"))
+                d2.setVar('SSTATE_PKGARCH', d2.expand("${MACHINE}"))
         manifest = oe.sstatesig.sstate_get_manifest_filename(e.taskname[3:], d2)[0]
 
         if os.access(manifest, os.R_OK):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index ef687f5d417..1e07c71e944 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -491,7 +491,7 @@ def sstate_get_manifest_filename(task, d):
     d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + task, 'stamp-extra-info')
     if extrainf:
-        d2.setVar("SSTATE_MANMACH", extrainf)
+        d2.setVar("SSTATE_PKGARCH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
 
 @bb.parse.vardepsexclude("BBEXTENDCURR", "BBEXTENDVARIANT", "OVERRIDES", "PACKAGE_EXTRA_ARCHS")

