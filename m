Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65E7260DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G2uNc4027191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 19:56:23 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 15 Oct 2014 19:56:22 -0700
Message-ID: <543F33D5.9090102@windriver.com>
Date: Thu, 16 Oct 2014 10:56:21 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Yue Tao <Yue.Tao@windriver.com>
References: <1409294779-11573-1-git-send-email-Yue.Tao@windriver.com>
In-Reply-To: <1409294779-11573-1-git-send-email-Yue.Tao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-4358
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
X-List-Received-Date: Thu, 16 Oct 2014 02:56:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Ping, please merge these two CVE patches.

Thanks

-Roy

On 08/29/2014 02:46 PM, Yue Tao wrote:
> libavcodec/h264.c in FFmpeg before 0.11.4 allows remote attackers to
> cause a denial of service (crash) via vectors related to alternating bit
> depths in H.264 data.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4358
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   ...t-parameters-from-SPS-whenever-it-changes.patch |  145 ++++++++++++++++++++
>   .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
>   2 files changed, 146 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
> new file mode 100644
> index 0000000..05a9de3
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
> @@ -0,0 +1,145 @@
> +gst-ffmpeg: h264: set parameters from SPS whenever it changes
> +
> +Fixes a crash in the fuzzed sample sample_varPAR.avi_s26638 with
> +alternating bit depths.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/h264.c.old b/gst-libs/ext/libav/libavcodec/h264.c
> +index 3621f41..718906a 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.c.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264.c
> +@@ -2491,6 +2491,34 @@ int ff_h264_get_profile(SPS *sps)
> +     return profile;
> + }
> +
> ++static int h264_set_parameter_from_sps(H264Context *h)
> ++{
> ++    MpegEncContext *s = &h->s;
> ++    AVCodecContext * avctx= s->avctx;
> ++
> ++    if (s->flags& CODEC_FLAG_LOW_DELAY ||
> ++        (h->sps.bitstream_restriction_flag && !h->sps.num_reorder_frames))
> ++        s->low_delay=1;
> ++
> ++    if(avctx->has_b_frames < 2)
> ++        avctx->has_b_frames= !s->low_delay;
> ++
> ++    if (avctx->bits_per_raw_sample != h->sps.bit_depth_luma) {
> ++        if (h->sps.bit_depth_luma >= 8 && h->sps.bit_depth_luma <= 10) {
> ++            avctx->bits_per_raw_sample = h->sps.bit_depth_luma;
> ++            h->pixel_shift = h->sps.bit_depth_luma > 8;
> ++
> ++            ff_h264dsp_init(&h->h264dsp, h->sps.bit_depth_luma);
> ++            ff_h264_pred_init(&h->hpc, s->codec_id, h->sps.bit_depth_luma);
> ++            dsputil_init(&s->dsp, s->avctx);
> ++        } else {
> ++            av_log(avctx, AV_LOG_DEBUG, "Unsupported bit depth: %d\n", h->sps.bit_depth_luma);
> ++            return -1;
> ++        }
> ++    }
> ++    return 0;
> ++}
> ++
> + /**
> +  * decodes a slice header.
> +  * This will also call MPV_common_init() and frame_start() as needed.
> +@@ -2505,7 +2533,7 @@ static int decode_slice_header(H264Context *h, H264Context *h0){
> +     MpegEncContext * const s0 = &h0->s;
> +     unsigned int first_mb_in_slice;
> +     unsigned int pps_id;
> +-    int num_ref_idx_active_override_flag;
> ++    int num_ref_idx_active_override_flag, ret;
> +     unsigned int slice_type, tmp, i, j;
> +     int default_ref_list_done = 0;
> +     int last_pic_structure;
> +@@ -2569,7 +2597,17 @@ static int decode_slice_header(H264Context *h, H264Context *h0){
> +         av_log(h->s.avctx, AV_LOG_ERROR, "non-existing SPS %u referenced\n", h->pps.sps_id);
> +         return -1;
> +     }
> +-    h->sps = *h0->sps_buffers[h->pps.sps_id];
> ++
> ++    if (h->pps.sps_id != h->current_sps_id ||
> ++        h0->sps_buffers[h->pps.sps_id]->new) {
> ++        h0->sps_buffers[h->pps.sps_id]->new = 0;
> ++
> ++        h->current_sps_id = h->pps.sps_id;
> ++        h->sps            = *h0->sps_buffers[h->pps.sps_id];
> ++
> ++        if ((ret = h264_set_parameter_from_sps(h)) < 0)
> ++            return ret;
> ++    }
> +
> +     s->avctx->profile = ff_h264_get_profile(&h->sps);
> +     s->avctx->level   = h->sps.level_idc;
> +@@ -3811,26 +3811,8 @@ static int decode_nal_units(H264Context *h, const uint8_t *buf, int buf_size){
> +         case NAL_SPS:
> +             init_get_bits(&s->gb, ptr, bit_length);
> +             ff_h264_decode_seq_parameter_set(h);
> +-
> +-            if (s->flags& CODEC_FLAG_LOW_DELAY ||
> +-                (h->sps.bitstream_restriction_flag && !h->sps.num_reorder_frames))
> +-                s->low_delay=1;
> +-
> +-            if(avctx->has_b_frames < 2)
> +-                avctx->has_b_frames= !s->low_delay;
> +-
> +-            if (avctx->bits_per_raw_sample != h->sps.bit_depth_luma) {
> +-                if (h->sps.bit_depth_luma >= 8 && h->sps.bit_depth_luma <= 10) {
> +-                    avctx->bits_per_raw_sample = h->sps.bit_depth_luma;
> +-                    h->pixel_shift = h->sps.bit_depth_luma > 8;
> +-
> +-                    ff_h264dsp_init(&h->h264dsp, h->sps.bit_depth_luma);
> +-                    ff_h264_pred_init(&h->hpc, s->codec_id, h->sps.bit_depth_luma);
> +-                    dsputil_init(&s->dsp, s->avctx);
> +-                } else {
> +-                    av_log(avctx, AV_LOG_DEBUG, "Unsupported bit depth: %d\n", h->sps.bit_depth_luma);
> +-                    return -1;
> +-                }
> ++            if (h264_set_parameter_from_sps(h) < 0) {
> ++                return -1;
> +             }
> +             break;
> +         case NAL_PPS:
> +diff --git a/gst-libs/ext/libav/libavcodec/h264.h.old b/gst-libs/ext/libav/libavcodec/h264.h
> +index e3cc815..b77ad98 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.h.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264.h
> +@@ -202,6 +202,7 @@ typedef struct SPS{
> +     int bit_depth_chroma;              ///< bit_depth_chroma_minus8 + 8
> +     int residual_color_transform_flag; ///< residual_colour_transform_flag
> +     int constraint_set_flags;          ///< constraint_set[0-3]_flag
> ++    int new;                              ///< flag to keep track if the decoder context needs re-init due to changed SPS
> + }SPS;
> +
> + /**
> +@@ -333,6 +334,7 @@ typedef struct H264Context{
> +     int emu_edge_width;
> +     int emu_edge_height;
> +
> ++    unsigned current_sps_id; ///< id of the current SPS
> +     SPS sps; ///< current sps
> +
> +     /**
> +diff --git a/gst-libs/ext/libav/libavcodec/h264_ps.c.old b/gst-libs/ext/libav/libavcodec/h264_ps.c
> +index 7491807..0929098 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264_ps.c.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264_ps.c
> +@@ -438,10 +438,13 @@ int ff_h264_decode_seq_parameter_set(H264Context *h){
> +                sps->timing_info_present_flag ? sps->time_scale : 0
> +                );
> +     }
> ++    sps->new = 1;
> +
> +     av_free(h->sps_buffers[sps_id]);
> +-    h->sps_buffers[sps_id]= sps;
> +-    h->sps = *sps;
> ++    h->sps_buffers[sps_id] = sps;
> ++    h->sps                 = *sps;
> ++    h->current_sps_id      = sps_id;
> ++
> +     return 0;
> + fail:
> +     av_free(sps);
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index bbe3308..3ccb7be 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -53,6 +53,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
>              file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
>              file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
>              file://0001-ffserver-set-oformat.patch \
> +           file://0001-h264-set-parameters-from-SPS-whenever-it-changes.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav-9.patch', '', d)} \
>   "
>
>

-- 
Best Reagrds,
Roy | RongQing Li

