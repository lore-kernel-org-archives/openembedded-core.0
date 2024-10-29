Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F21FD7494D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 22:40:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.1637.1730241629473195416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 15:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKG8LT/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so4166606f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730241628; x=1730846428; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iWO7/hwdZmOUMARAl+x8n6ir+gsFcoE82eeL1sq1aMg=;
        b=eKG8LT/IkSBJXULVExabYe6Tbx3icRQDODtBwmrOUUU0kJmI5WP6O5FMF3yEx/eD4B
         CeWF0d3LRvCtUnmVt9vuj2S0o+EQHnHv9eWyJoduGtt1Q8twfHgi9c27AMw2mxLS77ey
         pjwxP6L1n9/bnmyBLAS9Ap4HmCpu5SabXOe2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730241628; x=1730846428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWO7/hwdZmOUMARAl+x8n6ir+gsFcoE82eeL1sq1aMg=;
        b=KKd4g0Zy9XTourCV+67Kqrk1zoT0fObq0F05BbawCsipdKnSET2ZxoRgPLX+9QHzm7
         rnyojGcC2ir7jiF2vIkiGmo85+6cd8n4xyHDFaXEmeEjjBVgFkd8oIimmPxoRHiBqRza
         onqgwIAcGuBKdJ9ZqfkUK1GdqYW+9oO6GyOpUTmHas0GQtbo1OsqyiQL2BJhPpviQ7+Y
         WTiMd7W6GZQCHpgbuzaF8wKoGaCj7+tMUlck795NAb007TufYiNknhR8pLzC6o6eCFdV
         TbsVyO8Xo+iWaf+cKp1FcLxmQQrfj/WEBeg8OA55ikswNaWFx8VzzVfDC/SmuQxHlPnX
         wdLA==
X-Forwarded-Encrypted: i=1; AJvYcCW6tmWbsX2UI+CFnSFuvBm1aCPN/PDGf7B05RTTaTUnReBL0wTTqrwpdPY/ux8vrzzZA3SA0BYHCh4Cbkga1ZsdmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywjf9oWLCKb36txG4vuB0q0GLH2Fdc+1eRJI7qHwWtO/xB1TsSW
	8+olYA9jLODUksko7AVgclVCMmdqEy8Em1PI0iovR8ePgJn1BjloMBpavws/M0s=
X-Google-Smtp-Source: AGHT+IHrUd9yxrf06nZakBSoiel9ozxB0aI8PNaoAGli0lNqtO5548xbUg+70+l8PDW5K9eYBni6Pg==
X-Received: by 2002:a5d:4d43:0:b0:37c:d121:e841 with SMTP id ffacd0b85a97d-380611e73b9mr10223809f8f.40.1730241627864;
        Tue, 29 Oct 2024 15:40:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbb2:5c44:fa05:1e5f? ([2001:8b0:aba:5f3c:bbb2:5c44:fa05:1e5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b714fesm13738735f8f.71.2024.10.29.15.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:40:27 -0700 (PDT)
Message-ID: <920805f21a597824d6acf2195a5434000599d83f.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2024 22:40:26 +0000
In-Reply-To: <CAApg2=SBM7Bqmt7ZYTPOOan9T9FTdawoA1zt8+hqS+UAQzu9Ew@mail.gmail.com>
References: <cover.1723636705.git.steve@sakoman.com>
	 <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
	 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
	 <17EB9EED917D6CD6.10903@lists.openembedded.org>
	 <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
	 <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
	 <CAApg2=SBM7Bqmt7ZYTPOOan9T9FTdawoA1zt8+hqS+UAQzu9Ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 22:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206535

On Fri, 2024-10-25 at 07:08 +0200, Marta Rybczynska wrote:
> To make a summary, this patch did not solve the issue on master, it
> was the change of the database path that did.

Originally, I couldn't isolate the change to tell or not. Now, by
changing the database path we've shown the issue is occurring on the
branches without the patch.

>  Is this correct? And we still do not know what the cause is? So,
> when we change the path on all branches, the issue is likely to come
> back ?

I think if we move the database operations to the local filesystem and
out of DL_DIR, we're likely to stop seeing the issues. We know they're
isolated to something about the older releases.

> My problem with this patch is that it changes names of variables that
> are in use. It should at least not fail silently for people who
> decide to use a pinned database.=20
>=20
> Do you see another solution than renaming the _DLDIR_ version to the
> old name?

We either backport the patch as is and have the same functionality
across the branches, or we do some special version of the patch for the
LTS branches. In many ways I think it might be better to have things
consistent rather than doing something special with all the confusion
that can cause, even if people do have to actively adapt to the change.

Cheers,

Richard



