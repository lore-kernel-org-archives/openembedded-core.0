Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 633737641E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:23:25 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id B67BD37198;
	Wed, 29 Jul 2015 20:23:08 +0200 (CEST)
Message-ID: <55B91A1B.6070404@pseudoterminal.org>
Date: Wed, 29 Jul 2015 20:23:23 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Yuqing Zhu <b54851@freescale.com>, 
	openembedded-core@lists.openembedded.org
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-5-git-send-email-b54851@freescale.com>
In-Reply-To: <1438194339-13618-5-git-send-email-b54851@freescale.com>
Subject: Re: [poky][PATCH v4 4/5] gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 18:23:29 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zhu,

This backport seems useful. If I understand it correctly, the main 
benefit is that buffers that come from the video decoder won't be copied 
when make_writable() is called, which otherwise would happen with this 
patch (because the video decoder still has a reference to the buffer). 
The result is that it gets rid of unnecessary buffer copies. This is 
your main reason for these patches, right? Can you describe a use case 
where these unnecessary copies caused you trouble? It would be helpful 
for further understanding.

cheers,
   Carlos

Am 2015-07-29 um 20:25 schrieb Yuqing Zhu:
> -Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>   This makes sure that the buffer is not reffed another time when
>   storing it in the GstVideoFrame, keeping it writable if it was writable.
>
> -Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF to replace the old one because it's kind of ugly.
>
> -Don't ref buffers twice when mapping
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>   ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
>   ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
>   ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  3 +
>   4 files changed, 185 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
> new file mode 100644
> index 0000000..3db4724
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
> @@ -0,0 +1,26 @@
> +From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Tue, 16 Sep 2014 01:07:18 +0300
> +Subject: [PATCH] video-frame: Don't ref buffers twice when mapping
> +
> +Upstream-Status: Backport [1.5.1]
> +---
> + gst-libs/gst/video/video-frame.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
> +index 01f23c0..8a9ae96 100644
> +--- a/gst-libs/gst/video/video-frame.c
> ++++ b/gst-libs/gst/video/video-frame.c
> +@@ -105,7 +105,7 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
> +       frame->data[i] = frame->map[0].data + info->offset[i];
> +     }
> +   }
> +-  frame->buffer = gst_buffer_ref (buffer);
> ++  frame->buffer = buffer;
> +   if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> +     gst_buffer_ref (frame->buffer);
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> new file mode 100644
> index 0000000..c465b5c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> @@ -0,0 +1,87 @@
> +From 40a293d44d1aeccf5eb8e86f23a0b13666111c5c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Fri, 12 Sep 2014 14:39:16 +0300
> +Subject: [PATCH 2/3] video-frame: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
> +
> +This makes sure that the buffer is not reffed another time when
> +storing it in the GstVideoFrame, keeping it writable if it was
> +writable.
> +
> +Upstream-Status: Backport [1.5.1]
> +https://bugzilla.gnome.org/show_bug.cgi?id=736118
> +---
> + gst-libs/gst/video/video-frame.c |    9 ++++++++-
> + gst-libs/gst/video/video-frame.h |   18 ++++++++++++++++++
> + 2 files changed, 26 insertions(+), 1 deletion(-)
> +
> +diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
> +index 537cf70..01f23c0 100644
> +--- a/gst-libs/gst/video/video-frame.c
> ++++ b/gst-libs/gst/video/video-frame.c
> +@@ -106,6 +106,9 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
> +     }
> +   }
> +   frame->buffer = gst_buffer_ref (buffer);
> ++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> ++    gst_buffer_ref (frame->buffer);
> ++
> +   frame->meta = meta;
> +
> +   /* buffer flags enhance the frame flags */
> +@@ -189,11 +192,13 @@ gst_video_frame_unmap (GstVideoFrame * frame)
> +   GstBuffer *buffer;
> +   GstVideoMeta *meta;
> +   gint i;
> ++  GstMapFlags flags;
> +
> +   g_return_if_fail (frame != NULL);
> +
> +   buffer = frame->buffer;
> +   meta = frame->meta;
> ++  flags = frame->map[0].flags;
> +
> +   if (meta) {
> +     for (i = 0; i < frame->info.finfo->n_planes; i++) {
> +@@ -202,7 +207,9 @@ gst_video_frame_unmap (GstVideoFrame * frame)
> +   } else {
> +     gst_buffer_unmap (buffer, &frame->map[0]);
> +   }
> +-  gst_buffer_unref (buffer);
> ++
> ++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
> ++    gst_buffer_unref (frame->buffer);
> + }
> +
> + /**
> +diff --git a/gst-libs/gst/video/video-frame.h b/gst-libs/gst/video/video-frame.h
> +index 627fab0..f8e6304 100644
> +--- a/gst-libs/gst/video/video-frame.h
> ++++ b/gst-libs/gst/video/video-frame.h
> +@@ -149,6 +149,24 @@ typedef enum {
> +   GST_VIDEO_BUFFER_FLAG_LAST        = (GST_BUFFER_FLAG_LAST << 8)
> + } GstVideoBufferFlags;
> +
> ++/**
> ++ * GstVideoBufferFlags:
> ++ * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
> ++ *                                    the GstVideoFrame. This makes sure that the buffer stays
> ++ *                                    writable while the frame is mapped, but requires that the
> ++ *                                    buffer reference stays valid until the frame is unmapped again.
> ++ * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
> ++ *
> ++ * Additional mapping flags for gst_video_frame_map().
> ++ *
> ++ * Since: 1.6
> ++ */
> ++typedef enum {
> ++  GST_VIDEO_FRAME_MAP_FLAG_NO_REF   = (GST_MAP_FLAG_LAST << 0),
> ++  GST_VIDEO_FRAME_MAP_FLAG_LAST     = (GST_MAP_FLAG_LAST << 8)
> ++  /* 8 more flags possible afterwards */
> ++} GstVideoFrameMapFlags;
> ++
> + G_END_DECLS
> +
> + #endif /* __GST_VIDEO_FRAME_H__ */
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> new file mode 100644
> index 0000000..132bf06
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
> @@ -0,0 +1,69 @@
> +From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Fri, 12 Sep 2014 14:41:01 +0300
> +Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
> +
> +Upstream-Status: Backport [1.5.1]
> +https://bugzilla.gnome.org/show_bug.cgi?id=736118
> +---
> + gst-libs/gst/video/gstvideofilter.c |   23 ++++-------------------
> + 1 file changed, 4 insertions(+), 19 deletions(-)
> +
> +diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
> +index e1fa2c1..874b2e8 100644
> +--- a/gst-libs/gst/video/gstvideofilter.c
> ++++ b/gst-libs/gst/video/gstvideofilter.c
> +@@ -260,23 +260,15 @@ gst_video_filter_transform (GstBaseTransform * trans, GstBuffer * inbuf,
> +   if (fclass->transform_frame) {
> +     GstVideoFrame in_frame, out_frame;
> +
> +-    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf, GST_MAP_READ))
> ++    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf,
> ++            GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
> +       goto invalid_buffer;
> +
> +     if (!gst_video_frame_map (&out_frame, &filter->out_info, outbuf,
> +-            GST_MAP_WRITE))
> ++            GST_MAP_WRITE | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
> +       goto invalid_buffer;
> +
> +-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
> +-     * meaning that we can't attach any metas or anything to it. Other
> +-     * map() functions like gst_buffer_map() don't get another reference
> +-     * of the buffer and expect the buffer reference to be kept until
> +-     * the buffer is unmapped again. */
> +-    gst_buffer_unref (inbuf);
> +-    gst_buffer_unref (outbuf);
> +     res = fclass->transform_frame (filter, &in_frame, &out_frame);
> +-    gst_buffer_ref (inbuf);
> +-    gst_buffer_ref (outbuf);
> +
> +     gst_video_frame_unmap (&out_frame);
> +     gst_video_frame_unmap (&in_frame);
> +@@ -317,7 +309,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
> +     GstVideoFrame frame;
> +     GstMapFlags flags;
> +
> +-    flags = GST_MAP_READ;
> ++    flags = GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF;
> +
> +     if (!gst_base_transform_is_passthrough (trans))
> +       flags |= GST_MAP_WRITE;
> +@@ -325,14 +317,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
> +     if (!gst_video_frame_map (&frame, &filter->in_info, buf, flags))
> +       goto invalid_buffer;
> +
> +-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
> +-     * meaning that we can't attach any metas or anything to it. Other
> +-     * map() functions like gst_buffer_map() don't get another reference
> +-     * of the buffer and expect the buffer reference to be kept until
> +-     * the buffer is unmapped again. */
> +-    gst_buffer_unref (buf);
> +     res = fclass->transform_frame_ip (filter, &frame);
> +-    gst_buffer_ref (buf);
> +
> +     gst_video_frame_unmap (&frame);
> +   } else {
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> index 88c3254..9c31391 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> @@ -11,6 +11,9 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
>               file://fix-id3demux-utf16-to-utf8-issue.patch \
>               file://handle-audio-video-decoder-error.patch \
>               file://videobuffer_updata_alignment_update.patch \
> +            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
> +            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
> +            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
>   "
>   
>   SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"


