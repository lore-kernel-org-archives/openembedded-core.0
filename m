Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8278CC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 17:51:36 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26989.1782841890074724685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 10:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Yi4zRcuU;
 spf=pass (domain: mvista.com, ip: 209.85.218.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c128c8c7a76so214539366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782841888; cv=none;
        d=google.com; s=arc-20260327;
        b=h3GFH5AAXUK94eEukGlQFOmIhK7em+Cdl24aUzMj8HUM3Dz7Bf6FcSCufp4bG8srvV
         3ZrOIzBAEPvFk+Vs00V9eKwFbnPF5I6r2D+baJIVh0wHlAl3yvh8YTTHLG/obiGDVMvr
         hyuW5EZazGUCt21ddJAJvyk8S3isfOIqKOTKWHSDCORZqoUxrOz6eWUrHgPbgVYSiiI5
         5e+dIbiFMFEiJk8HXslolD9me4d+TrG6YA6WwaCFdFq+YumjuWbD2BIjgCcy2+ROJJvG
         ZP1LrvIqSj5UA15Bp4veGg1WHH5JEIuBvWfG2woUAlwIKqCY+e3ngaIR74dld3WnWjKC
         tP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xsbijVhF+jQSxcWfLqaszAOQN2vdv9fwlS/jNLeOvDs=;
        fh=FPDICK+H57LCAtuxOr07gylTD6AKuEqmn4EHk7h25xE=;
        b=ifkmchrS85ojYkg9X/61bR4/9US1eY3D/uO3fEG5jLujHRuY9sPdMiCMfVTpOFn/9a
         12zeHbF1oOkwCRpxIlXyzsAIlU45KFzdzUTb7r2EYSjCi/s3uURyJi5gLlmSHVSVgUSR
         t4uyJtHgs1X1WU6Dkt8gvKYhgNAd/TGZfDkf4cCTbsURFZFI0pxOr+kg+Ft6fycvxpfq
         OtmcUuJ5jXgda9ErOr8tZn0RJq/u0x2DQtDffEULXA91tZ9HCtnICcKORTLr662I8M0s
         7aaR5pMqfgRsTq2qRorsnTUlzZOmWAfEXl68haNfZGLtfTRdRz/FUsXabKNZaa14qtWg
         3D3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782841888; x=1783446688; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xsbijVhF+jQSxcWfLqaszAOQN2vdv9fwlS/jNLeOvDs=;
        b=Yi4zRcuUpXXtaNeXLf0GfjGxU4zFI5pTBAF1EP/fKYnXPjc83klj4Ac0LTt/VuPIQw
         hO2AHTPU/udDYuS1p+ch0uf+3zYscFu5YFOHw+rV56jIMY75zqPadQwcNTV1MNUlN3qY
         XaGouFXMJAOXrXb5RZ8uAeNe0/ZNvOIFmTpO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841888; x=1783446688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsbijVhF+jQSxcWfLqaszAOQN2vdv9fwlS/jNLeOvDs=;
        b=HnzUYEj4tf0fDqmqfAA0IY9hMNNK6/uSeXLJHGZloKw4cRweuCHDpJ8vrLOB64DQiW
         ad2+UvF08zTEa+HXCnBPnDyru9rvPLlfC2N5GfVKNn4X2hKkEafUghji+dk4cNFWjlvL
         lALNyLkiLtwetyyYLP2wYznflOtJ9i3DfIfa4Fqn5J2vdGR7MOpkLTfJyfg+x7XZ+OvK
         fyEoFLEc31FwwAgtbmycYXwp5soGrG3HQxqdtL9lfuVndfDbjDcsKdca81mYpdIZ4aSy
         Uo0NmfEJMDGgumZ20Ci/3zNNBO/WOIQ1cFe98TZ40+7KqGDpF+fma97BfX2FeSSRSx6i
         2Mxw==
X-Gm-Message-State: AOJu0YyVr+QmKnl0Kee8Ki2saXh12Kl/+cuc9OE1XHX6d6cwRcDQA3dn
	+Pw4EWla6u0VyzKC5UR8fvFRTD7pm+nPUmf73jufj8it2mtIVl+up2XYc75VrCMCCzoaunzSShq
	zG6ySvCpr0Hvq3hM4XuTwBo8QZwl97E08zoZbdgXZbw==
X-Gm-Gg: AfdE7ckRfTzW1cLOe2ZH8A8VlAwCey7SAIstSBCfBtz9M6Shss+RXu90e3oixkRmAzX
	xfxjZkEZe+mb6zITNFrLEgfXVRDYe5MoSJ78KDYKw9lGDIjiCx2hkBcGwygrtLacmG0IJF+nege
	6y46PPSLc1s3Zb0KPonMeSCcJ6y1ovzlgbCkPVoPt+J20OHBSlFRSeGUZ4jGyaxAZmPCU9z16Bx
	AFQrE40s8D+B9dKwIVNitTVBKOz8bO+i5j20MkyrgkhJ4CQJhMFes6hoKhzY8auElVXWVbS6GCd
	+MZyNN9SnYgxwbwYCD67/rPN4OemFHw=
X-Received: by 2002:a17:907:c499:b0:c12:7418:729b with SMTP id
 a640c23a62f3a-c129049d6d9mr181162166b.14.1782841888279; Tue, 30 Jun 2026
 10:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260629071648.1471849-1-vanusuri@mvista.com> <CANQUz1-0nv9S0QiempdvvcuxUwS2OMY14d=NjPhgvMp18vUMXA@mail.gmail.com>
 <CAMSfU+7GdTGe4gtD2=hpVOCFFjSnyS1BmrkJG4NGMRN9ZC1tdw@mail.gmail.com>
In-Reply-To: <CAMSfU+7GdTGe4gtD2=hpVOCFFjSnyS1BmrkJG4NGMRN9ZC1tdw@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 30 Jun 2026 23:21:16 +0530
X-Gm-Features: AVVi8Ce3nBJO3nvrJZ8NFf-it7-klsTgMCgf2eSO3CAmQfMCvxy_smOSmKjNLkg
Message-ID: <CANQUz1_9Cq0TP6p87dEXRPLc4xq1KjF9b-kCR9RYix_B7EVphg@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Peter Marko <peter.marko@siemens.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000071269a06557c39db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 17:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239912

--00000000000071269a06557c39db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 10:57=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> Le mar. 30 juin 2026 =C3=A0 19:11, Vijay Anusuri via lists.openembedded.o=
rg
> <vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :
>
>> Hi Yoann,
>>
>> Any update on this ?
>>
>
> Sorry but a day or two is too short to ping me,
>
> Please wait 2 weeks before asking for updates. Before that, either your
> patch is fine and the process is silent or your patch has issues and I
> answer your mail when I review your patch.
>
> Understood.


> I plan to do a proper wrynose review series next week, maybe earlier.
> Does that work for you?
>
>
Yes it works for me.


> Thanks & Regards,
>> Vijay
>>
>
> --
> Yoann Congal
> Smile ECS
>

--00000000000071269a06557c39db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 30,=
 2026 at 10:57=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@s=
mile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar=
. 30 juin 2026 =C3=A0=C2=A019:11, Vijay Anusuri via <a href=3D"http://lists=
.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;vanusur=
i=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" target=3D"_blank">=
mvista.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div><div><div>Hi Yoann,<br><br></div>Any update on this ?</div>=
</div></div></blockquote><div><br></div><div>Sorry but a day or two is too =
short to ping me,</div><div><br></div><div>Please wait 2 weeks before askin=
g for updates. Before that, either your patch is fine and the process is si=
lent or your patch has issues and I answer your mail when I review your pat=
ch.</div><div><br></div></div></div></blockquote><div>Understood.=C2=A0</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>I plan to do a proper=
 wrynose review series next week, maybe earlier.</div><div>Does that work f=
or you?</div><div>=C2=A0</div></div></div></blockquote><div>Yes it works fo=
r me.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div>Thanks &amp;=C2=A0Regards,<br><=
/div>Vijay</div></blockquote></div><br><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Ral=
eway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div></div>

--00000000000071269a06557c39db--

