Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A15EDF174
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:26:04 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74204.1770996362449190925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcSDqtDS;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso1221692e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 07:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770996360; cv=none;
        d=google.com; s=arc-20240605;
        b=KCoWUd+TDO+/zPHkOfc6Oonx0RrEHE2z3LnEeH141zOu08qJSWoKDQ1XlzzATIQhL6
         VBkPiIB//wijyN9t/59YDBGbcRQIlQcdFONFQFe7wmwLDgzKTkbZNSrgNb2CidiVX4c6
         vDym3+edCt1SPc3mZAdG0WRHBAw7ubSz9UqUcbfdSByE21JITD3BuTzGOOYX6FX3GuIY
         Hz4BSoW4luCaOMYQDReLggdu/AZlygYbOF0xgjQODZhrPzvvZcErVC3CsXTlMj0yBBIo
         FqgVd3QKzth6olJK2QkojsfEBVDaxZb3BG5RQ3dMTjm58CpCwlMX/mPb6z8dxXvdV1q3
         VOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uv7+wGjYdZrWiwxPruuCmW0WkztDJFSZ9NcJcq3kOJY=;
        fh=4JuWOqMLFFgcMhrcHnvkwh2LOV5RHiYp1aWPfcWbkAA=;
        b=Jz5nFaJRhVaOIjM4hVnqwXnpSz4kmnzlSpSBmG2GVwR0TrQQVNaJRWQ2lFeOW5E/y1
         98KmnzrJtiuqklMAYEYvYYaHAfffzmgV+0H4PnWVkFPBdXxiKhVG9cSR8j6ZvrF8kZIG
         hOF1wvdIBUKPbTPSQZAmIAbxXHxX9aVceiLnGz8vIMCkvOJPfm8iBr5oVRbwRftKQjhP
         OSIwIfKCKgtaI7XfhJId+wrqhbZVrgScoygO4w1sOoBDjDYHfloxBDwLDVlCsfEyhHrK
         YXuDL1vSmR9Tp4KdgIVzg2Pd7HhxYFYQ90mw17rG58X10HEtxRhiY8iqXbMPtIq2iZg8
         V1Yg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770996360; x=1771601160; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv7+wGjYdZrWiwxPruuCmW0WkztDJFSZ9NcJcq3kOJY=;
        b=EcSDqtDShZJXCbX9vA3f4oNVGzw58KgtfIeEN6+hbI3KfJr0l06CNTvCJ84uiob71p
         mKYHRTarA5vdEShcflGNH3Y8r0hn95R4ye4NHrEqTHEYHu+CcbFdJkFtA1NGc0rTKGui
         QmJOddIoRt+MVHQ/M/lmMfJVx9K/CIG9orXJx17QkzLqIWYPZumiKeivST8/eTVBKs2n
         coLEWzpxIr8gAkDE7Zu+DJAyiPnSWZ9Gq1llO+e7l//vuPXKpbk3FYZbe6FZPvWwXrj3
         WpEXI99ea+jSaPO3JnkmreuaYp1Cp9PklA6+bRL7cxLfJay9ls5j+2ocCTjuJ52RqEgZ
         uNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770996360; x=1771601160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uv7+wGjYdZrWiwxPruuCmW0WkztDJFSZ9NcJcq3kOJY=;
        b=lG3A409Z5QpADSjyv2PFr0AnMRbTEozYZNZmhEWklGhK5DxuWcfTJGVZLEpexXWeZr
         qK5OHaw3X53ylLGTenfqew0SHYvyrUfqeFquFhkSb26JIfHWCRK+8VwjEfY3ODNd3CPg
         2UIDNLyBSi0WIFpoJ8fdXfcStISPYb8bhH9X7d6urZ/wMjE+1HGpDC0+CQSRG3F6chpC
         KRrAr1+lnzys3Fk9sqVtI28b9aBysMNjuvXQ3xf34Cwo3HTcewTbFzVV30zgYRmgs50w
         BG74J+GUR/uTBV7QkygsHaRlUSTu0wZQRPB6rKOIiEWDNcudPglO45fpygXRiLM0OJLg
         j2hg==
X-Forwarded-Encrypted: i=1; AJvYcCXQpeR7bKj8JL438c+Tn8TKV5Y+dfd72dA5+WkyOivWGJjy8Xu/gt6K+RjUDfhhX5vKVQOqjsojkFKD3KDuZYCSPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxZxuHqUpcjRszOPG2dLqHKFdBhpTKGNfPlMaQX3CFkQWhRy4dl
	o9bqjkhrDXMtehHEk8KVdq9jU+NoNya21B7Nyj53Y8TwSmTUjPdTpP0Y8PutmA8Y8GS3eIaMXlb
	4DKT/urtzGvz7D3i75Z8e3ecO1uM5jHs=
X-Gm-Gg: AZuq6aKvnQjaLly52wklew4AF61iNOjILqb9i1Lhbbk7+VOdA7h/jwTBcRnlm6PyBMe
	DjpO2zLuXMcmj2seU4K6Hy1sfTCNcFwWO7BDEJFVxiAyY7STlHrPPnLvMrlzoGAon4ifA790uid
	pvyhHZmNe3Ed4sS1PPhbwQ2hQASrgJJVKvi8oaMvXjXX+eUnNHlBnUK+jOZPO02uZUOFsylbrUo
	ZX0goeW0SQaxc2GyAUqHJOoKby1Ox+tgpmG9FzInh7maY0q+n9hqBW305FiHHa7IbqM9O+kZv7l
	rqYck+OgBA==
X-Received: by 2002:a05:6512:3195:b0:59e:65ff:1f0b with SMTP id
 2adb3069b0e04-59f69c267c8mr839188e87.6.1770996360222; Fri, 13 Feb 2026
 07:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de> <CA+chaQdEyxgZE8Vqj2RbxzWq1Us949dNziW867TfrcnUKfSu2w@mail.gmail.com>
 <a2d20a69-b343-4170-acdb-32ee8f84a615@cherry.de>
In-Reply-To: <a2d20a69-b343-4170-acdb-32ee8f84a615@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Feb 2026 16:25:47 +0100
X-Gm-Features: AaiRm510uMmJ287FqwZ5rGvgJZgil9XjFD7Uc_0gN0VdXU2lJbLKiG3aWNSCaH4
Message-ID: <CA+chaQeAo+CVSOXVkka3BryXY0eJdqPenUJpBcenKmxS5hMUyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa: bump to 26.0.0
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: foss@0leil.net, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231124

On Fri, Feb 13, 2026 at 3:57=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Martin,
>
> On 2/13/26 3:26 PM, Martin Jansa wrote:
> > On Fri, Feb 13, 2026 at 2:23=E2=80=AFPM Quentin Schulz via
> > lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
> >>
> >> This fixes a small oversight of llvm missing for compiling i915 galliu=
m
> >> driver.
> >>
> >> This bumps mesa to 26.0.0, the latest stable release.
> >
> > I am not against this upgrade, but mesa has this strange versioning
> > that 26.0.0 is considered new development release not stable release.
> >
> > As in:
> > https://docs.mesa3d.org/relnotes/26.0.0.html
> > Mesa 26.0.0 is a new development release. People who are concerned
> > with stability and reliability should stick with a previous release or
> > wait for Mesa 26.0.1.
>
> Yes. Ross said[1] to send this as RFC so (I assume) we can review and/or
> make it do rounds on the autobuilder before 26.0.1. Then Alex said[2] he
> doesn't think it carries any meaning anymore considering they now have
> multiple rounds of release candidates. So... /me shrugs
>
> [1] https://libera.catirclogs.org/yocto/2026-02-12#39496615;
>      https://libera.catirclogs.org/yocto/2026-02-12#39496624;
> [2] https://libera.catirclogs.org/yocto/2026-02-12#39498266;
>
> So I followed whatever Alex said, but we can also have this as an RFC as
> preparation for 26.0.1 which would come in a few weeks.
>
> I think my interest is to make 6.0 use 26.0.x such that we don't have to
> go through TSC to bump the mesa version in the next LTS.
>
> I don't care much either way, at least there's something we can review
> and comment on and people don't do the work twice (or more) :)

I agree with all above and I am not against this upgrade.

I'm just pointing that you shouldn't call it "latest stable release"
in the cover letter (which is what triggered me to check the release
notes if mesa changed their versioning). I don't think you need to
re-send, it's not even in the commit messages and nobody will read
cover letter after it's merged :).

Cheers,

