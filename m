Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB8ECD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 08:35:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10413.1777883729890957592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 01:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Od6Mm4QX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so43258905e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777883728; x=1778488528; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=paOx0KccDmYPKf5Xqei50KmdPsIDSsARYgChwj/mkWc=;
        b=Od6Mm4QXItY4IqQiyBrKsEenx8gSqU3UGg1QWPZQZCWz/6d+ShT42F5nVEpFMcXJYK
         djlRH8s4gs1Y6l1cUbfO1Ag2372hDLf7lv8ALcvOuBRuoDQcdqOnLfhx767y3KQmtXwQ
         yMQjwA5qUWDcxT48aHwRxy22E9o0h6ab0Wceg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777883728; x=1778488528;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paOx0KccDmYPKf5Xqei50KmdPsIDSsARYgChwj/mkWc=;
        b=mWgFDCCbB4dp84AGWg5FFTyyQcry6ZrT10Zp1Nw/4uLXb1AT08T7tPJyAkHdLivXxP
         nJXp0RTWfksFkpnW5do2D5JArx6N1Bm+66jT4T2yA1Mkm2if5AzMvYQ4C5m9fA6mnhiq
         nSiejr5gLwaa7iBK/b66WXnxnPP/nfnfrkiVHBXvKc+vnkjn/vYQdxqhSDPXOTb4eT19
         tgSQeB+Mb4eVF1APhr9Fz5dPBGOU4xm1KP0zt194/OYsUrQleZvvb8yHVn0m7C9KsVHB
         sbYbb0nzclSATQcnGcbKtgeadU1nBF39jdMuCw8EQ2kbLjDKqOrr7WD5SPXmvqQHoSu/
         svew==
X-Gm-Message-State: AOJu0YwI2PKPpzTmwP7rXOeTnOqEkO/eD62mHMpOOdvo65bCcMfUve/b
	+WaGgRUXMgop+h7GXn2xMzqcPU4Pg8r9SlAzAiDAmZxPOwq1Q4ytUaA1dZHMRoBvvtUXfvjjrbl
	KfTzBh41/GF56UTIor5bkfMcKvTkucsffXgCuQM+BepFkonMoLPHXD9CQvDSuTQAZldoDBVopho
	E=
X-Gm-Gg: AeBDieuHcPoE4Hf54fzwujmKGwRNXyF/VHmk2nvCp22TwB6Dtukag1w1TxDhGyYDlPk
	G3wVqZWJQPMBk6JUihY3U8a9qcFbH0MLVkureMmnOb12SCTQeq3dOb1+80qNbmeFY77wWM+YtJ3
	MyrihlAp62ICuJj9Ioha4IFo+91uAI6JJMsi+MuYmeEnk9lJYWyVAXpFJsCBX5MYph8rSf/eq/d
	ehDQBBzrNXEJkUMXYV+uZjaXi3EG53qADHzaMXPTR4sR7bgGof8Re37sntmmXWMKOCLR/R23AGL
	4XulykmejEaUx0k2vpTNjYMoNh6uWUhZ2n9/2cPBtuJxlJgpnyJX8UHEzRRru+2BM/NF7Kw9OBi
	C/rTBvdCROg7J6i+3C5i0+fsXHjDj8H5vO9sUBDjaKgfUxcCtA85YjWeeVieQwO2H83UQVyl5uV
	t2Qo+aNWCd4MOb+z5i0Bhriy6N2S1nbs1F8fWL2JdeiVroMRHHRg8++NTC/1E7fNdT/nlqM62+8
	QznEt8Dr7HnBIpfyZ/rmZIKPfuJ7gHLcTS4wQ==
X-Received: by 2002:a05:600c:859a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48a9865e671mr101529015e9.15.1777883727123;
        Mon, 04 May 2026 01:35:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3e:601d:3692:f075? ([2001:8b0:aba:5f3c:fc3e:601d:3692:f075])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fed8ea0sm120617475e9.5.2026.05.04.01.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:35:26 -0700 (PDT)
Message-ID: <0a68ea544451d546991ca5b532204af6fe3b6e69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] license.bbclass: only create hardlinks
 within $TMPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, chbs@prevas.dk, emkan@prevas.dk
Date: Mon, 04 May 2026 09:35:24 +0100
In-Reply-To: <87cxzbshkn.fsf@prevas.dk>
References: <20260501183615.2728124-1-ravi@prevas.dk>
		<2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
	 <87cxzbshkn.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 08:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236438

On Mon, 2026-05-04 at 10:30 +0200, Rasmus Villemoes wrote:
> On Sat, May 02 2026, Richard Purdie <richard.purdie@linuxfoundation.org> =
wrote:
>=20
> > On Fri, 2026-05-01 at 20:36 +0200, Rasmus Villemoes via lists.openembed=
ded.org wrote:
> > From: Rasmus Villemoes <ravi@prevas.dk>
> >=20
> > This is _not_ meant to be applied, but merely acts as a place to start
> > a discussion.
> >=20
> > > In our CI setup (which is gitlab-based, but I'm not sure that's too
> > > relevant), we sometimes see spurious errors like
> > >=20
> > > =C2=A0 touch: setting times of '[...]/rootfs/usr/share/common-
> > > licenses/go2rtc/COPYING.MIT': Operation not permitted
> > >=20
> > >=20
> > > I do understand that using hard links is quite valuable for saving
> > > time and space (I see GPL-2.0-only having 135 links, so that alone is
> > > a few MB), which is why I don't think this should be applied as-is.
> > >=20
> > > Could we do something like create a $TMPDIR/license-pool/, and
> > > whenever encountering a src not inside TMPDIR, copy that file to
> > > $TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
> > > already exist], and then use the latter as src in the subsequent "can
> > > we hardlink" logic? That would then also improve the case where the
> > > meta-layers are (bind)mounted R/O, and we thus always end up copying.
> >=20
> > I agree it does look like there is a potential issue here.
> >=20
> > I'm not sure we have ever claimed isolation between the build metadata
> > and the builds, I know that for example patch files are linked in, so
> > that when you update patches, it updates the metadata more easily. I
> > can see why you might want that, equally, the ability to update patches
> > that way is a nice usability feature.
> >=20
> > Did you track down where the utime of the files was being changed? From
> > the link, it looks like:
> >=20
> > =C2=A0=C2=A0=C2=A0 find=C2=A0 ${IMAGE_ROOTFS} -print0 | xargs -0 touch =
-h=C2=A0 --date=3D@$REPRODUCIBLE_TIMESTAMP_ROOTFS
> >=20
> > in reproducible_final_image_task in image.bbclass
>=20
> Yes, it it precisely that command/function where it triggers.
>=20
> > I think that function could be changed to clamp to anything newer than
> > REPRODUCIBLE_TIMESTAMP_ROOTFS rather than changing all files, and that
> > might actually avoid the issue.
>=20
> I don't see how. First, how would that then serve the purpose of
> producing something reproducible? It seems that the timestamps would or
> could then depend on when the meta-data repo was cloned. Second, if the
> mtime is still going to be changed sometimes under some conditions, the
> problem is not really gone. And third, I think it would make the
> implementation much more complicated, if one would need to make a
> decision for each file for whether to touch it or not (i.e. the simple
> find|xargs would no longer suffice).

Pretty much all the rest of the system works like this for
reproducibility. Whether you make everything
REPRODUCIBLE_TIMESTAMP_ROOTFS or just clamp to a max value of
REPRODUCIBLE_TIMESTAMP_ROOTFS doesn't really matter since you're using
that value regardless.

Basically anything touched as part of the build process (newer than the
timestamp) would be reset, everything else (older than that) should be
deterministic.

The value of the actual timestamp used is a different discussion but
we're not changing that.

Having thought about this a bit, I do think that is the right solution,
and it does match how we handle timestamps elsewhere like the packages.

Cheers,

Richard

