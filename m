Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnga-0006BY-3D for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:13:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE0N5o020270;
	Wed, 12 Sep 2012 15:00:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19954-04; Wed, 12 Sep 2012 15:00:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE0Hda020264
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:00:18 +0100
Message-ID: <1347458419.11710.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 15:00:19 +0100
In-Reply-To: <CALbNGRQYN-fK4iqG5UmX7YsW42rQwRk86NUooEvBbabP=jv+Zg@mail.gmail.com>
References: <1346867411-8227-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQYN-fK4iqG5UmX7YsW42rQwRk86NUooEvBbabP=jv+Zg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8CE0N5o020270
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 12 Sep 2012 14:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 14:27 +0200, Andreas M=C3=BCller wrote:
> On Wed, Sep 5, 2012 at 7:50 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > With linux-libc-headers-3.5.0 (for tests) the error message was:
> >
> > | gstv4l2bufferpool.c: In function 'gst_v4l2_buffer_new':
> > | gstv4l2bufferpool.c:184:3: error: 'struct v4l2_buffer' has no membe=
r named 'input'
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 ++++++++++=
++++++++++
> >  .../gstreamer/gst-plugins-good_0.10.31.bb          |    4 ++-
> >  2 files changed, 36 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-goo=
d-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.=
31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch b/meta=
/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-buil=
d-with-recent-kernels-the-v4l2_buffer-i.patch
> > new file mode 100644
> > index 0000000..6456d3c
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001=
-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> > @@ -0,0 +1,33 @@
> > +From 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 20=
01
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@goo=
glemail.com>
> > +Date: Wed, 5 Sep 2012 18:54:42 +0200
> > +Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffe=
r input
> > + field was removed
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-Status: Backport
> > +
> > +[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?i=
d=3D9f2aa8d47f835ea155aaf635f618c0fc1ca87012
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > +---
> > + sys/v4l2/gstv4l2bufferpool.c |    1 -
> > + 1 files changed, 0 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpo=
ol.c
> > +index b81c6a4..51cc0ce 100644
> > +--- a/sys/v4l2/gstv4l2bufferpool.c
> > ++++ b/sys/v4l2/gstv4l2bufferpool.c
> > +@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, g=
uint index, GstCaps * caps)
> > +     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
> > +         ret->vbuffer.m.offset);
> > +   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.l=
ength);
> > +-  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.i=
nput);
> > +
> > +   data =3D (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
> > +       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
> > +--
> > +1.7.6.5
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.=
31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> > index ac63f94..abcd836 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> > @@ -7,10 +7,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e21=
00d9b6cdffcea4f398e37343 \
> >
> >  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib lib=
id3tag flac \
> >             speex libsoup-2.4 pulseaudio"
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  inherit gettext gconf
> >
> > +SRC_URI +=3D "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l=
2_buffer-i.patch"
> > +
> >  EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --=
disable-libcaca --disable-hal --without-check \
> >                   --disable-orc"
> >
> > --
> Does it make sense to prepare a rebased version (it is a bugfix for
> kernel-libc-headers used in the future >3.5)

I've merged it, thanks.

Richard




