Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.185.1614707025997976060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHST66iK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: geoffhp@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id v9so14831170lfa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fe7onqqWj8B2X7BhCnThrvyAxtGqrlrqg/fspZ9TGo=;
        b=fHST66iKyFIm2HqxU+5HgvQ5ZOWGz3AepNI5h7/nZWSERRwJLKe3O2omHbsHcSFeHs
         GbT+Lxrj+uNlyaWUlWYvcembZMdcKR0ALBGnV6rBSqn2dSsM8p6027SCrICEYqDeKV+m
         aNCL9vbLIxxkCXMkygdxWH9i5BPHC+kNBzW730YcoAZYxGq43nagIFUczQAQtoEx25PO
         ZG44hwaH9PEgpbji1ZEoApRemZfsGVLkFv48hlKC1xfqsb+20LvyT88mP78CrqePRVGc
         uAFEVTrvp4ZP/T1in1c+83J9QKz6Dp0IYusRdA3D+gvzmAzUXsSiSLYeSzRP6++fM5kS
         GQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fe7onqqWj8B2X7BhCnThrvyAxtGqrlrqg/fspZ9TGo=;
        b=W8Q4Poc5trX4U7nIhs3gQ5uujB9p8TKd2w8n7PTFSAxPHtscA0JGUDnSwjUsCE39gA
         Xu6jrwaIufaETqP1uGDcgVX1KugguueuDPoRYnEmz/WJgJ5CTsxv5fRlsVAzuS3J5avY
         cjkP71NOyp8MLq4dc8qysRPHfBLqauDlUCm6zhZ89pCJvkxQHLizVgcw8ECzTPaMNZKq
         Ost8g245Wyb7Su2vkiZnwDTPcO13rJmCMi78zNDV7xfup/tioD0K4uNElCpI0bRvEA1s
         Naelc4xMW+3Ao6KUKNYb+gYW24sQnZyFJgf1CYysrW0EN442IX1OXHvXBC4ZmxGpSzj/
         MaMw==
X-Gm-Message-State: AOAM530qfwCOtC2GpVon9Lbv3VpRon4ZhZO0V6JkM38qKgir6nixY3Zp
	y4690VBrBPnooqXRQbUr5WRaSOf6zOdWePGDZwE=
X-Google-Smtp-Source: ABdhPJxWDiuy8vQttdc+MNscFvcOrHHDXVKWGYAfGJ3SDic5QcFNDuV/l8ExSguIZfsTTuuaDX9zJbCGUNviRqgKx/E=
X-Received: by 2002:a19:4192:: with SMTP id o140mr13180528lfa.427.1614707023873;
 Tue, 02 Mar 2021 09:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com> <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com>
In-Reply-To: <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com>
From: "Geoff Parker" <geoffhp@gmail.com>
Date: Tue, 2 Mar 2021 09:43:32 -0800
Message-ID: <CAHNuFGJSuXT3D3bVtDoy_q_ZrzcVxT34Zte_a6RnW==7N8MC_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Anibal Limon <anibal.limon@linaro.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000930f9905bc9146b5"

--000000000000930f9905bc9146b5
Content-Type: text/plain; charset="UTF-8"

Same here. Our build artifacts get created but, I get a few thousand of
these errors:

ERROR: Cannot add
'/home/geoff/yocto-tegra/poky/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/arm-64'
to --cross-file, because it's not relative to THISDIR '/
home/geoff/yocto-tegra/poky/build-ccu3/../meta/recipes-core/glib-2.0' and
sstate signature would contain this full path

 Since the bitbake return code is 1 our CI pipeline does not deploy the
build artifacts.

Would bb.warn() be more appropriate to use for this change than bb.error()?

On Tue, Mar 2, 2021 at 9:14 AM Anibal Limon <anibal.limon@linaro.org> wrote:

> This breaks our builds,
>
> ...
> ERROR: Cannot add
> '/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common'
> to --cross-file, because it's not relative to THISDIR
> '/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0'
> and sstate signature would contain this full path
> ...
>
> In,
>
>
> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-buster-amd64/470/console
>
> Regards,
> Anibal
>
> On Thu, 25 Feb 2021 at 11:45, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
>> * COREBASE works correctly only as long as this recipe is inside of
>>   COREBASE directory and leaves the full absolute paths if you copy
>>   this recipe into your own layer (e.g. to backport newer version)
>>
>> * use THISDIR as all FILESPATH should be relative to that, unless
>>   there is a .bbappend not only extending FILESPATH, but also adding
>>   meson.cross.d files there (at which point it also didn't work with
>>   COREBASE replacements as well already) - show an ERROR in such case,
>>   I don't think it's common scenario to spend more time to support that.
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>> index 15e9dbaf6f..882a89da7a 100644
>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>>      if bb.data.inherits_class('native', d):
>>          return ""
>>
>> -    corebase = d.getVar("COREBASE")
>> +    thisdir = d.getVar("THISDIR")
>>      import collections
>>      sitedata = siteinfo_data(d)
>>      # filename -> found
>> @@ -39,7 +39,11 @@ def find_meson_cross_files(d):
>>      for path in d.getVar("FILESPATH").split(":"):
>>          for element in sitedata:
>>              filename = os.path.normpath(os.path.join(path,
>> "meson.cross.d", element))
>> -            files[filename.replace(corebase, "${COREBASE}")] =
>> os.path.exists(filename)
>> +            sanitized_path = filename.replace(thisdir, "${THISDIR}")
>> +            if sanitized_path == filename:
>> +                bb.error("Cannot add '%s' to --cross-file, because it's
>> not relative to THISDIR '%s' and sstate signature would contain this full
>> path" % (filename, thisdir))
>> +                continue
>> +            files[filename.replace(thisdir, "${THISDIR}")] =
>> os.path.exists(filename)
>>
>>      items = ["--cross-file=" + k for k,v in files.items() if v]
>>      d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
>> --
>> 2.27.0
>>
>>
>>
>>
>>
> 
>
>

--000000000000930f9905bc9146b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Same here. Our build artifacts get created but, I get a fe=
w thousand of these errors:<br><br><span style=3D"font-family:monospace"><s=
pan style=3D"font-weight:bold;color:rgb(255,84,84)">ERROR</span><span style=
=
=3D"color:rgb(0,0,0)">: </span><span style=3D"color:rgb(178,24,24)">Cannot=
 add &#39;/home/geoff/yocto-tegra/poky/meta/recipes-core/glib-2.0/glib-2.0/=
meson.cross.d/arm-64&#39; to --cross-file, because it&#39;s not relative to=
 THISDIR &#39;/</span><br>home/geoff/yocto-tegra/poky/build-ccu3/../meta/re=
cipes-core/glib-2.0&#39; and sstate signature would contain this full path =
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br></span><br>=C2=A0Since the bitbake=
 return code is 1 our CI pipeline=C2=A0does not deploy the build artifacts.=
=
=C2=A0=C2=A0<br><br>Would bb.warn() be more appropriate to use for this ch=
ange than bb.error()?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 2, 2021 at 9:14 AM Anibal Limon &lt;<a hre=
f=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
">This breaks our builds,<div><br></div><div>...</div><div>ERROR: Cannot ad=
d &#39;/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-cor=
e/glib-2.0/files/meson.cross.d/common&#39; to --cross-file, because it&#39;=
s not relative to THISDIR &#39;/home/builds/oe-rpb-master/build-410c-2/conf=
/../../layers/openembedded-core/meta/recipes-core/glib-2.0&#39; and sstate =
signature would contain this full path<br></div><div>...</div><div><br></di=
v><div>In,</div><div><br></div><div><a href=3D"https://ci.linaro.org/job/lt=
-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,label=
=
=3Ddocker-buster-amd64/470/console" target=3D"_blank">https://ci.linaro.or=
g/job/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-41=
0c,label=3Ddocker-buster-amd64/470/console</a><br></div><div><br></div><div=
>Regards,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Feb 2021 at 11:45, Martin Jansa =
&lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jans=
a@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">* COREBASE works correctly only as long as this recipe is insid=
e of<br>
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
<br>
<br>
<br>
</blockquote></div>

--000000000000930f9905bc9146b5--
