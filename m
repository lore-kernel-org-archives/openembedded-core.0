Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9BEC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:37:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.2446.1743579453739021785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQd/jHwx;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso1093267066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743579452; x=1744184252; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JZR5ajMYmxpJX3W2I00b8bZjieHwofEy6Sihz6B67ZU=;
        b=QQd/jHwxgQrhsjBjg1YaHPtogwnmIb7Idb4nHClcC2Dy+1fOAZAh7OQYUhG0rvxAhx
         oOvYTqeGA0l63UjaAqtSABBwlKyFY6iZq0iyzj0yheWHqG9ZGO/BN2CtDUTFnqv1TMbm
         2OgY37W/AL2ht2okA9SZiykuswkquyihUqL/ESaOofqqaDEXzfrlOqMwTJKExnm7rkK+
         2TECjEckqLI0YKG7fo/snu+gjA8rdP9fLp6hy0Uue24OQgUjVdRD8KVpI/SP6CCVrNNE
         eycWs8e1R4CjEIp/I77kCL4zFyBi/aqPQJtZA2jhi49BQXl9rp5/ZhyB4iRGxX/SPRm+
         Qnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579452; x=1744184252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZR5ajMYmxpJX3W2I00b8bZjieHwofEy6Sihz6B67ZU=;
        b=FXGtzGaR7g/iNc/uq8T8S5q7iyQTy0XAFawxXLJRzlDYX8/5+UgoQSTBQ/casV02DN
         9a9P21pAIW2ROS77ALf825dA7oRIlJMhl4DWWRNzbvinWVOZcsmMbV7x3g118vr4Rrqo
         xqJAg0xVjNleFsxMcbfTFMadOcYubEWKJX0qNgzd8OJ7OZFGLflZNFq/7JOsCs/e37XZ
         Wf2WSNkkGIwNmggOBxdd0fhUH91aS7ooNEMeYZELNhocKASaoXGSQuS2ihGHEi/TPhtF
         4FAwp97DCn4LvIAVAigoCOAye2tJDs6hASjtrLq5RxOLDUcqS146syO6ABPdP5q+NtMD
         M+lg==
X-Gm-Message-State: AOJu0Yy7OtQNQy7TDrVgJYMtgwr4B5eaLkYnigJcRfKsO2l7mBH7L70b
	bD0497R5JrNi/wJueFCRZ3ro5z4rYjePPcqILekBvFVjYec0O8NhAvGi3eq9/CIeujEaOQcL9BJ
	/HCItcNYRnBB8Vpz98hz5uhdljjw=
X-Gm-Gg: ASbGncvyRECzJmKfYq+RrXW91dyWSbBHCLLHMUeIksYpuIWuLPyYMKofvLXptI+lu99
	WVj01oydwURaCu7LeDbOk76W41SkJC7S+avhIiXByDQJTi0SnzXJMGvCvUxjts5W7izsQi8x0Ha
	LHmpedpgkkJtwLaY6yneQlPZ3xKQ==
X-Google-Smtp-Source: AGHT+IHcorQRRRS6xDJHCmsE4gbrJYibf+D+m+dqf5T0ii8EEkWd6fLotQbhHa7lmjjFck1yqdVmjkUd0O0BviUrslg=
X-Received: by 2002:a17:907:9693:b0:ac4:491:1548 with SMTP id
 a640c23a62f3a-ac73898d6abmr1577097266b.11.1743579451725; Wed, 02 Apr 2025
 00:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
In-Reply-To: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 2 Apr 2025 10:37:19 +0300
X-Gm-Features: AQ5f1JrVY5zEVCXVwgTZU4RMCcvE0Xq8qTVmMh_ZvdVET8icAB3fG6cZoow3BJ4
Message-ID: <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com>
Subject: Re: [OE-core] meta-qt6 on layerindex
To: martin.jansa@gmail.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000dba3140631c6b9c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214227

--000000000000dba3140631c6b9c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It would be great if I were able to, as the layer maintainer, add the
needed branch mappings to the layerindex.
So far, Tim has been the one to update those.

scarthgap -> 6.8
styhead -> 6.9

If Tim or other admin could add these branch mappings, that would be great.
The mapping can be added from admin view: Layer branches =E2=80=BA Add laye=
r branch
AFAIK, only Branch and Actual Branch values need to be set up.
Once there is a layer branch set up, it appears, I also have access rights
to modify it.

-samuli



On Tue, 1 Apr 2025 at 13:07, Martin Jansa via lists.openembedded.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Hi,
>
> some layers on layerindex cannot be correctly parsed because they
> depend on meta-qt6 (qt6-layer) and there is no record of scarthgap or
> styhead compatible release of meta-qt6 on layerindex.
>
> There are:
> https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt=
6/
> - actual branch 6.5
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/
> - actual branch dev
>
> but no
> https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6/
> https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt=
6/
>
> which causes e.g.:
>
> ERROR: Issues found on branch styhead:
>     meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
> not satisfied
>     meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
> not satisfied
> ERROR: Issues found on branch scarthgap:
>     meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
> not satisfied
>     meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
> not satisfied
>
> and there will be more once meta-webosose parsing is fixed.
>
> Is Tim the only person who can help with some admin changes on
> layerindex? RP suggested to ask Ross as well.
>
> I have admin rights to publish new layers (and edit all existing
> layers), but cannot delete wrongly created ones (or their mapping) and
> I'm not sure how to add a new mapping (e.g. add scarthgap and styhead
> release for meta-qt6 by using actual branch 'dev' or '6.8').
>
> meta-qt6 dev, 6.9 and 6.8 branches have:
> LAYERSERIES_COMPAT_qt6-layer =3D "kirkstone langdale mickledore nanbield
> scarthgap styhead walnascar"
> 6.7 doesn't have walnascar
> 6.6 and 6.5 (currently used for kirkstone) have:
> LAYERSERIES_COMPAT_qt6-layer =3D "dunfell gatesgarth hardknott honister
> kirkstone langdale mickledore nanbield scarthgap"
>
> maybe even
> https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt=
6/
> which is currently using actual branch 6.5 should be bumped to 6.8 as
> well.
>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214012):
> https://lists.openembedded.org/g/openembedded-core/message/214012
> Mute This Topic: https://lists.openembedded.org/mt/112022134/3617605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> samuli.piippo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dba3140631c6b9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>It would be great if I were able to,=
 as the layer maintainer, add the needed  branch mappings to the layerindex=
.</div><div>So far, Tim has been the one to update those.</div><div><br></d=
iv><div>scarthgap -&gt; 6.8</div><div>styhead -&gt; 6.9</div><div><br></div=
><div>If Tim or other admin could add these branch mappings, that would be =
great.</div><div>The mapping can be added from admin view: Layer branches =
=E2=80=BA Add layer branch</div><div>AFAIK, only Branch and Actual Branch v=
alues need to be set up.</div><div></div><div>Once there is a layer branch =
set up, it appears, I also have access rights to modify it.</div><div><br><=
/div><div>-samuli</div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 1 Apr 2025 at 13:07, Martin Jansa via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<b=
r>
<br>
some layers on layerindex cannot be correctly parsed because they<br>
depend on meta-qt6 (qt6-layer) and there is no record of scarthgap or<br>
styhead compatible release of meta-qt6 on layerindex.<br>
<br>
There are:<br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/kirkstone/laye=
r/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedd=
ed.org/layerindex/branch/kirkstone/layer/meta-qt6/</a><br>
- actual branch 6.5<br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/master/layer/m=
eta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded.=
org/layerindex/branch/master/layer/meta-qt6/</a><br>
- actual branch dev<br>
<br>
but no<br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/styhead/layer/=
meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedded=
.org/layerindex/branch/styhead/layer/meta-qt6/</a><br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/scarthgap/laye=
r/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.openembedd=
ed.org/layerindex/branch/scarthgap/layer/meta-qt6/</a><br>
<br>
which causes e.g.:<br>
<br>
ERROR: Issues found on branch styhead:<br>
=C2=A0 =C2=A0 meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ..=
.] is<br>
not satisfied<br>
=C2=A0 =C2=A0 meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...]=
 is<br>
not satisfied<br>
ERROR: Issues found on branch scarthgap:<br>
=C2=A0 =C2=A0 meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ..=
.] is<br>
not satisfied<br>
=C2=A0 =C2=A0 meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...]=
 is<br>
not satisfied<br>
<br>
and there will be more once meta-webosose parsing is fixed.<br>
<br>
Is Tim the only person who can help with some admin changes on<br>
layerindex? RP suggested to ask Ross as well.<br>
<br>
I have admin rights to publish new layers (and edit all existing<br>
layers), but cannot delete wrongly created ones (or their mapping) and<br>
I&#39;m not sure how to add a new mapping (e.g. add scarthgap and styhead<b=
r>
release for meta-qt6 by using actual branch &#39;dev&#39; or &#39;6.8&#39;)=
.<br>
<br>
meta-qt6 dev, 6.9 and 6.8 branches have:<br>
LAYERSERIES_COMPAT_qt6-layer =3D &quot;kirkstone langdale mickledore nanbie=
ld<br>
scarthgap styhead walnascar&quot;<br>
6.7 doesn&#39;t have walnascar<br>
6.6 and 6.5 (currently used for kirkstone) have:<br>
LAYERSERIES_COMPAT_qt6-layer =3D &quot;dunfell gatesgarth hardknott honiste=
r<br>
kirkstone langdale mickledore nanbield scarthgap&quot;<br>
<br>
maybe even <a href=3D"https://layers.openembedded.org/layerindex/branch/kir=
kstone/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers=
.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/</a><br>
which is currently using actual branch 6.5 should be bumped to 6.8 as<br>
well.<br>
<br>
Cheers,<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214012" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214012</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112022134/361=
7605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112022134/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com" t=
arget=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dba3140631c6b9c0--

