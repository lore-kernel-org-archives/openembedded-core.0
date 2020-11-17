Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.10760.1605631360273550007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IGDwQu6z;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f23so30409866ejk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ZirpeDE6mmJO/fchagjOsaVG0WqrnFggIacUwvLmLo=;
        b=IGDwQu6zRh/neDvgS0F11BBMVN+Fu/vdFRo9MgLvlMoeQ6s2vsRfgdIpyl5o5hhM9Z
         TZJR56hxH8C2IZKY2JB6ZlmkEpZOOgrMo99obOeu2wWi2/Q7Vh+IgpIx4P/NB/0srlsA
         OfTifcUaTA7oGz1Sn/B5/vid9tn6FQbzcAyifdfTbJyQei5DxlKCOR4HVfLfRofPIXXv
         M7vywBfENl+6bmd6GO16o9BicHr59VqRmdTu3G+7RO0wjXqloDaXrTiIyfXPMiCA8Hh0
         T/L5mP4xBPQwdvd9FnPAdClJkaUaGf/8m60Eq4iI157GLg7CwXUXqWPZYtWfdHht9FkI
         CVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ZirpeDE6mmJO/fchagjOsaVG0WqrnFggIacUwvLmLo=;
        b=YZ2x5HiB2WjuPp3BO2uW2WZMgBJKUUZNu7fx18lw5k+uaaCRdk3JaCmkJBTQD5Yg8j
         wDNd4qeXlzKIhZar8qq1GnuLxR9fYFVsTuHlXhKI6+J3sc1gXncqwCKvBB0OXBEmip4T
         u8p4f5LMowOETBvWBKKOaDj+qnT2DH22saRzV/JmsICXPyQIW36/GwWKaCrx7Ga0gMaQ
         r0oXrbmAUn6vkUzidjYg2fW2/J+ggr2zYuIPODVq1MFjtwji8kvgsxSLOFWYju80jIiZ
         pACQ1JPmT58qNnQT1B6dfZeoSag0FCgOx+fxO4WLQXzXpmcWoXSXja2/zO8PnKzKdZ2a
         wtGA==
X-Gm-Message-State: AOAM533DpUq+VTJQxYVfU8d+tELoWGZDbFJlvgZE48OAJy/Cvn1wKj3K
	jISnOPDkz85tTibUbxMQLVd1sgftbbbrpTAxwZs=
X-Google-Smtp-Source: ABdhPJxppgZfBOIhQNHziDMSZCCbq97VvirrKzeQln0tbNvUH5/9RMAOyg7HxC66SFcU4Z5rrQJ3VbN3Uzlxa+8uhAI=
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr20013758ejw.94.1605631358736;
 Tue, 17 Nov 2020 08:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20201117153436.3701771-1-raj.khem@gmail.com> <CA+chaQej+epYOHFh4T_07WwMGA5Rof4ubkEEhFHxKDX2fAYppw@mail.gmail.com>
In-Reply-To: <CA+chaQej+epYOHFh4T_07WwMGA5Rof4ubkEEhFHxKDX2fAYppw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 17:42:27 +0100
Message-ID: <CA+chaQeFfTaMPwsSWwztk+LLyM9L7Dq+KorJ3Jzavq0rfd1+TQ@mail.gmail.com>
Subject: Re: [PATCH] python3targetconfig.bbclass: Add py3 dependecy only for target recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c71d8705b4502e21"

--000000000000c71d8705b4502e21
Content-Type: text/plain; charset="UTF-8"

Errm, I meant:

EXTRA_PYTHON_DEPENDS ?= ""
EXTRA_PYTHON_DEPENDS_class-target = "python3"
DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"

On Tue, Nov 17, 2020 at 5:41 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Do we need to export _PYTHON_SYSCONFIGDATA_NAME for non-target cases?
>
> And instead of:
> DEPENDS_append = "${@['', ' python3']['${CLASSOVERRIDE}' ==
> 'class-target']}"
>
> I would use intermediate variable like
> EXTRA_PYTHON_DEPENDS = "python3"
> EXTRA_PYTHON_DEPENDS_class-target = ""
> DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"
>
> I know it's just personal preference, but in this case with small benefit
> to undo the append if you really don't want it added for some mysterious
> reason.
>
> On Tue, Nov 17, 2020 at 4:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> python3targetconfig append target python3 to dependencies
>> unconditionally, and here its inherited unconditionally too but
>> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
>> not-target
>> recipes as well. Hence the change added via
>> 9c8f666097802cb594a759989edcf01603a22df3
>> is now bridging the native dependencies with target python3 and thats
>> resulting all sorts of rebuilds for multimachine builds e.g.
>>
>> MACHINE=qemuarm bitbake python3-scons-native
>> MACHINE=qemumips bitbake python3-scons-native
>>
>> results in rebuilds for python3-scons-native
>>
>> bitbake-diffsigs shows
>>
>> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot
>> changed from
>> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
>> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>> 0e3b97bd058d162065
>>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install
>> changed from
>> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
>> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>> 229cb0f5ebb11
>>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile
>> changed from
>> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
>> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>> 7cc9769194c43eae1
>>             Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure
>> changed from
>> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
>> a366982778b03eee5165c3117ee778f848acdfaa2
>> b346650fbdf114ac70ab57b
>>                 Hash for dependent task
>> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed
>> from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
>> 474333fb565f908992fd3716
>> 4935aaecf31a79e867826fe634cde4f44171d8e7
>>                     Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot
>> changed from
>> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
>> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>> 08777e46a6fa6e417c0445018
>>
>> ...
>>
>> Therefore limit inheriting this class only for target recipes.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>> Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> v2: Mark depends conditional instead
>>
>>  meta/classes/python3targetconfig.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/python3targetconfig.bbclass
>> b/meta/classes/python3targetconfig.bbclass
>> index 640d0c97b6..b79ec211c7 100644
>> --- a/meta/classes/python3targetconfig.bbclass
>> +++ b/meta/classes/python3targetconfig.bbclass
>> @@ -1,6 +1,6 @@
>>  inherit python3native
>>
>> -DEPENDS_append = " python3"
>> +DEPENDS_append = "${@['', ' python3']['${CLASSOVERRIDE}' ==
>> 'class-target']}"
>>
>>  do_configure_prepend() {
>>          export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
>> --
>> 2.29.2
>>
>>

--000000000000c71d8705b4502e21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Errm, I meant:<div><br></div><div><div>EXTRA_PYTHON_DEPEND=
S ?=3D &quot;&quot;</div><div>EXTRA_PYTHON_DEPENDS_class-target =3D &quot;p=
ython3&quot;<br></div><div>DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS=
}&quot;</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Nov 17, 2020 at 5:41 PM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">D=
o we need to export _PYTHON_SYSCONFIGDATA_NAME for non-target cases?<div><b=
r></div><div>And instead of:</div><div>DEPENDS_append =3D &quot;${@[&#39;&#=
39;, &#39; python3&#39;][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-targe=
t&#39;]}&quot;<br></div><div><br></div><div>I would use intermediate variab=
le like</div><div>EXTRA_PYTHON_DEPENDS =3D &quot;python3&quot;</div><div>EX=
TRA_PYTHON_DEPENDS_class-target =3D &quot;&quot;<br></div><div>DEPENDS_appe=
nd =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;</div><div><br></div><div>I know=
 it&#39;s just personal preference, but in this case with small benefit to =
undo the append if you really don&#39;t want it added for some mysterious r=
eason.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Nov 17, 2020 at 4:34 PM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">python3targetconfig=
 append target python3 to dependencies<br>
unconditionally, and here its inherited unconditionally too but<br>
distutils3-base is inherited in BBCLASSEXTEND&#39;ed recipes and other not-=
target<br>
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01=
603a22df3<br>
is now bridging the native dependencies with target python3 and thats<br>
resulting all sorts of rebuilds for multimachine builds e.g.<br>
<br>
MACHINE=3Dqemuarm bitbake python3-scons-native<br>
MACHINE=3Dqemumips bitbake python3-scons-native<br>
<br>
results in rebuilds for python3-scons-native<br>
<br>
bitbake-diffsigs shows<br>
<br>
Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sy=
sroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f=
73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897<br>
0e3b97bd058d162065<br>
=C2=A0 =C2=A0 Hash for dependent task python/python3-scons-native_3.1.2.bb:=
do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4=
fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156<br>
229cb0f5ebb11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/python3-scons-na=
tive_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb626=
08a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837=
dac<br>
7cc9769194c43eae1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/py=
thon3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7=
368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee7=
78f848acdfaa2<br>
b346650fbdf114ac70ab57b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent =
task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed=
 from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 4=
74333fb565f908992fd3716<br>
4935aaecf31a79e867826fe634cde4f44171d8e7<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash =
for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from=
 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe=
74a95af19cce8df7c29311cc5edbbf6ad<br>
08777e46a6fa6e417c0445018<br>
<br>
...<br>
<br>
Therefore limit inheriting this class only for target recipes.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
v2: Mark depends conditional instead<br>
<br>
=C2=A0meta/classes/python3targetconfig.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python=
3targetconfig.bbclass<br>
index 640d0c97b6..b79ec211c7 100644<br>
--- a/meta/classes/python3targetconfig.bbclass<br>
+++ b/meta/classes/python3targetconfig.bbclass<br>
@@ -1,6 +1,6 @@<br>
=C2=A0inherit python3native<br>
<br>
-DEPENDS_append =3D &quot; python3&quot;<br>
+DEPENDS_append =3D &quot;${@[&#39;&#39;, &#39; python3&#39;][&#39;${CLASSO=
VERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export _PYTHON_SYSCONFIGDATA_NAME=3D&quot=
;_sysconfigdata&quot;<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000c71d8705b4502e21--
