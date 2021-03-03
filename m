Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web12.1342.1614800858515652213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 11:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i3lgANEy;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 7so2249530vke.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 11:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LcwVsGAAEzwDACCxO/s9czQTWV1xIOvIji0wnqWhK7Q=;
        b=i3lgANEyaw1L2rotzkEAW4SWuwFebWDDLrf/kguXoWU0LZcGFbu+8X/YRhHyKZ92cL
         c0sWULbo0IkxlkOlhE+XIziUju4GNvJx3Vz1WiB/F+Ia88GkA2KXmHWje/hUozvMO5VN
         Gs2SS1Ml5OpCXRDRpyM3i3NCf8j+LfwUnR16SDYa5NmxO+Iuam8v8LHaRWMgjGwu6oQ8
         MMkFRLmP+VCIe5oIpZd9dp1TniXQzAaCMJOfXmupN7S7ysVn5Kkexj2L9ZwdzQkTUGUk
         rxXaYEBtV9biPwgzVUcVJAua3s92IIlIG0vr8JdRNObOXDbfS7yJd7N29fKHVCHqo+sz
         CmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LcwVsGAAEzwDACCxO/s9czQTWV1xIOvIji0wnqWhK7Q=;
        b=KMbTqZZmOZX+v3Kv+w3gMNkO30bXLG1Ja1cyflEDktjpUmPDbJvdQdwb2Vtw3nz5Dy
         g/cTHYoNr6bMtJwDKYLQ7ak1WWULDYqAaxLuNvtJcAxyuyasOjGVWcMlovQWdGy5VZFp
         Xey9Zf7uoY2oerXuYQXI5M6s44eToCvBJNIhGU0Ma7Dt7zzDKjuOWm/ZXjImneHt4v7q
         vqpn/nXNFFMTkq3IPZoB+/XqMHdVVVdiCNf4iL7IUmspknhzzw6UyynMv83k9dGODYSZ
         VLUCgPaHsBA09DOTJcNKQP13hGL8l9dmxJbgrvSD9xN90e0GY7+jInAXXKOtH8SpHllo
         Uklg==
X-Gm-Message-State: AOAM531y3/bvADCki7PJazO7RzUAg2sT6lVWTzjJApGOkU9nb+a39q2h
	zwzXs+ffoOYirmjC0uKugXY9ZaRijGap2/EVq4M=
X-Google-Smtp-Source: ABdhPJz/b/seX9nnTsWGs9cNIfoPq0CCOhaDo9oqbQLPq25EojDKADNgcUK9jA3+uFNQP+appDugy+fn4VzNYXuCaPc=
X-Received: by 2002:a1f:dc86:: with SMTP id t128mr684464vkg.7.1614800857499;
 Wed, 03 Mar 2021 11:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20210303180904.25592-1-Diego.SantaCruz@spinetix.com>
In-Reply-To: <20210303180904.25592-1-Diego.SantaCruz@spinetix.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 3 Mar 2021 20:47:26 +0100
Message-ID: <CANNYZj88EADoofnNvxMtE6QmdLZ4CS7pe5a9PMvqNPf9icG8pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: split build and extra functionality into separate packages
To: Diego Santa Cruz <diego.santacruz@spinetix.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007e8c6f05bca71f51"

--0000000000007e8c6f05bca71f51
Content-Type: text/plain; charset="UTF-8"

Thanks, a nice benefit to this is also eliminating bash (a gpl3 dependency)
out of the main package. We (mbition.io) might use that in our production
images!

Alex

On Wed, 3 Mar 2021 at 19:17, Diego Santa Cruz via lists.openembedded.org
<diego.santacruz=spinetix.com@lists.openembedded.org> wrote:

> Having all the rpm build related tools in the main package requires
> adding runtime dependencies on perl and python3-core, so adding
> rpm to a target image can pull quite many unneeded packages to satisfy
> the dependencies.
>
> This splits all the build related tools into rpm-build and moves the
> bash, perl and python3-core runtime dependencies to that package.
>
> Also, the rpmsign tool is split into rpm-sign and rpm2archive (only
> built if archive is in PACKAGECONFIG) into rpm-archive. These are
> separate packages since they are not really related to building, so
> do not belong in rpm-build, but are not necessarily wanted in
> target images when rpm is included.
>
> Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.16.1.2.bb | 39 ++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> index 9195d66dd1..d369c706a2 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
> @@ -145,15 +145,46 @@ FILES_${PN}_append_class-nativesdk = "
> ${SDKPATHNATIVE}/environment-setup.d/rpm.
>
>  FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
>                      "
> +PACKAGE_BEFORE_PN += "${PN}-build ${PN}-sign ${PN}-archive"
> +
> +RRECOMMENDS_${PN} += "rpm-build rpm-sign rpm-archive"
> +
> +FILES_${PN}-build = "\
> +    ${bindir}/rpmbuild \
> +    ${bindir}/gendiff \
> +    ${bindir}/rpmspec \
> +    ${libdir}/librpmbuild.so.* \
> +    ${libdir}/rpm/brp-* \
> +    ${libdir}/rpm/check-* \
> +    ${libdir}/rpm/debugedit \
> +    ${libdir}/rpm/sepdebugcrcfix \
> +    ${libdir}/rpm/find-debuginfo.sh \
> +    ${libdir}/rpm/find-lang.sh \
> +    ${libdir}/rpm/*provides* \
> +    ${libdir}/rpm/*requires* \
> +    ${libdir}/rpm/*deps* \
> +    ${libdir}/rpm/*.prov \
> +    ${libdir}/rpm/*.req \
> +    ${libdir}/rpm/config.* \
> +    ${libdir}/rpm/mkinstalldirs \
> +    ${libdir}/rpm/macros.p* \
> +    ${libdir}/rpm/fileattrs/* \
> +"
> +
> +FILES_${PN}-sign = "\
> +    ${bindir}/rpmsign \
> +    ${libdir}/librpmsign.so.* \
> +"
> +
> +FILES_${PN}-archive = "\
> +    ${bindir}/rpm2archive \
> +"
>
>  PACKAGES += "python3-rpm"
>  PROVIDES += "python3-rpm"
>  FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
>
> -# rpm 5.x was packaging the rpm build tools separately
> -RPROVIDES_${PN} += "rpm-build"
> -
> -RDEPENDS_${PN} = "bash perl python3-core"
> +RDEPENDS_${PN}-build = "bash perl python3-core"
>
>  PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
>
> --
> 2.18.4
>
>
> 
>
>

--0000000000007e8c6f05bca71f51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, a nice benefit to this is also eliminating ba=
sh (a gpl3 dependency) out of the main package. We (<a href=3D"http://mbiti=
on.io">mbition.io</a>) might use that in our production images!<br></div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Mar 2021 at 19:17, Diego Santa Cr=
uz via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;diego.santacruz=3D<a href=3D"mailto:spinetix.com@lists.openembedded.or=
g">spinetix.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Having all the rpm build related tool=
s in the main package requires<br>
adding runtime dependencies on perl and python3-core, so adding<br>
rpm to a target image can pull quite many unneeded packages to satisfy<br>
the dependencies.<br>
<br>
This splits all the build related tools into rpm-build and moves the<br>
bash, perl and python3-core runtime dependencies to that package.<br>
<br>
Also, the rpmsign tool is split into rpm-sign and rpm2archive (only<br>
built if archive is in PACKAGECONFIG) into rpm-archive. These are<br>
separate packages since they are not really related to building, so<br>
do not belong in rpm-build, but are not necessarily wanted in<br>
target images when rpm is included.<br>
<br>
Signed-off-by: Diego Santa Cruz &lt;<a href=3D"mailto:Diego.SantaCruz@spin=
etix.com" target=3D"_blank">Diego.SantaCruz@spinetix.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">rpm_4.16.1.2.bb</a> | 39 ++++++++++++++++++++=
---<br>
=C2=A01 file changed, 35 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.2.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm_4.16.1.2.bb</a> b/meta/recipes-dev=
tools/rpm/<a href=3D"http://rpm_4.16.1.2.bb" rel=3D"noreferrer" target=3D"_=
blank">rpm_4.16.1.2.bb</a><br>
index 9195d66dd1..d369c706a2 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">rpm_4.16.1.2.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.2.bb" rel=3D"=
noreferrer" target=3D"_blank">rpm_4.16.1.2.bb</a><br>
@@ -145,15 +145,46 @@ FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKP=
ATHNATIVE}/environment-setup.d/rpm.<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/rpm-plugins/*.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
+PACKAGE_BEFORE_PN +=3D &quot;${PN}-build ${PN}-sign ${PN}-archive&quot;<b=
r>
+<br>
+RRECOMMENDS_${PN} +=3D &quot;rpm-build rpm-sign rpm-archive&quot;<br>
+<br>
+FILES_${PN}-build =3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/rpmbuild \<br>
+=C2=A0 =C2=A0 ${bindir}/gendiff \<br>
+=C2=A0 =C2=A0 ${bindir}/rpmspec \<br>
+=C2=A0 =C2=A0 ${libdir}/librpmbuild.so.* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/brp-* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/check-* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/debugedit \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/sepdebugcrcfix \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/find-debuginfo.sh \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/find-lang.sh \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/*provides* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/*requires* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/*deps* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/*.prov \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/*.req \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/config.* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/mkinstalldirs \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/macros.p* \<br>
+=C2=A0 =C2=A0 ${libdir}/rpm/fileattrs/* \<br>
+&quot;<br>
+<br>
+FILES_${PN}-sign =3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/rpmsign \<br>
+=C2=A0 =C2=A0 ${libdir}/librpmsign.so.* \<br>
+&quot;<br>
+<br>
+FILES_${PN}-archive =3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/rpm2archive \<br>
+&quot;<br>
<br>
=C2=A0PACKAGES +=3D &quot;python3-rpm&quot;<br>
=C2=A0PROVIDES +=3D &quot;python3-rpm&quot;<br>
=C2=A0FILES_python3-rpm =3D &quot;${PYTHON_SITEPACKAGES_DIR}/rpm/*&quot;<b=
r>
<br>
-# rpm 5.x was packaging the rpm build tools separately<br>
-RPROVIDES_${PN} +=3D &quot;rpm-build&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot;bash perl python3-core&quot;<br>
+RDEPENDS_${PN}-build =3D &quot;bash perl python3-core&quot;<br>
<br>
=C2=A0PACKAGE_PREPROCESS_FUNCS +=3D &quot;rpm_package_preprocess&quot;<br>
<br>
-- <br>
2.18.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007e8c6f05bca71f51--
