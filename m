Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 292E379D54
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 10:26:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t13so2977193ply.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Dec 2018 02:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=enou658JvJMDJ9lr7RCWohVeFdflm7/eB0X3KjF4vos=;
	b=NSxs1ab776Zbg3mfSdtp3fJicOv/z5n88sibVkaRsOGOEnxHPvH/otiePoENHiybTo
	e9I1su8ybhhImBZdt424sTLtiq8pHJ5aARHGeKRm62ZtDXxvR7nsHVYzw/3+ODwE45bD
	RUHU0NK0z1pGosp5rpFY2shTzwq8ncin8OuFhj5xuzigVuvUG22V1kV8wJhu5lLF2429
	rmzs1MdO+dn1qnDd+BL6jQSiDA34ZBVRVOXzdJ6AC8bwbTH9mv5ByTpPBAhxa72P14Ax
	QOMdrzIOii+G39BP6LFBM0KV+9k9cJvzm4Gf6migNUO4N97QN36SQPWFKKReRKJYgH39
	YLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=enou658JvJMDJ9lr7RCWohVeFdflm7/eB0X3KjF4vos=;
	b=Ymk7721ZD/mXllhXiec8mPjtqOPuYyL2I4zMXDPLWPmuYFzMayBcduGPSvRZGUPCIn
	EnXk9eNxSU2JK+9m+EkUS3aZcHpMsKZF80kAcDPL9pV5JuUnWIE/713tnGGS0m7GFoEI
	Pjzrpn5hxCZ88+rzLuO8wdmRhpXF0ZwhndJVYJVcuIWNF9B4Zq0N3Ng2m1jIoCnSfG/k
	dAdIUnWnfnMuasWStob6TnXJCKQycLhGE/LObB+Uqx6/9HaUHVKWC9a0HLvi+1sm8A1Z
	wW+FApeZh4dVz3fr2cnNo/9iyhVwPgEikNEwJJBAysP5ksr6sLHpWnEgeFCzxVz+It2R
	veVw==
X-Gm-Message-State: AA+aEWa2upKkk+pAlEKcjOaW0vchcYoFOFvLcH6j6tyuuyASbzsgtTNy
	59kIIMLlozdVE1zZ9XpEfLAHH3h4690=
X-Google-Smtp-Source: AFSGD/XDpBSjrRgjP/aEnZaFceEmRvSMiyGbRmhPef4IrCrCaqMKN9GhCeu4O7g2hj5C4rv8gdeZfQ==
X-Received: by 2002:a17:902:e20b:: with SMTP id
	ce11mr5075340plb.251.1544264811852; 
	Sat, 08 Dec 2018 02:26:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	h74sm9642398pfd.35.2018.12.08.02.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Dec 2018 02:26:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Dec 2018 02:26:38 -0800
Message-Id: <20181208102638.44170-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181208102638.44170-1-raj.khem@gmail.com>
References: <20181208102638.44170-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nfs-utils: Fix build with clang
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
X-List-Received-Date: Sat, 08 Dec 2018 10:26:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nfs-utils/clang-format-string.patch       | 183 ++++++++++++++++++
 .../nfs-utils/nfs-utils_2.3.3.bb              |   2 +-
 2 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch
new file mode 100644
index 0000000000..1d693e4142
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch
@@ -0,0 +1,183 @@
+Clang comes up with more printf format warnings
+Correcting “format string is not a string literal” warning
+requires us to declare that parameter is a printf style 
+format using the attribute flag
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: nfs-utils-2.3.3/support/include/xcommon.h
+===================================================================
+--- nfs-utils-2.3.3.orig/support/include/xcommon.h
++++ nfs-utils-2.3.3/support/include/xcommon.h
+@@ -27,7 +27,7 @@
+ 
+ /* Functions in sundries.c that are used in mount.c and umount.c  */ 
+ char *canonicalize (const char *path);
+-void nfs_error (const char *fmt, ...);
++void nfs_error (const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
+ void *xmalloc (size_t size);
+ void *xrealloc(void *p, size_t size);
+ void xfree(void *);
+@@ -36,9 +36,9 @@ char *xstrndup (const char *s, int n);
+ char *xstrconcat2 (const char *, const char *);
+ char *xstrconcat3 (const char *, const char *, const char *);
+ char *xstrconcat4 (const char *, const char *, const char *, const char *);
+-void die (int errcode, const char *fmt, ...);
++void die (int errcode, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
+ 
+-extern void die(int err, const char *fmt, ...);
++extern void die(int err, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
+ extern void (*at_die)(void);
+ 
+ /* exit status - bits below are ORed */
+Index: nfs-utils-2.3.3/support/include/xlog.h
+===================================================================
+--- nfs-utils-2.3.3.orig/support/include/xlog.h
++++ nfs-utils-2.3.3/support/include/xlog.h
+@@ -43,10 +43,10 @@ void			xlog_config(int fac, int on);
+ void			xlog_sconfig(char *, int on);
+ void			xlog_from_conffile(char *);
+ int			xlog_enabled(int fac);
+-void			xlog(int fac, const char *fmt, ...);
+-void			xlog_warn(const char *fmt, ...);
+-void			xlog_err(const char *fmt, ...);
+-void			xlog_errno(int err, const char *fmt, ...);
+-void			xlog_backend(int fac, const char *fmt, va_list args);
++void			xlog(int fac, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
++void			xlog_warn(const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
++void			xlog_err(const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
++void			xlog_errno(int err, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
++void			xlog_backend(int fac, const char *fmt, va_list args) __attribute__((__format__ (__printf__, 2, 0)));
+ 
+ #endif /* XLOG_H */
+Index: nfs-utils-2.3.3/support/nfs/xcommon.c
+===================================================================
+--- nfs-utils-2.3.3.orig/support/nfs/xcommon.c
++++ nfs-utils-2.3.3/support/nfs/xcommon.c
+@@ -93,7 +93,10 @@ nfs_error (const char *fmt, ...) {
+ 
+      fmt2 = xstrconcat2 (fmt, "\n");
+      va_start (args, fmt);
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wformat-nonliteral"
+      vfprintf (stderr, fmt2, args);
++#pragma clang diagnostic pop
+      va_end (args);
+      free (fmt2);
+ }
+Index: nfs-utils-2.3.3/utils/exportfs/exportfs.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/exportfs/exportfs.c
++++ nfs-utils-2.3.3/utils/exportfs/exportfs.c
+@@ -644,6 +644,7 @@ out:
+ 	return result;
+ }
+ 
++__attribute__((__format__ (__printf__, 2, 3)))
+ static char
+ dumpopt(char c, char *fmt, ...)
+ {
+Index: nfs-utils-2.3.3/utils/statd/statd.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/statd/statd.c
++++ nfs-utils-2.3.3/utils/statd/statd.c
+@@ -136,7 +136,7 @@ static void log_modes(void)
+ 	strcat(buf, "TI-RPC ");
+ #endif
+ 
+-	xlog_warn(buf);
++	xlog_warn("%s", buf);
+ }
+ 
+ /*
+Index: nfs-utils-2.3.3/support/nfs/svc_create.c
+===================================================================
+--- nfs-utils-2.3.3.orig/support/nfs/svc_create.c
++++ nfs-utils-2.3.3/support/nfs/svc_create.c
+@@ -184,7 +184,7 @@ svc_create_sock(const struct sockaddr *s
+ 		type = SOCK_STREAM;
+ 		break;
+ 	default:
+-		xlog(D_GENERAL, "%s: Unrecognized bind address semantics: %u",
++		xlog(D_GENERAL, "%s: Unrecognized bind address semantics: %lu",
+ 			__func__, nconf->nc_semantics);
+ 		return -1;
+ 	}
+Index: nfs-utils-2.3.3/support/nsm/rpc.c
+===================================================================
+--- nfs-utils-2.3.3.orig/support/nsm/rpc.c
++++ nfs-utils-2.3.3/support/nsm/rpc.c
+@@ -182,7 +182,7 @@ nsm_xmit_getport(const int sock, const s
+ 	uint32_t xid;
+ 	XDR xdr;
+ 
+-	xlog(D_CALL, "Sending PMAP_GETPORT for %u, %u, udp", program, version);
++	xlog(D_CALL, "Sending PMAP_GETPORT for %lu, %lu, udp", program, version);
+ 
+ 	nsm_init_xdrmem(msgbuf, NSM_MAXMSGSIZE, &xdr);
+ 	xid = nsm_init_rpc_header(PMAPPROG, PMAPVERS,
+Index: nfs-utils-2.3.3/utils/mountd/cache.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/mountd/cache.c
++++ nfs-utils-2.3.3/utils/mountd/cache.c
+@@ -968,8 +968,7 @@ lookup_export(char *dom, char *path, str
+ 			} else if (found_type == i && found->m_warned == 0) {
+ 				xlog(L_WARNING, "%s exported to both %s and %s, "
+ 				     "arbitrarily choosing options from first",
+-				     path, found->m_client->m_hostname, exp->m_client->m_hostname,
+-				     dom);
++				     path, found->m_client->m_hostname, exp->m_client->m_hostname);
+ 				found->m_warned = 1;
+ 			}
+ 		}
+Index: nfs-utils-2.3.3/utils/mountd/mountd.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/mountd/mountd.c
++++ nfs-utils-2.3.3/utils/mountd/mountd.c
+@@ -213,7 +213,7 @@ static void
+ sig_hup (int sig)
+ {
+ 	/* don't exit on SIGHUP */
+-	xlog (L_NOTICE, "Received SIGHUP... Ignoring.\n", sig);
++	xlog (L_NOTICE, "Received SIGHUP(%d)... Ignoring.\n", sig);
+ 	return;
+ }
+ 
+Index: nfs-utils-2.3.3/utils/statd/rmtcall.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/statd/rmtcall.c
++++ nfs-utils-2.3.3/utils/statd/rmtcall.c
+@@ -247,7 +247,7 @@ process_reply(FD_SET_TYPE *rfds)
+ 		xlog_warn("%s: service %d not registered on localhost",
+ 			__func__, NL_MY_PROG(lp));
+ 	} else {
+-		xlog(D_GENERAL, "%s: Callback to %s (for %d) succeeded",
++		xlog(D_GENERAL, "%s: Callback to %s (for %s) succeeded",
+ 			__func__, NL_MY_NAME(lp), NL_MON_NAME(lp));
+ 	}
+ 	nlist_free(&notify, lp);
+Index: nfs-utils-2.3.3/utils/statd/svc_run.c
+===================================================================
+--- nfs-utils-2.3.3.orig/utils/statd/svc_run.c
++++ nfs-utils-2.3.3/utils/statd/svc_run.c
+@@ -53,6 +53,7 @@
+ 
+ #include <errno.h>
+ #include <time.h>
++#include <inttypes.h>
+ #include "statd.h"
+ #include "notlist.h"
+ 
+@@ -104,8 +105,8 @@ my_svc_run(int sockfd)
+ 
+ 			tv.tv_sec  = NL_WHEN(notify) - now;
+ 			tv.tv_usec = 0;
+-			xlog(D_GENERAL, "Waiting for reply... (timeo %d)",
+-							tv.tv_sec);
++			xlog(D_GENERAL, "Waiting for reply... (timeo %jd)",
++							(intmax_t)tv.tv_sec);
+ 			selret = select(FD_SETSIZE, &readfds,
+ 				(void *) 0, (void *) 0, &tv);
+ 		} else {
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 572ae3146f..6be2aab47c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -32,8 +32,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-musl-limits.patch \
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
            file://0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch \
+           file://clang-format-string.patch \
 "
-
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
 SRC_URI[md5sum] = "b6c9c032995af1c08fea9fbcc1ce33e9"
-- 
2.19.2


