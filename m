Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 324FF60173
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:24 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:19 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id A44503A147;
	Sat, 10 May 2014 10:06:15 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:06:03 +0200
Message-Id: <bea1d0dda5ab862c0f7aaef872352a8aed43a67f.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
References: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
In-Reply-To: <cover.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv2 10/13] python: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the
path. Don't migrate paths that already exist in base FILESPATH to
FILESEXTRAPATHS.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../recipes-devtools/python/python-native_2.7.3.bb |    2 +-
 .../python/python-pygobject_2.28.3.bb              |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 0c66d27..4949546 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -21,7 +21,7 @@ SRC_URI += "\
            "
 S = "${WORKDIR}/Python-${PV}"
 
-FILESPATH = "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit native
 
diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
index 9dbe47c..2e65b38 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
@@ -16,7 +16,6 @@ SRC_URI[md5sum] = "aa64900b274c4661a5c32e52922977f9"
 SRC_URI[sha256sum] = "7da88c169a56efccc516cebd9237da3fe518a343095a664607b368fe21df95b6"
 S = "${WORKDIR}/pygobject-${PV}"
 
-FILESPATH = "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
 EXTRA_OECONF += "--disable-introspection"
 
 PARALLEL_MAKEINST = ""
-- 
1.7.9.5


