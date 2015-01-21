Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A2B277251B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:02:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2015 12:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,443,1418112000"; d="scan'208";a="665413089"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2015 12:01:48 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:48 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.144) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 21 Jan 2015 12:01:46 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2015 18:00:57 -0200
Message-ID: <1421870458-9958-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.144]
Subject: [PATCH 1/2] kmod: new PACKAGECONFIG debug and logging to help reduce binary size.
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
X-List-Received-Date: Wed, 21 Jan 2015 20:02:29 -0000
Content-Type: text/plain

From: Gustavo Sverzut Barbieri <gustavo.barbieri@intel.com>

debug and logging will make kmod and its library bigger than expected
due many strings in the resulting binaries. While these are useful for
development, they are of no use for deployment.

With them enabled kmod is 154Kb, libkmod is 99Kb. Disabling reduces to
kmod 139Kb (10%) and libkmod 83Kb (19%) on i586 stripped.

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index dda74c8..652c6f5 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -32,7 +32,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
 S = "${WORKDIR}/git"
 
 EXTRA_AUTORECONF += "--install --symlink"
-EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools --disable-manpages --with-zlib"
+EXTRA_OECONF +=" --enable-tools --disable-manpages --with-zlib"
+
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 
 do_configure_prepend () {
         gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
-- 
1.9.1


