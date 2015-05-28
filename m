Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id E45207568F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 07:14:55 +0000 (UTC)
Received: by obbea2 with SMTP id ea2so26034681obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 00:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E7TExmui6rWFrl039S1ah+u7ZpajmqLIzYIk94vgBDU=;
	b=Bswk+YhhAw7vZtDdTXhn5nc1w1Eyhml5/ml5Sqw7LJ2AhXg2B+6Q5nhPcPab7BkzdF
	DxuMny6q4T5geiKd61G88WqzscKvLzV5zymBkDT5DCjiSId/ofWrbjyI4oSPK5oPpO23
	6kKkiSOhEmVk4jhLGm9dXhI9fO2rCJIN1d19JjCIVAvPUcwRChL5fyoBh+jf1N6NvKdV
	7LQ+kl10+qxRYmSGzmHSci6dCmh5qlMXPNuIuYfIVgSSZFN4ABRV/vaxYF5fF/l4ovi2
	VT/zqb4I6nFdQOA6yM0bW9e8dZWHQaXqp8pazsdjVm19G4Zq0QbODMa7Q0uLcTCuEtik
	9w3Q==
X-Gm-Message-State: ALoCoQl/yNEb9/gb5exTP290b2f8SbUpDpg9hVT1ykReDASV0SbfsWYNFSwVxJuGTPD6kX3aBEiR
X-Received: by 10.202.76.68 with SMTP id z65mr1133643oia.54.1432797296574;
	Thu, 28 May 2015 00:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 28 May 2015 00:14:26 -0700 (PDT)
In-Reply-To: <274a045e16a1d3a0fad66f8727de7a04cc86e614.1432775689.git.kai.kang@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<274a045e16a1d3a0fad66f8727de7a04cc86e614.1432775689.git.kai.kang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 28 May 2015 10:14:26 +0300
Message-ID: <CAHiDW_HYEW8+SYsLhbTLWpk1=z0XNvwYaGkBsEaSGi0Zk5Y4Ng@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libav: upgrade to 9.18
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
X-List-Received-Date: Thu, 28 May 2015 07:14:56 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2015 at 04:26, Kai Kang <kai.kang@windriver.com> wrote:
> Upgrade libav from version 9.16 to 9.18. Remove unused var INC_PR and
> backport patch to fix CVE-2014-9676.

I'm sorry I didn't ask this in the original discussion but... Is there
a good reason for keeping 9.x in oe-core if we're bringing in 11.x
(instead of either dropping 9.x or moving it to meta-oe)?

I haven't found the API changes between 9 and 11 to be so large that
they would warrant keeping two versions. Admittedly I'm not working
with libav on daily basis so I might have missed things.

Jussi

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-multimedia/libav/libav.inc            |  2 -
>  .../libav/libav/libav-fix-CVE-2014-9676.patch      | 98 ++++++++++++++++++++++
>  meta/recipes-multimedia/libav/libav_9.16.bb        |  4 -
>  meta/recipes-multimedia/libav/libav_9.18.bb        |  6 ++
>  4 files changed, 104 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
>  delete mode 100644 meta/recipes-multimedia/libav/libav_9.16.bb
>  create mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
>
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
> index cac836f..6ef273b 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -24,8 +24,6 @@ ARM_INSTRUCTION_SET = "arm"
>
>  DEPENDS = "alsa-lib zlib libogg yasm-native"
>
> -INC_PR = "r8"
> -
>  inherit autotools pkgconfig
>
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
> new file mode 100644
> index 0000000..1e31caa
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
> @@ -0,0 +1,98 @@
> +Upstream-Status: Backport
> +
> +Backport patch to fix CVE-2014-9676.
> +
> +https://security-tracker.debian.org/tracker/CVE-2014-9676
> +https://git.libav.org/?p=libav.git;a=commit;h=b3f04657368a32a9903406395f865e230b1de348
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +From b3f04657368a32a9903406395f865e230b1de348 Mon Sep 17 00:00:00 2001
> +From: Luca Barbato <lu_zero@gentoo.org>
> +Date: Mon, 5 Jan 2015 10:40:41 +0100
> +Subject: [PATCH] segment: Fix the failure paths
> +
> +A failure in segment_end() or segment_start() would lead to freeing
> +a dangling pointer and in general further calls to seg_write_packet()
> +or to seg_write_trailer() would have the same faulty behaviour.
> +
> +CC: libav-stable@libav.org
> +Reported-By: luodalongde@gmail.com
> +---
> + libavformat/segment.c | 32 ++++++++++++++++++++------------
> + 1 file changed, 20 insertions(+), 12 deletions(-)
> +
> +diff --git a/libavformat/segment.c b/libavformat/segment.c
> +index 52da6b9..bcfd1f9 100644
> +--- a/libavformat/segment.c
> ++++ b/libavformat/segment.c
> +@@ -184,6 +184,13 @@ static void close_null_ctx(AVIOContext *pb)
> +     av_free(pb);
> + }
> +
> ++static void seg_free_context(SegmentContext *seg)
> ++{
> ++    avio_closep(&seg->pb);
> ++    avformat_free_context(seg->avf);
> ++    seg->avf = NULL;
> ++}
> ++
> + static int seg_write_header(AVFormatContext *s)
> + {
> +     SegmentContext *seg = s->priv_data;
> +@@ -265,12 +272,9 @@ static int seg_write_header(AVFormatContext *s)
> +     }
> +
> + fail:
> +-    if (ret) {
> +-        if (seg->list)
> +-            avio_close(seg->pb);
> +-        if (seg->avf)
> +-            avformat_free_context(seg->avf);
> +-    }
> ++    if (ret < 0)
> ++        seg_free_context(seg);
> ++
> +     return ret;
> + }
> +
> +@@ -282,6 +286,9 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
> +     int64_t end_pts = seg->recording_time * seg->number;
> +     int ret, can_split = 1;
> +
> ++    if (!oc)
> ++        return AVERROR(EINVAL);
> ++
> +     if (seg->has_video) {
> +         can_split = st->codec->codec_type == AVMEDIA_TYPE_VIDEO &&
> +                     pkt->flags & AV_PKT_FLAG_KEY;
> +@@ -322,11 +329,8 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
> +     ret = ff_write_chained(oc, pkt->stream_index, pkt, s);
> +
> + fail:
> +-    if (ret < 0) {
> +-        if (seg->list)
> +-            avio_close(seg->pb);
> +-        avformat_free_context(oc);
> +-    }
> ++    if (ret < 0)
> ++        seg_free_context(seg);
> +
> +     return ret;
> + }
> +@@ -335,7 +339,11 @@ static int seg_write_trailer(struct AVFormatContext *s)
> + {
> +     SegmentContext *seg = s->priv_data;
> +     AVFormatContext *oc = seg->avf;
> +-    int ret;
> ++    int ret = 0;
> ++
> ++    if (!oc)
> ++        goto fail;
> ++
> +     if (!seg->write_header_trailer) {
> +         if ((ret = segment_end(oc, 0)) < 0)
> +             goto fail;
> +--
> +2.4.1.314.g9532ead
> +
> diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb b/meta/recipes-multimedia/libav/libav_9.16.bb
> deleted file mode 100644
> index 79ff3f8..0000000
> --- a/meta/recipes-multimedia/libav/libav_9.16.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require libav.inc
> -
> -SRC_URI[md5sum] = "7b44b75cec24b8e7545e5029e76917e0"
> -SRC_URI[sha256sum] = "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
> diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
> new file mode 100644
> index 0000000..210a649
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav_9.18.bb
> @@ -0,0 +1,6 @@
> +require libav.inc
> +
> +SRC_URI[md5sum] = "75e838068a75fb88e1b4ea0546bc16f0"
> +SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614d066d7"
> +
> +SRC_URI += "file://libav-fix-CVE-2014-9676.patch"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

