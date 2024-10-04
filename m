Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EC0CFA763
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:28:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.19006.1728037696581769713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 03:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ESToVr91;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ccf0c0376so1292248f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728037695; x=1728642495; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tr4+nZDgqt2pbhhpmBhs8YsIkzMce5HoKnN2oIWvhk=;
        b=ESToVr91iGkNU7dvlniTmZQwseKVuS41296BSlJFkglB05cPpC6WtmQJxGRtN2lIDU
         kbI75C+hrJFjaR6rKlBxGCikvNkrLiy6eLcYhWRYAkRhe7Mb2Bm9VZTTx+wH9gQ6oi4Q
         dOK7sqGsCGnVgmn6ACJxGPOnuFJzPRQYVl6mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728037695; x=1728642495;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tr4+nZDgqt2pbhhpmBhs8YsIkzMce5HoKnN2oIWvhk=;
        b=C7nm1JGmCgWZyK7bOUcdDnd6dA0TCv8Xjk0vWbe14H4DDYPeuLOUJUGMj5WgpD7lOL
         gYUMsRCGJDhzD/ymbfBruSYsR6hCyoPA4nTT21f8nTr+OZvPRwEu0x7LZ0Jo2iw5OT5j
         52JcPv1Mk60DI0yx4+wbRu0z/EVKITV6KSeAjLn/8QnxeWz1XwGSNdPrjlC5DxXoHt8j
         o2QjECkw/3hf2Gr/OTvlQqm+tn73egDPfAgLsuKiDQdJ6DKTExagJjpB6FxtFoe3mYeB
         fYSPPKRrffqcK8HGr/QWfRznKKjyQ8dC2YpVeisRsj5X0k35IBypOemoc9VO6N9tLKsL
         BmUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGjWgCscP353ZRVsN6RETsAOKqQcAVnR2whmFFyS9wHCBiqLSj+VzXpNrHWc0w9Cr6k/IKQ96TBUb4s654QdTFLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8eDZA35mDZXxD1OCsUgPcKvSBn6sB6nUjmt+tMXfk4vbLhQhq
	KmDC6qwHkJ6Oq1OmejJSjvKyF60gLtC1EbaJvruZ0z49HI2a2c14uKN7fxx+wc4=
X-Google-Smtp-Source: AGHT+IGHpIHDKP68HSGyXOFryfpLGWa4l1aescIfj5AYaK9zpPqFReh/HnJ3JoASVyJQdN50JgsBEg==
X-Received: by 2002:a05:6000:400a:b0:37c:d55a:38a5 with SMTP id ffacd0b85a97d-37d0e6caea6mr1677416f8f.11.1728037694870;
        Fri, 04 Oct 2024 03:28:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:25ac:3f31:db63:541d? ([2001:8b0:aba:5f3c:25ac:3f31:db63:541d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0821293fsm2977977f8f.25.2024.10.04.03.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 03:28:14 -0700 (PDT)
Message-ID: <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: add man user and group to fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: diego.santacruz@spinetix.com, openembedded-core@lists.openembedded.org
Date: Fri, 04 Oct 2024 11:28:13 +0100
In-Reply-To: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
References: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 10:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205228

On Fri, 2024-10-04 at 12:16 +0200, Diego Santa Cruz via lists.openembedded.=
org wrote:
> When installing packages with man pages the man user and group are
> expected to exist. These are included in base-passwd and installed as
> part of the rootfs. However, when populating the SDK the rootfs may not
> have been built and thus the user and group cannot be resolved and the
> installation fails with the following error.
>=20
> =C2=A0 chown: invalid user: =E2=80=98man:man=E2=80=99
>=20
> Adding the man user and group to the pseudo fallback passwd DB solves
> the problem.
>=20
> Note that PSEUDO_PASSWD cannot be made task specific as to include the
> SDK sysroot path in the populate_sdk and populate_sdk_ext tasks, as
> PSEUDO_PASSWD is embedded in FAKEROOTENV, and FAKEROOTENV is cached
> globally for all the tasks of a recipe. Adding the path of the SDK
> sysroot to all tasks of image recipes would be a bit risky, so it is
> best avoided.
>=20
> Signed-off-by: Diego Santa Cruz <diego.santacruz@spinetix.com>
> ---
> =C2=A0meta/recipes-devtools/pseudo/files/fallback-group=C2=A0 | 1 +
> =C2=A0meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
> =C2=A02 files changed, 2 insertions(+)

We don't preserve user/group ownership in the SDK so setting this
ownership doesn't make sense in the first place.

Which release is this with?

It sounds very similar to what this was fixing:

https://git.yoctoproject.org/poky/commit/?id=3D9ccde59c5303abb04e9bb8e2c987=
ff4b8f44bb43

Cheers,

Richard

