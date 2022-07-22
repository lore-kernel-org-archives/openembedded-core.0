Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FCC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:28:56 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.8475.1658500126756663105
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DEK57tjk;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id e16so3704481qka.5;
        Fri, 22 Jul 2022 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=meLE4dMsTJNmkMuT07Rufq+Cekhb+d60iauykBkkJm8=;
        b=DEK57tjkQ+P3X2zWYeQrdD2EDxXEUU/VDO71yUs4e5BeiwK3VY9OTzlfr3yw1ak3yE
         bSmHRjeUj5359BctSI801NYlZ0QXk4dms92PLgDgksA8jJK789Jigp3lZ920nwgDlMdW
         qqyPJFOwarBL0Kz6Qkm7V6rRoLSQBpmkWTf0So1UUM4OLK9PDn3XpXCAB4XZ348Bs09m
         imL3yE9ki26SlUUGk+iBiZd0pKjbSUYQTcYZlew2PG26mUBQ/DWfUE56dIrQwjcpUDw4
         uo+Gy49ZQYCKU/YKRgCEEvr0Z1fEX7c00Al7Vj2gTlDEH/vUQvwv6eDU3IPawHVktvIx
         0aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=meLE4dMsTJNmkMuT07Rufq+Cekhb+d60iauykBkkJm8=;
        b=slpteiByWy1qKIs5zOMFvmZlIesxwy771wFs7MAL5iV67aUa5AnicNtfK5Y25zeIH6
         crUcaSh7djAAT0EDajm68nuzjj3LFVhHhs2tNdUr1jfT00gfURcKfDTAh0LnYNRTtMVQ
         jhIxan9S8TpsjTvuVhKyQI4R0UxCLczwBRnIbVCN9rSAJFsyzMSvA8DdTZ/luCLTLsAw
         pZG/JzIKHUb1mlXuC9oHSpjQ8+trfhd/U6sVD/9n4J9Hb5rH1D9SplXXhkl9Rb2Noilj
         7Ss0BaNZH/Iu97Az6O7RHa7Zkohey7kURZ0Bko7sgfViR4n2BmtDE8vqAOjnTKbEs2Mx
         Muww==
X-Gm-Message-State: AJIora+5cVVRLQjNrYFheGCLPUsOwtQNpCXfQWSLyPZE6raN68FjG8Ls
	75hcjj4Lqijk+oGFyy/JcavQz0hFr+v0CCpmNoQ=
X-Google-Smtp-Source: 
 AGRyM1sbLlD51U4fum+QhA/uk2IJxTMoHn7whB6jvHNQV0LuvWnT7kCsge9ZLxOwgq2RsQWjsTwxFZw1o0jGstp8NpM=
X-Received: by 2002:a05:620a:171f:b0:6b5:fa8e:5dd8 with SMTP id
 az31-20020a05620a171f00b006b5fa8e5dd8mr103725qkb.149.1658500125773; Fri, 22
 Jul 2022 07:28:45 -0700 (PDT)
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
 <CAMRc=McFVfxjG6U7ectAfHaWEBe9wyb4erd+Khjug1YyWXKLyw@mail.gmail.com>
In-Reply-To: 
 <CAMRc=McFVfxjG6U7ectAfHaWEBe9wyb4erd+Khjug1YyWXKLyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 10:28:19 -0400
Message-ID: 
 <CAMKF1srvQZDtjtQnQPTaT2PNYZCaChCY9S9pBNVQV5ybqAjVkw@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 14:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168409

On Fri, Jul 22, 2022 at 6:36 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Jul 21, 2022 at 3:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I don=E2=80=99t see config.log for Libstdc++ folder in there
> > Can you see why that=E2=80=99s missing ?
> >
>
> I was missing because I misunderstood you - you were probably asking
> for the config.log *with* Jon's patch applied.
>
> Here's the log: https://controlc.com/4544edd8

right, so I can see that its checking for fcnt function on system
where it should not, your toolchain
is using newlib and I am not sure what Jon's build is using for
zephyr, I guess it could be pure baremetal
if so, then perhaps we have a place to look into.

Jon, whats TCLIBC set to in zephyr's case.

>
> Bart

