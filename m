Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1092C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:18:54 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.43209.1754900330298865414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WCU+qgV6;
 spf=pass (domain: snapchat.com, ip: 209.85.208.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso6519346a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1754900328; x=1755505128; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiGyyhdJPgOS+imftwjBdMZYdJHsLRPWM2xoHt0B/yI=;
        b=WCU+qgV6Dd+T63qYVBin2QLmfjluYKDXl2Bd7FE9VnZFiYH86Q3ILwqedUSFQHgqFT
         5VEiWY959RvdpC/sNw+U3ObCyZE/YWcWqf3k2q+Zl9OWgIcX9gc3sjuoafyHlAgqgF+5
         GYFujZclTcfDX6N+foJmQREpgH9j9OANTkPco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900328; x=1755505128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiGyyhdJPgOS+imftwjBdMZYdJHsLRPWM2xoHt0B/yI=;
        b=jCRDP+7aecGLCJBix6bZqwkDj4NV5nTm4ZqK6krx5fM0+uFtPSSe2l1EwTK1cJScrE
         37V1KYTJSh76M13N6Y+bNkFiykSdPaFAGiTpHiWVKy0ZBIdD/QiHYvKtX1djCb4KiS5b
         bxwJgUkfXEKg+qLX5Wd2ln0l/4gXZuOwYXVOXnZFSQxJBK/KyaGnnsKPXox4EkeT4nn7
         lwW/DR2mfgTqQB1XsnJwDKodyQgNy2gQDvWbRIsUafS3d7cnBQW8qLMhz29Dcm/2HxuK
         S2cDGz48XfFd7X8zCUwk48isHuqS6DDUpksYGRsKORBdSQ24iUea1r6zr1O0JYZWr09u
         j48Q==
X-Gm-Message-State: AOJu0YyccY7SLu+kZrJ6tP0AabPyT8nT6BaQKXOzSedv73Bdro6EIkWs
	vwlDACcsLEp+qAvzrNKY1/SJmWDBJHm7dOSGlTLYXzBDRUuJCH80nZwHtZ3pqSdtj7/kReVfzsp
	Qe5l/QyfjrmADGGi51czTRKO/4wreRoxk6yj91CYDP/5appKzzC0HSpxhgA==
X-Gm-Gg: ASbGncs1jkecVAqnyOz/IkOmRI7vPi/Lo+3PpCBhUQebyeYsyE1lGoVqkPuTIsPTTDD
	qUe92ST0+f67WeBrEnaU1E55OBKX1LwDd0Hiozblylu6/lBZSY0WZRfXQIZEB4twKHehzocAFSg
	qEyyzZobYai9gfmBjNurgl7lesRfmnjJ/55kei83VLirvUighsueOJ2WQfTIQuc/xLuGdxuSVN0
	cpwWs1Y
X-Google-Smtp-Source: AGHT+IGCR9BIXsn2JznTd5ScQf9zIeYx/tJ/Aj0JHrYXGU8SFQ6hYoxebRZXCsaz7O5AGjFTQHhoH8Pz0qXk9r4tv1Y=
X-Received: by 2002:a17:907:7ea9:b0:ae0:9fdf:25e8 with SMTP id
 a640c23a62f3a-af9c6545abcmr1116824666b.47.1754900328305; Mon, 11 Aug 2025
 01:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <185AA85CDF829DFA.24055@lists.openembedded.org>
In-Reply-To: <185AA85CDF829DFA.24055@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 11 Aug 2025 10:18:37 +0200
X-Gm-Features: Ac12FXwmaXTptLo6Qj93yl6re8XvKNcPPpIUuzZWPiD0WJaBb0ExpB8MOZtKCsM
Message-ID: <CAHUKmYbnTtOZExFmKhMwd4Fe3m8ug36s2dZqwd8o-tNgW9d-7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af8090063c12920f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221724

--000000000000af8090063c12920f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I had missed that
https://patchwork.yoctoproject.org/project/oe-core/patch/20250810222523.248=
7072-1-richard.purdie@linuxfoundation.org/
had been sent in the meanwhile. You can ignore my patch.

On Mon, Aug 11, 2025 at 10:15=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> This reverts commit 3d67b6c60fa968cd36b51c63e2a7f11bb87dd315 which
> mentions "We can revisit this in a year or two
> as we should be ready then.".
>
> Reverting this commit allows perfetto to work out of the box with
> qemux86-64. At the moment perfetto prints this error on qemux86-64:
> ```
> root@qemux86-64:~# tracebox --txt -c /tmp/config.pbtxt -o
> /tmp/perfetto-trace.pb
> This executable requires a x86_64 cpu that supports SSE4.2, BMI2 and AVX2=
.
> Rebuild with enable_perfetto_x64_cpu_opt=3Dfalse.
> ```
> ---
>  meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
>  meta/conf/machine/qemux86-64.conf              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc
> b/meta/conf/machine/include/x86/qemuboot-x86.inc
> index 6ae03633aea..82ef4a0b732 100644
> --- a/meta/conf/machine/include/x86/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
> @@ -4,8 +4,8 @@ QB_SMP ?=3D "-smp 4"
>  QB_CPU:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>  QB_CPU_KVM:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>
> -QB_CPU:x86-64 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> -QB_CPU_KVM:x86-64 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> +QB_CPU:x86-64 ?=3D "-cpu Skylake-Client -machine q35,i8042=3Doff"
> +QB_CPU_KVM:x86-64 ?=3D "-cpu Skylake-Client -machine q35,i8042=3Doff"
>
>  QB_AUDIO_DRV =3D "alsa"
>  QB_AUDIO_OPT =3D "-device AC97"
> diff --git a/meta/conf/machine/qemux86-64.conf
> b/meta/conf/machine/qemux86-64.conf
> index 62108b703b6..8aac7634b75 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for running an x86-64 system on QEM=
U
>
>  require conf/machine/include/qemu.inc
> -DEFAULTTUNE ?=3D "core2-64"
> +DEFAULTTUNE ?=3D "x86-64-v3"
>  require conf/machine/include/x86/tune-x86-64-v3.inc
>  require conf/machine/include/x86/qemuboot-x86.inc
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221722):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_221722&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DozgyQKTgO_mw7RacCQxY-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&s=3DhEt=
w5M5BpEVjEzhsrh8ipgdNfGPXvw5iBhoBWXVtMk0&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_114638379_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DozgyQKTgO_mw7=
RacCQxY-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&s=3DOn2soaKa7GljrpjMsI8=
ptMjTNWXYGKp6nIvHqYiUvQM&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DozgyQK=
TgO_mw7RacCQxY-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&s=3DPtNer5x9gZvK=
0TqWHGek-f6pIubgp3SJbcUUhigNdqs&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000af8090063c12920f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I had missed that=C2=A0<a href=3D"https://patchwork=
.yoctoproject.org/project/oe-core/patch/20250810222523.2487072-1-richard.pu=
rdie@linuxfoundation.org/">https://patchwork.yoctoproject.org/project/oe-co=
re/patch/20250810222523.2487072-1-richard.purdie@linuxfoundation.org/</a> h=
ad been sent in the meanwhile. You can ignore my patch.</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Aug 11, 2025 at 10:15=E2=80=AFAM Etienne Cordonnier via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonni=
er=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap=
.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
This reverts commit 3d67b6c60fa968cd36b51c63e2a7f11bb87dd315 which mentions=
 &quot;We can revisit this in a year or two<br>
as we should be ready then.&quot;.<br>
<br>
Reverting this commit allows perfetto to work out of the box with qemux86-6=
4. At the moment perfetto prints this error on qemux86-64:<br>
```<br>
root@qemux86-64:~# tracebox --txt -c /tmp/config.pbtxt -o /tmp/perfetto-tra=
ce.pb<br>
This executable requires a x86_64 cpu that supports SSE4.2, BMI2 and AVX2.<=
br>
Rebuild with enable_perfetto_x64_cpu_opt=3Dfalse.<br>
```<br>
---<br>
=C2=A0meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--<br>
=C2=A0meta/conf/machine/qemux86-64.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/mac=
hine/include/x86/qemuboot-x86.inc<br>
index 6ae03633aea..82ef4a0b732 100644<br>
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc<br>
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc<br>
@@ -4,8 +4,8 @@ QB_SMP ?=3D &quot;-smp 4&quot;<br>
=C2=A0QB_CPU:x86 ?=3D &quot;-cpu IvyBridge -machine q35,i8042=3Doff&quot;<b=
r>
=C2=A0QB_CPU_KVM:x86 ?=3D &quot;-cpu IvyBridge -machine q35,i8042=3Doff&quo=
t;<br>
<br>
-QB_CPU:x86-64 ?=3D &quot;-cpu IvyBridge -machine q35,i8042=3Doff&quot;<br>
-QB_CPU_KVM:x86-64 ?=3D &quot;-cpu IvyBridge -machine q35,i8042=3Doff&quot;=
<br>
+QB_CPU:x86-64 ?=3D &quot;-cpu Skylake-Client -machine q35,i8042=3Doff&quot=
;<br>
+QB_CPU_KVM:x86-64 ?=3D &quot;-cpu Skylake-Client -machine q35,i8042=3Doff&=
quot;<br>
<br>
=C2=A0QB_AUDIO_DRV =3D &quot;alsa&quot;<br>
=C2=A0QB_AUDIO_OPT =3D &quot;-device AC97&quot;<br>
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-=
64.conf<br>
index 62108b703b6..8aac7634b75 100644<br>
--- a/meta/conf/machine/qemux86-64.conf<br>
+++ b/meta/conf/machine/qemux86-64.conf<br>
@@ -3,7 +3,7 @@<br>
=C2=A0#@DESCRIPTION: Machine configuration for running an x86-64 system on =
QEMU<br>
<br>
=C2=A0require conf/machine/include/qemu.inc<br>
-DEFAULTTUNE ?=3D &quot;core2-64&quot;<br>
+DEFAULTTUNE ?=3D &quot;x86-64-v3&quot;<br>
=C2=A0require conf/machine/include/x86/tune-x86-64-v3.inc<br>
=C2=A0require conf/machine/include/x86/qemuboot-x86.inc<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#221722): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
1722&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DozgyQKTgO_mw7RacCQ=
xY-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&amp;s=3DhEtw5M5BpEVjEzhsrh8i=
pgdNfGPXvw5iBhoBWXVtMk0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_221722&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DozgyQKTgO_mw7RacCQxY-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwT=
N8&amp;s=3DhEtw5M5BpEVjEzhsrh8ipgdNfGPXvw5iBhoBWXVtMk0&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_114638379_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DozgyQKTgO_mw7RacCQxY-oR7053tWH6QL45GBs1WZJYBz_=
fYQNRIj6ePEoStwTN8&amp;s=3DOn2soaKa7GljrpjMsI8ptMjTNWXYGKp6nIvHqYiUvQM&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_114638379_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DozgyQKTgO_mw7RacCQxY-oR7053tWH6=
QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&amp;s=3DOn2soaKa7GljrpjMsI8ptMjTNWXYGKp6n=
IvHqYiUvQM&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DozgyQKTgO_mw7RacCQxY-oR7053tWH6QL45GBs1WZJY=
Bz_fYQNRIj6ePEoStwTN8&amp;s=3DPtNer5x9gZvK0TqWHGek-f6pIubgp3SJbcUUhigNdqs&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DozgyQKTgO_mw7RacCQxY=
-oR7053tWH6QL45GBs1WZJYBz_fYQNRIj6ePEoStwTN8&amp;s=3DPtNer5x9gZvK0TqWHGek-f=
6pIubgp3SJbcUUhigNdqs&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000af8090063c12920f--

