Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id D76AB74FD9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2349; q=dns/txt; s=iport;
	t=1522952743; x=1524162343;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Ci96IzX/ViY8ZrFku40t0ovC6txGMWKd1gTZhY8dukY=;
	b=O7ZQsdme6HsUmj2GUhPGoNd7EIYfm8c4hLoA4HgkfcKzvSklT88BK6Of
	pUp6LVtXfQ/G6UioyF+vsc5ezKB6XFdN8aeidBDTH1LVk9Kpv2nMf8WWO
	X/xPGLsafbdBDrpZ78gcTu2zoOZc5/7xBOrBPWiB8X3A7aGOxXRWWYB9i c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AGAgBYacZa/5tdJa1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCYW8omGiDA5JVgXoLH4RkAoI+ITYWAQIBAQEBAQECbBw?=
	=?us-ascii?q?MhSMGeRBRVxmFDa5ciEOCJYdqghODXIVvhQgCjFaKagiFU4heAow7iRqGQgI?=
	=?us-ascii?q?REwGBJSMDLoFSTSMVgn0JiweFXh8wjRsBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,411,1517875200"; d="scan'208";a="376983092"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 18:25:43 +0000
Received: from kamensky-w541.cisco.com ([10.24.32.120]) (authenticated bits=0)
	by rcdn-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w35IPUvl013347
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Thu, 5 Apr 2018 18:25:42 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 11:25:29 -0700
Message-Id: <1522952730-5967-5-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v3 4/5] systemtap: create translator packageconfig
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
X-List-Received-Date: Thu, 05 Apr 2018 18:25:42 -0000

For cases when systemap module compilation happens on host in
cross-compilation mode, and it is desirable to minimize systemtap
presense on target we need to have just smallest possible set of
utilties that are required to run compiled modules.

Introduce new "translator" PACKAGECONFIG, if it is not set
it would mean that just minimal set of run-time utilities will
be included in the package.

For run-time only systemtap build variant use
PACKAGECONFIG_pn-systemtap = "" or
PACKAGECONFIG_pn-systemtap = "monitor"

Suggested-by: Taras Kondratiuk <takondra@cisco.com>
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 475b207..b280f58 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-DEPENDS = "boost elfutils"
-
-RDEPENDS_${PN} += "python3-core bash perl"
+DEPENDS = "elfutils"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
@@ -18,7 +16,8 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-PACKAGECONFIG ??= "sqlite monitor python3-probes"
+PACKAGECONFIG ??= "translator sqlite monitor python3-probes"
+PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,python3-core bash perl"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
@@ -26,4 +25,12 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base
 
+do_install_append () {
+   if [ ! -f ${D}${bindir}/stap ]; then
+      # translator disabled case, need to leave only minimal runtime
+      rm -rf ${D}${datadir}/${PN}
+      rm ${D}${libexecdir}/${PN}/stap-env
+   fi
+}
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


