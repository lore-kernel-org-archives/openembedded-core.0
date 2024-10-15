Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CC5D20686
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 23:01:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.10602.1729033296173409759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 16:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RFQg9RgP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso35882405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 16:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729033294; x=1729638094; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U6OhTLGV5NZ7+YMDwmnpzCmgKe7kkOwwxoJ08Cbw0wk=;
        b=RFQg9RgPlPQFyToGyfIP5ROa48JCJ0grgsg2BtOQwuCa5PTSEcPOQLmqdl1Gsd+9dA
         3d8hyJ5M/7kcVqOSIPf5H2cA3Fy1K6IcrcEJ8GKcKyiceby60VBVlmG2ArJxsaRxTUyU
         tuvc+0DlqrFZ70ai7cvC4pSAz4siAGdlVm9a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033294; x=1729638094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6OhTLGV5NZ7+YMDwmnpzCmgKe7kkOwwxoJ08Cbw0wk=;
        b=jZTpgTv8v5bqg4S5GFXRmcwmYf4rtyX/2uMahj9I1ZijfnTpLu98eSIDgKL35peYPQ
         TLaxvlGMpxuY/hU4FF10a6UzwCyUB3cuClJNLE8S5FxOBDMGTA+Mhq38pOu0/LDslL4A
         EhgxGUQ60DmIIpY4JRQvNYY0pJsaRUtsa0DweSuBwfGlz5lSWFnDYu75DdXY2O89J8im
         u9tVqCMQssyawfFf/o37vUSoFjUFNPAzl/zapXJ+W75tSMWmRQhFxXbm/fI7EIz2gX79
         R1/c7pAY3V+docPlTDMwlOlXCk2CDLb2E3B+xDFH95xidWHL/4OONjDb562N4f4QJbYB
         /joA==
X-Forwarded-Encrypted: i=1; AJvYcCWI8rL322J+NcNvWx0hOLCdlL/aTCJOiV6iQpPx4gUE3Fm1n4e6WtcvtRsKKfTBlFLUkvOB1Cn3lH1FIhjgKGyHHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypE3RvXoR7ZfQGb/piX9EDYVe/iHU1piY0a/v8fwfmaPViCbbE
	08NlmXW7GgHoga6NGIhklA2NIRYqDe65j/srARcTd2ld1VFm3f44PebSeXLNMRI=
X-Google-Smtp-Source: AGHT+IHNXjkWz8rRWc6HDuG/dl1vGFv/WV0EpcuuGBBZWcg0qzqUcJ9jQeIGO84wOSj95/VaHopaGg==
X-Received: by 2002:a05:600c:3b8a:b0:426:6edf:6597 with SMTP id 5b1f17b1804b1-431255e485dmr117925015e9.19.1729033294406;
        Tue, 15 Oct 2024 16:01:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4b:46df:459f:fe11? ([2001:8b0:aba:5f3c:ca4b:46df:459f:fe11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc411fbsm2706503f8f.107.2024.10.15.16.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 16:01:32 -0700 (PDT)
Message-ID: <9808c28456640bcde237ca621d55f0b55210f9b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Max" <yumx@amazon.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Sobon, Przemyslaw" <psobon@amazon.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2024 00:01:30 +0100
In-Reply-To: <F3CE27E5-346C-4673-A31B-3D2C85379F88@amazon.com>
References: <F3CE27E5-346C-4673-A31B-3D2C85379F88@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 23:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205953

On Tue, 2024-10-15 at 22:43 +0000, Yu, Max wrote:
> > > > So that's the tricky thing for us. We will have to run the
> > > > script at
> > > > a time window where no builds are happening. Because when I
> > > > tried
> > > > deleting corrupted objects from the s3 sstate cache manually,
> > > > the
> > > > corrupted sstate object ended up being reuploaded by ongoing
> > > > builds... And this is pretty difficult to execute reliably,
> > > > since we
> > > > have so many builds.
> > >=20
> > > I'm a little bit puzzled here. How would something upload the
> > > corrupt
> > > artefact back into the system?
> >=20
> > I am also puzzled by this. I was going to suggest that perhaps
> > there's
> > a rare bug in zstd compressor that deterministically (and
> > reproducibly) creates a corrupt archive on a certain input, because
> > ongoing builds can't simply 'reupload' something corrupted that has
> > been deleted from sstate. But maybe there's some extra proprietary
> > layer of 'overwriting' and 'synchronization' where all this trouble
> > is
> > coming from.
>=20
> Just dug into some of the details more, maybe this is related to how
> we implemented the s3 mirror. For context, our Yocto builds work like
> this for a recipe:
> 1. download the sstate siginfo+object from s3, into our local sstate
> cache. (I think this is unmodified yocto logic for mirrors just using
> SSTATE_MIRRORDIR)
> 2. build
> 3. upload the local siginfo+object back to s3. (This only happens if
> s3's object is different)

Perhaps you could change the 3rd step to look at timestamps and only
upload modified files by local timestamp? If you then delete something
from the cache, that should stop it coming back?

> The reupload happens when we delete the s3 object between steps 1 and
> 3, where step 3 will just reupload their local sstate cache objects
> (corrupted in this case). Especially with how yocto parallelizes
> tasks, this time window between 1 and 2 is quite large. And with the
> number of builds that happen, we then have no reliable way of
> cleaning out s3 sstate objects. Note that, even if we changed step 3
> to only upload if the object doesn't exist, we would still have this
> problem.

How about only if the local objects have been modified?

>=20
> Reflecting on our s3 mirror setup, maybe we're doing things in a non-
> standard way, especially regarding step 3.
>=20
> How do folks normally update sstate mirrors? Do people usually only
> have a single/small number of writers? (For our use case, we want to
> keep the remote sstate mirror very up to date.)

We tend not to recommend updating sstate. In theory once things are
written there, they shouldn't need to change again. Writing isn't a
problem at all as long as things are not overwritten and appear
atomically.

> > No, overwriting files is a recipe for disaster. See above, you get
> > partially complete files which come out as corrupted.
>=20
> I understand your concerns with overwriting. What I was suggesting
> with "overwriting" was more creating a new file and `mv`ing it, which
> should be atomic.

Creating a file with a mv is fine. Overwriting with a mv is not atomic,
at least on NFS.

Consider that a build is downloading a large sstate object, say webkit
or something which is say 100+MB large. If you do a mv operation on the
file over NFS on another node to replace that file, the NFS server does
not cache all 100MB of the old file. At some point the transfer will
corrupt as the content changes.

For small files, it isn't as obvious as the files are usually fully in
cache and completes uninterrupted.

>  Same with the s3 operations we use to upload, they will not leave a
> file partially written/overwritten if we trust s3 claims.

If a user is downloading a large object and another replaces it, will
the first user get the full original object?

> > I think this overwriting may be the source of your problems. You
> > should
> > not need to or be doing this. Why do you need to?
> >=20
> > It is easy to blame bit flips and put a hack into the system to
> > force
> > an overwrite but I think you have a more fundamental issue going on
> > which you may want to fix properly.
>=20
> Like I said, it's probably not something like bit flips, but since we
> only see these corruptions after moving to kirkstone, it might be
> related to things like using pzstd or other infra changes. The s3
> uploading/updating logic did not change, and we are even using the
> same boto3 (aws python client) versions. We definitely do also want
> to fix the corruption; it's just been incredibly hard to narrow down
> what is causing it...=20

I'd advise caution from experience. If you fix the wrong thing, you can
set yourself up for other much harder issues down the road. I'm also
reluctant to add things into core classes to work around problems which
aren't in anything we actually maintain or have access to.

Cheers,

Richard






