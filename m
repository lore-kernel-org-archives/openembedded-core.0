Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7310578933
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652072"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:12 +0200
Message-Id: <20180309185614.31113-34-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 34/36] libunwind: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:39 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 23 ++++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
index 0dff2c86dcd..c8faca47244 100644
--- a/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
+++ b/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
@@ -28,10 +28,10 @@ https://raw.githubusercontent.com/rdnetto/teapot-buildroot/master/package/libunw
  include/libunwind_i.h | 1 +
  2 files changed, 2 insertions(+), 7 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 497f7c2..9c15af1 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
+Index: libunwind-1.2.1/acinclude.m4
+===================================================================
+--- libunwind-1.2.1.orig/acinclude.m4
++++ libunwind-1.2.1/acinclude.m4
 @@ -22,11 +22,5 @@ fi])
  AC_DEFUN([CHECK_ATOMIC_OPS],
  [dnl Check whether the system has the atomic_ops package installed.
@@ -45,18 +45,15 @@ index 497f7c2..9c15af1 100644
 -#  AC_CHECK_LIB(atomic_ops, main)
 +  AC_CHECK_LIB(atomic_ops, main)
  ])
-diff --git a/include/libunwind_i.h b/include/libunwind_i.h
-index 23f615e..deabdfd 100644
---- a/include/libunwind_i.h
-+++ b/include/libunwind_i.h
-@@ -95,6 +95,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
- 	(pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
+Index: libunwind-1.2.1/include/libunwind_i.h
+===================================================================
+--- libunwind-1.2.1.orig/include/libunwind_i.h
++++ libunwind-1.2.1/include/libunwind_i.h
+@@ -116,6 +116,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DE
+         (pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
  
  #ifdef HAVE_ATOMIC_OPS_H
 +# define AO_REQUIRE_CAS
  # include <atomic_ops.h>
  static inline int
  cmpxchg_ptr (void *addr, void *old, void *new)
--- 
-1.9.2
-
-- 
2.16.1


