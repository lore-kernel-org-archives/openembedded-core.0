Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D04C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 21:22:58 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42028.1785187377455916038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 14:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=la7TqHPy;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66892c81725so3526524d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 14:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785187376; cv=none;
        d=google.com; s=arc-20260327;
        b=GY0DUQc6+cBbNWS5NjGSW/5dUl4PghvElkeTf1HNvr1tqkk/ly2TUD7xX7n+Ou1i0F
         khlpjQkuewpWqKQq0vRhDcVHPA1a2Py58CU3TkAKTLv56KAIsP3fFngfU4my6xR12S0V
         sJ0Cv5tdPWmyfwYAq+W4l/murquxzyP8ihh27AoVdqzvIVB+ssm0QIU+i/q7Z/CbX5H5
         +YBLko1CA/ET77zHCEb0GN+y9IxXGw6W+QbnjEN/vGPDhge8RYG4hsfgJKzPaof2KLse
         oFnWyreQv03dwPUzdW5HMTz9SZnG0Asbrzp64gWbh5BpeeR1/HG+RuLWECAsUe01KKKX
         qZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/cx/GRrakEKL4DiDgy0+KWHJp0ch3S3M+qTuxSJt18E=;
        fh=/tdF92YLg5vzp9CXyMjx/mIU5wMef+/rwIR3QYJ6qDw=;
        b=l18MoUxJlGYKfemxgO8z7Uzd04v7IDXYAVxtUX0FJ5GmJL5s+TKmJ+XpQEIDgefNyC
         agMt+oct/c78ySw1AwmIcNA1bvp36qwpknr3+NIX3jYQSGZcFViAvHLTQ5Khk17N4eW7
         p/TYow/e3HcZt5ehtrpjpyp5WOxdsuNsYJ5iyXwqOpVa2czGCaf8ZENg0P4YwpZJgrfd
         7zGXAiFkEq8tmP4hANK3IMDncpo/JzHdMcMQmaT9lZS325UnGBdGg4SwIcXOLjTsD+HS
         XApx8P2TG3LQQtld70kMJKmbkwRsbYBHPEAbj7pclzdDCREZbb6LO2QvXbYY+39QdIJo
         eXRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785187376; x=1785792176; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cx/GRrakEKL4DiDgy0+KWHJp0ch3S3M+qTuxSJt18E=;
        b=la7TqHPy2iIGQ/hQIWvHaQSsAvE0QAM3DPkpy5ti5HFMQ1/IeqjfE1fbmzKYguUuuv
         u1FEOhFJwLM6bFp1ZAXqHPVa4nTPRMn2rMPzpOzmarVlcC8EOqRIP+KLJWM/AfX38vlW
         AZpIJrdp2aEtSp0R/2YNOXcs12Hi87Qdax25wuNszkKji0ysAdFpBUCxu/IQIRiNqyy9
         VvfwKprJv2sYcEyOFmW1+ASBtNfR802zWq83x3VilQpgaXPWr4VMOZtaUexsjAdK6zSk
         1KzSzegUH0Yh3FX0iBlQURsiFL1LQIAP5b/lN1YrRWDghsycbEKxZbOPx5E/NGHOn00H
         75vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785187376; x=1785792176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cx/GRrakEKL4DiDgy0+KWHJp0ch3S3M+qTuxSJt18E=;
        b=i2u8PuWGyXvytte2ZfTXESbZwj4Cn/Vyepqzw1cy9DSpVI3AqANF9YyResJZcjp4lB
         jSDk5ELvHfGGz/QWp6KrMVDDHDN7TCd6ZgHagm0a8ml9xAquFqx/SaXteXGSGjgG07sY
         +KsCfvBym4oIFS1mxN4C12uFiDRZB66lUP0oxoH4XGQlQJjkMNI96Jn75OcNd1S70gym
         5E5J0ivU+wRKf6d8EklWzXkofa9KusBPTOEMxfzSGpAlqlqdTyg/Brm++wBPtYMqsM0b
         +zflRHBf9ote1pjgIqKI0WGnZCSVOvNJ4C0NZwMtNGtYK2uPfCA8exptB++u5hjDqmfU
         URaA==
X-Gm-Message-State: AOJu0YzgEny9Vu38pw1wYtC6e0kU+EEggAJDa7e+XvXisDjNo9Qbs8Y4
	fjOJN8WR9qVtetALB/RLP4Bd2pl6bgR8WTq2Rh9I0ea4ktRTj1m0FIkqna0YH9uiJOcgATSYkJj
	CTWrAoKA+vIcHJHCp/tn2vG2y6jTAw0MGng==
X-Gm-Gg: AR+sD13ig0g7xidWMSy1zH/RLImb1rJIYRgxCyLrTw+Y75YpM9VIk9ErsuXl9UzorvL
	uWK+NwO8tEVDNuqnSxOfF6RVqe3rVsne8T/3YWkuK6EMgJ1vZyCuYxS/CdA75WRGYo3vkBl6mCm
	+6STV8QtLsQltdFaw6vL+UWjWnt13xGuM9puVsPzoqmmP2rjV0RTOTKzK71QxfhVnIIUSRvNuya
	8qiKXKjR/Z/fBrHXh/fYlaCXLBl8UPSiTode1MGUIfrlmFZdGeVFVz9IQTkQpo7BVnbYaj96NZT
X-Received: by 2002:a53:e5ce:0:b0:667:debe:491d with SMTP id
 956f58d0204a3-668ffefa477mr292620d50.106.1785187376325; Mon, 27 Jul 2026
 14:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260718-fix_spdx_packages_dependson-v1-1-f950be4cd006@se.com>
In-Reply-To: <20260718-fix_spdx_packages_dependson-v1-1-f950be4cd006@se.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 27 Jul 2026 15:22:44 -0600
X-Gm-Features: AUfX_mwLGU40wEva1ML17fBytk62mD372qutnd2IWP_R1rmHJNS80dWPlNEpHyQ
Message-ID: <CAJdd5GY6ooL8FsgmrfMrxmnFGFFyo5sij9VxSKV5mz6C7TXeMA@mail.gmail.com>
Subject: Re: [PATCH] spdx30_tasks: fix missing SPDX runtime dependencies
To: pascal.eberhard@se.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c696306579e5323"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 21:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242106

--0000000000006c696306579e5323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 1:16=E2=80=AFAM Pascal Eberhard via B4 Relay <
devnull+pascal.eberhard.se.com@kernel.org> wrote:

> From: Pascal Eberhard <pascal.eberhard@se.com>
>
> The runtime dependsOn relationship entries between software_Package
> is missing from the generated SPDX files.
>
> Remove the subpkgdata lookup as the final pkg_name is already resolved
> by collect_package_providers().
>
> Rename variables to avoid shadowing the 'dep' variable and to make it
> explicit which package/pkg name is being used.
>

LGTM, Thanks,

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


>
> Signed-off-by: Pascal Eberhard <pascal.eberhard@se.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 79e18db11d..652fe269e2 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1141,9 +1141,13 @@ def create_spdx(d):
>
>  def create_package_spdx(d):
>      deploydir =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> +    pkgdatadir =3D Path(d.getVar('PKGDATA_DIR'))
>
>      direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spd=
x")
>
> +    # providers[package_name] =3D pkg_name, where:
> +    # - package_name is the name in the recipe in PACKAGES/RDEPENDS, and
> +    # - pkg_name is the final name given by the package manager.
>      providers =3D oe.spdx_common.collect_package_providers(d, direct_dep=
s)
>      pkg_arch =3D d.getVar("SSTATE_PKGARCH")
>
> @@ -1197,26 +1201,24 @@ def create_package_spdx(d):
>              if dep not in providers:
>                  continue
>
> -            dep, _ =3D providers[dep]
> +            dep_pkg_name, _ =3D providers[dep]
>
> -            if not oe.packagedata.packaged(dep, localdata):
> +            if not os.path.exists(pkgdatadir / "runtime-reverse" /
> dep_pkg_name):
> +                bb.debug(1, f"pkg_name {dep_pkg_name}, package {dep}
> missing for {package}")
>                  continue
>
> -            dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep, d)
> -            dep_pkg =3D dep_pkg_data["PKG"]
> -
> -            if dep in dep_package_cache:
> -                dep_spdx_package =3D dep_package_cache[dep]
> +            if dep_pkg_name in dep_package_cache:
> +                dep_spdx_package =3D dep_package_cache[dep_pkg_name]
>              else:
> -                bb.debug(1, "Searching for %s" % dep_pkg)
> +                bb.debug(1, "Searching for %s" % dep_pkg_name)
>                  dep_spdx_package, _ =3D oe.sbom30.find_root_obj_in_jsonl=
d(
>                      d,
>                      "packages-staging",
> -                    "package-" + dep_pkg,
> +                    "package-" + dep_pkg_name,
>                      oe.spdx30.software_Package,
>
>  software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.install,
>                  )
> -                dep_package_cache[dep] =3D dep_spdx_package
> +                dep_package_cache[dep_pkg_name] =3D dep_spdx_package
>
>              runtime_spdx_deps.add(dep_spdx_package)
>              seen_deps.add(dep)
>
> ---
> base-commit: 171af3b2915dd076c8d1b205ff75eac1ebd5a586
> change-id: 20260718-fix_spdx_packages_dependson-28d9bb78a55c
>
> Best regards,
> --
> Pascal Eberhard <pascal.eberhard@se.com>
>
>
>

--0000000000006c696306579e5323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 18,=
 2026 at 1:16=E2=80=AFAM Pascal Eberhard via B4 Relay &lt;<a href=3D"mailto=
:devnull%2Bpascal.eberhard.se.com@kernel.org">devnull+pascal.eberhard.se.co=
m@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Pascal Eberhard &lt;<a href=3D"mailto:pascal.eberhard@se.=
com" target=3D"_blank">pascal.eberhard@se.com</a>&gt;<br>
<br>
The runtime dependsOn relationship entries between software_Package<br>
is missing from the generated SPDX files.<br>
<br>
Remove the subpkgdata lookup as the final pkg_name is already resolved<br>
by collect_package_providers().<br>
<br>
Rename variables to avoid shadowing the &#39;dep&#39; variable and to make =
it<br>
explicit which package/pkg name is being used.<br></blockquote><div><br></d=
iv><div>LGTM, Thanks,</div><div><br></div><div>Reviewed-by: Joshua Watt &lt=
;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt;</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Pascal Eberhard &lt;<a href=3D"mailto:pascal.eberhard@se.com=
" target=3D"_blank">pascal.eberhard@se.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 22 ++++++++++++----------<br>
=C2=A01 file changed, 12 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 79e18db11d..652fe269e2 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -1141,9 +1141,13 @@ def create_spdx(d):<br>
<br>
=C2=A0def create_package_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0deploydir =3D Path(d.getVar(&quot;SPDXRUNTIMEDEPLOY&quo=
t;))<br>
+=C2=A0 =C2=A0 pkgdatadir =3D Path(d.getVar(&#39;PKGDATA_DIR&#39;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0direct_deps =3D oe.spdx_common.collect_direct_deps(d, &=
quot;do_create_spdx&quot;)<br>
<br>
+=C2=A0 =C2=A0 # providers[package_name] =3D pkg_name, where:<br>
+=C2=A0 =C2=A0 # - package_name is the name in the recipe in PACKAGES/RDEPE=
NDS, and<br>
+=C2=A0 =C2=A0 # - pkg_name is the final name given by the package manager.=
<br>
=C2=A0 =C2=A0 =C2=A0providers =3D oe.spdx_common.collect_package_providers(=
d, direct_deps)<br>
=C2=A0 =C2=A0 =C2=A0pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
<br>
@@ -1197,26 +1201,24 @@ def create_package_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep not in providers:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep, _ =3D providers[dep]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_pkg_name, _ =3D providers[de=
p]<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not oe.packagedata.packaged(d=
ep, localdata):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(pkgdatadir=
 / &quot;runtime-reverse&quot; / dep_pkg_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, f&quot=
;pkg_name {dep_pkg_name}, package {dep} missing for {package}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_pkg_data =3D oe.packagedata.=
read_subpkgdata_dict(dep, d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_pkg =3D dep_pkg_data[&quot;P=
KG&quot;]<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep in dep_package_cache:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_spdx_package =
=3D dep_package_cache[dep]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep_pkg_name in dep_package_c=
ache:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_spdx_package =
=3D dep_package_cache[dep_pkg_name]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;=
Searching for %s&quot; % dep_pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;=
Searching for %s&quot; % dep_pkg_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep_spdx_pack=
age, _ =3D oe.sbom30.find_root_obj_in_jsonld(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;packages-staging&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;package-&quot; + dep_pkg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;package-&quot; + dep_pkg_name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0oe.spdx30.software_Package,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.install,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_package_cache[=
dep] =3D dep_spdx_package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_package_cache[=
dep_pkg_name] =3D dep_spdx_package<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runtime_spdx_deps.add(dep_s=
pdx_package)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen_deps.add(dep)<br>
<br>
---<br>
base-commit: 171af3b2915dd076c8d1b205ff75eac1ebd5a586<br>
change-id: 20260718-fix_spdx_packages_dependson-28d9bb78a55c<br>
<br>
Best regards,<br>
-- <br>
Pascal Eberhard &lt;<a href=3D"mailto:pascal.eberhard@se.com" target=3D"_bl=
ank">pascal.eberhard@se.com</a>&gt;<br>
<br>
<br>
</blockquote></div></div>

--0000000000006c696306579e5323--

