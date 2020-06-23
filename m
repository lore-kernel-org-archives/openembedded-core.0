Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web11.2073.1592896609623710005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 00:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gAP9+QIb;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id g14so698059ual.11
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8VFJiIJ9uFWcSAdqeLl6Fw8sGtAPrECJkjSkuiumAs=;
        b=gAP9+QIb/eZIWF47eE6rBdJ0ajSrzsgErmiEzA0axVG25SYENKerwHJ+tCWjf9NAlK
         1U6E9FWzQsQLnLgWpD/vQgtqOt8W77cQXOrn1OPuKNKMcbh197Ln3djbfIe3DVu911k2
         a/d6fpMjGDyzBe+8iYsBm7davTMhobobjlg7ie7Dg/yd808UebP/9WJ8Qoi+cLMFH7Aj
         T07dvOzW66cjaA+41uSZoqN6sD+nS7bA/yYxf6in2gtOxpxtyk2UUT5KNc6Kcv3eJMLv
         Nm9p7Z1R7jxZx/L+TEkkG8ypI88Bu20av0UR9dksGCZ3LPqrzFIG4BS+m/i4EGibVJ4J
         IeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8VFJiIJ9uFWcSAdqeLl6Fw8sGtAPrECJkjSkuiumAs=;
        b=INMWT1E+sLF9KMf483auZ9ic8Ktwgj/7FxLmqjYmCVyBtiY6vfWMu7Ux6Eee6CnxWV
         C6NsOlpM/EQnZEpFaNqonWIG0hXVZgAw5AbDMnjuYvHJw/TAq+1JNumxdHW+VpCUcTOP
         1X3QK6DHpvvaImGcvHzcNEoe+3pVsET/RKH8VN8CzM4ppAky8AxIkgkjs7OddJA2ZVsN
         K00iRcnyzY7QfiruS4RJUqsPRSl/l3BNESSSy3sf/irscqdZkuGlbf/uXTbz5l9a0/m8
         Szkcs4vP19hRtMWdQlm114WOpu2KH0bblBPYd76WSlh/Yu6p+m8lWP9+2EsdPAsyULYo
         JKVQ==
X-Gm-Message-State: AOAM533cb8upst0hXg8sfFup4btcCoT+i64Pg8901YRBsZ02OF+TrVgq
	W+XkI5tVqcKWCMnXxmm/Sz49sULQbWou2EKIJ/UypCP2FvU=
X-Google-Smtp-Source: ABdhPJwyx4iA50ftlFeQelqo8Q32FHve4ishkgB8KCrnPjV+G9kQoCdPADMeFI20t0z7OVuhRh/s6XTM+BsgUzMtee0=
X-Received: by 2002:ab0:168c:: with SMTP id e12mr13708379uaf.89.1592896608713;
 Tue, 23 Jun 2020 00:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200623000237.28031-1-jpuhlman@mvista.com>
In-Reply-To: <20200623000237.28031-1-jpuhlman@mvista.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2020 09:16:36 +0200
Message-ID: <CANNYZj-R75ceh7j2aPY7pvhobJTOuVHn3NuCk8ZoaHv+Zm_Cxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xmlcatalog: add exit 0
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000086c1ed05a8bb249c"

--00000000000086c1ed05a8bb249c
Content-Type: text/plain; charset="UTF-8"

There is already a patch for fixing this properly:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=fdee2d49fc9139ff7e0b5a8b1b6476224540ca57

Does it work for you?

Alex

On Tue, 23 Jun 2020 at 02:02, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> In most sysroot creation steps, the sysroots components are installed in
> depenancy order. However, in the case of build-sysroots, since it is
> not using standard dependacies, post installs that use xmlcatalog fail
> because xmlcatalog is not installed. Since the last execution in the
> script is xmlcatalog, the script returns 127.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes/xmlcatalog.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/xmlcatalog.bbclass
> b/meta/classes/xmlcatalog.bbclass
> index ae4811fdeb..e8d73abcf5 100644
> --- a/meta/classes/xmlcatalog.bbclass
> +++ b/meta/classes/xmlcatalog.bbclass
> @@ -15,6 +15,7 @@ xmlcatalog_complete() {
>         for CATALOG in ${XMLCATALOGS}; do
>                 xmlcatalog --noout --add nextCatalog unused
> file://$CATALOG $ROOTCATALOG
>         done
> +       exit 0
>  }
>
>  xmlcatalog_sstate_postinst() {
> --
> 2.20.1
>
> 
>

--00000000000086c1ed05a8bb249c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There is already a patch for fixing this properly:</d=
iv><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?i=
d=3Dfdee2d49fc9139ff7e0b5a8b1b6476224540ca57">http://git.yoctoproject.org/c=
git/cgit.cgi/poky/commit/?id=3Dfdee2d49fc9139ff7e0b5a8b1b6476224540ca57</a>=
</div><div><br></div><div>Does it work for you?</div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, 23 Jun 2020 at 02:02, Jeremy Puhlman &lt;<a href=3D"mai=
lto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">In most sysroot creation steps,=
 the sysroots components are installed in<br>
depenancy order. However, in the case of build-sysroots, since it is<br>
not using standard dependacies, post installs that use xmlcatalog fail<br>
because xmlcatalog is not installed. Since the last execution in the<br>
script is xmlcatalog, the script returns 127.<br>
<br>
Signed-off-by: Jeremy A. Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com=
" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/xmlcatalog.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbc=
lass<br>
index ae4811fdeb..e8d73abcf5 100644<br>
--- a/meta/classes/xmlcatalog.bbclass<br>
+++ b/meta/classes/xmlcatalog.bbclass<br>
@@ -15,6 +15,7 @@ xmlcatalog_complete() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for CATALOG in ${XMLCATALOGS}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlcatalog --noout=
 --add nextCatalog unused file://$CATALOG $ROOTCATALOG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
=C2=A0}<br>
<br>
=C2=A0xmlcatalog_sstate_postinst() {<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div>

--00000000000086c1ed05a8bb249c--
