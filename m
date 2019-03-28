Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 146427D20D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 23:30:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id h18so689078wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9SnboO7yVwQ6NI5jlMTt74ebetK2DT19OpolJLgnTEc=;
	b=IRQQMGR2470+7/M6wX6Qpn+H9AtXlColIk23ObbnqLYA4ejhhjKZ+kFpsALbH+MNtI
	CVaM6HopLgX1qTsN/cjeHF9l+sGJ/kmv3FM7gvlEUXAooHtjOR9JH1bVeOutWi0rnFI9
	lslFwWSiptpVveJSaObbJqQqHt0DcgEUnVwXThY6ppx+gqxK3At2GuyFNy8ZfI2m+vQE
	g9Q5Kul6avMo7LzkwrqQERxgR0kelmvmrBkZDEAxGCnIATOzPyG7gCPLfZKhf6ct8G37
	dKHjZ6L/FL5ktaN2nq9SaMB4pAGEERoFltPRNaCyZJ96EJ5HvyDO5C66WTOrMajow4bm
	gAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9SnboO7yVwQ6NI5jlMTt74ebetK2DT19OpolJLgnTEc=;
	b=QVCBfTNMHE8FBgequkUkaefcOcLqFNuF6Osm2iqR3l+r30661S840HWDI+rnW3+zCa
	jhDH/FrVdMkCQ3ejDgKv7fkYf7cU2ju/sWGAQrk5DoOSkJjjSYSlqj+oLpey7ILZ9bRw
	zrb4grUwo98A9M7ON97mZhppQF1wlygxuiQEURTd9oc58NhuTFGHSHQtwjzNJ2EipYAY
	cTFSarKVihLfqBoSiwPpf1Lc9ojGShw/pTaHGeRiEB02rUAZ4AZx/PqiVugydS/ksQVe
	9/2ONSTvl8zuEDEZULZzL6JqPyego+miMpXLr+Ea60Lt3Ed0PWkoZM17vRGjMJJwMmvN
	mevQ==
X-Gm-Message-State: APjAAAXXUpVVOH9pRzzlRhQjM/E2T6cSw5v6QD70TUGb1fhPONAoVRkt
	f4N4R7iSF4GrjOYvbxyOYyYwg73eGcg=
X-Google-Smtp-Source: APXvYqwGSHK/31wL8542q70tN1xCwKEmRD2pe89tZIC7D38LXSBinyoJCwmS3VQb9SqmHMYDefjL9A==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr1642041wmb.92.1553815814487; 
	Thu, 28 Mar 2019 16:30:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e16sm794972wrs.0.2019.03.28.16.30.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 16:30:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 23:30:11 +0000
Message-Id: <20190328233011.6977-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bitbake.conf: don't build api-documentation for native and nativesdk
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
X-List-Received-Date: Thu, 28 Mar 2019 23:30:14 -0000

DISTRO_FEATURES for native and nativesdk is filtered to contain a subset of the
features for the target DISTRO_FEATURES.  api-documentation was a feature that
was allowed into the native/nativesdk features if it was in the target, but
having API documentation for native recipes isn't really useful.

As building this documentation takes time, remove it from native/nativesdk
builds so that we only build the api-documentation for target recipes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7f8b043cc45..86a9e4b8281 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVE ?= ""
+DISTRO_FEATURES_FILTER_NATIVESDK ?= ""
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.11.0


