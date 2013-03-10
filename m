Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEpbJ-0004je-Ru
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 00:24:28 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so3038424pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2013 16:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=WwPAkcILm3FfCPxU4A8ID9tVAiXBDZU7CZspQg3/gw8=;
	b=NT/r3wrLrLoI2bMb3UcL7U1ST3NuSpbFFdGEoE53iApb52asAbxGNQcRdEt0cSEJ0G
	y06N9dsXVGD4Bez0QpI3A3i+IZwLr6Kf+u3vSP3VtrBeoGbCtlnBVYShvo6hmwP+PNPi
	PQ/PFcPhTpkGJqC8RRGhqYrk1prY0l2zbr/s5lv60fl/wGucvqGxu2CCff5kuq4ouzx3
	XCGuMJXDYVSPfVi+jljfNmKy+hGTp/AgQ+7IqL1YjZmfYOtdDriJo8/kEI1v/cee/3Db
	MqTd7rRppvWEPJSr4tbA4yWC3SG/yN7NWpscU36PQw9d5S3rH6Tj8akGKAGoa+66Jvm/
	MMiA==
X-Received: by 10.68.136.97 with SMTP id pz1mr22657661pbb.205.1362956863948;
	Sun, 10 Mar 2013 16:07:43 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id eh5sm17335062pbc.44.2013.03.10.16.07.42
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Mar 2013 16:07:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2013 16:07:36 -0700
Message-Id: <1362956856-2153-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [OE-Core[PATCH V2] libtirpc: Fix build on uclibc
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
X-List-Received-Date: Sun, 10 Mar 2013 23:24:31 -0000

Last upgrade of libtirpc broke the uclibc specific
patch. So lets refresh it and make it compile for
uclibc again

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc-0.2.3/remove-des-uclibc.patch         |   45 ++++++++------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
index 4e828f6..d003348 100644
--- a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
@@ -3,33 +3,11 @@ uclibc does not provide des functionality unlike eglibc so lets disable ssl supp
 Upstream-Status: Inappropriate [uclibc specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: libtirpc-0.2.2/src/Makefile.am
+Index: libtirpc-0.2.3/src/rpc_soc.c
 ===================================================================
---- libtirpc-0.2.2.orig/src/Makefile.am	2013-01-23 14:08:58.802143165 -0800
-+++ libtirpc-0.2.2/src/Makefile.am	2013-01-23 18:06:22.970410357 -0800
-@@ -40,7 +40,7 @@
- # release number of your package. This is an abuse that only fosters
- # misunderstanding of the purpose of library versions."
- #
--libtirpc_la_LDFLAGS = -lnsl -lpthread -version-info 1:10:0
-+libtirpc_la_LDFLAGS = -lpthread -version-info 1:10:0
- 
- libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c clnt_bcast.c \
-         clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
-@@ -50,7 +50,7 @@
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
-         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c
-+        auth_time.c
- 
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
-Index: libtirpc-0.2.2/src/rpc_soc.c
-===================================================================
---- libtirpc-0.2.2.orig/src/rpc_soc.c	2011-05-02 05:10:40.000000000 -0700
-+++ libtirpc-0.2.2/src/rpc_soc.c	2013-01-23 18:07:28.894410317 -0800
-@@ -515,6 +515,7 @@
+--- libtirpc-0.2.3.orig/src/rpc_soc.c	2013-03-10 16:00:51.355282153 -0700
++++ libtirpc-0.2.3/src/rpc_soc.c	2013-03-10 16:00:51.703282148 -0700
+@@ -520,6 +520,7 @@
  	    (resultproc_t) rpc_wrap_bcast, "udp");
  }
  
@@ -37,7 +15,7 @@ Index: libtirpc-0.2.2/src/rpc_soc.c
  /*
   * Create the client des authentication object. Obsoleted by
   * authdes_seccreate().
-@@ -546,6 +547,7 @@
+@@ -551,6 +552,7 @@
  	dummy = authdes_seccreate(servername, window, NULL, ckey);
  	return (dummy);
  }
@@ -45,3 +23,16 @@ Index: libtirpc-0.2.2/src/rpc_soc.c
  
  /*
   * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
+Index: libtirpc-0.2.3/src/Makefile.am
+===================================================================
+--- libtirpc-0.2.3.orig/src/Makefile.am	2013-03-10 16:00:51.355282153 -0700
++++ libtirpc-0.2.3/src/Makefile.am	2013-03-10 16:00:51.703282148 -0700
+@@ -50,7 +50,7 @@
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c
++        auth_time.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
-- 
1.7.9.5



