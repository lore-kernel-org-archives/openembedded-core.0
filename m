Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EDCC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:53:44 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.84652.1752515617660485847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQRna+tV;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e897c8ca777so4035643276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515617; x=1753120417; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4JajHaupt4TYwUdKv9KdQLv2vbJVHV0rF2RlzPL2co=;
        b=IQRna+tVydxnp+ULkcrn2TMSm3oZgOwlHt0U8Kc44BsPZVY3/R+ahVCit3Itud+sSA
         qfs9Rqdj2YQNpGNLXNQCQ5kO2qM/HkEiIef/w3dZ8ggRgMVwnECr4fouDMFtwIhA/MVV
         JwCSSTaiwCzf/srFJuU/g+ejwC+AoVdkSRlkGt+aguAFixWBYyntM5YxmjNucScabjbj
         qd48uwl2fFT0sD0ivfgoRtSLqLN9tKAg6mvLVh8lGxpXR5PyGeJdV2mwOp5gORmwCIVu
         Brq5FkBYg+jCpAaVdmBgpciDDcnSexgVly5jtFtGAEuAaEEC7ggJEhfCIYU0/nIZyerh
         ixsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515617; x=1753120417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4JajHaupt4TYwUdKv9KdQLv2vbJVHV0rF2RlzPL2co=;
        b=axJtKIg1EvKvg+uwCmzn0XWSsbpdrApFELHT3q2ORF81Bdw7rjJZ/81u47BEXf0tRl
         8rG1MsDbZYAFLxpgeUMOfkTvktODd8PVvoDZ2bOtZmo88RCzrNe3hz9HJ7FZXeE2Dtzb
         P6najqTF6g9Tk5yu1fZYulJb/RGgZItvrR4Gt6sUxB05Or06w1l0R0dIlzFgvl7puC5B
         GQ5BNH/fn/um0up4tXO/4scLB2b4ixwHFwR0/OKQX9ilv4YuZQb2UVcKr8XrTNXXwXlN
         DPhc07TxhZ2vZ5B0/ACvvpwHBsPdhWr4lerFCfrhHRf0NX13VK6BZAXPGN7DFZEZ0ZeZ
         OZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAfgQk8AW5pN/OtBRm4F8IW3NnHoXTjXtALSrdGZa9/3CpAj5gppAypvNslzLlHotQZNG78KZ/yQpPkJyFHGFohg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6g8C97p/0OirOuwKaZeolQzdATsrpqOMyfugUyKuFCZ3sJmZ3
	PPzbRVOqmEdx4NNE4JRsGysQTNffHfhl1gkFJveqQzBHNagR1BKMRhgRVI6nU+UB98V4ZrmOlDS
	lO32PJ4ecEoCfi/6QZPwbDT+NJSWSDZw=
X-Gm-Gg: ASbGncs4ScgQsppgrUjhLwJlsh5qOllobwGsI+RY5EkTFYe0ueKIaru6ia94gZaRv2l
	PvuVdYKXOJsLdA1uPfeQtqz4HdocGtGEsGQgIZpjpZX9oTKW6r+jbSeDYSlnt0f6sniKLOc7PDf
	IZHYVoyDC+Taq4NakYNWl/nbabRs4UtpcIvppWLnH3H7xwiHYVdtWnc73Gv/aBVC30PjnjjRFa8
	Sw+9KsGDVL8bKG8i0JjUJLqudqBJ+06VXnr
X-Google-Smtp-Source: AGHT+IGf9WrVW0urLiRqiDEVFJcT4Q5Pazw3flmQlzl9bdWDmKvmdqHHCndg/KyC9Nupc32AwasxcKy7RJnuQNMOqxE=
X-Received: by 2002:a05:690c:6a09:b0:70e:2d30:43eb with SMTP id
 00721157ae682-717d5bbe3demr208727137b3.12.1752515616695; Mon, 14 Jul 2025
 10:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
 <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com>
 <CAMKF1soTRpUT5L=ocSpfwz91L+dhhTeH5WvzFeDUm1UGcaB4Bw@mail.gmail.com>
 <CAMKF1sqT=soDHr3sv2tcLf4q9kief68vMs3dF_tEymB7_2zn+w@mail.gmail.com> <aa543b30-5c8d-4acf-9104-1620fc7a669a@bmw.de>
In-Reply-To: <aa543b30-5c8d-4acf-9104-1620fc7a669a@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jul 2025 10:53:10 -0700
X-Gm-Features: Ac12FXzLUX-pFKGKu8L_s1b-A2aRE6o0uViZkcvN96vSjPgRqvl4RiMs2TT5UQk
Message-ID: <CAMKF1soEg=grM3yQY68x4VT9SxHmeTNK_HjOSeR1OzKnJAhO0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: Moritz.Haase@bmw.de
Cc: Alper Ak <alperyasinak1@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220259

On Mon, Jul 14, 2025 at 5:16=E2=80=AFAM Moritz Haase via
lists.openembedded.org <Moritz.Haase=3Dbmw.de@lists.openembedded.org>
wrote:
>
> Hi,
>
> I sent another 11 patches. So hopefully the only one missing is
> openwsman, which
> I can't build locally.
>
> For sysdig, I tried to update to the latest release (0.40.1), but
> couldn't get
> the build to pass due to many new dependencies, so I opted for the policy
> override. If anybody is interested in trying to finish the update, I can
> share
> what I have.

Thanks, this makes the list down to 3
https://errors.yoctoproject.org/Errors/Build/211282/

>
> Moritz
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220227): https://lists.openembedded.org/g/openembedde=
d-core/message/220227
> Mute This Topic: https://lists.openembedded.org/mt/113965735/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

