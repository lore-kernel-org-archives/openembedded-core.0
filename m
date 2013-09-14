Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 70AE461017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 04:24:19 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id e14so4034850iej.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=v7yFv3ekIJZh5eLvBWrhsUUXIhx5x9flFf2V37dF138=;
	b=Ghsr9cWQf1tQs3vwty9hZr7uJ65OCacDRzNfe5gsm6Yvq15C5I3WbIS8hMvrWwHyxY
	kuZX3FUbCpm802aU8UlWtCM1n8vaoq6TizZSefUhT6OgS7sqcsaNFlhKkuEHS8U7hmbY
	l9p80K6t8ABfOrwEJJOtcrQLhiutgCNKZflNyL6JY4s+oAfVSXOVwpIJkmfkvumDs7NB
	Dmwm40qloBroW2nPlk+eFqaen3qemCuehHbILNNfgdYw0p4Fsk/u3/HNIifN3j7mRyOo
	Qys0Y7yNlWIfkIZQlXCKMgZru1nKJwfjVbUtIb5OUms9C75JpPc0b7YQFEyXb7tlL0LI
	R6tA==
MIME-Version: 1.0
X-Received: by 10.50.61.179 with SMTP id q19mr2652171igr.33.1379132661255;
	Fri, 13 Sep 2013 21:24:21 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Fri, 13 Sep 2013 21:24:21 -0700 (PDT)
In-Reply-To: <1379071094.3484.245.camel@ted>
References: <1379071094.3484.245.camel@ted>
Date: Fri, 13 Sep 2013 21:24:21 -0700
Message-ID: <CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Sat, 14 Sep 2013 04:24:20 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109e5f596604e6505843

--047d7bdc109e5f596604e6505843
Content-Type: text/plain; charset=UTF-8

On Friday, September 13, 2013, Richard Purdie wrote:

> I'm getting concerned with the number of people forking this recipe
> and not understanding what they're doing. I'm therefore proposing
> adding in a suitable warning to people thinking of copying it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org<javascript:;>
> >
> ---
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 96fe2ff..79b7dc4 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -2,6 +2,28 @@ DESCRIPTION = "Sanitized set of kernel headers for the C
> library's use."
>  SECTION = "devel"
>  LICENSE = "GPLv2"
>
> +#########################################################################
> +####                        PLEASE READ
> +#########################################################################
> +#
> +# You're probably looking here thinking you need to create some new copy
> +# of linux-libc-headers since you have your own custom kernel. To put
> +# this simply, you DO NOT.
> +#
> +# Why? These headers are used to build the libc. If you customise the
> +# headers you are customising the libc and the libc becomes machine
> +# specific. Most people do not add custom libc extensions to the kernel
> +# and have a machine specific libc.
> +#
> +# But you have some kernel headers you need for some driver? That is fine
> +# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
> +# This will make the package using them machine specific but this is much
> +# better than having a maching specific C library. This does mean your
> +# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
> +# makes total sense.
> +#
> +# -- RP


There are cases where we have bsps with 2.6.3x kernels and libc compiled
against 3.10 assumes syscalls
Which the kernel will not provide. These kinds are genuine cases for
creating equivalent recipes
You should mention the valid case too in this notice and basically asses
the user is knowing what. He is doing

+
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
>  python __anonymous () {
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bdc109e5f596604e6505843
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, September 13, 2013, Richard Purdie  wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">I&#39;m getting concerned with the number of people fo=
rking this recipe<br>

and not understanding what they&#39;re doing. I&#39;m therefore proposing<b=
r>
adding in a suitable warning to people thinking of copying it.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"javascript:;" onclick=3D"_e(ev=
ent, &#39;cvml&#39;, &#39;richard.purdie@linuxfoundation.org&#39;)">richard=
.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc<br>
index 96fe2ff..79b7dc4 100644<br>
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc<br>
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc<br>
@@ -2,6 +2,28 @@ DESCRIPTION =3D &quot;Sanitized set of kernel headers for =
the C library&#39;s use.&quot;<br>
=C2=A0SECTION =3D &quot;devel&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
<br>
+#########################################################################<=
br>
+#### =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0PLEASE READ<br>
+#########################################################################<=
br>
+#<br>
+# You&#39;re probably looking here thinking you need to create some new co=
py<br>
+# of linux-libc-headers since you have your own custom kernel. To put<br>
+# this simply, you DO NOT.<br>
+#<br>
+# Why? These headers are used to build the libc. If you customise the<br>
+# headers you are customising the libc and the libc becomes machine<br>
+# specific. Most people do not add custom libc extensions to the kernel<br=
>
+# and have a machine specific libc.<br>
+#<br>
+# But you have some kernel headers you need for some driver? That is fine<=
br>
+# but get them from STAGING_KERNEL_DIR where the kernel installs itself.<b=
r>
+# This will make the package using them machine specific but this is much<=
br>
+# better than having a maching specific C library. This does mean your<br>
+# recipe needs a DEPENDS +=3D &quot;virtual/kernel&quot; but again, that i=
s fine and<br>
+# makes total sense.<br>
+#<br>
+# -- RP</blockquote><div><br></div><div>There are cases where we have bsps=
 with 2.6.3x kernels and libc compiled against 3.10 assumes syscalls<br></d=
iv><div>Which the kernel will not provide. These kinds are genuine cases fo=
r creating equivalent recipes</div>
<div>You should mention the valid case too in this notice and basically ass=
es the user is knowing what. He is doing</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

+<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd7810fab7487fb0aad327=
b76f1be7cd7&quot;<br>
<br>
=C2=A0python __anonymous () {<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--047d7bdc109e5f596604e6505843--
