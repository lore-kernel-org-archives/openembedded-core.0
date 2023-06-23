Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9509BEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 07:53:03 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.37357.1687506782040247736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 00:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BGuIQSah;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so348777e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687506780; x=1690098780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6XxdfSHGO1NDE6cDbJBxZZpG9VHaVO2HF6y2E3geSo=;
        b=BGuIQSahm/yV5x6Rnj2RW9h3LkNwvmP6xSoCBQj8f2Wy3H8/iviIlOtMcOKm6C1186
         is0evk6ae9C7IIqxI/z46Oxn9adYYptSM8OgrQt9Mh5xgZUNKs3Iebh+tgxOFt1EWa5X
         1hUZRfSz5wBxvxLsqJSt0A1RJm0UJev5IIlfz+cIltm2GATJYB8HRtaOWfYBZubHfk3J
         PylHQmxaHUp5bH3Ka3j+Jg7fhtB747yUGzM5BihFH1CtikpzCn+6827HG/LTxNMLV022
         eevnMXFFNx65+BKd2/i+ULroPGmvGaNH3SY5uCxI4INcYpHq2Qv04BFKnMCKfJfV/brU
         EWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687506780; x=1690098780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6XxdfSHGO1NDE6cDbJBxZZpG9VHaVO2HF6y2E3geSo=;
        b=brcNmfVz5sN0lnb3yC7uuFYuveDluJQIFc+02p51ucetmCQOI78ykS8KNJgTmEDJzr
         FcGQXdiQ/mNgmdPSTZXBZJnXgJgLmb5kuUaEK5ZCkTfnitbDKIbuUzzF9O3bchwYuvNd
         SIpfbOz0btX/LXacNYtb6Q+ue/smisQ6NyZnMI6inVIPao030UthSTUeQF+9JjbeLZhb
         /R9gYgbHCRztDDO9jciJZEajAAvN2QYcIZUGsFYe9iYf1LlnjAIq7jQN4C6HpO2rMREW
         NVGCAuFj5i8ngpfYwub8B6XpJta6q3nuy1paDLFjyENLjTHu1zt6fQ8Bo3dY2i94zbqS
         P7mQ==
X-Gm-Message-State: AC+VfDwX9BgVptclM9cFg5lM5reXoGiKmPZtTIegRfNn9wiUQ1eZKWRR
	EjCUnUgeOmkhtFpKYSWuLiboX2SQngpttW15zwUHKcYB
X-Google-Smtp-Source: ACHHUZ6I3OFS7PcuhBGzn0uVJKeAxu8kdIAAIph3wu6d7dAhm3jSTCC2Y/ChkNyOT8zr0JDoOY3Xw/pGoVFG39UYJ9o=
X-Received: by 2002:a05:6512:32af:b0:4f8:6e1a:b552 with SMTP id
 q15-20020a05651232af00b004f86e1ab552mr9955622lfe.28.1687506779707; Fri, 23
 Jun 2023 00:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
 <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com> <CAE=T-s78z1EsvaTs6AiSU2LXwB9Niq1_UGSWG1RmhSUkk1eGBw@mail.gmail.com>
In-Reply-To: <CAE=T-s78z1EsvaTs6AiSU2LXwB9Niq1_UGSWG1RmhSUkk1eGBw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jun 2023 09:52:48 +0200
Message-ID: <CANNYZj_afN2+PxGrQVLShBnrKK6th7=EeUO-nrb3B7oZHrEU1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 07:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183309

On Thu, 22 Jun 2023 at 20:04, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
> > I'm not sure I understand this. The check is to ensure build process
> > works as it should, specifically to prevent build host ownership
> > leaking into packages. Yes this information doesn't matter when these
> > packages are installed, but it matters for correctness of the build.
> >
> > Alex
>
> Maybe I don't get how this check is done because everything in the TMPDIR
> is owned by the user running bitbake.

Installation and packaging tasks run under 'pseudo', an abstraction
that gives the tasks an illusion of running as root and setting file
ownership without restrictions. On build host's disk it's all owned by
bitbake user, but actual packages contain the desired ownership for
the target package installation.

Alex

