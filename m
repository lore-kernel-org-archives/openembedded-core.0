Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D31F78555
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:19:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0MJJaW8004292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 22 Jan 2018 11:19:37 -0800
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 22 Jan 2018 11:19:35 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180122165656.53234-1-Randy.MacLeod@windriver.com>
	<CAJTo0LbS=RKZjUMjByxmv88Us-3n_21GSKuSzY5CjhwSkrop3w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <096b46d0-97d4-5a8b-5cee-0f62c9ab61a2@windriver.com>
Date: Mon, 22 Jan 2018 14:19:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbS=RKZjUMjByxmv88Us-3n_21GSKuSzY5CjhwSkrop3w@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: link mesautil with pthreads
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
X-List-Received-Date: Mon, 22 Jan 2018 19:19:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2018-01-22 12:16 PM, Burton, Ross wrote:
> Upstream-Status tag needs to be in the patch you add, not the commit 
> message.
> 
> Ross

Picky, picky! :)

Done.


Next patch, I'll see if local patchtest check works now.
Last time I tried using it, it was busted.

../Randy

> 
> On 22 January 2018 at 16:56, Randy MacLeod <Randy.MacLeod@windriver.com 
> <mailto:Randy.MacLeod@windriver.com>> wrote:
> 
>     Cherry-pick fix from mesa upstream:
>         23ce168048 link mesautil with pthreads
> 
>     link mesautil with pthreads to avoid:
> 
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_setname':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66:
>     undefined reference to `pthread_setname_np'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `thrd_join':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336:
>     undefined reference to `pthread_join'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_create':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48:
>     undefined reference to `pthread_sigmask'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `thrd_create':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296:
>     undefined reference to `pthread_create'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_create':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
>     undefined reference to `pthread_sigmask'
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
>     undefined reference to `pthread_sigmask'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `call_once':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96:
>     undefined reference to `pthread_once'
>     ../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_get_time_nano':
>     /builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84:
>     undefined reference to `pthread_getcpuclockid'
>     collect2: error: ld returned 1 exit status
> 
>     Upstream-Status: backport
> 
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     ---
>       .../files/0001-link-mesautil-with-pthreads.patch   | 51
>     ++++++++++++++++++++++
>       meta/recipes-graphics/mesa/mesa_17.3.3.bb <http://mesa_17.3.3.bb> 
>              |  1 +
>       2 files changed, 52 insertions(+)
>       create mode 100644
>     meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
> 
>     diff --git
>     a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
>     b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
>     new file mode 100644
>     index 0000000000..193c54661b
>     --- /dev/null
>     +++
>     b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
>     @@ -0,0 +1,51 @@
>     +From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
>     +From: Igor Gnatenko <ignatenko@redhat.com
>     <mailto:ignatenko@redhat.com>>
>     +Date: Mon, 1 Jan 2018 22:49:00 +0100
>     +Subject: [PATCH] link mesautil with pthreads
>     +
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_setname':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66:
>     undefined reference to `pthread_setname_np'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `thrd_join':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336:
>     undefined reference to `pthread_join'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_create':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48:
>     undefined reference to `pthread_sigmask'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `thrd_create':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296:
>     undefined reference to `pthread_create'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_create':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
>     undefined reference to `pthread_sigmask'
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50:
>     undefined reference to `pthread_sigmask'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `call_once':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96:
>     undefined reference to `pthread_once'
>     +../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In
>     function `u_thread_get_time_nano':
>     +/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84:
>     undefined reference to `pthread_getcpuclockid'
>     +collect2: error: ld returned 1 exit status
>     +
>     +Reviewed-by: Adam Jackson <ajax@redhat.com <mailto:ajax@redhat.com>>
>     +Signed-off-by: Igor Gnatenko <ignatenko@redhat.com
>     <mailto:ignatenko@redhat.com>>
>     +---
>     + src/util/Makefile.am | 2 ++
>     + 1 file changed, 2 insertions(+)
>     +
>     +diff --git a/src/util/Makefile.am b/src/util/Makefile.am
>     +index a5241ad27b..633907b9fd 100644
>     +--- a/src/util/Makefile.am
>     ++++ b/src/util/Makefile.am
>     +@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
>     + libxmlconfig.la <http://libxmlconfig.la>
>     +
>     + AM_CPPFLAGS = \
>     ++      $(PTHREAD_CFLAGS) \
>     +       -I$(top_srcdir)/include
>     +
>     + libmesautil_la_CPPFLAGS = \
>     +@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
>     +       $(MESA_UTIL_GENERATED_FILES)
>     +
>     + libmesautil_la_LIBADD = \
>     ++      $(PTHREAD_LIBS) \
>     +       $(CLOCK_LIB) \
>     +       $(ZLIB_LIBS) \
>     +       $(LIBATOMIC_LIBS)
>     +--
>     +2.14.3
>     +
>     diff --git a/meta/recipes-graphics/mesa/mesa_17.3.3.bb
>     <http://mesa_17.3.3.bb> b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
>     <http://mesa_17.3.3.bb>
>     index 6e3f29a2c4..623046e116 100644
>     --- a/meta/recipes-graphics/mesa/mesa_17.3.3.bb <http://mesa_17.3.3.bb>
>     +++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb <http://mesa_17.3.3.bb>
>     @@ -10,6 +10,7 @@ SRC_URI =
>     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz> \
>                  file://0001-winsys-svga-drm-Include-sys-types.h.patch \
>                 
>     file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
>                  file://0001-anv_icd.py-improve-reproducible-builds.patch \
>     +           file://0001-link-mesautil-with-pthreads.patch \
>                  "
> 
>       SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
>     --
>     2.11.0
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

