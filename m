Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659B1CD5BBA
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1011.1779233439398461752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SA3o+L3y;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so49773525e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233437; x=1779838237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/I2/q9fn66kOpBb5COzs072Bs0IneUk4FRvUTGxYSM=;
        b=SA3o+L3yYBvlKZf9qp9u/7H7HbwQmJBz8Djjq5R6bVbUcyZO50d2RryNjQsIVEmPH1
         yJFxsStkU/jeIrriFbaO2m/F8ZZExRsOzJLnKHTHS/y3JMQYzHU3ozk5dDgh0aSljHZP
         AXY0bTafN9BvJTJqQvyP99++r88XeT7EFPBsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233437; x=1779838237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/I2/q9fn66kOpBb5COzs072Bs0IneUk4FRvUTGxYSM=;
        b=ozaZQjpGpTM5VTvrdSwIqOpSczfBnxyC3oFJkKLc5qAtH3Ira4PDSKSF8DylBG32gw
         rWXr+plgCk6Uii0jWiJ/U8argGKTpyJrMep4U4rM5nVIdGEx9W4yWuAIXwXzKzk/avp9
         EjmrQ40P84RnKHKycmgmS+bZnEMImIcWj+wdSSjTjm5exRJZmwRTNpdluC6Zz3GyVODf
         zWYI+36oZVmeET6VzwuPm1w5+YAyXoOl+aOo2FaSZv8mngjtk6hlznq90oOmv/fCShDP
         hwNbt0xPAAkh6eZFCPD9wlx2H/ROf3z71GGzfu3dVcOIStshq/3SsYbQLQVlhlMwY1zE
         Zl1A==
X-Gm-Message-State: AOJu0YyerNOO5uvsL4WwkyUvAfiXTlTDzLmINueoHM2I+lclkKkL2PYx
	IyuDThs04gvofIs/UOlWxhLd94dwByNsjWl074y6/b1O9D2F4eISToKkdxSHtBWyY5ULiXPF1Dw
	rqjNK
X-Gm-Gg: Acq92OF/SxGR3oSxvedHvpXKn4293OPQTB1xuRUC14GRfee/LtzbRHeHFtgptaBHZEC
	xYgvnxdfuRNF7xQhe0//cS9AAwoCthpJuIQBpIe72WaN2LfQILCZ7sGnzH6Zsmil77iwY7Otq9F
	eZns0nZsA+RxHmmiAsZ9h+Ow4diWLxtzP5SsGH3p5GuQx5nko9LmlfMHfyNBpu6gYjucnSfY0ZD
	td9nZmkastnLJ0rt2LODy/AWLI/Qq1rHoLUE5aA342VgbKag18Zs4597Z1PEbygLkOxY3cu6xEE
	1dpdIpf0Ohb2bGIDulDgWEx1b8xhGP1tM3uKUfuBI7FwjRQ2QvGC+N28Lz4t4iL2NlHWPWxpR/O
	GjNc8GMsYDa6hDMUErcgMaAbTYtezbob3zTleGPExFmmKdT5lsZYoW9ZFqZkg5b26wxiwD6zo7f
	LDt464qX95jDkYiGIzFj5mibdKPzkx4R8bsKhvUxpjXG4UzxFEW3x841qb/H0WYtIp/nQ5m0QuC
	VGwQRDHtvfq9iaKVEEUadF1dglTZgveAssfQQ==
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48fe6322416mr349022065e9.18.1779233437278;
        Tue, 19 May 2026 16:30:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/28] utils: Handle unexpanded variables in DISTRO_FEATURES
Date: Wed, 20 May 2026 01:29:56 +0200
Message-ID: <10f7474d851fa908b15eea92fd0bb7e571a88d15.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237366

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

