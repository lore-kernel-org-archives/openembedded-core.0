Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A42177255
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:05:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so1604978wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 07:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U2jC56Hlm0s7GySOlSKXLbZVDM4Xbbt92A3UqPa0jZM=;
	b=Zn8H0ub2RfgNUCT4CzPVo4X4Bg28At7VdWL5ocQUsAI8ghmWjHO98mBVgqPQfKCkbx
	l5XBTJc/5i1GIphdvtwQfx6N5LMS72Dpyb181qXa3lHqfwEXySLRoa9PSmVZ/1pL6udA
	uoBwJUhuTGxF2cjMiJ7lvDtMylXHnLzCng9/sjdDFaFKUYPKrJDTflXGwuN+iA9w97hh
	M5QEeEf1klLzp+rs4tb3E43vHrdjjpAq+XxCmV1hZWo7RuGw0NiV47lDD1VFQzF2ABvT
	oLDkVkJfoWElRze0nw2ENoAC796Op285foeR2ZqPnFnnOtdKx+e6CNpwSgqArPEWDFU9
	t28A==
X-Gm-Message-State: AEkoousyESypXSw3fXynMGZWhsXgOutAv5RvRr8kp4QdeVYiUk8YtDUnCGIZZVZaylaLIg==
X-Received: by 10.28.100.70 with SMTP id y67mr9706769wmb.23.1470924354984;
	Thu, 11 Aug 2016 07:05:54 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o2sm2902464wjo.3.2016.08.11.07.05.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 07:05:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:06:11 +0100
Message-Id: <1470924371-1675-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Thu, 11 Aug 2016 14:05:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The libnl+musl combination has two issues at the moment:
a) a public header file #include's an incorrect file
   (sys/poll.h instead of poll.h), which causes warnings and
   potentially errors (-Werror) in a musl based system
b) musl only ever provides the XSI version of strerror_r()

a) can be fixed using a generic patch
b) has to be applied on demand for musl-based systems, only

Signed-off-by: André Draszik <git@andred.net>
---
 ...nclude-standard-poll.h-instead-of-sys-pol.patch |  40 +++++++
 .../libnl/0002-musl-fix-strerror_r-usage.patch     | 124 +++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.25.bb         |   2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-netlink.h-include-standard-poll.h-instead-of-sys-pol.patch
 create mode 100644 meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-usage.patch

diff --git a/meta/recipes-support/libnl/libnl/0001-netlink.h-include-standard-poll.h-instead-of-sys-pol.patch b/meta/recipes-support/libnl/libnl/0001-netlink.h-include-standard-poll.h-instead-of-sys-pol.patch
new file mode 100644
index 0000000..c9096ce
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0001-netlink.h-include-standard-poll.h-instead-of-sys-pol.patch
@@ -0,0 +1,40 @@
+From 7f73d736db539eb4c6e7d59ed9332615d10ea785 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Thu, 11 Aug 2016 11:53:44 +0100
+Subject: [PATCH 1/2] netlink.h: #include standard poll.h instead of sys/poll.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl issues a #warning if a non-standard file like is included
+instead of the posix version (sys/poll.h vs poll.h in this
+case).
+Given netlink.h is installed and intended to be used by other
+projects, those other projects fail to compile if they enable
+-Werror (e.g. crda).
+
+Just do the correct thing and #include <poll.h> (the file
+specified by posix).
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Pending
+ include/netlink/netlink.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/netlink/netlink.h b/include/netlink/netlink.h
+index 28dba06..61656b3 100644
+--- a/include/netlink/netlink.h
++++ b/include/netlink/netlink.h
+@@ -16,7 +16,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <stdlib.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-usage.patch b/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-usage.patch
new file mode 100644
index 0000000..3ded5b1
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0002-musl-fix-strerror_r-usage.patch
@@ -0,0 +1,124 @@
+From 4a88a12742ffc0a3ba3b4d4bd1398fa278ab1738 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Thu, 11 Aug 2016 13:15:23 +0100
+Subject: [PATCH 2/2] musl: fix strerror_r() usage
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc provides two versions of strerror_r(), which
+can be chosen between using feature test macros
+_GNU_SOURCE and _POSIX_C_SOURCE.
+musl on the other hand only ever provides the posix
+version of strerror_r().
+
+While this patch is not switching to the XSI version
+of strerror_r() in general, all implementations of
+the XSI version I have checked (bionic, uclibc,
+musl, glibc), fill buf with as many bytes as possible
+and NUL-terminate buf correctly.
+
+Switch to using XSI semantics. (This patch is only
+intended to be applied when compiling against
+musl - unfortunately musl doesn't provide any
+preprocessor directives to detect use of musl.)
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Inappropriate [musl specific]
+ lib/fib_lookup/lookup.c | 5 ++++-
+ lib/handlers.c          | 3 ++-
+ lib/msg.c               | 3 ++-
+ lib/route/route_obj.c   | 3 ++-
+ src/lib/utils.c         | 6 ++++--
+ 5 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fib_lookup/lookup.c b/lib/fib_lookup/lookup.c
+index 3d07317..490f04e 100644
+--- a/lib/fib_lookup/lookup.c
++++ b/lib/fib_lookup/lookup.c
+@@ -125,6 +125,9 @@ static void result_dump_line(struct nl_object *obj, struct nl_dump_params *p)
+ {
+ 	struct flnl_result *res = (struct flnl_result *) obj;
+ 	char buf[256];
++	char buf2[256];
++
++	strerror_r(-res->fr_error, buf2, sizeof(buf2));
+ 
+ 	nl_dump_line(p, "table %s prefixlen %u next-hop-selector %u\n",
+ 		rtnl_route_table2str(res->fr_table_id, buf, sizeof(buf)),
+@@ -133,7 +136,7 @@ static void result_dump_line(struct nl_object *obj, struct nl_dump_params *p)
+ 		     nl_rtntype2str(res->fr_type, buf, sizeof(buf)));
+ 	nl_dump(p, "scope %s error %s (%d)\n",
+ 		rtnl_scope2str(res->fr_scope, buf, sizeof(buf)),
+-		strerror_r(-res->fr_error, buf, sizeof(buf)), res->fr_error);
++		buf2, res->fr_error);
+ }
+ 
+ static void result_dump_details(struct nl_object *obj, struct nl_dump_params *p)
+diff --git a/lib/handlers.c b/lib/handlers.c
+index a6a97bb..1b9bb4f 100644
+--- a/lib/handlers.c
++++ b/lib/handlers.c
+@@ -81,8 +81,9 @@ static int nl_error_handler_verbose(struct sockaddr_nl *who,
+ 	FILE *ofd = arg ? arg : stderr;
+ 	char buf[256];
+ 
++	strerror_r(-e->error, buf, sizeof(buf));
+ 	fprintf(ofd, "-- Error received: %s\n-- Original message: ",
+-		strerror_r(-e->error, buf, sizeof(buf)));
++		buf);
+ 	print_header_content(ofd, &e->msg);
+ 	fprintf(ofd, "\n");
+ 
+diff --git a/lib/msg.c b/lib/msg.c
+index bcf1aa8..eec2833 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -916,8 +916,9 @@ static void dump_error_msg(struct nl_msg *msg, FILE *ofd)
+ 		char buf[256];
+ 		struct nl_msg *errmsg;
+ 
++		strerror_r(-err->error, buf, sizeof(buf));
+ 		fprintf(ofd, "    .error = %d \"%s\"\n", err->error,
+-			strerror_r(-err->error, buf, sizeof(buf)));
++			buf);
+ 		fprintf(ofd, "  [ORIGINAL MESSAGE] %zu octets\n", sizeof(*hdr));
+ 
+ 		errmsg = nlmsg_inherit(&err->msg);
+diff --git a/lib/route/route_obj.c b/lib/route/route_obj.c
+index dd4bf49..6fc4321 100644
+--- a/lib/route/route_obj.c
++++ b/lib/route/route_obj.c
+@@ -257,9 +257,10 @@ static void route_dump_details(struct nl_object *a, struct nl_dump_params *p)
+ 	}
+ 
+ 	if ((r->ce_mask & ROUTE_ATTR_CACHEINFO) && r->rt_cacheinfo.rtci_error) {
++		strerror_r(-r->rt_cacheinfo.rtci_error, buf, sizeof(buf));
+ 		nl_dump_line(p, "    cacheinfo error %d (%s)\n",
+ 			r->rt_cacheinfo.rtci_error,
+-			strerror_r(-r->rt_cacheinfo.rtci_error, buf, sizeof(buf)));
++			buf);
+ 	}
+ 
+ 	if (r->ce_mask & ROUTE_ATTR_METRICS) {
+diff --git a/src/lib/utils.c b/src/lib/utils.c
+index e5eacde..d9cc7a8 100644
+--- a/src/lib/utils.c
++++ b/src/lib/utils.c
+@@ -79,8 +79,10 @@ void nl_cli_fatal(int err, const char *fmt, ...)
+ 		vfprintf(stderr, fmt, ap);
+ 		va_end(ap);
+ 		fprintf(stderr, "\n");
+-	} else
+-		fprintf(stderr, "%s\n", strerror_r(err, buf, sizeof(buf)));
++	} else {
++		strerror_r(err, buf, sizeof(buf));
++		fprintf(stderr, "%s\n", buf);
++	}
+ 
+ 	exit(abs(err));
+ }
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
index cabe841..540b019 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -13,7 +13,9 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://0001-netlink.h-include-standard-poll.h-instead-of-sys-pol.patch \
           "
+SRC_URI_append_libc-musl = " file://0002-musl-fix-strerror_r-usage.patch"
 
 SRC_URI[md5sum] = "03f74d0cd5037cadc8cdfa313bbd195c"
 SRC_URI[sha256sum] = "8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5"
-- 
2.8.1


