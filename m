Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC206ABB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:07:58 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so40997902wgf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 23:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6XtgliR0vRzgTf0ByYH8uSpimTMBdD9fHAc/oqNtUM0=;
	b=iZsJ7q0NVDJIlEvYtLbYOqsszBHrE8AcgoaDpSdD9f2o4NOBf8fVmgxDAxIBzp91df
	iDhwM4r7TdWqwj4REAqqh9eN4o9N37H3AZO/jq2zPvsLdnLtF7IDnJZX8A+Qec8gfxqS
	7+7pqTP5MSuWCecbiLBliwtmfLkjS8so3VRinWUBbXtwDh84o6o00ndn9wRnjxxBuUfs
	M8DPBBmNBMNBX9MaQ6fpw0qjpW5V4+/s7a/mDCNY4+FBYGpN0y0apUlNu+f6WeZcacBK
	XRIjEA7NA93sAKls2OlgK7hoe4HcxsGgo3eY8TJgBwi1kQ73cLOiZH5PqXp3qYN86pWn
	OqXg==
MIME-Version: 1.0
X-Received: by 10.194.90.100 with SMTP id bv4mr59794676wjb.143.1432102079704; 
	Tue, 19 May 2015 23:07:59 -0700 (PDT)
Received: by 10.28.167.73 with HTTP; Tue, 19 May 2015 23:07:59 -0700 (PDT)
In-Reply-To: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
References: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
Date: Wed, 20 May 2015 08:07:59 +0200
Message-ID: <CA+chaQcUBprFzXEvVAu67wmoa_K20wvyM9BZn0xZ1p6zbSxkbw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Wed, 20 May 2015 06:08:01 -0000
Content-Type: multipart/alternative; boundary=047d7bfceb06be320205167d3ff9

--047d7bfceb06be320205167d3ff9
Content-Type: text/plain; charset=UTF-8

Please use the same variable with weak assignment like opkg recipes (so
that it can be easily changed from distro config).

This also breaks all upgrade paths, is it acceptable? In oe-classic days
I've created postinst script which were migrating existing
update-alternatives in the rootfs when update-alternatives-cworth was
upgraded with different path.

On Wed, May 20, 2015 at 3:31 AM, Li Zhou <li.zhou@windriver.com> wrote:

> When update-alternatives is moved from opkg to opkg-utils, a line in
> the file is changed
> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>  in oe-core build by configuring --with-opkglibdir.
> opkg-utils can't get the var value in opkg, so here define opkglibdir to
> set the path.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 2800a5d..fc12d91 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -22,8 +22,11 @@ PYTHONRDEPS_class-native = ""
>  PACKAGECONFIG = "python"
>  PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
>
> +opkglibdir = "/var/lib"
> +
>  do_install() {
>         oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> +       sed -i s:/usr/lib/opkg:${opkglibdir}/opkg:
> ${D}${bindir}/update-alternatives
>  }
>
>  PACKAGES =+ "update-alternatives-opkg"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bfceb06be320205167d3ff9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please use the same variable with weak assignment like opk=
g recipes (so that it can be easily changed from distro config).<div><br></=
div><div>This also breaks all upgrade paths, is it acceptable? In oe-classi=
c days I&#39;ve created postinst script which were migrating existing updat=
e-alternatives in the rootfs when update-alternatives-cworth was upgraded w=
ith different path.</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Wed, May 20, 2015 at 3:31 AM, Li Zhou <span dir=3D"ltr">&l=
t;<a href=3D"mailto:li.zhou@windriver.com" target=3D"_blank">li.zhou@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">When update=
-alternatives is moved from opkg to opkg-utils, a line in<br>
the file is changed<br>
from &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives&quot;&=
gt;<br>
to &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives&quot;&gt;.<b=
r>
But opkglibdir doesn&#39;t equal to &quot;/usr/lib&quot; here, but equal to=
 &quot;/var/lib&quot;<br>
=C2=A0in oe-core build by configuring --with-opkglibdir.<br>
opkg-utils can&#39;t get the var value in opkg, so here define opkglibdir t=
o<br>
set the path.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a> |=C2=A0 =C2=A0 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a> b/meta/recipes-devtools/opk=
g-utils/<a href=3D"http://opkg-utils_git.bb" target=3D"_blank">opkg-utils_g=
it.bb</a><br>
index 2800a5d..fc12d91 100644<br>
--- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -22,8 +22,11 @@ PYTHONRDEPS_class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG =3D &quot;python&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDEPS}&quot;<br>
<br>
+opkglibdir =3D &quot;/var/lib&quot;<br>
+<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} in=
stall<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s:/usr/lib/opkg:${opkglibdir}/opkg: ${D}=
${bindir}/update-alternatives<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;update-alternatives-opkg&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7bfceb06be320205167d3ff9--
