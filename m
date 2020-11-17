Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.5375.1605603195732388314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 00:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oMpbz4hd;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id u7so10626721vsq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 00:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6Hh34vmUNh2vzSjNyhEb617cinIyXagodZwfCW0B7w=;
        b=oMpbz4hd9a0SwqEvlYBJ3mtoEICplj1fzSwRPf+eww0iWMMX+0f4wAlb46sz+rFtAs
         uBoXLO3i/TZp/A0ZViJK53dg2dE7asiQjSvpj2mcKIsJzkzpb8byw9+7yCaEdTDnJ992
         r6Hk8cTLP/euhi3MEBwvkuPqLs8DNOxVjMOW/sT32Y8mQ3bFUNgr2sK6xcVuvQuMwaX/
         PqJaSpE6EiAhEplKv4PjFhhUYpJq1qreQ/THYNsBtmoiLm7m7T7sbSkyNpX8BaHgm2Fz
         ZS2i4fuApAxbtJEcW7M4ZnyzkteCHw8pgQ+H5ABj3S9eOVE0m8i6R8B535AvZGmssDHA
         9EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6Hh34vmUNh2vzSjNyhEb617cinIyXagodZwfCW0B7w=;
        b=nKEb7lOReSKuSBzMVrF0syn/AymwB6hY/fcIK5EC+SXkfhW2NglTsyYs/Fyb0Ein/L
         56uGfCxAIOVRkzYGf16DhnBTplP8NPR7COixRqdAGg+ylqVvHokd39j4oTP2kGiBBr3U
         +uyf9+GK3cE/1chPm7vWdthsIO4ODGucMmSgy4y+fwzduPlhq9m6c3SwLL4OvJ2OlpJ/
         5gJvQ8TkPomNaDy57dridis47rVKpi5TDOAu4KgV1GPWj2JmF7F5HRxHKdUe6uCPKewp
         jpkk7gwEF9b8f5NkGypMVhc8T+4JwWoWypQY9VChWzFMcVxtq7BJ/spk11mhHAkNVZsn
         0EmA==
X-Gm-Message-State: AOAM532v/QkMnULoGnVlHJ3hSkVa+hHuQ7dVSx37lOsT5ex+Ji3358Ui
	A+oG/uK2/OptHGgaKI3ymJIP/9BW8zg7IUALPf8=
X-Google-Smtp-Source: ABdhPJzTPc1yeXYQ7rrK5hRHPsvA4RYYL2Z45hyPPnAhexx+aehjNTJ7AOMQjFPkomihIOFZ8E6q2Pyb/uJxOaDdsfk=
X-Received: by 2002:a67:2f46:: with SMTP id v67mr2561554vsv.54.1605603194828;
 Tue, 17 Nov 2020 00:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com>
In-Reply-To: <20201117065508.1575532-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2020 09:53:03 +0100
Message-ID: <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
Subject: Re: [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000013fd5d05b449a016"

--00000000000013fd5d05b449a016
Content-Type: text/plain; charset="UTF-8"

This explanation does not seem right. The class only sets

inherit python3native
DEPENDS_append = " python3"

which should not drag in target python when it is inherited from -native
recipes, only python3-native.

Alex

On Tue, 17 Nov 2020 at 07:55, Khem Raj <raj.khem@gmail.com> wrote:

> python3targetconfig append target python3 to dependencies
> unconditionally, and here its inherited unconditionally too but
> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
> not-target
> recipes as well. Hence the change added via
> 9c8f666097802cb594a759989edcf01603a22df3
> is now bridging the native dependencies with target python3 and thats
> resulting all sorts of rebuilds for multimachine builds e.g.
>
> MACHINE=qemuarm bitbake python3-scons-native
> MACHINE=qemumips bitbake python3-scons-native
>
> results in rebuilds for python3-scons-native
>
> bitbake-diffsigs shows
>
> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot
> changed from
> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
> 0e3b97bd058d162065
>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install
> changed from
> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
> 229cb0f5ebb11
>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile
> changed from
> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
> 7cc9769194c43eae1
>             Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure
> changed from
> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
> a366982778b03eee5165c3117ee778f848acdfaa2
> b346650fbdf114ac70ab57b
>                 Hash for dependent task
> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed
> from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
> 474333fb565f908992fd3716
> 4935aaecf31a79e867826fe634cde4f44171d8e7
>                     Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot
> changed from
> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
> 08777e46a6fa6e417c0445018
>
> ...
>
> Therefore limit inheriting this class only for target recipes.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/distutils3-base.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/distutils3-base.bbclass
> b/meta/classes/distutils3-base.bbclass
> index a277d1c7bc..882db9f605 100644
> --- a/meta/classes/distutils3-base.bbclass
> +++ b/meta/classes/distutils3-base.bbclass
> @@ -1,5 +1,4 @@
>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
> ""][(d.getVar('PACKAGES') == '')]}"
>  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' ==
> 'class-target']}"
>
> -inherit distutils-common-base python3native python3targetconfig
> -
> +inherit distutils-common-base python3native ${@['python3targetconfig',
> '']['${CLASSOVERRIDE}' == 'class-target']}
> --
> 2.29.2
>
>

--00000000000013fd5d05b449a016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This explanation does not seem right. The class only =
sets <br></div><div><br></div><div>inherit python3native</div><div>DEPENDS_=
append =3D &quot; python3&quot;</div><div><br></div><div>which should not d=
rag in target python when it is inherited from -native recipes, only python=
3-native.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2020 at 07:=
55, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">py=
thon3targetconfig append target python3 to dependencies<br>
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
---<br>
=C2=A0meta/classes/distutils3-base.bbclass | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3=
-base.bbclass<br>
index a277d1c7bc..882db9f605 100644<br>
--- a/meta/classes/distutils3-base.bbclass<br>
+++ b/meta/classes/distutils3-base.bbclass<br>
@@ -1,5 +1,4 @@<br>
=C2=A0DEPENDS=C2=A0 +=3D &quot;${@[&quot;${PYTHON_PN}-native ${PYTHON_PN}&q=
uot;, &quot;&quot;][(d.getVar(&#39;PACKAGES&#39;) =3D=3D &#39;&#39;)]}&quot=
;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;, &#39;${PYTHON_PN}-core&#39;=
][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
<br>
-inherit distutils-common-base python3native python3targetconfig<br>
-<br>
+inherit distutils-common-base python3native ${@[&#39;python3targetconfig&#=
39;, &#39;&#39;][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]}=
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div>

--00000000000013fd5d05b449a016--
