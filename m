Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5800A6BEDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:30:28 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so572981lab.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4Sj917tPxdykxRS+uc0hlJQyWjcxSibd+rmaEQVP1Fw=;
	b=fwCHHuWP3GxqTjn8aWhVU9P2JcH95E/6TpFdotKzsnx9Pfwpdd6lTPBDMiET6qXrAW
	PBrb1DCJtr3b045fWGyQEn0VItJDeRn3cZSk55EiEWW3oIUD0NNw5kicdZ8wNHtRtz/7
	drgMtc5+CmkJ5PXn4pdMBnS929wWqtcTCWOnaHXlIFd3P/8SJrPjLxOVlq/FiQQjvLph
	Kt6GceXP851eLQ9hklh0L5p2JaEqTSCgIczdLAqNeeLgRMLJTTnq5gIzmyrqJGrqlkfz
	wq6IO2IvGzfc9zxGbr8wU15epE8jkcdtvmH7lGaXsow74C/XlkkQq2DW3nmCnudHHRmV
	PBwg==
X-Received: by 10.112.130.134 with SMTP id oe6mr3844870lbb.30.1377793828072;
	Thu, 29 Aug 2013 09:30:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.53.197 with HTTP; Thu, 29 Aug 2013 09:30:08 -0700 (PDT)
In-Reply-To: <20130829053621.GK3544@jama>
References: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
	<521E8414.8060309@linux.intel.com>
	<CABcZANn4xsTBz-K+cq3ALD076t3cuYw_Q_qRo_Hb_Yip+VUdGw@mail.gmail.com>
	<20130829053621.GK3544@jama>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 29 Aug 2013 09:30:08 -0700
Message-ID: <CABcZANk2XbPqmQbPiM8CswkjaiD2HaunwpoisWsPm7HzZH=1WQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: don't split immodules if we have none
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
X-List-Received-Date: Thu, 29 Aug 2013 16:30:28 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8976b2347c04e5189f6f

--047d7b3a8976b2347c04e5189f6f
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 28, 2013 at 10:36 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Aug 28, 2013 at 05:05:38PM -0700, Chris Larson wrote:
> > On Wed, Aug 28, 2013 at 4:13 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >
> > > On 08/28/2013 09:12 AM, Christopher Larson wrote:
> > >
> > >> From: Christopher Larson <chris_larson@mentor.com>
> > >>
> > >> Currently we don't enable any immodules for gtk+3, yet we
> unconditionally
> > >> call
> > >> do_split_packages on a nonexistent path. This results in a return
> value of
> > >> None, which it then tries to join, resulting in a TypeError. Only
> split
> > >> the
> > >> modules if we have any modules to split.
> > >>
> > >> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > >> ---
> > >>   meta/recipes-gnome/gtk+/gtk+3.**inc | 3 ++-
> > >>   1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/recipes-gnome/gtk+/gtk+**3.inc
> > >> b/meta/recipes-gnome/gtk+/gtk+**3.inc
> > >> index f4d5254..204a425 100644
> > >> --- a/meta/recipes-gnome/gtk+/gtk+**3.inc
> > >> +++ b/meta/recipes-gnome/gtk+/gtk+**3.inc
> > >> @@ -94,7 +94,8 @@ python populate_packages_prepend () {
> > >>       immodules_root = os.path.join(gtk_libdir, 'immodules')
> > >>       printmodules_root = os.path.join(gtk_libdir, 'printbackends');
> > >>
> > >> -    d.setVar('GTKIMMODULES_**PACKAGES', ' '.join(do_split_packages(d,
> > >> immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input
> module for
> > >> %s')))
> > >> +    if os.path.exists(os.path.join(d.**getVar('D', True),
> > >> immodules_root)):
> > >> +        d.setVar('GTKIMMODULES_**PACKAGES', '
> > >> '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$',
> > >> 'gtk3-immodule-%s', 'GTK input module for %s')))
> > >>       do_split_packages(d, printmodules_root,
> > >> '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK
> printbackend
> > >> module for %s')
> > >>
> > >>       if (d.getVar('DEBIAN_NAMES', 1)):
> > >>
> > >>
> > > This seems to give me the following QA error:
> > >
> > >  ERROR: QA Issue: gtk+3: Files/directories were installed but not
> shipped
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-viqr.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-am-et.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-xim.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-multipress.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cedilla.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-et.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ipa.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-inuktitut.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-er.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-thai.so
> > >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cyrillic-**translit.so
> > >> ERROR: QA run found fatal errors. Please consider fixing them.
> > >> ERROR: Function failed: do_package_qa
> > >> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/**
> > >> work/x86_64-poky-linux/gtk+3/**3.8.2-r0/temp/log.do_package.**17386
> > >> ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-**gnome/gtk+/gtk+
> 3_3.8.2.bb,
> > >> do_package) failed with exit code '1'
> > >> NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn't need
> to be
> > >> rerun and 1 failed.
> > >
> > >
> > Huh, interesting, on this box it doesn't build any modules at all, hence
> > the need for this.. oh, I see what I did wrong, I used os.path.join(), so
> > gtk_libdir squished ${D} down to nothing. I'll send a v2 using the
> > oe.path.join, and also try to determine why it builds modules for you but
> > not me :) I expect we should be passing an explicit autoconf argument to
> > enable all modules, or not.
>
> Why not use return value from do_split_packages to decide whether to set
> GTKIMMODULES_**PACKAGES or not? At least that's what's already used in
> some places.


Sent a new short series of 2 patches to do just that as well as fix the
real root cause of the issue I was hitting. Thanks for the review.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b3a8976b2347c04e5189f6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 28, 2013 at 10:36 PM, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Aug 28, 2013 at 05=
:05:38PM -0700, Chris Larson wrote:<br>
&gt; On Wed, Aug 28, 2013 at 4:13 PM, Saul Wold &lt;<a href=3D"mailto:sgw@l=
inux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On 08/28/2013 09:12 AM, Christopher Larson wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Currently we don&#39;t enable any immodules for gtk+3, yet we=
 unconditionally<br>
&gt; &gt;&gt; call<br>
&gt; &gt;&gt; do_split_packages on a nonexistent path. This results in a re=
turn value of<br>
&gt; &gt;&gt; None, which it then tries to join, resulting in a TypeError. =
Only split<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; modules if we have any modules to split.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris=
_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
</div>&gt; &gt;&gt; =C2=A0 meta/recipes-gnome/gtk+/gtk+3.**inc | 3 ++-<br>
<div class=3D"im">&gt; &gt;&gt; =C2=A0 1 file changed, 2 insertions(+), 1 d=
eletion(-)<br>
&gt; &gt;&gt;<br>
</div>&gt; &gt;&gt; diff --git a/meta/recipes-gnome/gtk+/gtk+**3.inc<br>
&gt; &gt;&gt; b/meta/recipes-gnome/gtk+/gtk+**3.inc<br>
&gt; &gt;&gt; index f4d5254..204a425 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-gnome/gtk+/gtk+**3.inc<br>
&gt; &gt;&gt; +++ b/meta/recipes-gnome/gtk+/gtk+**3.inc<br>
<div class=3D"im">&gt; &gt;&gt; @@ -94,7 +94,8 @@ python populate_packages_=
prepend () {<br>
&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 immodules_root =3D os.path.join(gtk_libd=
ir, &#39;immodules&#39;)<br>
&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 printmodules_root =3D os.path.join(gtk_l=
ibdir, &#39;printbackends&#39;);<br>
&gt; &gt;&gt;<br>
</div>&gt; &gt;&gt; - =C2=A0 =C2=A0d.setVar(&#39;GTKIMMODULES_**PACKAGES&#3=
9;, &#39; &#39;.join(do_split_packages(d,<br>
<div class=3D"im">&gt; &gt;&gt; immodules_root, &#39;^im-(.*)\.so$&#39;, &#=
39;gtk3-immodule-%s&#39;, &#39;GTK input module for<br>
&gt; &gt;&gt; %s&#39;)))<br>
</div>&gt; &gt;&gt; + =C2=A0 =C2=A0if os.path.exists(os.path.join(d.**getVa=
r(&#39;D&#39;, True),<br>
&gt; &gt;&gt; immodules_root)):<br>
&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;GTKIMMODULES_**PAC=
KAGES&#39;, &#39;<br>
<div class=3D"im">&gt; &gt;&gt; &#39;.join(do_split_packages(d, immodules_r=
oot, &#39;^im-(.*)\.so$&#39;,<br>
&gt; &gt;&gt; &#39;gtk3-immodule-%s&#39;, &#39;GTK input module for %s&#39;=
)))<br>
&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, printmodules_root,<=
br>
&gt; &gt;&gt; &#39;^libprintbackend-(.*)\.so$&#39;, &#39;gtk3-printbackend-=
%s&#39;, &#39;GTK printbackend<br>
&gt; &gt;&gt; module for %s&#39;)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 if (d.getVar(&#39;DEBIAN_NAMES&#39;, 1))=
:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt; This seems to give me the following QA error:<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0ERROR: QA Issue: gtk+3: Files/directories were installed bu=
t not shipped<br>
</div>&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-viqr.so<br=
>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-am-et.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-xim.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-multipress.so<br=
>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-cedilla.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-et.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-ipa.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-inuktitut.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-er.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-thai.so<br>
&gt; &gt;&gt; =C2=A0 /usr/lib/gtk-3.0/3.0.0/**immodules/im-cyrillic-**trans=
lit.so<br>
<div class=3D"im">&gt; &gt;&gt; ERROR: QA run found fatal errors. Please co=
nsider fixing them.<br>
&gt; &gt;&gt; ERROR: Function failed: do_package_qa<br>
</div>&gt; &gt;&gt; ERROR: Logfile of failure stored in: /srv/hdd/builds/wo=
rld/tmp/**<br>
&gt; &gt;&gt; work/x86_64-poky-linux/gtk+3/**3.8.2-r0/temp/log.do_package.*=
*17386<br>
&gt; &gt;&gt; ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-**gnome/gtk+/gtk=
+<a href=3D"http://3_3.8.2.bb" target=3D"_blank">3_3.8.2.bb</a>,<br>
<div class=3D"im">&gt; &gt;&gt; do_package) failed with exit code &#39;1&#3=
9;<br>
&gt; &gt;&gt; NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn&=
#39;t need to be<br>
&gt; &gt;&gt; rerun and 1 failed.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Huh, interesting, on this box it doesn&#39;t build any modules at all,=
 hence<br>
&gt; the need for this.. oh, I see what I did wrong, I used os.path.join(),=
 so<br>
&gt; gtk_libdir squished ${D} down to nothing. I&#39;ll send a v2 using the=
<br>
&gt; oe.path.join, and also try to determine why it builds modules for you =
but<br>
&gt; not me :) I expect we should be passing an explicit autoconf argument =
to<br>
&gt; enable all modules, or not.<br>
<br>
</div>Why not use return value from do_split_packages to decide whether to =
set<br>
GTKIMMODULES_**PACKAGES or not? At least that&#39;s what&#39;s already used=
 in<br>
some places.</blockquote></div><br>Sent a new short series of 2 patches to =
do just that as well as fix the real root cause of the issue I was hitting.=
 Thanks for the review.<br>-- <br>Christopher Larson<br>clarson at kergoth =
dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--047d7b3a8976b2347c04e5189f6f--
