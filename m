Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 123AA6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 15:20:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Oct 2014 08:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="398246111"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.70])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2014 08:13:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2014 08:20:22 -0700
Message-Id: <1412954422-22885-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] glibc: remove bad patch snippet that eglibc forward ported
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
X-List-Received-Date: Fri, 10 Oct 2014 15:20:22 -0000

The s_sin.c patch undoes some code changes in glibc itself, these changes have nothing to
do with the option groups and I suspect crept in as part of the initial conversion.  Undoing
this patch also fixes a test failure in test-double and test-idouble.

[YOCTO #6808]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     | 54 ----------------------
 1 file changed, 54 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index f53a899..40c7832 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -15454,60 +15454,6 @@ Index: git/sysdeps/gnu/Makefile
  		   pututxline utmpxname updwtmpx getutmpx getutmp
  
  sysdep_headers += utmpx.h bits/utmpx.h
-Index: git/sysdeps/ieee754/dbl-64/s_sin.c
-===================================================================
---- git.orig/sysdeps/ieee754/dbl-64/s_sin.c	2014-08-29 20:00:54.260070587 -0700
-+++ git/sysdeps/ieee754/dbl-64/s_sin.c	2014-08-29 20:01:15.240070587 -0700
-@@ -447,21 +447,19 @@
- 	    }
- 	  else
- 	    {
--	      double t;
- 	      if (a > 0)
- 		{
- 		  m = 1;
--		  t = a;
- 		  db = da;
- 		}
- 	      else
- 		{
- 		  m = 0;
--		  t = -a;
-+		  a = -a;
- 		  db = -da;
- 		}
--	      u.x = big + t;
--	      y = t - (u.x - big);
-+	      u.x = big + a;
-+	      y = a - (u.x - big);
- 	      res = do_sin (u, y, db, &cor);
- 	      cor = (cor > 0) ? 1.035 * cor + eps : 1.035 * cor - eps;
- 	      retval = ((res == res + cor) ? ((m) ? res : -res)
-@@ -673,21 +671,19 @@
- 	    }
- 	  else
- 	    {
--	      double t;
- 	      if (a > 0)
- 		{
- 		  m = 1;
--		  t = a;
- 		  db = da;
- 		}
- 	      else
- 		{
- 		  m = 0;
--		  t = -a;
-+		  a = -a;
- 		  db = -da;
- 		}
--	      u.x = big + t;
--	      y = t - (u.x - big);
-+	      u.x = big + a;
-+	      y = a - (u.x - big);
- 	      res = do_sin (u, y, db, &cor);
- 	      cor = (cor > 0) ? 1.035 * cor + eps : 1.035 * cor - eps;
- 	      retval = ((res == res + cor) ? ((m) ? res : -res)
 Index: git/sysdeps/ieee754/ldbl-opt/Makefile
 ===================================================================
 --- git.orig/sysdeps/ieee754/ldbl-opt/Makefile	2014-08-29 20:00:54.452070587 -0700
-- 
1.8.3.1


