Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 946CA762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:16:52 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 717D237123;
	Tue, 28 Jul 2015 15:11:21 +0200 (CEST)
Message-ID: <55B77F87.5040401@pseudoterminal.org>
Date: Tue, 28 Jul 2015 15:11:35 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Yuqing Zhu <b54851@freescale.com>, 
	openembedded-core@lists.openembedded.org
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
	<1438106291-14986-3-git-send-email-b54851@freescale.com>
In-Reply-To: <1438106291-14986-3-git-send-email-b54851@freescale.com>
Subject: Re: [poky v3][PATCH 2/6] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Tue, 28 Jul 2015 13:16:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Shouldn't the upstream status be "Submitted" instead of "Pending"? It is 
already in bugzilla.

On 07/28/2015 07:58 PM, Yuqing Zhu wrote:
> If there is input data and no output data to the end of the stream, it will
> send GST_ELEMENT_ERROR and quit from playing.
> The patch comments the GST_ELEMENT_ERROR() and add GST_ERROR_OBJECT()
> information instead.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>   .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
>   2 files changed, 67 insertions(+)
>   create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
> new file mode 100755
> index 0000000..eb15588
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
> @@ -0,0 +1,66 @@
> +From bcb2b8b6f49e7c66124a4f5e07dea829d5ebfe59 Mon Sep 17 00:00:00 2001
> +From: Lyon Wang <lyon.wang@freescale.com>
> +Date: Mon, 15 Dec 2014 16:52:07 +0800
> +Subject: [PATCH] handle audio/video decoder error
> +
> +When there is input data and no output data to the end of the stream, it will
> +send GST_ELEMENT_ERROR, So the clips playing will quit.
> +However, if only one of the tracks is corrupt, there is no need to quit other
> +tracks playing.
> +
> +The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
> +information instead.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=741542
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
> +---
> + gst-libs/gst/audio/gstaudiodecoder.c |    5 +++--
> + gst-libs/gst/video/gstvideodecoder.c |    5 +++--
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> + mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
> + mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
> +
> +diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
> +old mode 100644
> +new mode 100755
> +index c2e7a28..891df0a
> +--- a/gst-libs/gst/audio/gstaudiodecoder.c
> ++++ b/gst-libs/gst/audio/gstaudiodecoder.c
> +@@ -2123,9 +2123,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
> +       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
> +
> +       if (dec->priv->ctx.had_input_data && !dec->priv->ctx.had_output_data) {
> +-        GST_ELEMENT_ERROR (dec, STREAM, DECODE,
> ++        /* GST_ELEMENT_ERROR (dec, STREAM, DECODE,
> +             ("No valid frames decoded before end of stream"),
> +-            ("no valid frames found"));
> ++            ("no valid frames found")); */
> ++        GST_ERROR_OBJECT(dec, "No valid frames decoded before end of stream");
> +       }
> +
> +       /* send taglist if no valid frame is decoded util EOS */
> +diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
> +old mode 100644
> +new mode 100755
> +index ac581e1..4278bcd
> +--- a/gst-libs/gst/video/gstvideodecoder.c
> ++++ b/gst-libs/gst/video/gstvideodecoder.c
> +@@ -1068,9 +1068,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
> +
> +       /* Error out even if EOS was ok when we had input, but no output */
> +       if (ret && priv->had_input_data && !priv->had_output_data) {
> +-        GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
> ++        /* GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
> +             ("No valid frames decoded before end of stream"),
> +-            ("no valid frames found"));
> ++            ("no valid frames found")); */
> ++        GST_ERROR_OBJECT(decoder, "No valid frames decoded before end of stream");
> +       }
> +
> +       /* Forward EOS immediately. This is required because no
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> index aaa1ecb..aa90179 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
> @@ -9,6 +9,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
>               file://get-caps-from-src-pad-when-query-caps.patch \
>               file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
>               file://fix-id3demux-utf16-to-utf8-issue.patch \
> +            file://handle-audio-video-decoder-error.patch \
>   "
>   
>   SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"


