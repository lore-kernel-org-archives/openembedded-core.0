Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDB761FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 09:31:32 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f12so3675729qad.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NYLihHrhvMgP6vRRT/kdbBzErv2iIY6rWx089OvbdfY=;
	b=RiWjh7ggctVx50suSh9/3T5oHlzx0ww6YbXTOsYF9mXBcbdqjDrWaXYf+k03RjqE0W
	SWSoK3kRDXOvUmEh3XopcK4h8vbCxZm+tk0f4rBzQ0bfAKFkrrMnElRxyefz3TWK+eOh
	BSG1F2Elvlaoo/qV4zHbLxCmbQ7GjeeDLatFjeV4VTUgC0QDXUPWsh/Ge7TvUaV52Whd
	ltusLDKJWgLcAj5JRDEGhm9QX4xMYt4Nt9Z+pDib81S9bNCjr93qyIMTeVWZHNOXiVJG
	fxUl5Wb9ahDYCzOWH3D1KnrvOHO2mI/v7QTHZglEC3PgrOw8WulsA+38cBHHbawRpETC
	tzpQ==
X-Received: by 10.140.51.37 with SMTP id t34mr11091543qga.50.1407403893249;
	Thu, 07 Aug 2014 02:31:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Thu, 7 Aug 2014 02:31:13 -0700 (PDT)
In-Reply-To: <1407403457-25490-1-git-send-email-sujith.h@gmail.com>
References: <1407403457-25490-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 7 Aug 2014 15:01:13 +0530
Message-ID: <CADyYWLmC56Qy5kd8yQdkC7cs=7_fBPtaNQW4_7skeOiJDT-Hsw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Thu, 07 Aug 2014 09:31:37 -0000
Content-Type: multipart/alternative; boundary=001a11351a5a1ce2b4050006c10c

--001a11351a5a1ce2b4050006c10c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul Eggleton,


On Thu, Aug 7, 2014 at 2:54 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> This is needed to deal with the situation where we're using ipk packaging=
,
> so
> opkg-utils must be built regardless of what update-alternatives provider =
we
> prefer. The downside to the current implementation is the need to adjust
> PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that
> way.
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 693c216..9364740 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -19,11 +19,17 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  PYTHONRDEPS =3D "python python-shell python-io python-math python-crypt
> python-logging python-fcntl python-subprocess python-pickle
> python-compression python-textutils python-stringold"
>  PYTHONRDEPS_class-native =3D ""
>
> -PACKAGECONFIG =3D "python"
> +PACKAGECONFIG =3D "python update-alternatives"
>  PACKAGECONFIG[python] =3D ",,,${PYTHONRDEPS}"
> +PACKAGECONFIG[update-alternatives] =3D ",,,"
> +
> +PROVIDES +=3D "${@'virtual/update-alternatives' if 'update-alternatives'=
 in
> PACKAGECONFIG.split() else ''}"
>
>  do_install() {
>         oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> +        if ${@'true' if 'update-alternatives' not in
> PACKAGECONFIG.split() else 'false'}; then
> +            rm -f "${D}${bindir}/update-alternatives"
> +        fi
>  }
>
>  PACKAGES =3D+ "update-alternatives-opkg"
> --
> 1.8.4
>
>
In this change I am adding it to PROVIDES only if its required. Hope this
change looks ok?

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11351a5a1ce2b4050006c10c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul Eggleton,<span class=3D""><span class=3D""><span><=
/span><span></span></span></span><div><div class=3D"gmail_extra"><br><br><d=
iv class=3D"gmail_quote">On Thu, Aug 7, 2014 at 2:54 PM, Sujith H <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith=
.h@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Sujith H &lt;<a hre=
f=3D"mailto:Sujith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt=
;<br>


<br>
This is needed to deal with the situation where we&#39;re using ipk packagi=
ng, so<br>
opkg-utils must be built regardless of what update-alternatives provider we=
<br>
prefer. The downside to the current implementation is the need to adjust<br=
>
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that w=
ay.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">=
kergoth@gmail.com</a>&gt;<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a> | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a> b/meta/recipes-devtools/opk=
g-utils/<a href=3D"http://opkg-utils_git.bb" target=3D"_blank">opkg-utils_g=
it.bb</a><br>


index 693c216..9364740 100644<br>
--- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -19,11 +19,17 @@ TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
=C2=A0PYTHONRDEPS =3D &quot;python python-shell python-io python-math pytho=
n-crypt python-logging python-fcntl python-subprocess python-pickle python-=
compression python-textutils python-stringold&quot;<br>
=C2=A0PYTHONRDEPS_class-native =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG =3D &quot;python&quot;<br>
+PACKAGECONFIG =3D &quot;python update-alternatives&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDEPS}&quot;<br>
+PACKAGECONFIG[update-alternatives] =3D &quot;,,,&quot;<br>
+<br>
+PROVIDES +=3D &quot;${@&#39;virtual/update-alternatives&#39; if &#39;updat=
e-alternatives&#39; in PACKAGECONFIG.split() else &#39;&#39;}&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} in=
stall<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@&#39;true&#39; if &#39;update-alternativ=
es&#39; not in PACKAGECONFIG.split() else &#39;false&#39;}; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${D}${bindir}/update=
-alternatives&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;update-alternatives-opkg&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.8.4<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">In th=
is change I am adding it to PROVIDES only if its required. Hope this change=
 looks ok?<br><br></div><div class=3D"gmail_extra">Thanks,<br>Sujith H<br c=
lear=3D"all">

</div><div class=3D"gmail_extra"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=
=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=
=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE =
project<br><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=
=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div></div>

--001a11351a5a1ce2b4050006c10c--
