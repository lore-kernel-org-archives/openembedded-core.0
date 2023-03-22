Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B4EC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 19:11:55 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.53056.1679512307515407061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 12:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AU+7rZlr;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a11so9554586lji.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679512306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwlNbycpDGNCoCsjpchFqYIhi270d61gENf4dV5qSUs=;
        b=AU+7rZlr2BXz+Ce1Pw581UzLImLIkac/BfULIv9Us1jbRs/xmIX6/88dg3uwAkLCX4
         KGYYON7WvflckXHZXOs6k4wvUJ4THHtuCpvNhoHe2cpENQowsWmWDWWiGdvelg/YbwEC
         tDRa6NGd65Gnz3DRdp0znPWsCUkwNJ0pTWqgvq/VzHJccG3f6Xx/uiN9a0Uby6MmzTGj
         rIvCP2n+tfeZvAM9arUBuchxs8L8awAhJ3gl/MTYolHWEsHlCSLnJ2QpAF4B9pvdeUfI
         DzyqQ20jVnKyTE7wuhecoyh3SnlPpSUmi4S8/0L51/X2KDQ03tbBNHEtERGmBmUqIDUW
         7F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679512306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwlNbycpDGNCoCsjpchFqYIhi270d61gENf4dV5qSUs=;
        b=ixuObaIYGaMyAomvhD1WxsSuBpL7oDFyMvpNWHtAvrpTVU/+aCHrwXeUlEL0X2p944
         Ereo194JfLNgMEAizUtnZRuinx78RUe7EPFTxthx6U7hOuFiUYFC519GgL79uNkjyLsN
         1Z4V40AQceocd0/xdzecFUk8AovTbFagLq1x6qyDd0iEJKcs0hEqqcfUgVqaaBPiRpwx
         Dun+eKNDHSOayegIUQQSR8ay0buIT58qleoxsmHNthrdY/hVpswDCxoJntILwPZJpP4l
         uxrTNayd4q+gxna8Igrwz5rDQckMxK6+6Gzm/r7n9yap5TiSVGKaBr/h1vQsMvtpQecz
         S0oA==
X-Gm-Message-State: AO0yUKURHHma1rHUSNMbDKDjhdGlMpCwfs+nJXY/6mxS0/LF5ZBCbxac
	C2eNMDm1sIVN8z2cBOwFPO09Q+/u95WxZ04bQBw=
X-Google-Smtp-Source: AK7set+g/a+i10eEuo86hQ8bU1KSfY4IM1Oxw7CjkZ/zKQ3geUWnLYnCo570SqfAo1jzug62XnEcX2IilEa/eDUgM/I=
X-Received: by 2002:a2e:7405:0:b0:298:b3c7:293d with SMTP id
 p5-20020a2e7405000000b00298b3c7293dmr2404464ljc.7.1679512305532; Wed, 22 Mar
 2023 12:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060202.385862-1-f_l_k@t-online.de> <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
 <9FONRR.ZLSABXKTP67E@t-online.de> <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
 <B0EORR.JWJ884MGYK8G2@t-online.de> <CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
 <CHRXRR.A1NILQGNBS7P1@t-online.de>
In-Reply-To: <CHRXRR.A1NILQGNBS7P1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Mar 2023 20:11:34 +0100
Message-ID: <CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: f_l_k@t-online.de
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 19:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178954

I would suggest that you build core-image-sato-sdk with this change,
but with three different options for INIT_MANAGER:
INIT_MANAGER =3D "sysvinit"
INIT_MANAGER =3D "systemd"
INIT_MANAGER =3D "mdev-busybox"

Then run bitbake -c testimage for each of them.

If it does not fail, then submit the patch again with a revised commit
message, and then someone could take it through the full test matrix.
I can do it.

Systemd nowadays sets the de facto standards in these matters in
mainstream distros, and other upstreams (e.g. glib) will make
assumptions based on that, because most people develop on a mainstream
distro, and all of them are using systemd. I'd say that in itself is a
reason to align other init systems to match - if they aren't
opinionated about it.

Alex

On Wed, 22 Mar 2023 at 20:00, <f_l_k@t-online.de> wrote:
>
> After a turbulent week I finally have some time for the hobby again. Howe=
ver, there is a hardware problem with my build machine. The CPU fan failed =
and for some reason the warning for it was disabled in the bios. I didn't n=
otice it until the machine just crashed with an overheated CPU while compil=
ing. Cost me some sstate cache and I have to get a replacement for the fan.=
 I had done some tests with sysvinit and this commit before. So far it look=
s like busybox/sysvinit has no major problems with the change. However, it =
is of course possible that such an invasive change could affect workflows t=
hat I didn't think of or overlooked to change one or the other line.
>
> In case the commit message gave the wrong impression, I would like to exp=
lain that it was not my intention to push a change here just because I like=
 systemd. My logic was something like this:
>
> Glib-2.0 uses ptest to ensure that /tmp is not a symlink. I am inclined t=
o believe that this is intended and not a bug in the test. Based on this as=
sumption, there are not many options. You could either make sure that no sy=
mlink is created for ptests, which I don't think is a good idea. Strictly s=
peaking, this would undermine the test by creating a different environment =
for it than exists on the target. It would be more honest to simply ignore =
the test for that case.
>
> So I thought it would be best to fulfill glibs needs and remove the /tmp =
symlink everywhere. That's when systemd came into play because I thought if=
 you have to make such an invasive change anyway, you should first see how =
systemd would expect it.  That would be correct if you agree that systemd s=
hould set the default.
>
> If not, I could also send a variant where only the /tmp symlink is replac=
ed by a directory  that has a  mounted tmpfs but doesn't remove /var/volati=
le/tmp. That might be a bit less invasive, but we would have the problem th=
at directory structure under sysvinit is fundamentally different from that =
under systemd. In any case, even with this approach, I couldn't 100% rule o=
ut that it could affect sysvinit/busybox or even systemd based images or on=
e or the other workflow. But at least I tried my best not to break sysvinit=
.
>
> If I need to run any specific tests I can do that as soon as my CPU cools=
 down again
>
> On Fri, Mar 17 2023 at 07:10:36 PM +0000, Alexander Kanavin <alex.kanavin=
@gmail.com> wrote:
>
> I think it would help to at least take this through a-full so we have a h=
igher degree of knowledge in what breaks and what doesn=E2=80=99t.
>
> I didn=E2=80=99t look at the patch in detail and won=E2=80=99t be able to=
 for a few more days. We definitely need to understand how it affects other=
 init systems, but it is totally doable, there is only a limited number of =
them and how they handle tmp directories and what they expect from them is =
tractable research. As long as no one expects RP to do that.
>
> Alex
>
> On Fri 17. Mar 2023 at 17.31, Markus Volk <f_l_k@t-online.de> wrote:
>>
>> Am Fr, 17. M=C3=A4r 2023 um 11:53:17 +0000 schrieb Richard Purdie <richa=
rd.purdie@linuxfoundation.org>:
>>
>> It would help me if adverse effects are mentioned in commit messages. In=
 this case I can spot it easily enough but I don't always know/spot all the=
 issues.
>>
>>
>> It would be too harsh to say that I don't care about sysvinit. Of course=
, if something breaks as a result of this commit, I'm willing to take care =
of it if I can help. It's just that I don't personally use it, so I haven't=
 identified any other issues that might be relevant to sysvinit. Other than=
 the obvious that anything that would write directly to '/var/volatile/tmp'=
 would break.
>> At least I checked that sysvinit images could still boot. I have success=
fully run core-image-ptest-glib-2.0 with this patch applied. If I knew of a=
ny problems with sysvinit I would have pointed them out, but unfortunately =
I have no further findings yet
>>
>>
>>

