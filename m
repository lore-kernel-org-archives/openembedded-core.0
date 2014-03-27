Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7556B6F157
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 17:53:40 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so2897658lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=g5tP4SGbhRRL/Eua5546oSc1qAn1HwQtgBlMzAaugxM=;
	b=LpZLyzEzCrcY8zau6A6CJUQxRY13EQcnDAbH6+nm4jdb3aVlQ6N//jzLlR/KAashxN
	19QYiWyGwn7Sc+eIFHsai7WxvoPf3PVjE6673vwQ2NbMeS/wmCRznvPfy0Pae6le/7qb
	2gizUoKIK9GBG0iGNCrir5EPMqxf4WdYij2m2wx4V8nqV3K3k/5KsfVG0lPBmt61Ur3u
	R3CzrYPB6e8URedA3RSFPOGTLPTRC4wJaeNljXBC5NVmEvrrT/Pe9DKJgcqNduRnR06W
	LYuKfLFGaDRdKCEZhZp2dzfZtVgL/EmPWUyLu2rRsDdVgZSi07ICWUNQ8UAug1kghVNL
	4jqg==
X-Received: by 10.152.19.7 with SMTP id a7mr1818678lae.16.1395942820745; Thu,
	27 Mar 2014 10:53:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Thu, 27 Mar 2014 10:53:20 -0700 (PDT)
In-Reply-To: <1395942565.24890.156.camel@ted>
References: <cover.1395717014.git.liezhi.yang@windriver.com>
	<5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
	<CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>
	<1395942565.24890.156.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 Mar 2014 10:53:20 -0700
X-Google-Sender-Auth: 3FnN2287_-W8z5EEwHi6ZxaU924
Message-ID: <CABcZAN=K8Rs2p1fCgkweJgpGEaji+Df-38ng7ZBx5ws4C-opRg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Thu, 27 Mar 2014 17:53:41 -0000
Content-Type: multipart/alternative; boundary=089e01494268f517bf04f59a43e2

--089e01494268f517bf04f59a43e2
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 27, 2014 at 10:49 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2014-03-27 at 10:21 -0700, Chris Larson wrote:
> >
> > On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang
> > <liezhi.yang@windriver.com> wrote:
> >         If we run "bitbake -S base-files" today, and re-run it
> >         tomorrow with
> >         nothing changed, we would see that the do_install.sigdata
> >         changes
> >         because of:
> >
> >         do_intall -> do_install_basefilesissue -> DISTRO_VERSION ->
> >         DATE
> >
> >         We had set:
> >         IMAGE_NAME[vardepsexclude] += "DATETIME"
> >         in meta/conf/bitbake.conf, we can set a similar line in
> >         base-files_3.0.14.bb to fix the problem.
> >
> >         [YOCTO #6032]
> >
> >         Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >
> > Wont't this mean base-files wouldn't be rebuilt when the day changes?
> > This seems problematic to me. I think this is a legitimate case for a
> > checksum change. If the distro version changes due to the date
> > changing, and the base-files includes the distro version in the issue
> > file, then we'd *want* base-files to rebuild to ensure the issue file
> > is correct, otherwise it'd be inaccurate, no?
> >
> I'm torn on this. Package feed creators probably don't want a package
> feed where the package changes daily but I can see this from both sides,
> I have often wondered why my build was rebuilding base-files...


Perhaps we should either not use DATE/TIME in the distro version at all, or
have a variable which is the current date, and a variable which locks to
the date of the creation of the TMPDIR but doesn't change after that, or
something, as a more persistent build environment identifier to use for
such cases. *shrug*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01494268f517bf04f59a43e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 27, 2014 at 10:49 AM, Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Thu, 2014-03-27 at 10:21 =
-0700, Chris Larson wrote:<br>
&gt;<br>
&gt; On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang<br>
&gt; &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver=
.com</a>&gt; wrote:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 If we run &quot;bitbake -S base-files&quot=
; today, and re-run it<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"aBn" tabindex=3D"0"><span c=
lass=3D"aQJ">tomorrow</span></span> with<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 nothing changed, we would see that the do_=
install.sigdata<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 changes<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_intall -&gt; do_install_basefilesissue =
-&gt; DISTRO_VERSION -&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 DATE<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 We had set:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_NAME[vardepsexclude] +=3D &quot;DATE=
TIME&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 in meta/conf/bitbake.conf, we can set a si=
milar line in<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://base-files_3.0.14.bb" ta=
rget=3D"_blank">base-files_3.0.14.bb</a> to fix the problem.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [YOCTO #6032]<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"=
mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Wont&#39;t this mean base-files wouldn&#39;t be rebuilt when the day c=
hanges?<br>
&gt; This seems problematic to me. I think this is a legitimate case for a<=
br>
&gt; checksum change. If the distro version changes due to the date<br>
&gt; changing, and the base-files includes the distro version in the issue<=
br>
&gt; file, then we&#39;d *want* base-files to rebuild to ensure the issue f=
ile<br>
&gt; is correct, otherwise it&#39;d be inaccurate, no?<br>
&gt;<br>
</div>I&#39;m torn on this. Package feed creators probably don&#39;t want a=
 package<br>
feed where the package changes daily but I can see this from both sides,<br=
>
I have often wondered why my build was rebuilding base-files...</blockquote=
></div><br>Perhaps we should either not use DATE/TIME in the distro version=
 at all, or have a variable which is the current date, and a variable which=
 locks to the date of the creation of the TMPDIR but doesn&#39;t change aft=
er that, or something, as a more persistent build environment identifier to=
 use for such cases. *shrug*<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e01494268f517bf04f59a43e2--
