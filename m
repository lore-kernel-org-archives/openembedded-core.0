Return-Path: <krussell7711@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C26865C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 18:51:29 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id 184so628936yby.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=azvyJMby9pIoVvbz/TeaYtKbb4h5AFcekeWpQq6aKB8=;
	b=nyx3crurHFi2aJjz2DBAHQKoOXj/ritG+2cfRTaMNXIaf68riUhSGmBWRKcQqg9br2
	FUqim03CwFCB8XnOKbwsMlnCQe2mKZW20X8hDo6WP5ki9x3uRzde+JAz6yjJiLhqZYNz
	fMqxAbHmS8dz0Z/G/tvT1YC0WC9aSKamATYUHnokQpVJO/SgSWd0tyTZdrXaPHlH6Vqh
	tyzNDoTilaMUWumvCZkfnthmchjyRSYuLKO29N+UqBXzM0wpcPmfvVn3qNLGExFyC+wz
	xBiWYuxiwm6Aspq5QeMQi9MsxVWKZlthImwrHeQr6m54drHEQipFcoaz6nOJMPWsfNJv
	7YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=azvyJMby9pIoVvbz/TeaYtKbb4h5AFcekeWpQq6aKB8=;
	b=VjyY3OZizspQC+8+hRpihi1l3TKr34VMumxKjtQywbrAlpImOZ5Zdbm/lqN5OoxgA2
	OQxpvF/R2Gmqhs/kmNrD4ll5a3+cHcpQGo/g4ZNsn67640ebaDUsni3rFJULTEU6HApy
	hkh3df9qHCytpxYHyLMoGPNOhuXqpA2X5wJnMFSKpnpT68pGVWA4hINgTG+0/CbMao9A
	IOXftm/a0vomMWszitZeL46kDGOHooEtTSSVdheIcWiiOAYrfOyTmFrKbHHD3900nBu4
	LyMYNNrOlWr9SIMs5UNgZHNJKMikIIlZA3tw1yEs8Brm7914KsRLephY7DKWuc5psuiy
	+r7g==
X-Gm-Message-State: AA6/9RmRgb1eJriekFC/q2Rny0NmtZczdDEbDf9gljuw+6BtiIMv8HJOasmfozXeSPu1z0LqdUgHQLFw1UngBw==
X-Received: by 10.37.173.146 with SMTP id z18mr4910341ybi.194.1476211890966;
	Tue, 11 Oct 2016 11:51:30 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.129.155.145 with HTTP; Tue, 11 Oct 2016 11:51:10 -0700 (PDT)
In-Reply-To: <20161011182933.GB2917@jama>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<20161011182933.GB2917@jama>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Tue, 11 Oct 2016 14:51:10 -0400
X-Google-Sender-Auth: krPOGoQC7QRb6l-hlIudVWrwKZ8
Message-ID: <CAFrQVPOLDfbDsu8KNXATRJdQbCTcDnmnTO8L84jAUReyMUBBRA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pixbufcache: Ensure sysroot dependencies are satisfied
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
X-List-Received-Date: Tue, 11 Oct 2016 18:51:30 -0000
Content-Type: multipart/alternative; boundary=f403045db1145ff79d053e9b5da2

--f403045db1145ff79d053e9b5da2
Content-Type: text/plain; charset=UTF-8

The symptoms sound very similar as far as the postinst exception; however,
I don't think I've seen an error specifically for libpcre before.  I think
in one instance, gdk-pixbuf-query-loaders itself was missing, and in
another instance, one of the libraries provided by harfbuzz. Looking
through the logs, the do_populate_sysroot_setscene tasks for these packages
never ran. (My memory might be off slightly about the specific packages
that were missing, though in each failure instance they were listed in the
librsvg PIXBUFCACHE_SYSROOT_DEPS variable.)

Since PIXBUFCACHE_SYSROOT_DEPS didn't appear to be used anywhere, and we
kept hitting what appeared to be dependency issues with setscene tasks not
running, we thought maybe this hunk was inadvertantly removed from
pixbufcache.bbclass. We've been running with this patch for a few weeks on
our jethro branch and haven't seen any subsequent postinst failures (except
the two packages I addressed in my second patch). The logs from the failed
builds have already been reaped from the build slave, or I could go back to
verify exactly which error messages we encountered in postinst.

Should these setscene dependencies be satisfied another way?

On Tue, Oct 11, 2016 at 2:29 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Oct 11, 2016 at 10:17:16AM -0400, Kyle Russell wrote:
> > Reverts part of b411085fefc8582d24c172db5f6610705eb44c2f
> >
> > Makes sure gdk-pixbuf-native populates the sysroot during setscene;
> > otherwise, gdk-pixbuf-query-loaders may not actually be available at the
> > time the completion function runs, causing a build failure.
> >
> > Similarly, packages providing loader libraries should append to
> > PIXBUFCACHE_SYSROOT_DEPS with their runtime dependencies.
>
> Is this related to
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10102
> ? Or are you seeing completely different errors?
>
> > Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> > ---
> >  meta/classes/pixbufcache.bbclass | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/meta/classes/pixbufcache.bbclass
> b/meta/classes/pixbufcache.bbclass
> > index dbe11e1..3c1e398 100644
> > --- a/meta/classes/pixbufcache.bbclass
> > +++ b/meta/classes/pixbufcache.bbclass
> > @@ -65,3 +65,17 @@ pixbufcache_sstate_postinst() {
> >       fi
> >  }
> >
> > +# Add all of the dependencies of gdk-pixbuf as dependencies of
> > +# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can
> work
> > +# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
> > +# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
> > +#
> > +# Packages that use this class should extend this variable with their
> runtime
> > +# dependencies.
> > +PIXBUFCACHE_SYSROOT_DEPS = ""
> > +PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
> > +    ${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}'
> == 'gdk-pixbuf']} \
> > +"
> > +
> > +do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
> > +do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS',
> True).replace('_setscene','')}"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--f403045db1145ff79d053e9b5da2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The symptoms sound very similar as far as the postinst exc=
eption; however, I don&#39;t think I&#39;ve seen an error specifically for =
libpcre before.=C2=A0 I think in one instance,=C2=A0<span style=3D"color:rg=
b(0,0,0);white-space:pre-wrap">gdk-pixbuf-query-loaders itself was missing,=
 and in another instance, one of the libraries provided by harfbuzz.  Looki=
ng through the logs, the do_populate_sysroot_setscene tasks for these packa=
ges never ran.  (My memory might be off slightly about the specific package=
s that were missing, though in each failure instance they were listed in th=
e librsvg PIXBUFCACHE_SYSROOT_DEPS variable.)</span><div><span style=3D"col=
or:rgb(0,0,0);white-space:pre-wrap"><br></span></div><div><span style=3D"co=
lor:rgb(0,0,0);white-space:pre-wrap">Since PIXBUFCACHE_SYSROOT_DEPS didn&#3=
9;t appear to be used anywhere, and we kept hitting what appeared to be dep=
endency issues with setscene tasks not running, we thought maybe this hunk =
was inadvertantly removed from pixbufcache.bbclass.  We&#39;ve been running=
 with this patch for a few weeks on our jethro branch and haven&#39;t seen =
any subsequent postinst failures (except the two packages I addressed in my=
 second patch).  The logs from the failed builds have already been reaped f=
rom the build slave, or I could go back to verify exactly which error messa=
ges we encountered in postinst.</span></div><div><span style=3D"color:rgb(0=
,0,0);white-space:pre-wrap"><br></span></div><div><span style=3D"color:rgb(=
0,0,0);white-space:pre-wrap">Should these setscene dependencies be satisfie=
d another way?</span></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Oct 11, 2016 at 2:29 PM, Martin Jansa <span dir=3D=
"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Tue, Oct 11, 2016 at 10:17:16AM -0400, Kyle Russell wrot=
e:<br>
&gt; Reverts part of b411085fefc8582d24c172db5f6610<wbr>705eb44c2f<br>
&gt;<br>
&gt; Makes sure gdk-pixbuf-native populates the sysroot during setscene;<br=
>
&gt; otherwise, gdk-pixbuf-query-loaders may not actually be available at t=
he<br>
&gt; time the completion function runs, causing a build failure.<br>
&gt;<br>
&gt; Similarly, packages providing loader libraries should append to<br>
&gt; PIXBUFCACHE_SYSROOT_DEPS with their runtime dependencies.<br>
<br>
</span>Is this related to<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10102" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10102</a><br>
? Or are you seeing completely different errors?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Kyle Russell &lt;<a href=3D"mailto:bkylerussell@gmail.c=
om">bkylerussell@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/pixbufcache.<wbr>bbclass | 14 ++++++++++++++<br>
&gt;=C2=A0 1 file changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/pixbufcache.<wbr>bbclass b/meta/classes/pixb=
ufcache.<wbr>bbclass<br>
&gt; index dbe11e1..3c1e398 100644<br>
&gt; --- a/meta/classes/pixbufcache.<wbr>bbclass<br>
&gt; +++ b/meta/classes/pixbufcache.<wbr>bbclass<br>
&gt; @@ -65,3 +65,17 @@ pixbufcache_sstate_postinst() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +# Add all of the dependencies of gdk-pixbuf as dependencies of<br>
&gt; +# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst ca=
n work<br>
&gt; +# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only ad=
d<br>
&gt; +# gdk-pixbuf-native if we&#39;re not building gdk-pixbuf itself.<br>
&gt; +#<br>
&gt; +# Packages that use this class should extend this variable with their=
 runtime<br>
&gt; +# dependencies.<br>
&gt; +PIXBUFCACHE_SYSROOT_DEPS =3D &quot;&quot;<br>
&gt; +PIXBUFCACHE_SYSROOT_DEPS_<wbr>class-native =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${@[&#39;gdk-pixbuf-native:do_<wbr>populate_sysroot_set=
scene&#39;, &#39;&#39;][&#39;${BPN}&#39; =3D=3D &#39;gdk-pixbuf&#39;]} \<br=
>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_populate_sysroot_setscene[<wbr>depends] +=3D &quot;${PIXBUFCACHE_S=
YSROOT_DEPS}&quot;<br>
&gt; +do_populate_sysroot[depends] +=3D &quot;${@d.getVar(&#39;PIXBUFCACHE_=
<wbr>SYSROOT_DEPS&#39;, True).replace(&#39;_setscene&#39;,&#39;&#39;)}<wbr>=
&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--f403045db1145ff79d053e9b5da2--
