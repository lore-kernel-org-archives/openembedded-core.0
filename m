Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BCC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 06:38:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7190.1743662309724209874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 23:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAUn/6q9;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: samuli.piippo@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so84395066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 23:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743662308; x=1744267108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWHNMbmLcq3pvnv6S7DzIspkjdaOt+caB13aQs84xcM=;
        b=ZAUn/6q9T/6XdxgjEamLjWaVP13T3wiEosCEFT6NNLLqFOleZFTQsDyIMsjjI+O/t7
         IYdSpSjhvIths+A7Esvaf76ZmAHhBc7cyHPQa5+D+2H7cVJTEhFtP3jEHdyvS6GMnSEa
         pXX5q/oal7g8cxQ2aIjoEZ6ytFpqMfUNqIfPlDmNjoWtiWdoSetC0PrcmRUX5V8eBCOo
         V2bX+d+RFuX8vv22WzEKwZr4fZD0XXKIkiOdpcdAe92Q10XQ4q/y1fbe4UnP5TIhg8K2
         9opXEDNhfEhcwH6Cezo330VWOkv0px1XjywwPqnMSSpJU84Gx/FbJJjtgaKJ5gK2A2qs
         kBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662308; x=1744267108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWHNMbmLcq3pvnv6S7DzIspkjdaOt+caB13aQs84xcM=;
        b=SWMwZiHQRGfsOkkSuzispwr+Kd/3YWQQAGsb60yFnGb4K4rriCRVR+O4pjkJDATam6
         S/11rw386929vfvLhXDJsym8K3J1CGxU0wWfK5nRZnAIOxVaRAuJYQuVRiLJLaCilTkT
         JRML/j3v55ui3iBGAgLF2EQzFMyrRMdwTuqtFDWHrq0/BVBynrVVhayMM5uFZxmIsGzh
         MsVJ4se+3WcKX0I86jm3ikShrHR2BmDQvj9tb5E2FH1hJ+Y+pdfj7e0yTGmm2kRUpWHr
         tp2yk3/vlqEdDqvHw241nkCsKapN2rn2bz4RAt18X80oF8IP6mIQm0QrohmLw7XBWZFa
         dhMg==
X-Forwarded-Encrypted: i=1; AJvYcCVEDkQ25PAbCI9a+w5K/K/RWzJzGEHuTjzwCwMq+4a5Sp86OiwFtk++UWU2WYQc5Azhe4pO0v89L/OCuEOgqfBRVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYhfGz7397J0OFQlt3Oc0bVWT6tjYxxXmagt0W0378qzovqDop
	/tHHM5dkDf/0YIZGxc3ObuhgPKK1zeIr8aOwMADpIM/FBXkmEZAsdfPYzko1adeHilWAErpnkqk
	dAGzcc4PhFkOOzpPEYyw2GnBFKD4=
X-Gm-Gg: ASbGncvH2X8/zjRqX3i6369mH5e4HiOAgzyOlRE4OKCRcFD6Tb6F9vUlyHIQzpRhyZY
	pIZxYFILgSKqKiOmEna51DXRASjVPTZPUlb2mZQPn3IgNX657YqlxiX4/Fhmqrp/YGXirfLtYZc
	VY2XFlronWj8qV5M1jobYXOadu1w==
X-Google-Smtp-Source: AGHT+IFSV9eViWMxidULqTNMINmN3N7+OfKXlibOZHOJmcC7hpA4ZhV0biSmYtReJgGRIJb8wvrWSOp6/+h1ZyJfNhA=
X-Received: by 2002:a17:906:c148:b0:ac7:9817:60aa with SMTP id
 a640c23a62f3a-ac7981769famr561229866b.2.1743662307764; Wed, 02 Apr 2025
 23:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
 <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com> <78779584-17f7-484f-b4d5-b41cb37c777d@gmail.com>
In-Reply-To: <78779584-17f7-484f-b4d5-b41cb37c777d@gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 3 Apr 2025 09:38:15 +0300
X-Gm-Features: ATxdqUHBVQu5twM3Z-g5ay5HVbZv8CJaKmCAo-uiX5hgC4d1ty-poVEC-GpfTKQ
Message-ID: <CABXoSoWg0vy_aFB5OmtT1A1Csaq01Mvk43_EQGNofUMyQzDDLg@mail.gmail.com>
Subject: Re: [OE-core] meta-qt6 on layerindex
To: Khem Raj <raj.khem@gmail.com>
Cc: martin.jansa@gmail.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000007672840631da04ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 06:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214300

--0000000000007672840631da04ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Layerindex provides only 1:1 mapping. There is no consideration for
branches that support multiple Yocto releases via LAYERSERIES_COMPAT or
otherwise.
The aim with meta-qt6 should be to map LTS releases together.
kirkstone -> Qt 6.5 is already in place, scarthgap -> Qt 6.8 should be
added.
Qt is changing the release cycle of LTS releases to one every two years,
which then matches Yocto release cycle, assuming Wrynose 6.0 is going to be
LTS.

-samuli

On Thu, 3 Apr 2025 at 03:37, Khem Raj <raj.khem@gmail.com> wrote:

>
> On 4/2/25 12:37 AM, Samuli Piippo via lists.openembedded.org wrote:
>
> It would be great if I were able to, as the layer maintainer, add the
> needed branch mappings to the layerindex.
> So far, Tim has been the one to update those.
>
> scarthgap -> 6.8
> styhead -> 6.9
>
> If Tim or other admin could add these branch mappings, that would be grea=
t.
> The mapping can be added from admin view: Layer branches =E2=80=BA Add la=
yer branch
> AFAIK, only Branch and Actual Branch values need to be set up.
> Once there is a layer branch set up, it appears, I also have access right=
s
> to modify it.
>
> What do the mappings look like, in any release there are multiple QT
> releases that are supported. LTS releases might make less combinations to
> map, how do these maps look when these branches become old but yocto
> release branch it is pointing to is LTS. There are many permutations and
> combinations.
>
>
>
> -samuli
>
>
>
> On Tue, 1 Apr 2025 at 13:07, Martin Jansa via lists.openembedded.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Hi,
>>
>> some layers on layerindex cannot be correctly parsed because they
>> depend on meta-qt6 (qt6-layer) and there is no record of scarthgap or
>> styhead compatible release of meta-qt6 on layerindex.
>>
>> There are:
>>
>> https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-q=
t6/
>> - actual branch 6.5
>> https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/
>> - actual branch dev
>>
>> but no
>> https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6=
/
>>
>> https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-q=
t6/
>>
>> which causes e.g.:
>>
>> ERROR: Issues found on branch styhead:
>>     meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
>> not satisfied
>>     meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
>> not satisfied
>> ERROR: Issues found on branch scarthgap:
>>     meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
>> not satisfied
>>     meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
>> not satisfied
>>
>> and there will be more once meta-webosose parsing is fixed.
>>
>> Is Tim the only person who can help with some admin changes on
>> layerindex? RP suggested to ask Ross as well.
>>
>> I have admin rights to publish new layers (and edit all existing
>> layers), but cannot delete wrongly created ones (or their mapping) and
>> I'm not sure how to add a new mapping (e.g. add scarthgap and styhead
>> release for meta-qt6 by using actual branch 'dev' or '6.8').
>>
>> meta-qt6 dev, 6.9 and 6.8 branches have:
>> LAYERSERIES_COMPAT_qt6-layer =3D "kirkstone langdale mickledore nanbield
>> scarthgap styhead walnascar"
>> 6.7 doesn't have walnascar
>> 6.6 and 6.5 (currently used for kirkstone) have:
>> LAYERSERIES_COMPAT_qt6-layer =3D "dunfell gatesgarth hardknott honister
>> kirkstone langdale mickledore nanbield scarthgap"
>>
>> maybe even
>> https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-q=
t6/
>> which is currently using actual branch 6.5 should be bumped to 6.8 as
>> well.
>>
>> Cheers,
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214227): https://lists.openembedded.org/g/openembedde=
d-core/message/214227
> Mute This Topic: https://lists.openembedded.org/mt/112022134/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> -Khem
>
>

--0000000000007672840631da04ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Layerindex provides only 1:1 mapping=
. There is no consideration for branches that support multiple Yocto releas=
es via LAYERSERIES_COMPAT or otherwise.</div><div>The aim with meta-qt6 sho=
uld be to map LTS releases together.</div><div>kirkstone -&gt; Qt 6.5 is al=
ready in place, scarthgap -&gt; Qt 6.8 should be added.</div><div>Qt is cha=
nging the release cycle of LTS releases to one every two years, which then =
matches Yocto release cycle, assuming Wrynose 	6.0 is going to be LTS.</div=
><div><br></div><div>-samuli</div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Apr 2025 =
at 03:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><u></u>

 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 4/2/25 12:37 AM, Samuli Piippo via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div>It would be great if I were able to, as the layer
            maintainer, add the needed branch mappings to the
            layerindex.</div>
          <div>So far, Tim has been the one to update those.</div>
          <div><br>
          </div>
          <div>scarthgap -&gt; 6.8</div>
          <div>styhead -&gt; 6.9</div>
          <div><br>
          </div>
          <div>If Tim or other admin could add these branch mappings,
            that would be great.</div>
          <div>The mapping can be added from admin view: Layer branches
            =E2=80=BA Add layer branch</div>
          <div>AFAIK, only Branch and Actual Branch values need to be
            set up.</div>
          <div>Once there is a layer branch set up, it appears, I also
            have access rights to modify it.</div>
        </div>
      </div>
    </blockquote>
    <p>What do the mappings look like, in any release there are multiple
      QT releases that are supported. LTS releases might make less
      combinations to map, how do these maps look when these branches
      become old but yocto release branch it is pointing to is LTS.
      There are many permutations and combinations.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div><br>
          </div>
          <div>-samuli</div>
          <div><br>
          </div>
          <div><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Apr 2025 at 13:07=
,
            Martin Jansa via <a href=3D"http://lists.openembedded.org" targ=
et=3D"_blank">lists.openembedded.org</a>
            &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
            <br>
            some layers on layerindex cannot be correctly parsed because
            they<br>
            depend on meta-qt6 (qt6-layer) and there is no record of
            scarthgap or<br>
            styhead compatible release of meta-qt6 on layerindex.<br>
            <br>
            There are:<br>
            <a href=3D"https://layers.openembedded.org/layerindex/branch/ki=
rkstone/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layer=
s.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/</a><br>
            - actual branch 6.5<br>
            <a href=3D"https://layers.openembedded.org/layerindex/branch/ma=
ster/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.o=
penembedded.org/layerindex/branch/master/layer/meta-qt6/</a><br>
            - actual branch dev<br>
            <br>
            but no<br>
            <a href=3D"https://layers.openembedded.org/layerindex/branch/st=
yhead/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layers.=
openembedded.org/layerindex/branch/styhead/layer/meta-qt6/</a><br>
            <a href=3D"https://layers.openembedded.org/layerindex/branch/sc=
arthgap/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">https://layer=
s.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt6/</a><br>
            <br>
            which causes e.g.:<br>
            <br>
            ERROR: Issues found on branch styhead:<br>
            =C2=A0 =C2=A0 meta-luneos: Failed to add since LAYERDEPENDS
            [meta-luneui ...] is<br>
            not satisfied<br>
            =C2=A0 =C2=A0 meta-luneui: Failed to add since LAYERDEPENDS [qt=
6-layer
            ...] is<br>
            not satisfied<br>
            ERROR: Issues found on branch scarthgap:<br>
            =C2=A0 =C2=A0 meta-luneos: Failed to add since LAYERDEPENDS
            [meta-luneui ...] is<br>
            not satisfied<br>
            =C2=A0 =C2=A0 meta-luneui: Failed to add since LAYERDEPENDS [qt=
6-layer
            ...] is<br>
            not satisfied<br>
            <br>
            and there will be more once meta-webosose parsing is fixed.<br>
            <br>
            Is Tim the only person who can help with some admin changes
            on<br>
            layerindex? RP suggested to ask Ross as well.<br>
            <br>
            I have admin rights to publish new layers (and edit all
            existing<br>
            layers), but cannot delete wrongly created ones (or their
            mapping) and<br>
            I&#39;m not sure how to add a new mapping (e.g. add scarthgap
            and styhead<br>
            release for meta-qt6 by using actual branch &#39;dev&#39; or &#=
39;6.8&#39;).<br>
            <br>
            meta-qt6 dev, 6.9 and 6.8 branches have:<br>
            LAYERSERIES_COMPAT_qt6-layer =3D &quot;kirkstone langdale
            mickledore nanbield<br>
            scarthgap styhead walnascar&quot;<br>
            6.7 doesn&#39;t have walnascar<br>
            6.6 and 6.5 (currently used for kirkstone) have:<br>
            LAYERSERIES_COMPAT_qt6-layer =3D &quot;dunfell gatesgarth hardk=
nott
            honister<br>
            kirkstone langdale mickledore nanbield scarthgap&quot;<br>
            <br>
            maybe even <a href=3D"https://layers.openembedded.org/layerinde=
x/branch/kirkstone/layer/meta-qt6/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/</=
a><br>
            which is currently using actual branch 6.5 should be bumped
            to 6.8 as<br>
            well.<br>
            <br>
            Cheers,<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#214227): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214227" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/214227</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112022134/199=
7914" target=3D"_blank">https://lists.openembedded.org/mt/112022134/1997914=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khe=
m@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <pre cols=3D"72">--=20
-Khem</pre>
  </div>

</blockquote></div></div>

--0000000000007672840631da04ed--

