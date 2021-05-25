Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8345.1621942032064059823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 04:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QlbWSxYy;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id y202so12168pfc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rAonte0Sbnd4YH46qtJ6HITOzoZVHaiXOqdoIJnNEg=;
        b=QlbWSxYy2GXuecZg6rzi2PtWduxXIt7JOBJtik8IVYNHGXZPNhidrxLHoFqBa07MFt
         enSrbq2wgSrwzlTGhtbrBNi4KvXeug7GH3ucvmjvhyFPiKuSNsVkDWmT9jy/ZK9c2NBG
         Xjr/Mh7BR5Z4WOBPkoWQ2Sg0yFFMp3h/r4IWfKgFTyBQ2ciZZ5LaWyNRYagY6UGv3hdp
         Sp4RG8SbXdUeNeHlZ2zlLPtT0cVxY2O8b5KOLdBRS5DbcSdIOJGtT1XjOYWmyuzp/lfU
         fGoHC41zspNdgopJzd6rgPm/DxS+cQfUEm0ZULMFGo5XbaBY0iBK1HlRuchWmEpNNDOQ
         trrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rAonte0Sbnd4YH46qtJ6HITOzoZVHaiXOqdoIJnNEg=;
        b=UP1i1e6rac6zCyQEkhTPnKQB9f/HX1DXUpzQvps1KiAHISorbj9RC7stIRs4EXc5SB
         lLtTV27s6CRuOjWYdfe7EWFQyhvxQuOveS9edMNYMWycbj/T//T88VnKtftHuo3j6fHx
         eDbiF6MSPZXUA+WX7DE+vEHkwIxlfnGat97p39ESk9DzwToLwhoGNWFSpTqNmmXrFxeA
         OYFGSGsH9pK/Rqd7b8W1j1BsM2F2kYxyA8xsmNpbM8EDSjHZCVeZKbJTjkPHmbJaneM4
         1f0hb5+fQEWp3XMmk450KWah7Kd1BATCLjyzNqyxspFZfxh70arRxARmY1x48pUrdyhp
         jEcw==
X-Gm-Message-State: AOAM530jQobuxKd9LFa+UQ6jbcybFAAqpw8p9J4jh3kdkPPr4Iom0zfE
	n9Ggv/ccsHGGIxABxhsGR6C3EmgRmfSHyTbZqH4=
X-Google-Smtp-Source: ABdhPJygBlphWXxoPmDjilrX8YWukkrJoXQBemDda2JYoRXpvgnT9JUCxyZF/LPwEzqCm+i5c4dLfqDpgSzD6AzTyqU=
X-Received: by 2002:a05:6a00:bc2:b029:2df:93cc:371a with SMTP id
 x2-20020a056a000bc2b02902df93cc371amr29455883pfu.12.1621942031648; Tue, 25
 May 2021 04:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210525100447.3918978-1-samuli.piippo@qt.io> <CANNYZj-=JMz_=HtogubX3E7FDGbtRk6BxTVShFgNNoRKrCMK9g@mail.gmail.com>
In-Reply-To: <CANNYZj-=JMz_=HtogubX3E7FDGbtRk6BxTVShFgNNoRKrCMK9g@mail.gmail.com>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Tue, 25 May 2021 14:27:00 +0300
Message-ID: <CABXoSoVTKLZr6uh=FQ+hV_uAh0vor1YrB3V1X6kwRVHOhO8oYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: enabled zstd support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a48b4505c325ce5e"

--000000000000a48b4505c325ce5e
Content-Type: text/plain; charset="UTF-8"

Issue came up while building Qt6, which uses cmake packaging API:
https://gitlab.kitware.com/cmake/cmake/-/issues/21552
Things break when zstd support is not available and CMake doesn't provide
simple why to ask if the support is available.

Quote from cmake dev:
As far as CMake's design is concerned, we have no optional formats. All
should be supported.
That's why we bundle sufficiently new versions of libarchive and libzstd.
If a distro builds with an older libarchive that doesn't have zstd support,
then that is not a proper packaging of CMake.

For target/nativesdk CMake depends on libarchive for this support, which is
covered in the second patch.

-samuli

On Tue, 25 May 2021 at 13:07, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> You need to explain the benefit in doing so, I think? :)
>
> Alex
>
> On Tue, 25 May 2021 at 12:05, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
>> Now that zstd is in oe-core, enable support for it in native CMake.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>>  meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>> b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>> index d91e42ef9a..335097d387 100644
>> --- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>> +++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>> @@ -1,7 +1,7 @@
>>  require cmake.inc
>>  inherit native
>>
>> -DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>> ncurses-native"
>> +DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>> ncurses-native zstd-native"
>>
>>  SRC_URI += "file://OEToolchainConfig.cmake \
>>              file://environment.d-cmake.sh \
>> --
>> 2.25.1
>>
>>
>> 
>>
>>

--000000000000a48b4505c325ce5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Issue came up while building Qt6, which uses cma=
ke packaging API: <a href=3D"https://gitlab.kitware.com/cmake/cmake/-/issue=
s/21552">https://gitlab.kitware.com/cmake/cmake/-/issues/21552</a></div><di=
v>Things break when zstd support is not available and CMake doesn&#39;t pro=
vide simple why to ask if the support is available.<br></div><div><br></div=
><div>Quote from cmake dev: <br></div><div>As far as CMake&#39;s design is =
concerned, we have no optional formats.  All should be supported. <br></div=
><div>That&#39;s why we bundle sufficiently new versions of libarchive and =
libzstd. <br></div><div> If a distro builds with an older libarchive that d=
oesn&#39;t have zstd support, then that is not a proper packaging of CMake.=
</div></div><div><br></div><div>For target/nativesdk CMake depends on libar=
chive for this support, which is covered in the second patch.<br></div><div=
><br></div><div>-samuli<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 13:07, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>You need to explain the benefit in doing so, I think? =
:)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 12:05, Sam=
uli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com" target=3D"_blank"=
>samuli.piippo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Now that zstd is in oe-core, enable support for it =
in native CMake.<br>
<br>
Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" ta=
rget=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> b/=
meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
index d91e42ef9a..335097d387 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require cmake.inc<br>
=C2=A0inherit native<br>
<br>
-DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native&quot;<br>
+DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native zstd-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://OEToolchainConfig.cmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://e=
nvironment.d-cmake.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-c=
make.sh</a> \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000a48b4505c325ce5e--
