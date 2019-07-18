Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A38127EE98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:57:22 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so26766250qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XcvCddIN+EtseBRhPk+NLsRGZ2XXV/Xk2QyJoCF+Mk8=;
	b=dVivoreRdHs8xryjKXopJzNQFCJCo/ugCzr17iTyHQ6p8gtetn7bBkN6X6g4xVqCLS
	UZtn1vOGA1UxWNOmpLiT3ob7DtbbA3lgDqXVCjI7g3I30m95nMl8OZce9TjkXp0Elqrf
	H2UstRFK0p3rbLrHzc7ah/yKlvZOSx2b0k0bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XcvCddIN+EtseBRhPk+NLsRGZ2XXV/Xk2QyJoCF+Mk8=;
	b=oV2ol8K22+ma+Qm5sTbAy5wHTvisU+nnSbocxiSB7UNOcihGGxdXtOzAXPN6rufmWG
	0JPyv/ScNGmoWV2Z5UjC2hqQcq/SWrUdifOxe1uvI7wXW7C9fqHbYY6dIGYWozBRxJru
	LkWUPa6qoALLNLssujc0LVXyS355vvmPKTLNypp76P67Klh9ZHQTcyMUwae3ZYPQc55U
	Bc8QE005/1DoOesI+RKldIyEuBgc3AL2BiM5UYAfCsijUMoVlOlKqdKZqb+Pd47xA1jR
	7fo8GOMbn0ARHA9532q61cR1M+1vC/u6q8s9zUlCE4u263Ojsl4HjnEX6q56Ffih/8py
	BfeQ==
X-Gm-Message-State: APjAAAXH+H46Vys8+SjBeDwrk/2wuLC/KwXg9ojaNGY/wlUliX/iBKp0
	lSg1LDO3hiJwLtZYVDcKKi8IBHsRRc4Kiodjbt7uhJESmM4=
X-Google-Smtp-Source: APXvYqywPiV98+ES4fbH52PGJaCdzi4qfvmYen6Sub7EOMCEKjmFxQXh0n1fC+XOhiyBIzh3URLpF5oKqqWneNCYqPY=
X-Received: by 2002:ac8:6619:: with SMTP id c25mr12452042qtp.221.1563451043176;
	Thu, 18 Jul 2019 04:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
In-Reply-To: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Date: Thu, 18 Jul 2019 13:57:12 +0200
Message-ID: <CAPVBjxFRyEvgBoNN818RD0Lg9D1GjdBidxrit-PQ4cqVwxJswQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Jo=C3=ABl_Esponde?= <joel.esponde@easymile.com>
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 11:57:22 -0000
Content-Type: multipart/alternative; boundary="0000000000000d7cdb058df3505e"

--0000000000000d7cdb058df3505e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you have any feedback on this patch ?

Thanks!

On Fri, 28 Jun 2019 at 12:14, Jean-Tiare Le Bigot <
jean-tiare.le-bigot@easymile.com> wrote:

> From: Jo=C3=ABl Esponde <joel.esponde@easymile.com>
>
> populate_packages relies on ``mkdir`` to both create a directory and set
> its permissions. However, ``mkdir`` honors the ``umask`` value.
> Therefore, some bits may be lost in the operation. In our case, the
> setgid bit on the directories were lost.
>
> This commit fixes this by having a distinct call to create the directory
> and to set the permissions.
>
> Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
> ---
>  meta/classes/package.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 20d72bba79..cd223a121e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1216,7 +1216,8 @@ python populate_packages () {
>                  src =3D os.path.join(src, p)
>                  dest =3D os.path.join(dest, p)
>                  fstat =3D cpath.stat(src)
> -                os.mkdir(dest, fstat.st_mode)
> +                os.mkdir(dest)
> +                os.chmod(dest, fstat.st_mode)
>                  os.chown(dest, fstat.st_uid, fstat.st_gid)
>                  if p not in seen:
>                      seen.append(p)
> --
> 2.19.1
>
>

--=20
Jean-Tiare Le Bigot

--0000000000000d7cdb058df3505e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Do you have any feedback on this patch ?</div><div><b=
r></div><div>Thanks!<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 28 Jun 2019 at 12:14, Jean-Tiare Le B=
igot &lt;<a href=3D"mailto:jean-tiare.le-bigot@easymile.com">jean-tiare.le-=
bigot@easymile.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Jo=C3=ABl Esponde &lt;<a href=3D"mailto:joel.espond=
e@easymile.com" target=3D"_blank">joel.esponde@easymile.com</a>&gt;<br>
<br>
populate_packages relies on ``mkdir`` to both create a directory and set<br=
>
its permissions. However, ``mkdir`` honors the ``umask`` value.<br>
Therefore, some bits may be lost in the operation. In our case, the<br>
setgid bit on the directories were lost.<br>
<br>
This commit fixes this by having a distinct call to create the directory<br=
>
and to set the permissions.<br>
<br>
Signed-off-by: Jean-Tiare Le Bigot &lt;<a href=3D"mailto:jean-tiare.le-bigo=
t@easymile.com" target=3D"_blank">jean-tiare.le-bigot@easymile.com</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/package.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 20d72bba79..cd223a121e 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -1216,7 +1216,8 @@ python populate_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D os.pa=
th.join(src, p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D os.p=
ath.join(dest, p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fstat =3D cpa=
th.stat(src)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(dest, fst=
at.st_mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(dest)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(dest, fst=
at.st_mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chown(dest=
, fstat.st_uid, fstat.st_gid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p not in s=
een:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0seen.append(p)<br>
-- <br>
2.19.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Jean-Tiare Le Bigot<br></div></div>

--0000000000000d7cdb058df3505e--
