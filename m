Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89C5060283
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:00:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id t12so2240121vso.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 14:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WtLTx+/OGECqWNtBU0GSDbtVkRRIE6Q48MJ5Tt5UpDk=;
	b=nUPXSd7Cop9dc61k3PSPOOwLdpgjdfkHuU3pMS306pewCSMvv1wb9XN5TalC3bNWDi
	SK6pPy3nrnmODwDdNseaT/+k7D/bxtp0zu6M1B9DxUFVUstQagzu0+AUN0O0WDaFDCV9
	II0O9oq7TSDmIspGXZtnW2a9ZpA9ljQ4EeOfxYtHWEZgoyt01o9oyTgLgcs31C9cerka
	9ri9j8LL1eaEoADnZNEQbNZPxafkrjEVpAz315fD8JKf9DQ2FDiiNIuQXbshJzF5xkEy
	FX9IathgKiZII51VS0JttLfL6ZXvREoaeeT6vY/WXvD6jfl9+2I8E2aDwoW/dn2xRz7Q
	eydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WtLTx+/OGECqWNtBU0GSDbtVkRRIE6Q48MJ5Tt5UpDk=;
	b=Kkk/tyjyKGpPwshaDaU0ITvmMEQt6as374zNG3p7g6Ee6tHJY1newrmD6wkvzzSmtp
	rxM/RGNowsQ4mGnbV1IY5PQdz5k7xtyn1fmC9Q4g75o/Ll+kjGSnnTxuMi3gB/hyBHpA
	2nUfQpJ9xHqCoRNS9jp1Uwm48a9a2ZAjqjDgNOOPkDf/+VFgYBFrv32f/7fseAm6O6Cf
	scPAtPCUN28QBUUdvwDmJdj8cwsqVYWfbHeDYt2AOKzgyORL+xCTHog6RshtzegxoJvT
	6U9BFpwrsER+HY8KOv5XG5ZK/w2x+go6USY8fLxREHqw7KhmRF5fcjw0sLI/+pLvuDoW
	KoZQ==
X-Gm-Message-State: APjAAAWoBg+/vknGru9ZoYtDR0M3yL6YPKVhtcRdSKvJ6ZB3wVUfTVab
	zha8onePQmwLGNoQNG1dF9cQBd/Dn1JfIce3qWc=
X-Google-Smtp-Source: APXvYqxlR6CSAgt0EshR/YBGbGh+Ioj87WtO52BCBNdzK8/TLisP/cu+YxlbanZW502mSizTjgqdyu1GseK/7ecMyTw=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr13311285vsq.94.1581544839702; 
	Wed, 12 Feb 2020 14:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
In-Reply-To: <20200212191927.2708197-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2020 23:00:28 +0100
Message-ID: <CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 22:00:39 -0000
Content-Type: multipart/alternative; boundary="0000000000005ded18059e681a22"

--0000000000005ded18059e681a22
Content-Type: text/plain; charset="UTF-8"

I would still prefer to just split rpm packaging into binaries and
libraries, and avoid the need to blacklist and tweak recipes based on what
PACKAGE_CLASSES is set to altogether. That setting should not leak into
recipes, and should only matter from do_package onwards. Can you look into
the rpm recipe please?

Alex

On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:

> dnf does not work with opkg or dpkg/apt anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use PNBLACKLIST instead of anon python
>
>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> index f38167f1ad..220f1aabbd 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
> dnf-makecache.timer \
>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
>  "
>  SYSTEMD_AUTO_ENABLE ?= "disable"
> +
> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> index 882c435b32..49afa04812 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
>  EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
>
>  BBCLASSEXTEND = "native nativesdk"
> +PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005ded18059e681a22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would still prefer to just split rpm packaging into=
 binaries and libraries, and avoid the need to blacklist and tweak recipes =
based on what PACKAGE_CLASSES is set to altogether. That setting should not=
 leak into recipes, and should only matter from do_package onwards. Can you=
 look into the rpm recipe please?<br></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 12 Feb 2020 at 20:19, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">dnf does not work with opkg or dpkg/apt anyway<br=
>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Use PNBLACKLIST instead of anon python<br>
<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
+<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 1 +<br>
=C2=A02 files changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-devtools/=
dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">dn=
f_4.2.2.bb</a><br>
index f38167f1ad..220f1aabbd 100644<br>
--- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
+++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.service dnf=
-makecache.timer \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dnf-automatic-notifyonly.service dnf-automatic-notifyonly=
.timer \<br>
=C2=A0&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
+<br>
+PNBLACKLIST[dnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLASSES&#39;=
, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correctly without =
package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/meta/recipes=
-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libdnf_0.28.1.bb</a><br>
index 882c435b32..49afa04812 100644<br>
--- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
+++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D &quot; -DWITH_GIR=
=3DOFF&quot;<br>
=C2=A0EXTRA_OECMAKE_append_class-nativesdk =3D &quot; -DWITH_GIR=3DOFF&quot=
;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+PNBLACKLIST[libdnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLASSES&#=
39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correctly witho=
ut package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005ded18059e681a22--
