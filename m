Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG6-000637-7a
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93qZj024787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:52 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:38 +0800
Message-ID: <a448a614527186062ba3225ee020d705984dbba3.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 3/8] libsdl: update to 1.2.15
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:38 -0000
Content-Type: text/plain

Update libsdl to 1.2.15.
Patch add.XGetRequest.symbol.patch is merged by upstream, so remove it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../libsdl-1.2.14/add.XGetRequest.symbol.patch     |   79 --------------------
 .../configure_tweak.patch                          |    0
 .../libsdl/{libsdl_1.2.14.bb => libsdl_1.2.15.bb}  |    7 +-
 3 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
 rename meta/recipes-graphics/libsdl/{libsdl-1.2.14 => libsdl-1.2.15}/configure_tweak.patch (100%)
 rename meta/recipes-graphics/libsdl/{libsdl_1.2.14.bb => libsdl_1.2.15.bb} (93%)

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
deleted file mode 100644
index 33ba8ec..0000000
--- a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From e49fe9e2d75764d2d7ef79ab4252a1f6b99adcd3 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Thu, 23 Feb 2012 18:38:19 +0100
-Subject: [PATCH] _XGetRequest API was backported to libx11-1.4.4 in:
- http://git.openembedded.org/openembedded-core/commit/?id=e08604800fe1cb8f240f53c147ceb4ee08a29b91
-
-This breaks e.g. libsdl-image build with:
-| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libSDL.so: undefined reference to `_XGetRequest'
-
-For details see: https://bugzilla.redhat.com/show_bug.cgi?id=782251
-
-Upstream-Status: Accepted
----
- src/video/x11/SDL_x11dyn.c |   24 ++++++++++++++++++++++++
- src/video/x11/SDL_x11sym.h |    6 ++++++
- 2 files changed, 30 insertions(+), 0 deletions(-)
-
-diff --git a/src/video/x11/SDL_x11dyn.c b/src/video/x11/SDL_x11dyn.c
-index 4e549b3..a7e800e 100644
---- a/src/video/x11/SDL_x11dyn.c
-+++ b/src/video/x11/SDL_x11dyn.c
-@@ -109,6 +109,21 @@ char *(*pXGetICValues)(XIC, ...) = NULL;
- #undef SDL_X11_SYM
- 
- 
-+static void *SDL_XGetRequest_workaround(Display* dpy, CARD8 type, size_t len)
-+{
-+	xReq *req;
-+	WORD64ALIGN
-+	if (dpy->bufptr + len > dpy->bufmax)
-+		_XFlush(dpy);
-+	dpy->last_req = dpy->bufptr;
-+	req = (xReq*)dpy->bufptr;
-+	req->reqType = type;
-+	req->length = len / 4;
-+	dpy->bufptr += len;
-+	dpy->request++;
-+	return req;
-+}
-+
- static int x11_load_refcount = 0;
- 
- void SDL_X11_UnloadSymbols(void)
-@@ -168,6 +183,15 @@ int SDL_X11_LoadSymbols(void)
- 		X11_GetSym("XGetICValues",&SDL_X11_HAVE_UTF8,(void **)&pXGetICValues);
- 		#endif
- 
-+		/*
-+		 * In case we're built with newer Xlib headers, we need to make sure
-+		 *  that _XGetRequest() is available, even on older systems.
-+		 *  Otherwise, various Xlib macros we use will call a NULL pointer.
-+		 */
-+		if (!SDL_X11_HAVE_XGETREQUEST) {
-+			p_XGetRequest = SDL_XGetRequest_workaround;
-+		}
-+
- 		if (SDL_X11_HAVE_BASEXLIB) {  /* all required symbols loaded. */
- 			SDL_ClearError();
- 		} else {
-diff --git a/src/video/x11/SDL_x11sym.h b/src/video/x11/SDL_x11sym.h
-index 3dfa146..f1e7841 100644
---- a/src/video/x11/SDL_x11sym.h
-+++ b/src/video/x11/SDL_x11sym.h
-@@ -170,6 +170,12 @@ SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,
- #endif
- 
- /*
-+ * libX11 1.4.99.1 added _XGetRequest, and macros use it behind the scenes.
-+ */
-+SDL_X11_MODULE(XGETREQUEST)
-+SDL_X11_SYM(void *,_XGetRequest,(Display* a,CARD8 b,size_t c),(a,b,c),return)
-+
-+/*
-  * These only show up on some variants of Unix.
-  */
- #if defined(__osf__)
--- 
-1.7.2.5
-
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
rename to meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
similarity index 93%
rename from meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
rename to meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 5c9e645..8b39442 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -18,17 +18,16 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            tslib"
 DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
 
-PR = "r7"
+PR = "r0"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
-           file://add.XGetRequest.symbol.patch \
        "
 
 S = "${WORKDIR}/SDL-${PV}"
 
-SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
-SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
+SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
+SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
1.7.5.4



