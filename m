Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6451C75949
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 08:40:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jun 2015 01:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,601,1427785200"; d="scan'208";a="742015437"
Received: from sgwillia-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.2.70])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2015 01:40:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 12 Jun 2015 09:40:52 +0100
Message-ID: <1557617.mLfaxnFia7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <557A4FDF.7060304@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
	<7189f3ea9eb20d08f73abf3af4715a43f73740c0.1433842738.git.liezhi.yang@windriver.com>
	<557A4FDF.7060304@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/12] libav: 9.18 -> 11.4
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
X-List-Received-Date: Fri, 12 Jun 2015 08:40:53 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I didn't talk to Richard about it but I think there may have been some=20=

discussion on this list about the possibility of 9->10->11 breaking API=
=20
compatibility with applications. Did you do testing with recipes in met=
a-
oe/meta-multimedia that depend upon libav?

On Friday 12 June 2015 11:19:59 Robert Yang wrote:
> Hello,
>=20
> Other patches had been merged except this one, any comments on it, pl=
ease ?
>=20
> // Robert
>=20
> On 06/09/2015 10:51 PM, Robert Yang wrote:
> > * Remove the backport patch libav-fix-CVE-2014-9676.patch.
> > * Backport a patch from debain to fix the build for i586 with gcc.
> >=20
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >=20
> >   meta/recipes-multimedia/libav/libav.inc            |    4 +-
> >   .../libav/libav/libav-fix-CVE-2014-9676.patch      |   98
> >   -------------------- ...rkaround-to-build-libav-for-i586-with-gcc=
.patch
> >   |   26 ++++++
> >   meta/recipes-multimedia/libav/libav_11.4.bb        |    4 +
> >   meta/recipes-multimedia/libav/libav_9.18.bb        |    6 --
> >   5 files changed, 33 insertions(+), 105 deletions(-)
> >   delete mode 100644
> >   meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch=

> >   create mode 100644
> >   meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for=
-i586-
> >   with-gcc.patch create mode 100644
> >   meta/recipes-multimedia/libav/libav_11.4.bb
> >   delete mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
> >=20
> > diff --git a/meta/recipes-multimedia/libav/libav.inc
> > b/meta/recipes-multimedia/libav/libav.inc index 6ef273b..6cd04c7 10=
0644
> > --- a/meta/recipes-multimedia/libav/libav.inc
> > +++ b/meta/recipes-multimedia/libav/libav.inc
> > @@ -15,7 +15,9 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \>=20
> >                       file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c8=
12e4c18d1
> >                       b79df004 \
> >                       file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde=
2d9836802
> >                       33ad02"
> >=20
> > -SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> > +SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz \
> > +           file://workaround-to-build-libav-for-i586-with-gcc.patc=
h \
> > +"
> >=20
> >   # Provides ffmpeg compat, see http://libav.org/about.html
> >   PROVIDES =3D "ffmpeg"
> >=20
> > diff --git
> > a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch=

> > b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch=

> > deleted file mode 100644
> > index 1e31caa..0000000
> > --- a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.p=
atch
> > +++ /dev/null
> > @@ -1,98 +0,0 @@
> > -Upstream-Status: Backport
> > -
> > -Backport patch to fix CVE-2014-9676.
> > -
> > -https://security-tracker.debian.org/tracker/CVE-2014-9676
> > -https://git.libav.org/?p=3Dlibav.git;a=3Dcommit;h=3Db3f04657368a32=
a9903406395f8
> > 65e230b1de348 -
> > -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ----
> > -From b3f04657368a32a9903406395f865e230b1de348 Mon Sep 17 00:00:00 =
2001
> > -From: Luca Barbato <lu_zero@gentoo.org>
> > -Date: Mon, 5 Jan 2015 10:40:41 +0100
> > -Subject: [PATCH] segment: Fix the failure paths
> > -
> > -A failure in segment_end() or segment_start() would lead to freein=
g
> > -a dangling pointer and in general further calls to seg_write_packe=
t()
> > -or to seg_write_trailer() would have the same faulty behaviour.
> > -
> > -CC: libav-stable@libav.org
> > -Reported-By: luodalongde@gmail.com
> > ----
> > - libavformat/segment.c | 32 ++++++++++++++++++++------------
> > - 1 file changed, 20 insertions(+), 12 deletions(-)
> > -
> > -diff --git a/libavformat/segment.c b/libavformat/segment.c
> > -index 52da6b9..bcfd1f9 100644
> > ---- a/libavformat/segment.c
> > -+++ b/libavformat/segment.c
> > -@@ -184,6 +184,13 @@ static void close_null_ctx(AVIOContext *pb)
> > -     av_free(pb);
> > - }
> > -
> > -+static void seg_free_context(SegmentContext *seg)
> > -+{
> > -+    avio_closep(&seg->pb);
> > -+    avformat_free_context(seg->avf);
> > -+    seg->avf =3D NULL;
> > -+}
> > -+
> > - static int seg_write_header(AVFormatContext *s)
> > - {
> > -     SegmentContext *seg =3D s->priv_data;
> > -@@ -265,12 +272,9 @@ static int seg_write_header(AVFormatContext *=
s)
> > -     }
> > -
> > - fail:
> > --    if (ret) {
> > --        if (seg->list)
> > --            avio_close(seg->pb);
> > --        if (seg->avf)
> > --            avformat_free_context(seg->avf);
> > --    }
> > -+    if (ret < 0)
> > -+        seg_free_context(seg);
> > -+
> > -     return ret;
> > - }
> > -
> > -@@ -282,6 +286,9 @@ static int seg_write_packet(AVFormatContext *s=
,
> > AVPacket *pkt) -     int64_t end_pts =3D seg->recording_time * seg-=
>number;
> > -     int ret, can_split =3D 1;
> > -
> > -+    if (!oc)
> > -+        return AVERROR(EINVAL);
> > -+
> > -     if (seg->has_video) {
> > -         can_split =3D st->codec->codec_type =3D=3D AVMEDIA_TYPE_V=
IDEO &&
> > -                     pkt->flags & AV_PKT_FLAG_KEY;
> > -@@ -322,11 +329,8 @@ static int seg_write_packet(AVFormatContext *=
s,
> > AVPacket *pkt) -     ret =3D ff_write_chained(oc, pkt->stream_index=
, pkt,
> > s);
> > -
> > - fail:
> > --    if (ret < 0) {
> > --        if (seg->list)
> > --            avio_close(seg->pb);
> > --        avformat_free_context(oc);
> > --    }
> > -+    if (ret < 0)
> > -+        seg_free_context(seg);
> > -
> > -     return ret;
> > - }
> > -@@ -335,7 +339,11 @@ static int seg_write_trailer(struct AVFormatC=
ontext
> > *s) - {
> > -     SegmentContext *seg =3D s->priv_data;
> > -     AVFormatContext *oc =3D seg->avf;
> > --    int ret;
> > -+    int ret =3D 0;
> > -+
> > -+    if (!oc)
> > -+        goto fail;
> > -+
> > -     if (!seg->write_header_trailer) {
> > -         if ((ret =3D segment_end(oc, 0)) < 0)
> > -             goto fail;
> > ---
> > -2.4.1.314.g9532ead
> > -
> > diff --git
> > a/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for=
-i586-
> > with-gcc.patch
> > b/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for=
-i586-
> > with-gcc.patch new file mode 100644
> > index 0000000..36f6ded
> > --- /dev/null
> > +++
> > b/meta/recipes-multimedia/libav/libav/workaround-to-build-libav-for=
-i586-
> > with-gcc.patch @@ -0,0 +1,26 @@
> > +Description: Workaround to build libav for i586 with gcc 4.9.2 by
> > avoiding memset +Author: Bernhard =EF=BF=BDbelacker <bernhardu@vr-w=
eb.de>
> > +
> > +---
> > +Bug-Debian: https://bugs.debian.org/783082
> > +Last-Update: 2015-04-28
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +--- libav-11.3.orig/libavcodec/h264_cabac.c
> > ++++ libav-11.3/libavcodec/h264_cabac.c
> > +@@ -2020,7 +2020,11 @@ decode_intra_mb:
> > +         // In deblocking, the quantizer is 0
> > +         h->cur_pic.qscale_table[mb_xy] =3D 0;
> > +         // All coeffs are present
> > +-        memset(h->non_zero_count[mb_xy], 16, 48);
> > ++        /*memset(h->non_zero_count[mb_xy], 16, 48);*/
> > ++            /* avoiding this memset because it leads at least wit=
h
> > gcc4.9.2 to error: 'asm' operand has impossible constraints */ ++  =
    =20
> > for (size_t i =3D 0; i < 48; i++) {
> > ++            ( (unsigned char*)(h->non_zero_count[mb_xy]) ) [i] =3D=
 16;
> > ++        }
> > +         h->cur_pic.mb_type[mb_xy] =3D mb_type;
> > +         h->last_qscale_diff =3D 0;
> > +         return 0;
> > diff --git a/meta/recipes-multimedia/libav/libav_11.4.bb
> > b/meta/recipes-multimedia/libav/libav_11.4.bb new file mode 100644
> > index 0000000..dde7094
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libav/libav_11.4.bb
> > @@ -0,0 +1,4 @@
> > +require libav.inc
> > +
> > +SRC_URI[md5sum] =3D "98c264530a3a5e569543f60b917c3daa"
> > +SRC_URI[sha256sum] =3D
> > "0b7dabc2605f3a254ee410bb4b1a857945696aab495fe21b34c3b6544ff5d525" =
diff
> > --git a/meta/recipes-multimedia/libav/libav_9.18.bb
> > b/meta/recipes-multimedia/libav/libav_9.18.bb deleted file mode 100=
644
> > index 210a649..0000000
> > --- a/meta/recipes-multimedia/libav/libav_9.18.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require libav.inc
> > -
> > -SRC_URI[md5sum] =3D "75e838068a75fb88e1b4ea0546bc16f0"
> > -SRC_URI[sha256sum] =3D
> > "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614d066d7" =
-
> > -SRC_URI +=3D "file://libav-fix-CVE-2014-9676.patch"

--=20

Paul Eggleton
Intel Open Source Technology Centre

