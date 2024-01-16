Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E9CC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 21:25:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.30648.1705440355205092563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 13:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SWBJWrRE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-337984681bcso3737621f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 13:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705440353; x=1706045153; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK/WNDJHlaehla4dojuUFvU9fAziRAlW3rB0VRFYSD8=;
        b=SWBJWrRESZT0D1hRjX6RwVGZCvVkdCVv5Hphs67VlJBrqyP0GAU2MFRVf+QNdpkins
         phq2Fa4+/2/qC7Cp+Ll3nhSFqi/jcMsvCukzFMCPUMSdHav5F6YqQdwcN6iKhv5iT4/g
         1bxenTe54TkDMghvgwSGFv67IBeLMjH+DbLKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705440353; x=1706045153;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZK/WNDJHlaehla4dojuUFvU9fAziRAlW3rB0VRFYSD8=;
        b=MIQNEC48XceM51gNe3IF5Y/bJVypufGhjC0lDmn+LtzA7hy6LG8/mAjU1TbumOxi1z
         yMfUIH6HVS3Na1KuCVRLM8I+3W4g1GTAAw7BdgHwLrNxoVSUIZb7Ts6+R2xPfYKa11lL
         BzGTt3zx9CKLIINI5j++MhqL56ZpekMDnkfBk4Dbp3HUjJPAuAcvz/Ra4zy240N/kjr3
         vOhipO3oPNpObROWEAmAGbyhf1VQnoMei9WH4ScFdLm3VYeqaI3ALD08ZC9C+EhahlNu
         1zbF7760NTUfeA7KmntF60UjEwvFDoJbaYdVdBAKY/xbojY7yjaJB+Atqarex7RUiMKb
         NWdg==
X-Gm-Message-State: AOJu0YwG9Hz4reZCrgf/c4BA1wm8dGQi+hdyz1j8q5qLe9EbutG9Bok+
	1qWe3IJTlKi3WykJLEmLajIZgRxm01vXyA==
X-Google-Smtp-Source: AGHT+IFJn7mZWJ2ekB7mUjM98s3sTg00JjpUz/PbuptR/izXiQi5JSc9LtFjY9+fVpSlk7gVm4fOuQ==
X-Received: by 2002:a5d:518f:0:b0:337:bee6:9031 with SMTP id k15-20020a5d518f000000b00337bee69031mr523619wrv.18.1705440353537;
        Tue, 16 Jan 2024 13:25:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:717c:d951:6325:d768? ([2001:8b0:aba:5f3c:717c:d951:6325:d768])
        by smtp.gmail.com with ESMTPSA id w12-20020adfee4c000000b003373fe3d345sm72317wro.65.2024.01.16.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 13:25:53 -0800 (PST)
Message-ID: <36a4f6c58a7d96873ddc772f4b2c0e302ec1ff62.camel@linuxfoundation.org>
Subject: Re: [OE-core] how badly do symlinks from within ${S} to outside
 ${S} mess up sstate?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2024 21:25:52 +0000
In-Reply-To: <57164b82-ca31-8438-f2f0-f6dcaece8b9f@crashcourse.ca>
References: <57164b82-ca31-8438-f2f0-f6dcaece8b9f@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 21:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193875

On Tue, 2024-01-16 at 09:23 -0500, Robert P. J. Day wrote:
>   a very weird question, to be sure, but i literally just ran across a
> recipe that does the following (i will paraphrase some stuff to
> protect the innocent).
>=20
>   the recipe processes a bunch of XML source files, and generates from
> them JSON files, so any change in any of the XML source files should
> (obviously) trigger a rebuild of the recipe. and here's the problem.
>=20
>   the XML files are not copied into the recipe source directory, and
> are not even referenced by SRC_URI. rather, the files live in a
> well-known location on the build host (placed there by a monstrous
> "repo sync"), and to save time and space, the recipe just *symlinks*
> from inside ${S} to the XML source files outside of ${S}, then
> proceeds to process them to generate the subsequent JSON files.
>=20
>   the complaint is that, when the build pipeline started taking
> advantage of sstate-cache, even after some of the XML files were
> changed, the recipe would not rebuild.
>=20
>   once i understood what was happening, my immediate reaction was
> along the lines, "well, since what is under ${S} is simply symlinks to
> files *outside* of ${S} and (worse) those symlink names will never
> change (all that will change is the XML files at the other end), how
> is bitbake supposed to have any idea that those XML files have
> changed to kick off a rebuild?"
>=20
>   so my initial response was, "this does not surprise me at all," but
> does my reasoning hold up? obviously, this should probably use a
> combination of bin_package and externalsrc, but as it is now, is it
> moderately accurate to suggest that it is those symlinks that are
> preventing bitbake from understanding that anything has changed, so
> that it continues to use the old sstate-cache?

Inputs to a recipe need to come through SRC_URI. That way bitbake can
know when they change. If you point at some random place via a symlink
how is bitbake supposed to know if/when they change?

Yes, pointing at a large tree of files will take time to hash and yes,
that can make parsing slow. Either you care when it changes or you
don't.

The inputs are used to generate a hash which makes up the hash
representing the task. When the hash changes, we know that sstate is
invalid and we need to rebuild.

Cheers,

Richard




