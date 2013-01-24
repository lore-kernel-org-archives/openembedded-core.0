Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGZ-0000rM-SO
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so3799891pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=RLNF6qjNe7rKl2JCT0Vzq2jmFHKUObTeJ/9l3/EuBkY=;
	b=BIbrtL3TWOuGj3At5/rRcp9D5wM1BQNYffpSSo3p7kss9lHkvOkOgoWinjg7ZcYrne
	tFMsNF0NUgT8rw7EuZaC9nDtA3iDYlCXyg1KQpXAOX0kL5UixmVR2s++FUw920kS9mx9
	gI9vj3K3IoiUU1xeML6VvcmlppzGw/Sie02JzwFLdxVx7lBgc5353ad4ifT2dn7rJW/X
	IQpgyR6UvebjIdf7lLPHz+Wm2AiZc/tQTb6JKnY3BvgQdR4Y0HUXUfdwOfUzFemd4+fx
	ptgFvtjHZsH81CR43Ve0niF4qKF7DpN+mcFujs9vncTctojshElh3WwckTXu91ERgrTO
	yPyA==
X-Received: by 10.66.73.167 with SMTP id m7mr7921951pav.68.1359061669447;
	Thu, 24 Jan 2013 13:07:49 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.48
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:24 -0800
Message-Id: <485a026cbe0fb6916148e9a7d8e52655e8f0274e.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 03/11] libtirpc: Disable DES functions on uclibc
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
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

uclibc does not provide these functions so dont expect them

/usr/lib/libtirpc.so: undefined reference to `key_encryptsession_pk'
/usr/lib/libtirpc.so: undefined reference to `getnetname'
/usr/lib/libtirpc.so: undefined reference to `cbc_crypt'
/usr/lib/libtirpc.so: undefined reference to `ecb_crypt'
/usr/lib/libtirpc.so: undefined reference to `getpublickey'
/usr/lib/libtirpc.so: undefined reference to `key_gendes'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc-0.2.2/remove-des-uclibc.patch         |   47 ++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch
new file mode 100644
index 0000000..4e828f6
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch
@@ -0,0 +1,47 @@
+uclibc does not provide des functionality unlike eglibc so lets disable ssl support
+
+Upstream-Status: Inappropriate [uclibc specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libtirpc-0.2.2/src/Makefile.am
+===================================================================
+--- libtirpc-0.2.2.orig/src/Makefile.am	2013-01-23 14:08:58.802143165 -0800
++++ libtirpc-0.2.2/src/Makefile.am	2013-01-23 18:06:22.970410357 -0800
+@@ -40,7 +40,7 @@
+ # release number of your package. This is an abuse that only fosters
+ # misunderstanding of the purpose of library versions."
+ #
+-libtirpc_la_LDFLAGS = -lnsl -lpthread -version-info 1:10:0
++libtirpc_la_LDFLAGS = -lpthread -version-info 1:10:0
+ 
+ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c clnt_bcast.c \
+         clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
+@@ -50,7 +50,7 @@
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
+         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c
++        auth_time.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+Index: libtirpc-0.2.2/src/rpc_soc.c
+===================================================================
+--- libtirpc-0.2.2.orig/src/rpc_soc.c	2011-05-02 05:10:40.000000000 -0700
++++ libtirpc-0.2.2/src/rpc_soc.c	2013-01-23 18:07:28.894410317 -0800
+@@ -515,6 +515,7 @@
+ 	    (resultproc_t) rpc_wrap_bcast, "udp");
+ }
+ 
++#if 0
+ /*
+  * Create the client des authentication object. Obsoleted by
+  * authdes_seccreate().
+@@ -546,6 +547,7 @@
+ 	dummy = authdes_seccreate(servername, window, NULL, ckey);
+ 	return (dummy);
+ }
++#endif
+ 
+ /*
+  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
index 295ca83..36591bf 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
@@ -19,6 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
            file://obsolete_automake_macros.patch \
           "
 
+SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
+
 SRC_URI[libtirpc.md5sum] = "74c41c15c2909f7d11d9c7bfa7db6273"
 SRC_URI[libtirpc.sha256sum] = "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
-- 
1.7.9.5



