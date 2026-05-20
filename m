Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39742CD5BAF
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7383.1779265274562237746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tH5ntaFq;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2512234f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265273; x=1779870073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/I2/q9fn66kOpBb5COzs072Bs0IneUk4FRvUTGxYSM=;
        b=tH5ntaFq1Ft+qa97UuXoQDoDC0roJKCOHyyQiwInrx+m3Dkg8BPdauXUL5Ghvh125M
         ANooPqqlO/9WpIMpzxgjl7UrqMs+kV8VXSUDJZcNJ0t8KKl4EkmZavGFHJ2rgjDdjs/L
         HvthdvcAJ+UO0SgeAczzV4cpNG4eCO+5wvf0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265273; x=1779870073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/I2/q9fn66kOpBb5COzs072Bs0IneUk4FRvUTGxYSM=;
        b=oG3r7oEjdSDDS5zuG8A+hjmBM6vOSmKU+oLX+xZvLLlJ8v1TbaSBUzVEy8GiuffvjG
         BI9nySjnF/9Tgkq4dgiGANq2GVzRseAStl5vAtTIigKToNWDEDk9pNy8HIea5p7ZJm+4
         08hMoWgKtA3iEuhKMdZFx3Ch6faMOQAEj9OMZy5+dYd8Ln5PVUu3V4IgD40tJxHDzV20
         +8IdFcxI84XW8hFkJHIT/pk1J9rJetq4BbMZXB7/LvtmB84AS9Ij183xZr5Lud73kAt/
         RUYFle8xkvP07BK4E+5jW/lIK2L0RMFtZgdg7XZXqwhXiiFJAFPs3byLOnF6CcV2CaMH
         yJAQ==
X-Gm-Message-State: AOJu0YwciaCRHK/GiZ58Qd2/mmNrUV1fMvYx5DWnb7F2MeilHBl983sq
	fKOPxO3J4XV5xqmyP0XwLl10Woe1b2adn0TSeFJnGFTLdJTcGEOEJsSvnu5oODGp0jmV73fD6Fl
	m6KMP
X-Gm-Gg: Acq92OFrMex/5MhakcODnjxrsrcaXdmM8RCMj/pmZTzSujHbCtZ02cFJLlc/fGNlGw+
	uDZlmUseQpzcTK/CnmKkoqn6FQFwUn5/bMwXSh91gOodNcDfCv7dHQVWQHLvMHt34jdA9O6jc1X
	cgRUdFYbfl2A6B3701/y7FeHEBxubHSg8B1txKvFCsBLvpVJ0RWb0/4vTM/2JyBsqwgnJv3iMRb
	sG6E1sqAKxPeAZubvkNkdSTq9XMEb4nL7IRQ+QAYf9c99vD9+htNTrUiDP6GiIlbwS5UsN+BB+f
	WwcJO0Y46k+n573H/i7b0iQ8lCm5sgHYdDjBMe4qBhk2bqeKmmN9mrLY3PIaC9kuK87GT05oOuZ
	7gUDTKgsv+nd0jaALlyDO7BmNzRDkGKBw2QAMmw8L4Gx/lucAWyb+n+x64JRp04BxR7Dn61ybKk
	hfqqIc7ryGmDeaWR7JAwWv3TBycHM2VaUs20aCnTn1XxR8ho5sPCVK82qTxaAorbjpRRYpCBOaI
	ucz2uG93Qm8L7IHJHC6Yyfb1j1ht24wDwC08Us=
X-Received: by 2002:a5d:5f90:0:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-45e5c5f8424mr35952085f8f.38.1779265272607;
        Wed, 20 May 2026 01:21:12 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 19/28] utils: Handle unexpanded variables in DISTRO_FEATURES
Date: Wed, 20 May 2026 10:20:20 +0200
Message-ID: <342ef5250240575471a915e1145088c723a025c2.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237418

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you have an unset variable in DISTRO_FEATURES, very strange things appear to
happen. Currently, this shows up as seccomp appearing in PACKAGECONFIG for
gnutls-native which isn't what the user configured.

The issue happens if you have a variable in DISTRO_FEATURES which cannot be
expanded.

Add some code to detect, warn and work around such a thing. Create a function to
allow this to be done in one place.

[YOCTO #16275]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7782a9bfc4e2ddc67185ac3f5ed14c5268f078b0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 89d862eb55a..8aa86f9cb62 100644
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

