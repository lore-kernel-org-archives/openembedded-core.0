Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.5484.1605603590670438193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 00:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUwtAaEQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id u24so10645396vsl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 00:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=BHmUta/+otAXKpGz180mkBBfGEMRXjJFq5OPnei15SI=;
        b=DUwtAaEQOZazF8Yaw6aIZeiSC59c7ypXHBZfFRab7zZJa5g/5pGe2NX07nIyRB5lfL
         hfLMkzfKll2Y1WVL3dt7Rfs8yNrtSdyR7YdSkg3wWGtKOtWvEfUJ3vYPz70pbByBkGWr
         f3079QajO+dRa7beL4gwBndkCBww2lFAMDpxmqczZ8O89qFIENR70iAVSsvs4tOcSPgV
         cJqwUBWogIWK42gBOGajiMhNOtynJTnwdztj3m++SANSEDS/ONwcbRAwEUjh604CxHdD
         U72bHYxDnp+5zsa+Oe9MHa9Kl6kN5t5WjXzN5ifPPEvEK0w2RFjS6OiDDVPqoqOTNs7g
         cJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=BHmUta/+otAXKpGz180mkBBfGEMRXjJFq5OPnei15SI=;
        b=DRCW6j93EyPLytnDmGzCoV0qzocGrW0wwlmaD/4TVPYH8Ke1ryBAFGQiUzTVSsGMIA
         jAGfc6rEK2PhY0YU4ec9Cw4DWHvC2hZn+8Jcbqg23hZXhFurW+hHXJz585VXnwr1l+Ew
         qRmCJZRQNgMpNrpM7yLCX2WQxr/xkhrQ4d6Fr3uRmqcFGIYW4rzcc9i1QMKnU6aiSp2H
         mM2O+UEY9CVnLEcwpKzjxm1oamJCLMJfbUl6dDb0x7mDTuqTpfacGGaPaWnRNZxcJo1Z
         tOltPOtJcI8IbiS/i9grnNiZ7O6wyBWfEzxGyDsC8UxUdFaxuvz4rRbDMXGq6h+O3nLB
         jPng==
X-Gm-Message-State: AOAM531nF8mj7M136nDD4/UXHu5fBfdJB+wfGYg/vSv6OrYOsoSRqqIj
	YOaZ2QolyINPuMcZgSQaXxyJN5rLkLF2nqDWtLyeyjI9it8=
X-Google-Smtp-Source: ABdhPJweO2Fbksm/tOIL3Hf9yluy+6+wWTre9v/g7B+3lBfZMMEkaijQJ21mWYabtabZZRLyRt8Q55WaxPAwVQwuEVU=
X-Received: by 2002:a67:2f46:: with SMTP id v67mr2568867vsv.54.1605603589508;
 Tue, 17 Nov 2020 00:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <16483F9996935210.960@lists.openembedded.org>
In-Reply-To: <16483F9996935210.960@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2020 09:59:38 +0100
Message-ID: <CANNYZj-9_opd5iK0+GDHNOKiHMgt9=n=UBUxXD_N29kVnWXYSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009a52bf05b449b770"

--0000000000009a52bf05b449b770
Content-Type: text/plain; charset="UTF-8"

I think the correct fix here would be to fold python3-scons-native_bb into
the main recipe using BBCLASSEXTEND, so DEPENDS gets properly rewritten.

Alex

On Tue, 17 Nov 2020 at 09:53, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> This explanation does not seem right. The class only sets
>
> inherit python3native
> DEPENDS_append = " python3"
>
> which should not drag in target python when it is inherited from -native
> recipes, only python3-native.
>
> Alex
>
> On Tue, 17 Nov 2020 at 07:55, Khem Raj <raj.khem@gmail.com> wrote:
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
>> ---
>>  meta/classes/distutils3-base.bbclass | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/distutils3-base.bbclass
>> b/meta/classes/distutils3-base.bbclass
>> index a277d1c7bc..882db9f605 100644
>> --- a/meta/classes/distutils3-base.bbclass
>> +++ b/meta/classes/distutils3-base.bbclass
>> @@ -1,5 +1,4 @@
>>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
>> ""][(d.getVar('PACKAGES') == '')]}"
>>  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' ==
>> 'class-target']}"
>>
>> -inherit distutils-common-base python3native python3targetconfig
>> -
>> +inherit distutils-common-base python3native ${@['python3targetconfig',
>> '']['${CLASSOVERRIDE}' == 'class-target']}
>> --
>> 2.29.2
>>
>>
> 
>
>

--0000000000009a52bf05b449b770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the correct fix here would be to fold python3=
-scons-native_bb into the main recipe using BBCLASSEXTEND, so DEPENDS gets =
properly rewritten.</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2=
020 at 09:53, Alexander Kanavin via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>This explanation does not seem right. The class only sets <br></div><d=
iv><br></div><div>inherit python3native</div><div>DEPENDS_append =3D &quot;=
 python3&quot;</div><div><br></div><div>which should not drag in target pyt=
hon when it is inherited from -native recipes, only python3-native.</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2020 at 07:55, Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">p=
ython3targetconfig append target python3 to dependencies<br>
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
</blockquote></div>

--0000000000009a52bf05b449b770--
