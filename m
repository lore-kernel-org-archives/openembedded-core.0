Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1DCC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:26:36 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45996.1789986391050991212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TzgAsB+0;
 spf=pass (domain: mvista.com, ip: 74.125.228.140, mailfrom: vanusuri@mvista.com)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso312443366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 03:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986389; cv=none;
        d=google.com; s=arc-20260327;
        b=gOPdG+kEoH76qxLT/jWo81Sm8K5ufqaA1QFY3e8/sJQx2A9qfRiH6n52JnMbiy7CG4
         icbjbwg1IBJT3+Y461XkT8oOtOqy4dpRHr0PFONkXVZ2WvXog4Amn6050cBBIuFqHIq6
         9NqeMtd6gVOMoYYXYvb98fpQh+12spD1C7E2gQx2oHJKHckyTrO0AOWMTVrmjtt2DSfq
         /P49My1zr79YxsjmvxBOfEBT35cdIMBj6+glVtYxninEzywK6WsfHI4QXJV1vFbPyxHv
         7tYOBBKv6fgOgXF4e/YsE7FgDjgjizDGM+oacap/7TBUd1Uvokw+2FQSKXRJfyvo1w52
         DetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YUqKuWo52lRkBh5GTg1L1RSMVwKEuD7onEda94dgLjE=;
        fh=BHE423wT+fKPULoQlxlnfT8DD/hZRe4iA1gb66KXP74=;
        b=L8ywxn2LyabnSuzLFwKMqMry7gODypg5l/OxxatEwPSmQFriTTCrgpQiy9GEvXQIx7
         QfpZocvRr8HLY7GtKEpC6UOx9Mk5qEq2Vr9TRqbCMXR3NqAr60yUBF5x6+ifyIkHDmwe
         ZI0lvyyG12RGQ9TkcmsezfmvIVzIl4MmNmZ1epDz/FZzc5VpSrAJkWu3fw0nP3iTGTW9
         xM6ZjwDNKgXILAeNcSQtmX8F9d1PtllnP6QYXhc8WiMXYnwEzMB55YVtg+QDWvQqj/lq
         bEdALB1WpuHZb9EGBCVXwXy0ik5fv2B//P8uWMOaYa2ZX7/gjGGW/MlTZr9EiGL9wQQP
         onnQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789986389; x=1790591189; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUqKuWo52lRkBh5GTg1L1RSMVwKEuD7onEda94dgLjE=;
        b=TzgAsB+0096zD0/5qWslJqm4lyUrshNFwJ/zqCgYzmWUBu1vqBUCdxfYeF4AGtPKnn
         0aznyiYbpQojIYU8d18Arq2/bwY7ffuuB7cS9k72r43xumi83urGejNq+T/5AVukfWbd
         Gu7OGNysrXpoIjCbSrD3ZeC8+J3RDGW2An6PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986389; x=1790591189;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YUqKuWo52lRkBh5GTg1L1RSMVwKEuD7onEda94dgLjE=;
        b=vf6CY7bcP2lsacKotnPfsDBCPiZeI/gSAD6hWmhcGO5UMxQtqM3pcERqIHr+6oOJuh
         LpPA5P5q4CmdROrQTIzcxsnwDxcr6ZV4PBktIhetHHTIygEXMx1Ojn8WW1veNUF8+xvq
         NkU2o+typXj2XvkI1qKZaYomBq0hd1qFEFc5RS9T7WrCX06kFTEnwaia4soTUl3ji+SP
         iW3PICihbUbriQMR1ZSvz06ja0zRgDle2EQqUYBVdRC+RSCbgDXXk2oFt7DFJeI0BEyq
         fRGG/oEYW/5ivPiQFIdm4bW9Ze3QK9BaPHTf7UJGd7G709nQuVz11j+AR1yX1ugN4J72
         OduQ==
X-Gm-Message-State: AFuF++lHYWHq2J5YT7qbyGOevXWvCDTo1QQ6JSwL5v0nxAnH5iSTRPSW
	pcvetx/1XKKIesw9W6KXs3PssRhr6MarThiUk0ip4UJ2AqyM2ESuOUAySf+9o/URw1wm96j1lHq
	aKnSq+5/oHVlqb2UejZ+S0Yrf/l+xQUUOCzX+inZ3bA==
X-Gm-Gg: AYBFou0qEZGxQnCgAhgdM1OhJVbl22oWeA3sy1U2jLRbQyXFd7xWPJXH6vQKA4UXP6D
	ExlV6LwVQfHO2Xdzzy9cjkesE4dki59EHuVn4YXXapj2i66G6I79MAGY695A0HCmLaESLrFcA9k
	+B2jWi0F392TMlmUWc7lk9MuXlmrhbnHFYMaVs+7gNjXMFSfwz8P/2u2VEx1/I8+4qCdag41tou
	7zYDtDFm5VPYmtu/OqntFC3d2WXW//PBYgDjAHBiZjRXyIYPFCCvtkEBXa/l82AOMntopZ7NEtI
	XNo7eAwxJjyPFuOq7kRPNvKefp32AyNcZxETpY4xMxHae3vKD9YZSfFc
X-Received: by 2002:a17:907:8e86:b0:c24:47b8:ae5b with SMTP id
 a640c23a62f3a-c2a15709288mr750175566b.22.1789986389244; Mon, 21 Sep 2026
 03:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260917105551.76512-1-vanusuri@mvista.com> <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr>
 <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr> <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
 <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com> <546192.1789655591562202413@lists.openembedded.org>
In-Reply-To: <546192.1789655591562202413@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 21 Sep 2026 15:56:16 +0530
X-Gm-Features: AcwNN1V8XH70GxLz9WRNeD1JSAfzAz3LUIFxNBRijJh8HpjdoAZH4wFDxYIhM3I
Message-ID: <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e252a0065bfbae4f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246314

--000000000000e252a0065bfbae4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Paul,

I checked with the rsync upstream maintainers regarding the security patch
branches and the possibility of an archive/tarball.

They confirmed that v3.4.1-sec-patches3 and v3.2.7-sec-patches3 are
official rsync security-maintenance branches. They have now also published:

   - v3.4.1-sec-patches4
   - v3.2.7-sec-patches4

These branches contain the security and compatibility fixes applicable to
the respective older release lines after *-sec-patches3. Both branches have
been tested against the refreshed stable testsuite.

Regarding the archive/tarball, the maintainer clarified that they do not
plan to provide release tarballs for these security branches. The branches
are intended to be used as reviewable Git sources from which downstream
maintainers can cherry-pick commits or construct their own patch series.

Based on this, can we switch the rsync recipe to Git and use the
v3.4.1-sec-patches4 & v3.2.7-sec-patches4 branches for Wrynose/Scarthgap?

This would allow us to consume the upstream security and compatibility
fixes directly from the maintained security branch instead of carrying the
large 34KLOC patch series.


The discussion with the rsync maintainers is here:
https://github.com/RsyncProject/rsync/discussions/1095

Thanks & Regards,
Vijay

On Thu, Sep 17, 2026 at 8:03=E2=80=AFPM Siddharth Doshi via lists.openembed=
ded.org
<sdoshi=3Dmvista.com@lists.openembedded.org> wrote:

> Hi Yoann, Paul and Vijay,
>
> v3.4.1-sec-patches3 and v3.2.7-sec-patches3 both the branches are part of
> official security release afaik.
>
> these versions corresponds to ubuntu/launchpad PPA for racoon and noble
> respectively so i see them being maintained till 2031 and 2029
> atleast(unless ubuntu decides on bumping those versions up in unforseen
> situations).
>
> with that being said, yes it is trade-off between maintaining 34 kLOC
> patch and minor upgrade which we need to figure out.
> upgrading to 3.4.4 is less favourable as it still leaves 33 CVE's open an=
d
> for that we would still have a larger patch to maintain rather than patch=
es
> getting applied directly.
>
> Since rsync does not expose an architecture-wide library (librsync is a
> completely distinct project), upgrading it will *never break the ABI of
> other compiled packages* in rootfs. No other binary links against rsync
> dynamically at the linker level. on top of it, rsync is maintaining
> backword compatability. So upgrading to 3.5.x wouldn't be an issue too.
>
> To talk about the regressions in 3.5.0, they are being fixed in 3.5.1
> which is planned to release on 21st september.
>
> we have 2 ways in front of us:
> 1) maintain the 34 kLOC patch for 3.4.1.
> Pros: we will mostly have maintainence till 2031( 1 year more than wrynos=
e
> EOL).
> cons: large patches to be maintained. (we can locally tar it though but
> still has to be maintained)
>
> 2) upgrade the 3.5.1
> Pros: no need to maintain large patches and we would be in line with
> upstream.
> Cons: we will be violating the stable upgrade policy of no new features
> and there are chances we would encounter same situation in future when mo=
re
> CVE's are found affecting the newer version.
>
> i am fine with either of the way as one of fellow contributor. But, let m=
e
> know your thoughts.
>
> Regards,
> Siddharth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246070):
> https://lists.openembedded.org/g/openembedded-core/message/246070
> Mute This Topic: https://lists.openembedded.org/mt/121293944/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e252a0065bfbae4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span>Hi Yoann, Paul,</span></p><p><span>I checked with=
 the rsync upstream maintainers regarding the security patch branches and t=
he possibility of an archive/tarball.</span></p><p><span>They confirmed tha=
t </span><code dir=3D"ltr"><span>v3.4.1-sec-patches3</span></code><span> an=
d </span><code dir=3D"ltr"><span>v3.2.7-sec-patches3</span></code><span> ar=
e official rsync security-maintenance branches. They have now also publishe=
d:</span></p><ul><li><code dir=3D"ltr"><span>v3.4.1-sec-patches4</span></co=
de></li><li><code dir=3D"ltr"><span>v3.2.7-sec-patches4</span></code></li><=
/ul><p><span>These branches contain the security and compatibility fixes ap=
plicable to the respective older release lines after </span><code dir=3D"lt=
r"><span>*-sec-patches3</span></code><span>. Both branches have been tested=
 against the refreshed stable testsuite.</span></p><p><span>Regarding the a=
rchive/tarball, the maintainer clarified that they do not plan to provide r=
elease tarballs for these security branches. The branches are intended to b=
e used as reviewable Git sources from which downstream maintainers can cher=
ry-pick commits or construct their own patch series.</span></p><p><span>Bas=
ed on this, can we switch the rsync recipe to Git and use the </span><code =
dir=3D"ltr"><span>v3.4.1-sec-patches4</span></code><span>=C2=A0&amp;=C2=A0<=
/span><code dir=3D"ltr"><span>v3.2.7-sec-patches4=C2=A0</span></code><span>=
branches for Wrynose/Scarthgap?<br><br></span></p><p><span>This would allow=
 us to consume the upstream security and compatibility fixes directly from =
the maintained security branch instead of carrying the large 34KLOC patch s=
eries.</span></p><p><span><br></span></p><p><span>The discussion with the r=
sync maintainers is here:</span><br><a href=3D"https://github.com/RsyncProj=
ect/rsync/discussions/1095"><span>https://github.com/RsyncProject/rsync/dis=
cussions/1095</span></a></p><div><br></div><div>Thanks &amp; Regards,</div>=
<div>Vijay</div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2026 at 8:03=E2=80=AF=
PM Siddharth Doshi via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;sdoshi=3D<a href=3D"mailto:mvista.com@lists.openembedd=
ed.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>Hi Yoann, Paul and Vijay,<br>=
<br></div>
<div><code dir=3D"ltr" style=3D"box-sizing:border-box;font-family:Menlo,Mon=
aco,Consolas,&quot;Courier New&quot;,monospace;font-size:14.4px;padding:2px=
 4px;color:rgb(199,37,78);background-color:rgb(249,242,244);border-radius:4=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;word-spacing:0px;white-space:normal;text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"box-sizing:border-box=
">v3.4.1-sec-patches3</span></code><span style=3D"box-sizing:border-box;col=
or:rgb(51,51,51);font-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;He=
lvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,=
sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;S=
egoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;font-size:16px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;word-spacing:0px;white-space:normal;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span>=C2=A0</s=
pan>and<span>=C2=A0</span></span><code dir=3D"ltr" style=3D"box-sizing:bord=
er-box;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;=
font-size:14.4px;padding:2px 4px;color:rgb(199,37,78);background-color:rgb(=
249,242,244);border-radius:4px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;word-spacing:0px;white-space:n=
ormal;text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"box-sizing:border-box">v3.2.7-sec-patches3</span></code> both the br=
anches are part of official security release afaik.<br><br></div>
<div>these versions corresponds to ubuntu/launchpad PPA for racoon and nobl=
e respectively so i see them being maintained till 2031 and 2029 atleast(un=
less ubuntu decides on bumping those versions up in unforseen situations).<=
br><br>with that being said, yes it is trade-off between maintaining <span =
style=3D"color:rgb(51,51,51);font-family:system-ui,&quot;Segoe UI&quot;,Rob=
oto,&quot;Helvetica Neue&quot;,&quot;Noto Sans&quot;,&quot;Liberation Sans&=
quot;,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;;font-size:16p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;word-spacing:0px;white-space:pre-wrap;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;di=
splay:inline;float:none">34 kLOC patch and minor upgrade which we need to f=
igure out.<br>upgrading to 3.4.4 is less favourable as it still leaves 33 C=
VE&#39;s open and for that we would still have a larger patch to maintain r=
ather than patches getting applied directly.<br><br>Since <code dir=3D"ltr"=
 style=3D"font-family:monospace;font-size:14px;font-weight:400;margin:0px;t=
ext-decoration:none;border-bottom:0.8px solid rgb(240,242,245)">rsync</code=
> does not expose an architecture-wide library (<code dir=3D"ltr" style=3D"=
font-family:monospace;font-size:14px;font-weight:400;margin:0px;text-decora=
tion:none;border-bottom:0.8px solid rgb(240,242,245)">librsync</code> is a =
completely distinct project), upgrading it will <strong style=3D"font-famil=
y:&quot;Google Sans&quot;,sans-serif;font-size:16px;font-weight:bold;margin=
:0px;text-decoration:none;border-bottom:0px rgb(10,10,10)">never break the =
ABI of other compiled packages</strong> in rootfs. No other binary links ag=
ainst <code dir=3D"ltr" style=3D"font-family:monospace;font-size:14px;font-=
weight:400;margin:0px;text-decoration:none;border-bottom:0.8px solid rgb(24=
0,242,245)">rsync</code> dynamically at the linker level. on top of it, rsy=
nc is maintaining backword compatability. So upgrading to 3.5.x wouldn&#39;=
t be an issue too.<br><br>To talk about the regressions in 3.5.0, they are =
being fixed in 3.5.1 which is planned to release on 21st september. <br><br=
>we have 2 ways in front of us:<br>1) maintain the <span style=3D"color:rgb=
(51,51,51);font-family:system-ui,&quot;Segoe UI&quot;,Roboto,&quot;Helvetic=
a Neue&quot;,&quot;Noto Sans&quot;,&quot;Liberation Sans&quot;,Arial,sans-s=
erif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe U=
I Symbol&quot;,&quot;Noto Color Emoji&quot;;font-size:16px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wo=
rd-spacing:0px;white-space:pre-wrap;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;display:inline;float=
:none">34 kLOC patch for 3.4.1. <br>Pros: we will mostly have maintainence =
till 2031( 1 year more than wrynose EOL). <br>cons: large patches to be mai=
ntained. (we can locally tar it though but still has to be maintained)<br><=
br>2) upgrade the 3.5.1<br>Pros: no need to maintain large patches and we w=
ould be in line with upstream.<br>Cons: we will be violating the stable upg=
rade policy of no new features and there are chances we would encounter sam=
e situation in future when more CVE&#39;s are found affecting the newer ver=
sion.<br><br>i am fine with either of the way as one of fellow contributor.=
 But, let me know your thoughts.<br><br>Regards,<br>Siddharth</span></span>=
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246070): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246070" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246070</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121293944/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121293944/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e252a0065bfbae4f--

