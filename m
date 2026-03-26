Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EBA109E53C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:11:48 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39460.1774491097931141173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q5xEgdfo;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64eee7b83cfso451109d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774491097; cv=none;
        d=google.com; s=arc-20240605;
        b=dqSy2r/Bu0nij7gQexIbLxd4HdfUIKPbRWG69v8BS/DFXk55UNMY7/C0PvJt1LrKcV
         /lJs2SwqG87WkSaZbMEJ9+9W8vrm36lHH08Y110ESAF+KxH03IcAZcChgZkcPGzi9dpz
         ygH5xKNVJSHPix6j8k+GPLzMeaWu5J+G5X/tjODrqeNToRLmJYTVGTsH4nxyskV1nMr8
         h+8HNpuwPUdY5FMZVEAGEqmN+sAANPIA7w7QgNeSXhwxGvjUfIYcQgq4d8paRrHo+0F3
         4TNK/cwQPrsnNm48jOOwl+UFne3ogUzgczwvnXA1Ib/sfmAqep9LU+uRb3QAAtwC3Mxf
         Zl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I/7BNyd2hViwB8F7nBvoRkELArqRKRBB9A1Xc2ykJ9E=;
        fh=DBggI1vwST8sHZz5miDAs3Kfl5FaV5CpuZRclKXf2+w=;
        b=DpU7K6tcjuddUHpxVF/sxaegsGTSizcuNqI/bfNFtW/x2CR1dt3neAah89trD8lN9l
         ETZWKbz+68sI5YIdSM4JOgF4NBe0fQgNbELDHeoGuGRz4fxu7aFy1JvcNPwLOSkaCIGB
         kAVPCC/pXkpWL3t6BLDRI+LeNDdW8uyMJo/zNRynzIywSxVk1X6Cbwut1QU7EvQWj98J
         LhLyCSXkzxKEKBRYePZu6qL9cRPZmZRqJ3Z5nFwYGxqBu+cuD6/V1+iyDWkZM6jmfRjJ
         GZ+8qBjq6wWmzHYtQ3/x/YCYQQ1OrxBevhjf2Geps2CV2LMRpyMl5RABbAnclhKGdXFE
         +G+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774491097; x=1775095897; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/7BNyd2hViwB8F7nBvoRkELArqRKRBB9A1Xc2ykJ9E=;
        b=Q5xEgdfoXzXGPJka+Jdn91hbVpFuTzZilZmevyRCKoSVJz8vee62sEVDRhxzuoI0NE
         5z/pNsRw5zDowgGjYuAREY4ywEhGQjQgtYXkbf/yFX/Glj0XG30bxadVP0yNo6Csa3dd
         PsyNet+BcMEwjOAKMDopXJ4m9RXZmJ/uzR3ZYQSYD63hDiPouswg48qnBfTPO+2atCjR
         MrdihuwRP8L5J1wS6udA0JBeUPo4IV70nRyc9AILG8904xPpm9cEyoRNQKRiGziaVH+K
         +x7ITkRTJn+iqVl49CtkhcAxNn4xNN+GrJRiumedhwle5ML7s6y/L+zzPKpFNERdBbzp
         CHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774491097; x=1775095897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/7BNyd2hViwB8F7nBvoRkELArqRKRBB9A1Xc2ykJ9E=;
        b=RAtW/Y2Uv+vkE96xTzybMjZmjSErqlKAkP5pnLDaiDEUEDteC3lxyEcR8J5VO9b0S1
         s4nWJbglzeN/iWgLqAw/daOeHT1dVdc7ha3ahT/jbpGUbDyifuZF6jNgdbLj2D6qqzi8
         G479sN1J/gy4fWEFIKHqW/HnhcswvIL86dDPN917K1ufWCulcPtmb5qutmMDeUHJRjtV
         wLkhOVMPctsUd0E7OIDYjlWxjdNhtugzcadA6YakL6mUJwoXPIJZMDuEmncu4PqWtdEa
         kU/li0bX9qwp+9tTKWgP5G76vHV70BBk+8jv+QfeMO7rXHYaG6/W1kXLYLzTAS3MeTIy
         g7Hg==
X-Gm-Message-State: AOJu0YzMLl8qij2ne5x+7Y2RSza6Rwhi20wE92QYfP+s9YSWPSHn3PKb
	OFrA3q0EAMioLbT82Tn9X1dtz/IlZgxIhs2DYeW6kdSJ/wRUfHcdWRJByY3FGkpO+3WahnDE3RU
	0j6YMEIMrBNsczTA337F450usRWB0yEQPaxAr
X-Gm-Gg: ATEYQzwFg5lVqP81uaBNsHsIFtx+e2fjKmffbjUuowp9gpkq6efcVJeqlDJbYxWhKcL
	2nl7EKNOczNvqF+DLsWT1+YqZ6JSoicMMllaerxlQrby5NeNeJgWMhG7gfAsvA40Cr/PolT+rOU
	I2BSMBm+D5e3axxUqLl1ZN8SXbO//5KHLB1Q4Xqr2zsOiR+ZKG6Ot0eU/GWH5yLOrEdONckye0v
	ISJc6yPo9Vw/VIWCg2TTCgtURl9pkfbZolq4cDYt2SF9KU9oihyYoheG5ApM5QM2lblHs+hE1NG
	Lrg0FRi+fkAqY/H+RRYYx54Y3fLK+jS2CVlRtkK4LMjnbKH1jhqoPhZy4mFB0LHvoufOYApjcQg
	jlJ0CfsFAD/xmP9DzFvKJHpLMqZByd0taJaJuCA==
X-Received: by 2002:a05:690e:2451:b0:64e:b40e:6e89 with SMTP id
 956f58d0204a3-64ee617b0e5mr4510497d50.73.1774491096881; Wed, 25 Mar 2026
 19:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
 <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org> <564384.1774432040914167813@lists.openembedded.org>
In-Reply-To: <564384.1774432040914167813@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 19:11:10 -0700
X-Gm-Features: AaiRm52xL2HcR3WEa9q9Ku-HIaTBy82bdDITqPnVcNQEEimf9WuL2m1p9RSFQJ8
Message-ID: <CAMKF1srOPtoHFP+ufeXK0JL3qVyzzqbSxiQfuQQau5TFjS8E6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] clang/llvm: Upgrade to 22.x major release
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007ca050064de3e72b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233945

--0000000000007ca050064de3e72b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:47=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> On Wed, Mar 25, 2026 at 03:01 PM, Richard Purdie wrote:
>
> error: data-layout for target `amdgcn-amd-amdhsa`,
>
> `e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:2=
56:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v=
48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A=
5-G1-ni:7:8:9`,
> differs from LLVM target's `amdgcn-amd-amdhsa` default layout,
>
> `e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:1=
60:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:=
32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S=
32-A5-G1-ni:7:8:9`
>
> I think this commit needs to be backported from upstream to fix this issu=
e
>
> https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c=
99d19eae
>
>
Right.


> Regards,
> Deepesh
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233868):
> https://lists.openembedded.org/g/openembedded-core/message/233868
> Mute This Topic: https://lists.openembedded.org/mt/118493193/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007ca050064de3e72b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25,=
 2026 at 2:47=E2=80=AFAM Varatharajan, Deepesh via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>On Wed, Mar 25, 2026 at 03:01 PM, Richard Purdie wrote:<=
/div>
<div>
<blockquote>error: data-layout for target `amdgcn-amd-amdhsa`,=C2=A0<br>`e-=
p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:25=
6:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64=
-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-=
ni:7:8:9`,=C2=A0<br>differs from LLVM target&#39;s `amdgcn-amd-amdhsa` defa=
ult layout,=C2=A0<br>`e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:=
32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64=
-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-=
v2048:2048-n32:64-S32-A5-G1-ni:7:8:9`</blockquote>
I think this commit needs to be backported from upstream to fix this issue<=
br><a href=3D"https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e258c=
f33240c2fe7c99d19eae" rel=3D"noopener" target=3D"_blank">https://github.com=
/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c99d19eae</a><br><br>=
</div></blockquote><div><br></div><div>Right.=C2=A0</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>Regards,<br>Deepesh</=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233868): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233868" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233868</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118493193/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118493193/1997914</a><br>
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

--0000000000007ca050064de3e72b--

