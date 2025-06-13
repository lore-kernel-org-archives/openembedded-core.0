Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15541C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:13:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.7984.1749813229027211693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWqIGqNy;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fac7147cb8so35153826d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813228; x=1750418028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=217HAOdN6lXVy02PRH+GVV+QI9cEeKTp60MuNIf61Pk=;
        b=UWqIGqNyguv1zkhmEXC5qphaBsWi4qqAtyNSrDnemkqdHg/WsO7Da59tVrnF2qIyIL
         bZ6zGB2f0BF+Z1YDmyAaFRJo2c3K39caiaJUaiG335pl8yDWk4ugoCczxjlpdtf7lIS1
         2V7ouEDyy/ZL/uiBgpl6IqMmTBCED7SFfg7dJUPpQKn9XIQ6bdSyq2aYaKkFOzo90jhs
         Ls+1rFdf9liwd7ER5+RZZsi5yIawK/XC0CQc4ry5F8mbKJHQM6GCeZ4d05UKOc8cR3kV
         5cQXZj1YDORvMkUg7yU3i7XaKfppgEQktzetEu9iHOJUp0B1MD9niXIHxJcJ0UpeKZ+R
         TsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813228; x=1750418028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=217HAOdN6lXVy02PRH+GVV+QI9cEeKTp60MuNIf61Pk=;
        b=DPKQBQY7Mxhf8qU2nFivr6mmkpg1IKa4DfAMeA6dA8VKcWhtEcOjf1i/XQDs8yXHtp
         KhC9hiOYvDdXf00JpsqAY989a7Jl9Z+y135BeyB7cky3l/ti0N1QoO3L4b7aLVjd8OiK
         5k4dZ7kJ1d0R/5fmVUXFu6MK2JbqaCKV4NhvxinpnP4Ng5NwQwwvq3mVzbs7MGziD+96
         ZtDgDhDfpgfgQABD7FeY9o2dp4Igw+AFfnmgFRv0PQD4ZESkd44Y6KzfTHtlUKO61aJf
         CE7lDAP+UyQ0B6NAMg9CjBSF52n4Z2sQ+K1zhgWW1a4UEpqlSlKFzwSnX3y0+BQmskzp
         omVg==
X-Gm-Message-State: AOJu0Yz/5tqDBMMgMD24kOknz0Cs8SJ8XETHRMUXl7SpoTLFKJMAp4sB
	QxGzmIkWrhK7QiqSQdcTT6IVFmENRjDAs/3tybwsAUBnlNWwt/1zJoemAkf2xgRAGFnQenNgV3w
	3ib5J+Iasdsg3UUr/u7EIBcGWy43egbc=
X-Gm-Gg: ASbGncvmDJENEkwG4fMP9ob508N/mXY2+84MDzO7K2AuoQnSaEMmw+s6Gw+4v+6URGO
	Loty4LhhklsctYNTGJdKn1hLRS4/oXU/eibiMQ/hlx40LyzX3JedLAx9iMAPae7A1UF2ujt3dOC
	6HChJEvKQsWv2QOzfrbKdNlDE6YG9PNAFz1elB+FNVKk431fqrOwNrSttISiphc+VudA77EgDs6
	ipdSA==
X-Google-Smtp-Source: AGHT+IGg4GjB9gy4YVv4hkUbW5aa7u526J20Xd6WGK4e9Sc+SOL/fS3fLT0/BEK8CmQd8bEKfwWv0s0a2vp7iqlCGmo=
X-Received: by 2002:ad4:5f0e:0:b0:6fa:c41e:ccee with SMTP id
 6a1803df08f44-6fb3e58411emr35724086d6.19.1749813227931; Fri, 13 Jun 2025
 04:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
 <DB5PR02MB10213988D0EE8B84F66840730EF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj_n=_VtVHC6tZCR6y2Fj+HwSrLLw9NoNaBzeBvpvoJh2Q@mail.gmail.com>
In-Reply-To: <CANNYZj_n=_VtVHC6tZCR6y2Fj+HwSrLLw9NoNaBzeBvpvoJh2Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jun 2025 13:13:37 +0200
X-Gm-Features: AX0GCFsNllSGSKH_rB1ZQ_T_19zdDpILtFNatJPgqnmkUnnFJgp5bteC1TtHCTw
Message-ID: <CANNYZj8Fk_mC=2SKM1C+nqE7O4zeoDAR0+jOjyJy7XTXZrZegw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX
 to match default S value
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218589

On Thu, 12 Jun 2025 at 10:44, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> > >
> > > -S = "${WORKDIR}/git"
> > >
> > >  # xattr support creates an additional compile-time dependency on acl because
> > >  # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> >
> > While not technically a problem, this introduces double empty lines to
> > many recipes.
>
> Yes, I'll see if I can trim these out. Normally I find it hard to care
> about whitespace, but this wastes precious vertical space.

This is now done in a separate commit:
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/s-in-unpackdir

Alex

