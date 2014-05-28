Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (unknown [209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id BCD446FBCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:47:01 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so7680960lab.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qwG6DO9jK6QFu06M7H0D98CHiI51yNNCUBgFuE1rRfA=;
	b=fRiG2y6YKUkcgH5a/Qyr1osxEoyA7bFRcVk95Su2M6QLZctQwrLxepH8cf/jFWrTPv
	2PNnqhOuK1EpcLCY3Fgm02cG4Bb3G3mxiq6VSJ7QSfIiaLosF6dsOlsQKvFjW0iqwn0A
	88SynJZHzQG3Khw/9/SC5C8katMhJHVknjOIplqilpNxAy7wOT9Af21RpAdFTUSDoUtW
	r9CSfXV7ffS4rC+1kjrao4r4shMx24osxa0p4JhzZ/4hcX/d8OdUzdgoLAfwiYJGlfvG
	3yAQRckavh/TYecvCYpbd6Bs1nBpoxrT9gMuAnpI2qtfQzIJ13o6j6R4T5cFxJeDsvUc
	y1Pg==
X-Received: by 10.152.37.72 with SMTP id w8mr1977316laj.71.1401310022213; Wed,
	28 May 2014 13:47:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 28 May 2014 13:46:42 -0700 (PDT)
In-Reply-To: <CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
References: <53843793.3030309@topic.nl>
	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 28 May 2014 13:46:42 -0700
X-Google-Sender-Auth: aSWIclPixw7fvcophJT4agI33FE
Message-ID: <CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Wed, 28 May 2014 20:47:06 -0000
Content-Type: multipart/alternative; boundary=089e0160c1561827db04fa7beabe

--089e0160c1561827db04fa7beabe
Content-Type: text/plain; charset=UTF-8

On Wed, May 28, 2014 at 1:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, May 26, 2014 at 11:58 PM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
> > I have a deja-vu feeling about this question.
> >
> > I have this recipe:
> >
> >
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image-miami.bb
> >
> > Which includes this one:
> >
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-image.inc
> >
> > I have a build server that exports its sstate-cache directory through
> HTTP,
> > and a local host that attempts to use that sstate-cache. This works fine,
> > except for the recipe above. Building this recipe takes about 1 hour, so
> i
> > really really really want to share that state at any cost. As you can
> see,
> > I've done a big shotgun blast of "vardepdsexclude" to get the recipe to
> be
> > as common as possible. Still any host wants to build its own version.
> >
> > How can I diagnose the REASON that my machine thinks it isn't building
> the
> > exact same thing as the build server?
>
> see https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
> towards the end it talks about verifying sstate sigs


If the sstate is local at least, you can use bitbake -S printdiff <target>.
There's also bitbake-whatchanged, but the bitbake one is superior.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160c1561827db04fa7beabe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 28, 2014 at 1:42 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Mon, May 26, 2014 at 11:5=
8 PM, Mike Looijmans<br>
&lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a>&=
gt; wrote:<br>
&gt; I have a deja-vu feeling about this question.<br>
&gt;<br>
&gt; I have this recipe:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/topic-embedded-products/meta-topic/blob/=
master/recipes-bsp/fpga/fpga-image-miami.bb" target=3D"_blank">https://gith=
ub.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga=
-image-miami.bb</a><br>


&gt;<br>
&gt; Which includes this one:<br>
&gt; <a href=3D"https://github.com/topic-embedded-products/meta-topic/blob/=
master/recipes-bsp/fpga/fpga-image.inc" target=3D"_blank">https://github.co=
m/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-imag=
e.inc</a><br>


&gt;<br>
&gt; I have a build server that exports its sstate-cache directory through =
HTTP,<br>
&gt; and a local host that attempts to use that sstate-cache. This works fi=
ne,<br>
&gt; except for the recipe above. Building this recipe takes about 1 hour, =
so i<br>
&gt; really really really want to share that state at any cost. As you can =
see,<br>
&gt; I&#39;ve done a big shotgun blast of &quot;vardepdsexclude&quot; to ge=
t the recipe to be<br>
&gt; as common as possible. Still any host wants to build its own version.<=
br>
&gt;<br>
&gt; How can I diagnose the REASON that my machine thinks it isn&#39;t buil=
ding the<br>
&gt; exact same thing as the build server?<br>
<br>
</div>see <a href=3D"https://wiki.yoctoproject.org/wiki/Enable_sstate_cache=
" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Enable_sstate_cache<=
/a><br>
towards the end it talks about verifying sstate sigs</blockquote></div><br>=
</div><div class=3D"gmail_extra">If the sstate is local at least, you can u=
se bitbake -S printdiff &lt;target&gt;. There&#39;s also bitbake-whatchange=
d, but the bitbake one is superior.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0160c1561827db04fa7beabe--
