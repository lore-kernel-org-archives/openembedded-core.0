Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TLkgD-00056E-Tp
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 03:01:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Oct 2012 17:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,562,1344236400"; d="scan'208";a="224653359"
Received: from unknown (HELO localhost) ([10.255.13.229])
	by orsmga002.jf.intel.com with ESMTP; 09 Oct 2012 17:48:26 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 19:48:24 -0500
Message-Id: <b574551d9055cfed77428aab0035305f64100e3d.1349829329.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1349829329.git.tom.zanussi@intel.com>
References: <cover.1349829329.git.tom.zanussi@intel.com>
Subject: [PATCH 1/2] perl: add archlib_exp variable used to generate ARCHLIB_EXP in config.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 01:01:46 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

perl.c uses an ARCHLIB_EXP define to generate compile-time code that
adds the archlibexp path to @INC during run-time initialization of a
new perl interpreter.

Because we've changed this value in a temporary way to make it
possible to use ExtUtils::Embed in the target build (the temporary
value in config.sh gets re-stripped out during packaging), the
ARCHLIB_EXP value that gets generated still uses the temporary version
instead of the original expected version (i.e. becauses it's in the
generated config.h, it doesn't get stripped out during packaging like
the others in config.sh).

This creates an unmodified version called archlib_exp that gets used
by a modified config_h.SH to get the correct value into config.h

Fixes [YOCTO #3099].

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-devtools/perl/perl-5.14.2/config.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
index 0d4ca1c..d1db02e 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -69,6 +69,7 @@ api_versionstring='5.14.0'
 ar='ar'
 archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
 archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
-- 
1.7.11.4



