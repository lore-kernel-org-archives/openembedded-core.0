Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 25BED6FFDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 00:52:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2015 16:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,410,1444719600"; d="scan'208";a="871282135"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2015 16:51:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 13:51:31 +1300
Message-Id: <aedaf829fcf527c3d74abfeaccc35317a9b539c4.1449794902.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449794902.git.paul.eggleton@linux.intel.com>
References: <cover.1449794902.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1449794902.git.paul.eggleton@linux.intel.com>
References: <cover.1449794902.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] nativesdk-buildtools-perl-dummy: properly set PACKAGE_ARCH
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
X-List-Received-Date: Fri, 11 Dec 2015 00:52:00 -0000

Turns out I did a silly thing in OE-Core revision
9b1831cf4a2940dca1d23f14dff460ff5a50a520 and forgot to remove the
explicit setting of PACKAGE_ARCH outside of the anonymous python
function; the original bug was apparently fixed but the functionality of
allarch.bbclass was being disabled because it was able to see that
PACKAGE_ARCH was not set to "all" - which was what I was trying to
ensure.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 6fb2b64..23c0a5c 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -12,8 +12,6 @@ python() {
     d.setVar('PACKAGE_ARCH', 'buildtools-dummy-${SDKPKGSUFFIX}')
 }
 
-PACKAGE_ARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
-
 PERLPACKAGES = "nativesdk-perl \
                 nativesdk-perl-module-file-path"
 
-- 
2.5.0


