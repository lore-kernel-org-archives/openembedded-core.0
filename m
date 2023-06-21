Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7C4EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 00:21:29 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.6137.1687306888111010555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 17:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BNDs9//R;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: aehs29@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a98a7fde3eso4655398fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687306887; x=1689898887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/vv+mzR3Jp5NRGYfkyyIDnfnZH3gsrNBLKdOxuR5WTc=;
        b=BNDs9//RtuJlWjuQqJ757au9g0k6gA5+1D3VTB0TfvVQIHaAoP48EhHHgNnHYX9xQe
         Ua8doGv+eh5JN9W+CSBrXsVZT7muj2mRlyP8fH6GiNsu5NlJ+jTeRDHixxbBWTyZ4nHH
         FKzqKzc8z8H0YHRmFGnRkzjye+gkJlH0gyBM5VDATS0F+1AePXZzMWYTUrDVns9msfAZ
         FUaEml6hwN3YdsOcXtJjsLC9uHJOaC4gUmuu1rl2G6arqg2dH0YHr5e8AkjA5na9mQiA
         NNWSI2wetH/ro1MGpSsDBI6cMvpBwc3Xj8RvAd5G9s0YX+MjFRtiA4FkmSmQSxY1vlc7
         8ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687306887; x=1689898887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vv+mzR3Jp5NRGYfkyyIDnfnZH3gsrNBLKdOxuR5WTc=;
        b=Y3apMVtIgm2NaBvBomzibExv263SFRQseTjbE0+BNG038CTYvjyc3Wyei9tMy4vpXO
         MNbBNMaRvEWTdmGR/GOitUmFHMQA1kow/d3c8ERZtvXegxeWcCKw8VKSMjFhcaQMzjJ4
         FNeRf/f8YkzYP5Eli2A2aWVq9hZMrI4H9wYcpYqvVHAwqctPtiY3+l8jWRDc4sM/AlaN
         9nBSrj1cFWGQ77rmMYIKhPVcQmn73KikDPJoandMBSsseoLctM/B32FvNBAD3VYgJ42H
         uZeq2Zhhs80tOg6QDlowLKiMJgBUQf9PWnBF9XdUhwXFrx7S3p48GpafakQcDPS9xXm8
         5XeA==
X-Gm-Message-State: AC+VfDypmBlQXE/dYokrs5OE4SfW4IW8O2Gj7pqIL7iB/zM2UyTFi9Gq
	IntvXYZPJDMGfcqjZaVB/3+Tp7c9B0O5CiUToTM=
X-Google-Smtp-Source: ACHHUZ6KIoAK92RPSRsLtPzbWxo3POmemWvyXzipN3oOM8O1aLauQjvdNRpZ5fuGqOpxMDwP8OeMtJss78+O00v/2AU=
X-Received: by 2002:a05:6870:7697:b0:1aa:220a:fc8 with SMTP id
 dx23-20020a056870769700b001aa220a0fc8mr6263665oab.19.1687306885849; Tue, 20
 Jun 2023 17:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230619135416.1640748-1-tgamblin@baylibre.com>
 <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
 <ef3d8471-22f1-7b0b-48f6-25a096a28d42@baylibre.com> <e1b3ced391e8d316d808b5c35c2c655d89191089.camel@linuxfoundation.org>
In-Reply-To: <e1b3ced391e8d316d808b5c35c2c655d89191089.camel@linuxfoundation.org>
From: Alejandro Hernandez <aehs29@gmail.com>
Date: Tue, 20 Jun 2023 18:21:14 -0600
Message-ID: <CAHMutrYDYCRCTcYHb1DBi=5kVR62WOx0ATs6Dj9SMZtC41kDOw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu-gen-tapdevs: pass STAGING_BINDIR_NATIVE
 to ifup
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ee59805fe98bfcd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 00:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183163

--0000000000008ee59805fe98bfcd
Content-Type: text/plain; charset="UTF-8"

Hello,

Just to add more information to this, I've noticed a failure on my test
environment today while trying to run -c testimage, apparently due to one
of these fixes:

Command '('sudo', '/home/vsts/poky/scripts/runqemu-ifup', '1001', '123',
'/home/vsts/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin')'
returned non-zero exit status 1

As Richard mentioned the bindir isnt used anymore, and the patches
mentioned (
https://git.yoctoproject.org/poky/commit/?id=51063c1e6ac214b4ef43c88c8091c909a7cab2cb)
fixes the check for the extra parameter, however, I can clearly see that a
third parameter is being passed to runqemu-ifup, which I believe is being
called here:
https://git.yoctoproject.org/poky/tree/scripts/runqemu#n1185

I'll be sending a patch to fix the call to runqemu-ifup with the correct
amount of arguments.

Alejandro

On Mon, 19 Jun 2023 at 08:50, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2023-06-19 at 10:19 -0400, Trevor Gamblin wrote:
> > On 2023-06-19 10:03, Richard Purdie wrote:
> > > On Mon, 2023-06-19 at 09:54 -0400, Trevor Gamblin wrote:
> > > > Without this, runqemu-gen-tapdevs fails with the following error:
> > > >
> > > > [tgamblin@megalith build]$ sudo
> /workspace/yocto/manual/poky/scripts/runqemu-gen-tapdevs 1000 1002 4
> tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
> > > > Creating 4 tap devices for UID: 1000 GID: 1002...
> > > > Creating tap0
> > > > Error bringing up interface: sudo runqemu-ifup <uid> <gid>
> <native-sysroot-basedir>
> > > >
> > > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > > ---
> > > >   scripts/runqemu-gen-tapdevs | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/runqemu-gen-tapdevs
> b/scripts/runqemu-gen-tapdevs
> > > > index ec3ecb03b9..dc730e413d 100755
> > > > --- a/scripts/runqemu-gen-tapdevs
> > > > +++ b/scripts/runqemu-gen-tapdevs
> > > > @@ -79,7 +79,7 @@ fi
> > > >   echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
> > > >   for ((index=0; index < $COUNT; index++)); do
> > > >           echo "Creating tap$index"
> > > > - if ! ifup=`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
> > > > + if ! ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`;
> then
> > > >                   echo "Error bringing up interface: $ifup"
> > > >                   exit 1
> > > >           fi
> > > I'm a bit puzzled as I removed the use of STAGING_BINDIR_NATIVE in that
> > > script?
> > STAGING_BINDIR_NATIVE is still present near the top of the script as a
> > variable but isn't used anywhere. When I encountered the error and saw
> > that the script wasn't passing a path, I thought including it again
> > would fix it. It appears to do so on my Fedora build system.
> > >
> > > Are you mixing different releases?
> > I'm using the latest poky master.
> >
>
> My testing environment was corrupt, testing "build1" when the code was
> in "build".
>
> I've sent a couple of patches, one to fix the script parameters (the
> bindir isn't used anymore) and one to fix the issue with more than 10
> tap devices.
>
> Cheers,
>
> Richard
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183119):
> https://lists.openembedded.org/g/openembedded-core/message/183119
> Mute This Topic: https://lists.openembedded.org/mt/99623609/3619605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alejandro@enedino.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008ee59805fe98bfcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">Hello,</div><div class=3D"gmail_default" style=3D=
"font-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:arial,sans-serif;font-size:small">Just to a=
dd more information to this, I&#39;ve noticed a failure on my test environm=
ent today while trying to run -c testimage, apparently due to one of these =
fixes:</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-se=
rif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,sans-serif;font-size:small"><span style=3D"background-color:rgb=
(50,49,48);color:rgb(225,223,221);font-family:Menlo,Consolas,&quot;Courier =
New&quot;,monospace;font-size:12px">Command &#39;(&#39;sudo&#39;, &#39;/hom=
e/vsts/poky/scripts/runqemu-ifup&#39;, &#39;1001&#39;, &#39;123&#39;, &#39;=
/home/vsts/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recip=
e-sysroot-native/usr/bin&#39;)&#39; returned non-zero exit status 1</span>=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-se=
rif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,sans-serif;font-size:small">As Richard mentioned the bindir isn=
t used anymore, and the patches mentioned (<a href=3D"https://git.yoctoproj=
ect.org/poky/commit/?id=3D51063c1e6ac214b4ef43c88c8091c909a7cab2cb">https:/=
/git.yoctoproject.org/poky/commit/?id=3D51063c1e6ac214b4ef43c88c8091c909a7c=
ab2cb</a>) fixes the check for the extra parameter, however, I can clearly =
see that a third parameter is being passed to runqemu-ifup, which I believe=
 is being called here:</div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,sans-serif;font-size:small"><a href=3D"https://git.yoctoproject.or=
g/poky/tree/scripts/runqemu#n1185">https://git.yoctoproject.org/poky/tree/s=
cripts/runqemu#n1185</a><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,sans-serif;font-size:small">I&#39;ll be s=
ending a patch to fix the call to runqemu-ifup=C2=A0with the correct amount=
 of arguments.</div><div class=3D"gmail_default" style=3D"font-family:arial=
,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">Alejandro</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19=
 Jun 2023 at 08:50, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2023-06-19 at 1=
0:19 -0400, Trevor Gamblin wrote:<br>
&gt; On 2023-06-19 10:03, Richard Purdie wrote:<br>
&gt; &gt; On Mon, 2023-06-19 at 09:54 -0400, Trevor Gamblin wrote:<br>
&gt; &gt; &gt; Without this, runqemu-gen-tapdevs fails with the following e=
rror:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; [tgamblin@megalith build]$ sudo /workspace/yocto/manual/poky=
/scripts/runqemu-gen-tapdevs 1000 1002 4 tmp/sysroots-components/x86_64/qem=
u-helper-native/usr/bin<br>
&gt; &gt; &gt; Creating 4 tap devices for UID: 1000 GID: 1002...<br>
&gt; &gt; &gt; Creating tap0<br>
&gt; &gt; &gt; Error bringing up interface: sudo runqemu-ifup &lt;uid&gt; &=
lt;gid&gt; &lt;native-sysroot-basedir&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin=
@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 =C2=A0scripts/runqemu-gen-tapdevs | 2 +-<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-g=
en-tapdevs<br>
&gt; &gt; &gt; index ec3ecb03b9..dc730e413d 100755<br>
&gt; &gt; &gt; --- a/scripts/runqemu-gen-tapdevs<br>
&gt; &gt; &gt; +++ b/scripts/runqemu-gen-tapdevs<br>
&gt; &gt; &gt; @@ -79,7 +79,7 @@ fi<br>
&gt; &gt; &gt;=C2=A0 =C2=A0echo &quot;Creating $COUNT tap devices for UID: =
$TUID GID: $GID...&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0for ((index=3D0; index &lt; $COUNT; index++)); d=
o<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Creating =
tap$index&quot;<br>
&gt; &gt; &gt; - if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID 2&gt;&amp;1`; then<b=
r>
&gt; &gt; &gt; + if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATI=
VE 2&gt;&amp;1`; then<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Error bringing up interface: $ifup&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0exit 1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; I&#39;m a bit puzzled as I removed the use of STAGING_BINDIR_NATI=
VE in that<br>
&gt; &gt; script?<br>
&gt; STAGING_BINDIR_NATIVE is still present near the top of the script as a=
 <br>
&gt; variable but isn&#39;t used anywhere. When I encountered the error and=
 saw <br>
&gt; that the script wasn&#39;t passing a path, I thought including it agai=
n <br>
&gt; would fix it. It appears to do so on my Fedora build system.<br>
&gt; &gt; <br>
&gt; &gt; Are you mixing different releases?<br>
&gt; I&#39;m using the latest poky master.<br>
&gt; <br>
<br>
My testing environment was corrupt, testing &quot;build1&quot; when the cod=
e was<br>
in &quot;build&quot;.<br>
<br>
I&#39;ve sent a couple of patches, one to fix the script parameters (the<br=
>
bindir isn&#39;t used anymore) and one to fix the issue with more than 10<b=
r>
tap devices.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183119): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183119" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183119</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99623609/3619=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99623609/3619605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alejandro@enedino.org" tar=
get=3D"_blank">alejandro@enedino.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008ee59805fe98bfcd--

