Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7EEC982DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 16:27:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1073.1768580847228631653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 08:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1C2H37wT;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f57cd471so1264821f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 08:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768580845; cv=none;
        d=google.com; s=arc-20240605;
        b=SQ4PoJ26xv3SHLm4SkUPNd7Fj/J6hSqxSIhhGro5gWChWEcDTkEK3tOURaD0Zbdn+I
         mmMmrrFoY4fhv7jeKiA7bt46ESsifSAQ1GLbA5LiZqMabZFNXrf1m77YGj+tOvBQNiFN
         23PER3ezoFUYFhMbBT29h0NBpoXnxkeD+XTYAXUDZbyNXlOE564iJtWoPvi7OiJ5/Cfc
         OLxrpUyQmIEPcIOamS+D4bUrLNYtY3fOknSYdDvjRgAfMGzwCK3oXMiE5Eg1+2p62+IS
         lBgzgWO8FKklOPkuEPtMdo5Xb6z7BRaCG3b+2uCZ8JlS8CNBxJPsWP58+iLO015bXE5P
         0SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8S/zCVuEhKL6mtElmA8mwdT0ose32RAHO/nQj8umJE=;
        fh=WjLnM6n48EVH+CkiCV48u9UnDGq4zdWdnAETdgpawX0=;
        b=ZqO6gd/zQ3i3Ql8D5eWPB7rnjSBb8PIwU3sWktwFUGR8bLBfDztyAFujOrAt/1K56K
         8M3zrUtv+66mWlNH24RSdmm4TzohoNUQ1hNoaA7gGJHZKv/csIb4KT7Itmg3sD8lNMYT
         TDqeeFzaWNPxolYkS5PC9++rwiDENLh5FfeERvc80jp5qCADjt8fCwJQA103lvuE3EIP
         mtGHTtMDbyiWvfGiLKCRcHXZhER2Me4J8Vytxqpzia59RoNEWEMt4MoBe6IQ/KocSSIC
         7U7PJETHA655ibrgWP7sXMkHdq/f+jlg/BWEidND3mL19TfCQauCmaFCnJPqOexalhOm
         r7iw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768580845; x=1769185645; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k8S/zCVuEhKL6mtElmA8mwdT0ose32RAHO/nQj8umJE=;
        b=1C2H37wT+GMZaZaVVq+rZmHv+MBFmGa3aQnsYlrQb9Bgns4kpjUH07YvoTyG/gQMT5
         BPiX6KfjAiB9Vsq/aDsbOCuM9tK7HZ0aTLfxNoAR+lY0n7QnKeTIPDFaTIUk+Jtl2cqj
         0q6PbEPi5Tgv+0eCMmCoyv9PGm6hQCRUXqckc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580845; x=1769185645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8S/zCVuEhKL6mtElmA8mwdT0ose32RAHO/nQj8umJE=;
        b=QbUPFLOqr5ZDDHw4PL2LrcS8Zum/va2mkRODr+yT1y52QKuNlyNKcL8W22QisRUZgx
         +XjmKYkdF6TWG6OfWI4a5Tdnz0aVa9bUeiQwdCXkq7XdZlEgLEjL8RhW+EThLNvUdOck
         A72IWB/b5IU2kFapWdp4L2xH764hFaKKFQQPB15WmQVOGClaDInUHxTMxpAYxZ/kzlVZ
         JtHCPOSpNg88vWO5XL3fgfLNGxOicvyuCDnb3dDVSFT84tl0aLdrMkofuxPM9nKS0u3n
         B2ol8Yi7rV5wQR5wuWFQdFMqpix6684JvurdOiscdemo2U0VmPgVfrMivBVWX7SXdtO+
         5PwQ==
X-Gm-Message-State: AOJu0YwuUX0U8tgR0iNWF1jZAMODgqZdSyc6cUPi8PClKBVgHWB4+IxZ
	tgi7BWZPxOsqP0vLrq3O8kq93Gly/R6eQi+pPTouhXRd4uPW9QMcQPaN7lWMY9E2Tq4qvRr+nYD
	VzZn6eTStVd0PVGVsS9djKWBcgYO8pwHcBTpphRiPWg==
X-Gm-Gg: AY/fxX7fcafSTYT+HP/4y8s70Aj69Xiq7+Zh+gOOV7Yie3SNgvw8t9eFik+Z5r/bcmC
	ayInMiSQTC+iPdUHTsPrJKg3whcTF3obwZGbNORh+Qx1PlFFsoMtSE7/MihJh/vWpTb1YRDwxnv
	sjIiGEyLRdzBkLNVA+GLNav1+Ob2bYA5/BQE8iwMvFIbf3Eb6YCa4taY5r7TyTFfYw/UmvaFiOa
	yyJMwDivRrjRSAMPsyauQ40PvvvoCY8Boq6xeBV1XOu9WfCAis7eGBwM7UOhFGXknNHscz3lYmB
	Bz63hzgJgKUkoHjUYfSQbid93aIH
X-Received: by 2002:a05:6000:4021:b0:432:5c43:64 with SMTP id
 ffacd0b85a97d-4356a051b07mr4262987f8f.41.1768580845487; Fri, 16 Jan 2026
 08:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20260107232019.2649430-1-JPEWhacker@gmail.com> <20260108153033.2837942-1-JPEWhacker@gmail.com>
In-Reply-To: <20260108153033.2837942-1-JPEWhacker@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 16 Jan 2026 17:26:58 +0100
X-Gm-Features: AZwV_QjO8VNaH5H5Q-XpSukC9o0rOgmteaje_JMbFRdby_3eO-nizvB5LlfId0s
Message-ID: <CAMSfU+6YbN3Ym5TPnyqWFu2hU8vVLmwOkxo1UKTT7J_3DqUkng@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] spdx: Add yocto PURLs
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, stefano.tondo.ext@siemens.com
Content-Type: multipart/alternative; boundary="0000000000000d6a74064883d1af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 16:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229550

--0000000000000d6a74064883d1af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 8 janv. 2026 =C3=A0 16:30, Joshua Watt via lists.openembedded.org
<JPEWhacker=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Adds code to add PURLs to packages based on the PURL specification for
> Yocto packages [1].
>
> The SPDX_PACKAGE_URL variable is renamed SPDX_PACKAGE_URLS to make it
> clear that it can now be a list of PURLs. SPDX_PACKAGE_URL is retained,
> but marked as deprecated.
>

Hello Joshua,

Does it make sense to backport this to the stable branches that
have create-spdx-3.0.bbclass ? or at least scarthgap?
My reasoning is that the same rationale that led to create-spdx-3.0.bbclass
backported in scarthgap would also apply to PURLs.

(I've checked, the patch does apply with a simple merge)

What do you think?

[1]:
> https://github.com/package-url/purl-spec/blob/main/types-doc/yocto-defini=
tion.md
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 11 ++++++++-
>  meta/lib/oe/__init__.py              |  2 +-
>  meta/lib/oe/purl.py                  | 34 ++++++++++++++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 21 ++++++++++++-----
>  4 files changed, 60 insertions(+), 8 deletions(-)
>  create mode 100644 meta/lib/oe/purl.py
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index 96c0b9722b..d4575d61c4 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -131,7 +131,16 @@ SPDX_PACKAGE_VERSION[doc] =3D "The version of a
> package, software_packageVersion \
>  SPDX_PACKAGE_URL ??=3D ""
>  SPDX_PACKAGE_URL[doc] =3D "Provides a place for the SPDX data creator to
> record \
>  the package URL string (in accordance with the Package URL specification=
)
> for \
> -a software Package."
> +a software Package. DEPRECATED - use SPDX_PACKAGE_URLS instead"
> +
> +SPDX_PACKAGE_URLS ?=3D "${SPDX_PACKAGE_URL} ${@oe.purl.get_base_purl(d)}=
"
> +SPDX_PACKAGE_URLS[doc] =3D "A space separated list of Package URLs (purl=
s)
> for \
> +    the software Package. The first item in this list will be listed as
> the \
> +    packageUrl property of the packages, and all purls (including the
> first \
> +    one) will be listed as external references. The default value is an
> auto \
> +    generated pkg:yocto purl based on the recipe name, version, and laye=
r
> name. \
> +    Override this variable to replace the default, otherwise append or
> prepend \
> +    to add additional purls."
>
>  IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>  SDK_CLASSES +=3D "create-spdx-sdk-3.0"
> diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> index 9e4134c483..13d887a4aa 100644
> --- a/meta/lib/oe/__init__.py
> +++ b/meta/lib/oe/__init__.py
> @@ -12,4 +12,4 @@ __path__ =3D extend_path(__path__, __name__)
>  BBIMPORTS =3D ["qa", "data", "path", "utils", "types", "package",
> "packagedata", \
>               "packagegroup", "sstatesig", "lsb", "cachedpath", "license"=
,
> "qemu", \
>               "reproducible", "rust", "buildcfg", "go", "spdx30_tasks",
> "spdx_common", \
> -             "cve_check", "tune", "classextend"]
> +             "cve_check", "tune", "classextend", "purl"]
> diff --git a/meta/lib/oe/purl.py b/meta/lib/oe/purl.py
> new file mode 100644
> index 0000000000..2f92a23596
> --- /dev/null
> +++ b/meta/lib/oe/purl.py
> @@ -0,0 +1,34 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import urllib.parse
> +
> +PREFIX =3D "pkg:yocto"
> +
> +
> +def quote(s):
> +    """
> +    Returns the percent encoded version of the string, suitable for
> including
> +    in a PURL field
> +    """
> +    return urllib.parse.quote(s, safe=3D"")
> +
> +
> +def get_base_purl(d):
> +    """
> +    Returns the base PURL for the current recipe (that is, the PURL
> without any
> +    additional qualifiers)
> +    """
> +    layername =3D d.getVar("FILE_LAYERNAME")
> +    bpn =3D d.getVar("BPN")
> +    pv =3D d.getVar("PV")
> +
> +    name =3D f"{quote(bpn.lower())}@{quote(pv)}"
> +
> +    if layername:
> +        return f"{PREFIX}/{quote(layername.lower())}/{name}"
> +
> +    return f"{PREFIX}/{name}"
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index f731a709e3..01e7dcbbc6 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -639,12 +639,21 @@ def create_spdx(d):
>              set_var_field("SUMMARY", spdx_package, "summary",
> package=3Dpackage)
>              set_var_field("DESCRIPTION", spdx_package, "description",
> package=3Dpackage)
>
> -            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or
> d.getVar("SPDX_PACKAGE_URL"):
> -                set_var_field(
> -                    "SPDX_PACKAGE_URL",
> -                    spdx_package,
> -                    "software_packageUrl",
> -                    package=3Dpackage
> +            purls =3D (
> +                d.getVar("SPDX_PACKAGE_URLS:%s" % package)
> +                or d.getVar("SPDX_PACKAGE_URLS")
> +                or ""
> +            ).split()
> +
> +            if purls:
> +                spdx_package.software_packageUrl =3D purls[0]
> +
> +            for p in sorted(set(purls)):
> +                spdx_package.externalIdentifier.append(
> +                    oe.spdx30.ExternalIdentifier(
> +
> externalIdentifierType=3Doe.spdx30.ExternalIdentifierType.packageUrl,
> +                        identifier=3Dp,
> +                    )
>                  )
>
>              pkg_objset.new_scoped_relationship(
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229084):
> https://lists.openembedded.org/g/openembedded-core/message/229084
> Mute This Topic: https://lists.openembedded.org/mt/117153845/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000d6a74064883d1af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 8 janv.=
 2026 =C3=A0=C2=A016:30, Joshua Watt via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a> &lt;JPEWhacker=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@=
lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Adds code to add PURLs to packages based=
 on the PURL specification for<br>
Yocto packages [1].<br>
<br>
The SPDX_PACKAGE_URL variable is renamed SPDX_PACKAGE_URLS to make it<br>
clear that it can now be a list of PURLs. SPDX_PACKAGE_URL is retained,<br>
but marked as deprecated.<br></blockquote><div><br></div><div><div>Hello Jo=
shua,</div><div><br></div><div>Does it make sense to backport this to the s=
table branches that have=C2=A0create-spdx-3.0.bbclass ? or at least scarthg=
ap?</div><div>My reasoning=C2=A0is that the same rationale=C2=A0that led to=
=C2=A0create-spdx-3.0.bbclass backported in scarthgap would also apply to P=
URLs.</div><div><br></div><div>(I&#39;ve checked, the patch does apply with=
 a simple merge)</div><div><br></div><div>What do you think?</div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
[1]: <a href=3D"https://github.com/package-url/purl-spec/blob/main/types-do=
c/yocto-definition.md" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/package-url/purl-spec/blob/main/types-doc/yocto-definition.md</a><br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass | 11 ++++++++-<br>
=C2=A0meta/lib/oe/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0meta/lib/oe/purl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 34 ++++++++++++++++++++++++++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 ++=
++++++++++-----<br>
=C2=A04 files changed, 60 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 meta/lib/oe/purl.py<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index 96c0b9722b..d4575d61c4 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -131,7 +131,16 @@ SPDX_PACKAGE_VERSION[doc] =3D &quot;The version of a p=
ackage, software_packageVersion \<br>
=C2=A0SPDX_PACKAGE_URL ??=3D &quot;&quot;<br>
=C2=A0SPDX_PACKAGE_URL[doc] =3D &quot;Provides a place for the SPDX data cr=
eator to record \<br>
=C2=A0the package URL string (in accordance with the Package URL specificat=
ion) for \<br>
-a software Package.&quot;<br>
+a software Package. DEPRECATED - use SPDX_PACKAGE_URLS instead&quot;<br>
+<br>
+SPDX_PACKAGE_URLS ?=3D &quot;${SPDX_PACKAGE_URL} ${@oe.purl.get_base_purl(=
d)}&quot;<br>
+SPDX_PACKAGE_URLS[doc] =3D &quot;A space separated list of Package URLs (p=
urls) for \<br>
+=C2=A0 =C2=A0 the software Package. The first item in this list will be li=
sted as the \<br>
+=C2=A0 =C2=A0 packageUrl property of the packages, and all purls (includin=
g the first \<br>
+=C2=A0 =C2=A0 one) will be listed as external references. The default valu=
e is an auto \<br>
+=C2=A0 =C2=A0 generated pkg:yocto purl based on the recipe name, version, =
and layer name. \<br>
+=C2=A0 =C2=A0 Override this variable to replace the default, otherwise app=
end or prepend \<br>
+=C2=A0 =C2=A0 to add additional purls.&quot;<br>
<br>
=C2=A0IMAGE_CLASSES:append =3D &quot; create-spdx-image-3.0&quot;<br>
=C2=A0SDK_CLASSES +=3D &quot;create-spdx-sdk-3.0&quot;<br>
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py<br>
index 9e4134c483..13d887a4aa 100644<br>
--- a/meta/lib/oe/__init__.py<br>
+++ b/meta/lib/oe/__init__.py<br>
@@ -12,4 +12,4 @@ __path__ =3D extend_path(__path__, __name__)<br>
=C2=A0BBIMPORTS =3D [&quot;qa&quot;, &quot;data&quot;, &quot;path&quot;, &q=
uot;utils&quot;, &quot;types&quot;, &quot;package&quot;, &quot;packagedata&=
quot;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;packagegroup&quot;, =
&quot;sstatesig&quot;, &quot;lsb&quot;, &quot;cachedpath&quot;, &quot;licen=
se&quot;, &quot;qemu&quot;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;reproducible&quot;, =
&quot;rust&quot;, &quot;buildcfg&quot;, &quot;go&quot;, &quot;spdx30_tasks&=
quot;, &quot;spdx_common&quot;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cve_check&quot;, &qu=
ot;tune&quot;, &quot;classextend&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cve_check&quot;, &qu=
ot;tune&quot;, &quot;classextend&quot;, &quot;purl&quot;]<br>
diff --git a/meta/lib/oe/purl.py b/meta/lib/oe/purl.py<br>
new file mode 100644<br>
index 0000000000..2f92a23596<br>
--- /dev/null<br>
+++ b/meta/lib/oe/purl.py<br>
@@ -0,0 +1,34 @@<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: GPL-2.0-only<br>
+#<br>
+<br>
+import urllib.parse<br>
+<br>
+PREFIX =3D &quot;pkg:yocto&quot;<br>
+<br>
+<br>
+def quote(s):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Returns the percent encoded version of the string, suitable =
for including<br>
+=C2=A0 =C2=A0 in a PURL field<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 return urllib.parse.quote(s, safe=3D&quot;&quot;)<br>
+<br>
+<br>
+def get_base_purl(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Returns the base PURL for the current recipe (that is, the P=
URL without any<br>
+=C2=A0 =C2=A0 additional qualifiers)<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 layername =3D d.getVar(&quot;FILE_LAYERNAME&quot;)<br>
+=C2=A0 =C2=A0 bpn =3D d.getVar(&quot;BPN&quot;)<br>
+=C2=A0 =C2=A0 pv =3D d.getVar(&quot;PV&quot;)<br>
+<br>
+=C2=A0 =C2=A0 name =3D f&quot;{quote(bpn.lower())}@{quote(pv)}&quot;<br>
+<br>
+=C2=A0 =C2=A0 if layername:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;{PREFIX}/{quote(layername.lower(=
))}/{name}&quot;<br>
+<br>
+=C2=A0 =C2=A0 return f&quot;{PREFIX}/{name}&quot;<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index f731a709e3..01e7dcbbc6 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -639,12 +639,21 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_var_field(&quot;SUMMARY=
&quot;, spdx_package, &quot;summary&quot;, package=3Dpackage)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_var_field(&quot;DESCRIP=
TION&quot;, spdx_package, &quot;description&quot;, package=3Dpackage)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;SPDX_PACKAGE_U=
RL:%s&quot; % package) or d.getVar(&quot;SPDX_PACKAGE_URL&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_var_field(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;SPDX_PACKAGE_URL&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx=
_package,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;software_packageUrl&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pack=
age=3Dpackage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 purls =3D (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&quot;SPD=
X_PACKAGE_URLS:%s&quot; % package)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or d.getVar(&quot;=
SPDX_PACKAGE_URLS&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or &quot;&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ).split()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if purls:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_package.softw=
are_packageUrl =3D purls[0]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in sorted(set(purls)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_package.exter=
nalIdentifier.append(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.s=
pdx30.ExternalIdentifier(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 externalIdentifierType=3Doe.spdx30.ExternalIdentifierType.packag=
eUrl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 identifier=3Dp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_objset.new_scoped_relat=
ionship(<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229084): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229084" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229084</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117153845/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117153845/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--0000000000000d6a74064883d1af--

