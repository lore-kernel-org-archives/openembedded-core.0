Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43A8C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 10:12:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.6153.1740823952889387511
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 02:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WFANmtHQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390effd3e85so1493553f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740823951; x=1741428751; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xI0k83pvDjZKEZuxVWLafv1x5HTjeb5h6XjFD+4/lD4=;
        b=WFANmtHQOPtgZcP1zdJnxZlfgrdH4uEJwHSfW2Q3OPHHE1ofWSDW4yToTLJqz3gzIe
         rUTKyPKG4i/4kPsjMCZYOlBot/HExvE+K9ckOZouHgtC//AaCFVB0H9WEKxBh44Bxd1T
         eMXNDuYERx90kfOjHkXftTwm+OG/erMdaDREs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740823951; x=1741428751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xI0k83pvDjZKEZuxVWLafv1x5HTjeb5h6XjFD+4/lD4=;
        b=Skc1ephmX1RpsF58DAT8tMvp/idYIZfpnGHrfaAlksYeTUAeVloHsCM99NA9HqMzer
         wVOgukDZ+3ikAUGxTiAnL7ELdE0WFJCeJKFdTPMnvPcngXKTRHMiEP6eiahpO+d4oRF9
         6lGT89sxohVm81Nh7HLJQjebEVxX5DbG8Ra91EQO+dJz25HPkehDewJG/Ungw/S1NN/Y
         hvK92jEU0WRcH4Xw/ywWrRZTeVKeBNLgV8Z6qLnY0S5DbBJKL/8cWot2c4qlJDjsSUau
         zElu0muROCZKIJXuthgGq1bOzQote3Pm8GnqJVsBHmNU4o2TWofCmHQfTrg+yKs/wZyS
         0ZmQ==
X-Gm-Message-State: AOJu0YyXi1vNENqH63xhWbmwUjPcq88k6ae9keJgZMRXz/0mLEO31o/J
	fG7iS4tHF5O98mLxVjW+olCtS6jYpUD3+7ddbJET0i7rz0WeF5qpMSH6pluZrtA=
X-Gm-Gg: ASbGnctlZWsYkrt3WMLlRyf5Wjf1u6U4Fltcu5nABoJMDgYdt9pjGpyzeU2Trf+XFt8
	atyHAd/vhZOGAiWTgdVjfWm26azc4YjaY777CfP/Uk7i46sCgJY4d0dqbwBwqyWgei3IMjyfq5A
	A9RGXazzLmxRQI8i/uanX4f7OtUi5MaecX+X48h3SSFl+mX5NklH3FtyM/EEzwZxmyr3Jo4IoFO
	jX3GLcmAQ8BLLO8LBGACCAN8kjzkBZMRWZVhV5fRSVv1RIeculcLLwLMw3p4AcHTGWlGj9dazGr
	sS6FQDJgQ65rA/WzMsmMXZBUDjg7a3wDDVy9Nghhl2Ew9hCenUL0iLa2mgMSV9px7oV2LzX5EpP
	oWbmvVIxmR37VvH5jlWUj0KWnF0MepJN9GQ==
X-Google-Smtp-Source: AGHT+IHdO4GbzM7CpIbmh+dVZR+nMRXp4y4Scn3Ko3116cbqRXG08Pzu/G7yTnpFh3jBmtwtbaaEeg==
X-Received: by 2002:a5d:5983:0:b0:390:e822:46de with SMTP id ffacd0b85a97d-390ec9dad21mr6014927f8f.33.1740823951076;
        Sat, 01 Mar 2025 02:12:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e284:a315:76e8:2897? ([2001:8b0:aba:5f3c:e284:a315:76e8:2897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7850sm7997797f8f.39.2025.03.01.02.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 02:12:30 -0800 (PST)
Message-ID: <5084a8689ce043de2fa1a82ad8688cebb53b2905.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Tweak to work better
 with NFS DL_DIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 01 Mar 2025 10:12:29 +0000
In-Reply-To: <AS1PR10MB5697639D41EFB1AFE495DF11FDCF2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241218115634.1666697-1-richard.purdie@linuxfoundation.org>
	 <AS1PR10MB5697639D41EFB1AFE495DF11FDCF2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 10:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212095

Hi Peter,

On Sat, 2025-03-01 at 10:01 +0000, Marko, Peter wrote:
> I believe that this patch is causing problem with the database never expi=
ring.
> I was wondering why valkyrie reports for master (but not other branches)
> started lagging behind reality and this may be the root-cause.
> Currently it's off by 1 for kernel CVEs and it's also missing puzzles CVE=
s.
> And this commit is the only one in addition to styhead branch.
>=20
> NVD update code is checking database file timestamp when deciding if
> partial or full update is required, so that code always decides for parti=
al
> update due to this file touch, rendering the logic non-working.
> And we know that partial updates are inaccurate, and we need to do full u=
pdate
> from time to time to fix wrong/missing entries.
>=20
> From this point of view this commit is wrong and should be reverted.
> Or rather replaced by something different.
> Maybe we could add release name to the database file instead so that
> old branches with different sqlite version are not allowed to modify it?

I think we saw issues even after this change so we can probably revert
it to be honest.

That said, there are deeper issues here if that is a problem. I'd note
that the updates to the database should also ideally be fixed but I
know there are API issues in doing that.

We did try changing the location for some releases but not others and
the corruption issue persists which is suggestive of some bad
interaction with NFS at this point.

We are hacking around this server/autobuilder side right now and
ultimately I think we need to move away from the sqlite database
format/usage like this. I wish I could find help to try and fix issues
properly but everyone just wants to bandaid their particular problem
:/.

Cheers,

Richard



