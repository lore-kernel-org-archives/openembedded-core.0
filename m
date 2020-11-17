Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web08.5463.1605604349655839501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 01:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjb91to8;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id f20so28401518ejz.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eb6X+Y7PINoipIuFXf+r7y84Y6BqTv72Y7GERYhSd0E=;
        b=tjb91to8iddnBZqHkPGKSwgSwHudKFRwo4F54Q57ch4c/lfJPbMbMFTghTQL0FZHQ+
         E7RfeX5Q7PrmeHmzeYPsLss+yGM2dtmEy39J72aP4IAzfyBROZeU5G9vVM0BZBG3t6zP
         +SBAVmJWiEXIgh27ZYodUCB+sq+TiI0jqxRVUaSfdNt1U+CCwA61iy/LDgb9PbaUho4u
         8RO4OwvACN4+GVYEjF3sNMaIt/VmdJyk1Ucqw0ZmjfhP8hy725cWv4V8pt3hnN7chliJ
         lVwMI+vSjeJlf4G1ROVdOYELEJi3H/1nDJXX6GjfB2a4liT8CKU+YWumwJvPZ1G1RnRq
         skqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eb6X+Y7PINoipIuFXf+r7y84Y6BqTv72Y7GERYhSd0E=;
        b=b2p+7/Gnd23meDSvnoUA9DZKwKEuLfTgg6hwIl8vlKuh4zS1gAvnw/3AjLTb/XGnJH
         YWk0T1EJMz3wlQPtsqRezhN60vMMaFyHfVcVp/OskRFb0IVLvBswGCq+t8/mQXGc/kpP
         joj7xRXPQpYwSvuKoEvIqz4hbvV/6VvagDFZDlBCP6K6GtRas1J+6Wb7wy7eJErIeJuN
         cKWzj5Yqy+sp/FaS2x2+8HF8QGgfD665zbU3eVj1HxvQk61y3SDafDSTzKhiahAfiQVr
         ncimGMKPxkiZ1RkmKXZK1AbEK7LXSyby1vMIRcFLU+ObYqPDFAdogBG7pFrzX/M/4y6I
         XhXg==
X-Gm-Message-State: AOAM533XB8kh6w+94MPv/Z4slQyrZAVyXryjhqPsVcGhKWx0sXUpkNxv
	4L4/E4884ei909K+N8WDCx/mUvi4zDX0v1anChg=
X-Google-Smtp-Source: ABdhPJx1/XMAjbdZjU5GS3rkPqY7QDmLfLLgjBUuV7R5RCpT5t/7O69ty+ziNGqpY24QmZ0elQn/wrA7z8PI24zK4OU=
X-Received: by 2002:a17:906:b255:: with SMTP id ce21mr19108257ejb.137.1605604348098;
 Tue, 17 Nov 2020 01:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
In-Reply-To: <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 10:12:16 +0100
Message-ID: <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d17ea005b449e4f4"

--000000000000d17ea005b449e4f4
Content-Type: text/plain; charset="UTF-8"

You mean that in BBCLASSEXTEND'ed recipes mentioned in the explanation it
should work and only the recipes which directly inherit native, like
meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
are broken?

On Tue, Nov 17, 2020 at 9:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

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

--000000000000d17ea005b449e4f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You mean that in BBCLASSEXTEND&#39;ed recipes mention=
ed in the explanation it should work and only the recipes which directly in=
herit native, like</div><div dir=3D"ltr">meta/recipes-devtools/python/<a hr=
ef=3D"http://python3-scons-native_3.1.2.bb">python3-scons-native_3.1.2.bb</=
a><br></div><div>are broken?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 9:53 AM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div>This explanation does not seem right. The class only s=
ets <br></div><div><br></div><div>inherit python3native</div><div>DEPENDS_a=
ppend =3D &quot; python3&quot;</div><div><br></div><div>which should not dr=
ag in target python when it is inherited from -native recipes, only python3=
-native.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2020 at 07:5=
5, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">python3targetconfig append target python3 to dependencies<br=
>
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

--000000000000d17ea005b449e4f4--
