Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F97FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:24:49 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.6370.1666877088562216975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 06:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=ftoA2fZY;
 spf=pass (domain: snapchat.com, ip: 209.85.167.171, mailfrom: ecordonnier@snapchat.com)
Received: by mail-oi1-f171.google.com with SMTP id y67so1993319oiy.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kBR5LIagZH4NjHiT8v1LhEAyDsLbfF8aW7FUbdoV83I=;
        b=ftoA2fZYTTtEG+6e782Ar2fvmRDwMwRMk2TBoiYQAnrcRGRTQy6YsVS8Gj9d17qD5M
         AZ1oSXa9Ptg0WKfcJbDV+vlOfofFFdJfiVrAf/SWAeIoT83rD7M7fNUqX5xQIu8CDIDA
         uGMUFU6FNV+HGdeulZ2Qa/huak82FhujthntM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBR5LIagZH4NjHiT8v1LhEAyDsLbfF8aW7FUbdoV83I=;
        b=zfyRFKfGlFmRVHNRO48OSDt4br7pkYpGG4Xyghx3x/mzGRSIumBl5QrT0z3xntHAAZ
         Q1/7cEfuRnOBcGlftoZ9c0r4Dzf5Vtnk74g5UTZ0lL2diEzG7nFn3pEVjarL1qLerajj
         Fihc9QBiRLD7Nhq3VNhoGg3RIC7RwcrdqvD61SG1FPzBl3GaPdo+Vn0/s6Y8nsfZV1hr
         q9zQTgFalVvk2uDtdJYlSMWwIytwVureHIhh3+HjRRufCaEoAqj/dCtt3486l8Pa4lFP
         Q3Ydjw4RmRrxr3iZp5yNQXYbpijfl6V5kjlTtLAFzhlslQxTrgYW/zOikdP/wYC5fjc0
         SixA==
X-Gm-Message-State: ACrzQf06/7WhxdcgRfcS2auULB4kMoI6fgHEuWZBCIuqDSLfKBVaYuP5
	+6nMSpfioLWzIT9pl2N09mJitXH170lPUBbGiKv/+g==
X-Google-Smtp-Source: AMsMyM42zkmgHWickrf4WF7rUeVyHR1xZ+iXw2UQB51YTIbSEoZf17wFYibpM8wyIzZ9mg97vmQEip7f04VI82w7zUQ=
X-Received: by 2002:a05:6808:211a:b0:354:b569:7a4d with SMTP id
 r26-20020a056808211a00b00354b5697a4dmr4858148oiw.107.1666877087613; Thu, 27
 Oct 2022 06:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <1721EF56935912B7.550@lists.openembedded.org>
In-Reply-To: <1721EF56935912B7.550@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snapchat.com>
Date: Thu, 27 Oct 2022 15:24:36 +0200
Message-ID: <CAHUKmYbuyn_WayncEW1kvUorpf3L5kQrWvx_1YXQXw85qd+rxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for binutils-native
To: ecordonnier@snapchat.com
Cc: openembedded-core@lists.openembedded.org, 
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: multipart/alternative; boundary="000000000000b1270b05ec041073"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172192

--000000000000b1270b05ec041073
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To give some context: this is useful e.g. when using meta-clang, because
this introduces a dependency to binutils-native, and then a full tarball of
binutils is fetched additionally to a shallow tarball. The original
BB_GIT_SHALLOW lines were added because of
https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html

On Thu, Oct 27, 2022 at 3:14 PM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnapchat.com@lists.openembedded.org>
wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-global/mirrors.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/mirrors.bbclass
> b/meta/classes-global/mirrors.bbclass
> index 9643b31a23..81fef7f660 100644
> --- a/meta/classes-global/mirrors.bbclass
> +++ b/meta/classes-global/mirrors.bbclass
> @@ -90,6 +90,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} =3D "1"
>  BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D =
"1"
>  BB_GIT_SHALLOW:pn-binutils-cross-testsuite =3D "1"
>  BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} =3D "1"
> +BB_GIT_SHALLOW:pn-binutils-native =3D "1"
>  BB_GIT_SHALLOW:pn-glibc =3D "1"
>  PREMIRRORS +=3D "git://sourceware.org/git/glibc.git
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctopro=
ject.org_mirror_sources_&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DHZqdrpkiUB7hnG=
1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&s=3DPK8TU6Ag_9FbxwQ5PsAC=
CV_iuEu5W1hiwl9A66A7rZU&e=3D
> \
>                git://sourceware.org/git/binutils-gdb.git
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctopro=
ject.org_mirror_sources_&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DHZqdrpkiUB7hnG=
1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&s=3DPK8TU6Ag_9FbxwQ5PsAC=
CV_iuEu5W1hiwl9A66A7rZU&e=3D
> "
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172191):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_172191&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=
=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&s=3DiFJ=
XGqQZMzQVU-0L7T_t0yEZ3SsRFmt0qMLlH2HiIzo&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_94603459_7048784&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DHZqdrpkiUB7hnG=
1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&s=3DqJhgNTK8IIs21DHnbbdp=
80XGjQEdCaB69DdoHdm0oyg&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&m=3DHZqdrp=
kiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&s=3Deqf_X4c3BZvu=
kqCMaSWKziPII1gdEGJFZyWTNQSWCww&e=3D
> [ecordonnier@snapchat.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b1270b05ec041073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To give some context: this is useful e.g. when using meta-=
clang, because this introduces a dependency to binutils-native, and then a =
full tarball of binutils is fetched additionally to a shallow tarball. The =
original BB_GIT_SHALLOW lines were added because of=C2=A0<a href=3D"https:/=
/www.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html">https://w=
ww.mail-archive.com/yocto@lists.yoctoproject.org/msg08752.html</a></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, O=
ct 27, 2022 at 3:14 PM Etienne Cordonnier via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto=
:snapchat.com@lists.openembedded.org">snapchat.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=
=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/mirrors.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirr=
ors.bbclass<br>
index 9643b31a23..81fef7f660 100644<br>
--- a/meta/classes-global/mirrors.bbclass<br>
+++ b/meta/classes-global/mirrors.bbclass<br>
@@ -90,6 +90,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} =3D &quot=
;1&quot;<br>
=C2=A0BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
=3D &quot;1&quot;<br>
=C2=A0BB_GIT_SHALLOW:pn-binutils-cross-testsuite =3D &quot;1&quot;<br>
=C2=A0BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} =3D &quot;1&quot;<br>
+BB_GIT_SHALLOW:pn-binutils-native =3D &quot;1&quot;<br>
=C2=A0BB_GIT_SHALLOW:pn-glibc =3D &quot;1&quot;<br>
=C2=A0PREMIRRORS +=3D &quot;git://<a href=3D"http://sourceware.org/git/glib=
c.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.git</a=
> <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloa=
ds.yoctoproject.org_mirror_sources_&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3a=
ALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaX=
Sp&amp;s=3DPK8TU6Ag_9FbxwQ5PsACCV_iuEu5W1hiwl9A66A7rZU&amp;e=3D" rel=3D"nor=
eferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__downloads.yoctoproject.org_mirror_sources_&amp;d=3DDwIDAg&amp;c=3Dnc=
DTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDL=
WdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xK=
loPWVn8KEJnsaXSp&amp;s=3DPK8TU6Ag_9FbxwQ5PsACCV_iuEu5W1hiwl9A66A7rZU&amp;e=
=3D</a>=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"htt=
p://sourceware.org/git/binutils-gdb.git" rel=3D"noreferrer" target=3D"_blan=
k">sourceware.org/git/binutils-gdb.git</a> <a href=3D"https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctoproject.org_mirror_sources=
_&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPp=
T_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&amp;s=3DPK8TU6Ag_9FbxwQ5PsACCV=
_iuEu5W1hiwl9A66A7rZU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__downloads.yoctoproject.org=
_mirror_sources_&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrp=
kiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&amp;s=3DPK8TU6Ag=
_9FbxwQ5PsACCV_iuEu5W1hiwl9A66A7rZU&amp;e=3D</a> &quot;<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172191): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_17=
2191&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1Rur=
PpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&amp;s=3DiFJXGqQZMzQVU-0L7T_t=
0yEZ3SsRFmt0qMLlH2HiIzo&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_172191&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3a=
ALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaX=
Sp&amp;s=3DiFJXGqQZMzQVU-0L7T_t0yEZ3SsRFmt0qMLlH2HiIzo&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_94603459_7048784&amp;d=3DDwIFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsyD=
LWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXcaB_x=
KloPWVn8KEJnsaXSp&amp;s=3DqJhgNTK8IIs21DHnbbdp80XGjQEdCaB69DdoHdm0oyg&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com=
/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_94603459_7048784&amp;d=3DDw=
IFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuM=
IGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H=
2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&amp;s=3DqJhgNTK8IIs21DHnbbdp80XGjQEdCaB69Dd=
oHdm0oyg&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPpT_UDdD0HHF4_H2A17NA-iXc=
aB_xKloPWVn8KEJnsaXSp&amp;s=3Deqf_X4c3BZvukqCMaSWKziPII1gdEGJFZyWTNQSWCww&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsyDLWdbBqarUzFxz3aALck&amp;m=3DHZqdrpkiUB7hnG1RurPp=
T_UDdD0HHF4_H2A17NA-iXcaB_xKloPWVn8KEJnsaXSp&amp;s=3Deqf_X4c3BZvukqCMaSWKzi=
PII1gdEGJFZyWTNQSWCww&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
pchat.com" target=3D"_blank">ecordonnier@snapchat.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b1270b05ec041073--

