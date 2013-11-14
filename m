Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC3B6D965
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 14:41:21 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1Vgy6k-0001Gi-9j
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Nov 2013 15:41:22 +0100
Message-ID: <1384440081.17320.65.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 14:41:21 +0000
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Boost::thread uses functions from boost::atomic but
	doesn't
	actually link with libboost_atomic. This works fine on platforms where
	BOOST_ATOMIC_FLAG_LOCK_FREE
	is true but will lead to undefined symbol references otherwise. Fix
	this
	by applying a patch from the upstream bug tracker to add the missing
	library linkage. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] boost: Add patch to avoid undefined references to boost::atomic::lockpool::get_lock_for()
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
X-List-Received-Date: Thu, 14 Nov 2013 14:41:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Boost::thread uses functions from boost::atomic but doesn't actually
link with libboost_atomic.  This works fine on platforms where
BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined
symbol references otherwise.  Fix this by applying a patch from
the upstream bug tracker to add the missing library linkage.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-support/boost/boost_1.54.0.bb         |  1 +
 .../files/boost-1.54.0-thread-link_atomic.patch    | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch

diff --git a/meta/recipes-support/boost/boost_1.54.0.bb b/meta/recipes-support/boost/boost_1.54.0.bb
index 3cf88fa..9e7a60a 100644
--- a/meta/recipes-support/boost/boost_1.54.0.bb
+++ b/meta/recipes-support/boost/boost_1.54.0.bb
@@ -3,4 +3,5 @@ include boost.inc
 
 SRC_URI += "file://arm-intrinsics.patch \
             file://glibc.patch \
+            file://boost-1.54.0-thread-link_atomic.patch \
            "
diff --git a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
new file mode 100644
index 0000000..d39d0a9
--- /dev/null
+++ b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
@@ -0,0 +1,59 @@
+Link boost_thread with boost_atomic to avoid undefined references to
+boost::atomic::detail::lock_pool::get_lock_for().
+
+From https://svn.boost.org/trac/boost/ticket/9041
+
+Phil Blundell <pb@pbcl.net>
+Upstream-Status: Backport
+
+diff -Nurp boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp
+--- boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp	1970-01-01 01:00:00.000000000 +0100
++++ boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp	2013-08-23 19:51:52.706329968 +0200
+@@ -0,0 +1,14 @@
++// Copyright (c) 2013, Petr Machata, Red Hat Inc.
++//
++// Use modification and distribution are subject to the boost Software
++// License, Version 1.0.  (See http://www.boost.org/LICENSE_1_0.txt).
++
++#include "../../../boost/atomic.hpp"
++#include "../../../boost/static_assert.hpp"
++
++int
++main(int argc, char *argv[])
++{
++  BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
++  return 0;
++}
+diff -Nurp boost_1_54_0/libs/thread/build/Jamfile.v2 boost_1_54_0.pm/libs/thread/build/Jamfile.v2
+--- boost_1_54_0/libs/thread/build/Jamfile.v2	2013-06-15 12:35:45.000000000 +0200
++++ boost_1_54_0.pm/libs/thread/build/Jamfile.v2	2013-08-23 19:52:30.018613408 +0200
+@@ -36,6 +36,7 @@ import os ;
+ import feature ;
+ import indirect ;
+ import path ;
++import configure ;
+ 
+ project boost/thread
+     : source-location ../src
+@@ -140,6 +141,8 @@ local rule default_threadapi ( )
+ feature.feature threadapi : pthread win32 : propagated ;
+ feature.set-default threadapi : [ default_threadapi ] ;
+ 
++exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ;
++
+ rule tag ( name : type ? : property-set )
+ {
+     local result = $(name) ;
+@@ -248,6 +251,12 @@ rule requirements ( properties * )
+ {
+     local result ;
+ 
++    if ! [ configure.builds has_atomic_flag_lockfree
++	   : $(properties) : "lockfree boost::atomic_flag" ]
++    {
++        result += <library>/boost/atomic//boost_atomic ;
++    }
++
+     if <threadapi>pthread in $(properties)
+     {
+         result += <define>BOOST_THREAD_POSIX ;
-- 
1.8.4.rc3




