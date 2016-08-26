Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8326475E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:31:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so10788749wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sLycO+zqK+PR9nFS/X+d6RE8y9hGE3mvLyr34+OJbUk=;
	b=RKQhBCyAxaztUqQhcAVlUYcihdJzJQT2U3DFgRiNmPRHMlKQllzByuWinFyo90kUEy
	AxNgz2GCkNecEORkWrnuXeuHF4JHVJT2pps1JYoc6SBdN0aWqtTbx2JXIGK1DEdOe/4A
	D4Njt2xTOKYb9B+nvn2N3nsNXTlYyEib1stNMqU+TqWWUNk2y9WBxKnDV8wGSuukWZxs
	8s6hgR8cOLsoqJtKSCXmWv0YpkuZnF6zFDIAPDTpqGgEhiaOLeb288nXgiXgfWGXtnDc
	3/1ytGNSKLIBSmw3I6oPX6qRT73hGINJHB7Xx6ZU8sXBFgfvCPa7g6eRzgh6Kp2Y9VaD
	8Jag==
X-Gm-Message-State: AE9vXwOHOQBtCMN+4JtooeCCqGX9kzctE1aZd/h0b6qUEA9ZQ88QImTIZEbma9eIpD7YrQ==
X-Received: by 10.194.88.137 with SMTP id bg9mr2940628wjb.155.1472207516937;
	Fri, 26 Aug 2016 03:31:56 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id i1sm19328827wjl.9.2016.08.26.03.31.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 03:31:56 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 11:31:52 +0100
Message-Id: <20160826103152.6211-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160826103152.6211-1-git@andred.net>
References: <20160826103152.6211-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/3] libnl: backport musl fix (strerror_r / strerror_l)
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
X-List-Received-Date: Fri, 26 Aug 2016 10:31:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

musl doesn't implement the non-posix compliant,
deprecated, glibc-only special version of strerror_r
that libnl had been using so far.

Backport the patch(set) that switches libnl over to
using strerror_l().

Signed-off-by: André Draszik <git@andred.net>
---
 ...01-lib-add-utility-function-nl_strerror_l.patch | 146 ++++++++
 ...to-using-strerror_l-instead-of-strerror_r.patch | 403 +++++++++++++++++++++
 ...to-using-strerror_l-instead-of-strerror_r.patch |  82 +++++
 meta/recipes-support/libnl/libnl_3.2.28.bb         |   5 +-
 4 files changed, 635 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-lib-add-utility-function-nl_strerror_l.patch
 create mode 100644 meta/recipes-support/libnl/libnl/0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch
 create mode 100644 meta/recipes-support/libnl/libnl/0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch

diff --git a/meta/recipes-support/libnl/libnl/0001-lib-add-utility-function-nl_strerror_l.patch b/meta/recipes-support/libnl/libnl/0001-lib-add-utility-function-nl_strerror_l.patch
new file mode 100644
index 0000000..b734028
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0001-lib-add-utility-function-nl_strerror_l.patch
@@ -0,0 +1,146 @@
+From 683f27fbb68ca2028a7b3468f17164d484df2759 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Thu, 25 Aug 2016 13:14:59 +0100
+Subject: [PATCH 1/3] lib: add utility function nl_strerror_l()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libnl currently uses strerror_r() throughout, but this is
+problematic because there is a non-standard GNU version
+implemented in glibc, and the standard POSIX version, which
+differ in signature. When using glibc, one can choose
+between the two versions using feature test macros
+_GNU_SOURCE and _POSIX_C_SOURCE.
+
+Given libnl is built using the former, we always get the
+glibc special version, and all code so far has been written
+for that non-standard version.
+
+Other C libraries like musl on the other hand only try
+to be posix compliant, and only ever provide the posix
+version of strerror_r(), which has a different signature.
+
+The alternative is to use strerror_l() rather than
+strerror_r() http://austingroupbugs.net/view.php?id=655
+- this will avoid the non-confirming versions issue
+- strerror_l() is now recommended by POSIX to replace
+  strerror_r() usage
+
+So rather than changing all uses of strerror_r() to be in
+line with posix, we are going to switch to the recommended
+interface strerror_l().
+
+Since strerror_l() is slightly more difficuly to use, we
+add a little (private) wrapper that we can use from all
+current callsites of strerror_r().
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
+Signed-off-by: Thomas Haller <thaller@redhat.com>
+---
+Upstream-Status: Backport https://github.com/thom311/libnl/commit/683f27fbb68ca2028a7b3468f17164d484df2759
+ include/Makefile.am             |  1 +
+ include/netlink-private/utils.h | 17 +++++++++++++++++
+ lib/utils.c                     | 24 ++++++++++++++++++++++++
+ libnl-3.sym                     |  5 +++++
+ 4 files changed, 47 insertions(+)
+ create mode 100644 include/netlink-private/utils.h
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index 804e984..f8b977a 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -166,6 +166,7 @@ noinst_HEADERS = \
+ 	netlink-private/socket.h \
+ 	netlink-private/tc.h \
+ 	netlink-private/types.h \
++	netlink-private/utils.h \
+ 	netlink-private/cache-api.h \
+ 	netlink-private/object-api.h \
+ 	netlink-private/route/link/api.h \
+diff --git a/include/netlink-private/utils.h b/include/netlink-private/utils.h
+new file mode 100644
+index 0000000..77aadb3
+--- /dev/null
++++ b/include/netlink-private/utils.h
+@@ -0,0 +1,17 @@
++/*
++ * netlink-private/utils.h	Local Utility Functions
++ *
++ *	This library is free software; you can redistribute it and/or
++ *	modify it under the terms of the GNU Lesser General Public
++ *	License as published by the Free Software Foundation version 2.1
++ *	of the License.
++ *
++ * Copyright (c) 2003-2012 Thomas Graf <tgraf@suug.ch>
++ */
++
++#ifndef NETLINK_UTILS_PRIV_H_
++#define NETLINK_UTILS_PRIV_H_
++
++extern const char *	nl_strerror_l(int err);
++
++#endif
+diff --git a/lib/utils.c b/lib/utils.c
+index 61c3d95..c1c1b72 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -25,10 +25,12 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/utils.h>
+ #include <linux/socket.h>
+ #include <stdlib.h> /* exit() */
++#include <locale.h>
+ 
+ /**
+  * Global variable indicating the desired level of debugging output.
+@@ -118,6 +120,28 @@ int __nl_read_num_str_file(const char *path, int (*cb)(long, const char *))
+ 
+ 	return 0;
+ }
++
++const char *nl_strerror_l(int err)
++{
++	int errno_save = errno;
++	locale_t loc = newlocale(LC_MESSAGES_MASK, "", (locale_t)0);
++	const char *buf;
++
++	if (loc == (locale_t)0) {
++		if (errno == ENOENT)
++			loc = newlocale(LC_MESSAGES_MASK,
++					"POSIX", (locale_t)0);
++	}
++	if (loc != (locale_t)0) {
++		buf = strerror_l(err, loc);
++		freelocale(loc);
++	} else {
++		buf = "newlocale() failed";
++	}
++
++	errno = errno_save;
++	return buf;
++}
+ /** @endcond */
+ 
+ /**
+diff --git a/libnl-3.sym b/libnl-3.sym
+index 4e09bdd..9119e66 100644
+--- a/libnl-3.sym
++++ b/libnl-3.sym
+@@ -351,3 +351,8 @@ libnl_3_2_28 {
+ global:
+ 	nl_object_diff64;
+ } libnl_3_2_27;
++
++libnl_3_2_29 {
++global:
++	nl_strerror_l;
++} libnl_3_2_28;
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/libnl/libnl/0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch b/meta/recipes-support/libnl/libnl/0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch
new file mode 100644
index 0000000..6347ec0
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch
@@ -0,0 +1,403 @@
+From c1948ec29b8dcdc58d2d92700c325abdeab111a6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Thu, 25 Aug 2016 13:15:00 +0100
+Subject: [PATCH 2/3] lib: switch to using strerror_l() instead of strerror_r()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc provides two versions of strerror_r(), which
+can be chosen between using feature test macros
+_GNU_SOURCE and _POSIX_C_SOURCE. libnl is built using
+the former, hence we get the glibc special version,
+and all code so far has been written for this.
+
+Other C libraries like musl on the other hand only try
+to be posix compliant, and only ever provide the posix
+version of strerror_r(), which has a different signature.
+
+Uses in libnl hence generally cause printf() of an *int*
+with a *string format* specifier for that reason.
+
+Additionally, strerror_r() has been deprecated:
+  http://austingroupbugs.net/view.php?id=655
+
+Switch to using strerror_l() (via our wrapper just
+introduced).
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
+Signed-off-by: Thomas Haller <thaller@redhat.com>
+---
+Upstream-Status: Backport https://github.com/thom311/libnl/commit/c1948ec29b8dcdc58d2d92700c325abdeab111a6
+ lib/cache_mngr.c        |  5 ++---
+ lib/fib_lookup/lookup.c |  3 ++-
+ lib/handlers.c          |  4 ++--
+ lib/msg.c               |  4 ++--
+ lib/nl.c                | 26 +++++++++-----------------
+ lib/route/route_obj.c   |  3 ++-
+ lib/socket.c            | 33 +++++++++++----------------------
+ 7 files changed, 30 insertions(+), 48 deletions(-)
+
+diff --git a/lib/cache_mngr.c b/lib/cache_mngr.c
+index b9eb345..1f23eb1 100644
+--- a/lib/cache_mngr.c
++++ b/lib/cache_mngr.c
+@@ -33,6 +33,7 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/cache.h>
+ #include <netlink/utils.h>
+@@ -392,10 +393,8 @@ int nl_cache_mngr_poll(struct nl_cache_mngr *mngr, int timeout)
+ 	ret = poll(&fds, 1, timeout);
+ 	NL_DBG(3, "Cache manager %p, poll() returned %d\n", mngr, ret);
+ 	if (ret < 0) {
+-		char buf[64];
+-
+ 		NL_DBG(4, "nl_cache_mngr_poll(%p): poll() failed with %d (%s)\n",
+-			mngr, errno, strerror_r(errno, buf, sizeof(buf)));
++			mngr, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+diff --git a/lib/fib_lookup/lookup.c b/lib/fib_lookup/lookup.c
+index 43b6126..efc862b 100644
+--- a/lib/fib_lookup/lookup.c
++++ b/lib/fib_lookup/lookup.c
+@@ -17,6 +17,7 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/attr.h>
+ #include <netlink/utils.h>
+@@ -133,7 +134,7 @@ static void result_dump_line(struct nl_object *obj, struct nl_dump_params *p)
+ 		     nl_rtntype2str(res->fr_type, buf, sizeof(buf)));
+ 	nl_dump(p, "scope %s error %s (%d)\n",
+ 		rtnl_scope2str(res->fr_scope, buf, sizeof(buf)),
+-		strerror_r(-res->fr_error, buf, sizeof(buf)), res->fr_error);
++		nl_strerror_l(-res->fr_error), res->fr_error);
+ }
+ 
+ static void result_dump_details(struct nl_object *obj, struct nl_dump_params *p)
+diff --git a/lib/handlers.c b/lib/handlers.c
+index 97a0d9c..4a48b99 100644
+--- a/lib/handlers.c
++++ b/lib/handlers.c
+@@ -26,6 +26,7 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/utils.h>
+ #include <netlink/msg.h>
+@@ -79,10 +80,9 @@ static int nl_error_handler_verbose(struct sockaddr_nl *who,
+ 				    struct nlmsgerr *e, void *arg)
+ {
+ 	FILE *ofd = arg ? arg : stderr;
+-	char buf[256];
+ 
+ 	fprintf(ofd, "-- Error received: %s\n-- Original message: ",
+-		strerror_r(-e->error, buf, sizeof(buf)));
++		nl_strerror_l(-e->error));
+ 	print_header_content(ofd, &e->msg);
+ 	fprintf(ofd, "\n");
+ 
+diff --git a/lib/msg.c b/lib/msg.c
+index e8a7e99..9af3f3a 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -27,6 +27,7 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/utils.h>
+ #include <netlink/cache.h>
+@@ -913,11 +914,10 @@ static void dump_error_msg(struct nl_msg *msg, FILE *ofd)
+ 	fprintf(ofd, "  [ERRORMSG] %zu octets\n", sizeof(*err));
+ 
+ 	if (nlmsg_len(hdr) >= sizeof(*err)) {
+-		char buf[256];
+ 		struct nl_msg *errmsg;
+ 
+ 		fprintf(ofd, "    .error = %d \"%s\"\n", err->error,
+-			strerror_r(-err->error, buf, sizeof(buf)));
++			nl_strerror_l(-err->error));
+ 		fprintf(ofd, "  [ORIGINAL MESSAGE] %zu octets\n", sizeof(*hdr));
+ 
+ 		errmsg = nlmsg_inherit(&err->msg);
+diff --git a/lib/nl.c b/lib/nl.c
+index 123f657..a45c3ea 100644
+--- a/lib/nl.c
++++ b/lib/nl.c
+@@ -27,6 +27,7 @@
+ 
+ #include <netlink-private/netlink.h>
+ #include <netlink-private/socket.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/utils.h>
+ #include <netlink/handlers.h>
+@@ -105,7 +106,6 @@ int nl_connect(struct nl_sock *sk, int protocol)
+ 	int errsv;
+ 	socklen_t addrlen;
+ 	struct sockaddr_nl local = { 0 };
+-	char buf[64];
+ 	int try_bind = 1;
+ 
+ #ifdef SOCK_CLOEXEC
+@@ -119,7 +119,7 @@ int nl_connect(struct nl_sock *sk, int protocol)
+ 	if (sk->s_fd < 0) {
+ 		errsv = errno;
+ 		NL_DBG(4, "nl_connect(%p): socket() failed with %d (%s)\n", sk, errsv,
+-			strerror_r(errsv, buf, sizeof(buf)));
++			nl_strerror_l(errsv));
+ 		err = -nl_syserr2nlerr(errsv);
+ 		goto errout;
+ 	}
+@@ -158,7 +158,7 @@ int nl_connect(struct nl_sock *sk, int protocol)
+ 				_nl_socket_used_ports_set(used_ports, port);
+ 			} else {
+ 				NL_DBG(4, "nl_connect(%p): bind() for port %u failed with %d (%s)\n",
+-					sk, (unsigned) port, errsv, strerror_r(errsv, buf, sizeof(buf)));
++					sk, (unsigned) port, errsv, nl_strerror_l(errsv));
+ 				_nl_socket_used_ports_release_all(used_ports);
+ 				err = -nl_syserr2nlerr(errsv);
+ 				goto errout;
+@@ -172,7 +172,7 @@ int nl_connect(struct nl_sock *sk, int protocol)
+ 		if (err != 0) {
+ 			errsv = errno;
+ 			NL_DBG(4, "nl_connect(%p): bind() failed with %d (%s)\n",
+-				sk, errsv, strerror_r(errsv, buf, sizeof(buf)));
++				sk, errsv, nl_strerror_l(errsv));
+ 			err = -nl_syserr2nlerr(errsv);
+ 			goto errout;
+ 		}
+@@ -183,7 +183,7 @@ int nl_connect(struct nl_sock *sk, int protocol)
+ 			  &addrlen);
+ 	if (err < 0) {
+ 		NL_DBG(4, "nl_connect(%p): getsockname() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		err = -nl_syserr2nlerr(errno);
+ 		goto errout;
+ 	}
+@@ -280,10 +280,8 @@ int nl_sendto(struct nl_sock *sk, void *buf, size_t size)
+ 	ret = sendto(sk->s_fd, buf, size, 0, (struct sockaddr *)
+ 		     &sk->s_peer, sizeof(sk->s_peer));
+ 	if (ret < 0) {
+-		char errbuf[64];
+-
+ 		NL_DBG(4, "nl_sendto(%p): sendto() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, errbuf, sizeof(errbuf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -343,10 +341,8 @@ int nl_sendmsg(struct nl_sock *sk, struct nl_msg *msg, struct msghdr *hdr)
+ 
+ 	ret = sendmsg(sk->s_fd, hdr, 0);
+ 	if (ret < 0) {
+-		char errbuf[64];
+-
+ 		NL_DBG(4, "nl_sendmsg(%p): sendmsg() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, errbuf, sizeof(errbuf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -706,15 +702,13 @@ retry:
+ 		goto abort;
+ 	}
+ 	if (n < 0) {
+-		char errbuf[64];
+-
+ 		if (errno == EINTR) {
+ 			NL_DBG(3, "recvmsg() returned EINTR, retrying\n");
+ 			goto retry;
+ 		}
+ 
+ 		NL_DBG(4, "nl_sendmsg(%p): nl_recv() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, errbuf, sizeof(errbuf)));
++			sk, errno, nl_strerror_l(errno));
+ 		retval = -nl_syserr2nlerr(errno);
+ 		goto abort;
+ 	}
+@@ -980,10 +974,8 @@ continue_reading:
+ 					goto out;
+ 				}
+ 			} else if (e->error) {
+-				char buf[64];
+-
+ 				NL_DBG(4, "recvmsgs(%p): RTNETLINK responded with %d (%s)\n",
+-					sk, -e->error, strerror_r(-e->error, buf, sizeof(buf)));
++					sk, -e->error, nl_strerror_l(-e->error));
+ 
+ 				/* Error message reported back from kernel. */
+ 				if (cb->cb_err) {
+diff --git a/lib/route/route_obj.c b/lib/route/route_obj.c
+index 7347ed2..21b67b1 100644
+--- a/lib/route/route_obj.c
++++ b/lib/route/route_obj.c
+@@ -31,6 +31,7 @@
+  */
+ 
+ #include <netlink-private/netlink.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/cache.h>
+ #include <netlink/utils.h>
+@@ -259,7 +260,7 @@ static void route_dump_details(struct nl_object *a, struct nl_dump_params *p)
+ 	if ((r->ce_mask & ROUTE_ATTR_CACHEINFO) && r->rt_cacheinfo.rtci_error) {
+ 		nl_dump_line(p, "    cacheinfo error %d (%s)\n",
+ 			r->rt_cacheinfo.rtci_error,
+-			strerror_r(-r->rt_cacheinfo.rtci_error, buf, sizeof(buf)));
++			nl_strerror_l(-r->rt_cacheinfo.rtci_error));
+ 	}
+ 
+ 	if (r->ce_mask & ROUTE_ATTR_METRICS) {
+diff --git a/lib/socket.c b/lib/socket.c
+index 97b2f69..55153b4 100644
+--- a/lib/socket.c
++++ b/lib/socket.c
+@@ -33,6 +33,7 @@
+ 
+ #include <netlink-private/netlink.h>
+ #include <netlink-private/socket.h>
++#include <netlink-private/utils.h>
+ #include <netlink/netlink.h>
+ #include <netlink/utils.h>
+ #include <netlink/handlers.h>
+@@ -449,11 +450,9 @@ int nl_socket_add_memberships(struct nl_sock *sk, int group, ...)
+ 		err = setsockopt(sk->s_fd, SOL_NETLINK, NETLINK_ADD_MEMBERSHIP,
+ 						 &group, sizeof(group));
+ 		if (err < 0) {
+-			char buf[64];
+-
+ 			va_end(ap);
+ 			NL_DBG(4, "nl_socket_add_memberships(%p): setsockopt() failed with %d (%s)\n",
+-				sk, errno, strerror_r(errno, buf, sizeof(buf)));
++				sk, errno, nl_strerror_l(errno));
+ 			return -nl_syserr2nlerr(errno);
+ 		}
+ 
+@@ -501,11 +500,9 @@ int nl_socket_drop_memberships(struct nl_sock *sk, int group, ...)
+ 		err = setsockopt(sk->s_fd, SOL_NETLINK, NETLINK_DROP_MEMBERSHIP,
+ 						 &group, sizeof(group));
+ 		if (err < 0) {
+-			char buf[64];
+-
+ 			va_end(ap);
+ 			NL_DBG(4, "nl_socket_drop_memberships(%p): setsockopt() failed with %d (%s)\n",
+-				sk, errno, strerror_r(errno, buf, sizeof(buf)));
++				sk, errno, nl_strerror_l(errno));
+ 			return -nl_syserr2nlerr(errno);
+ 		}
+ 
+@@ -619,7 +616,6 @@ int nl_socket_set_fd(struct nl_sock *sk, int protocol, int fd)
+ {
+ 	int err = 0;
+ 	socklen_t addrlen;
+-	char buf[64];
+ 	struct sockaddr_nl local = { 0 };
+ 	int so_type = -1, so_protocol = -1;
+ 
+@@ -633,7 +629,7 @@ int nl_socket_set_fd(struct nl_sock *sk, int protocol, int fd)
+ 	                  &addrlen);
+ 	if (err < 0) {
+ 		NL_DBG(4, "nl_socket_set_fd(%p,%d): getsockname() failed with %d (%s)\n",
+-		       sk, fd, errno, strerror_r(errno, buf, sizeof(buf)));
++		       sk, fd, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 	if (addrlen != sizeof(local))
+@@ -648,7 +644,7 @@ int nl_socket_set_fd(struct nl_sock *sk, int protocol, int fd)
+ 	err = getsockopt(fd, SOL_SOCKET, SO_TYPE, &so_type, &addrlen);
+ 	if (err < 0) {
+ 		NL_DBG(4, "nl_socket_set_fd(%p,%d): getsockopt() for SO_TYPE failed with %d (%s)\n",
+-		       sk, fd, errno, strerror_r(errno, buf, sizeof(buf)));
++		       sk, fd, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 	if (addrlen != sizeof(so_type))
+@@ -666,7 +662,7 @@ int nl_socket_set_fd(struct nl_sock *sk, int protocol, int fd)
+ 		if (errno == ENOPROTOOPT)
+ 			goto no_so_protocol;
+ 		NL_DBG(4, "nl_socket_set_fd(%p,%d): getsockopt() for SO_PROTOCOL failed with %d (%s)\n",
+-		       sk, fd, errno, strerror_r(errno, buf, sizeof(buf)));
++		       sk, fd, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 	if (addrlen != sizeof(so_protocol))
+@@ -709,10 +705,8 @@ int nl_socket_set_nonblocking(const struct nl_sock *sk)
+ 		return -NLE_BAD_SOCK;
+ 
+ 	if (fcntl(sk->s_fd, F_SETFL, O_NONBLOCK) < 0) {
+-		char buf[64];
+-
+ 		NL_DBG(4, "nl_socket_set_nonblocking(%p): fcntl() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -813,7 +807,6 @@ int nl_socket_modify_err_cb(struct nl_sock *sk, enum nl_cb_kind kind,
+ int nl_socket_set_buffer_size(struct nl_sock *sk, int rxbuf, int txbuf)
+ {
+ 	int err;
+-	char buf[64];
+ 
+ 	if (rxbuf <= 0)
+ 		rxbuf = 32768;
+@@ -828,7 +821,7 @@ int nl_socket_set_buffer_size(struct nl_sock *sk, int rxbuf, int txbuf)
+ 			 &txbuf, sizeof(txbuf));
+ 	if (err < 0) {
+ 		NL_DBG(4, "nl_socket_set_buffer_size(%p): setsockopt() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -836,7 +829,7 @@ int nl_socket_set_buffer_size(struct nl_sock *sk, int rxbuf, int txbuf)
+ 			 &rxbuf, sizeof(rxbuf));
+ 	if (err < 0) {
+ 		NL_DBG(4, "nl_socket_set_buffer_size(%p): setsockopt() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -890,10 +883,8 @@ int nl_socket_set_passcred(struct nl_sock *sk, int state)
+ 	err = setsockopt(sk->s_fd, SOL_SOCKET, SO_PASSCRED,
+ 			 &state, sizeof(state));
+ 	if (err < 0) {
+-		char buf[64];
+-
+ 		NL_DBG(4, "nl_socket_set_passcred(%p): setsockopt() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+@@ -922,10 +913,8 @@ int nl_socket_recv_pktinfo(struct nl_sock *sk, int state)
+ 	err = setsockopt(sk->s_fd, SOL_NETLINK, NETLINK_PKTINFO,
+ 			 &state, sizeof(state));
+ 	if (err < 0) {
+-		char buf[64];
+-
+ 		NL_DBG(4, "nl_socket_recv_pktinfo(%p): setsockopt() failed with %d (%s)\n",
+-			sk, errno, strerror_r(errno, buf, sizeof(buf)));
++			sk, errno, nl_strerror_l(errno));
+ 		return -nl_syserr2nlerr(errno);
+ 	}
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/libnl/libnl/0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch b/meta/recipes-support/libnl/libnl/0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch
new file mode 100644
index 0000000..a0f5a78
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch
@@ -0,0 +1,82 @@
+From 6c2d111177e91184073c44f83d4a6182aaba06d7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Thu, 25 Aug 2016 13:15:01 +0100
+Subject: [PATCH 3/3] src: switch to using strerror_l() instead of strerror_r()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc provides two versions of strerror_r(), which
+can be chosen between using feature test macros
+_GNU_SOURCE and _POSIX_C_SOURCE. libnl is built using
+the former, hence we get the glibc special version,
+and all code so far has been written for this.
+
+Other C libraries like musl on the other hand only try
+to be posix compliant, and only ever provide the posix
+version of strerror_r(), which has a different signature.
+
+Uses in libnl hence generally cause printf() of an *int*
+with a *string format* specifier for that reason.
+
+Additionally, strerror_r() has been deprecated:
+  http://austingroupbugs.net/view.php?id=655
+
+Switch to using strerror_l().
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
+Signed-off-by: Thomas Haller <thaller@redhat.com>
+---
+Upstream-Status: Backport https://github.com/thom311/libnl/commit/6c2d111177e91184073c44f83d4a6182aaba06d7
+ src/lib/utils.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/utils.c b/src/lib/utils.c
+index 467aaed..5878f27 100644
+--- a/src/lib/utils.c
++++ b/src/lib/utils.c
+@@ -22,6 +22,7 @@
+  */
+ 
+ #include <netlink/cli/utils.h>
++#include <locale.h>
+ 
+ /**
+  * Parse a text based 32 bit unsigned integer argument
+@@ -70,7 +71,6 @@ void nl_cli_print_version(void)
+ void nl_cli_fatal(int err, const char *fmt, ...)
+ {
+ 	va_list ap;
+-	char buf[256];
+ 
+ 	fprintf(stderr, "Error: ");
+ 
+@@ -79,8 +79,22 @@ void nl_cli_fatal(int err, const char *fmt, ...)
+ 		vfprintf(stderr, fmt, ap);
+ 		va_end(ap);
+ 		fprintf(stderr, "\n");
+-	} else
+-		fprintf(stderr, "%s\n", strerror_r(err, buf, sizeof(buf)));
++	} else {
++		char *buf;
++		locale_t loc = newlocale(LC_MESSAGES_MASK, "", (locale_t)0);
++		if (loc == (locale_t)0) {
++			if (errno == ENOENT)
++				loc = newlocale(LC_MESSAGES_MASK,
++						"POSIX", (locale_t)0);
++			if (loc == (locale_t)0)
++				buf = "newlocale() failed";
++		}
++		if (loc != (locale_t)0)
++			buf = strerror_l(err, loc);
++		fprintf(stderr, "%s\n", buf);
++		if (loc != (locale_t)0)
++			freelocale(loc);
++	}
+ 
+ 	exit(abs(err));
+ }
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
index b792818..7ddbd40 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -12,7 +12,10 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
-          "
+           file://0001-lib-add-utility-function-nl_strerror_l.patch \
+           file://0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch \
+           file://0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch \
+"
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
 SRC_URI[md5sum] = "bab12db1eb94a42129f712a44be91a67"
-- 
2.9.3


