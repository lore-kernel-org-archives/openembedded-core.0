Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.15088.1590160941058722705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TAqghtyy;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id b28so4202793vsa.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qx2A5AmR9xZoHVTpb3PfdQd40DFc962dLHrn8joCk0o=;
        b=TAqghtyybKCuQvAQs0QVH+Es+Xgc1sozTYV4zGBcAMrMM7W/WpE+waPkf8RNT1a3P4
         jYoBJX85jGauSh5yUGnGUHZ0GjXbw1RNV161IrcgAKXkkdXFru/HW9JGCBUlNn9nYhi0
         VHW/y/3Zm3aDlvYXHJ1PdXbDr1aOnn2bzJUEsZpwQHYN5iCpplwgT76s2YrNUSdKFmLy
         vdMxNXzwEz7TK9tDyvjgsmcYmW7kL1VifGS43OzGy3g6+YaifqIL79IySLeskQgrcJfr
         L0jD2KNc8160YbYikVUobNB3qk27b62hQJXmyPut112fkvtn1LW8DzK24NWn05c17OSq
         66nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qx2A5AmR9xZoHVTpb3PfdQd40DFc962dLHrn8joCk0o=;
        b=ZNxgUo0aVuxac0w+hOMkXGVyuz/HKlBL3ZCkTXHnDzaxDwETrMP8Qkd12ckH+/Kylo
         etMAGqJB10+V87BzP62Yi15n1okb+L+MerWKak/F4hC6iWneBF0u55R2NCQHeDhsPu6d
         QPcu1n3r7HQaDm24BcJ0OS/4xWoS+QG/827QFECqGvJJm/916rqEjBURTCukHncQN8fb
         0F7qbL8u9mdEMh3Q7U/dbTl7Ls6bTxdScJvmN7T4in+9Cd6nAQ9mfwO+NerbcwOIuwTA
         FFxDNo/Oy/vPNZcbT9TWq5glBuMkHylG6wBiP2BzJqHe9t3INX8NfHdGdpnI6RlpY/nC
         oj9g==
X-Gm-Message-State: AOAM531exGLkXdumFxZPsZq+sU2pRgg+DVcYz+L7BqY/UjGLYEjNti1C
	TL/lpXigy4qLeUv88kfJSk68S3uhMtMJ+adhTEo=
X-Google-Smtp-Source: ABdhPJwBDnWulCkNXo9Bzzzy1tMKGslu/nzvqOItuezy13inE85ctNSXwco/xurYF3ZPoEs+ncsXnrayZIhSGHJAZhk=
X-Received: by 2002:a67:df86:: with SMTP id x6mr11178542vsk.94.1590160940079;
 Fri, 22 May 2020 08:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
In-Reply-To: <20200522151335.7918-2-ptsneves@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 22 May 2020 17:22:08 +0200
Message-ID: <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Paulo Neve <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f820ed05a63e3154"

--000000000000f820ed05a63e3154
Content-Type: text/plain; charset="UTF-8"

Should there be a test for this functionality? Somewhere in oe-selftest
perhaps where various package manager features are tested?

Alex

On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:

> Up to now the user defined metadata was set recipe wide,
> meaning all the packages generated in a recipe where the
> variable was set would get the same metadata. That is not
> always ideal and is counter to the per package control that
> is usually available.
>
> Keep support for package agnostic metadata but also add option
> to add it to a specific option like:
> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/package.bbclass     | 4 ++--
>  meta/classes/package_deb.bbclass | 2 +-
>  meta/classes/package_ipk.bbclass | 2 +-
>  meta/classes/package_rpm.bbclass | 5 +++--
>  4 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 0b5cf47749..1678e0d794 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d,
> depversions=None):
>
>      return pkg
>
> -def get_package_additional_metadata (pkg_type, d):
> +def get_package_additional_metadata (pkg_type, pkg_name, d):
>      base_key = "PACKAGE_ADD_METADATA"
> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" %
> (base_key, pkg_name, pkg_type.upper()), base_key):
>          if d.getVar(key, False) is None:
>              continue
>          d.setVarFlag(key, "type", "list")
> diff --git a/meta/classes/package_deb.bbclass
> b/meta/classes/package_deb.bbclass
> index 790b26aef2..6ef9c8cb3a 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
>
>          # more fields
>
> -        custom_fields_chunk = get_package_additional_metadata("deb",
> localdata)
> +        custom_fields_chunk = get_package_additional_metadata("deb",
> pkgname, localdata)
>          if custom_fields_chunk:
>              ctrlfile.write(custom_fields_chunk)
>              ctrlfile.write("\n")
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index c008559e4a..f78cec7a70 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
>              else:
>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
>
> -        custom_fields_chunk = get_package_additional_metadata("ipk",
> localdata)
> +        custom_fields_chunk = get_package_additional_metadata("ipk",
> pkgname, localdata)
>          if custom_fields_chunk is not None:
>              ctrlfile.write(custom_fields_chunk)
>              ctrlfile.write("\n")
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 9145717f98..ab019192da 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -295,7 +295,6 @@ python write_specfile () {
>      srcmaintainer  = d.getVar('MAINTAINER')
>      srchomepage    = d.getVar('HOMEPAGE')
>      srcdescription = d.getVar('DESCRIPTION') or "."
> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
>
>      srcdepends     = d.getVar('DEPENDS')
>      srcrdepends    = []
> @@ -333,6 +332,8 @@ python write_specfile () {
>          pkgname = localdata.getVar('PKG_%s' % pkg)
>          if not pkgname:
>              pkgname = pkg
> +
> +        srccustomtagschunk = get_package_additional_metadata("rpm",
> pkgname, d)
>          localdata.setVar('PKG', pkgname)
>
>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":"
> + pkg)
> @@ -351,7 +352,7 @@ python write_specfile () {
>          splitlicense = (localdata.getVar('LICENSE') or "")
>          splitsection = (localdata.getVar('SECTION') or "")
>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
> -        splitcustomtagschunk = get_package_additional_metadata("rpm",
> localdata)
> +        splitcustomtagschunk = get_package_additional_metadata("rpm",
> pkgname, localdata)
>
>          translate_vers('RDEPENDS', localdata)
>          translate_vers('RRECOMMENDS', localdata)
> --
> 2.20.1
>
> 
>

--000000000000f820ed05a63e3154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Should there be a test for this functionality? Somewh=
ere in oe-selftest perhaps where various package manager features are teste=
d?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 22 May 2020 at 17:13, Pau=
lo Neve &lt;<a href=3D"mailto:ptsneves@gmail.com">ptsneves@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Up to n=
ow the user defined metadata was set recipe wide,<br>
meaning all the packages generated in a recipe where the<br>
variable was set would get the same metadata. That is not<br>
always ideal and is counter to the per package control that<br>
is usually available.<br>
<br>
Keep support for package agnostic metadata but also add option<br>
to add it to a specific option like:<br>
PACKAGE_ADD_METADATA_${PN}_IPK =3D &quot;mymeta: myvalue&quot;<br>
<br>
Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" targe=
t=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package.bbclass=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0meta/classes/package_deb.bbclass | 2 +-<br>
=C2=A0meta/classes/package_ipk.bbclass | 2 +-<br>
=C2=A0meta/classes/package_rpm.bbclass | 5 +++--<br>
=C2=A04 files changed, 7 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<b=
r>
index 0b5cf47749..1678e0d794 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, depversions=
=3DNone):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return pkg<br>
<br>
-def get_package_additional_metadata (pkg_type, d):<br>
+def get_package_additional_metadata (pkg_type, pkg_name, d):<br>
=C2=A0 =C2=A0 =C2=A0base_key =3D &quot;PACKAGE_ADD_METADATA&quot;<br>
-=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key, pkg_type.upper()=
), base_key):<br>
+=C2=A0 =C2=A0 for key in (&quot;%s_%s&quot; % (base_key, pkg_type.upper()=
), &quot;%s_%s_%s&quot; % (base_key, pkg_name, pkg_type.upper()), base_key)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(key, False) is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(key, &quot;type&quot;, &quo=
t;list&quot;)<br>
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.b=
bclass<br>
index 790b26aef2..6ef9c8cb3a 100644<br>
--- a/meta/classes/package_deb.bbclass<br>
+++ b/meta/classes/package_deb.bbclass<br>
@@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# more fields<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_additiona=
l_metadata(&quot;deb&quot;, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_additiona=
l_metadata(&quot;deb&quot;, pkgname, localdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if custom_fields_chunk:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrlfile.write(custom_fiel=
ds_chunk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrlfile.write(&quot;\n&qu=
ot;)<br>
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.b=
bclass<br>
index c008559e4a..f78cec7a70 100644<br>
--- a/meta/classes/package_ipk.bbclass<br>
+++ b/meta/classes/package_ipk.bbclass<br>
@@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrlfile.wri=
te(c % tuple(pullData(fs, localdata)))<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_additiona=
l_metadata(&quot;ipk&quot;, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 custom_fields_chunk =3D get_package_additiona=
l_metadata(&quot;ipk&quot;, pkgname, localdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if custom_fields_chunk is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrlfile.write(custom_fiel=
ds_chunk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrlfile.write(&quot;\n&qu=
ot;)<br>
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.b=
bclass<br>
index 9145717f98..ab019192da 100644<br>
--- a/meta/classes/package_rpm.bbclass<br>
+++ b/meta/classes/package_rpm.bbclass<br>
@@ -295,7 +295,6 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0srcmaintainer=C2=A0 =3D d.getVar(&#39;MAINTAINER&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0srchomepage=C2=A0 =C2=A0 =3D d.getVar(&#39;HOMEPAGE&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0srcdescription =3D d.getVar(&#39;DESCRIPTION&#39;) or =
&quot;.&quot;<br>
-=C2=A0 =C2=A0 srccustomtagschunk =3D get_package_additional_metadata(&quo=
t;rpm&quot;, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0srcdepends=C2=A0 =C2=A0 =C2=A0=3D d.getVar(&#39;DEPEND=
S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0srcrdepends=C2=A0 =C2=A0 =3D []<br>
@@ -333,6 +332,8 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgname =3D localdata.getVar(&#39;PKG_%s=
&#39; % pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not pkgname:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgname =3D pkg<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srccustomtagschunk =3D get_package_additional=
_metadata(&quot;rpm&quot;, pkgname, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;PKG&#39;, pkgname)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;OVERRIDES&#39;, d.=
getVar(&quot;OVERRIDES&quot;, False) + &quot;:&quot; + pkg)<br>
@@ -351,7 +352,7 @@ python write_specfile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitlicense =3D (localdata.getVar(&#39;=
LICENSE&#39;) or &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitsection =3D (localdata.getVar(&#39;=
SECTION&#39;) or &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0splitdescription =3D (localdata.getVar(&=
#39;DESCRIPTION&#39;) or &quot;.&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D get_package_addition=
al_metadata(&quot;rpm&quot;, localdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 splitcustomtagschunk =3D get_package_addition=
al_metadata(&quot;rpm&quot;, pkgname, localdata)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0translate_vers(&#39;RDEPENDS&#39;, local=
data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0translate_vers(&#39;RRECOMMENDS&#39;, lo=
caldata)<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div>

--000000000000f820ed05a63e3154--
