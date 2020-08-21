Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.128872.1597997231372905022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 01:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oUQl/fuE;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id g19so1268825ejc.9
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 01:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHP3BRuiqxLFijpAv0pZNMnmVBceg9Q3GKaoaCL76ys=;
        b=oUQl/fuEmE1J24PhKcYOc2cgFtGmQx3L5FCVnzWTizY1FLW01RZIK4c7HXUvsBfYct
         T5vECGJqrksosBQzmv0NbIUFIF4hWke8rvS5IbYqFqDQJ+hH/iUbn4YEzPPmI38Z1wcn
         ucZLzEuM+RI4FKX+0SrWbf98K6rrysopxp3uVaqhEvP5hEB7ZXgXmvX0RGlnzhItyY1Y
         o5l2HSK00Jpc0rrR6BEsa4v9mDLSXhsN4kycuDWFRdBGFP+MMnstUufPrpKkiONl0OjG
         2OTzbTCLq/8fPSsLXlm9aHn3N0uJQK0gItYfPN9u+nqQmMZGcPKX4cGoEhrjlL5nL4fk
         IJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHP3BRuiqxLFijpAv0pZNMnmVBceg9Q3GKaoaCL76ys=;
        b=c6q5vCXfGm9zsSJ7PX0nfwj1UqUJTdVRUvDllbI/6iaOqEZz12RV1XsmYU7RHEHI5N
         I6xOdnMrSDWl4/0ajUObs6o+ub4ozRSmaL0Y7p2oXrUVpxQ8fmvrvd5JuaLs8emHeo6G
         1k0HfcxglyjfhnnPVtjCMzpFh/jlEZA8Lu+LwOJN6m9F2PAK/TUpY4uRd+ZOyUboHMnj
         f9qriBMWr5R26p0vtX4Hjn9gvfre3s3kgBLapq7BFQen6iDYYzeLp8i4YavvWIoq75iU
         /McHdnSTi5Pvf8YRJdmLM/rCVgGWNcV2KuF/7t6j/lOC0nZvU0gQiUbvubVqBUYZL8wf
         tcZA==
X-Gm-Message-State: AOAM5318JI5slP8bquCac0uz9otmYs3pKYg8cvoYtNwvfJ484K9kymt7
	harNf3ePEiOZ8LquVEf6Go6bZUfjdHtq8x5NJqo=
X-Google-Smtp-Source: ABdhPJzxhcXEZlxyvnHrXS3csNz+jWnr1fNl0OoY8g5gy6JBSFtvQu+yXe8K5r5IUmqZgib/JZ4AnkHDqUwnZGz1ENw=
X-Received: by 2002:a17:906:37c3:: with SMTP id o3mr1905594ejc.54.1597997229640;
 Fri, 21 Aug 2020 01:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 21 Aug 2020 10:06:58 +0200
Message-ID: <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003991ac05ad5eb9da"

--0000000000003991ac05ad5eb9da
Content-Type: text/plain; charset="UTF-8"

Why is this an issue?

connman-conf recipe doesn't take long time to build and if you don't want
to install it on target you can use BAD_RECOMMENDATIONS variable.

We're using connman-conf to configure networking on various target machines
- not only on qemu*. If this is merged I'll just undo this in our layer -
and that's fine, but if there are more people using connman-conf like this,
then we should re-consider this commit (or at least better explain why it's
needed in commit message).

On Fri, Aug 21, 2020 at 4:54 AM Li Zhou <li.zhou@windriver.com> wrote:

> connman-conf is only for qemu machines, so use COMPATIBLE_MACHINE
> to limit that it is only available for qemuall, or else it can be
> built successfully without the package connman-conf generated.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 2 ++
>  meta/recipes-connectivity/connman/connman_1.38.bb | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
> b/meta/recipes-connectivity/connman/connman-conf.bb
> index 9a519ec..3a6c525 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -34,3 +34,5 @@ do_install() {
>  }
>
>  SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
> +COMPATIBLE_MACHINE = "null"
> +COMPATIBLE_MACHINE_qemuall = "${MACHINE}"
> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb
> b/meta/recipes-connectivity/connman/connman_1.38.bb
> index 027c41e..734b8ae 100644
> --- a/meta/recipes-connectivity/connman/connman_1.38.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
> @@ -12,5 +12,5 @@ SRC_URI_append_libc-musl = "
> file://0002-resolve-musl-does-not-implement-res_nin
>  SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
>  SRC_URI[sha256sum] =
> "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
>
> -RRECOMMENDS_${PN} = "connman-conf"
> +RRECOMMENDS_${PN}_qemuall = "connman-conf"
>  RCONFLICTS_${PN} = "networkmanager"
> --
> 1.9.1
>
> 
>

--0000000000003991ac05ad5eb9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why is this an issue?<div><br></div><div>connman-conf reci=
pe doesn&#39;t take long time to build and if you don&#39;t want to install=
 it on target you can use=C2=A0BAD_RECOMMENDATIONS variable.</div><div><br>=
</div><div>We&#39;re using connman-conf to configure networking on various =
target machines - not only on qemu*. If this is merged I&#39;ll just undo t=
his in our layer - and that&#39;s fine, but if there are more people using =
connman-conf like this, then we should re-consider=C2=A0this commit (or at =
least better explain why it&#39;s needed in commit message).</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, A=
ug 21, 2020 at 4:54 AM Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com"=
>li.zhou@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">connman-conf is only for qemu machines, so use COMPAT=
IBLE_MACHINE<br>
to limit that it is only available for qemuall, or else it can be<br>
built successfully without the package connman-conf generated.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=
=
=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/connman/<a href=3D"http://connman-conf.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a> | 2 ++<br>
=C2=A0meta/recipes-connectivity/connman/<a href=3D"http://connman_1.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a> | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman-c=
onf.bb" rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a> b/meta/rec=
ipes-connectivity/connman/<a href=3D"http://connman-conf.bb" rel=3D"norefer=
rer" target=3D"_blank">connman-conf.bb</a><br>
index 9a519ec..3a6c525 100644<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman-conf.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman-conf.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman-conf.bb</a><br>
@@ -34,3 +34,5 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0SYSTEMD_SERVICE_${PN}_qemuall =3D &quot;wired-connection.service&quo=
t;<br>
+COMPATIBLE_MACHINE =3D &quot;null&quot;<br>
+COMPATIBLE_MACHINE_qemuall =3D &quot;${MACHINE}&quot;<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman_1=
.38.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a> b/meta/rec=
ipes-connectivity/connman/<a href=3D"http://connman_1.38.bb" rel=3D"norefer=
rer" target=3D"_blank">connman_1.38.bb</a><br>
index 027c41e..734b8ae 100644<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman_1.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a><br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman_1.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a><br>
@@ -12,5 +12,5 @@ SRC_URI_append_libc-musl =3D &quot; file://0002-resolve-=
musl-does-not-implement-res_nin<br>
=C2=A0SRC_URI[md5sum] =3D &quot;1ed8745354c7254bdfd4def54833ee94&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cb30aca97c2f79ccaed8802aa2909ac5100a396=
9de74c0af8a9d73b85fc4932b&quot;<br>
<br>
-RRECOMMENDS_${PN} =3D &quot;connman-conf&quot;<br>
+RRECOMMENDS_${PN}_qemuall =3D &quot;connman-conf&quot;<br>
=C2=A0RCONFLICTS_${PN} =3D &quot;networkmanager&quot;<br>
-- <br>
1.9.1<br>
<br>
<br>
</blockquote></div>

--0000000000003991ac05ad5eb9da--
