Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F6E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:29:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.38197.1733495345002346231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 06:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fg4VSSmy;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6efc58fae20so21059847b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733495344; x=1734100144; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKifmLPhWpdKqJpxUqYRs5bbx9wWk7L/gvx0XvEvsu4=;
        b=fg4VSSmy0l4uZBSogBPqiSkwjbjKAW0mxLEp6ci++AeVwkrmWBsl6KhcxzcijDcQc2
         Awi0aCeVCCjJwy3EQASEPvnN2CZbyhabWwncR9sOL5sn6kRSFg5DfzIebGrfjueoHK61
         uFePD5m1hukfBCsdeewl3KpGvFM8bh/ms+ZFDxLAAwsrhlKM5cRUV6hiZ3ze798fc7A4
         rUoPDtfK/Nu0DTQukZCFFXWhBqBHhh9MhDQ+oTZIq3OWR+eWyuOsb25tbWU1ExjP3LFj
         ryBOTKSlHj97GtAUXyZdEzQuvp+o/DfQbjd19jQiB1CasfDUcsDTwsN7Doyd9K9b7TpT
         3sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733495344; x=1734100144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKifmLPhWpdKqJpxUqYRs5bbx9wWk7L/gvx0XvEvsu4=;
        b=Qt/jYPEic/02eCbJPm5IygNgVi62PktcdN5DEGk8Sr5z8ctG25Vk1XLYL3F1z3Y5PH
         xXj4YboCOe9SFfkn6CHioLg8pJUqzUbwLf0zLDIVLiGVC3mERe5hzn7lpGxTiMHjvazC
         eNyPsXZ06fE+k4oIGnFAsH5X6K/5xeaqV9bBkEYnQR76zCBqfh5Egr7atClqpFowGBTh
         M0JMxsEBzeRZ1YluWNb9l4W3rFzTIztxFWR0IipRnF4rGHWelcRDxu9ViW5uHUsRxAFr
         0GjtIpuYm7B4SKkhTwCo306NBHfSvLxVUia+yAfy81OQ8sgcnMBmPCOiKvk2HtKc+6NK
         OKwg==
X-Forwarded-Encrypted: i=1; AJvYcCU49Fox7CRwG7s42EewhyMWlfCOi4jaLuFxpKnzLRrIgxDcDCZ9Y3fjtaJ3Q18yK3m8tOp/mdTzkuWBfPnBaEDDjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjRRWz+LsKLEL7/nDguoL5gI2NtQ2n+VDdWWJGVwpKNOJu0VDX
	jHX95O4EBXkjHoOFEo9zJE+NCjTLxT0ncN8+WAINwxyPTROjzwaVM0GoQpVCkj8uq2JI8ooJ4gY
	Q7rULSRAb0lePcdruPsRoICAqISyOl8kzDjisig==
X-Gm-Gg: ASbGncswsurmirDxPLG+pVKLetamQUb4ghUaZ1S4PxJBKGxyfo4dmRbH4V2KHAI95Le
	+o6XZ3mzBRXBo/Q+SBQGhTWK+LPmjOlk=
X-Google-Smtp-Source: AGHT+IG8GnQyaxsg/TFS1HWWF3cSTXi+dfxn0cZvKqv8HhSTtyS+DHKaHBKMAJg3Phi+ULAHRYcqAy5Nx/OUmsEWv1E=
X-Received: by 2002:a05:690c:4902:b0:6e3:2e50:8c0c with SMTP id
 00721157ae682-6efe3c8afaemr39335017b3.41.1733495344164; Fri, 06 Dec 2024
 06:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20241203101426.2227535-1-yogita.urade@windriver.com>
 <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com> <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
 <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
In-Reply-To: <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 6 Dec 2024 06:28:53 -0800
Message-ID: <CAOSpxdbZX5p929avFhO3LUdAsQmi3N0fWjhbDHipkM8sCufwgw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 -> 3.3.5"
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>, "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 14:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208428

On Wed, Dec 4, 2024 at 1:23=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-12-04 3:49 p.m., Steve Sakoman wrote:
>
> Sigh, I'm sorry I didn't catch this :-(
>
> I think my eyes saw ruby "upgrade 3.3.2 -> 3.3.5", I checked the link
> in the commit message to verify that the changes were all bug/security
> fixes and I merged it.
>
> We've already done a release with this update in it.  Perhaps we can
> discuss it in the bug meeting tomorrow?
>
> Steve
>
> Yogita,
>
> Please note, that only PATCH level updates are allowed (almost all the ti=
me) on stable releases.
> See: https://semver.org/
>
>
> All,
>
> Yikes!
>
> Yes, we should discuss what to do in the bug meeting tomorrow and reply h=
ere to fill people in on the plans. If anyone has a strong opinion please l=
et us know.

We discussed this at the bug meeting yesterday.  The decision was made
to keep the version bump, even though it is outside the stable version
policy.

Since there has already been a release with this version bump, with no
issues reported, it was deemed less disruptive to keep it rather than
revert to the previous version.

Steve

> I didn't even notice that the change was from 3.2.x to 3.3.y when reviewi=
ng it.
> It seems that I assumed that no one would do that!
> We're all so used to the rule of not changing MAJOR.MINOR that several pe=
ople overlooked
> that MINOR was bumped by one.
>
> For the 3.2.2..3.2.5 update, we have:
> =E2=9D=AF git log v3_2_2..v3_2_5 --oneline  | wc -l
> 242
>
>
> We could even take 3.2.6:
>
> =E2=9D=AF git log v3_2_5..v3_2_6 --oneline | rg -v "merge revision"  | wc=
 -l
> 20
>
> https://github.com/ruby/ruby/commits/ruby_3_2/
>
> It might be worth having a version comparison check tool to run before re=
lease.
>
> Thanks,
>
> ../Randy
>
> On Wed, Dec 4, 2024 at 11:51=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Add Robert and Hongxu who working with Yogita on this, iirc.
>
> On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.
>
> This isn't a minor version upgrade.
> $git log v3_2_2..v3_3_5 --oneline  | wc -l
> 6924
>
> Do we have any ruby experts to comment on the stability of the 4.2 branch
> and the update to 3.2.5?
>
> They claim to be following a semantic versioning scheme:
>   https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-change=
s-with-2-1-0/
>
>
> Ruby is a fairly large code base:
> -------------------------------------------------------------------------=
-------
>  Language             Files        Lines        Blank      Comment       =
  Code
> -------------------------------------------------------------------------=
-------
>  Ruby                  7914      1480730       202190        82299      1=
196241
> ...
> -------------------------------------------------------------------------=
-------
>  Total                 9409      2188531       271762       197233      1=
719536
> -------------------------------------------------------------------------=
-------
>
> The git repo does have a branch for each release which would indicate
> that they are at least familiar with the idea of stable releases.
>
> Other than the number of commits being large, do we have
> any data to support the idea that this is not a stable release update?
>
> Yogita,
>   What are the before, after and diff ptest results?
>
> ../Randy
>
>
>
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
>  ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
>  ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
>  ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
>  ...eproducible-change-fixing-784225-too.patch | 26 ++---
>  .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
>  .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
>  .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
>  .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
>  .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
>  .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
>  .../ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}     | 13 ++-
>  12 files changed, 446 insertions(+), 25 deletions(-)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_=
Alignof-to-define-ALIGN_OF-when-poss.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefil=
e.in-do-not-write-host-cross-cc-item.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for=
-the-link-of-libruby.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefil=
e.in-filter-out-f-prefix-map.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patc=
h
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patc=
h
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_ma=
cros.patch
>  rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb} (88=
%)
>
> >< snip >< snip ><
>
>
> --
> # Randy MacLeod
> # Wind River Linux

