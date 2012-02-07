Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvS-0004HG-3C
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206446"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:48 -0800
Message-Id: <e08604800fe1cb8f240f53c147ceb4ee08a29b91.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/35] libx11: Backport _XGetRequest API
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:54:50 -0000

From: Khem Raj <raj.khem@gmail.com>

This API is relatively new and will be in next release of libX11
this is needed for OE qemu-native which links to libx11-native
but uses libGL from build system and herein lies the problem
if you have bleeding edge distro e.g. ubuntu 12.04(development)
libGL.so expects this API to be present. Backported to 1.4.4
thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |    3 +
 2 files changed, 140 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
new file mode 100644
index 0000000..aedb5c4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
@@ -0,0 +1,137 @@
+From 4a060f993bf676cf21ad9784e010f54134da7b40 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 17 Oct 2011 09:45:15 +1000
+Subject: [PATCH] Add _XGetRequest as substitute for GetReq/GetReqExtra
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Jamey Sharp <jamey@minilop.net>
+---
+ include/X11/Xlibint.h |   49 ++++++++++++++++---------------------------------
+ src/XlibInt.c         |   31 +++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+), 33 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
+index 2ce356d..43d1f2a 100644
+--- a/include/X11/Xlibint.h
++++ b/include/X11/Xlibint.h
+@@ -420,6 +420,18 @@ extern LockInfoPtr _Xglobal_lock;
+ #define WORD64ALIGN
+ #endif /* WORD64 */
+ 
++/**
++ * Return a len-sized request buffer for the request type. This function may
++ * flush the output queue.
++ *
++ * @param dpy The display connection
++ * @param type The request type
++ * @param len Length of the request in bytes
++ *
++ * @returns A pointer to the request buffer with a few default values
++ * initialized.
++ */
++extern void *_XGetRequest(Display *dpy, CARD8 type, size_t len);
+ 
+ /*
+  * GetReq - Get the next available X request packet in the buffer and
+@@ -432,25 +444,10 @@ extern LockInfoPtr _Xglobal_lock;
+ 
+ #if !defined(UNIXCPP) || defined(ANSICPP)
+ #define GetReq(name, req) \
+-        WORD64ALIGN\
+-	if ((dpy->bufptr + SIZEOF(x##name##Req)) > dpy->bufmax)\
+-		_XFlush(dpy);\
+-	req = (x##name##Req *)(dpy->last_req = dpy->bufptr);\
+-	req->reqType = X_##name;\
+-	req->length = (SIZEOF(x##name##Req))>>2;\
+-	dpy->bufptr += SIZEOF(x##name##Req);\
+-	dpy->request++
+-
++	req = (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##Req))
+ #else  /* non-ANSI C uses empty comment instead of "##" for token concatenation */
+ #define GetReq(name, req) \
+-        WORD64ALIGN\
+-	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req)) > dpy->bufmax)\
+-		_XFlush(dpy);\
+-	req = (x/**/name/**/Req *)(dpy->last_req = dpy->bufptr);\
+-	req->reqType = X_/**/name;\
+-	req->length = (SIZEOF(x/**/name/**/Req))>>2;\
+-	dpy->bufptr += SIZEOF(x/**/name/**/Req);\
+-	dpy->request++
++	req = (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**/name/**/Req))
+ #endif
+ 
+ /* GetReqExtra is the same as GetReq, but allocates "n" additional
+@@ -458,24 +455,10 @@ extern LockInfoPtr _Xglobal_lock;
+ 
+ #if !defined(UNIXCPP) || defined(ANSICPP)
+ #define GetReqExtra(name, n, req) \
+-        WORD64ALIGN\
+-	if ((dpy->bufptr + SIZEOF(x##name##Req) + n) > dpy->bufmax)\
+-		_XFlush(dpy);\
+-	req = (x##name##Req *)(dpy->last_req = dpy->bufptr);\
+-	req->reqType = X_##name;\
+-	req->length = (SIZEOF(x##name##Req) + n)>>2;\
+-	dpy->bufptr += SIZEOF(x##name##Req) + n;\
+-	dpy->request++
++	req = (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##Req) + n)
+ #else
+ #define GetReqExtra(name, n, req) \
+-        WORD64ALIGN\
+-	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req) + n) > dpy->bufmax)\
+-		_XFlush(dpy);\
+-	req = (x/**/name/**/Req *)(dpy->last_req = dpy->bufptr);\
+-	req->reqType = X_/**/name;\
+-	req->length = (SIZEOF(x/**/name/**/Req) + n)>>2;\
+-	dpy->bufptr += SIZEOF(x/**/name/**/Req) + n;\
+-	dpy->request++
++	req = (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**/name/**/Req) + n)
+ #endif
+ 
+ 
+diff --git a/src/XlibInt.c b/src/XlibInt.c
+index 3db151e..a8f5d08 100644
+--- a/src/XlibInt.c
++++ b/src/XlibInt.c
+@@ -1956,6 +1956,37 @@ Screen *_XScreenOfWindow(Display *dpy, Window w)
+ }
+ 
+ 
++/*
++ * WARNING: This implementation's pre-conditions and post-conditions
++ * must remain compatible with the old macro-based implementations of
++ * GetReq, GetReqExtra, GetResReq, and GetEmptyReq. The portions of the
++ * Display structure affected by those macros are part of libX11's
++ * ABI.
++ */
++void *_XGetRequest(Display *dpy, CARD8 type, size_t len)
++{
++    xReq *req;
++
++    WORD64ALIGN
++
++    if (dpy->bufptr + len > dpy->bufmax)
++	_XFlush(dpy);
++
++    if (len % 4)
++	fprintf(stderr,
++		"Xlib: request %d length %zd not a multiple of 4.\n",
++		type, len);
++
++    dpy->last_req = dpy->bufptr;
++
++    req = (xReq*)dpy->bufptr;
++    req->reqType = type;
++    req->length = len / 4;
++    dpy->bufptr += len;
++    dpy->request++;
++    return req;
++}
++
+ #if defined(WIN32)
+ 
+ /*
+-- 
+1.7.8.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
index 823b3dc..ee1d919 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
@@ -1,6 +1,8 @@
 require libx11.inc
 inherit gettext
 
+PR = "r1"
+
 BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11"
@@ -12,6 +14,7 @@ DEPENDS += "util-macros xtrans libxdmcp libxau \
 
 SRC_URI += " file://keysymdef_include.patch \
              file://x11_disable_makekeys.patch \
+             file://0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch \
              "
 
 SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
-- 
1.7.6.5



