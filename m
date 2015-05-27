Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D0245728CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 01:24:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4R1OVaK027540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 18:24:32 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 May 2015 18:24:31 -0700
Message-ID: <55651CC8.5000402@windriver.com>
Date: Tue, 26 May 2015 21:24:24 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Kai Kang <kai.kang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1432624313.git.kai.kang@windriver.com>
	<5ba2d6f0817b422f4cfde4fac6554f2f9571411a.1432624313.git.kai.kang@windriver.com>
In-Reply-To: <5ba2d6f0817b422f4cfde4fac6554f2f9571411a.1432624313.git.kai.kang@windriver.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 2/2] libav: upgrade to 9.18
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
X-List-Received-Date: Wed, 27 May 2015 01:24:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-26 03:14 AM, Kai Kang wrote:
> Upgrade libav from version 9.16 to 9.18. Remove unused var INC_PR and
> backport patch to fix CVE-2014-9676.

We can keep that version if people want it but it's almost pretty old.

Version 11.3 is the latest branch.
    Libav 11.3
    https://libav.org/releases/libav-11.3.release

Oh and on the 11 branch, the CVE fix is in commit:

libav.git $ git branch --contains f6c82b34
* release/11

found by looking at your commit b3f0465, then finding a new
function seg_free_context and then:
$ git blame libavformat/segment.c | grep seg_free_context


There are some pacakges that depend on libav:
    libav/libpostproc_git.bb
    gstreamer
    alsa-plugins

From:
$ grep -r libav meta/recipes* | grep DEPENDS | grep -v libavahi
meta/recipes-multimedia/libav/libpostproc_git.bb:DEPENDS = "libav"


$ grep -r libav meta/ | grep PACKAGECONFIG | grep libav
meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc:\
    PACKAGECONFIG[libav] = "--with-system-libav,,libav"
meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb:\
    PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec,libav"


I think the upgrade should be okay but please do test it.

../Randy

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-multimedia/libav/libav.inc            |  2 -
>   .../libav/libav/libav-fix-CVE-2014-9676.patch      | 98 ++++++++++++++++++++++
>   meta/recipes-multimedia/libav/libav_9.16.bb        |  4 -
>   meta/recipes-multimedia/libav/libav_9.18.bb        |  6 ++
>   4 files changed, 104 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
>   delete mode 100644 meta/recipes-multimedia/libav/libav_9.16.bb
>   create mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
>
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
> index cac836f..6ef273b 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -24,8 +24,6 @@ ARM_INSTRUCTION_SET = "arm"
>
>   DEPENDS = "alsa-lib zlib libogg yasm-native"
>
> -INC_PR = "r8"
> -
>   inherit autotools pkgconfig
>
>   B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
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
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

