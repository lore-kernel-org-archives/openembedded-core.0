Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC9C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 11:43:06 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.81159.1717414977733682659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 04:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRg2cLLV;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eab0bc74cdso9255781fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717414976; x=1718019776; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s699mIQnk+lTOcXFXn1Tk+azEJUowTRiAT1ZumQaK8c=;
        b=gRg2cLLVlTdfIlflgwH3xReL3adCooDxQNZ5Gsk/Hcf8xXMzkVtD/f4l8uff83uYzq
         LTtinnaq3qmQ24D6woalTWWj7DtNGrFRSs45FXfu0CsVh3RIdABpzrcQKtNxBC7lTEW2
         Ezye8uvAC/n+kHhRZxSnqi1fVOsCuKGKrPLRyOtq6Tm9b61M0ECeo0KriSfSkY5AY5X2
         ze/SVDuH2t2j42Bh0IdnMqPWWMPD+LClw+IKibaOORqiJtjaj0Q5iCh6WU1OiEfI6yMn
         mGZkzK+waxQebB5fspBYozIitWvzccxv260hOO+FhzaR9E7Out2DvbKZYG9tt5Ise2FE
         nVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717414976; x=1718019776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s699mIQnk+lTOcXFXn1Tk+azEJUowTRiAT1ZumQaK8c=;
        b=Qf8soPC+ZPJLFoUVCnb2EOMoQ+6ZBfYHuKVDi+9zU3erK1/0llYh3+eyEBmS70ExhM
         90Y4UPMbl1Y14VSsQmi/g+lkvwIosI6ApgvZ0NqcaLkRWFq++v97nZtEWrNPeClC+d+h
         Op+xnmT7OjXkYfju2lo1+0t1l8l2ws9O/1Jvd1bcvjFY/yBFIVgewgOkGSaRlwc7BvwJ
         OtybRuIN2FMrSoaMNCQjz/mczzsW+697Zegp7jBzj9i3iIoRqDBWWGr3o4K4RCCasvP4
         5bNy/OMj/m3qM5W32eLMde73b3xTnD+HcRsed2rSz+xB8yC8clgvpchQg+AJrrHdUy9V
         S+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX78TO/MlHsjgKjoojAGpl9QuFGZOYohy6L498Hu9yRcfvEwtGdVc4MHIUgRprnApGGCzKMRYwA7h0jLg8XHx4cWl+94jTvrQzzXPc+XTnnCBp2dCbmi1g
X-Gm-Message-State: AOJu0YzXXQ70c8Y4qbHDPlsT82OKnirQydUMnhkgB7wRiKEwa9NHvMWo
	ABdPrqRb2tE+meLscn9yW6DmSSrEmif/SfBGAWg5wXiSZp/PIgPVCyXrgBfenwgu+74wDAS2QHv
	i1yLLXHplAQSqYh+KwwDjQoxnYRY=
X-Google-Smtp-Source: AGHT+IFqBRjYUdH2nr0jdR7+ImPtA6FOuYPkzQuzHLxD6W3unhDYIw+/XnJ99qh3IVz5PaoFCd0Aj0UyIpGxLA2Kwc0=
X-Received: by 2002:a2e:be0f:0:b0:2e9:8418:1f5f with SMTP id
 38308e7fff4ca-2ea950c842dmr62787261fa.6.1717414975564; Mon, 03 Jun 2024
 04:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240529100853.1162640-1-ecordonnier@snap.com>
 <80be0806edba87cb67f7f5711fb9c83516fb860d.camel@linuxfoundation.org>
 <17D44D900E0F42D1.15404@lists.openembedded.org> <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
In-Reply-To: <CAHUKmYY53BOSRdFvxwsTeDOXfurLbvJ9yS6by-K4mR1OshvFRg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 13:42:44 +0200
Message-ID: <CANNYZj-7fpCn4WktmQxLYZVHkBZNL1yipSaXJJShTSc6ZwexXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: fix regression in minidebuginfo test
To: ecordonnier@snap.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 11:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200247

It's not typically expected for contributors to know the ins and outs
of the AB test matrix; just send the needed patches, and any fails
will be reported back to you.

Alex

On Mon, 3 Jun 2024 at 13:35, Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> Hi Richard,
> thanks for merging the v2 of this patch. Is this test running in CI curre=
ntly? I'm thinking I could send a PR to enable minidebuginfo in poky-altcfg=
, but is there a way I can verify that this test works in yocto's CI? (it w=
orks locally, but as I mentioned it would fail on a kernel with CONFIG_USER=
_NS disabled.)
>
> =C3=89tienne
>
>
> On Thu, May 30, 2024 at 5:24=E2=80=AFPM Etienne Cordonnier via lists.open=
embedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>
>> Hi Richard,
>> I thought it was OK because systemd requires usrmerge, but I've sent a n=
ew version of the patch using "env sleep" instead of "/usr/bin/sleep" in or=
der to be safe. I hope this also fixes the test failure which was happening=
 on CI.
>> One reason this could be failing in CI is that this functionality curren=
tly requires user-namespaces enabled in the kernel (e.g. core-image-sato do=
es have CONFIG_USER_NS, thus it works with this image). This is not really =
by design, and I'm working on changing this in the upstream systemd: https:=
//github.com/systemd/systemd/pull/33043 . I can then backport this on scart=
hgap if the change is merged upstream.
>>
>> =C3=89tienne
>>
>> On Wed, May 29, 2024 at 4:54=E2=80=AFPM Richard Purdie <richard.purdie@l=
inuxfoundation.org> wrote:
>>>
>>> On Wed, 2024-05-29 at 12:08 +0200, Etienne Cordonnier via lists.openemb=
edded.org wrote:
>>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>>> >
>>> > The builtin command "sleep" was getting executed instead of the busyb=
ox binary.
>>> > Hence "pidof sleep" was empty and the test was failing.
>>> >
>>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>>> > ---
>>> >  meta/lib/oeqa/runtime/cases/systemd.py | 2 +-
>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>> >
>>> > diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/r=
untime/cases/systemd.py
>>> > index 5481e1d840..a2229848e7 100644
>>> > --- a/meta/lib/oeqa/runtime/cases/systemd.py
>>> > +++ b/meta/lib/oeqa/runtime/cases/systemd.py
>>> > @@ -145,7 +145,7 @@ class SystemdServiceTests(SystemdTest):
>>> >          Verify that call-stacks generated by systemd-coredump contai=
n symbolicated call-stacks,
>>> >          extracted from the minidebuginfo metadata (.gnu_debugdata el=
f section).
>>> >          """
>>> > -        t_thread =3D threading.Thread(target=3Dself.target.run, args=
=3D("ulimit -c unlimited && sleep 1000",))
>>> > +        t_thread =3D threading.Thread(target=3Dself.target.run, args=
=3D("ulimit -c unlimited && /usr/bin/sleep 1000",))
>>> >          t_thread.start()
>>> >          time.sleep(1)
>>>
>>> I get a bit nervous about hardcoding paths like "/usr/bin",
>>> particularly in the context of some distros liking to move things
>>> around. We may want to put a shutil.which("sleep") call in instead (and
>>> an import shutil if needed)?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200246): https://lists.openembedded.org/g/openembedde=
d-core/message/200246
> Mute This Topic: https://lists.openembedded.org/mt/106365956/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

