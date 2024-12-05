Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53196E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:16:22 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.6280.1733390177802808375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFjwEyAZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46684744173so10933751cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733390177; x=1733994977; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA4nFygZZ/gvWRImZdm06PXc4aTftHFPczV2L94BzOs=;
        b=kFjwEyAZ7AKLivTyUtnOL6dmfecCkzJGv+4zAbAXXWbSEpEp4mWA/+vXKRx7VDAMT3
         sVq3czuIYRqz79kT2p1m/7c6zgm4/abjBUjb7AZvHkZymi/g/q6Ud2mG+9dGrXBhnfmj
         s6xFFsMU1pEwpDgeBg9nke2W3lehsqnG82Ca8VULb7MdzRhjLDEeo+rL29i2zDLlyBfS
         wEK+W9aBAu60p3+GbK7AKZ5by3fLW1PaHC25wUyhLhl4i+7zrI4KvpRC6EEwMsg8tq3S
         jOWzMaoLbXbct7sJfjBWdugm7NE04X2iFheUjna8FdJH69JmZo1zPpt0fpfjfviyz8yh
         V8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733390177; x=1733994977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA4nFygZZ/gvWRImZdm06PXc4aTftHFPczV2L94BzOs=;
        b=nYOdPvJDhcjDblzcjlT0RyYE064BGkxW7YjLeiCoUBHohvcRyJWZv/3urXGTYepx4t
         K0W8Limm1UnSoe9eCf5hDDbk+E9uJ3iAFpLuIG2d5UqhgwbNOZwFTjxxdW0HiUT0fT2R
         K6hgrWcwztNFEsELryxSMWcKSUqEFoYTgHhmo24RSSfufsSUeW2mdIZ1gesbB1RR/Guf
         WMw2giryGBkJ4eLJRO8P8NGaR9lq4rV0H58o9e50Q+N6qES6y/TkJ1BPgqxw9KDEoJsx
         QBhu7e28SmjDOzIxjQ+C0YJagelRXUjVYz0ymcvVxJqlmHkvlYaUjzO+ALiOOCMohRIX
         +ocg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6XvNMmfJrKGiMA9gNHwz7mCGbNRJ64vE1iaOzzC4LdY8HqF6+ZgGlgSZbtSZR+Ui4xOB+XwYkAmHLN9Mib0O4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwirZO/897yEGEIpEw1K14aGe9F1ieJaz9n1h3d8vzPFXFN4WVY
	IBfwR9Ne5xZdkX0UYpUZtoj0FmMKkf71oriHEQ8BB5mQxwrqcZx0yd4/9bBDiADwTtCP6va9uOR
	b1wUFoJOFwJp5hfHVbeh4EeiOf0E=
X-Gm-Gg: ASbGncsg6g4zkf1yA0Xu3GD2mafayh8BOcbD9lIPlKJV76PAolgWtf4ODLoKEWsVqA6
	casYc4mWZTxaG3oR9CR5XfZybcq6fErQ6fSt8c2RYUiOjIB5s9jJSAiGTzmYt0tm97A==
X-Google-Smtp-Source: AGHT+IHwnHGrLMfdV6o2NP36lwKuGkBrxndAyj8gSdhyxm9ZQ7BsoFEh+ZokaOT8NSfueaiR7F5uwE2mZ1YQUf8f2XU=
X-Received: by 2002:a05:6214:c25:b0:6d8:9ef6:5b10 with SMTP id
 6a1803df08f44-6d8b73476e2mr150349826d6.23.1733390176750; Thu, 05 Dec 2024
 01:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20241203101426.2227535-1-yogita.urade@windriver.com>
 <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com> <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
 <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
In-Reply-To: <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 10:16:05 +0100
Message-ID: <CANNYZj-uEZOjVtepHHWombR3Ahxr1HkBq8RFiU0=v0a8xAG=GQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 -> 3.3.5"
To: randy.macleod@windriver.com
Cc: Steve Sakoman <steve@sakoman.com>, Yogita.Urade@windriver.com, 
	openembedded-core@lists.openembedded.org, 
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>, "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208365

The use of ruby is marginal to non-existent in embedded space.

In core it's only used in its native variant to build webkitgtk (they
have some ruby scripts that run during build), and in meta-oe, there's
openwsman that needs target ruby, and a couple other recipes that need
native ruby. I think no one's going to notice if this is reverted. No
one's going to notice the major version update being kept in
scarthgap, either.

Was this update prompted by some CVE needing to be fixed, and nothing else?

Alex

On Wed, 4 Dec 2024 at 22:23, Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
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
>
>
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
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208361): https://lists.openembedded.org/g/openembedde=
d-core/message/208361
> Mute This Topic: https://lists.openembedded.org/mt/109897713/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

