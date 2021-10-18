X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <58aea8eb86686e714b631ab6609ccc015953b934.camel@igalia.com>
Subject: Re: [OE-core][hardknott][PATCH v3] mesa: gallium/dri Make YUV formats we're going to emulate external-only
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Date: Mon, 18 Oct 2021 18:19:39 +0200
In-Reply-To: <20211018161234.237101-1-psaavedra@igalia.com>
References: 
	<CANNYZj8+PEXuuGCUdqs2+T+-F-q1_VWczhZqdtebZeHF-9ieLw@mail.gmail.com>
	 <20211018161234.237101-1-psaavedra@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

This patch was not explicitly sent to master. Instead of this I also
created this upgrade [1] patch for mesa from 21.2.1 -> 21.2.4. 

[1] https://lists.openembedded.org/g/openembedded-core/message/157082

On Mon, 2021-10-18 at 18:12 +0200, Pablo Saavedra wrote:
> This patch fix red label issues on video for Raspberry 4-64 Mesa VC4
> driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver.
> 
> Issue was originally reported in meta-webkit [1] and later contributed
> in Mesa [2] where it was already merged in master.
> 
> [1] https://github.com/Igalia/meta-webkit/issues/185
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038
> 
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  ...-YUV-formats-we-re-going-to-emulate-.patch | 52 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-dri-
> Make-YUV-formats-we-re-going-to-emulate-.patch
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-
> YUV-formats-we-re-going-to-emulate-.patch b/meta/recipes-
> graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-
> emulate-.patch
> new file mode 100644
> index 0000000000..7436480238
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-
> formats-we-re-going-to-emulate-.patch
> @@ -0,0 +1,52 @@
> +commit 8bd63cd28939d79d6681943b840627eaa3614ee4
> +Author: Pablo Saavedra <psaavedra@igalia.com>
> +Date:   Mon Oct 18 15:48:42 2021 +0200
> +
> +    gallium/dri: Make YUV formats we're going to emulate external-
> only.
> +    
> +    If we're going to have to bind them as separate planes with
> colorspace
> +    conversion for sampling on the frontend, then we need to report
> that
> +    they're only for external-image samplers, otherwise the lowering
> won't be
> +    applied.
> +    
> +    Fixes: 4e3a7dcf ("gallium: enable
> EGL_EXT_image_dma_buf_import_modifiers unconditionally")
> +    Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +    Part-of:
> <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038>
> +
> +Upstream-Status: Accepted
> [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038]
> +
> +diff --git a/src/gallium/frontends/dri/dri2.c
> b/src/gallium/frontends/dri/dri2.c
> +index b0c0d7e..ef8df5a 100644
> +--- a/src/gallium/frontends/dri/dri2.c
> ++++ b/src/gallium/frontends/dri/dri2.c
> +@@ -1445,16 +1445,24 @@ dri2_query_dma_buf_modifiers(__DRIscreen
> *_screen, int fourcc, int max,
> + 
> +    format = map->pipe_format;
> + 
> ++   bool native_sampling = pscreen->is_format_supported(pscreen,
> format, screen->target, 0, 0,
> ++                                                      
> PIPE_BIND_SAMPLER_VIEW);
> +    if (pscreen->is_format_supported(pscreen, format, screen->target,
> 0, 0,
> +-                                     PIPE_BIND_RENDER_TARGET) ||
> +-        pscreen->is_format_supported(pscreen, format, screen->target,
> 0, 0,
> +-                                     PIPE_BIND_SAMPLER_VIEW) ||
> +-        dri2_yuv_dma_buf_supported(screen, map)) {
> +-      if (pscreen->query_dmabuf_modifiers != NULL)
> ++                                    PIPE_BIND_RENDER_TARGET) ||
> ++       native_sampling ||
> ++       dri2_yuv_dma_buf_supported(screen, map))  {
> ++      if (pscreen->query_dmabuf_modifiers != NULL) {
> +          pscreen->query_dmabuf_modifiers(pscreen, format, max,
> modifiers,
> +                                          external_only, count);
> +-      else
> ++         if (!native_sampling && external_only) {
> ++            /* To support it using YUV lowering, we need it to be
> samplerExternalOES.
> ++             */
> ++            for (int i = 0; i < *count; i++)
> ++               external_only[i] = true;
> ++         }
> ++      } else {
> +          *count = 0;
> ++      }
> +       return true;
> +    }
> +    return false;
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index a85f94c75e..7cba03cfcf 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,6 +19,7 @@ SRC_URI =
> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
>            
> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>            
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +          
> file://0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch 
> \
>             "
>  
>  SRC_URI[sha256sum] =
> "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"


