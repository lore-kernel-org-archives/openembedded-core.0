Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web09.10052.1622046640862934042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 09:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DmUPB20F;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id b1so1111349uap.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 09:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9hgHQtigno2/6hByTs3ulGxpIui4oqWhwbvQh15neo=;
        b=DmUPB20FkV9YokpCvFtBB0hajj7jg7nEX6pJnnZf/9bQiZhXW2nT0Cdkci4eB6GsjA
         BeIm+AyYMdDh3vugBJGjoHIr+QCTaxcnbWmrbh+Cj6N+87I1rEumlbUJajBbPjREvMvH
         Pv3ahyUeL2/zKetpPTHLt2xXcQUWbjw2qBbX3aLRjH/iHOamNtvnUTgpb0IlLwwx8xaE
         BO1JAGrUgDK0xpCWfk4iGAY9gszplwY6y9GGJIUnbYboGyxT5IADgAJrdG0rLq0xpgSs
         kG/7K8CgLk2ECIsxanZIXrXGt0C79Q4PRpmeji+5C2mIgL/u5z/kg0Jn1fBCcxfLM81h
         Xw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9hgHQtigno2/6hByTs3ulGxpIui4oqWhwbvQh15neo=;
        b=mzrXxawh4mxBFYxUUwbseif4gf/8wI4mM5YlD4ohLrQ6I3aLvxzroxLFopMx9N+v+L
         oZEzg/U4ttSsF8hijYIwLcEE+vcj+cERFmzYeIqa7MC+9dlvlLDdHfuT2LJ7yWjWBhOn
         w5h4JNFyjFlE6PxWMFzdijUUkm3CR0udoQxqZ5a0f2PMVpfPV8wo+v0HlBdeGpq4MhwF
         RIv4gufoLwkEuIWfln+cNIqb0BF58/Q2Enq6SqShMC0NBhlYrQfQ7qve+LIc9tdYAftG
         xahMn4DGEGozE2a6dIfSUUOv8CyYIMbiW2dFMy0UrRXtXL9AlrvaGSgtwvJ9+Ae7jzaV
         hG/Q==
X-Gm-Message-State: AOAM530DZqoue2wUU+alYr+VxCIxHm+GB2oFh67aQLeErh634WPFqy0s
	nSVzfaH68EbrqWVjGa8wb21VamFQKEObLBF1So+gBy+W
X-Google-Smtp-Source: ABdhPJySJynVOwIwVamWSzF6BDlRNJkfBgpW4He44wARV6KYwmYJMplsy30U3JpWkfT+JP+DRuxXt6tMHBqq4YA8zOk=
X-Received: by 2002:ab0:742:: with SMTP id h60mr33001802uah.89.1622046640000;
 Wed, 26 May 2021 09:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210526145910.3930141-1-ross.burton@arm.com>
In-Reply-To: <20210526145910.3930141-1-ross.burton@arm.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 26 May 2021 18:30:28 +0200
Message-ID: <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c9513905c33e2923"

--000000000000c9513905c33e2923
Content-Type: text/plain; charset="UTF-8"

What  happens if XZ_THREADS isn't set?

Alex

On Wed, 26 May 2021 at 16:59, Ross Burton <ross@burtonini.com> wrote:

> By default RPM uses the number of cores as the number of threads to use,
> which can result in quite antisocial memory usage.
>
> As we control the macros for compression anyway, we can pass XZ_THREADS
> to limit the number of threads if needed.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/package_rpm.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 84a9a6dd12..86706da842 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -684,8 +684,8 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_use_internal_dependency_generator 0'"
>      cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build
> 0'"
>      cmd = cmd + " --define '_build_id_links none'"
> -    cmd = cmd + " --define '_binary_payload w6T.xzdio'"
> -    cmd = cmd + " --define '_source_payload w6T.xzdio'"
> +    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" %
> int(d.getVar("XZ_THREADS"))
> +    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" %
> int(d.getVar("XZ_THREADS"))
>      cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
>      cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
>      cmd = cmd + " --define '_buildhost reproducible'"
> --
> 2.25.1
>
>
> 
>
>

--000000000000c9513905c33e2923
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What=C2=A0 happens if XZ_THREADS isn&#39;t set?</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, 26 May 2021 at 16:59, Ross Burton=
 &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">By default RPM=
 uses the number of cores as the number of threads to use,<br>
which can result in quite antisocial memory usage.<br>
<br>
As we control the macros for compression anyway, we can pass XZ_THREADS<br=
>
to limit the number of threads if needed.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_rpm.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.b=
bclass<br>
index 84a9a6dd12..86706da842 100644<br>
--- a/meta/classes/package_rpm.bbclass<br>
+++ b/meta/classes/package_rpm.bbclass<br>
@@ -684,8 +684,8 @@ python do_package_rpm () {<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;_use_internal_depen=
dency_generator 0&#39;&quot;<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;_binaries_in_noarch=
_packages_terminate_build 0&#39;&quot;<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;_build_id_links non=
e&#39;&quot;<br>
-=C2=A0 =C2=A0 cmd =3D cmd + &quot; --define &#39;_binary_payload w6T.xzdi=
o&#39;&quot;<br>
-=C2=A0 =C2=A0 cmd =3D cmd + &quot; --define &#39;_source_payload w6T.xzdi=
o&#39;&quot;<br>
+=C2=A0 =C2=A0 cmd =3D cmd + &quot; --define &#39;_binary_payload w6T%d.xz=
dio&#39;&quot; % int(d.getVar(&quot;XZ_THREADS&quot;))<br>
+=C2=A0 =C2=A0 cmd =3D cmd + &quot; --define &#39;_source_payload w6T%d.xz=
dio&#39;&quot; % int(d.getVar(&quot;XZ_THREADS&quot;))<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;clamp_mtime_to_sour=
ce_date_epoch 1&#39;&quot;<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;use_source_date_epo=
ch_as_buildtime 1&#39;&quot;<br>
=C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; --define &#39;_buildhost reproduc=
ible&#39;&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c9513905c33e2923--
