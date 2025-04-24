Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70488C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4211.1745526892856613381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/71cSCD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1129591f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745526891; x=1746131691; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gKr0Y13EwlPhS+MtQxuDLnMNIn4RNbW078uBoFYpQnE=;
        b=R/71cSCDZjsRpb3F3HkyKc/Kp4iOekMT3vQ+oDsZ/vkU1KdDrjuICHx5tcsycRMtEb
         yatihTjqtO/9yAAWONOopOLkBseUMWx85TJidv3YkZ+MykDKmiZtWPJEteO+DbEahUBT
         vvrCRjhTr9zYac0+V+kG9w0sgw3EvK2w0SPd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526891; x=1746131691;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKr0Y13EwlPhS+MtQxuDLnMNIn4RNbW078uBoFYpQnE=;
        b=sHRJsJga5lUDa8m2NUKrYJLzJpyBrkvuwOJcVg0QzgMsMcGvTTxOe4n07C33AncpPY
         Lhj8hJUKao5JH5qqkcqsFePAeYO/9OINIOVr0a3Ok0PiQRpuaComL+xoH8a5g2BWhrr3
         iCbDkSQIe6TZkfhK358+kqs0gK2WCdeslbO/jkhE0uToQht/LbnadGp+fCJf8+dx+TU4
         bzQSSh0hZNi+Rqhi5+JH/TTj1xlU+9Uss9h54y3s/BSloRPmwT4h2LXadrZaxrJ2xUOp
         sEx/G5ocsHrMLmWzo9Rw9FigBVHp8Xo7O+fB06tyUaXMuyZwLp/NAI1zRnlxahB8KUje
         NptA==
X-Gm-Message-State: AOJu0YztEbVp0WWCgnMC2z89a4czQCuselbEczzz9DQggClwh4v/f3Dk
	uIkfJ4RTijs+EqzPh1ebzJTy/VRzPW4/00Uc6YKbgExWpgnE+/E9XYYFBCpl44U=
X-Gm-Gg: ASbGncvE/JNxFBzTBdA3ETmj4VRiRBlxSfg6z5XQfVvBHHw36KWHEp/RbS/GtT0LfEV
	+sWCiEymNvgt13pOGnz1pI3RwIfGT5pXgZSjWmRlQyDncXp02rMmBNKjNyvimhKHrFBLhrye334
	w8HYYBsY//qcAGNXEuF7xSPj+m9i0SJ+DvcuOCukQG2vHHis51pX1klshwlnMafVuw+PzifoBhV
	f05HV1zwvv7/Dq2X44PL9aovYaLEJ2hNb+GWyDf9WaPseLCEOIW19EZbyK/gW67e43Vn6BxLd7L
	8Hg2i+c/a+nVIf2/S+5JWK7hMW/kghYUaBTYSY/ToqqEUQA/anFzZl/KMXmutnN6xBI6enkDLXa
	QYfNqYbxfft8xHLyrCAUOp0BjDab3iw==
X-Google-Smtp-Source: AGHT+IHSlj50q1N2nUUYqKC8wHNqE4yXtmf7znnq9gxZYxsCckiTuorQ0VdR2YyRIKvItRhQJmOetg==
X-Received: by 2002:a05:6000:420b:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a06cfb22c3mr3045919f8f.54.1745526891169;
        Thu, 24 Apr 2025 13:34:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:984f:acd1:b4e4:7d43? ([2001:8b0:aba:5f3c:984f:acd1:b4e4:7d43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca435dsm312976f8f.21.2025.04.24.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:34:50 -0700 (PDT)
Message-ID: <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 24 Apr 2025 21:34:49 +0100
In-Reply-To: <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
	 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
	 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
	 <18394019E7982924.8448@lists.openembedded.org>
	 <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
	 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
	 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
	 <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215403

On Thu, 2025-04-24 at 21:36 +0200, Alexander Kanavin wrote:
> On Thu, 24 Apr 2025 at 15:50, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Stepping back further, we had this mess in devtool in the first
> > place
> > as it could never work out which files in WORKDIR were "sources"
> > which
> > it needed to handle carefully.
> >=20
> > We now define UNPACKDIR as the place we unpack files to. devtool in
> > theory can therefore just redefine UNPACKDIR and WORKDIR and things
> > should 'just work'. The relation of the subpaths between the two
> > should
> > remain the same.
>=20
> I still struggle to understand this argument. As far as I see, to
> determine where is the 'source tree', devtool cannot avoid looking at
> both WORKDIR and S (and now, UNPACKDIR too) and then calculate
> something reasonable out of both (and with UNPACKDIR in the mix, all
> three).
>=20
> Let me describe this step by step what happens without the patch.
>=20
> 1. devtool manages a 'workspace': a special layer under
> build/workspace/. Part of the workspace is sources/: a place where
> source trees are placed. When a recipe is taken into workspace, its
> source tree is placed under build/workspace/sources/${PN}/.
>=20
> 2. How does devtool determine where to take the source tree from? It
> sets WORKDIR to a temporary location under the real oe-core workdir,
> and then performs an unpack operation.

Why can't it set UNPACKDIR to the the workspace path and then just run
it to directly unpack to where it wants it?

It can then redefine UNPACKDIR to point at the workspace path and
things should "just work"?

>  Then it, somehow, needs to find
> the source tree under that temporary WORKDIR. It cannot simply use S:
> this can be set to a nested sub-directory deep inside the actual
> source tree. It cannot use WORKDIR either: this is not the source
> tree in almost all cases (and is now forbidden anyway).

It can however use UNPACKDIR?
>=20
> 3. Let's say WORKDIR is set to /some/path/to/workdir, and S is then
> /some/path/to/workdir/git/some/subpath/. (via S =3D
> "${WORKDIR}/git/some/subpath")
>=20
> devtool does this:
>=20
> a) use os.path.relpath on WORKDIR and S to obtain git/some/subpath
> part
> b) then it splits that part into individual directories and take the
> first one: 'git'
> c) then it's appended to WORKDIR: /some/path/to/workdir/git
> d) then devtool uses shutil.move to move/rename that into workspace,
> so /some/path/to/workdir/git becomes build/workspace/sources/${PN}
>=20
> All fine, so far. What happens if the recipe sets S =3D
> "${UNPACKDIR}/git/some/subpath? The same calculation as in point
> three
> will yield UNPACKDIR (incorrect), instead of UNPACKDIR/git (correct).
> And this is what the patch is aiming to address: it changes the code
> to first check if S is under UNPACKDIR, and if so, performs the
> calculation in point three relative to UNPACKDIR. Otherwise, it's
> performed relative to WORKDIR, as before.
>=20
> The argument I can't understand is that devtool can somehow avoid
> looking at S altogether, and achieve the right thing by just
> redefining UNPACKDIR and WORKDIR and removing the logic described
> above, but how? How would we end up with the correct source tree in
> the workspace then?

A recipe doesn't have a single source tree but a set of sources, which
is the contents of UNPACKDIR. do_unpack has some horrible magic moving
which moves the sources into the expected place for the magic value of
S (see the SOURCE_BASEDIR mess) and this is perhaps confusing things.

In my mind, I'm thinking we ultimately stop that move and put a symlink
in place instead for compatibility. There were some issues with
autotools and symlinks when I last tried iirc but I'm digressing...

From memory, one of the devtool issues was that it couldn't track and
customise some of the input sources such as standalone files. The
UNPACKDIR changes were intended to give us a path forward so we could
actually handle the full set of sources rather than just the "S"
contents.

So I still believe there is some kind of simplification/improvement we
probably can make here...

Cheers,

Richard







