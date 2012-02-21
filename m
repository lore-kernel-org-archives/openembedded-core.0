Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rzuum-0001qa-MB
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 19:58:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 10:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119767419"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 10:49:56 -0800
Message-ID: <4F43E754.6070109@linux.intel.com>
Date: Tue, 21 Feb 2012 10:49:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKppqZH7G8fcPNyTR=R_s3jJxr21o2qwK7kySGjmR_fSKg@mail.gmail.com>
	<1329331538-20223-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1329331538-20223-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2] libsdl: add fix for new _XGetRequest symbol backported to libx11
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
X-List-Received-Date: Tue, 21 Feb 2012 18:58:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2012 10:45 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../libsdl-1.2.14/add.XGetRequest.symbol.patch     |   70 ++++++++++++++++++++
>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |    3 +-
>   2 files changed, 72 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
> new file mode 100644
> index 0000000..7bab177
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl/libsdl-1.2.14/add.XGetRequest.symbol.patch
> @@ -0,0 +1,70 @@
> +_XGetRequest API was backported to libx11-1.4.4 in:
> +http://git.openembedded.org/openembedded-core/commit/?id=e08604800fe1cb8f240f53c147ceb4ee08a29b91
> +
> +This breaks e.g. libsdl-image build with:
> +| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libSDL.so: undefined reference to `_XGetRequest'
> +
> +For details see: https://bugzilla.redhat.com/show_bug.cgi?id=782251
> +
> +Upstream-Status: Accepted
> +
> +@@ -, +, @@
> + added.
> + src/video/x11/SDL_x11dyn.c |   24 ++++++++++++++++++++++++
> + src/video/x11/SDL_x11sym.h |    6 ++++++
> + 2 files changed, 30 insertions(+), 0 deletions(-)
> +--- a/src/video/x11/SDL_x11dyn.c	
> ++++ a/src/video/x11/SDL_x11dyn.c	
> +@@ -109,6 +109,21 @@ char *(*pXGetICValues)(XIC, ...) = NULL;
> + #undef SDL_X11_SYM
> +
> +
> ++static void *SDL_XGetRequest_workaround(Display* dpy, CARD8 type, size_t len)
> ++{
> ++	xReq *req;
> ++	WORD64ALIGN
> ++	if (dpy->bufptr + len>  dpy->bufmax)
> ++		_XFlush(dpy);
> ++	dpy->last_req = dpy->bufptr;
> ++	req = (xReq*)dpy->bufptr;
> ++	req->reqType = type;
> ++	req->length = len / 4;
> ++	dpy->bufptr += len;
> ++	dpy->request++;
> ++	return req;
> ++}
> ++
> + static int x11_load_refcount = 0;
> +
> + void SDL_X11_UnloadSymbols(void)
> +@@ -168,6 +183,15 @@ int SDL_X11_LoadSymbols(void)
> + 		X11_GetSym("XGetICValues",&SDL_X11_HAVE_UTF8,(void **)&pXGetICValues);
> + 		#endif
> +
> ++		/*
> ++		 * In case we're built with newer Xlib headers, we need to make sure
> ++		 *  that _XGetRequest() is available, even on older systems.
> ++		 *  Otherwise, various Xlib macros we use will call a NULL pointer.
> ++		 */
> ++		if (!SDL_X11_HAVE_XGETREQUEST) {
> ++			p_XGetRequest = SDL_XGetRequest_workaround;
> ++		}
> ++
> + 		if (SDL_X11_HAVE_BASEXLIB) {  /* all required symbols loaded. */
> + 			SDL_ClearError();
> + 		} else {
> +--- a/src/video/x11/SDL_x11sym.h	
> ++++ a/src/video/x11/SDL_x11sym.h	
> +@@ -170,6 +170,12 @@ SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,
> + #endif
> +
> + /*
> ++ * libX11 1.4.99.1 added _XGetRequest, and macros use it behind the scenes.
> ++ */
> ++SDL_X11_MODULE(XGETREQUEST)
> ++SDL_X11_SYM(void *,_XGetRequest,(Display* a,CARD8 b,size_t c),(a,b,c),return)
> ++
> ++/*
> +  * These only show up on some variants of Unix.
> +  */
> + #if defined(__osf__)
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index f587291..5b87f39 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -15,10 +15,11 @@ PROVIDES = "virtual/libsdl"
>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
>   DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>              file://configure_tweak.patch \
> +           file://add.XGetRequest.symbol.patch \
>          "
>
>   S = "${WORKDIR}/SDL-${PV}"

Merged into OE-core

Thanks
	Sau!



