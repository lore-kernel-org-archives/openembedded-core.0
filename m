Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web11.8528.1604909277483073942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d6CezU5F;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id h26so2522824uan.10
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2Xg+flh8t1qDjAa7Y/5VWNI3YFrM9JSJR07KMYYs+4=;
        b=d6CezU5FMOUEjxQDWS74bHnr0XU/PEOrM3gts+oWtvHQxY2BromU4COYblcslAhbPm
         72D8EBssOqhDbwkYOqXwaSGi93g/w71B6X8iuOBFyk6UBw+TIOlTXl+DgvwVWK1lYZR5
         7decTu1vJpcF+pZveKrm+7qGzxcdwKzcGXkVRwNDcgLvG1ztj1+sUh22jFOUmoLA2vS9
         IakXXjh53LJnNXA15s979hC70M5L75HD/ujPo30yQTtVuy7XpE9A07Br3AkzgK4qLVR5
         Me08wDs4eajvgBjDYyQ8/4USpDejuQ5VPRUTwU2VYiBOdfS26R3V+c66/CLLkT4malKZ
         zHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2Xg+flh8t1qDjAa7Y/5VWNI3YFrM9JSJR07KMYYs+4=;
        b=awAuV2vanzluu7F/wNC3a9qbWkFS6qwEEP0kHBE5YsWS1kwwoMYBgG1gtevaJh/toz
         M0tSMewRSD5NW7DtB2I9UwIF2Nx/kT2kKe8Z3B+Q5n1kxa3b8m4/wl2iPfmd9ZmusOAO
         s9q/jO86/TZxiucMYQNwCPE+pIMWiZLDPO4G8MnH+SoTz+zaW9D1pieDB7lDJGlUpDWb
         uNv796L38A5UzAOscZzxCfkk9VxhFTLW+O3fjlfE3jkJLg9ENkVwvfLAke29yYvoIRQu
         zCYQbIpAolQPCSbXshZVk2PBll7LJOBZgdtdkIia3/MjYByvxgT2lw0Hj45tMq8eNTQm
         u1vQ==
X-Gm-Message-State: AOAM533eS+V5qQtOUEoS7le8yudTkQvmp3h734JCvAeRuESkluorOAHV
	2eekkauB6AOES7uYyByvsdb9VNjH8pHZzlR4hzI=
X-Google-Smtp-Source: ABdhPJzZ96EivjKHQqAIhjno1UY+EKSohzi5OWjG2oLq+6/JDWNs4RI5a5udfFeSWWb77wHkWF5nkqISdjBjNNoxfT4=
X-Received: by 2002:ab0:20b0:: with SMTP id y16mr5557187ual.93.1604909276654;
 Mon, 09 Nov 2020 00:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com> <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com>
In-Reply-To: <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 9 Nov 2020 09:07:45 +0100
Message-ID: <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054f1b905b3a80f9a"

--00000000000054f1b905b3a80f9a
Content-Type: text/plain; charset="UTF-8"

Right, but then adding _remove to the upstream recipe doesn't seem right -
rather you should use _pn-webkitgtk override in your custom config.

Alex

On Mon, 9 Nov 2020 at 08:52, kai <kai.kang@windriver.com> wrote:

> On 11/9/20 3:32 PM, Alexander Kanavin wrote:
>
> This is not seen on the autobuilder, which does world builds on qemux86.
> Something might be wrong on your side?
>
> Just the option '-fno-omit-frame-pointer' which is not set by default. We
> have a build with an extra config in local.conf:
>
> SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"
>
> which expands to
>
> SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer
> -fvisibility=default"
>
> then it fails to compile webkitgtk. It could be reproduced with upper
> config line.
>
> Regards,
> Kai
>
>
>
>
> Alex
>
> On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com> wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to compile webkitgtk for qemux86 if compile option
>> '-fno-omit-frame-pointer' is applied:
>>
>> |
>> TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>>     Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
>> | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
>> |    47 | }
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>> b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>> index 1acba6be1d..11fdb59034 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>> @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>>  # which is not enough for binaries larger than 32 MiB
>>  CFLAGS_append_arc = " -mlong-calls"
>>  CXXFLAGS_append_arc = " -mlong-calls"
>> +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>>
>>  # Javascript JIT is not supported on powerpc
>>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>> --
>> 2.17.1
>>
>>
>>
>>
>>
>
>
> 
>
>

--00000000000054f1b905b3a80f9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, but then adding _remove to the upstream recipe=
 doesn&#39;t seem right - rather you should use _pn-webkitgtk override in y=
our custom config.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 9 Nov 202=
0 at 08:52, kai &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">

  
  <div>
    <div>On 11/9/20 3:32 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div>This is not seen on the autobuilder, which does world
          builds on qemux86. Something might be wrong on your side?</div>
      </div>
    </blockquote>
    <p>Just the option &#39;-fno-omit-frame-pointer&#39; which is not set =
by
      default. We have a build with an extra config in local.conf:</p>
    <p>SELECTED_OPTIMIZATION =3D &quot;${PROFILING_OPTIMIZATION}&quot;</p>
    <p>which expands to</p>
    <p>SELECTED_OPTIMIZATION =3D &quot;${FULL_OPTIMIZATION}
      -fno-omit-frame-pointer -fvisibility=3Ddefault&quot;<br>
    </p>
    <p>then it fails to compile webkitgtk. It could be reproduced with
      upper config line.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, 9 Nov 2020 at 01:32,
          kai &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_bla=
nk">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank">kai.kang@windriver.com</a>&gt;<br>
          <br>
          It fails to compile webkitgtk for qemux86 if compile option<br>
          &#39;-fno-omit-frame-pointer&#39; is applied:<br>
          <br>
          |
TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/=
webkitgtk-2.30.1/<br>
          =C2=A0 =C2=A0
          Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:<b=
r>
          | internal compiler error: in find_oldest_value_reg, at
          regcprop.c:438<br>
          |=C2=A0 =C2=A0 47 | }<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.=
2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a>
          | 1 +<br>
          =C2=A01 file changed, 1 insertion(+)<br>
          <br>
          diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgt=
k_2.30.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a>
          b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a><br>
          index 1acba6be1d..11fdb59034 100644<br>
          --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.=
2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a><br>
          +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.=
2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a><br>
          @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc =3D &quot;
          -DENABLE_JIT=3DOFF &quot;<br>
          =C2=A0# which is not enough for binaries larger than 32 MiB<br>
          =C2=A0CFLAGS_append_arc =3D &quot; -mlong-calls&quot;<br>
          =C2=A0CXXFLAGS_append_arc =3D &quot; -mlong-calls&quot;<br>
          +CXXFLAGS_remove_x86 =3D &quot;-fno-omit-frame-pointer&quot;<br>
          <br>
          =C2=A0# Javascript JIT is not supported on powerpc<br>
          =C2=A0EXTRA_OECMAKE_append_powerpc =3D &quot; -DENABLE_JIT=3DOFF=
 &quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <p><br>
    </p>
  </div>

<br>
<br>
<br>
</blockquote></div>

--00000000000054f1b905b3a80f9a--
