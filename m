Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F63C3527C
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.1128.1649869883367180434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=StXmCPYs;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id r2so2991866ljd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZA00LBOw4fZnb7KNTDQTjL2MuipeMPiUnra8166Bz4=;
        b=StXmCPYsmxAwR9IqpqnX4ykYW9wCFVG9p3me3H8oeav6aLxJBlK5iIag6ldpcUF4rP
         WtZRrSjUzYmpRp0LAg7HC/BmW7EXwvRKWWjeM3qVyTcCldR4OtiAiCIiwr84JyLPKjtE
         vbOf6uW0LIG0FQf6sOONe9LzWqE9hTyUbQs82lAwNRmkEdFE3PEdW0Wtk9oJzplTbFGq
         25sZy09FeFqT0/0bPlmvODGkpbJOAbJrk0cq8PwNGFuQcik/j6ktASLQcp8MNpZ+9kBM
         86sXt0Q0ULZ7BY5U1DgF9HlofVBEeDC2XHFTgvjaXbI1KHxg6EkbI9uJvvFDsJxi1e62
         oh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZA00LBOw4fZnb7KNTDQTjL2MuipeMPiUnra8166Bz4=;
        b=VIZ0ZIz5QLtfVEUQNj+C7F6ByxzceEgIxI4gVQxzb3vNW4yjbpJdL0DM495ecw1iXB
         QnHdaOolvjiifYBBE/c6HD2tJ+wAQscsxtZS6zdp9y7gJPf7WLOAII7mHECQDGsDL0Ek
         T3C4yXsOz4sRAD7zq8349aHSsgOrypsbgeNccffc70pQuafYxlRb5dOQEOkQoL/I0ECJ
         P8Z2DB7GTE59MqxAfbfS4mHyMCOwJQtseTqsUW0EFBipJOV/vlY++LrBuozW7FMpXFtv
         AwbljthyC/BWHWAA68TYQkEVG2VGm4+Z1+WN61QBEbpvF5QeY4lXsQfYqi00vEdXusc7
         2TVA==
X-Gm-Message-State: AOAM532czTNRJ2nm4fHiALCJpzVg1erSfUoOtpiBmRJviNXZXqap0RND
	/oErYwSGjc0PNqSKEfxWRidXoJptuHRY5TC+eEY=
X-Google-Smtp-Source: 
 ABdhPJwbCM/kw3b7H2JGHeIpzSZZXZ1gCs/AzX+gBj+6MICeAdhpg4FALQY8YKPyaBm7iZqx1rqIc9Drn65QShZiLU0=
X-Received: by 2002:a2e:aaa5:0:b0:24c:ac53:6f17 with SMTP id
 bj37-20020a2eaaa5000000b0024cac536f17mr435408ljb.409.1649869879978; Wed, 13
 Apr 2022 10:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 13 Apr 2022 18:11:07 +0100
Message-ID: 
 <CANPvuRkB_u-EqDJEjzcM60ptKw4hF2pjhPP1cpbjEp5_kW7kOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f300a05dc8c4485"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164347

--0000000000001f300a05dc8c4485
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Steve Sakoman <steve@sakoman.com> escreveu no dia quarta, 13/04/2022 =C3=A0=
(s)
17:02:

> On Wed, Apr 13, 2022 at 5:31 AM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Tue, Apr 12, 2022 at 3:21 PM Ralph Siemsen <ralph.siemsen@linaro.org=
>
> wrote:
> > >
> > > On Tue, Apr 12, 2022 at 5:49 PM Steve Sakoman <steve@sakoman.com>
> wrote:
> > >
> > > > I added a debug option to the failing command and did another
> autobuilder run.
> > > >
> > > > You can see the output here:
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/654608/
> > >
> > > Okay, same error, "Hash Sum mismatch". And if I squint between all th=
e
> > > URL-encoding, I can see the md5/sha1/sha256/sha512sum values.
> > >
> > > The "apt update" command is doing the following:
> > > - fetch the file called "Release"
> > > - fetch the file called "Packages.gz" --> error occurs here
> > >
> > > Looking inside the Release file, it is plain text, and contains the
> > > md5/sha1/sha256/sha512 sums of both Packages and Packages.gz (and als=
o
> > > the first two lines of Release).
> > >
> > > Manually checking each of those sums reveals an inconsistency: all th=
e
> > > sha256 values inside Release are incorrect, while all the other
> > > md1/sha1/sha512 values are correct.
> > >
> > > And when we look at the URL-encoded debug info... the sha256 value is
> > > the correct one for Packages.gz (as computed manually). However it
> > > does not match the (incorrect) value within the Release file. Thus it
> > > seems apt-get is justified when it complains about "Hash Sum
> > > mismatch".
> > >
> > > Going back to my Ubuntu system, and looking at the generated Release
> > > file... all the checksums are correct, including the sha256sum.
> > >
> > > So I am now looking into how Release file gets generated... as the
> > > problem appears to be there... and it happens on Fedora but not
> > > Ubuntu.
> >
> > As far as I can tell it is done here:
> >
> >
> https://git.yoctoproject.org/poky/tree/meta/lib/oe/package_manager.py?h=
=3Ddunfell#n301
> >
> > > One additional point to add: on the same Fedora 35 system, I did a
> > > full rebuild *without* with xz/gzip CVE fixes, and the apt failure
> > > still occurs. To be certain, I nuked cache, sstate-cache and tmp (so
> > > basically the entire build directory) and the rebuild took several
> > > hours.
> >
> > Now that is really strange!  In my experience it has only appeared
> > after adding the zlib or xz CVE fix patches.
> >
> > I just started two runs on the autobuilder, with the zlib patch as the
> > only difference.  Both on Fedora 35.
>
> Both runs completed and I'm still seeing success without the zlib patch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5069
>
> and failure with the patch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5070


It seems the test that failed is something related with the apt.
Is this repo hosted on 192.168.7.5 shared between master and dunfell
branches?
I ask this because there are some issues with apt [1] on master and it can
be related to this.

[1] apt: add apt selftest to test signed package feeds)

Started HTTPService on 0.0.0.0:35637
Traceback (most recent call last):
File
"/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
line 36, in wrapped_f
return func(*args, **kwargs)
File
"/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
line 36, in wrapped_f
return func(*args, **kwargs)
File
"/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core/d=
ecorator/__init__.py",
line 36, in wrapped_f
return func(*args, **kwargs)
File
"/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/runtim=
e/cases/apt.py",
line 50, in test_apt_install_from_repo
self.pkg('update')
File
"/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/runtim=
e/cases/apt.py",
line 17, in pkg
self.assertEqual(status, expected, message)
AssertionError: 100 !=3D 0 : apt-get update
Ign:1 http://192.168.7.5:42261 ./ InRelease
Get:2 http://192.168.7.5:42261 ./ Release [1213 B]
Ign:3 http://192.168.7.5:42261 ./ Release.gpg
Get:4 http://192.168.7.5:42261 ./ Packages [59.3 kB]
Err:4 http://192.168.7.5:42261 ./ Packages
Hash Sum mismatch
Fetched 60.5 kB in 20s (3020 B/s)
Reading package lists...
W: The repository 'http://192.168.7.5:42261 ./ Release' is not signed.
E: Failed to fetch http://192.168.7.5:42261/./Packages.gz Hash Sum mismatch
E: Some index files failed to download. They have been ignored, or old ones
used instead.

Jose


>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164339):
> https://lists.openembedded.org/g/openembedded-core/message/164339
> Mute This Topic: https://lists.openembedded.org/mt/90107518/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001f300a05dc8c4485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailto:st=
eve@sakoman.com">steve@sakoman.com</a>&gt; escreveu no dia quarta, 13/04/20=
22 =C3=A0(s) 17:02:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, Apr 13, 2022 at 5:31 AM Steve Sakoman via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@li=
sts.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On Tue, Apr 12, 2022 at 3:21 PM Ralph Siemsen &lt;<a href=3D"mailto:ra=
lph.siemsen@linaro.org" target=3D"_blank">ralph.siemsen@linaro.org</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Apr 12, 2022 at 5:49 PM Steve Sakoman &lt;<a href=3D"mail=
to:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; &gt; I added a debug option to the failing command and did anothe=
r autobuilder run.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You can see the output here:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/65=
4608/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org=
/Errors/Details/654608/</a><br>
&gt; &gt;<br>
&gt; &gt; Okay, same error, &quot;Hash Sum mismatch&quot;. And if I squint =
between all the<br>
&gt; &gt; URL-encoding, I can see the md5/sha1/sha256/sha512sum values.<br>
&gt; &gt;<br>
&gt; &gt; The &quot;apt update&quot; command is doing the following:<br>
&gt; &gt; - fetch the file called &quot;Release&quot;<br>
&gt; &gt; - fetch the file called &quot;Packages.gz&quot; --&gt; error occu=
rs here<br>
&gt; &gt;<br>
&gt; &gt; Looking inside the Release file, it is plain text, and contains t=
he<br>
&gt; &gt; md5/sha1/sha256/sha512 sums of both Packages and Packages.gz (and=
 also<br>
&gt; &gt; the first two lines of Release).<br>
&gt; &gt;<br>
&gt; &gt; Manually checking each of those sums reveals an inconsistency: al=
l the<br>
&gt; &gt; sha256 values inside Release are incorrect, while all the other<b=
r>
&gt; &gt; md1/sha1/sha512 values are correct.<br>
&gt; &gt;<br>
&gt; &gt; And when we look at the URL-encoded debug info... the sha256 valu=
e is<br>
&gt; &gt; the correct one for Packages.gz (as computed manually). However i=
t<br>
&gt; &gt; does not match the (incorrect) value within the Release file. Thu=
s it<br>
&gt; &gt; seems apt-get is justified when it complains about &quot;Hash Sum=
<br>
&gt; &gt; mismatch&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Going back to my Ubuntu system, and looking at the generated Rele=
ase<br>
&gt; &gt; file... all the checksums are correct, including the sha256sum.<b=
r>
&gt; &gt;<br>
&gt; &gt; So I am now looking into how Release file gets generated... as th=
e<br>
&gt; &gt; problem appears to be there... and it happens on Fedora but not<b=
r>
&gt; &gt; Ubuntu.<br>
&gt;<br>
&gt; As far as I can tell it is done here:<br>
&gt;<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/lib/oe/package_=
manager.py?h=3Ddunfell#n301" rel=3D"noreferrer" target=3D"_blank">https://g=
it.yoctoproject.org/poky/tree/meta/lib/oe/package_manager.py?h=3Ddunfell#n3=
01</a><br>
&gt;<br>
&gt; &gt; One additional point to add: on the same Fedora 35 system, I did =
a<br>
&gt; &gt; full rebuild *without* with xz/gzip CVE fixes, and the apt failur=
e<br>
&gt; &gt; still occurs. To be certain, I nuked cache, sstate-cache and tmp =
(so<br>
&gt; &gt; basically the entire build directory) and the rebuild took severa=
l<br>
&gt; &gt; hours.<br>
&gt;<br>
&gt; Now that is really strange!=C2=A0 In my experience it has only appeare=
d<br>
&gt; after adding the zlib or xz CVE fix patches.<br>
&gt;<br>
&gt; I just started two runs on the autobuilder, with the zlib patch as the=
<br>
&gt; only difference.=C2=A0 Both on Fedora 35.<br>
<br>
Both runs completed and I&#39;m still seeing success without the zlib patch=
:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/5069" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5069</a><br>
<br>
and failure with the patch:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/5070" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5070</a></blockquote><div><br></div><di=
v>It seems the test that failed is something related with the apt.=C2=A0</d=
iv><div>Is this repo hosted on 192.168.7.5 shared between=C2=A0master and d=
unfell branches?</div><div>I ask this because there are some issues with ap=
t [1] on master and it can be related to this.</div><div><br></div><div>[1]=
 apt: add=C2=A0apt=C2=A0selftest to test signed package feeds)</div><div><b=
r></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,1=
99);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;fon=
t-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gma=
il-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><s=
pan class=3D"gmail-" style=3D"box-sizing:border-box">Started HTTPService on=
 <a href=3D"http://0.0.0.0:35637">0.0.0.0:35637</a></span></span></div><div=
 style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fam=
ily:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;=
white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap g=
mail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">Traceback (most recent call last):=
</span></span></div><div style=3D"box-sizing:border-box;height:18px;color:r=
gb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,m=
onospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span =
class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:bo=
rder-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &qu=
ot;/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core=
/decorator/__init__.py&quot;, line 36, in wrapped_f</span></span></div><div=
 style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fam=
ily:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;=
white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap g=
mail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">    return func(*args, **kwargs)</=
span></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb=
(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,mon=
ospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span cl=
ass=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:bord=
er-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot=
;/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core/d=
ecorator/__init__.py&quot;, line 36, in wrapped_f</span></span></div><div s=
tyle=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-famil=
y:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;wh=
ite-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gma=
il-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"g=
mail-" style=3D"box-sizing:border-box">    return func(*args, **kwargs)</sp=
an></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(1=
99,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monos=
pace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span clas=
s=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border=
-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/=
home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/core/dec=
orator/__init__.py&quot;, line 36, in wrapped_f</span></span></div><div sty=
le=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:=
Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;whit=
e-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail=
-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gma=
il-" style=3D"box-sizing:border-box">    return func(*args, **kwargs)</span=
></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199=
,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospa=
ce;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=
=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-=
box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/h=
ome/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/runtime/c=
ases/apt.py&quot;, line 50, in test_apt_install_from_repo</span></span></di=
v><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);fo=
nt-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size=
:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-=
wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span cl=
ass=3D"gmail-" style=3D"box-sizing:border-box">    self.pkg(&#39;update&#39=
;)</span></span></div><div style=3D"box-sizing:border-box;height:18px;color=
:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;=
,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><spa=
n class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:=
border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &=
quot;/home/pokybuild/yocto-worker/pkgman-deb-non-deb/build/meta/lib/oeqa/ru=
ntime/cases/apt.py&quot;, line 17, in pkg</span></span></div><div style=3D"=
box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,=
Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-spac=
e:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o=
 gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" s=
tyle=3D"box-sizing:border-box">    self.assertEqual(status, expected, messa=
ge)</span></span></div><div style=3D"box-sizing:border-box;height:18px;colo=
r:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot=
;,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><sp=
an class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing=
:border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">Asserti=
onError: 100 !=3D 0 : apt-get update</span></span></div><div style=3D"box-s=
izing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monac=
o,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre=
;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmai=
l-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=
=3D"box-sizing:border-box">Ign:1 <a href=3D"http://192.168.7.5:42261">http:=
//192.168.7.5:42261</a> ./ InRelease</span></span></div><div style=3D"box-s=
izing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monac=
o,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre=
;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmai=
l-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=
=3D"box-sizing:border-box">Get:2 <a href=3D"http://192.168.7.5:42261">http:=
//192.168.7.5:42261</a> ./ Release [1213 B]</span></span></div><div style=
=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Me=
nlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-=
space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-l=
og_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail=
-" style=3D"box-sizing:border-box">Ign:3 <a href=3D"http://192.168.7.5:4226=
1">http://192.168.7.5:42261</a> ./ Release.gpg</span></span></div><div styl=
e=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:M=
enlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white=
-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-=
log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmai=
l-" style=3D"box-sizing:border-box">Get:4 <a href=3D"http://192.168.7.5:422=
61">http://192.168.7.5:42261</a> ./ Packages [59.3 kB]</span></span></div><=
div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-=
family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13=
px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wra=
p gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=
=3D"gmail-" style=3D"box-sizing:border-box">Err:4 <a href=3D"http://192.168=
.7.5:42261">http://192.168.7.5:42261</a> ./ Packages</span></span></div><di=
v style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fa=
mily:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px=
;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap =
gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=
=3D"gmail-" style=3D"box-sizing:border-box">  Hash Sum mismatch</span></spa=
n></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,1=
99);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;fon=
t-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gma=
il-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><s=
pan class=3D"gmail-" style=3D"box-sizing:border-box">Fetched 60.5 kB in 20s=
 (3020 B/s)</span></span></div><div style=3D"box-sizing:border-box;height:1=
8px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier =
New&quot;,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0=
,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"bo=
x-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box"=
>Reading package lists...</span></span></div><div style=3D"box-sizing:borde=
r-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,=
&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;background=
-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bindin=
g" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizi=
ng:border-box">W: The repository &#39;<a href=3D"http://192.168.7.5:42261">=
http://192.168.7.5:42261</a> ./ Release&#39; is not signed.</span></span></=
div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);=
font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-si=
ze:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-n=
o-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span =
class=3D"gmail-" style=3D"box-sizing:border-box">E: Failed to fetch <a href=
=3D"http://192.168.7.5:42261/./Packages.gz">http://192.168.7.5:42261/./Pack=
ages.gz</a>  Hash Sum mismatch</span></span></div><div><span style=3D"backg=
round-color:rgb(0,0,0);color:rgb(199,199,199);font-family:Menlo,Monaco,Cons=
olas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre">E: S=
ome index files failed to download. They have been ignored, or old ones use=
d instead.</span></div><div>=C2=A0</div><div>Jose</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Steve<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164339): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164339" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164339</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90107518/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90107518/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000001f300a05dc8c4485--

