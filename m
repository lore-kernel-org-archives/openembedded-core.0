Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8E48A6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 16:47:16 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id 5so59507224igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=sdEh6EubGuoGusCtluS65wioQWOJkGOnDCweX0y17aQ=;
	b=b9GHwW4FLYRY8nl9tELqcrkHkxTDSxdQpGTqgv1mDeCSP/EP1n0U9VzZmZT+hn8gwt
	Tx+LAMQqkFLx8Qk4p7pbKphI/e2BiW0Cdp06BO2q4QyVTXXYSkvJBw8RpAOMBvVCn0UF
	F85thAAjjYClQJCY6DaOHkssf9aIrV7Dq92NPhtYRs28yhqnKjn5LYZDBAox8+ce/eGo
	dzul+PMltA/4FAzKUH4FqhkUgLgbM4yKcwLDb7jwAbo+EOlyaOZfYNHMwVLd+FzTabO7
	IhipTE52nVmdrEJtLaZvXCzQXNmGa+DaBBchFuj0LGucqGcCZPYw2zxXhSTVxOxfwB1d
	rGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=sdEh6EubGuoGusCtluS65wioQWOJkGOnDCweX0y17aQ=;
	b=JvhIA7AMC2SJXjX0C4jPjX8L4SCm/edw8dcNOd2zf8v0aPGgQyhnM3Y6s+99ptvZge
	ZAUk3l+Ag8yQRkMoGFyKC1gmOP+8laV3TbBp2NdtqZlpqxrAaOv5lISZbI22sXrx/keg
	1VK1iQOJRIhMnfduMa6VjfETVna0FWdbHub+pomVx9BF7vI8HL/EfqtZYfU2+glywtRO
	XNQgddDKBQcFKBAQHU7+631IWm4aaP5izximNtLdr8z3n5ZzCzD4PSLA5nRExw/gCK4S
	MXbYtHErL4Z8R6eBuSGD6hufU/HEFR6JvTQ7cYLSAesDgj1k2D0cuCddG3kdo23nS2WX
	YLWg==
X-Gm-Message-State: AG10YORcn5Ocavl/mJ5hfq90gjpQ+hkx8TRllNuvu24PqY2MeooqYwunQggQdpZVcdSwLI/hwvzmRnuUKuiNYQ==
X-Received: by 10.50.79.130 with SMTP id j2mr13023620igx.25.1455554836934;
	Mon, 15 Feb 2016 08:47:16 -0800 (PST)
MIME-Version: 1.0
References: <1455551116.16142.420.camel@linuxfoundation.org>
In-Reply-To: <1455551116.16142.420.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 15 Feb 2016 16:47:07 +0000
Message-ID: <CABcZANmkyA_RYbjtHRirU1iByBJ44srcdLR360Neke+vGAjukA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ed_0.5: Handle --disable-static option
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
X-List-Received-Date: Mon, 15 Feb 2016 16:47:16 -0000
Content-Type: multipart/alternative; boundary=089e0112d07401b537052bd1c545

--089e0112d07401b537052bd1c545
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 8:45 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Also clean up use of immediate expansion as there are cleaner mechanisms
> now.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-extended/ed/ed_0.5.bb
> b/meta/recipes-extended/ed/ed_0.5.bb
> index 143e636..e2df13f 100644
> --- a/meta/recipes-extended/ed/ed_0.5.bb
> +++ b/meta/recipes-extended/ed/ed_0.5.bb
> @@ -15,7 +15,6 @@ inherit autotools texinfo
>
>  EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}'
> 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
>
> -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS',
> True).replace('--disable-dependency-tracking', ' ')}"
> -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS',
> True).replace('--disable-silent-rules', ' ')}"
> -
> -
> +CONFIGUREOPTS_remove = "--disable-dependency-tracking"
> +CONFIGUREOPTS_remove = "--disable-silent-rules"
> +EXTRA_OECONF_remove = "--disable-static"
>

This will be impossible to undo in a bbappend..

--089e0112d07401b537052bd1c545
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Feb 15, 2016 at 8:45 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Also clean up use of immediate expan=
sion as there are cleaner mechanisms now.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
<br>
diff --git a/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">ed_0.5.bb</a> b/meta/recipes-extended/ed/<a hr=
ef=3D"http://ed_0.5.bb" rel=3D"noreferrer" target=3D"_blank">ed_0.5.bb</a><=
br>
index 143e636..e2df13f 100644<br>
--- a/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb" rel=3D"noreferr=
er" target=3D"_blank">ed_0.5.bb</a><br>
+++ b/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb" rel=3D"noreferr=
er" target=3D"_blank">ed_0.5.bb</a><br>
@@ -15,7 +15,6 @@ inherit autotools texinfo<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;&#39;CC=3D${CC}&#39; &#39;CXX=3D${CXX}&#39; &#=
39;CFLAGS=3D${CFLAGS}&#39; &#39;CXXFLAGS=3D${CXXFLAGS}&#39; &#39;CPPFLAGS=
=3D${CPPFLAGS}&#39; &#39;LDFLAGS=3D${LDFLAGS}&#39;&quot;<br>
<br>
-CONFIGUREOPTS :=3D &quot;${@d.getVar(&#39;CONFIGUREOPTS&#39;, True).replac=
e(&#39;--disable-dependency-tracking&#39;, &#39; &#39;)}&quot;<br>
-CONFIGUREOPTS :=3D &quot;${@d.getVar(&#39;CONFIGUREOPTS&#39;, True).replac=
e(&#39;--disable-silent-rules&#39;, &#39; &#39;)}&quot;<br>
-<br>
-<br>
+CONFIGUREOPTS_remove =3D &quot;--disable-dependency-tracking&quot;<br>
+CONFIGUREOPTS_remove =3D &quot;--disable-silent-rules&quot;<br>
+EXTRA_OECONF_remove =3D &quot;--disable-static&quot;<br></blockquote><div>=
<br></div><div>This will be impossible to undo in a bbappend..=C2=A0</div><=
/div></div>

--089e0112d07401b537052bd1c545--
