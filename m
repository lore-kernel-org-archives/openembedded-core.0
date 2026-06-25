Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF6BCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:06:56 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13822.1782400014932551022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s0DMbYaW;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-48751bd4abeso1345803b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782400014; cv=none;
        d=google.com; s=arc-20260327;
        b=rNc0A6uaRW9EbMY4V9fi+DEKWnNQCGL0ajhZpoFtL9FjfXCSYNu4DjhW9u6dvbtYGD
         717yQBvAu3Xc0074e27Zo9j49ZspBRdGS83O6tl3LLu0G7sTn6pKkwv+DbA2txdh+p76
         ipOZehk8so9VfhNMqjgSvG6xXUo96Ts7on80w2hgg+Jwv+Udf7vBmPgtfNsWqJ5MqtKV
         +weKtAjLlJl+9ThCJ/1XYkfia73dVU/m2keOqjf8Thl9J20lThsWz1ah5KXLBiUSrrgP
         nWnltvHgHBJq1tdqcPPjMsfsXHjzaLLgXqmFas48BMN2YOR9JoeUFrbsYF4vltIg7fG1
         5jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b5O1Gz/6kGt4rWbi6G0lq20QQ5Lo0s+MQyA859DfkM0=;
        fh=Ipq/hyh0Ld4eobbJAN5c1wGRCaM6lSfiTUC5xul29uY=;
        b=hXaGqukGHAmTq5t3O60MgXrI8umfFCDqT0cbjrix1e48butgW8plQmXWLfCpoL5NW9
         MusooK75Xqrb+eYg6FMssfKWWrKup6/jhQVhGNA2VJNhuC4SwvrhhxkHV6LfqTBK+Olb
         pBxYAteWqkfmNGjfu+O9FT0b9yrr+KBtX7ZLuHDB6/OyI1L2QFfPjLYsDZwjefB2BU3T
         oqx/7OQCIRI/N0AfGUE9O0/gtAtTSkJSD5exT+cj5rvS5hX0MoOM7LNI7illRTHdjrsL
         TdbMfDDDYrFPCDZDj5g+ocF4wjsmxK/OYjT1EjIvB2OVrlIbDZ6BCYU2OhNOQBTD4dAs
         HD5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400014; x=1783004814; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5O1Gz/6kGt4rWbi6G0lq20QQ5Lo0s+MQyA859DfkM0=;
        b=s0DMbYaWKyvj1WkP20hXdwGxPcWApIlgGg1nhgyFrGuj3Fov/Bxznlx/GGr+Hi4UvW
         TVCauk99rvr7rvn7yywva0PiQRj1ZlrWSDmV8WLcEaIvHg2nsokkr07J4CXkWuMAJEUI
         eX8hODL5IcZEI3vK/p2BBoqdjmJ0aRqPCE/fz3tj9kHBcRmZOHD4lZakf9FXawJBBnVP
         ETFTNdS0FMTvPY9azwtpUhBGP7G2pdKBMQsp8AUQp1sDOue8jSk0ZbWUKgdfVDPuT85B
         FTcVbICUhOBqrr2eO8Ih7a2EFKuDxPik12IN1QuJBaFH4LpaWaesYzVXw/YlX+yDqTky
         pEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400014; x=1783004814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5O1Gz/6kGt4rWbi6G0lq20QQ5Lo0s+MQyA859DfkM0=;
        b=cbMVwpUVrPRWjdFeQc/ZU5WkE14T11nEx4BpETQrT8zm/f0I5hw3g9+W+eU2eYQ8gt
         s9iev5cfUSRAD/Hf2qI1k16tzWMVJ3rYagVZDbipmFiq1F+rqx0uQbyELRDNsGYlD/rc
         mBjA3ytJ0d+dEoJtCiP9wrtueCrNqXHfUp4jWGOvjHrRqS4g4GePHXJiJIjY1LCoCc69
         0MOeG877gxbzznemixeBhlrHJygWw/BsZtODk49qG2idC5VRtvdGKbbgSe+hVatZwjGY
         94fsjYgmdjb/fslBwToArw3nEF11VRj8sBW5JhgtZEGtETDGHS1eO+v6aCdlBqiDNuuR
         xLRQ==
X-Gm-Message-State: AOJu0YyvqdcgUDyK47aexsrbcMYpOSurJfGg8czovX8EjJJglkeegtan
	ZIqnsOWxaoV2ElzHFBisR6C5/89JsXVw07xDUeDwHmK6xseAPWam6NM2hql4H4vu29J682apa3X
	Z0BnIMEL2PEogHxOSBMQjvaNVL56uu+dkPMtWbf/nSA==
X-Gm-Gg: AfdE7ckjBHxggt4aWCYNzg8Pi8302rSCg6pBhljKqm9fJzx5nd0EC13PMFxXzmY6IiP
	PGOj0oyn9eh1vrW1WtlqE/PRbBO8jW+H3WZAAOCrlXPfD6klvmO34rLyaDlNQcbJ+OA7GxSIbiu
	TTT4sf6713nGxyaxQKYOIQeMXiC+EDrrR6QdAQm7GVW3Ca6Gz6g17aVVEJeSx/ut7chUiQQeAHT
	tV077rvcVDbuMg7pds/Mv4FZ4Fv+XH5MsWP7e2cXXYn3uiJNEeZsbvNKWVsK37ON5pQTFo17ux8
	HhvrvsIwB1GG0v3zGWkcNHW141Zlqby4H70UcyVTpGPBq8+i8nAGkc4OmryE4Q==
X-Received: by 2002:a05:6808:2507:b0:489:b97d:3f52 with SMTP id
 5614622812f47-49219b2ab8bmr2429694b6e.37.1782400013856; Thu, 25 Jun 2026
 08:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com> <DJI5A0TDU4MZ.27335X1KDK4AQ@bootlin.com>
In-Reply-To: <DJI5A0TDU4MZ.27335X1KDK4AQ@bootlin.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Thu, 25 Jun 2026 20:36:26 +0530
X-Gm-Features: AVVi8CehoCw3nqoqdh9N0eg271dttDePQZQyj7EVv7FTAw279lvDr6jcrssbj4Q
Message-ID: <CACFV95LOek8Gi+jkW7SHFOyTZzEL-3Jnq8YgnT1D-dA3Tje9wQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v1] util-linux: backport pam_lastlog2 libpam
 linking fix
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000ac72200655155783"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239574

--000000000000ac72200655155783
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Sent a [wrynose][PATCH] version targeting that branch:

https://patchwork.yoctoproject.org/project/oe-core/patch/20260625150015.283=
2246-1-sivakumar.bs@gmail.com/

Same fix, verified the same way (readelf -d / dlopen test) since wrynose is
still on util-linux 2.41.3, same as master.

Thanks,
Siva

On Thu, Jun 25, 2026 at 6:25=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Jun 25, 2026 at 11:02 AM CEST, Siva Balasubramanian via
> lists.openembedded.org wrote:
> > pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
> > autotools build did not link the module against libpam. With the
> > linker default of --as-needed, libpam was discarded and did not end
> > up in the module's ELF NEEDED entries. The module then fails to load
> > via dlopen() in processes that do not themselves link libpam (e.g.
> > systemd on recent Fedora, or weston on journald-based systems without
> > syslog):
> >
> >   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined
> symbol: pam_syslog
> >   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
> >
> > Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
> > it is placed after the object files and retained as a NEEDED entry.
> > Against 2.41.3 only the LIBADD line needs changing.
> >
> > [YOCTO #16320]
> >
> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > ---
> > Verified by building util-linux with pam in DISTRO_FEATURES (qemux86-64=
):
> > without the patch the resulting pam_lastlog2.so has no libpam in its EL=
F
> > NEEDED entries; with the patch readelf -d reports libpam.so.0, matching
> > the upstream fix and resolving the dlopen() failure from the bug report=
.
> >
> > This is also a candidate for the stable 6.0.x branch (per the bug
> > report), which also ships util-linux 2.41.3; the same single-hunk
> > backport applies.
>
> Hi Siva,
>
> Thanks for the patch.
>
> We already have a pending patch for master, upgrading to 2.42.2 [1]. So
> I believe this patch won't be needed for master. It probably still makes
> sense for stable branches.
>
> [1]:
> https://lore.kernel.org/openembedded-core/20260619083305.3505156-2-alex.k=
anavin@gmail.com/
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20

Sivakumar B

--000000000000ac72200655155783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><p class=3D"gmail-font-claude-response-body gmail-break=
-words gmail-whitespace-normal">Hi Mathieu,</p>

<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal">Sent a [wrynose][PATCH] version targeting that branch:</p>

<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal"><a class=3D"gmail-underline gmail-underline gmail-underline-off=
set-2 gmail-decoration-1 gmail-decoration-current/40 gmail-hover:decoration=
-current gmail-focus:decoration-current" href=3D"https://patchwork.yoctopro=
ject.org/project/oe-core/patch/20260625150015.2832246-1-sivakumar.bs@gmail.=
com/">https://patchwork.yoctoproject.org/project/oe-core/patch/202606251500=
15.2832246-1-sivakumar.bs@gmail.com/</a></p>

<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal">Same fix, verified the same way (readelf -d / dlopen test) sinc=
e
wrynose is still on util-linux 2.41.3, same as master.</p>

<p class=3D"gmail-font-claude-response-body gmail-break-words gmail-whitesp=
ace-normal"><span style=3D"background-color:transparent">Thanks,=C2=A0</spa=
n><br><span style=3D"background-color:transparent">Siva</span></p></div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Jun 25, 2026 at 6:25=E2=80=AFPM Mathieu Dubois-B=
riand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubo=
is-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu Jun 25, 2026 at 11:02 AM CEST, Siva Balasubrama=
nian via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; pam_lastlog2.so uses pam_syslog() and other libpam symbols but the<br>
&gt; autotools build did not link the module against libpam. With the<br>
&gt; linker default of --as-needed, libpam was discarded and did not end<br=
>
&gt; up in the module&#39;s ELF NEEDED entries. The module then fails to lo=
ad<br>
&gt; via dlopen() in processes that do not themselves link libpam (e.g.<br>
&gt; systemd on recent Fedora, or weston on journald-based systems without<=
br>
&gt; syslog):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): u=
ndefined symbol: pam_syslog<br>
&gt;=C2=A0 =C2=A0PAM adding faulty module: /usr/lib/security/pam_lastlog2.s=
o<br>
&gt;<br>
&gt; Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so<=
br>
&gt; it is placed after the object files and retained as a NEEDED entry.<br=
>
&gt; Against 2.41.3 only the LIBADD line needs changing.<br>
&gt;<br>
&gt; [YOCTO #16320]<br>
&gt;<br>
&gt; Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs=
@gmail.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Verified by building util-linux with pam in DISTRO_FEATURES (qemux86-6=
4):<br>
&gt; without the patch the resulting pam_lastlog2.so has no libpam in its E=
LF<br>
&gt; NEEDED entries; with the patch readelf -d reports libpam.so.0, matchin=
g<br>
&gt; the upstream fix and resolving the dlopen() failure from the bug repor=
t.<br>
&gt;<br>
&gt; This is also a candidate for the stable 6.0.x branch (per the bug<br>
&gt; report), which also ships util-linux 2.41.3; the same single-hunk<br>
&gt; backport applies.<br>
<br>
Hi Siva,<br>
<br>
Thanks for the patch.<br>
<br>
We already have a pending patch for master, upgrading to 2.42.2 [1]. So<br>
I believe this patch won&#39;t be needed for master. It probably still make=
s<br>
sense for stable branches.<br>
<br>
[1]: <a href=3D"https://lore.kernel.org/openembedded-core/20260619083305.35=
05156-2-alex.kanavin@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/openembedded-core/20260619083305.3505156-2-alex.kanavin@=
gmail.com/</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--000000000000ac72200655155783--

