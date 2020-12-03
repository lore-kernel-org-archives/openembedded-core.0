Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.11930.1607010041203351593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=r3BSt5Ia;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id p8so2320873wrx.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCi51GR+fMKGZPQWDQnZki5/yc6s1oyUXr8gkyKJAH4=;
        b=r3BSt5IaWWweLK+cccsJ7cvkFnnpX09itbXxJ0UfHKSCcv0+MJAfsFeEceYEeabz1b
         OG62kIWftDgBl3L3yTujwUwDT5nF3VX9U5A/+LYw2Ev+8O8Zeq9eoW46GeXsoHIDLEXo
         vMkuH5hRKPOdlQLy9FZdhBAIy9xU5/S5CyvcVkEG0sIaphffSt3C4M2ZlRgiCyTHQFIQ
         gWQfyjwhv4p4HA7CbWSqfRPkGCfaw5T6gPf5Ceip6jNfA0W27bJ6XXrXkeT6uyNLSoTe
         4GIvvtTpVivEn/PYb+MY7QgCHrbDBd1q+uUxlnv0w2Btxgp029ulJcK7ugTbCBeeon3R
         ATuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCi51GR+fMKGZPQWDQnZki5/yc6s1oyUXr8gkyKJAH4=;
        b=XLSfAcZXHehTTBEet8bLf1kW7o/QNhtGkytYyYl+xYYCIB4InCrUQyuQcwx29EDdCO
         kfX2i+AF+ranJdSZmI62qMy7JJxW7/OavmXr6eif4YW0K2pX6lhgTpZLEKopoeXV6uqy
         tzrhwH+oRM9UujidEq0FDfdXFQwl5atE+n5Eeaon4QdEtvxUaRKZhBEx9ARHIvMZafhg
         RhHjP49PWahY6YErLtwDIGqOg6LPYZzKMP82PxwL5JvVqyIhZRr8ghPPiUl/dq1P/1m6
         y1DmIZfDlFs517b9GxwfsoHvl8A3jB/pJJM6MOKc0pKOdXyvvCy/Op594p98DaWx4rld
         1Erg==
X-Gm-Message-State: AOAM530FZ3YWpACslEgZuYipN2Rbi6JuPic0XYUZPBfHZGWIhGHfhAKs
	eFt4AMv0SFWmPFtMmn1sVnSttKqHQyzXE9T+ALQ65Q==
X-Google-Smtp-Source: ABdhPJwPOeduwUqFIg9U3EXLDjtKfdlmlrqwzjdE2CNfnZSoTyGj5qSLmsIrY7E7Os3+RS0IqZU3gqY1tJzaWOa4QXM=
X-Received: by 2002:a5d:4604:: with SMTP id t4mr4291601wrq.411.1607010039687;
 Thu, 03 Dec 2020 07:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20201201033449.8961-1-okaya@kernel.org>
In-Reply-To: <20201201033449.8961-1-okaya@kernel.org>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Thu, 3 Dec 2020 09:40:28 -0600
Message-ID: <CA+_AqivGc6Omr0iHes0TKWoxWZOncw=ZA6YQCsCYVfR6YaDMvg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] net-tools: split into binary packages
To: Sinan Kaya <okaya@kernel.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000091098705b5912e48"

--00000000000091098705b5912e48
Content-Type: text/plain; charset="UTF-8"

This patch causes problems in multilib configurations,

http://errors.yoctoproject.org/Errors/Details/539019/

Regards,
Anibal

On Mon, 30 Nov 2020 at 21:35, Sinan Kaya <okaya@kernel.org> wrote:

> Support per binary package to not bloat the system with unneeded
> tools.
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../net-tools/net-tools_1.60-20181103.bb      | 29 ++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> index e97731073e8..63a3ccbe516 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
> @@ -93,7 +93,7 @@ base_bindir_progs  = "ifconfig netstat route \
>      ${@bb.utils.contains('PACKAGECONFIG', 'hostname', 'dnsdomainname
> domainname hostname nisdomainname ypdomainname', '', d)} \
>  "
>
> -ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
> +ALTERNATIVE_${PN} = ""
>  ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG',
> 'hostname', 'hostname.1 dnsdomainname.1', '', d)}"
>  ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
>  ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
> @@ -107,4 +107,31 @@ python __anonymous() {
>  }
>  ALTERNATIVE_PRIORITY = "100"
>
> +python __anonymous () {
> +    packages = []
> +    for prog in d.getVar('base_sbindir_progs').split():
> +        pkg = "net-tools-%s" % prog.replace("_", "-")
> +        packages.append(pkg)
> +        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
> +        if not d.getVar("FILES_%s" % pkg):
> +                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
> +    for prog in d.getVar('base_bindir_progs').split():
> +        pkg = "net-tools-%s" % prog.replace("_", "-")
> +        packages.append(pkg)
> +        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
> +        if not d.getVar("FILES_%s" % pkg):
> +                d.setVar("FILES_%s" % pkg, "${base_bindir}/%s*" % prog)
> +    pkg = "net-tools-man"
> +    packages.append(pkg)
> +    if not d.getVar("FILES_%s" % pkg):
> +            d.setVar("FILES_%s" % pkg, "${mandir}/*")
> +    d.setVar("NETTOOLS_PACKAGES", " ".join(packages))
> +}
> +# "net-tools" is a metapackage which pulls in all net-tools binaries
> +PACKAGES += "${NETTOOLS_PACKAGES}"
> +PROVIDES += "${NETTOOLS_PACKAGES}"
> +FILES_${PN} = ""
> +ALLOW_EMPTY_${PN} = "1"
> +RRECOMMENDS_${PN} += "${NETTOOLS_PACKAGES}"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>
>

--00000000000091098705b5912e48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch causes problems in multilib configurations,<div=
><br></div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/53=
9019/">http://errors.yoctoproject.org/Errors/Details/539019/</a></div><div>=
<br></div><div>Regards,</div><div>Anibal</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 30 Nov 2020 at 21:35,=
 Sinan Kaya &lt;<a href=3D"mailto:okaya@kernel.org">okaya@kernel.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Support=
 per binary package to not bloat the system with unneeded<br>
tools.<br>
<br>
Signed-off-by: Sinan Kaya &lt;<a href=3D"mailto:okaya@kernel.org" target=
=3D"_blank">okaya@kernel.org</a>&gt;<br>
---<br>
=C2=A0.../net-tools/<a href=3D"http://net-tools_1.60-20181103.bb" rel=3D"n=
oreferrer" target=3D"_blank">net-tools_1.60-20181103.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 29 ++++++++++++++++++-<br>
=C2=A01 file changed, 28 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1=
.60-20181103.bb" rel=3D"noreferrer" target=3D"_blank">net-tools_1.60-201811=
03.bb</a> b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.6=
0-20181103.bb" rel=3D"noreferrer" target=3D"_blank">net-tools_1.60-20181103=
.bb</a><br>
index e97731073e8..63a3ccbe516 100644<br>
--- a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-201=
81103.bb" rel=3D"noreferrer" target=3D"_blank">net-tools_1.60-20181103.bb</=
a><br>
+++ b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-201=
81103.bb" rel=3D"noreferrer" target=3D"_blank">net-tools_1.60-20181103.bb</=
a><br>
@@ -93,7 +93,7 @@ base_bindir_progs=C2=A0 =3D &quot;ifconfig netstat route=
 \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;hos=
tname&#39;, &#39;dnsdomainname domainname hostname nisdomainname ypdomainna=
me&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
-ALTERNATIVE_${PN} =3D &quot;${base_sbindir_progs} ${base_bindir_progs}&qu=
ot;<br>
+ALTERNATIVE_${PN} =3D &quot;&quot;<br>
=C2=A0ALTERNATIVE_${PN}-doc +=3D &quot;${@bb.utils.contains(&#39;PACKAGECO=
NFIG&#39;, &#39;hostname&#39;, &#39;hostname.1 dnsdomainname.1&#39;, &#39;&=
#39;, d)}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[hostname.1] =3D &quot;${mandir}/man1/hostname.=
1&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[dnsdomainname.1] =3D &quot;${mandir}/man1/dnsd=
omainname.1&quot;<br>
@@ -107,4 +107,31 @@ python __anonymous() {<br>
=C2=A0}<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 packages =3D []<br>
+=C2=A0 =C2=A0 for prog in d.getVar(&#39;base_sbindir_progs&#39;).split():=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg =3D &quot;net-tools-%s&quot; % prog.repla=
ce(&quot;_&quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages.append(pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;ALTERNATIVE_%s&quot; % pkg, pr=
og.replace(&quot;_&quot;, &quot;-&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not d.getVar(&quot;FILES_%s&quot; % pkg):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;FI=
LES_%s&quot; % pkg, &quot;${base_sbindir}/%s*&quot; % prog)<br>
+=C2=A0 =C2=A0 for prog in d.getVar(&#39;base_bindir_progs&#39;).split():<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg =3D &quot;net-tools-%s&quot; % prog.repla=
ce(&quot;_&quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages.append(pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;ALTERNATIVE_%s&quot; % pkg, pr=
og.replace(&quot;_&quot;, &quot;-&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not d.getVar(&quot;FILES_%s&quot; % pkg):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;FI=
LES_%s&quot; % pkg, &quot;${base_bindir}/%s*&quot; % prog)<br>
+=C2=A0 =C2=A0 pkg =3D &quot;net-tools-man&quot;<br>
+=C2=A0 =C2=A0 packages.append(pkg)<br>
+=C2=A0 =C2=A0 if not d.getVar(&quot;FILES_%s&quot; % pkg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;FILES_%s&quot; %=
 pkg, &quot;${mandir}/*&quot;)<br>
+=C2=A0 =C2=A0 d.setVar(&quot;NETTOOLS_PACKAGES&quot;, &quot; &quot;.join(=
packages))<br>
+}<br>
+# &quot;net-tools&quot; is a metapackage which pulls in all net-tools bin=
aries<br>
+PACKAGES +=3D &quot;${NETTOOLS_PACKAGES}&quot;<br>
+PROVIDES +=3D &quot;${NETTOOLS_PACKAGES}&quot;<br>
+FILES_${PN} =3D &quot;&quot;<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+RRECOMMENDS_${PN} +=3D &quot;${NETTOOLS_PACKAGES}&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000091098705b5912e48--
