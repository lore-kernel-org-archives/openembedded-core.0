Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9BB72F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:11 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o5so42667653ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=72mvCUnkp4es4f9Uo3EDx8/Eg4eMXuaMSGpJ/JjHJWE=;
	b=X24I8RrGzT+WMoc82dyMxog3jhDu9AAL4tcXa8pEAUSulhU9EITHU+KSfD+dexm0OJ
	MDx8ejS2lrKeAIZUtYBGrdbavulOGfMg8zDTS1abg/7WhqHwlDfWzy/+IW20YHCp96N3
	7cIP+xJclrNJ7SM10FHu6YP2qTsKGIttPpaQPeq1LZBlJkCMVIPvtdXJXBkfLrLOJsEN
	rRosjKxjNlork1HKf+H5bGZG+XUOKObkjvfkJbtP39+jJRNr+g7fpr3+F0vwdOYQUR2n
	ArDxawnmjyU0kScSP/XsrV9mtzmxhBoxqYlU//VKWcoja4mStszfuoh6NgyPL7QM2ukd
	5uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=72mvCUnkp4es4f9Uo3EDx8/Eg4eMXuaMSGpJ/JjHJWE=;
	b=NLHoz5uZH+Ws4W+BQO5X6LowVANMvqdIBaBRNpc+J2qUi4PSFEBrCwVsANeov/bmbn
	ibnK6Da57pSI4rN6JJGaCs9TaDqFh0PThtvhCCF4mqB2Tq4kEWMe1OhazfFtPbMbkjm1
	rE91CgYBlkD7EgWK8rqAe74pCNSMmTRjAr358mDjFzQtpKsI8ihJmoEJ1Bf4hXlTZzLy
	rZYMdJsnnnq7tMxYhYIJJd9f0zBazQoIiK0P0L7okSflqGf51sjEUPO2nP/xWG8VPaML
	Ms39N089X/guINP0UbTw51UMC5jH6QUQ5lSmuc4ybcaTPzF5+32mB2dlCFbLANcim82S
	a+dw==
X-Gm-Message-State: AODbwcAi8HRTrVZDLawHdWuv9i3DT+9UHJmuxyoZdwo7b9GN6hM4Irv2
	qNOAzh6En/MkTwdi
X-Received: by 10.36.95.202 with SMTP id r193mr3323290itb.17.1494854832682;
	Mon, 15 May 2017 06:27:12 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:11 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:26:58 +0200
Message-Id: <287b3c3d9719f07e22933f130806bce65d2b7a65.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 1/6] build-mode.bbclass: distro-wide debug-build mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 May 2017 13:27:12 -0000

Some packages (for example, kmod) have built-time configure options
for additional debugging support. Similar to manpages.bbclass, this
new class turns the new "debug-build" DISTRO_FEATURE into "debug" and
"logging" PACKAGECONFIGs if the current recipe has those.

Another usage will be to mark images when undesired distro features
like "debug-build" were used. This protects against accidentally using
such an image as production image on a device.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/build-mode.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/classes/build-mode.bbclass

diff --git a/meta/classes/build-mode.bbclass b/meta/classes/build-mode.bbclass
new file mode 100644
index 0000000..e5564dd
--- /dev/null
+++ b/meta/classes/build-mode.bbclass
@@ -0,0 +1,16 @@
+# Enable additional logging and debugging features that are unsuitable
+# for production images when building in "debug" mode. "kmod" is
+# an example of a recipe which has both "debug" and "logging"
+# PACKAGECONFIGs.
+#
+# This distro feature is not very flexible. More useful in practice
+# is the IMAGE_MODE in image.bbclass, which allows building production
+# and development images in the same build configuration.
+PACKAGECONFIG_append_class-target = "${@ \
+    (' ' + ' '.join(set(d.getVarFlags('PACKAGECONFIG').keys()).intersection(('debug', 'logging')))) if \
+    bb.utils.contains('DISTRO_FEATURES', 'debug-build', True, False, d) \
+    else ''}"
+
+# The following DISTRO_FEATURES have to be considered too dangerous
+# and/or unsuitable for use in production.
+DISTRO_FEATURES_NON_PRODUCTION ??= "debug-build"
-- 
git-series 0.9.1

