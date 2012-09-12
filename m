Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBmEQ-00033n-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 14:39:50 +0200
Received: by iebc11 with SMTP id c11so2937158ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EGufRNrVPuuP+TpCn0lcwEoEg6nLQ+TOUdEDodex2Vc=;
	b=WhNqtz4R3cSBeARGGCdrXxDrR2D31rRTiTSHisMuEpXPd+Tovoi1ctjv6GpeLi2SnM
	M/R70O4UccxaaqvBEjJuULNEBDdrZrq7h5HzU7a5vJVBRPdyEDeMhKau5d5MDj6FxeAy
	qn/Dic4T9+V8P4OFWeyQavuDc1uhvNc2P978C5shLWRTPyGg0/uLYXnn1pwYvIpDlN/t
	DkQ0XnYzUjKIooFoehVnzvF8ZZs/bGTHn+bHFjVFEw4uZNCHWshlKSNdv0GkRbhr2DEd
	BrqJIda7SBTwUUzyHxkBgzVWyOPgjHd9doVk3k799ZM0RTCpKEcRFcwWIf6fGhNrJOuN
	vzPQ==
MIME-Version: 1.0
Received: by 10.50.195.232 with SMTP id ih8mr17194651igc.45.1347452836469;
	Wed, 12 Sep 2012 05:27:16 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 12 Sep 2012 05:27:16 -0700 (PDT)
In-Reply-To: <1346867411-8227-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346867411-8227-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 14:27:16 +0200
Message-ID: <CALbNGRQYN-fK4iqG5UmX7YsW42rQwRk86NUooEvBbabP=jv+Zg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-good: fix compile error with recent linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 12:39:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 5, 2012 at 7:50 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> With linux-libc-headers-3.5.0 (for tests) the error message was:
>
> | gstv4l2bufferpool.c: In function 'gst_v4l2_buffer_new':
> | gstv4l2bufferpool.c:184:3: error: 'struct v4l2_buffer' has no member na=
med 'input'
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 ++++++++++++++=
++++++
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    4 ++-
>  2 files changed, 36 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.=
10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0=
001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch b/meta/recip=
es-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-r=
ecent-kernels-the-v4l2_buffer-i.patch
> new file mode 100644
> index 0000000..6456d3c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l=
2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> @@ -0,0 +1,33 @@
> +From 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Wed, 5 Sep 2012 18:54:42 +0200
> +Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffer in=
put
> + field was removed
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport
> +
> +[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=3D=
9f2aa8d47f835ea155aaf635f618c0fc1ca87012
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + sys/v4l2/gstv4l2bufferpool.c |    1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
> +index b81c6a4..51cc0ce 100644
> +--- a/sys/v4l2/gstv4l2bufferpool.c
> ++++ b/sys/v4l2/gstv4l2bufferpool.c
> +@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint=
 index, GstCaps * caps)
> +     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
> +         ret->vbuffer.m.offset);
> +   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.lengt=
h);
> +-  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input=
);
> +
> +   data =3D (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
> +       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
> +--
> +1.7.6.5
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.b=
b b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index ac63f94..abcd836 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -7,10 +7,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9=
b6cdffcea4f398e37343 \
>
>  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3t=
ag flac \
>             speex libsoup-2.4 pulseaudio"
> -PR =3D "r2"
> +PR =3D "r3"
>
>  inherit gettext gconf
>
> +SRC_URI +=3D "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_bu=
ffer-i.patch"
> +
>  EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disa=
ble-libcaca --disable-hal --without-check \
>                   --disable-orc"
>
> --
Does it make sense to prepare a rebased version (it is a bugfix for
kernel-libc-headers used in the future >3.5)

Andreas


