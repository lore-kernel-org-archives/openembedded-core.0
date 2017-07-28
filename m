Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 185C9784C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:50:08 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q85so96772314pfq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k3ESf+Hk3CiQNVdpZJ33vLCwUYY4RLiBvdkc2ZcuSWs=;
	b=prlEsQb07ZT1JOq6NNZq9PGTu+SFOdkPva2ZqKa01jNchb6tf46jalT66zAnDFwlDM
	6eATZJ5KlXAhP+qeWkUMcuBG1Fgg3S6k7rduWQamJGtQ9wj98CmSu15u+OqPe+iUUVkG
	xEXJMQIgN088FSB+bjHmgNDvm0mQc/a6IxkkFDUVwTqVBIQTOw7m21XEea2xizZ2+/57
	ObSZifk70LFuRUbhdlfX2R0b39vjwQmzuYDfUs3tigA+2yvL1gtyblgbhhJXsPsMST/L
	2SbQjRhDDXjYoxgAdBrrAeQ2OCuvCojqVbr7wmmPJj1+EXufdHqMPT3WoZrgv/uN6iKf
	KlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k3ESf+Hk3CiQNVdpZJ33vLCwUYY4RLiBvdkc2ZcuSWs=;
	b=WyK7NFAgTCNDXZ7WfipJ1QTnR54v5P3XZTns2mrVCHkWCEUKmqfTvxctd2HJMO+xUO
	YJQg/UxKuhATxmPEQt7TraniKQIwOMT3PeFd1OAZYU408zx/m71gNUKEKWZjSiPmliwg
	9aqQHVL0x5ymI97Nvyqf4Ktzt3uoGdfe5a5TYoqMs52UML0DXr2GP1Uxw/DVUlkTJ76k
	xy72lB19dgpeJ4zwBZJBHsdxe8Slv7DTBIZIzY8Z0U/JPCwEF5KSMfxkj+AGKvEaFRIV
	HFZhfROCoooV1cD5VTozKT4WyBvl6OxYPmBW9HgWHToHTZi0ac+3rsjWqSMPD3ICvnEH
	ICyg==
X-Gm-Message-State: AIVw1115OqnII3pn5g05xEzOUZ1d6xDKilrkmbIeX7NEqGv2+Vx0aGK4
	jIMbYeRjvlKns0LbjSg=
X-Received: by 10.99.126.85 with SMTP id o21mr7574689pgn.262.1501253409728;
	Fri, 28 Jul 2017 07:50:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5633D.dip0.t-ipconnect.de.
	[87.165.99.61]) by smtp.gmail.com with ESMTPSA id
	b13sm38730381pfj.141.2017.07.28.07.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 07:50:08 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:49:53 +0200
Message-Id: <97b966925eaaf20263e0f8938806b6e015fc6c70.1501253351.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
References: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 2/2] autoconf-archive: simplify and fix recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 14:50:09 -0000

The COPYING file specifies pure GPLv3, not GPLv2 & GPLv3. There is
also the COPYING.EXCEPTION file with the autotools exception, which
gets ignored here in the recipe to keep it simpler.

All of the explicit dependencies seem unnecessary, and RDEPENDS_${PN}
doesn't do anything for native recipes either, so all of that gets
removed.

It also built fine without the m4 and parallel build workarounds.

There's no need to have a separate .inc file.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 13 -------------
 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 14 +++++++-------
 2 files changed, 7 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
deleted file mode 100644
index 4f63e0f..0000000
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-LICENSE = "GPLv3"
-HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
-SECTION = "devel"
-
-DEPENDS += "m4-native"
-DEPENDS_class-native = "m4-native gnu-config-native"
-DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-RDEPENDS_${PN} = "m4 gnu-config"
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-
-inherit autotools
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 0a1a771..d77c37d 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -1,13 +1,13 @@
-require autoconf-archive.inc
-
-
-PARALLEL_MAKE = ""
-
-LICENSE = "GPLv2 & GPLv3"
+SUMMARY = "a collection of freely re-usable Autoconf macros"
+HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+SECTION = "devel"
+LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
 SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
 
-EXTRA_OECONF += "ac_cv_path_M4=m4"
+inherit autotools
+
 BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

