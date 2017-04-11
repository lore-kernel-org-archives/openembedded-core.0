Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 65AD177CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:39:00 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id t68so15800476iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OfqoJ2rdY++6YsyDZfCK9bzkAAAH9Zenm21lDbw049Q=;
	b=c52RCmRSZPkDVI1yGQRe0BOWfRmLcqZZPeQZCkEM1rNmrDU+pcPIMzPUfN2USx8tSk
	dYIBXRxsEFSnM35JL0BcVyCKbtWsZ+3BYZ7KJO2UAInwt6LqxBG4k8azY+L42rGtvSHj
	LVd+DKgDhgZHIRrRalMXCGJkjd9VbXc+jey2Fvin3Dw1u4QrMsWHxLMq18HXqFmF7lsO
	+GZyAW6j/aOELzOtN+VBQiDQedrNYKFkjUutRG8npHKboZXiXUBp4d1rBmkofDY+sfZn
	pR6ziVIvyUnz4eMBvjY7FBuCFJ3Q1nyaTkOfkOqsfToAdrCnfnpJBwoqp1OzOIRTPcAY
	Iz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OfqoJ2rdY++6YsyDZfCK9bzkAAAH9Zenm21lDbw049Q=;
	b=iwwdps8DL0NSdDaFElE6qZGJBsTnSpUDnFoTR8BC8aZf8/Lz8tg/qJMuY4iZOP2qYD
	Sl2HGfVmr+GO/FpqjP/UGLacuhizmM1hwo3XzzRDGsOsKRxDV+hLsCcbN+px5KFaaLFs
	QIrMCqM0E4W9y0Nn1GyBRaLzgQGr3XvdNLRsUuwyK8EIjEwvbEtDtsdcGXZXg6M4iiDu
	cril0yuuyaOE4gCY2SIrHqDyigfPyXOgr48cpeTZnInuU+Pkwn5pD+s3eL/gS0s8RwpW
	pQzPtMa47dBa8cX8wJfgglArSGhbgACdpRkCel1sf9He4uayzRHggenF6DJBg/YfwMlB
	ZoTA==
X-Gm-Message-State: AN3rC/6DBaslS710rcPUeV60fHoMX9UPS6MBXppLTTUm/567EdA4jw3/TJf9EDI2dXC+F5A2
X-Received: by 10.36.66.141 with SMTP id i135mr18714705itb.86.1491935941930;
	Tue, 11 Apr 2017 11:39:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:39:00 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:38 +0200
Message-Id: <0be05c5deaf639ea2e38d828ac75d3380b3a19ad.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 3/8] recipes/*-cross recipes: ignore TARGET_ARCH sstate hash
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
X-List-Received-Date: Tue, 11 Apr 2017 18:39:01 -0000

"yocto-compat-layer.py --machines" showed that shared packages like
gcc-cross-powerpc64 have a sstate signature that depends on
TUNEFLAGS. As a result, there are unnecessary rebuilds and potential
conflicts in a multiconfig.

That's due to the way how TARGET_ARCH is set. Richard Purdie suggested
setting TARGET_ARCH[vardepvalue] as fix, which works. It would be
shorter to do that in cross.bbclass instead of repeating the relevant
line in different recipes, but Richard was concerned about potential
side-effects in other usages of cross.bbclass.

TARGET_GOARM as used in go.inc is still causing signature differences
for go-cross-powerpc64 and machines b4420qds-64b and p5020ds-64b. This
needs further investigation.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc | 3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc           | 3 +++
 meta/recipes-devtools/gdb/gdb-cross.inc           | 3 +++
 meta/recipes-devtools/go/go-cross.inc             | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 5e6f468..02ec891 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -4,6 +4,9 @@ PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PN = "binutils-cross-${TARGET_ARCH}"
 BPN = "binutils"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index bb5f7a0..c5c1645 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -11,6 +11,9 @@ python () {
 
 PN = "gcc-cross-${TARGET_ARCH}"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 require gcc-configure-common.inc
 
 # While we want the 'gnu' hash style, we explicitly set it to sysv here to
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index d92f31f..ebe329f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -21,6 +21,9 @@ GDBPROPREFIX = ""
 PN = "gdb-cross-${TARGET_ARCH}"
 BPN = "gdb"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 inherit cross
 inherit gettext
 
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 68f5efd..93206a5 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -4,6 +4,9 @@ DEPENDS += "gcc-cross-${TARGET_ARCH}"
 
 PN = "go-cross-${TARGET_ARCH}"
 
+# Ignore how TARGET_ARCH is computed.
+TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
+
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 
 GOROOT_FINAL = "${libdir}/go"
-- 
git-series 0.9.1

