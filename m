Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CBCCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:46:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7880.1778222769955152414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iY+U4pRA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso14550795e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778222768; x=1778827568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PW6z455AFqLBtBfZ40cJyz9nONaM1g9D14BZbGuC4t8=;
        b=iY+U4pRAJVaiXz8/X72/x8DtugihPWq4mvyZ8oS2DWqjhh1x/MeJTWHSxoZwHtkyya
         rinY+3iOV99zBGpAgxqrn1h5KRALBKHhQI2FyUvOx490UPNwcTtBX9Uo6X6lFqfc0KcH
         hR8FeJuBD6k1ZETOZiTcDuHlw4BQmx2lFES+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222768; x=1778827568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW6z455AFqLBtBfZ40cJyz9nONaM1g9D14BZbGuC4t8=;
        b=UvVAXvZJcZl+SYn2YdS8inyQ9icP0vgP8Lg7zn9GPaAHnvewQuctJaYfxEkVRoAkPN
         H7yX0IHhfODxESD+fG5KG89oW68ni6uyGNHY6OBVwvycwgQ7cHw6j2LDC9uwcz1fxxim
         /HQH9oCFsZ4fvj1ckTRVb05VcOTGQTcdqytE2fGPWn1EpaSnez/ETnKnG+tL3WuT6Lai
         NRUBz6mHhGUesWl9+gDj1Y4ZVeCmNNHTDf6QIyZADU+2ZYQXX6RKIUxseX20Y4cokZcT
         KBtQrReHcD4IPSBSfz142g0OMEFNrviOHVmvbctYA+Ug60dko5Lzd0uHPhTGyjYvBHfG
         qYoA==
X-Gm-Message-State: AOJu0Yz/jeYy6FZUtGELkjYFhVq9iz6kWEFz6nyBYjVgTI5krNbcmAhA
	/gpk91aYeQnITdjBpoxugpZV+fvhS9zQTGc7AuQqhMfnkTmAvRsWSa0aPdj5TbNwUjryeMTIwWj
	Tzfsp
X-Gm-Gg: AeBDieton7vW255GXUIdhEgQKUm3U/LLG9tx+2TBDWobudlVMH8KEvUk60BEWFa1Kps
	jC/v96H/SDWjhF+CYqTUVoG1CohEe5v7GcRwtjoFsVefp++mHe22P+MH9oqWILduhYgtz7zPAWQ
	V72mNwDzv1IPRA+Yzt70+msQaE2syhB4t2wGVSOLkV8NiVhn/ZqlVhJDlC3BSNErfEWigSX7wH4
	lxhk9JYeBNc34EGdMvQuRStCw0dVes2K0zf6GeVfbLqpB+++odUhXlvS/tvAVmEVnI09h1Rtzz+
	VBhTMJHsEvYDRxPTlkDH4EgB5KKLJxuNvvOsOWrQrYmIW3q7vAPj2q6MMTNKeU8dpgcYnVe+sSQ
	wmWZljh4H4S1xYrBvfdsHfUASu4kqqLJmKvSRRd5LB/xiywpNOpktmfTKCK0WB9l0qDMiU8XAIB
	WfA9RFOvOA1DFZWodO1G2JpxVzl94AHGadCSkc2WzIWVosaowCgIlL
X-Received: by 2002:a05:600c:a405:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48e51f54230mr148473135e9.26.1778222767285;
        Thu, 07 May 2026 23:46:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:27b8:4685:7ef9:165c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eddff3sm17831235e9.13.2026.05.07.23.46.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:46:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] utils: Handle unexpanded variables in DISTRO_FEATURES
Date: Fri,  8 May 2026 07:46:05 +0100
Message-ID: <20260508064605.776699-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236641

If you have an unset variable in DISTRO_FEATURES, very strange things appear to
happen. Currently, this shows up as seccomp appearing in PACKAGECONFIG for
gnutls-native which isn't what the user configured.

The issue happens if you have a variable in DISTRO_FEATURES which cannot be
expanded.

Add some code to detect, warn and work around such a thing. Create a function to
allow this to be done in one place.

[YOCTO #16275]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/crosssdk.bbclass  | 3 +--
 meta/classes-recipe/native.bbclass    | 3 +--
 meta/classes-recipe/nativesdk.bbclass | 3 +--
 meta/lib/oe/utils.py                  | 9 +++++++++
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index f7be3a23bf6..6246c09de4b 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -16,8 +16,7 @@ PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
     # set TUNE_PKGARCH to SDK_ARCH
     d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
-    defaults = d.getVar("DISTRO_FEATURES")
-    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
+    oe.utils.set_class_filter("DISTRO_FEATURES", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 6b334e782a4..b357b2da7b9 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -126,8 +126,7 @@ python native_virtclass_handler () {
         return
     bpn = d.getVar("BPN")
 
-    defaults = d.getVar("DISTRO_FEATURES")
-    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVE", "DISTRO_FEATURES_FILTER_NATIVE", d)}')
+    oe.utils.set_class_filter("DISTRO_FEATURES", "DISTRO_FEATURES_NATIVE", "DISTRO_FEATURES_FILTER_NATIVE", d)
 
     classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 25fd463ac78..5b49affd537 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -77,8 +77,7 @@ python nativesdk_virtclass_handler () {
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
-    defaults = d.getVar("DISTRO_FEATURES")
-    d.setVar("DISTRO_FEATURES", '${@oe.utils.class_filter_features("' + defaults + '", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)}')
+    oe.utils.set_class_filter("DISTRO_FEATURES", "DISTRO_FEATURES_NATIVESDK", "DISTRO_FEATURES_FILTER_NATIVESDK", d)
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 23f4b639c69..120b6443935 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -161,6 +161,15 @@ def class_filter_features(defaults, features_var, filter_var, d):
     filtered = set(bb.utils.filter_string(defaults, d.getVar(filter_var)).split())
     return " ".join(sorted(features | filtered))
 
+def set_class_filter(var, features_var, filter_var, d):
+    defaults = d.getVar(var)
+    if "}" in defaults:
+        issues = [c for c in defaults.split() if "}" in c]
+        for issue in issues:
+            defaults = defaults.replace(issue, "")
+            bb.warn("Unexpanded variable %s in %s is not recommended" % (issue, var))
+    d.setVar(var, '${@oe.utils.class_filter_features("' + defaults + '", "' + features_var + '", "' + filter_var + '", d)}')
+
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if *all* given features are set in DISTRO_FEATURES,

