Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.28.1614705266279920570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kySUjRhg;
 spf=pass (domain: linaro.org, ip: 209.85.128.50, mailfrom: anibal.limon@linaro.org)
Received: by mail-wm1-f50.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so1454718wma.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 09:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOkdJS3VX5k0pGJPRIpIkC8I28vn8/DH9ALgLP+3Wnc=;
        b=kySUjRhguokck9BLKYtDRy5F6xqY1IYdW9T+G/BAtGvbczIpdala+fTOWNQ0Jd0qsD
         ILLrF78LBYqGuZmOTo4STfvOkLdTbluA/6jdUKTCKK+h//9zyZgEmoAmjlgBuj4eyWli
         03aVbNQ3Y7TBsw/tuJBJPwr6YlRVEgpkmMdG7SsNBpaLUEdBlA7irR7JHPG6YECfOGge
         oUWaNmDpOmC99MGwxqh2FmoB2b+QpVr5LiEMVDzvV44MHc51w8VAnENf3Y/pmiFornfH
         RcHvmb5jqmruv5R3ul53fWYGsoYI6pT5XiMcAdAHxjhX8w3hGRxF03MO5OrVnaLXZ4Iw
         g+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOkdJS3VX5k0pGJPRIpIkC8I28vn8/DH9ALgLP+3Wnc=;
        b=hgi4UVkL53S4U+4wY8rNv5yMRJu+Mmdb7RhXG2F76NveYC1XmgQxwQiCsdnqLDcotS
         FhZibS9Ua9GWApCnviqjOc2AhkO3pMFIpJqK2BJ/iwXwvllyBk0vl6TaVkCK8BmUqOsY
         7AcTtj1NhcQdSP9Xn8ETzY7qxO7Ne0EAr7sq6ouF6wCyuMsGG+I+BdclWSCtIVDjuxy/
         L8GZUC8rfyc1aOohhtcHXEkitBemXipwoVS/yO8G0JaTz9AKumMU1uhIthwbkjBXqC67
         tTmZuGZApOB4wRWZb0/tV6HsAB80vARwpqHq/Au4spgZSBatX/BoTl4DAnKHspjRyp8E
         VpLQ==
X-Gm-Message-State: AOAM5335tS7pul5/7v+9Vq1dFvgsMQH70Eq+iFntrUdWaLI9ffzr8OTq
	h0xlYpkNsVkIRopNzATMoYOQVdvNzexzrGNNbk3pXw==
X-Google-Smtp-Source: ABdhPJw2gfHiPT2p/DNiIOMrcfPvSptBmzStYSOUlAx5/0wfGGzaHnk+uYfuR6AclsE35w6dIjKh1mvtEP3Cwt7oNpA=
X-Received: by 2002:a7b:c242:: with SMTP id b2mr5205503wmj.119.1614705264680;
 Tue, 02 Mar 2021 09:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210225174516.639740-1-Martin.Jansa@gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Tue, 2 Mar 2021 11:14:14 -0600
Message-ID: <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b7f30205bc90dd9d"

--000000000000b7f30205bc90dd9d
Content-Type: text/plain; charset="UTF-8"

This breaks our builds,

...
ERROR: Cannot add
'/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common'
to --cross-file, because it's not relative to THISDIR
'/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0'
and sstate signature would contain this full path
...

In,

https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-buster-amd64/470/console

Regards,
Anibal

On Thu, 25 Feb 2021 at 11:45, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * COREBASE works correctly only as long as this recipe is inside of
>   COREBASE directory and leaves the full absolute paths if you copy
>   this recipe into your own layer (e.g. to backport newer version)
>
> * use THISDIR as all FILESPATH should be relative to that, unless
>   there is a .bbappend not only extending FILESPATH, but also adding
>   meson.cross.d files there (at which point it also didn't work with
>   COREBASE replacements as well already) - show an ERROR in such case,
>   I don't think it's common scenario to spend more time to support that.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> index 15e9dbaf6f..882a89da7a 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>      if bb.data.inherits_class('native', d):
>          return ""
>
> -    corebase = d.getVar("COREBASE")
> +    thisdir = d.getVar("THISDIR")
>      import collections
>      sitedata = siteinfo_data(d)
>      # filename -> found
> @@ -39,7 +39,11 @@ def find_meson_cross_files(d):
>      for path in d.getVar("FILESPATH").split(":"):
>          for element in sitedata:
>              filename = os.path.normpath(os.path.join(path,
> "meson.cross.d", element))
> -            files[filename.replace(corebase, "${COREBASE}")] =
> os.path.exists(filename)
> +            sanitized_path = filename.replace(thisdir, "${THISDIR}")
> +            if sanitized_path == filename:
> +                bb.error("Cannot add '%s' to --cross-file, because it's
> not relative to THISDIR '%s' and sstate signature would contain this full
> path" % (filename, thisdir))
> +                continue
> +            files[filename.replace(thisdir, "${THISDIR}")] =
> os.path.exists(filename)
>
>      items = ["--cross-file=" + k for k,v in files.items() if v]
>      d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
> --
> 2.27.0
>
>
> 
>
>

--000000000000b7f30205bc90dd9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks our builds,<div><br></div><div>...</div><div>E=
RROR: Cannot add &#39;/home/builds/oe-rpb-master/layers/openembedded-core/m=
eta/recipes-core/glib-2.0/files/meson.cross.d/common&#39; to --cross-file, =
because it&#39;s not relative to THISDIR &#39;/home/builds/oe-rpb-master/bu=
ild-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0&#=
39; and sstate signature would contain this full path<br></div><div>...</di=
v><div><br></div><div>In,</div><div><br></div><div><a href=3D"https://ci.li=
naro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonb=
oard-410c,label=3Ddocker-buster-amd64/470/console">https://ci.linaro.org/jo=
b/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,l=
abel=3Ddocker-buster-amd64/470/console</a><br></div><div><br></div><div>Reg=
ards,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 25 Feb 2021 at 11:45, Martin Jansa &=
lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* COREBA=
SE works correctly only as long as this recipe is inside of<br>
=C2=A0 COREBASE directory and leaves the full absolute paths if you copy<b=
r>
=C2=A0 this recipe into your own layer (e.g. to backport newer version)<br=
>
<br>
* use THISDIR as all FILESPATH should be relative to that, unless<br>
=C2=A0 there is a .bbappend not only extending FILESPATH, but also adding<=
br>
=C2=A0 meson.cross.d files there (at which point it also didn&#39;t work w=
ith<br>
=C2=A0 COREBASE replacements as well already) - show an ERROR in such case=
,<br>
=C2=A0 I don&#39;t think it&#39;s common scenario to spend more time to su=
pport that.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> b/meta/reci=
pes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=3D"noreferrer" =
target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
index 15e9dbaf6f..882a89da7a 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;native&#39;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 corebase =3D d.getVar(&quot;COREBASE&quot;)<br>
+=C2=A0 =C2=A0 thisdir =3D d.getVar(&quot;THISDIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0import collections<br>
=C2=A0 =C2=A0 =C2=A0sitedata =3D siteinfo_data(d)<br>
=C2=A0 =C2=A0 =C2=A0# filename -&gt; found<br>
@@ -39,7 +39,11 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0for path in d.getVar(&quot;FILESPATH&quot;).split(&quo=
t;:&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for element in sitedata:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D os.path.normp=
ath(os.path.join(path, &quot;meson.cross.d&quot;, element))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(corebase=
, &quot;${COREBASE}&quot;)] =3D os.path.exists(filename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sanitized_path =3D filename.rep=
lace(thisdir, &quot;${THISDIR}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sanitized_path =3D=3D filena=
me:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Ca=
nnot add &#39;%s&#39; to --cross-file, because it&#39;s not relative to THI=
SDIR &#39;%s&#39; and sstate signature would contain this full path&quot; %=
 (filename, thisdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(thisdir,=
 &quot;${THISDIR}&quot;)] =3D os.path.exists(filename)<br>
<br>
=C2=A0 =C2=A0 =C2=A0items =3D [&quot;--cross-file=3D&quot; + k for k,v in =
files.items() if v]<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;EXTRA_OEMESON&quot;, &quot; &quot; +=
 &quot; &quot;.join(items))<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b7f30205bc90dd9d--
