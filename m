Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SoaxF-0007zU-V9
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 15:58:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Jul 2012 06:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="169852144"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2012 06:47:03 -0700
Message-ID: <4FFC3256.5000704@intel.com>
Date: Tue, 10 Jul 2012 16:47:02 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120709160033.D30BE10218@opal>
	<20120710104430.GA14050@jama.jama.net>
	<20120710111418.GB14050@jama.jama.net>
	<20120710132443.GC14050@jama.jama.net>
In-Reply-To: <20120710132443.GC14050@jama.jama.net>
Subject: Re: [oe-commits] Laurentiu Palcu : libx11: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 10 Jul 2012 13:58:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

When I upgrade a package, I build the package for all architectures.
That's how I find build issues on other architectures which I,
eventually, try to fix. Take, for example, directfb (1.6.1) which didn't
compile on mips. Libx11, however, compiled just fine. It turns out there
was something I missed in my process.

One thing I didn't do is clear sstate-cache before each build... Could
this be the reason I missed it?

Thanks,
Laurentiu

On 07/10/2012 04:24 PM, Martin Jansa wrote:
> On Tue, Jul 10, 2012 at 01:14:18PM +0200, Martin Jansa wrote:
>> On Tue, Jul 10, 2012 at 12:44:30PM +0200, Martin Jansa wrote:
>>> On Mon, Jul 09, 2012 at 04:00:32PM +0000, git@git.openembedded.org wrote:
>>>> Module: openembedded-core.git
>>>> Branch: master
>>>> Commit: 52d4ff7b35602faa52360a3e7a800891ef60c739
>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=52d4ff7b35602faa52360a3e7a800891ef60c739
>>>>
>>>> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>> Date:   Wed Jul  4 10:28:20 2012 +0300
>>>>
>>>> libx11: upgrade to 1.5.0
>>>>
>>>> Removed one backported patch.
>>>>
>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>
>>> This seems to break libx11 and libx11-native build:
>>>
>>> ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1.5.0-r0/temp/log.do_compile.20371 for further information)
>>> ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1.5.0-r0/temp/log.do_compile.20371
>>> Log data follows:
>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
>>> | DEBUG: Executing shell function do_compile
>>> | mv: cannot stat `makekeys.c.orig': No such file or directory
>>> | makekeys.c:33:27: fatal error: X11/Xresource.h: No such file or directory
>>> | compilation terminated.
>>> | ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/libx11-1_1.5.0-r0/temp/log.do_compile.20371 for further information)
>>> NOTE: package libx11-1_1.5.0-r0: task do_compile: Failed
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
>> index a1e4386..592f116 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
>> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
>> @@ -35,9 +35,9 @@ do_compile_prepend() {
>>                 sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
>>                 touch makekeys-makekeys.o;
>>                 if [ "${SITEINFO_BITS}" == "64" ]; then
>> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
>> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -I${S}/include -o makekeys
>>                 else
>> -                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
>> +                       ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -I${S}/include -o makekeys
>>                 fi
>>         )
>>         if [ "$?" != "0" ]; then
>>
>> + PR bump should be enough to fix that, but I'm wondering why you haven't seen it during tests (if this upgrade was tested at all).
> 
> And maybe whole makekeys build can now be done in tree, see:
> https://bugs.freedesktop.org/show_bug.cgi?id=22584
> http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=b2487d07f7b355f230a56e32c763acd08862735c
> http://cgit.freedesktop.org/xorg/lib/libX11/commit/src/util/Makefile.am?id=24283d40b1e4314c6647dda49d2a159833341a8b
> 
> Cheers,
> 
>>
>> Cheers,
>>
>>>
>>>> ---
>>>>
>>>>  ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 --------------------
>>>>  .../keysymdef_include.patch                        |    0
>>>>  .../makekeys_crosscompile.patch                    |    0
>>>>  .../x11_disable_makekeys.patch                     |   13 +-
>>>>  .../xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb}  |    7 +-
>>>>  5 files changed, 11 insertions(+), 146 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
>>>> deleted file mode 100644
>>>> index aedb5c4..0000000
>>>> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
>>>> +++ /dev/null
>>>> @@ -1,137 +0,0 @@
>>>> -From 4a060f993bf676cf21ad9784e010f54134da7b40 Mon Sep 17 00:00:00 2001
>>>> -From: Peter Hutterer <peter.hutterer@who-t.net>
>>>> -Date: Mon, 17 Oct 2011 09:45:15 +1000
>>>> -Subject: [PATCH] Add _XGetRequest as substitute for GetReq/GetReqExtra
>>>> -
>>>> -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
>>>> -Reviewed-by: Jamey Sharp <jamey@minilop.net>
>>>> ----
>>>> - include/X11/Xlibint.h |   49 ++++++++++++++++---------------------------------
>>>> - src/XlibInt.c         |   31 +++++++++++++++++++++++++++++++
>>>> - 2 files changed, 47 insertions(+), 33 deletions(-)
>>>> -
>>>> -Upstream-Status: Backport
>>>> -
>>>> -diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
>>>> -index 2ce356d..43d1f2a 100644
>>>> ---- a/include/X11/Xlibint.h
>>>> -+++ b/include/X11/Xlibint.h
>>>> -@@ -420,6 +420,18 @@ extern LockInfoPtr _Xglobal_lock;
>>>> - #define WORD64ALIGN
>>>> - #endif /* WORD64 */
>>>> - 
>>>> -+/**
>>>> -+ * Return a len-sized request buffer for the request type. This function may
>>>> -+ * flush the output queue.
>>>> -+ *
>>>> -+ * @param dpy The display connection
>>>> -+ * @param type The request type
>>>> -+ * @param len Length of the request in bytes
>>>> -+ *
>>>> -+ * @returns A pointer to the request buffer with a few default values
>>>> -+ * initialized.
>>>> -+ */
>>>> -+extern void *_XGetRequest(Display *dpy, CARD8 type, size_t len);
>>>> - 
>>>> - /*
>>>> -  * GetReq - Get the next available X request packet in the buffer and
>>>> -@@ -432,25 +444,10 @@ extern LockInfoPtr _Xglobal_lock;
>>>> - 
>>>> - #if !defined(UNIXCPP) || defined(ANSICPP)
>>>> - #define GetReq(name, req) \
>>>> --        WORD64ALIGN\
>>>> --	if ((dpy->bufptr + SIZEOF(x##name##Req)) > dpy->bufmax)\
>>>> --		_XFlush(dpy);\
>>>> --	req = (x##name##Req *)(dpy->last_req = dpy->bufptr);\
>>>> --	req->reqType = X_##name;\
>>>> --	req->length = (SIZEOF(x##name##Req))>>2;\
>>>> --	dpy->bufptr += SIZEOF(x##name##Req);\
>>>> --	dpy->request++
>>>> --
>>>> -+	req = (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##Req))
>>>> - #else  /* non-ANSI C uses empty comment instead of "##" for token concatenation */
>>>> - #define GetReq(name, req) \
>>>> --        WORD64ALIGN\
>>>> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req)) > dpy->bufmax)\
>>>> --		_XFlush(dpy);\
>>>> --	req = (x/**/name/**/Req *)(dpy->last_req = dpy->bufptr);\
>>>> --	req->reqType = X_/**/name;\
>>>> --	req->length = (SIZEOF(x/**/name/**/Req))>>2;\
>>>> --	dpy->bufptr += SIZEOF(x/**/name/**/Req);\
>>>> --	dpy->request++
>>>> -+	req = (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**/name/**/Req))
>>>> - #endif
>>>> - 
>>>> - /* GetReqExtra is the same as GetReq, but allocates "n" additional
>>>> -@@ -458,24 +455,10 @@ extern LockInfoPtr _Xglobal_lock;
>>>> - 
>>>> - #if !defined(UNIXCPP) || defined(ANSICPP)
>>>> - #define GetReqExtra(name, n, req) \
>>>> --        WORD64ALIGN\
>>>> --	if ((dpy->bufptr + SIZEOF(x##name##Req) + n) > dpy->bufmax)\
>>>> --		_XFlush(dpy);\
>>>> --	req = (x##name##Req *)(dpy->last_req = dpy->bufptr);\
>>>> --	req->reqType = X_##name;\
>>>> --	req->length = (SIZEOF(x##name##Req) + n)>>2;\
>>>> --	dpy->bufptr += SIZEOF(x##name##Req) + n;\
>>>> --	dpy->request++
>>>> -+	req = (x##name##Req *) _XGetRequest(dpy, X_##name, SIZEOF(x##name##Req) + n)
>>>> - #else
>>>> - #define GetReqExtra(name, n, req) \
>>>> --        WORD64ALIGN\
>>>> --	if ((dpy->bufptr + SIZEOF(x/**/name/**/Req) + n) > dpy->bufmax)\
>>>> --		_XFlush(dpy);\
>>>> --	req = (x/**/name/**/Req *)(dpy->last_req = dpy->bufptr);\
>>>> --	req->reqType = X_/**/name;\
>>>> --	req->length = (SIZEOF(x/**/name/**/Req) + n)>>2;\
>>>> --	dpy->bufptr += SIZEOF(x/**/name/**/Req) + n;\
>>>> --	dpy->request++
>>>> -+	req = (x/**/name/**/Req *) _XGetRequest(dpy, X_/**/name, SIZEOF(x/**/name/**/Req) + n)
>>>> - #endif
>>>> - 
>>>> - 
>>>> -diff --git a/src/XlibInt.c b/src/XlibInt.c
>>>> -index 3db151e..a8f5d08 100644
>>>> ---- a/src/XlibInt.c
>>>> -+++ b/src/XlibInt.c
>>>> -@@ -1956,6 +1956,37 @@ Screen *_XScreenOfWindow(Display *dpy, Window w)
>>>> - }
>>>> - 
>>>> - 
>>>> -+/*
>>>> -+ * WARNING: This implementation's pre-conditions and post-conditions
>>>> -+ * must remain compatible with the old macro-based implementations of
>>>> -+ * GetReq, GetReqExtra, GetResReq, and GetEmptyReq. The portions of the
>>>> -+ * Display structure affected by those macros are part of libX11's
>>>> -+ * ABI.
>>>> -+ */
>>>> -+void *_XGetRequest(Display *dpy, CARD8 type, size_t len)
>>>> -+{
>>>> -+    xReq *req;
>>>> -+
>>>> -+    WORD64ALIGN
>>>> -+
>>>> -+    if (dpy->bufptr + len > dpy->bufmax)
>>>> -+	_XFlush(dpy);
>>>> -+
>>>> -+    if (len % 4)
>>>> -+	fprintf(stderr,
>>>> -+		"Xlib: request %d length %zd not a multiple of 4.\n",
>>>> -+		type, len);
>>>> -+
>>>> -+    dpy->last_req = dpy->bufptr;
>>>> -+
>>>> -+    req = (xReq*)dpy->bufptr;
>>>> -+    req->reqType = type;
>>>> -+    req->length = len / 4;
>>>> -+    dpy->bufptr += len;
>>>> -+    dpy->request++;
>>>> -+    return req;
>>>> -+}
>>>> -+
>>>> - #if defined(WIN32)
>>>> - 
>>>> - /*
>>>> --- 
>>>> -1.7.8.3
>>>> -
>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch
>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch
>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch
>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
>>>> similarity index 74%
>>>> rename from meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
>>>> rename to meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
>>>> index e3782a5..69f9e6c 100644
>>>> --- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
>>>> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
>>>> @@ -1,10 +1,10 @@
>>>>  Upstream-Status: Pending
>>>>  
>>>> -Index: libX11-1.3.4/src/util/Makefile.am
>>>> +Index: libX11-1.5.0/src/util/Makefile.am
>>>>  ===================================================================
>>>> ---- libX11-1.3.4.orig/src/util/Makefile.am
>>>> -+++ libX11-1.3.4/src/util/Makefile.am
>>>> -@@ -1,24 +1 @@
>>>> +--- libX11-1.5.0.orig/src/util/Makefile.am
>>>> ++++ libX11-1.5.0/src/util/Makefile.am
>>>> +@@ -1,27 +1,2 @@
>>>>  -
>>>>  -noinst_PROGRAMS=makekeys
>>>>  -
>>>> @@ -12,13 +12,16 @@ Index: libX11-1.3.4/src/util/Makefile.am
>>>>  -	$(X11_CFLAGS) \
>>>>  -	$(CWARNFLAGS)
>>>>  -
>>>> +-makekeys_CPPFLAGS = \
>>>> +-	-I$(top_srcdir)/include
>>>> +-
>>>>  -CC = @CC_FOR_BUILD@
>>>>  -CPPFLAGS = @CPPFLAGS_FOR_BUILD@
>>>>  -CFLAGS = @CFLAGS_FOR_BUILD@
>>>>  -LDFLAGS = @LDFLAGS_FOR_BUILD@
>>>>  -
>>>>   EXTRA_DIST = mkks.sh
>>>> --
>>>> + 
>>>>  -if LINT
>>>>  -# Check source code with tools like lint & sparse
>>>>  -
>>>> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>>>> similarity index 67%
>>>> rename from meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
>>>> rename to meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>>>> index 1ad8046..04805d7 100644
>>>> --- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
>>>> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>>>> @@ -1,7 +1,7 @@
>>>>  require libx11.inc
>>>>  inherit gettext
>>>>  
>>>> -PR = "r3"
>>>> +PR = "r0"
>>>>  
>>>>  BBCLASSEXTEND = "native nativesdk"
>>>>  
>>>> @@ -14,9 +14,8 @@ DEPENDS += "util-macros xtrans libxdmcp libxau \
>>>>  
>>>>  SRC_URI += " file://keysymdef_include.patch \
>>>>               file://x11_disable_makekeys.patch \
>>>> -             file://0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch \
>>>>               file://makekeys_crosscompile.patch \
>>>>               "
>>>>  
>>>> -SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
>>>> -SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
>>>> +SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
>>>> +SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-commits mailing list
>>>> Openembedded-commits@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>>
>>> -- 
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>>
>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 



