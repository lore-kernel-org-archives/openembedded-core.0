Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.111.1614706732998348213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iTda35dI;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id b7so12769472edz.8
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 09:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/Tgh/TFNnx/JE9UqvYyxScfwveMUl2wG6JODrxRhOQ=;
        b=iTda35dIdpvvlbEJJznWqtMv5xoaH2iaSIQfDyKQR2yNr4tj/HiHLuSMmuM9jD0S0H
         mncMw9RSo2vqHyXUxX6JgLOI7GkhkwcW+kkdpBr3wW0JwhuUbDiXo6RZW3bLyJuVedrC
         kiHHxoTpgYE067sUrStVuPre/9ey/WZh2zsILRQoVA8ziueLT36pnQH1xuhhfhFrWe/m
         6Rm1jLUZn4TWFTrswQCyNTMu8je80DXfIPzHwffgC0KsDQUYJkjWOCct2rlerlqKZyXR
         lKmFNoldFEzLLEI+bDY+8QKMwNTCM28hX0ehKPhPuzvygXSzReOYsQaV6soMz/TwOI0A
         kAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/Tgh/TFNnx/JE9UqvYyxScfwveMUl2wG6JODrxRhOQ=;
        b=uNhF+licdY/aiVVZ6PXMZ2ItnoAJ+xvVbRwgiAurAzb9mGk1NvWuIyU49+p3NCmx0u
         DXznWLN8tTO6jZmckxWMUFNmZJproCwHjo+FjauuzblFnMj4baxPdbXV3zREGxs/BO9h
         5O1rxPljSmRFc/qBHm75MARJ0Oxl6MQjhE5jn0YRj/Ap3sH89nizAh1dG4tqIHAYjLbq
         y/snYeeM31wHQVxUlWyzvb02lidDYBE5/CQIrJ3RwOQ2j5h2jEH3bWdc/CZuQkO818NP
         8jKHIzPjfbOoA4bzsp95W2HyG4uaoe+S/pI0ppsIqLdTZdXz+gp9Qz5tj5nINA111y9+
         50Ng==
X-Gm-Message-State: AOAM531gWFNi+Qr6mwR12T6/JeDcVVfwV3/yQB9f45HLNVfNu62dLjwR
	8lbQ7WPY1AOYxwq/4tr7x1xmOz76SdLGZwCkO1g=
X-Google-Smtp-Source: ABdhPJzNtQpwMyQ4fLdy80kYN+Z/R7VL89VtvNKcXB/Dv9oYzbT9Rj8r/3VWPLARLSL12YfcRil3RdkyiCnU7hd3Jv8=
X-Received: by 2002:aa7:d94c:: with SMTP id l12mr10396030eds.311.1614706731285;
 Tue, 02 Mar 2021 09:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com>
 <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com> <166896E0294231B3.17091@lists.openembedded.org>
In-Reply-To: <166896E0294231B3.17091@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 2 Mar 2021 18:38:40 +0100
Message-ID: <CA+chaQd9qRRMrgbjsuwfpc+pwEcNYmppHE3pTtW+-wOh1EUMrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Anibal Limon <anibal.limon@linaro.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000227f4805bc9135de"

--000000000000227f4805bc9135de
Content-Type: text/plain; charset="UTF-8"

I guess this relative path comes from OEROOT setting in:
https://github.com/96boards/oe-rpb-manifest/blob/master/conf/bblayers.conf#L4

maybe you can call os.path.normpath there as COREBASE is doing in:
meta/conf/layer.conf:COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'

That should help with both sstate reuse as well as this error.

On Tue, Mar 2, 2021 at 6:33 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> what's the value of COREBASE in that build? Wasn't full path already in
> your sstate signatures - in that case this change didn't break your builds,
> just highlighted an issue in your builds which was already there.
>
> We can fix that by calling os.path.normpath on THISDIR, but I would like
> to know the reason why THISDIR is set this way for you (also to reproduce
> it locally to verify the fix).
>
>
>
>
> On Tue, Mar 2, 2021 at 6:14 PM Anibal Limon <anibal.limon@linaro.org>
> wrote:
>
>> This breaks our builds,
>>
>> ...
>> ERROR: Cannot add
>> '/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common'
>> to --cross-file, because it's not relative to THISDIR
>> '/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0'
>> and sstate signature would contain this full path
>> ...
>>
>> In,
>>
>>
>> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-buster-amd64/470/console
>>
>> Regards,
>> Anibal
>>
>> On Thu, 25 Feb 2021 at 11:45, Martin Jansa <Martin.Jansa@gmail.com>
>> wrote:
>>
>>> * COREBASE works correctly only as long as this recipe is inside of
>>>   COREBASE directory and leaves the full absolute paths if you copy
>>>   this recipe into your own layer (e.g. to backport newer version)
>>>
>>> * use THISDIR as all FILESPATH should be relative to that, unless
>>>   there is a .bbappend not only extending FILESPATH, but also adding
>>>   meson.cross.d files there (at which point it also didn't work with
>>>   COREBASE replacements as well already) - show an ERROR in such case,
>>>   I don't think it's common scenario to spend more time to support that.
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> index 15e9dbaf6f..882a89da7a 100644
>>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>>>      if bb.data.inherits_class('native', d):
>>>          return ""
>>>
>>> -    corebase = d.getVar("COREBASE")
>>> +    thisdir = d.getVar("THISDIR")
>>>      import collections
>>>      sitedata = siteinfo_data(d)
>>>      # filename -> found
>>> @@ -39,7 +39,11 @@ def find_meson_cross_files(d):
>>>      for path in d.getVar("FILESPATH").split(":"):
>>>          for element in sitedata:
>>>              filename = os.path.normpath(os.path.join(path,
>>> "meson.cross.d", element))
>>> -            files[filename.replace(corebase, "${COREBASE}")] =
>>> os.path.exists(filename)
>>> +            sanitized_path = filename.replace(thisdir, "${THISDIR}")
>>> +            if sanitized_path == filename:
>>> +                bb.error("Cannot add '%s' to --cross-file, because it's
>>> not relative to THISDIR '%s' and sstate signature would contain this full
>>> path" % (filename, thisdir))
>>> +                continue
>>> +            files[filename.replace(thisdir, "${THISDIR}")] =
>>> os.path.exists(filename)
>>>
>>>      items = ["--cross-file=" + k for k,v in files.items() if v]
>>>      d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
>>> --
>>> 2.27.0
>>>
>>>
>>>
>>>
>>>
> 
>
>

--000000000000227f4805bc9135de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I guess this relative path comes from OEROOT setting =
in:</div><a href=3D"https://github.com/96boards/oe-rpb-manifest/blob/master=
/conf/bblayers.conf#L4">https://github.com/96boards/oe-rpb-manifest/blob/ma=
ster/conf/bblayers.conf#L4</a><br><div><br></div><div>maybe you can call os=
.path.normpath there as COREBASE is doing in:</div><div>meta/conf/layer.con=
f:COREBASE =3D &#39;${@os.path.normpath(&quot;${LAYERDIR}/../&quot;)}&#39;<=
br></div><div><br></div><div>That should help with both sstate reuse as wel=
l as this error.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:33 PM Martin Jansa via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.=
Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">what&#39;s the value of COREBASE in that =
build? Wasn&#39;t full path already in your sstate signatures - in that cas=
e this change didn&#39;t break your builds, just highlighted an issue in yo=
ur builds which was already there.<div><br></div><div>We can fix that by ca=
lling=C2=A0os.path.normpath on THISDIR, but I would like to know the reason=
 why THISDIR is set this way for you (also to reproduce it locally to verif=
y the fix).</div><div><br></div><div><br></div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2=
, 2021 at 6:14 PM Anibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.or=
g" target=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">This breaks ou=
r builds,<div><br></div><div>...</div><div>ERROR: Cannot add &#39;/home/bui=
lds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files=
/meson.cross.d/common&#39; to --cross-file, because it&#39;s not relative t=
o THISDIR &#39;/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/op=
enembedded-core/meta/recipes-core/glib-2.0&#39; and sstate signature would =
contain this full path<br></div><div>...</div><div><br></div><div>In,</div>=
<div><br></div><div><a href=3D"https://ci.linaro.org/job/lt-qcom-openembedd=
ed-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,label=3Ddocker-buster=
-amd64/470/console" target=3D"_blank">https://ci.linaro.org/job/lt-qcom-ope=
nembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,label=3Ddocker=
-buster-amd64/470/console</a><br></div><div><br></div><div>Regards,</div><d=
iv>Anibal</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 25 Feb 2021 at 11:45, Martin Jansa &lt;<a href=3D"=
mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* CO=
REBASE works correctly only as long as this recipe is inside of<br>
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
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000227f4805bc9135de--
