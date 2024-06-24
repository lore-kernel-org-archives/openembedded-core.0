Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89CBC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 12:22:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.139091.1719231747863273717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 05:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbMaI05l;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso3106012e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719231746; x=1719836546; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y26aSOrx74CIHXrJWnFp3pVFdcQ4d+UnySoyPDsjWaM=;
        b=VbMaI05l23KP9hMmaOnH3hmTiYFQjwAsMGpUeimsUx2DAAk9VJi7mnOk4tZ8v7Diax
         xUm4QXoW/t2K2XsCWXIaDOiByeFErv2UyoOPp2iBKl5MP27o6oeenmkWqJZy7YGHt4cv
         z7dVCNdThG1UVhcbJTI6khoB+itF0v36N1ANEk2PSjsDBbAMEht0MP/M5LAmub5of5Wp
         WgyKB4uIh4vCT/BLJ+KT1gFp/ra6Sg0wYVZIFn8g7x0Tj+xRWTj4IXV+npc2cDQX4UKx
         fxO/xgzLWkpRAr9o6yTXE8lBm1C/Ef3CaqBSN6hx2y/qXlsUt8UxtSt6+HVgfuwyTk5t
         hRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231746; x=1719836546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y26aSOrx74CIHXrJWnFp3pVFdcQ4d+UnySoyPDsjWaM=;
        b=InyNFGhT+IS8o7mE1t3UwzVWZO20EL43f/Mu/3Bogz8oxCsHBihJa3oigtE0zvUkLM
         lP6rbms7i3yM6HHCkdX0NPZIpejAta7uZycgJYcPLZbVckr+4WE/Q0w1NBoMGsmAU4k2
         VdimKRBB0WT1ZGfG1/gc0GKVitack3PPsWwfPMtwHTdhNZzhs66h4fG9FIlkut3jkaKL
         gpGMvBVeebbfVj4/HsZTwzMpDPEd0eRgcqNwhZdDOa8+whiFHeN9lQO2avv7mj9BRgdz
         6a8KkPC9Aw/7kxZD0CwEXe9nj2zzsWeMWQEDSMziHqCyMLK14WjweTYsTG7H5+Ua3DFP
         2+dg==
X-Gm-Message-State: AOJu0Yz1/TxZL6jy0XZZq1M1tDu2yhGYGlo+8us2HwuiaOCvItGhtJA6
	vG+XyUadhlwPsvmqImkKyzagn/pC+D9tGdrCAVGEDg51Pr5bc6WwYGbci+dlgsheE7JLLD8Q8mB
	fMWvLUz1piRJ+KFpWp/DEybTN/r8=
X-Google-Smtp-Source: AGHT+IHoxNCePOggXxlG4IcPwVhbifHDUvK/4nuy6gwa3vfDED5V0gD/hHzuAAkIjhe2jV4unavChpApwtWT/raoB98=
X-Received: by 2002:a19:6401:0:b0:52c:812b:6e72 with SMTP id
 2adb3069b0e04-52cdf7e66f0mr3337326e87.1.1719231745543; Mon, 24 Jun 2024
 05:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
 <2056.1719220048661049006@lists.openembedded.org> <17DBE5C236FF6606.28936@lists.openembedded.org>
In-Reply-To: <17DBE5C236FF6606.28936@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 14:22:13 +0200
Message-ID: <CANNYZj_A5UX7vt6cnS981HMOkSh-0BOs0z1sfk6M8odsbjkCuQ@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201079

On Mon, 24 Jun 2024 at 11:11, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> I can share the two different build directories for your further
> inspection perhaps? Let me upload the tarballs somewhere public.

They're here:
https://drive.google.com/file/d/1kKhHoC3oMFPFjvuLvM4glQzKX8JeXNue/view?usp=drive_link
https://drive.google.com/file/d/1RCoZipt6i9wWG3j-j2rilWCNW_NMNCk9/view?usp=drive_link

Please let me know when you have downloaded them because I'm nearly
out of space there, and need to delete them ASAP.

Alex

