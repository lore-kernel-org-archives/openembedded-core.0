Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 32C9B6E905
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 15:34:12 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id l4so2797905lbv.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2014 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eI6COnnJ+yaGtFsXDqIY1wBwSDnvqq3mI097RLkB7AI=;
	b=J5Mi1eXanSTa7ryseUkNMUgAGjuYGm9s3GtX8JNEiRjSKFLMBO6cLl80MgcsQsucsy
	j5whVS3PtSqFc2C2qK2oIM2MXxT1/h19o7PrVql0Dl68qu0korbykJdvp6B8N/CsOBNP
	0ZBiHWWEgM7cp7QWYYkruiroEJseHiN5XT0T5putjT/DS68qy7CwlJ24wda0qdTVfL1P
	a2A582aK62Fidga4idaCkG0HEQZYADIPA3WD0zeXkVHlhPEKGklyjj5GTicgL8mUFeix
	m4c51akbx/dLp/kMWqB0Bo+f1/kcbIzK4a4Mo5SWA2p1mKQ7VXMcQVhuCI7Ze3Oz1ieQ
	PRrw==
MIME-Version: 1.0
X-Received: by 10.112.14.1 with SMTP id l1mr6258685lbc.39.1391787252219; Fri,
	07 Feb 2014 07:34:12 -0800 (PST)
Sender: kergoth@gmail.com
Received: by 10.112.55.135 with HTTP; Fri, 7 Feb 2014 07:34:12 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B15D3EA@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B15D3EA@post.tritech.se>
Date: Fri, 7 Feb 2014 08:34:12 -0700
X-Google-Sender-Auth: RHbUzakqQyBdPvMo-AwAbpgvMcU
Message-ID: <CABcZANmYSBxirpEVNsX2zF6rpzv3LR0Xiay6uckaod+s0UHy+w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Premirrors and local VCS server
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
X-List-Received-Date: Fri, 07 Feb 2014 15:34:13 -0000
Content-Type: multipart/alternative; boundary=001a11c3733ec584a504f1d2b83a

--001a11c3733ec584a504f1d2b83a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 7, 2014, Mats K=C3=A4rrman
<Mats.Karrman@tritech.se<javascript:_e(%7B%7D,'cvml','Mats.Karrman@tritech.=
se');>>
wrote:

> MY_LOCAL_MIRROR =3D "ftp://10.64.2.58/files/"
> PREMIRRORS_prepend =3D "\
>     ftp://.*/.* ${MY_LOCAL_MIRROR} \n \
>     git://.*/.* ${MY_LOCAL_MIRROR} \n \
>     http://.*/.* ${MY_LOCAL_MIRROR} \n \
>     https://.*/.* ${MY_LOCAL_MIRROR} \n \
>     svn://.*/.* ${MY_LOCAL_MIRROR} \n \
> "
>
> BB_FETCH_PREMIRRORONLY =3D "1"
> -----------------------------
>
> This works as I want for all packages that I download from external serve=
rs
> but I also have some proprietary recipes that use the svn: fetcher to che=
ck
> out source code from a local (LAN) Subversion server.
> With BB_FETCH_PREMIRRORONLY enabled these recipes will fail since
> there is no tarball available in the premirror.
>
> What I want to accomplish with using BB_FETCH_PREMIRRORONLY is
> to make sure that my builds needs nothing from the internet but I still
> want
> to fetch from my LAN servers.
>

Seems reasonable.

I have tried inserting my local svn server with "svn://.*/.* http://myserve=
r
> "
> (http is the protocol used by svn here) in the premirror list but this
> doesn't
> work, the fetcher just looks for a tarball, not a subversion server
> checkout.
>

That isn't surprising, as the http:// fetcher is wget :)

I have also tried "svn://.*/.* svn://myserver" but this just goes mayhem,
> some recursion i guess; 9140 ERROR messages shown...
>

I'm not sure if this use case is supported, but if it is, this would be the
method to support it. I'd suggest opening a bug in the yocto bug tracking
system.
--=20
Christopher Larson
chris_larson at mentor dot com
kergoth at gmail dot com


--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3733ec584a504f1d2b83a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 7, 2014, Mats K=C3=A4rrman &lt;<a href=3D"javascript:_e=
(%7B%7D,&#39;cvml&#39;,&#39;Mats.Karrman@tritech.se&#39;);" target=3D"_blan=
k">Mats.Karrman@tritech.se</a>&gt; wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

MY_LOCAL_MIRROR =3D &quot;<a href=3D"ftp://10.64.2.58/files/" target=3D"_bl=
ank">ftp://10.64.2.58/files/</a>&quot;<br>
PREMIRRORS_prepend =3D &quot;\<br>
=C2=A0 =C2=A0 ftp://.*/.* ${MY_LOCAL_MIRROR} \n \<br>
=C2=A0 =C2=A0 git://.*/.* ${MY_LOCAL_MIRROR} \n \<br>
=C2=A0 =C2=A0 http://.*/.* ${MY_LOCAL_MIRROR} \n \<br>
=C2=A0 =C2=A0 https://.*/.* ${MY_LOCAL_MIRROR} \n \<br>
=C2=A0 =C2=A0 svn://.*/.* ${MY_LOCAL_MIRROR} \n \<br>
&quot;<br>
<br>
BB_FETCH_PREMIRRORONLY =3D &quot;1&quot;<br>
-----------------------------<br>
<br>
This works as I want for all packages that I download from external servers=
<br>
but I also have some proprietary recipes that use the svn: fetcher to check=
<br>
out source code from a local (LAN) Subversion server.<br>
With BB_FETCH_PREMIRRORONLY enabled these recipes will fail since<br>
there is no tarball available in the premirror.<br>
<br>
What I want to accomplish with using BB_FETCH_PREMIRRORONLY is<br>
to make sure that my builds needs nothing from the internet but I still wan=
t<br>
to fetch from my LAN servers.<br></blockquote><div><br></div><div>Seems rea=
sonable.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I have tried inserting my local svn server with &quot;svn://.*/.* <a href=
=3D"http://myserver" target=3D"_blank">http://myserver</a>&quot;<br>
(http is the protocol used by svn here) in the premirror list but this does=
n&#39;t<br>
work, the fetcher just looks for a tarball, not a subversion server checkou=
t.<br></blockquote><div><br></div><div>That isn&#39;t surprising, as the ht=
tp:// fetcher is wget :)=C2=A0</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">


I have also tried &quot;svn://.*/.* svn://myserver&quot; but this just goes=
 mayhem,<br>
some recursion i guess; 9140 ERROR messages shown...<br></blockquote><div><=
br></div><div>I&#39;m not sure if this use case is supported, but if it is,=
 this would be the method to support it. I&#39;d suggest opening a bug in t=
he yocto bug tracking system.</div>

<div>--=C2=A0</div><div>Christopher Larson</div><div>chris_larson at mentor=
 dot com</div><div>kergoth at gmail dot com</div>
<br><br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder =
- BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwar=
e Engineer, Mentor Graphics<br>

--001a11c3733ec584a504f1d2b83a--
