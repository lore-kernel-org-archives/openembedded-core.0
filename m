Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5A507DEA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id t22so7931077pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Fq1YAOAV4NjZBfPyE6GammF+7OBfT7XjNa1glo06evg=;
	b=FnXPouBvAIWbeUFBHesNYT1ciOOh2bEkFGKpzmRHuCHgoB6Kah1rmtAuAxVWf0aVVn
	fktqqwCgaGofSEIDyrS532BIViuU9bkuH6Zm0ALss5FncQOo+0foRv5gEEO8dBWzuv6L
	oyQLil5UAFV3Yq4TGcgrbyy7j3cQyBPH0V0e58Ke2/NzN+p3b/ATDugnyquJ0Y8EyFlH
	72fBe5UJ+VML6821dkjd5Tc3Y28mXMmnu5pDNvGNgBNIOl6ckIAO0C+8zwMllzF14GH/
	7ay/NoqtS0NFIBjfMYnAeVbqtZIm1+Z/iRiDgic5S9d7Kd88jfbgK4s43NFSas0JjQ+A
	3oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Fq1YAOAV4NjZBfPyE6GammF+7OBfT7XjNa1glo06evg=;
	b=U5lubH01QtZ1yMH4ZNzZSc/yUZXQAtloDEPMeX+zIuoUNrEAlvm/IT23kykGKHLGDF
	2bErfsVM4XN7Rp8Dg0YQFzLrbU3XioaLGsQduLPb6ptmbq/LBDU/Sspbq8n6PM5/teaW
	XoTsELGzDNO1wIfH6JrjzmiHN/uf3awp8AaTjVVIriNsZU8yRG4oeeWBL3DF8E9NJ3CQ
	+Yi6sxYH0FbfB+akjnIeJnXgfSATIymzLBYSJbb9OFZsjlOr0c942KkRqdI1osyD1mHD
	j1KsAi/n5Tif4LSYzLnJgSMNlTLvdFgXEUWvoJBC+UfTND7t/sey7EQKApx4eJbrBIgk
	ud+w==
X-Gm-Message-State: APjAAAXLhdhQCohyYOSEGjcQK+Al6bzK/AQfy4a72Ibjv1asC8XxUYbD
	9tdv+8Q1tvq+k1+3XfJoZhyiC7mU
X-Google-Smtp-Source: APXvYqxAViJyY1eACq//r4qWXWL3wXXwYyGrPciKXoLPkSqZQS1ZoGalHgXMK/+/4Cx8qppS65BTFg==
X-Received: by 2002:a63:10d:: with SMTP id 13mr10192930pgb.176.1557809657876; 
	Mon, 13 May 2019 21:54:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:52 -0700
Message-Id: <6bc286d2bdf00e042261e9d3d6b7e25b382d171e.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 10/23] opkg: fix ptest packaging when OPKGLIBDIR == libdir
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
X-List-Received-Date: Tue, 14 May 2019 04:54:17 -0000

From: Martin Jansa <martin.jansa@gmail.com>

there is small issue with ptest packaging in cases where
OPKGLIBDIR is set to /usr/lib.

Then all ptest files get packaged in libopkg instead of opkg-ptest and correct QA error is triggered:
ERROR: QA Issue: /usr/lib/opkg/ptest/tests/opkgcl.py contained in package libopkg requires /usr/bin/python3, but no providers found in RDEPENDS_libopkg? [file-rdeps]

  # $FILES_libopkg
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/opkg_0.4.0.bb:62
  #     "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
  FILES_libopkg="/usr/lib/*.so.* /usr/lib/opkg/"

  # $FILES_opkg-ptest [2 operations]
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:9
  #     "${PTEST_PATH}"
  #   rename from FILES_${PN}-ptest data.py:117 [expandKeys]
  #     "${PTEST_PATH}"
  # pre-expansion value:
  #   "${PTEST_PATH}"
  FILES_opkg-ptest="/usr/lib/opkg/ptest"

  # $PACKAGES [4 operations]
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/conf/bitbake.conf:292
  #     "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
  #   set /jenkins/mjansa/build-webos-master/oe-core/meta/conf/documentation.conf:314
  #     [doc] "The list of packages to be created from the recipe."
  #   prepend /jenkins/mjansa/build-webos-master/oe-core/meta/classes/ptest.bbclass:20
  #     "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
  #   prepend /jenkins/mjansa/build-webos-master/oe-core/meta/recipes-devtools/opkg/opkg_0.4.0.bb:60
  #     "libopkg"
  # pre-expansion value:
  #   "libopkg ${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)} ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
  PACKAGES="libopkg opkg-ptest opkg-src opkg-dbg opkg-staticdev opkg-dev opkg-doc opkg-locale  opkg"

The easiest fix should be to reorder PACKAGES (the _prepends) so that ${PN}-ptest is prepended later -> ends before libopkg).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
index 20c2e0b..e2305d0 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
@@ -23,6 +23,11 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
 SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
 
+# This needs to be before ptest inherit, otherwise all ptest files end packaged
+# in libopkg package if OPKGLIBDIR == libdir, because default
+# PTEST_PATH ?= "${libdir}/${BPN}/ptest"
+PACKAGES =+ "libopkg"
+
 inherit autotools pkgconfig systemd ptest
 
 target_localstatedir := "${localstatedir}"
@@ -57,8 +62,6 @@ RREPLACES_${PN} = "opkg-nogpg opkg-collateral"
 RCONFLICTS_${PN} = "opkg-collateral"
 RPROVIDES_${PN} = "opkg-collateral"
 
-PACKAGES =+ "libopkg"
-
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


