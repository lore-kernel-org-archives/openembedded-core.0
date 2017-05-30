Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81505781D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 15:44:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4UFiAaa010636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 16:44:11 +0100
Message-ID: <1496159050.6630.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 May 2017 16:44:10 +0100
In-Reply-To: <20170530152738.GA24515@linux-uys3>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
	<20170530152738.GA24515@linux-uys3>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 16:44:11 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 15:44:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-30 at 11:27 -0400, Trevor Woerner wrote:
> Here is the relevant part of Fedora's mesa.spec file for Fedora 25
> (with line
> numbers):
> 
> 	 400 %configure \
> 	 401     %{?asm_flags} \
> 	 402     --enable-libglvnd \
> 	 403     --enable-selinux \
> 	 404     --enable-gallium-osmesa \
> 	 405     --with-dri-driverdir=%{_libdir}/dri \
> 	 406     --enable-egl \
> 	 407     --disable-gles1 \
> 	 408     --enable-gles2 \
> 	 409     --disable-xvmc \
> 	 410     %{?with_vdpau:--enable-vdpau} \
> 	 411     %{?with_vaapi:--enable-va} \
> 	 412     --with-egl-
> platforms=x11,drm,surfaceless%{?with_wayland:,wayland} \
> 	 413     --enable-shared-glapi \
> 	 414     --enable-gbm \
> 	 415     %{?with_omx:--enable-omx} \
> 	 416     %{?with_opencl:--enable-opencl --enable-opencl-icd}
> %{!?with_opencl:--disable-opencl} \
> 	 417     --enable-glx-tls \
> 	 418     --enable-texture-float=yes \
> 	 419 %if %{with_vulkan}
> 	 420     %{?vulkan_drivers} \
> 	 421 %endif
> 	 422     %{?with_llvm:--enable-gallium-llvm} \
> 	 423     %{?with_llvm:--enable-llvm-shared-libs} \
> 	 424     --enable-dri \
> 	 425 %if %{with_hardware}
> 	 426     %{?with_xa:--enable-xa} \
> 	 427     %{?with_nine:--enable-nine} \
> 	 428     --with-gallium-
> drivers=%{?with_vmware:svga,}%{?with_radeonsi:radeonsi,}%{?with_llvm:
> swrast,r600,}%{?with_freedreno:freedreno,}%{?with_etnaviv:etnaviv,}%{
> ?with_vc4:vc4,}%{?with_ilo:ilo,}virgl,r300,nouveau \
> 	 429 %else
> 	 430     --with-gallium-drivers=%{?with_llvm:swrast,}virgl \
> 	 431 %endif
> 	 432     %{?dri_drivers}
> 
> --enable-texture-float (line 418) is always, unconditionally enabled.
> However,
> mesa itself is then patched (for Fedora) so that the --enable-
> texture-float
> configuration option doesn't have any effect on llvm and swrast. I.e.
> it is
> easier to do this optional check in code than on the ./configure
> line:
> 
> 	From 00bcd599310dc7fce4fe336ffd85902429051a0c Mon Sep 17
> 00:00:00 2001
> 	From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
> 	Date: Sun, 20 Mar 2016 13:27:04 +0100
> 	Subject: [PATCH 2/4] hardware gloat
> 
> 	Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
> 	---
> 	 src/gallium/drivers/llvmpipe/lp_screen.c | 7 +++++++
> 	 src/gallium/drivers/softpipe/sp_screen.c | 7 +++++++
> 	 2 files changed, 14 insertions(+)
> 
> 	diff --git a/src/gallium/drivers/llvmpipe/lp_screen.c
> b/src/gallium/drivers/llvmpipe/lp_screen.c
> 	index 4f61de8..3b0ec77 100644
> 	--- a/src/gallium/drivers/llvmpipe/lp_screen.c
> 	+++ b/src/gallium/drivers/llvmpipe/lp_screen.c
> 	@@ -411,6 +411,13 @@ llvmpipe_is_format_supported( struct
> pipe_screen *_screen,
> 	    if (!format_desc)
> 	       return FALSE;
> 	 
> 	+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
> 	+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
> 	+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
> 	+       util_format_is_float(format)) {
> 	+      return FALSE;
> 	+   }
> 	+
> 	    assert(target == PIPE_BUFFER ||
> 		   target == PIPE_TEXTURE_1D ||
> 		   target == PIPE_TEXTURE_1D_ARRAY ||
> 	diff --git a/src/gallium/drivers/softpipe/sp_screen.c
> b/src/gallium/drivers/softpipe/sp_screen.c
> 	index 031602b..c279120 100644
> 	--- a/src/gallium/drivers/softpipe/sp_screen.c
> 	+++ b/src/gallium/drivers/softpipe/sp_screen.c
> 	@@ -358,6 +358,13 @@ softpipe_is_format_supported( struct
> pipe_screen *screen,
> 	    if (!format_desc)
> 	       return FALSE;
> 	 
> 	+   if ((bind & PIPE_BIND_RENDER_TARGET) &&
> 	+       format != PIPE_FORMAT_R9G9B9E5_FLOAT &&
> 	+       format != PIPE_FORMAT_R11G11B10_FLOAT &&
> 	+       util_format_is_float(format)) {
> 	+      return FALSE;
> 	+   }
> 	+
> 	    if (sample_count > 1)
> 	       return FALSE;
> 	 
> 	-- 
> 	2.7.4
> 
> 
> Maybe this would be a better way forward? Enable it, always, in
> ./configure,
> add the patch to check for it in the code itself, then you can build
> for all
> the gallium targets (including swrast) and know that the patented
> code will
> only kick in where it's supported in hardware (and thus patent-safe)?

That sounds like exactly what we need to do!

Cheers,

Richard

