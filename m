Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721FAC61DD6
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 01:12:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10384.1788397927950474136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 18:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kMKPjkMM;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-86162c086f8so7818767b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788397927; cv=none;
        d=google.com; s=arc-20260327;
        b=eN4rfUojSSvf/J6MVul8J3On76dYh/WsP6vWBdiXsOaxM8MMcCreERtlBYuSdP99ft
         V5vXqvfdKI1P+4NuSt2UCya7z+DGjp1XDtENyjDK85OqNXUOS3ScFnOovtYYUmDtr0iS
         +eZNEao9CXyZQkfsX9u86na9lSqOh4qD9f8kRN6dtX6cJDaqXBvbQjggVYvbGg5eYHdz
         p4Sfoue+keltRx2fPSBK0afR9gQY4gLorWKnJgV+KT55Bwif9KNQtzD6IhtBnk8qN3jV
         E+R16VCBI5jizSZlkPde5lqo8lQhlCe6zL95IhnOJhZ8TBCjKxQtxjFrCIn/rtVe8kFN
         6XXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aYLHB1aXxRD5pEejHywWy/uIhIIeYB1kRtQEbtGyx7c=;
        fh=aFV7J8ngdfO0qf/7Exvg31KDr2OGL+G2lw9KMbsH+8g=;
        b=QmgcgFQaxlJ3VpqSTGJeGUHKhGW2kLSZ7W6E3NIfQ/esKftMy1j5oiPafdz7M2zNm7
         pVJxc0HNXgaU/HSpT1TRsGq1mIORzkMDW20UKPr0RlySsNhI5F+w2jhmxWxHqU03Zh7R
         p5zVpe7fHQsDU84Euvap1x9izDUQo7+sNMbEBQh2i4U3iTRpZP6TPZ2qZIHxr1OO4gMm
         2NieoE7OWSaLNPd3rrxplTtm+D2kQtYMvRDjt4QXgWkenIAmGzabDbDYZNZbPnVwDp+q
         MB2KybhqqJl5CG8W17outixycSN05epaqY9xnxAi9J2E0va5ATgHCTKl8LmMh6L5f+7/
         1yAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788397927; x=1789002727; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYLHB1aXxRD5pEejHywWy/uIhIIeYB1kRtQEbtGyx7c=;
        b=kMKPjkMMbMaIwIRVYkb3HHl9J88A2JTYfH9Xb7pCGC5BdmmVKeT/Dmo4MpA5tTA6Mv
         0rBYEGB1BEdo2JGUfCmEMPR2LoTB7rFRZdo51FpIkYRBBaWAPkjGIqM6B26HXbHrBUSR
         hVNHm9gdtnNVWGCpuW+uXyX7r2KqJ2cCakAxxjmnmX1Q59p/+FwJLBJzu7TEDNyLEage
         IPG7QHvWRu72ouKN6Ft+Dbvqx0l8utAueGZ8Q+n3E5xK57JVLBx7QV4NoLevQvIn8n8W
         zDNCTGqXcyeJnQLeCqSZZn4sIlQe1WbG1799laVMk+TpRWjoc3CdJZRVwRu4J2dhOccS
         xTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788397927; x=1789002727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYLHB1aXxRD5pEejHywWy/uIhIIeYB1kRtQEbtGyx7c=;
        b=p4yZpILgVSx8ztQM+z35Jpfzu/hpinsqnK40PmHogQZxCLZyubtx+2z9G/eKSTo8s+
         ykfbYFPfX7MsrIAvlP3ntjNjdyii8uMBTzBqzfOPheP/vPCyCQqhA4kTjXZsBoFpb5Zr
         1cmmf+/LQda6lnPjmjujDa2vqFmcYHnNjwbAXvjRW6MiHBPW1PloRPsazYzhWferxsOq
         2EXSdzM/r/Q7v7hYjFDnpW1OUl8YKV3B5KJr+lKLvrQnJy5Eai+A2h5lmvwhq97eU7Eo
         hTZAfQggugkvqc7yypqHzq15ZMdJTCNbqP9nzlHLgDT0x85zcrviDvMyeRu6NHAD4XoG
         Yi4g==
X-Gm-Message-State: AFuF++mEnTW/DAyxrKO4MX5WH+Wclb6OuA+02v9nyE+PqloN3IqN6KTe
	QXSA5zJWQkKaXqQb4EToc5gqz2j83tGFvHLgkeBvZ32wGdm6tqHfyOrwpOFp7lQD4/7MQEgCNqv
	M3Q1Ey3Amkfen4Fs2vBMVGeQ2S2yDRQ3tew==
X-Gm-Gg: AYBFou0P0b6Miu/nwN+fMjpF3uZRKS6t1FcvJcCHftpPYox6RLUstpzYGN5HZteBq6D
	bbhul4Jn5W9rEL3FBMjDx7gxrF24/e3z5NawO4/bHxhf/VbsF9Li7I4ZAFjkmUFjeUVugJisLjr
	ybNvtGw/GQqazzpdxhNv/Suwyd/LQ+Nz21krsqYyiL8mrW8K/IANK+uKuuWd1/zNek+USMOxdQ5
	jAIrp+mjutqVX8jWpZSpLY3t2wbAYQRBuncOag8ezsaSnaLzemGvZ8pnIBp6ALofFwgpt1GkwgX
	mNUGnV9E8IuzaxPgWi/EIfjCFuIZ4eYy8MXyuPw21HPqYxjMUatMN/FNG0wIfgfLSVuzXFEw8M1
	w+uNTlpVu4KImrVdlE22JPp3ftZYrWMwb/WAOMbdKW7UAKcZK4MghBY0kLvVFyeMXKTDnn5ZWks
	x376gL2o9PakeXll1HfvV8/oz/PrtqTY9ltQEJfWuCiDoIxTXEehZPFJoRMA5NXvhGM56N5NhNC
	0U/BilV46yyWEYvlXrFGmIA0A==
X-Received: by 2002:a05:690c:a84:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-86e6d7905ccmr15184337b3.5.1788397926882; Wed, 02 Sep 2026
 18:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
 <20260830125853.1139807-4-sunilkumar.dora@windriver.com> <CAMKF1srRX9QgGZQL9tTpr6HuOXTOPvM8X+CB08qC_WU0Bptp=A@mail.gmail.com>
 <09fa9968-aedb-427e-925a-1cb07d8cfe03@windriver.com>
In-Reply-To: <09fa9968-aedb-427e-925a-1cb07d8cfe03@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Sep 2026 18:11:38 -0700
X-Gm-Features: AcwNN1Vh7TRjMINJ-I-mrRC67prSkm-7U2K8DjySI_pyt6PerBs1nGPkvjo7H6w
Message-ID: <CAMKF1sr=hz7xqqB0Rx7fazO8r37Wm0bdBn27rZPrwRMOtOVMEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/11] openmp: Build via the LLVM runtimes entry point
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"deepesh.vatharaj@windriver.com" <deepesh.vatharaj@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000002624f6065a89d715"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 01:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244996

--0000000000002624f6065a89d715
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:33=E2=80=AFPM Dora, Sunil Kumar <
SunilKumar.Dora@windriver.com> wrote:

> On 8/31/2026 1:15 AM, Khem Raj via lists.openembedded.org wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> w=
rote:
>
>> From: Sunil Dora <sunilkumar.dora@windriver.com>
>>
>> LLVM 23 removed the standalone build mode for openmp, so do_configure
>> fails with
>>
>>   The legacy standalone build mode has been removed
>>
>> Configure it through the runtimes build with LLVM_ENABLE_RUNTIMES=3Dopen=
mp,
>> the same way libcxx is built.
>>
>> The runtimes build reads LLVM_LIBDIR_SUFFIX; nothing in LLVM 23 reads
>> OPENMP_LIBDIR_SUFFIX any more, so pass the standard variable like the
>> other clang-family recipes do. Without it openmp installs into lib/
>> while a multilib configuration packages lib64/, and do_package fails
>> with "installed but not shipped" for libomp.so, libarcher.so,
>> libompd.so and the cmake files.
>>
>> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>> ---
>>  meta/recipes-devtools/clang/openmp_git.bb | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/openmp_git.bb
>> b/meta/recipes-devtools/clang/openmp_git.bb
>> index 2ba83d48c6..90d4911623 100644
>> --- a/meta/recipes-devtools/clang/openmp_git.bb
>> +++ b/meta/recipes-devtools/clang/openmp_git.bb
>> @@ -18,10 +18,11 @@ inherit cmake pkgconfig python3targetconfig
>>  DEPENDS +=3D "elfutils libffi clang"
>>
>>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
>> -
>> -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
>> +                  -DLLVM_ENABLE_RUNTIMES=3Dopenmp \
>> +                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>>
>
>
>
> The recipe keeps PACKAGECONFIG ?=3D "ompt-tools offloading-plugin" =E2=80=
=94 under
> the runtimes entry point, does offloading-plugin still do anything, or
> would it now need offload added to LLVM_ENABLE_RUNTIMES?
>
> It doesn't do anything for the build, and it didn't with the old entry
> point either. It passes no cmake flags and the build depends
> are already in DEPENDS. So the only thing it really adds is the
> libelf/libffi RDEPENDS. Our libomp.so links only libc.
> The plugins that needed libffi/libelf moved out of openmp/ into offload/
> back in LLVM 19, so nothing here builds them.
> The openmp-libomptarget package is empty, no ipk gets written.
>
> I only checked oe-core, other layers may still use this option, you know
> that history better than me.
>
> OPENMP_ENABLE_LIBOMPTARGET still works though. It adds some hooks in
> libomp that look up libomptarget functions with dlsym at runtime.
> Default is ON on 64-bit, the recipe doesn't touch it, and it is the same
> with both entry points.
>
> To actually build the plugins we would need
> LLVM_ENABLE_RUNTIMES=3D"openmp;offload".
> That is a new library and new packaging, so I did not want to mix it into
> the upgrade.
>
> As a follow-up I can keep the PACKAGECONFIG as is, drop it with the empty
> package, or add offload as a new option.
> Which one do you prefer?
>

Latter is good to go IMO.


>
> Thanks,
> Sunil Dora
>
>
>
>>                "
>>
>> -OECMAKE_SOURCEPATH =3D "${S}/openmp"
>> +OECMAKE_SOURCEPATH =3D "${S}/runtimes"
>>
>>  PACKAGECONFIG ?=3D "ompt-tools offloading-plugin"
>>
>> --
>> 2.43.0
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244694): https://lists.openembedded.org/g/openembedde=
d-core/message/244694
> Mute This Topic: https://lists.openembedded.org/mt/120998125/8968818
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Su=
nilKumar.Dora@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>

--0000000000002624f6065a89d715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31,=
 2026 at 9:33=E2=80=AFPM Dora, Sunil Kumar &lt;<a href=3D"mailto:SunilKumar=
.Dora@windriver.com">SunilKumar.Dora@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>




<div>
<div>On 8/31/2026 1:15 AM, Khem Raj via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<strong></strong>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:rgb(25=
2,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,0)">CA=
UTION: This email comes from a non Wind River email account!</span><u></u><=
/strong><br>
<u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click links o=
r open attachments unless you recognize the sender and know the content is =
safe.</span><br>
<u></u></div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30, 2026 at 5:59=E2=80=AF=
AM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" target=3D"_blank">s=
unilkumar.dora@windriver.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" targe=
t=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
<br>
LLVM 23 removed the standalone build mode for openmp, so do_configure<br>
fails with<br>
<br>
=C2=A0 The legacy standalone build mode has been removed<br>
<br>
Configure it through the runtimes build with LLVM_ENABLE_RUNTIMES=3Dopenmp,=
<br>
the same way libcxx is built.<br>
<br>
The runtimes build reads LLVM_LIBDIR_SUFFIX; nothing in LLVM 23 reads<br>
OPENMP_LIBDIR_SUFFIX any more, so pass the standard variable like the<br>
other clang-family recipes do. Without it openmp installs into lib/<br>
while a multilib configuration packages lib64/, and do_package fails<br>
with &quot;installed but not shipped&quot; for libomp.so, libarcher.so,<br>
libompd.so and the cmake files.<br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a> | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">openmp_git.bb</a> b/meta/recipes-devtoo=
ls/clang/<a href=3D"http://openmp_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">openmp_git.bb</a><br>
index 2ba83d48c6..90d4911623 100644<br>
--- a/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a><br>
+++ b/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a><br>
@@ -18,10 +18,11 @@ inherit cmake pkgconfig python3targetconfig<br>
=C2=A0DEPENDS +=3D &quot;elfutils libffi clang&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOPENMP_LI=
BDIR_SUFFIX=3D${@d.getVar(&#39;baselib&#39;).replace(&#39;lib&#39;, &#39;&#=
39;)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_ENAB=
LE_RUNTIMES=3Dopenmp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_LIBD=
IR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \<br>
=C2=A0 =C2=A0</blockquote>
<div><br>
</div>
<div><br>
</div>
<div><span style=3D"background-color:transparent">The recipe keeps </span><=
code style=3D"background-color:transparent">PACKAGECONFIG ?=3D &quot;ompt-t=
ools offloading-plugin&quot;</code><span style=3D"background-color:transpar=
ent"> =E2=80=94 under the runtimes entry point, does
</span><code style=3D"background-color:transparent">offloading-plugin</code=
><span style=3D"background-color:transparent"> still do anything, or would =
it now need
</span><code style=3D"background-color:transparent">offload</code><span sty=
le=3D"background-color:transparent"> added to
</span><code style=3D"background-color:transparent">LLVM_ENABLE_RUNTIMES</c=
ode><span style=3D"background-color:transparent">?</span></div>
</div>
</div>
</div>
</blockquote>
It doesn&#39;t do anything for the build, and it didn&#39;t with the old en=
try point either. It passes no cmake flags and the build depends<br>
are already in DEPENDS. So the only thing it really adds is the libelf/libf=
fi RDEPENDS. Our libomp.so links only libc.=C2=A0<br>
The plugins that needed libffi/libelf moved out of openmp/ into offload/ ba=
ck in LLVM 19, so nothing here builds them.=C2=A0<br>
The openmp-libomptarget package is empty, no ipk gets written.=C2=A0<br>
<br>
I only checked oe-core, other layers may still use this option, you know th=
at history better than me.<br>
<br>
OPENMP_ENABLE_LIBOMPTARGET still works though. It adds some hooks in libomp=
 that look up libomptarget functions with dlsym at runtime.<br>
Default is ON on 64-bit, the recipe doesn&#39;t touch it, and it is the sam=
e with both entry points.<br>
<br>
To actually build the plugins we would need LLVM_ENABLE_RUNTIMES=3D&quot;op=
enmp;offload&quot;.=C2=A0<br>
That is a new library and new packaging, so I did not want to mix it into t=
he upgrade.=C2=A0<br>
<br>
As a follow-up I can keep the PACKAGECONFIG as is, drop it with the empty p=
ackage, or add offload as a new option.=C2=A0<br>
Which one do you prefer?<br></div></blockquote><div><br></div><div>Latter i=
s good to go IMO.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div>
<br>
Thanks,<br>
Sunil Dora<br>
<br>
<blockquote type=3D"cite">
<div>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-OECMAKE_SOURCEPATH =3D &quot;${S}/openmp&quot;<br>
+OECMAKE_SOURCEPATH =3D &quot;${S}/runtimes&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;ompt-tools offloading-plugin&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote>
</div>
</div>
</div>
<br>
<fieldset></fieldset>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#244694): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244694" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/244694</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120998125/896=
8818" target=3D"_blank">https://lists.openembedded.org/mt/120998125/8968818=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:SunilKumar.Dora@windriver.com" target=3D"_bla=
nk">SunilKumar.Dora@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p><br>
</p>
</div>

</blockquote></div></div>

--0000000000002624f6065a89d715--

