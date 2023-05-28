Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF839C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 14:23:57 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.29730.1685283829367834793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 07:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BwXDNkvr;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4f757d575so924189e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685283827; x=1687875827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikusgA4GaAk8QpPbR6K/8z6IrXeXxrq3+8tqbDPN9xk=;
        b=BwXDNkvrxE4XgjmvVtlMnjS2MOIKWfC9Ip1XKlC3lsofWV9fDCsPpL/1zFZ9OLC1zc
         d2AgveQEtUAOSnNCeeZ+fsZNf7jcW3lNm3AytP595jM5Jcjtq+8fgpYwGnF3drSmdr1c
         mLPyH1yIgY+Qp+kBEREkIUS0HkZmzMJe2PhbIvhaUE3fp6Q6fS2R/hfBk7XdPzTXKfMx
         7BlpxD3TwKWhqTIi9wrBuzlutGm3j/cPSgrT5Yp0SxQmlIhzxGOaUPrD8172uj3DbWy3
         sZIjkVt3wgpYS9Qdz0Yi6/1wRUZKc5Wf8kfWhss3EuCWERcUUQKoBM+kdd5tK2xKW/zG
         Gp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685283827; x=1687875827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikusgA4GaAk8QpPbR6K/8z6IrXeXxrq3+8tqbDPN9xk=;
        b=RfupDdzq2qBwEnSZ2b/U4+637Xs4sgihQHU0O7Sjld/l75aLLKV9MTPHPt7T8XOMZZ
         boqNuj+uZhfqq7axfuY3kvndmXi8v3tBQJbXm+uh+lKaKfENqVcilcGlHT25PZ77fpj3
         q5QYbqBMFiEgrMBfYRNDImzW+h3bIeM7Ey4qPIEtlLJ8miv1tLi/ssFAThS8B0EzvPgR
         4DOsSDGcDv8tXf/FUnZKmMFnXR2OAdIJ3++xnelYuaYk+47OtisUEU1GVarvA2QpbGj1
         wRC1DIZK+soSNHiCBweIaJR1MSikbaNT06tjDhwlYLul5aijzw7sYkViFiwXy4DnraEi
         j9HA==
X-Gm-Message-State: AC+VfDzMRBpScRFSJj9USiW8gn6xH3lK+st3fexr0CvyXeRvgbCgnLQN
	WV8ZIRVdygiWR+05JDsuevcxWHh+qPgqMpGSlII=
X-Google-Smtp-Source: ACHHUZ5T/jtKJjzndPevTHm76IEd9e9KeVIYKdvR3DUtyzevKPTg1i+BicbvxWzzIKYpFO8rao1Kr/NuaN+nB52kVao=
X-Received: by 2002:a05:6512:3d86:b0:4f3:822d:bcf7 with SMTP id
 k6-20020a0565123d8600b004f3822dbcf7mr2127617lfv.21.1685283827413; Sun, 28 May
 2023 07:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
 <17635252DFD4EDDE.6918@lists.openembedded.org> <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
 <VDGDVR.YBUKQ953M2TP3@t-online.de>
In-Reply-To: <VDGDVR.YBUKQ953M2TP3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 16:23:36 +0200
Message-ID: <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0f76405fcc1b704"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 14:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181828

--000000000000e0f76405fcc1b704
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But can you show the actual error please? If it=E2=80=99s a native only iss=
ue then
a different fix is needed, so that native dependency isn=E2=80=99t added to=
 a
target build.

Alex

On Sun 28. May 2023 at 16.03, Markus Volk <f_l_k@t-online.de> wrote:

> Am So, 28. Mai 2023 um 15:41:10 +0200 schrieb Alexander Kanavin <
> alex.kanavin@gmail.com>:
>
> Also, how is the native header used in the target build? Isn't that
> incorrect in itself?
>
>
> I guess its only needed to build the native variants of that packages
>

--000000000000e0f76405fcc1b704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But can you show the actual error please? If it=E2=80=99s=
 a native only issue then a different fix is needed, so that native depende=
ncy isn=E2=80=99t added to a target build.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun 28. May 2023 at 16.03, Markus Volk &lt=
;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)"><div id=3D"m_-2366218692941346866geary-body" dir=3D"a=
uto">Am So, 28. Mai 2023 um 15:41:10 +0200 schrieb Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmai=
l.com</a>&gt;:<br><blockquote type=3D"cite"><div style=3D"white-space:break=
-spaces">Also, how is the native header used in the target build? Isn&#39;t=
 that
incorrect in itself?</div></blockquote><div><br></div><div>I guess its only=
 needed to build the native variants of that packages</div></div></blockquo=
te></div></div>

--000000000000e0f76405fcc1b704--

