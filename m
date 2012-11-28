Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TdqJb-0006z1-IW
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 23:41:13 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so7784747lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 14:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=lSRHkwqHQF7WSu5pbCTMiuKsi7akKE1OkVzAoSOuSmU=;
	b=hHsxNgcunAT4Nk7ooMm1MQy7mSTlsv+nCaUeDxN4Ato3PRejUUZrKhaA4fDDEpQoxm
	NQGZRPGfhGIVTGgD4qjXQWiE8tPbuZmO/BC1UMC3a4xEDT6QoqzlnC9dAvPSsK7yH5FM
	kXwdZDIdjFSPjv61K/uB4aUvIU1iGX7ZUkDPjZA68S/ITKZF1W+p74eluEyNFxCLl4sQ
	mJXjhxBAnBnvrjGAZTB4Ko1y0NC7kVf6RmdFS1uHmTLWoolwwYVrCdqexn+9BjybN72c
	yKi5ZIKXchtQn5lUSBti/YnKJSKhKUNX5STxpNTAvZdVKlXSc4FM3VD4jMuTEJ9rBwEF
	0tdw==
Received: by 10.152.104.44 with SMTP id gb12mr19502442lab.11.1354141616587;
	Wed, 28 Nov 2012 14:26:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.42.162 with HTTP; Wed, 28 Nov 2012 14:26:36 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1211280631130.31857@oneiric>
References: <alpine.DEB.2.02.1211280631130.31857@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Nov 2012 15:26:36 -0700
X-Google-Sender-Auth: 9UP6oCbGbH7ymlao5SeeXdcrjio
Message-ID: <CABcZAN=m3EwpqUi8D_hmBzqHwsmVg6W+EUXm6Q3_geFgtsJyTA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: some simple questions/observations about package groups
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
X-List-Received-Date: Wed, 28 Nov 2012 22:41:13 -0000
Content-Type: multipart/alternative; boundary=f46d04088ef508421804cf95aaea

--f46d04088ef508421804cf95aaea
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 28, 2012 at 4:45 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   perusing package groups, and a few simple questions and probably a
> couple things i can submit patches for.
>
>   first, is IMAGE_FEATURES *exclusively* for selecting package groups
> and not individual packages?  since core-image.bbclass reads:
>

IMAGE_INSTALL is for packages. IMAGE_FEATURES is for image features, of
which metadata defined package groups (PACKAGE_GROUP_*) are some.


> # By default we install packagegroup-core-boot and packagegroup-base
> packages -
>
> for that comment to read "packages" is a little ambiguous, yes?
>

Not really, no. 'packagegroup-core-boot' is a binary package emitted by the
packagegroup-core-boot recipe. They are packages.

  that same comment seems inaccurate as well, since it refers to
> "packagegroup-base" when, below, it's actually:
>
>
> CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \     <-- see?
>
> so that's just a quick doc fix.
>
>   again, back at the top, we read:
>
> # IMAGE_FEATURES control content of the core reference images
>
> but it's not just the *core* reference images, is it?  in fact, the
> list of available IMAGE_FEATURES in that file doesn't include
> "splash", which is inherited from image.bbclass.  should that not be
> in the list?  that also means that PACKAGE_GROUP_splash is available
> to non-core images.
>

By core images in this context I expect it means any image that inherits
core-image.

   finally, meta/conf/local.conf.sample also allegedly lists the
> possibilities for EXTRA_IMAGE_FEATURES, but that list is noticeably
> incomplete.  why not just refer the reader to core-image.bbclass,
> rather than try to keep a current list in both places?
>

I'd imagine it's hard enough getting people to read local.conf.sample,
without also expecting them to read other files. It's no different than any
other case of documentation (in comment form, in this case) not matching
the content.

p.s. as with other things i've put on my wish list, it would be great
> if a variation of bitbake could list the available package groups.
>

Depending on whether you want the metadata package groups or the packages:

bitbake -e <some core-image inheriting recipe> | grep PACKAGE_GROUP_
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--f46d04088ef508421804cf95aaea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 2=
8, 2012 at 4:45 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":39k">=C2=A0 perusing package gro=
ups, and a few simple questions and probably a<br>
couple things i can submit patches for.<br>
<br>
=C2=A0 first, is IMAGE_FEATURES *exclusively* for selecting package groups<=
br>
and not individual packages? =C2=A0since core-image.bbclass reads:<br></div=
></blockquote><div><br></div><div>IMAGE_INSTALL is for packages. IMAGE_FEAT=
URES is for image features, of which metadata defined package groups (PACKA=
GE_GROUP_*) are some.</div>

<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39k">
# By default we install packagegroup-core-boot and packagegroup-base packag=
es -<br>
<br>
for that comment to read &quot;packages&quot; is a little ambiguous, yes?<b=
r></div></blockquote><div><br></div><div>Not really, no. &#39;packagegroup-=
core-boot&#39; is a binary package emitted by the packagegroup-core-boot re=
cipe. They are packages.</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39k">
=C2=A0 that same comment seems inaccurate as well, since it refers to<br>
&quot;packagegroup-base&quot; when, below, it&#39;s actually:<br>
<br>
<br>
CORE_IMAGE_BASE_INSTALL =3D &#39;\<br>
=C2=A0 =C2=A0 packagegroup-core-boot \<br>
=C2=A0 =C2=A0 packagegroup-base-extended \ =C2=A0 =C2=A0 &lt;-- see?<br>
<br>
so that&#39;s just a quick doc fix.<br>
<br>
=C2=A0 again, back at the top, we read:<br>
<br>
# IMAGE_FEATURES control content of the core reference images<br>
<br>
but it&#39;s not just the *core* reference images, is it? =C2=A0in fact, th=
e<br>
list of available IMAGE_FEATURES in that file doesn&#39;t include<br>
&quot;splash&quot;, which is inherited from image.bbclass. =C2=A0should tha=
t not be<br>
in the list? =C2=A0that also means that PACKAGE_GROUP_splash is available<b=
r>
to non-core images.<br></div></blockquote><div><br></div><div>By core image=
s in this context I expect it means any image that inherits core-image.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">

<div id=3D":39k">
=C2=A0 finally, meta/conf/local.conf.sample also allegedly lists the<br>
possibilities for EXTRA_IMAGE_FEATURES, but that list is noticeably<br>
incomplete. =C2=A0why not just refer the reader to core-image.bbclass,<br>
rather than try to keep a current list in both places?<br></div></blockquot=
e><div><br></div><div>I&#39;d imagine it&#39;s hard enough getting people t=
o read local.conf.sample, without also expecting them to read other files. =
It&#39;s no different than any other case of documentation (in comment form=
, in this case) not matching the content.</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39k">
p.s. as with other things i&#39;ve put on my wish list, it would be great<b=
r>
if a variation of bitbake could list the available package groups.</div></b=
lockquote><div><br></div><div>Depending on whether you want the metadata pa=
ckage groups or the packages:=C2=A0</div></div><br>bitbake -e &lt;some core=
-image inheriting recipe&gt; | grep PACKAGE_GROUP_<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics<br>
</div>

--f46d04088ef508421804cf95aaea--
