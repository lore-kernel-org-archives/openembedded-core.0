Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA5E6A413
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:08:34 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id o6so10229737oag.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jiivjA0bfp0DYwhtyQFDM9NwU3/7xG9plo8WsZHnSck=;
	b=AK7aUF4nOV5YIfM1sAbwFRXdzvCuTR34XspgR7KARxUUS7D+/+Ix6laz0qgroet5K8
	OS3CpPpVk3JhBZwjEZym2Ws9Ada+54K2iDjRRYzlN486hNk6R9nt28U/9JyXqrOMDJUA
	ezabUrj9GLLYWqjpJsBmVgE42Iw1NvM+c0jRe22IxPq+UEmg1E09p7U3xmxmtGbc5pOY
	SLDd3YK0mx7tb2vs6XCFhZc0+gNgS8zXk3Hh0ZGC+TEmdpCvVJSv0VU0kNB72V7DdotB
	u+GGqL/qie+u7xtr+VFBRlDD5cy5JaCpQh9dQ+nk7FS5yi+DB6gdemUiyeM6jjsgm10S
	Bu+w==
MIME-Version: 1.0
X-Received: by 10.60.94.70 with SMTP id da6mr162112oeb.63.1369757315307; Tue,
	28 May 2013 09:08:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 28 May 2013 09:08:35 -0700 (PDT)
In-Reply-To: <1369755098.8846.16.camel@phil-desktop.brightsign>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
	<1369755098.8846.16.camel@phil-desktop.brightsign>
Date: Tue, 28 May 2013 13:08:35 -0300
X-Google-Sender-Auth: ZOiGvzzdOJhex3ry_iM6NEtXHbY
Message-ID: <CAP9ODKpzC7hM54OQ3dBQ5fBs5D5Fo=vawo1xWWA_wLKY8cPv-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 16:08:35 -0000
Content-Type: multipart/alternative; boundary=089e012287c03520dd04ddc97a88

--089e012287c03520dd04ddc97a88
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 12:31 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-05-28 at 12:18 -0300, Otavio Salvador wrote:
>
> > +        need_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES',
> > True)
> > +        if need_distro_features:
> > +            need_distro_features = need_distro_features.split()
> > +            distro_features = (d.getVar('DISTRO_FEATURES', True) or
> > "").split()
> > +            for f in need_distro_features:
> > +                if f in distro_features:
> > +                    break
> > +            else:
> > +                raise bb.parse.SkipPackage("missing required distro
> > feature %s (not in DISTRO_FEATURES)" % need_distro_features)
>
> This is still not quite right.  The error message says that the features
> it mentions are "not in DISTRO_FEATURES", but it appears to still be
> listing everything that's named in REQUIRED_DISTRO_FEATURES whether or
> not it is actually in DISTRO_FEATURES.
>
> Also you seem to be printing a Python list with %s, which will work but
> the results aren't especially pretty.
>
> Also also, on a stylistic point, the "for/if/break" construct is a bit
> ugly.  You could perhaps consider something like:
>
> need_distro_features = need_distro_features.split()
> distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
> missing_distro_features = filter(lambda x: x not in distro_features,
> need_distro_features)
> if missing_distro_features:
>   raise bb.parse.SkipPackage("missing required distro features: %s" % "
> ".join(missing_distro_features))
>

I dislike the 'required' my idea here was each item of the 'compat distro
features' would be as an OR. Like

COMPATIBLE_DISTRO_FEATURE = "x11 wayland"

So *any* of those would make recipe to be parsed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e012287c03520dd04ddc97a88
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 12:31 PM, Phil Blundell <span dir=3D"ltr">&=
lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 2013-05-28 at 12:1=
8 -0300, Otavio Salvador wrote:<br>
<br>
&gt; + =A0 =A0 =A0 =A0need_distro_features =3D d.getVar(&#39;REQUIRED_DISTR=
O_FEATURES&#39;,<br>
&gt; True)<br>
&gt; + =A0 =A0 =A0 =A0if need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0need_distro_features =3D need_distro_features=
.split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0distro_features =3D (d.getVar(&#39;DISTRO_FEA=
TURES&#39;, True) or<br>
&gt; &quot;&quot;).split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0for f in need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if f in distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0else:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage(&quot;miss=
ing required distro<br>
&gt; feature %s (not in DISTRO_FEATURES)&quot; % need_distro_features)<br>
<br>
</div>This is still not quite right. =A0The error message says that the fea=
tures<br>
it mentions are &quot;not in DISTRO_FEATURES&quot;, but it appears to still=
 be<br>
listing everything that&#39;s named in REQUIRED_DISTRO_FEATURES whether or<=
br>
not it is actually in DISTRO_FEATURES.<br>
<br>
Also you seem to be printing a Python list with %s, which will work but<br>
the results aren&#39;t especially pretty.<br>
<br>
Also also, on a stylistic point, the &quot;for/if/break&quot; construct is =
a bit<br>
ugly. =A0You could perhaps consider something like:<br>
<br>
need_distro_features =3D need_distro_features.split()<br>
<div class=3D"im">distro_features =3D (d.getVar(&#39;DISTRO_FEATURES&#39;, =
True) or &quot;&quot;).split()<br>
</div>missing_distro_features =3D filter(lambda x: x not in distro_features=
, need_distro_features)<br>
if missing_distro_features:<br>
=A0 raise bb.parse.SkipPackage(&quot;missing required distro features: %s&q=
uot; % &quot; &quot;.join(missing_distro_features))<br></blockquote><div><b=
r></div><div style>I dislike the &#39;required&#39; my idea here was each i=
tem of the &#39;compat distro features&#39; would be as an OR. Like</div>
<div style><br></div><div style>COMPATIBLE_DISTRO_FEATURE =3D &quot;x11 way=
land&quot;</div><div style><br></div><div style>So *any* of those would mak=
e recipe to be parsed.</div><div>=A0</div></div>-- <br>Otavio Salvador =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e012287c03520dd04ddc97a88--
