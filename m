Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9D0780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:31:44 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id m47so8267535iti.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S2Zr/EFEWE1so1xGNJ/4FvZ2NxVGfjlzCpu1yWHDk/I=;
	b=JcJ20U1TPf3spNZJ20hGad7Asmc8yi1/wyuvfxCyoif1JqPGWZQerILPLDhaRAvibZ
	J5FRrK5PERjxCWb0NPzWHHqavmin78w0FhvLScZ5lXEOHvObABFhTiVZWLjjEIf67Li2
	C4gW/3b4oeJ+gZMdPfHF4bMMDnQeFP3mhOfARoa43WXeycbZHTvfU9kGDCedgRFWhs9f
	vileURhlWFmm/rn6rAJTqOBYN3Esuypo/XaHRhJ3mKm+WsOtEqqBbMoWwcTkhsi9ay0i
	+cMy5vKt7m+fOTF3+stcuNnva1CPSsn1IIp8FveLTQzcqmoiz+Hi/60CkhSKXqRMBa6f
	djIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S2Zr/EFEWE1so1xGNJ/4FvZ2NxVGfjlzCpu1yWHDk/I=;
	b=MQh7TLyFg3KIkGHRjVRrlin/KbDD5FJoSNIs4lutS7dwjvTM4ZPhMtZDD7BccJmLYr
	3+yAPt30aCuO7ft0PiERocXluOTj3FfavUZx5fCemuOtiknDbdxbANVpbKDiOeeCW60g
	RpNrrK6QSMAPQTIzLJ46zt6huXkYJ63V721ZCpoO3GCRaGEdomUOQDrbV9+J/G79sK4c
	x1ko5xqhMHFAsryJ6ZFJYzSQP6JUbcLiCc7JEojIiSzrB425DAKC/59kbrues4W9+klA
	NyC8vO5GjvXExtTumPLK+4IHgHNNUCjadukOUvjb6mj2RhBmATGiJSEEYua05OqOLbxq
	CNZQ==
X-Gm-Message-State: AODbwcCvn7ra74jRkMnErJ1cfNPTeqVpuHLJAx20J7lCS5Ji7ZOYvFfx
	RLcjjEko//OJ3VM/h+A=
X-Received: by 10.36.238.196 with SMTP id b187mr277774iti.109.1496849505086;
	Wed, 07 Jun 2017 08:31:45 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FFF1.dip0.t-ipconnect.de.
	[93.232.255.241])
	by smtp.gmail.com with ESMTPSA id y93sm1115855ita.9.2017.06.07.08.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 08:31:43 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 17:31:32 +0200
Message-Id: <7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Wed, 07 Jun 2017 15:31:48 -0000

As discussed in "[Openembedded-architecture] Yocto Compatible 2.0 +
signature changes", changes in .bbappend must depend on some explicit
configuration change, typically selecting a distro feature.

For _append and _remove, adding an override that is set only when the
corresponding entry is in DISTRO_FEATURES achieves that:

  DISTRO_FEATURES = " ... my-distro-feature ... "

  do_install_append_my-distro-feature () {
       ...
  }

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/bitbake.conf | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ad905c..ca6501e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -713,7 +713,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
@@ -722,6 +722,21 @@ MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
+# Turns certain DISTRO_FEATURES into overrides of the same name
+# or (optionally) some other name. Ensures that these special
+# distro features remain set also for native and nativesdk
+# recipes, so that these overrides can also be used there.
+#
+# Beware that this part of OVERRIDES changes during parsing, so usage
+# of these overrides should be limited to .bb and .bbappend files,
+# because then DISTRO_FEATURES is final.
+DISTRO_FEATURES_OVERRIDES ??= ""
+DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
+Each entry is added to OVERRIDES with the <feature> name if <feature> is in DISTRO_FEATURES."
+DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
+DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
+DISTROFEATURESOVERRIDES = "${@ ''.join([':' + x for x in (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
+
 ##################################################################
 # Include the rest of the config files.
 ##################################################################
-- 
git-series 0.9.1

