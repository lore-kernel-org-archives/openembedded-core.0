Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F127C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 22:03:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.52147.1742853795887094844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OwTnYJzk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4072447f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742853794; x=1743458594; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nXJtB8EHMfSfXjI6F0mJFtfpYTl4O5waNoViYCMnAzg=;
        b=OwTnYJzk22VVWdc+hSBmv6rBMpgn2KNoUaWjgS/lentVO0mOx4HN+vZuUAHA5Sj96f
         yWA+XkkV9sk6lj3C7x4r+T4re+Dl2iam10onEE4HmMIojb1MSG8YS+JNBLmRPyCRj2Qt
         jD3QdTXA3mCb+1BNibofBI2MgIFWo6iwMxiCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742853794; x=1743458594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXJtB8EHMfSfXjI6F0mJFtfpYTl4O5waNoViYCMnAzg=;
        b=wHJ5mEnuPLlZehlc3MJKtSXCrxV66XMguqCwobTmk6qAGl3lnnXjwjgmk7G6pUdfqf
         YMXKl0Xok3Mc3Jz4/ahqYpH61fAlaA5+tS4MukBxhtRG5hOwwCQYiNt74Kya6/G9Thn9
         gokIMwuNalzd7+I7vZGWNGZyTHZtsjXRMi+5wKaA6V9M+4SVK8o7VomvFkvikX4+1mXy
         o8ZH3C7b5Hms0qni5/xKYfmUYg6ZMNC0UyNh53H16ZpY+mqjJYKokegVU1M46cLm+0gi
         K0eNd+VjKr/UehSK7Bg6LW6bL0w9qafN+dnqfrnjdsYlc0IzYPLdZVpAEsd+2I9I6qYq
         RDKg==
X-Gm-Message-State: AOJu0YzYIuIaO1/QV/r6QNKlPENu8zDWOZKrUPwCxfeo109FqJvNm2kS
	VtSFTpAf35ojxVhshpk1DpUszZRqMl+jwmRAzlZcDLW8hTRFRzmvjNvIb8BcwDQ=
X-Gm-Gg: ASbGncvOLqqutNn5nPK5HQrU8eGPlNTVWt9yqDQ3yusZKCddFlatWy9JO4ml+v7EuW7
	hVDTmotA1gOXAyMBTx/8hiiMd7x0z01QMuHOcOeLkRPIQ45PqBAsYX+ngElysmHZlL51OrQD8sZ
	WdkpBlM0vn1aG1mne2jFbt1Z4KituUr/N7Ec7KD26T41OK/h+bChLeOJREQsZgM2eX8bI8E/QPp
	m3Cbk0BNtCLdHssYSGlpj0c27Aamjx0HWGVTOI0Yq9ArK84441tp7IdnLkkgHpUYQNBNgWXN2P4
	OUq/IQ0pk80mdzfKogMjCjj4XBO79//t9ypJpwZFR6V+jvdKKQuWKlGZu9zseavtWIwPNXqz10A
	8wgFUQbXTfoEDfX+rT1OVHxvydv41yqu3hA==
X-Google-Smtp-Source: AGHT+IEH5BaB9Hrw8MTRYN8rZv/EjXYULa930VrRJu2uKxZdGO8NWxPRMeHc4V2pPykUaEtSLdwVGg==
X-Received: by 2002:a5d:64af:0:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-3997f8f8321mr13029792f8f.1.1742853794060;
        Mon, 24 Mar 2025 15:03:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a60f:7d04:efa2:677a? ([2001:8b0:aba:5f3c:a60f:7d04:efa2:677a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd27b59sm132299935e9.23.2025.03.24.15.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 15:03:13 -0700 (PDT)
Message-ID: <5cf7bb8c104d101cf04984770dc00177afbfb9c1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta/conf: Start to populate autobuilder
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2025 22:03:12 +0000
In-Reply-To: <CANNYZj-WJXunBcAeE0mm36tKE1R_2fUFcFkz7=vB-PSHkj4NpA@mail.gmail.com>
References: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj-WJXunBcAeE0mm36tKE1R_2fUFcFkz7=vB-PSHkj4NpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 22:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213582

On Mon, 2025-03-24 at 19:28 +0100, Alexander Kanavin wrote:
> On Mon, 24 Mar 2025 at 18:09, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > This populates the fragments directory with:
> >=20
> > a) the default set of variables used in all autobuilder builds
> > b) three different multilib test configurations used by the autobuilder
> >=20
> > The aim here is to start to make some of the autobuilder configuration =
more
> > visable and patchable by users, and to allow some test confiturations t=
o
> > be user selectable if appropriate and needed for debugging.
> >=20
> > The main aautobuilder fragment is probably not directly reusable by mos=
t
> > users, it contains the resource limits as used on the autobuilder itsel=
f. I
> > can see arguments both way for whether this should be included in OE-Co=
re or not
> > but having an example of how we configure this is probably useful.
>=20
> I'm glad to see fragments taken into use in one of the most core
> places in yocto :)
>=20
> There are a few notes I'd like to make:
>=20
> - there's a companion patch to yocto-autobuilder-helper that should be
> posted too:
> https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?h=3Dmaster-=
next&id=3Daccad467ff54ed71a00a1a97ad015195101dd4c2

Well, I knew this was going to get rejected so I didn't think it worth
posting yet.

>=20
> - that patch keeps "BB_HASHSERVE =3D '${AUTOBUILDER_HASHSERV}'" in
> config.json and doesn't move it to the fragment, that should be
> explained.

Right, there are multiple reasons for that, not least that the
autobuilder has access to servers in a different way to any other place
so it can write data to that server. Those settings won't work anywhere
else at all. There are also cases in the configuration where we need to
avoid setting or change that, not least when we had two different
clusters running from the same config with different write locations.
It was therefore set from local worker specific overrides.

This can probably be simplified again in future. I was trying to
experiment with what we could move out and start working with, not
least to use the fragments feature.

> - the new autobuilder.conf inherits from config.json a variety of
> things in addition to build host resource usage. It also has SDK
> settings, logging/reporting settings, qemu/testimage settings, unsets
> sanity tested distros etc. As a followup, I'd like to structure and
> split this up to different fragments under
> conf/fragments/yocto-autobuilder/. Some of it could probably move to
> poky, so that the delta between what poky users build and what
> autobuilder builds is as minimal as possible, and ideally non-existent
> (e.g. the difference is only in resource limits and directory/url
> settings). All such tweaks should be done in lockstep with changes to
> config.json or meta-poky/ to reflect them. And they must take into
> account the history of config.json changes, e.g. consider why
> something was added to begin with, and whether it is still needed.
> It's a lot of delicate work, but I think it's worth doing (I can find
> time for it).

I'm not sure I 100% agree.

We're after to expose what the autobuilder is setting and this does so
in one relatively clear fragment. If we start splitting it up, users
then need to mentally combine all the different pieces in order to see
what the autobuilder is using.

The key question is whether any of the fragments are more usable in
isolation and whether the naming would make sense of it. I guess where
I worry is the number of fragments you hint at above.

I can see the case for these being separated out:

QEMU_USE_KVM =3D 'True'
INHERIT +=3D 'report-error'
PREMIRRORS =3D ''
BB_GENERATE_MIRROR_TARBALLS =3D '1'
IMAGE_CLASSES +=3D 'testimage'
SANITY_TESTED_DISTROS =3D ''
SDK_EXT_TYPE =3D 'minimal'
SDK_INCLUDE_TOOLCHAIN =3D '1'
ESDK_LOCALCONF_REMOVE:append =3D 'BB_HASHSERVE'
SDK_TOOLCHAIN_LANGS +=3D 'rust'

with the remainder being "resource" constraints. I'm not sure I'd want
to separate them more than that.

As you say, some of this could potentially move to poky, although I've
been trying hard not to reduce the differences between nodistro and
poky rather than increase them, so the case may be for changing
nodistro, which is a different level of work.

I also realise we could have one fragment including a list of
fragments. I just worry that if we split this up too much, one of the
objectives of showing people the autobuilder config easily gets lost.
The amount I get asked that is scary.

FWIW even getting to the point where I posted this patch was painful
due to tests failing due to the differing ordering in the config of
auto.conf vs fragments. The delicate work you mention above is fine, if
we share a common vision but I'm a bit worried we aren't entirely
aligned at present :/.

Cheers,

Richard


