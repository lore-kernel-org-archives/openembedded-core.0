Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7FCE7849A
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:25:10 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.78336.1696242309389142800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 03:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJECHZaX;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4527d65354bso7284390137.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696242308; x=1696847108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c5Dz52D3LDN05oNuPAT7lMWIQX0/nR1WWgmvjJ8Mb1s=;
        b=fJECHZaXW2giPIbHxrc90DV3Y57CKYOxQVP0gpJfNrCUiqYPOokRg/jMllCgv+1KJp
         rUF95r+3Kz69nT57wI7GRvXSnsQA5JFn1KNIPZ0iFCxxcB1gOnjKCTDqo1qn60j6r2n/
         ZkDsJbPnULafqEDKcM4YTXfHXflBitZhjxdjKqouB5unfdye0Y2/cAMJnuSj6US3rrZT
         47/HdbRXAA4Pa65viYgYxCKaTQBkE9wc/d3wSWzHpCheKpdKySfCsVmkvZaNiv+ZRmAV
         xlIfEwbcoBUS5ZNdjtieRIIu8h36e+pPsroBtDKsvRaOYEGGhc+ko0UB+JZR2l+oZ2WW
         8LrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696242308; x=1696847108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5Dz52D3LDN05oNuPAT7lMWIQX0/nR1WWgmvjJ8Mb1s=;
        b=dd66SkpZwqlu7YBcRSEvtQvnTTnhGDrSzuGtbXMN6o3dmMepFOPegvy0d5JPPCGaaB
         qnJn6npnQYDN4A58IJNBJfvoG/CPgLhQp7Fb+ujL6jmcMkzkSduSatgBjBcrgOSQPYER
         CHIwaLq1UJyRRTxBBJhVGgL6JHqhh9sGp9eSg/YGfBvGsyZca986jIPkRTYgpl1U5bHc
         BbX5prIYAicIf+ivhkezIJA4mGEn2IEBuJ85UDwH+MY3GithrKIn2S65YFnPqLzre3jC
         9ttRNOtcXHYRENA2bIII8U9XpzI3/KpH1IqHL9vkXsPiia7V9+VrPvtrlbe/Otdi2IXT
         feDA==
X-Gm-Message-State: AOJu0YznjbBgekMQxiu4d25ADMejmVkVFCrifqNEGFl89r7s2ER+AEpv
	lP98fofU0v+sNsBpeOfIcnYLw5cQRIFsSCQO9cI=
X-Google-Smtp-Source: AGHT+IEQ/ib1lKZV7blLmX2cbPzApHjqlTaoJfAIhoWGZaUSq89NG85Nsa5T2UwS2IDtrsFUqh1HlnEmFyRKXhwMWBA=
X-Received: by 2002:a67:f6d0:0:b0:454:2d1e:6ced with SMTP id
 v16-20020a67f6d0000000b004542d1e6cedmr8781660vso.27.1696242306805; Mon, 02
 Oct 2023 03:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org> <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
In-Reply-To: <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 2 Oct 2023 11:24:55 +0100
Message-ID: <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Julien Stephan <jstephan@baylibre.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000267c1f0606b93045"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 10:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188597

--000000000000267c1f0606b93045
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Julien Stephan <jstephan@baylibre.com> escreveu no dia s=C3=A1bado, 30/09/2=
023
=C3=A0(s) 15:13:

> Le mer. 27 sept. 2023 =C3=A0 23:17, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >
> > On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:
> > > Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > > >
> > > > Hello,
> > > >
> > > > I had a build were all the tests passed, then I had this failure:
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/st=
eps/14/logs/stdio
> > > >
> > >
> > > Hi Alexandre,
> > > I only see
> > >
> > >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> > >
> > > but I can't see the actual error :( Is it possible to have it
> somewhere?
> >
> > I am a bit worried this will be hard to reproduce/debug so I had a look
> > at things as I do really want to get things resolved.
> >
> > The error log says:
> >
> > WARNING: The quilt:do_build sig is computed to be
> 255536826e64d835fcc6b5a277e9a3dacaae75318e608fa2df289bdfa23df40e, but the
> sig is locked to
> 0f48875f011499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in
> SIGGEN_LOCKEDSIGS_core2-64
> >
> > and I couldn't reproduce those stamps in a local build or on the
> > builder where it failed (once I got access which took a while).
> >
> > The "while" is important as I think in the meantime things changed
> > which effected the results.
> >
> > On the autobuilder, "bitbake quilt -S none" generated stamp files for
> > quilt. I did this for "build" and "build-st-3046552", the latter being
> > the one where the test failed. There were two different do_build stamps
> > generated. The diff:
> >
> > bitbake-diffsigs
> tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.b502a759bb6bce=
b6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a
> ../build/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf16=
a1f87d5058e134f3f6fc02612515e28784625413c87d3545e93ae0ab407
> > NOTE: Reconnecting to bitbake server...
> > Hash for task dependency diffstat:do_package_write_rpm changed from
> 41171f7938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to
> 2211ac20553e9dddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce
> >     Hash for task dependency diffstat:do_package changed from
> f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to
> e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
> >     Unable to find matching sigdata for diffstat:do_package with hash
> e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
> >
> > i.e. a couple of dependencies were different.
> >
> > bitbake-diffsigs
> tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.f3fe48683=
1eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec
> ../build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.=
af8ebe96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2
> >
> > showed no output, i.e. they appear to be the same but different.
> >
> > My best guess at what is going on here is hash equivalence causing
> > problems.
> >
> > So in summary, I think the best solution will be to disable hash
> > equivalence for these tests.
> >
> >
>
> Hi Richard,
>
> Thank you a lot for digging into this!
> How can I disable the hash equivalence for these tests?
>

Can you try with BB_SIGNATURE_HANDLER using the bibake default config

self.write_config('BB_SIGNATURE_HANDLER =3D "OEBasicHash"')

Jose


> Should I use BB_BASEHASH_IGNORE_VARS for that?
>
> I tried the following:
> self.write_config("BB_BASEHASH_IGNORE_VARS +=3D \"TOPDIR\"")
>
> But this doesn't work, I get a lot of errors like the following:
> ERROR: When reparsing
>
> /home/jstephan/upstream/yocto/poky/meta/recipes-devtools/quilt/quilt_0.67=
.bb:
> do_packagedata,
> the basehash value changed from
> 8b6adb69d1f05eddb3e86143bf9a51060f4fac153742964bb4a3d53bee93d377 to
> 9dee5dada20d7f8ccfc89ed3114c428af8c96d665234fead22c25fb118f9f62b. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake quilt -cdo_packagedata -Snone
> ERROR: Then:
> ERROR: $ bitbake quilt -cdo_packagedata -Sprintdiff
>
>
>
> Cheers
> Julien
>
> > Cheers,
> >
>
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188459):
> https://lists.openembedded.org/g/openembedded-core/message/188459
> Mute This Topic: https://lists.openembedded.org/mt/101570279/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000267c1f0606b93045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Julien Stephan &lt;<a href=3D"mailto:jsteph=
an@baylibre.com">jstephan@baylibre.com</a>&gt; escreveu no dia s=C3=A1bado,=
 30/09/2023 =C3=A0(s) 15:13:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Le mer. 27 sept. 2023 =C3=A0 23:17, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit :<br>
&gt;<br>
&gt; On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:<br>
&gt; &gt; Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni<br>
&gt; &gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_b=
lank">alexandre.belloni@bootlin.com</a>&gt; a =C3=A9crit :<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I had a build were all the tests passed, then I had this fai=
lure:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/86/builds/5812/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812=
/steps/14/logs/stdio</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi Alexandre,<br>
&gt; &gt; I only see<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 bblock.BBLock.test_lock_single_recipe_all_tasks: FAI=
LED<br>
&gt; &gt;<br>
&gt; &gt; but I can&#39;t see the actual error :( Is it possible to have it=
 somewhere?<br>
&gt;<br>
&gt; I am a bit worried this will be hard to reproduce/debug so I had a loo=
k<br>
&gt; at things as I do really want to get things resolved.<br>
&gt;<br>
&gt; The error log says:<br>
&gt;<br>
&gt; WARNING: The quilt:do_build sig is computed to be 255536826e64d835fcc6=
b5a277e9a3dacaae75318e608fa2df289bdfa23df40e, but the sig is locked to 0f48=
875f011499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in SIGGEN_LOCK=
EDSIGS_core2-64<br>
&gt;<br>
&gt; and I couldn&#39;t reproduce those stamps in a local build or on the<b=
r>
&gt; builder where it failed (once I got access which took a while).<br>
&gt;<br>
&gt; The &quot;while&quot; is important as I think in the meantime things c=
hanged<br>
&gt; which effected the results.<br>
&gt;<br>
&gt; On the autobuilder, &quot;bitbake quilt -S none&quot; generated stamp =
files for<br>
&gt; quilt. I did this for &quot;build&quot; and &quot;build-st-3046552&quo=
t;, the latter being<br>
&gt; the one where the test failed. There were two different do_build stamp=
s<br>
&gt; generated. The diff:<br>
&gt;<br>
&gt; bitbake-diffsigs tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.si=
gdata.b502a759bb6bceb6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a=C2=
=A0 ../build/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf=
16a1f87d5058e134f3f6fc02612515e28784625413c87d3545e93ae0ab407<br>
&gt; NOTE: Reconnecting to bitbake server...<br>
&gt; Hash for task dependency diffstat:do_package_write_rpm changed from 41=
171f7938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to 2211ac205=
53e9dddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hash for task dependency diffstat:do_package change=
d from f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to =
e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unable to find matching sigdata for diffstat:do_pac=
kage with hash e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d4=
13ec<br>
&gt;<br>
&gt; i.e. a couple of dependencies were different.<br>
&gt;<br>
&gt; bitbake-diffsigs tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_packa=
ge.sigdata.f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec=
=C2=A0 ../build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sig=
data.af8ebe96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2<br>
&gt;<br>
&gt; showed no output, i.e. they appear to be the same but different.<br>
&gt;<br>
&gt; My best guess at what is going on here is hash equivalence causing<br>
&gt; problems.<br>
&gt;<br>
&gt; So in summary, I think the best solution will be to disable hash<br>
&gt; equivalence for these tests.<br>
&gt;<br>
&gt;<br>
<br>
Hi Richard,<br>
<br>
Thank you a lot for digging into this!<br>
How can I disable the hash equivalence for these tests?<br></blockquote><di=
v><br></div><div>Can you try with=C2=A0BB_SIGNATURE_HANDLER using the bibak=
e default config</div><div><br>self.write_config(&#39;BB_SIGNATURE_HANDLER =
=3D &quot;OEBasicHash&quot;&#39;)<br></div><div><br>Jose<br><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Should I use BB_BASEHASH_IGNORE_VARS for that?<br>
<br>
I tried the following:<br>
self.write_config(&quot;BB_BASEHASH_IGNORE_VARS +=3D \&quot;TOPDIR\&quot;&q=
uot;)<br>
<br>
But this doesn&#39;t work, I get a lot of errors like the following:<br>
ERROR: When reparsing<br>
/home/jstephan/upstream/yocto/poky/meta/recipes-devtools/quilt/quilt_0.67.b=
b:do_packagedata,<br>
the basehash value changed from<br>
8b6adb69d1f05eddb3e86143bf9a51060f4fac153742964bb4a3d53bee93d377 to<br>
9dee5dada20d7f8ccfc89ed3114c428af8c96d665234fead22c25fb118f9f62b. The<br>
metadata is not deterministic and this needs to be fixed.<br>
ERROR: The following commands may help:<br>
ERROR: $ bitbake quilt -cdo_packagedata -Snone<br>
ERROR: Then:<br>
ERROR: $ bitbake quilt -cdo_packagedata -Sprintdiff<br>
<br>
<br>
<br>
Cheers<br>
Julien<br>
<br>
&gt; Cheers,<br>
&gt;<br>
<br>
&gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188459): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188459" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188459</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101570279/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101570279/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000267c1f0606b93045--

