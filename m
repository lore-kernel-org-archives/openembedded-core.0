Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED10761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:21:52 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 3F96637114;
	Tue, 28 Jul 2015 15:12:37 +0200 (CEST)
Message-ID: <55B77FD3.4020700@pseudoterminal.org>
Date: Tue, 28 Jul 2015 15:12:51 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Yuqing Zhu <b54851@freescale.com>, 
	openembedded-core@lists.openembedded.org
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
	<1438106291-14986-4-git-send-email-b54851@freescale.com>
In-Reply-To: <1438106291-14986-4-git-send-email-b54851@freescale.com>
Subject: Re: [poky v3][PATCH 3/6] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Tue, 28 Jul 2015 13:21:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

"Backport [1.4.1]" is probably wrong. Admittedly, the bugzilla entry is 
somewhat confusing, but I think it should be using the version 1.5.1 
instead.

On 07/28/2015 07:58 PM, Yuqing Zhu wrote:
> Video buffer pool will update video alignment to respect stride alignment
> requirement. But haven't update it to video alignment in configure.
> Which will cause user get wrong video alignment.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>   .../videobuffer_updata_alignment_update.patch      | 53 ++++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
>   2 files changed, 54 insertions(+)
>   create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
> new file mode 100755
> index 0000000..ae37685
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
> @@ -0,0 +1,53 @@
> +commit 88d253ea23b06289df40401160b606323f16c910
> +Author: Song Bing <b06498@freescale.com>
> +Date:   Mon Dec 15 09:34:35 2014 +0800
> +
> +videopool: update video alignment after video alignment
> +
> +Video buffer pool will update video alignment to respect stride alignment
> +requirement. But haven't update it to video alignment in configure.
> +Which will cause user get wrong video alignment.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=741501
> +
> +Upstream-Status: Backport [1.4.1]
> +
> +Signed-off-by: Song Bing <b06498@freescale.com>
> +diff --git a/gst-libs/gst/video/gstvideopool.c b/gst-libs/gst/video/gstvideopool.c
> +index 4475f45..acef594 100644
> +--- a/gst-libs/gst/video/gstvideopool.c
> ++++ b/gst-libs/gst/video/gstvideopool.c
> +@@ -167,6 +167,7 @@ video_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
> +     /* get an apply the alignment to the info */
> +     gst_buffer_pool_config_get_video_alignment (config, &priv->video_align);
> +     gst_video_info_align (&info, &priv->video_align);
> ++    gst_buffer_pool_config_set_video_alignment (config, &priv->video_align);
> +   }
> +   priv->info = info;
> +
> +diff --git a/sys/ximage/ximagepool.c b/sys/ximage/ximagepool.c
> +index 6cc2cfa..6a1cbc9 100644
> +--- a/sys/ximage/ximagepool.c
> ++++ b/sys/ximage/ximagepool.c
> +@@ -597,6 +597,8 @@ ximage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
> +     /* do padding and alignment */
> +     gst_video_info_align (&info, &priv->align);
> +
> ++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
> ++
> +     /* we need the video metadata too now */
> +     priv->add_metavideo = TRUE;
> +   } else {
> +diff --git a/sys/xvimage/xvimagepool.c b/sys/xvimage/xvimagepool.c
> +index 244a51a..34b1ab2 100644
> +--- a/sys/xvimage/xvimagepool.c
> ++++ b/sys/xvimage/xvimagepool.c
> +@@ -124,6 +124,8 @@ xvimage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
> +     /* do padding and alignment */
> +     gst_video_info_align (&info, &priv->align);
> +
> ++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
> ++
> +     /* we need the video metadata too now */
> +     priv->add_metavideo = TRUE;
> +   } else {
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> index aa90179..88c3254 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> @@ -10,6 +10,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
>               file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
>               file://fix-id3demux-utf16-to-utf8-issue.patch \
>               file://handle-audio-video-decoder-error.patch \
> +            file://videobuffer_updata_alignment_update.patch \
>   "
>   
>   SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"


