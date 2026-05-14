Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC423CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 08:22:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5852.1778746971870050447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 01:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kcJHvWds;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso6412850a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 01:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778746970; cv=none;
        d=google.com; s=arc-20240605;
        b=b7RdTW/++MA5Zk29rsCjK490cSsdcrZIK6YOhSKCPVCOitwFnnWdfPTp++7Mbn/HBe
         RHgg1f6kFv2rWqR2MP9PpphHlx8Nf0YU/qudlVwKth+VbhUK2SgRClYZX7muE1gw3z6y
         D0JGD2fSEzm0LKVWogv23VQmPXNPT5eND4lYZMZm8l9/tjCpNGhD82hgoxvOB52P7FTE
         3I0mqx5vr9uJYOF57AmdQFiQV8X6fWXvSuyrUEeHQHKRDVmbJmwmqaaHYvJRcIgEyI4i
         WDJiGZ3KcjHyGmcsSshTdUtRNTHEmkYWe6eGloBXyXlFVrGPg3/XBsbyeuNc6pK28tFJ
         8JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NS+6YeCDhrBNjrO3zQzbhlX/W5g6pDiZB8XyGfwqpHs=;
        fh=Uv02zkATCgn7o53lsNXolUGKtQvc6B50vI9sz2t8LT8=;
        b=P8UhAj9HWFL84I+RDU1nrfa9bRC5o6lZd/ymfdGgib2Fvp56ZYn4rSW6nkLBCcUqy6
         Lr4NUTF1OYEuTkGb9lsuFBt3Yocy7xN///nNKO6iITRyo+cmppRuUFW+Mv1wU2nXOIla
         XGzrw4LYVIM2AsK229qSUM4DXK7iZqXk3jtz3f9uP7rZvObNgPSIR/7C8tHRUne1tobK
         tXzZoNpoDgdpCZVjgyMxlwWN+Vh5gn9itXDNCRV1v1TP0jAjaN9TpttkSEfNf/Np/Atj
         0g5+H8cr+ZVfUC42iOggOtVdPyJ2v7DGe/ApNQ89n8ayH3Cn1Hho8965kqcEpsPoqkhW
         tLIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746970; x=1779351770; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NS+6YeCDhrBNjrO3zQzbhlX/W5g6pDiZB8XyGfwqpHs=;
        b=kcJHvWds1FMDpk+X1OPERbLHdgsvHUCoDjS54f+oBcAYRaywGcF7BcYFVQuol5uylD
         nhn5K/oE91NmaTNznoD+AuZzCbYhbBIYq6EAuqQPbNcQ73nZeMbf936fbSIYbLByxlQA
         hsQV7H4OwrQAd/Ed2/FHwbhterTTGfvdQO0T9k7CXGiSmIlT2DP5WGVrdlHJdDKmW9Pi
         hYFrwavngJpX1CXyjAWbZ7y0Xr4iA79yOiF2BvwtRgRSr9tZwWIUm/wIqVR4j0FCXH71
         83hamxd2c7y4yCBVxuLaAdB3ykTD91mtm6ORVKFfSLagdaYsjJq6qvUNwlALr+ywq1cG
         ngvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746970; x=1779351770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS+6YeCDhrBNjrO3zQzbhlX/W5g6pDiZB8XyGfwqpHs=;
        b=bh2UE36irlqpRndaek5Qt+zhXyAWjErUV5HDpyRcfF0SM9SLJ6Yl5fKJEkgMIxz2/G
         XBG9DhX0fX35XuWSXxhUseg+eY3sdtOOnVG4d9S8mFRy98IRLWlmy0nji66Z4cVFvlVC
         agfZEznpdsrzPSf8AXAnGlb0v0QyvsiN/exXujdaa23V2tG0gY1P7XjIfKwwa3n7ZnHb
         +UtKrE8h/rkdOVGy4mahOcAfrMzawqF9DCOYTZpAa5JvauNTzDRulye2Box1eHawr0Z1
         BuXUkMER0FmtcLV1kEUYoLdQoKaW1HS0nWhkeIJ2BQdyNX3yxrVp/VSZQ+ijCOlXTj7V
         tz5Q==
X-Gm-Message-State: AOJu0Yxy47JsSP105jNQVa5sINgRO/QZNYk4c9vmIrN7Mwc+CbbLhmXR
	KxIraP0QMh2oTSCC3DGbh4Vc6Pp3JTf3bkl6X1+1COfI4rilMXoiIqR5yw14LvOV6QMl28Ousa9
	cgzOonTr8WHcuOoDdKkN9ajDZ3cSGtnQ=
X-Gm-Gg: Acq92OHYOKSGZvaMK71X2rn2JfthFtlPZtmc0Ka7PhywmtLJUThpu9m7a5hbOMOnMla
	luMtQ8gHw6TRddQo2PiDbU8eqhAgi6m7V7p7AvIwQb6ydgZQq7MKqa1ulQpiaOdT7qzNIE98I7Z
	CrfVHuH4iUbk56gmBNbrKVerXTvyRsDgQJWXXQzUTuIXo5nkkFk7rafX2QquahQV8/pBRo4pz+T
	WJNUXNHRuj227W0rMjLdi+5qfgChTg7dkg2mWeAXwOGeVkHvHMRRByt6KPZ//ZEk3C+oZjCt88p
	9Lb/IYwO2Sj7c5WGVTRsLH8ORRGR8DY87L5BmKnwg0d3XTgufbXCYoQAbUT5Iesee+YrhA==
X-Received: by 2002:a17:907:9452:b0:bd3:1b13:7114 with SMTP id
 a640c23a62f3a-bd3c1841829mr454650766b.37.1778746969486; Thu, 14 May 2026
 01:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260507051048.3943372-1-changqing.li@windriver.com>
 <CANPvuRk2881_Eb=On2az8XnXiJbtC8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com> <1f7b593c-ed38-4de7-9409-b0f424dcdc1f@windriver.com>
In-Reply-To: <1f7b593c-ed38-4de7-9409-b0f424dcdc1f@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 14 May 2026 09:22:38 +0100
X-Gm-Features: AVHnY4KbTyJamCApbeAvVEsu-jULTw1khP_D6ocQ3r4Ur2kYdh432I54L7TzRsk
Message-ID: <CANPvuRkOtE2db0ze92mG1SPSEmNtYb4MQzm-t-ckY=yWPovZwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: disable vulkan when
 x11/wayland not enabled
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: multipart/alternative; boundary="00000000000042fb1e0651c2cddd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 08:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237018

--00000000000042fb1e0651c2cddd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that this patch version [v1] is still in master-next but note the
[v3] It has already been integrated.

[v3]
https://git.openembedded.org/openembedded-core/commit/?id=3Dcd2962653561350=
bccce0bb92384e963151323cf

Jose

Changqing Li via lists.openembedded.org <changqing.li=3D
windriver.com@lists.openembedded.org> escreveu (sexta, 8/05/2026 =C3=A0(s)
02:57):

>
> On 5/7/26 16:40, Jose Quaresma wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> Changqing Li via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnR=
vC5_W3JR5-ywidzs6L4$>
> <changqing.li
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!dPR5LmVI=
me5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-=
ywjPgScZ8$>
> =3Dwindriver.com@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=
=A0(s)
> 06:11):
>
>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>> do_configure will failed with error:
>> gst-libs/gst/vulkan/meson.build
>> <https://urldefense.com/v3/__http://meson.build__;!!AjveYdw8EvQ!dPR5LmVI=
me5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-=
ywqg724Gd$>:311:4:
>> ERROR: Problem encountered: No Windowing system found. vulkansink will n=
ot
>> work
>>
>> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>> <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__=
;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dN=
v0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>>               | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.28.2.bb
>> <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__=
;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dN=
v0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>> <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__=
;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dN=
v0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>> index cdf3a20dff..51f51761f9 100644
>> --- a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.28.2.bb
>> <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__=
;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dN=
v0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>> +++ b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.28.2.bb
>> <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__=
;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dN=
v0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$>
>> @@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D " \
>>      ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
>>  "
>>
>> +PACKAGECONFIG:remove =3D "${@'vulkan' if
>> (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) =3D=3D '') else ''=
}"
>> <$%7B@'vulkan'if(bb.utils.filter('DISTRO_FEATURES','x11wayland',d)=3D=3D=
'')else''%7D>
>> +
>>
>
> Using the 'remove' override on the core should be avoided because it's
> impossible to revert the changes on other layers.
> In my opinion, it would be better to use an auxiliary variable to define
> when vulkan is enabled, and this could be modified
> if necessary in other layers.
>
> PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11
> wayland', 'vulkan', '', d)"
> <$%7B@bb.utils.contains('DISTRO_FEATURES','x11wayland','vulkan','',d)>
> PACKAGECONFIG ??=3D " \
>     ${PACKAGECONFIG_VULKAN}
> "
>
> make sense,  V2 is sent.
>
> //Changqing
>
> Jose
>
>  PACKAGECONFIG[analytics]       =3D
>> "-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddisabled
>>  PACKAGECONFIG[aom]             =3D "-Daom=3Denabled,-Daom=3Ddisabled,ao=
m"
>>  PACKAGECONFIG[assrender]       =3D
>> "-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236629):
> https://lists.openembedded.org/g/openembedded-core/message/236629
> Mute This Topic: https://lists.openembedded.org/mt/119192696/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000042fb1e0651c2cddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div>I noticed that this patch version [v1] is =
still in master-next but note the [v3]=C2=A0It has already been integrated.=
</div><div><br></div><div>[v3] <a href=3D"https://git.openembedded.org/open=
embedded-core/commit/?id=3Dcd2962653561350bccce0bb92384e963151323cf">https:=
//git.openembedded.org/openembedded-core/commit/?id=3Dcd2962653561350bccce0=
bb92384e963151323cf</a><br><br>Jose</div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Changqing Li=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;<a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailto:win=
driver.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>=
&gt; escreveu (sexta, 8/05/2026 =C3=A0(s) 02:57):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div>On 5/7/26 16:40, Jose Quaresma wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Changqing Li via <a href=
=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7Vfufn=
RvC5_W3JR5-ywidzs6L4$" target=3D"_blank">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefens=
e.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159=
UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywjPgScZ8$" target=
=3D"_blank">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openem=
bedded.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt;
              escreveu (quinta, 7/05/2026 =C3=A0(s) 06:11):<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              When vulkan is enabled in DISTRO_FEATURES without x11 or
              wayland,<br>
              do_configure will failed with error:<br>
              gst-libs/gst/vulkan/<a href=3D"https://urldefense.com/v3/__ht=
tp://meson.build__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuI=
OeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywqg724Gd$" target=3D"_blank">meso=
n.build</a>:311:4: ERROR:
              Problem encountered: No Windowing system found. vulkansink
              will not work<br>
              <br>
              disable vulkan from PACKAGECONFIG when x11 and wayland is
              not enabled<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.l=
i@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              =C2=A0.../gstreamer/<a href=3D"https://urldefense.com/v3/__ht=
tp://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ!dPR5LmVIme5FlfwBJVS=
Z_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W3JR5-ywrb_TT-G$"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.28.2.bb</a=
>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
              =C2=A01 file changed, 2 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"htt=
ps://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!Ajve=
Ydw8EvQ!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7=
VfufnRvC5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank">gstreamer1=
.0-plugins-bad_1.28.2.bb</a>
              b/meta/recipes-multimedia/gstreamer/<a href=3D"https://urldef=
ense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ!dPR=
5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRvC5_W=
3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-=
bad_1.28.2.bb</a><br>
              index cdf3a20dff..51f51761f9 100644<br>
              --- a/meta/recipes-multimedia/gstreamer/<a href=3D"https://ur=
ldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ=
!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRv=
C5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-bad_1.28.2.bb</a><br>
              +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"https://ur=
ldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ=
!dPR5LmVIme5FlfwBJVSZ_k5sL159UKn_EJ1pWkvQuIOeVm3DyoMnbyzaA2dNv0fRnQ7VfufnRv=
C5_W3JR5-ywrb_TT-G$" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plug=
ins-bad_1.28.2.bb</a><br>
              @@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D &quot; \<br>
              =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;TUNE_FEATURES&#=
39;, &#39;mx32&#39;, &#39;&#39;,
              &#39;rsvg&#39;, d)} \<br>
              =C2=A0&quot;<br>
              <br>
              +PACKAGECONFIG:remove =3D <a href=3D"mailto:$%7B@&#39;vulkan&=
#39;if(bb.utils.filter(&#39;DISTRO_FEATURES&#39;,&#39;x11wayland&#39;,d)=3D=
=3D&#39;&#39;)else&#39;&#39;%7D" target=3D"_blank">&quot;${@&#39;vulkan&#39=
; if
              (bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11 wayland&=
#39;, d) =3D=3D
              &#39;&#39;) else &#39;&#39;}&quot;</a><br>
              +<br>
            </blockquote>
            <div><br>
            </div>
            <div>Using the &#39;remove&#39; override on the core should be
              avoided because it&#39;s impossible to revert the changes on
              other layers.</div>
            <div>In my opinion, it would be better to use an auxiliary
              variable to define when vulkan=C2=A0is enabled, and this coul=
d
              be modified</div>
            <div>if necessary in other layers.<br>
              <br>
            </div>
            <div>PACKAGECONFIG_VULKAN ?=3D
              <a href=3D"mailto:$%7B@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;,&#39;x11wayland&#39;,&#39;vulkan&#39;,&#39;&#39;,d)" target=3D"_blank=
">&quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 wayland&#3=
9;,
              &#39;vulkan&#39;, &#39;&#39;, d)&quot;</a></div>
            <div>PACKAGECONFIG ??=3D &quot; \<br>
              =C2=A0 =C2=A0 ${PACKAGECONFIG_VULKAN}</div>
            <div>&quot;</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>make sense,=C2=A0 V2 is sent.</p>
    <p>//Changqing</p>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>Jose<br>
              <br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              =C2=A0PACKAGECONFIG[analytics]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
              &quot;-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddisab=
led<br>
              =C2=A0PACKAGECONFIG[aom]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D
              &quot;-Daom=3Denabled,-Daom=3Ddisabled,aom&quot;<br>
              =C2=A0PACKAGECONFIG[assrender]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
              &quot;-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass&quo=
t;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236629): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236629" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236629</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119192696/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119192696/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div>

--00000000000042fb1e0651c2cddd--

