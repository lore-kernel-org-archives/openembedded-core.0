Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.5622.1605604744832626363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 01:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D180eJM4;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id f7so10668111vsh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 01:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xC83DaDKConaTbbmnL7SESx9UH5kCviMRtXrAqQhAc8=;
        b=D180eJM4KsrLjbhv67C5XwD/3GFxyzFJLEGMKHgdvH8MvKeCOUGavZCrWncsBOX706
         Tx82xphjfj/0lE91jF3cJfdXdwB734dQ+L3HwQ3l63p87GTAiebeXB/BS1/OUynfrD6E
         Kb69/mbb6v/ZcAF1zzeJwiI0HYkZKsuYwp1cObq5M1cBg7oig5tGmZOPFyhwffX6kFSL
         G2Zec1H9hfUWYeDV7SFoZMhfnlQwaQ1ywDGX0bwtTRnlMWQLsUOzJWXoStEhGlCVoQ+y
         aRE3KrrpZLNdJFd+V+zcWHciKb+SFv2dL0viP9lRMlJ/LVL/WVBjsBx4++Mq2ql10LU5
         qW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xC83DaDKConaTbbmnL7SESx9UH5kCviMRtXrAqQhAc8=;
        b=f+4cOfOLSiGAXJ7uoQYW5lLWPBuHE9DuoiHCrkaCBxNuh8CdIiyrpoKWoLfC8SLUSU
         Xz9EYXKmvkaCwtLSm3tnqWd9PGVdSYvjXJLFxe3cvK6pt1KAs10z3sH/8B8KanBdllFF
         /ROQhWOu0CwzeIIfzTApu/DGmBOI4EudOr9eehneB6i1H8dNKbWdifYTSlDITfOzCvJU
         v+moPx2lGxCz/RlhxMiy78valS+2SlTblgwGIMdjstYVlgji9ZPk/769hrmGD/ybQDq3
         1cm+yCM3d1uMmoSuKDkbi3LjQ/gJLd3FtYY07TwtDgCaDu2l7zuusxhta/MDeTZe5Iwv
         uP+Q==
X-Gm-Message-State: AOAM530RBqfoc8T4E0JqX8T/KQAHP7qWj0UvnTzfWXdls4JlWPN7A596
	uan7cQFQcTdKjLh8zieQPwKWZBI+xmINF4dZCww=
X-Google-Smtp-Source: ABdhPJz+Zp1Z/maikagsXlgozpZmqUBXoFfD90qgKodDsrS56OSemxcVOibGRaC3H+GY6oL3fJE+j3kvamMIK+lvPHA=
X-Received: by 2002:a05:6102:3222:: with SMTP id x2mr9831185vsf.20.1605604743936;
 Tue, 17 Nov 2020 01:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
In-Reply-To: <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2020 10:18:52 +0100
Message-ID: <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000697de705b449fc6c"

--000000000000697de705b449fc6c
Content-Type: text/plain; charset="UTF-8"

Yes - and if python3-scons-native is the only such recipe we can find, I
think it's better to merge the recipe with the target one.

Alex

On Tue, 17 Nov 2020 at 10:12, Martin Jansa <martin.jansa@gmail.com> wrote:

> You mean that in BBCLASSEXTEND'ed recipes mentioned in the explanation it
> should work and only the recipes which directly inherit native, like
> meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
> are broken?
>
> On Tue, Nov 17, 2020 at 9:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> This explanation does not seem right. The class only sets
>>
>> inherit python3native
>> DEPENDS_append = " python3"
>>
>> which should not drag in target python when it is inherited from -native
>> recipes, only python3-native.
>>
>> Alex
>>
>> On Tue, 17 Nov 2020 at 07:55, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> python3targetconfig append target python3 to dependencies
>>> unconditionally, and here its inherited unconditionally too but
>>> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
>>> not-target
>>> recipes as well. Hence the change added via
>>> 9c8f666097802cb594a759989edcf01603a22df3
>>> is now bridging the native dependencies with target python3 and thats
>>> resulting all sorts of rebuilds for multimachine builds e.g.
>>>
>>> MACHINE=qemuarm bitbake python3-scons-native
>>> MACHINE=qemumips bitbake python3-scons-native
>>>
>>> results in rebuilds for python3-scons-native
>>>
>>> bitbake-diffsigs shows
>>>
>>> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot
>>> changed from
>>> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
>>> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>>> 0e3b97bd058d162065
>>>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install
>>> changed from
>>> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
>>> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>>> 229cb0f5ebb11
>>>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile
>>> changed from
>>> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
>>> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>>> 7cc9769194c43eae1
>>>             Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure
>>> changed from
>>> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
>>> a366982778b03eee5165c3117ee778f848acdfaa2
>>> b346650fbdf114ac70ab57b
>>>                 Hash for dependent task
>>> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed
>>> from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
>>> 474333fb565f908992fd3716
>>> 4935aaecf31a79e867826fe634cde4f44171d8e7
>>>                     Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot
>>> changed from
>>> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
>>> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>>> 08777e46a6fa6e417c0445018
>>>
>>> ...
>>>
>>> Therefore limit inheriting this class only for target recipes.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>  meta/classes/distutils3-base.bbclass | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/distutils3-base.bbclass
>>> b/meta/classes/distutils3-base.bbclass
>>> index a277d1c7bc..882db9f605 100644
>>> --- a/meta/classes/distutils3-base.bbclass
>>> +++ b/meta/classes/distutils3-base.bbclass
>>> @@ -1,5 +1,4 @@
>>>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
>>> ""][(d.getVar('PACKAGES') == '')]}"
>>>  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' ==
>>> 'class-target']}"
>>>
>>> -inherit distutils-common-base python3native python3targetconfig
>>> -
>>> +inherit distutils-common-base python3native ${@['python3targetconfig',
>>> '']['${CLASSOVERRIDE}' == 'class-target']}
>>> --
>>> 2.29.2
>>>
>>>
>> 
>>
>>

--000000000000697de705b449fc6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes - and if python3-scons-native is the only such re=
cipe we can find, I think it&#39;s better to merge the recipe with the targ=
et one.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2020 at 10:12=
, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div>You mean that in BBCLASSEXTEND&#39;ed recipes=
 mentioned in the explanation it should work and only the recipes which dir=
ectly inherit native, like</div><div dir=3D"ltr">meta/recipes-devtools/pyth=
on/<a href=3D"http://python3-scons-native_3.1.2.bb" target=3D"_blank">pytho=
n3-scons-native_3.1.2.bb</a><br></div><div>are broken?</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 202=
0 at 9:53 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This explan=
ation does not seem right. The class only sets <br></div><div><br></div><di=
v>inherit python3native</div><div>DEPENDS_append =3D &quot; python3&quot;</=
div><div><br></div><div>which should not drag in target python when it is i=
nherited from -native recipes, only python3-native.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Tue, 17 Nov 2020 at 07:55, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">python3targetcon=
fig append target python3 to dependencies<br>
unconditionally, and here its inherited unconditionally too but<br>
distutils3-base is inherited in BBCLASSEXTEND&#39;ed recipes and other not=
-target<br>
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf0=
1603a22df3<br>
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
Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_s=
ysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153=
f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897<br>
0e3b97bd058d162065<br>
=C2=A0 =C2=A0 Hash for dependent task python/python3-scons-native_3.1.2.bb=
:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb=
4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156<br>
229cb0f5ebb11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/python3-scons-n=
ative_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62=
608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe83=
7dac<br>
7cc9769194c43eae1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/p=
ython3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e=
7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee=
778f848acdfaa2<br>
b346650fbdf114ac70ab57b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent=
 task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot change=
d from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to =
474333fb565f908992fd3716<br>
4935aaecf31a79e867826fe634cde4f44171d8e7<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash=
 for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed fro=
m 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcf=
e74a95af19cce8df7c29311cc5edbbf6ad<br>
08777e46a6fa6e417c0445018<br>
<br>
...<br>
<br>
Therefore limit inheriting this class only for target recipes.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/distutils3-base.bbclass | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils=
3-base.bbclass<br>
index a277d1c7bc..882db9f605 100644<br>
--- a/meta/classes/distutils3-base.bbclass<br>
+++ b/meta/classes/distutils3-base.bbclass<br>
@@ -1,5 +1,4 @@<br>
=C2=A0DEPENDS=C2=A0 +=3D &quot;${@[&quot;${PYTHON_PN}-native ${PYTHON_PN}&=
quot;, &quot;&quot;][(d.getVar(&#39;PACKAGES&#39;) =3D=3D &#39;&#39;)]}&quo=
t;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;, &#39;${PYTHON_PN}-core&#39=
;][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
<br>
-inherit distutils-common-base python3native python3targetconfig<br>
-<br>
+inherit distutils-common-base python3native ${@[&#39;python3targetconfig&=
#39;, &#39;&#39;][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]=
}<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000697de705b449fc6c--
