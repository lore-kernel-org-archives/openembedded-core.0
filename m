Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 068116BD9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 17:41:39 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so2036867qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Cn1c/Lm9fwmboFLOAQAESPfzOGa8dTM+L/OpGE5WP3M=;
	b=sIBBZ0GtgerYjlZaiYXhwYF6yjzrbxXyKBo1ExCqLzSaOFC6FUfRxvWTdnPd6OzZoH
	Mp2iFxWJnS3ZX0lbDHuFJZ04BGepLxydwb5YltIS4GlzwLbcSiTgSsifEUYQn3QtPSfb
	lIU4N6QHe5cunpSPcTtnPEBl6kXaFCXfBQsAvAp9oU7a7q3lM1KuUP9e5r0sl56wM3D7
	+JiReHD+38oVwaUiqgkxPrpOWBxy126Eq4vmwpDUo80T++i43WTzqKKYpgEeQJr9XDPs
	T8ieGPQqlgr+szZ91IjuK64tVHNBDDDrJL5iGNPfb4x97dzIlM7LZDdQyyEGNffjXxUe
	ojcg==
MIME-Version: 1.0
X-Received: by 10.140.48.1 with SMTP id n1mr11866990qga.107.1401385300557;
	Thu, 29 May 2014 10:41:40 -0700 (PDT)
Received: by 10.96.84.232 with HTTP; Thu, 29 May 2014 10:41:40 -0700 (PDT)
Received: by 10.96.84.232 with HTTP; Thu, 29 May 2014 10:41:40 -0700 (PDT)
In-Reply-To: <1401318568.2607.69.camel@ted>
References: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
	<1401318568.2607.69.camel@ted>
Date: Thu, 29 May 2014 11:41:40 -0600
Message-ID: <CACS+7ZT+XvexBLGbsSEOF=GV=R5gqsNm_G8QF=FpeRbZHX2Xwg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gzip: Avoid host contamination during build
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
X-List-Received-Date: Thu, 29 May 2014 17:41:47 -0000
Content-Type: multipart/alternative; boundary=001a11350eac08854104fa8d719f

--001a11350eac08854104fa8d719f
Content-Type: text/plain; charset=UTF-8

On May 28, 2014 5:09 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2014-05-27 at 17:38 -0600, Dan McGregor wrote:
> > From: Dan McGregor <dan.mcgregor@usask.ca>
> >
> > On systems with /bin and /usr/bin merged the gzip recipe may find grep
> > in /usr/bin, while OE puts it in /bin. Force the recipe to find grep in
> > the correct place.
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> > ---
> >  meta/recipes-extended/gzip/gzip.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-extended/gzip/gzip.inc
> > b/meta/recipes-extended/gzip/gzip.inc
> > index 920b256..57873cb 100644
> > --- a/meta/recipes-extended/gzip/gzip.inc
> > +++ b/meta/recipes-extended/gzip/gzip.inc
> > @@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
> >
> >  inherit autotools texinfo
> >
> > +EXTRA_OEMAKE = "GREP=${base_bindir}/grep"
> > +
> >  do_install_append () {
> >   # Rename and move files into /bin (FHS), which is typical place for
gzip
> >   install -d ${D}${base_bindir}
>
> My worry is what happens to gzip-native. Do we have to encode a path?
>
> Cheers,
>
> Richard
>
gzip native does encode a path, but what it encodes should probably be what
gets automatically configured. Would making the EXTRA_OEMAKE variable be
EXTRA_OEMAKE_class-target then?

--001a11350eac08854104fa8d719f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On May 28, 2014 5:09 PM, &quot;Richard Purdie&quot; &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2014-05-27 at 17:38 -0600, Dan McGregor wrote:<br>
&gt; &gt; From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca">d=
an.mcgregor@usask.ca</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; On systems with /bin and /usr/bin merged the gzip recipe may find=
 grep<br>
&gt; &gt; in /usr/bin, while OE puts it in /bin. Force the recipe to find g=
rep in<br>
&gt; &gt; the correct place.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@us=
ask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/recipes-extended/gzip/gzip.inc | 2 ++<br>
&gt; &gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-extended/gzip/gzip.inc<br>
&gt; &gt; b/meta/recipes-extended/gzip/gzip.inc<br>
&gt; &gt; index 920b256..57873cb 100644<br>
&gt; &gt; --- a/meta/recipes-extended/gzip/gzip.inc<br>
&gt; &gt; +++ b/meta/recipes-extended/gzip/gzip.inc<br>
&gt; &gt; @@ -12,6 +12,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gzip/${BP}.tar.=
gz&quot;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0inherit autotools texinfo<br>
&gt; &gt;<br>
&gt; &gt; +EXTRA_OEMAKE =3D &quot;GREP=3D${base_bindir}/grep&quot;<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0do_install_append () {<br>
&gt; &gt; =C2=A0 # Rename and move files into /bin (FHS), which is typical =
place for gzip<br>
&gt; &gt; =C2=A0 install -d ${D}${base_bindir}<br>
&gt;<br>
&gt; My worry is what happens to gzip-native. Do we have to encode a path?<=
br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
gzip native does encode a path, but what it encodes should probably be what=
 gets automatically configured. Would making the EXTRA_OEMAKE variable be E=
XTRA_OEMAKE_class-target then?</p>

--001a11350eac08854104fa8d719f--
