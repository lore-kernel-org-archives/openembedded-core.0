Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B422C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 11:08:36 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.85612.1691579308075960827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 04:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TrL4z0rW;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bcfe28909so917741766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691579306; x=1692184106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6b5BnO3e3CEKC9+itPlAfSmKZ6YyCvJ0R+PPw839x0w=;
        b=TrL4z0rWJGIwQPUhONSKj86M5pL+MczAlQ9zk9AhwHCICysGSaSuC58xp/WPMPB6Ap
         GV4squm1f+fwBuBMnqUDFKN6qsOyzbSR3yOx6V5C9gw1zgZbbANCaAJjlMl3g+SKMOqD
         aOs4QPs9BB4Xdgc6OcvlRLUM1CLu/MbSNqBpcfs4BYdGQJ6P1h3cdKGIKMWyPgVWiEVo
         dfUu/VGq5pna5y50Rax53bixVn2xAoE4kKauLnGRrUknMdimd4rO6hEOM+f/rkDXHbTB
         D1RywLHlLz1ejBnkCDWTGH5QjWG5loxcJo4y2QL+JkHAoGdYxVc0xkIFrCiYoHTAsJbP
         Wm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691579306; x=1692184106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6b5BnO3e3CEKC9+itPlAfSmKZ6YyCvJ0R+PPw839x0w=;
        b=dDWllDWO3pQ2zNsdQfbKv+IRSAYbln3buGPTOJVRp1gYEJdsINiRinLsHxLRBuN1lS
         HTz9VXYxkwSYwxQLjsVUGebfCpII9WV2wUyOdapxIxVOc12fiBsxfx9/VMzaDXo3TLw4
         Ddm3NdFbIHr/RL4XbOSpvmXp/NCef6TAV8NS6tVi2ZaXA/TDxFuyLDDLTKR9VZvzZ/Kt
         yfL/R7fYsDDPDrAfSJMzLpNAYPPAwuIv1ok9sTsuJI1lhhsWZkSrdA2j6WqC79yTOw6g
         iCEOvwcz0kEcJ1bf51xAUzwGixn2WrsY7m7fUQW5REh4+53Or+8AC3xAHTOuzrsL/c6t
         yQ2g==
X-Gm-Message-State: AOJu0Ywvxt0TS9l5wigmSjbzY9Wn2wghL6YJuzKo+VuZzZIeZr0q3mho
	O2maspqTVJOeSEFf1quqhOr4NsrN/l3iXBqpMbM=
X-Google-Smtp-Source: AGHT+IF9ubnr/EYkO88W7cjtTXUWFIGXLbON+GXuJkGrSPyR+piIpEqqINI3f3o6Df1fd9jQGtQhAPdQLL4omzMiOnY=
X-Received: by 2002:a17:906:cc4a:b0:97d:2bcc:47d5 with SMTP id
 mm10-20020a170906cc4a00b0097d2bcc47d5mr1790054ejb.49.1691579306174; Wed, 09
 Aug 2023 04:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
 <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
 <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com> <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com>
In-Reply-To: <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 9 Aug 2023 12:07:49 +0100
Message-ID: <CADVatmM4PuUygcPU-e1GnYVXuxhfo8Qxey0evE___iHaA-NwTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 11:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185696

On Wed, 9 Aug 2023 at 11:22, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 9 Aug 2023 at 12:05, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> > Yeah, I know and I always try to send any patches upstream first.
> > But in this case there seems to be no way to do it.
> >
> > I have tried with https://gitlab.isc.org/isc-projects/kea/ but they
> > are not allowing gmail
> > or any non-corporate email address to register or login. Also tried to
> > login via authenticating
> > with gitlab/github but that also did not work.
>
> I just managed to log in with github authentication, so if you can try
> from a different ISP, I'd appreciate.

There seems to be no way to submit a MR or patch. I have used another
email (non-gmail) to register, but it did not allow me to fork and
raise MR. So I have opened an issue -
https://gitlab.isc.org/isc-projects/kea/-/issues/3007


-- 
Regards
Sudip

