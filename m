Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32980C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:52:00 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.53051.1742219510904802327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZHuAI0Dr;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-726819aa3fcso2815221a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742219510; x=1742824310; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgIv273HEoWLeyLQasTLl4x8c3PUoYIV7ZHF72s73W8=;
        b=ZHuAI0DrdkiwWm2miH9/VaqElpmdWoUvi4AtGZj4/9qr+g96C7QzjBl0Q9v82ucI93
         Sj1bXcUkdZ/L3DSI+8jBhPtXZXk+3TGm6d+QsT13CWzsFcwj7isChDzCAO0hLSo3zwrm
         SbeQMecPbxWuH0VXdjA1TAFpX3Crg7aDJR/FGydeQNGYex7/4r/Vh9NFCGMer7dfYqGQ
         aCwAPMPdtKNNxgvmpnoaTellZGhr+N5QMDWgUzZ4iojPwTCoSKdd2clGBSoTYtzZL73r
         iLSk0t/qFZFxyTRO1BcOJ2kioCxjkWlxAo7810NpYYKgm7XU5VUciYoVUPTO3a/TCeoT
         XSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742219510; x=1742824310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgIv273HEoWLeyLQasTLl4x8c3PUoYIV7ZHF72s73W8=;
        b=s+0f5uhYWBXzcIrLebNjKCU2+dlb3R308dBHfoBH+BFiW9+3nH7q6p6EtAGrlQhLZy
         SJfqPqizvjioaRKbjpDVEClmaKqpPAujGbwLVgxYWfJM5Afq3baSWQhhRiNUnSefQJ9a
         /mR1nvVrP3SjRKPFGfB9T/dkhpL7P9OLnyFGk+Fzm/cAEgVcR661++suUOfyi0uAM69X
         7uYrnBfw/znQRqKotdNqetexxr9nRJ/LphUltkChDWW78M4BnrG1VrAdU1RIz+kxZDEW
         DEJvPTuPJkASjKoRnvs/MWCuPere6dm6KADCsXPUlB23rA1TWD6JDbgwFNb/y3zjmws1
         rJxQ==
X-Gm-Message-State: AOJu0YwTWwxhDC2mhNd8Zrf4icP3bL9XYcmRtFiSGggFzfQL2SYWktNz
	NMgWchVq5+4YTz2OXww+why5geMqcQtOd4c868KgTnNr+gL9DREzleyrSbKUWYToPIoqDYPIoXB
	z4HM2TDTS3DhZi/Hz3FiHSMitzfM=
X-Gm-Gg: ASbGncsOkT1j3VMAxWwcN6epAtENjNhV6DrOQyzypFAiv6T2+8FfYg9FwQ/11rpk8+c
	kHZSRG7AMA/IWwgr+6On2kAG04mE0I87508yRuO66oBoyjc9wrorOVmk6xeNn8VKOg3xHXVXmwP
	j5Q5blB7ApRY+pu21dcXcW+K2icIokbGsw7YZCqTaOWAUkH7xGY6r3iHq29l+Z6cXfDMinfg==
X-Google-Smtp-Source: AGHT+IH46KVfLHvJJq8zGsU0ebf2zfotbCUniBDJortZIqnKCo35FgcF7kWHyploWzcmrjConMXPuO+bwJbvA4tVbFE=
X-Received: by 2002:a05:6830:151a:b0:72b:cdcd:628b with SMTP id
 46e09a7af769-72bcdcd63e1mr3615433a34.20.1742219510141; Mon, 17 Mar 2025
 06:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250316204625.1588247-1-raj.khem@gmail.com> <CANNYZj85=i=2dj1z+3zymex308j+ku2h5EBCB=4rOp31L0_zQQ@mail.gmail.com>
In-Reply-To: <CANNYZj85=i=2dj1z+3zymex308j+ku2h5EBCB=4rOp31L0_zQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Mar 2025 06:51:39 -0700
X-Gm-Features: AQ5f1JpRhlkG14Fl6eFYFObTJXZcE0tL5nYvb6HyHUXs24I8UO_5F7-OLN3fiGY
Message-ID: <CAMKF1sp5+7042i32kvTnzZO3c0C0FU3pMbh6dAGRS8=jDSFOLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: upgrade 19.1.7 -> 20.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005db5006308a17ba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213099

--00000000000005db5006308a17ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 5:13=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Sun, 16 Mar 2025 at 21:46, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> > +
> > +PV =3D "20.1.0"
>
> This is unnecessary, how did it appear in a recipe?
>

This is AUH version  that I have used

>
> Alex
>

--00000000000005db5006308a17ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 17, 2025 at 5:13=E2=80=AFAM=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanav=
in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sun, 16 Mar 2025 a=
t 21:46, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt; +<br>
&gt; +PV =3D &quot;20.1.0&quot;<br>
<br>
This is unnecessary, how did it appear in a recipe?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is AUH vers=
ion =C2=A0that I have used=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Alex<br>
</blockquote></div></div>

--00000000000005db5006308a17ba--

