Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5DFC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 10:36:25 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.6204.1658486182900872696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=t70iDAcv;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f44.google.com with SMTP id va17so7926506ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eTBND3RS5MpVz0FBEYzNor86HzybgCFhrkJEztAuPIY=;
        b=t70iDAcvVe2jTJa6iQuRRKgWFUk/G50Z/BKMlr3fHL9qvdt4ySGvBVSjU/5RYLENLF
         hSStwoCaH52eZtfTgXnqoLvJncSQxE5RoYlI4dkgl/9d5g1xid+j4G6eDYpoSoCK4OSq
         qtAZSeI+sExZp+du96PZwUmqGtVuSIhBHf67LrGfk7r+hnvch7cJH/o2//ZCzb7iZCGl
         3+uv6fXraDVomB29lSR4S8oRyhr7nrK745W/YaJ3etZ6Y2lvt59zHSzFw15UgCadd/OB
         64kMPDjD5Vg0dB/D7aMT2i80C7UUaiZ/yJVLB08/X/qVF0emURz4DDXFSQHNx0fCmw72
         7evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eTBND3RS5MpVz0FBEYzNor86HzybgCFhrkJEztAuPIY=;
        b=OPGVUMuNMtus5RfG4Sv+PXtLIpUmeExMzOQiBFJp6rcPxVdHKKQ1JHczVLgIBHJfP2
         wEx2XhHOPg+J2c0gmZqxhzg6d4TUtsI7+o360n7WeQTRJ5zZ+w3H1LcOQPOSUFG31BVM
         qxsDyKrLK6b65i7UL71aySVHJImC3vYq/6mtDmFk+Lo9GigU7lRMSynSpM+l834kjNty
         FgSFMARkpv2IeRVBCESYsyBY7FAR/Y2y+kF9gOdYoWAuJ7HGKmDYq6gtkFwsEQM8/k8t
         vZAx83pFHoSDAN1FocQsHMBi0L69j+d7rCAnD4DFD9KwRuGSlPolua8PPvyOPTV43wDV
         fBew==
X-Gm-Message-State: AJIora9hu4XyRFnnhmDmTJ16PiDTvRspdKj351uoDPy7tfzseHiw7T/f
	9RqaVvLsOiFEGnsckRSa/fu+2wTrqfXtIE8wsEbhew==
X-Google-Smtp-Source: 
 AGRyM1smiLO/1EfDPlfJH9m6AGJyY9o8ole9kGGhrIO9pkVvoxnD+4V+gHJnanMu1onhVoSiLJQQdKjymJBdeBm1PUM=
X-Received: by 2002:a17:907:1b16:b0:72b:8c16:dac0 with SMTP id
 mp22-20020a1709071b1600b0072b8c16dac0mr2573283ejc.286.1658486181064; Fri, 22
 Jul 2022 03:36:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
 <CAMKF1sq4ZT91i881_tVXddV1axi+-NCJBkKizxpBUPLMuEVt8w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq4ZT91i881_tVXddV1axi+-NCJBkKizxpBUPLMuEVt8w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Jul 2022 12:36:10 +0200
Message-ID: 
 <CAMRc=McFVfxjG6U7ectAfHaWEBe9wyb4erd+Khjug1YyWXKLyw@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Khem Raj <raj.khem@gmail.com>
Cc: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?=
 <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 10:36:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168400

On Thu, Jul 21, 2022 at 3:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> I don=E2=80=99t see config.log for Libstdc++ folder in there
> Can you see why that=E2=80=99s missing ?
>

I was missing because I misunderstood you - you were probably asking
for the config.log *with* Jon's patch applied.

Here's the log: https://controlc.com/4544edd8

Bart

