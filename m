Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56C4C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 21:31:39 +0000 (UTC)
Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.699.1790199090478397862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 14:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jjZUYg4M;
 spf=pass (domain: gmail.com, ip: 74.125.224.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a45b788a71so15227937b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790199089; cv=none;
        d=google.com; s=arc-20260327;
        b=DHYhEp/j+Sd4l/wVGk+EdfPcbSQ2P8clopKGzxDQfotTc16ems2EbCOi93GnP60+o5
         g3CGXOGFcAjWLIBvfXzt8qMKwfkDbQuv50pvlEWpf0SZQHhX1Y26psCPwcrjpU2s4CNl
         Vq5la32s4wyqbhUT3+DG8AV/Ao4cdvGny67NMGbQW2F1c/PoypvqaNAJWwg61YUNpA2U
         ngtJZgNelKy4quE0eNdOdSpspjkcs2k4UzIoBF36CzD5gqPzbiHBcH3bAqlv/hHyabeI
         l+URvHJFu6+BSfIBzxBsT9/iIXVPbV26rMc6jgSmq5HPFMh+69hrd48bB8Zc/CAjl/TT
         Zn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ouRDAXlzz5KcwfAWYxazvw/sfVUp3UYj7hqrV5PM6ik=;
        fh=mZWKcthIhZcF/6gHKYZbzchP4X0o/Jx/2LB0j6pgjbQ=;
        b=TF3kfr4ZOECXqXUimjmVuQnl9jTT0MhcMUyOqkBi7fg016gacHiI/evUZ/ECgtiGb8
         dVTqqlXpBLMZVca/KbVzSbN1bd9R3kw0IInSKPdT16oWzaQvht1EhBgaDzGzgxxJxmKa
         DmK9qROHtmyt22HfxyK62J/JCt8Un0FwXG0+zfCyAbaCZGnL8GP21F3PUdCb94hEpPKu
         ujIPF6EvGM8wL6p/BboyB0/iljDHLjeSdgDpR1SWWLTAMwX2AUv+DBeVp6sa5PQvCV3Q
         5/qxrNdpr0y/xb1BKWuly/IP02O3DNyR0qUHhqlHdlDjKs9YmHVEzsk0CQHJDKYA1wub
         H1sA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790199089; x=1790803889; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouRDAXlzz5KcwfAWYxazvw/sfVUp3UYj7hqrV5PM6ik=;
        b=jjZUYg4MM8W2+hLGOFSDUrx9Xr4LfbiXO8/NN5BAJbO9SI7tjIxBlSk6johwwoo9Ji
         eI/P5iNGL0Ct4TZo1TzOD/F4cu/Rk3rymki5Zb8k11Vpstz+39jHSx4YYerkr8Iv533H
         +8IXwseQwieaE14dKMVQxdK+fnuggHcZVzbs5bGG9H0mmTupejkH9OVAQ7RLfHg55wf+
         uGEYAkS/5deGeGgPvOHRCRlnh9RAF51NPRouMt51lSZP4W8p7ATDZD3+Nh1huSddwOMw
         ZBLqh4tGdR6J5PSAxpU+qYaBFWhDyqKGiim1b2K0fA3EoABuNd/39uICsh1JoAm5m9Wg
         jUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199089; x=1790803889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouRDAXlzz5KcwfAWYxazvw/sfVUp3UYj7hqrV5PM6ik=;
        b=D/8pAubQ2ZMzKNPywuocEa+wXQw+c28k+6qfqCuOhinn8iKIKQMbodKt+SJD0C3laN
         KNwQDgv7/RwPWktSdLi2EKobUEQTtjrjNnyDRfiqVDBeXOv56sLq/uGu6CTsrizaAVK8
         fQjQp9ZAG3xddoinYThMvvnyjfIo5joiLTrjYErUIr56vMZuviy/T7oQSPwJ1A47tP2X
         yjERDdRJvvW9bMUmyKSsV1i4SQEXzXXdGtaPM5c2qJplXfYLKAFIVKVDhNxdk0WXeQLz
         0/BWX3jAPi/7laPLuoRA6gHpC1TG9VTsxROMe/SWCbYU/WIVPcvjHGOrJe/oazJE3KXz
         2pGw==
X-Forwarded-Encrypted: i=1; AKwUvBzlqf5RqFSeC83P3cKDLzfgQpn8zkm7SJc9oN0O2aYo9igF8JfaHOMchLGdpPcwRwZa0/DAoIYUBVlL1f7gF3iNIw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kIMx6btYQO1r2fTBVhzOKT2lPSvBiqmBpSr6MJHuUGiBM6LRAD
	hOv/EAkDBABJ2y7O1a3FWcxgcfASHDFJD/jeorAzb71RosVv/Id7+KMQ4Fmu8wu9nnVWbU8uWy2
	LaYCTIO8VBOSSzKCmtolpby80PJLsS+8=
X-Gm-Gg: AYBFou1iItnO9RP1PpRrTB9mZzUf6NgW+aVS0U5v6pnNFp1+IkELmXhQ/kz47bWPf9v
	ah6ZenwAzUfjir2XLffFamEJN4QD9qHcXNRtYeWUIZISxY/XfedGHbq3BO/79TB9UTAPv45nIZG
	dD3X89v2RIfWicUV2YYV2NH+S4Lq0zJdjK32+pw0Ge9SSghaUjO058xmBiQP9fdIJgGdRoiaHWt
	WCPuKOJlUACPE+YG/UvZsXrRaKdxMFq+bQnA53JxtC+MKUUKIgdavtcV/jS1Vx3OouB++FPI7QB
	Bz27lG1BD6UwbuBMHU0nXjIa4Yy8zL/Ci8EAtOOdsejQLB+mCyowWUa8E5QhvqBD0f/8UYbzO++
	sdDGQmxlwiBFgXeflYN3geD0VKQ+p+a3TtTDJLfILOzDEQatANufx8hUCztBwYg+pP2FfhCrEs5
	mvA93m0iU6xMO6bYGOzRYuR9CYuw08ihqwI+HfhuQqkBbNgpdNhwvwVWD6KX5N8dFOnAEpuKtS7
	5wpUghnm52cxX8jPK8Y/D78mzVDHEMCoWGCvrvHZf36ZFR5/ouHQfUd1yLxZ8lxnEkXs+MM+7Mv
	rhv/cc6yz5P4i+48k4k=
X-Received: by 2002:a05:690e:806:20b0:672:a52c:db25 with SMTP id
 956f58d0204a3-672ed4acb23mr284565d50.109.1790199089323; Wed, 23 Sep 2026
 14:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <0b88403ebbb7db6f816034bca582227e3b175694.camel@linuxfoundation.org>
In-Reply-To: <0b88403ebbb7db6f816034bca582227e3b175694.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Sep 2026 14:31:03 -0700
X-Gm-Features: AcwNN1VX_zjpMS5DdPfVtxlTy2nhfKyIZGsIXnyhC-vjCRKZ6dymmSyK-CjICkA
Message-ID: <CAMKF1so_2b8mKoSgchQV8riFNan0nBxP3CACSq+fmNF0wZsw9g@mail.gmail.com>
Subject: Re: [OE-core] Topic: native libstdc++ and uninative
To: richard.purdie@linuxfoundation.org
Cc: peter.marko@siemens.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000cbe368065c2d3476"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 21:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246558

--000000000000cbe368065c2d3476
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:14=E2=80=AFPM Richard Purdie via lists.openembed=
ded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Wed, 2026-09-23 at 14:54 +0000, Peter Marko via lists.openembedded.org
> wrote:
> > Dear Yocto toolchain experts,
> >
> > we have come across a problem with C++ native libraries and sstate-cach=
e
> reuse on different host distros under uninative.
> >
> > Our scenario:
> > For generation of sstate-cache, we're using only x86-64 Debian machines=
,
> each Yocto branch on a fixed version.
> > For example for wrynose we use Debian 13.
> > However, the clients can have a different host distro (different Debian
> release or even Ubuntu or Fedora).
> > I think this is how Yocto uninative sstate-cache is intended to be used=
.
> >
> > The problem is following:
> > GCC version is different between different Host distros, especially
> libstdc++ from newer GCC has more symbols than from older GCC.
> > So when re-using a native c++ library generated on Debian-13, Debian-12
> liker can report failures.
> > Concrete case we experienced is linking against googletest-native and
> missing symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12
> (GCC 12.2.0).
> >
> > We don't want to go away from uninative as that would force us to
> produce separate sstate-cache for each host distro and explode storage si=
ze
> and build times.
> >
> > Has anyone else come across this problem?
> > What would be the recommended way to solve this?
> >
> > Could libstdc++ be included in uninative?
> > Would that work with all the different GCC versions in all supported
> host distros?
> >
> > Or some magical compiler option we could use to disable usage of some
> newer symbols?
> >
> > I know that we could use buildtools tarball, however that's against the
> idea of running Yocto natively.
> > It's also a step very easy to be forgotten during build setup unless
> there is some magical qa check for that.
> > And for application developers it's yet another Yocto obstacle and
> argument against developing with Yocto.
>
> This sounds very familiar.
>
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd18bf7fa8e80d=
6cfaf3fdbe1ab06eec84b954432
>
> Basically we link with -Wl,--allow-shlib-undefined and then by the time
> we run it, we have the uninative glibc available which will have the
> missing symbols.
>
>
I think the failing case gtest links libstdc++ statically, and it inherits
the undefined symbols which can not be resolved.
it might solve it I am not sure


> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246538):
> https://lists.openembedded.org/g/openembedded-core/message/246538
> Mute This Topic: https://lists.openembedded.org/mt/121393863/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cbe368065c2d3476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23,=
 2026 at 12:14=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mail=
to:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, 2026-09-23 at 14:54 +0000, Peter Marko via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; Dear Yocto toolchain experts,<br>
&gt; =C2=A0<br>
&gt; we have come across a problem with C++ native libraries and sstate-cac=
he reuse on different host distros under uninative.<br>
&gt; =C2=A0<br>
&gt; Our scenario:<br>
&gt; For generation of sstate-cache, we&#39;re using only x86-64 Debian mac=
hines, each Yocto branch on a fixed version.<br>
&gt; For example for wrynose we use Debian 13.<br>
&gt; However, the clients can have a different host distro (different Debia=
n release or even Ubuntu or Fedora).<br>
&gt; I think this is how Yocto uninative sstate-cache is intended to be use=
d.<br>
&gt; =C2=A0<br>
&gt; The problem is following:<br>
&gt; GCC version is different between different Host distros, especially li=
bstdc++ from newer GCC has more symbols than from older GCC.<br>
&gt; So when re-using a native c++ library generated on Debian-13, Debian-1=
2 liker can report failures.<br>
&gt; Concrete case we experienced is linking against googletest-native and =
missing symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12 (GC=
C 12.2.0).<br>
&gt; =C2=A0<br>
&gt; We don&#39;t want to go away from uninative as that would force us to =
produce separate sstate-cache for each host distro and explode storage size=
 and build times.<br>
&gt; =C2=A0<br>
&gt; Has anyone else come across this problem?<br>
&gt; What would be the recommended way to solve this?<br>
&gt; =C2=A0<br>
&gt; Could libstdc++ be included in uninative?<br>
&gt; Would that work with all the different GCC versions in all supported h=
ost distros?<br>
&gt; =C2=A0<br>
&gt; Or some magical compiler option we could use to disable usage of some =
newer symbols?<br>
&gt; =C2=A0<br>
&gt; I know that we could use buildtools tarball, however that&#39;s agains=
t the idea of running Yocto natively.<br>
&gt; It&#39;s also a step very easy to be forgotten during build setup unle=
ss there is some magical qa check for that.<br>
&gt; And for application developers it&#39;s yet another Yocto obstacle and=
 argument against developing with Yocto.<br>
<br>
This sounds very familiar.<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dd18b=
f7fa8e80d6cfaf3fdbe1ab06eec84b954432" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3Dd18bf7fa8e80d6c=
faf3fdbe1ab06eec84b954432</a><br>
<br>
Basically we link with -Wl,--allow-shlib-undefined and then by the time<br>
we run it, we have the uninative glibc available which will have the<br>
missing symbols.<br>
<br></blockquote><div><br></div><div>I think the failing case gtest links l=
ibstdc++ statically, and it inherits the undefined symbols which can not be=
 resolved.=C2=A0</div><div>it might solve it I am not sure</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246538): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246538" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246538</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121393863/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121393863/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cbe368065c2d3476--

