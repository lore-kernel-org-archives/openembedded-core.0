Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127ADC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 17:34:19 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.93433.1749576856705047063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 10:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mPX2Rkat;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e3980757bso644947b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749576856; x=1750181656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X19BYsNNcfpUBFeWWHJHtvdaQsrFHc8XWv+tmDHu+Mc=;
        b=mPX2RkatPYE7N0iZaq2wqh/a8xABAEkkELEDZ5aWarZpDYxq71A9ROyJKpp6iJcYxZ
         LBzUwiiLo3CpWwVOwgEelD13vIgjoWTBRCQOXhqq+gAlOoQUQ0yG8lUD3VRw3dG2dijg
         ClqdZ4o6lC+ONDpX0MRl1zGxlnXXBQqitL8m3LJvtzwk14n1DPI7h399gkhjoFR8DExN
         gAFuNSKe62zaEism/8EgsaOnj1R7zQseEHmGaYnBt07EdSbaKFYAHyDVUFQhpuZNK0i7
         N4y2343mE/42naxFhRf/biGdG43wHJXhk7vUalWexA8wcpaJ77tY0UeAcOYjyM2oiSd5
         gikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576856; x=1750181656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X19BYsNNcfpUBFeWWHJHtvdaQsrFHc8XWv+tmDHu+Mc=;
        b=rpxtlNWyqG5PW8lryBAXZbI+bYk0mtOJbpf1LsDrV0NF7/OcPD+15I6u3xjBpJDRDt
         NPPsobjX+idQE1i8Jt96IWfiWz51uCeh59MraTBnjz6UWI3DO6PbUpO61MpyPwG+toJa
         vXFgR9fOnJm6njIEZjjnT5H66KHkwSVqsYgbOVysJ6v+YrE3j8odivWD0dDS+trRYaDi
         KwXwiJWzHk6HdZyg+qg7IwTVeWyhPgzRcYwfJPy5vlRIQOqHSYB7r8yn+C2F+0WN1Gr3
         YBEiABZiRW50/3T67BFAt1ddkumMe/uxsusyMkBDSDuHgUHpbj7/zNAS/MG3L8WZ/Nlh
         Cjsw==
X-Gm-Message-State: AOJu0YxExbl3/EHGmg0Nw43dmOJPLzo3sHqVKWOQIbYtdNSogR23VM4g
	cFNoKTpsNY1Aa8/NmvAJZMcfnLYEw6I8u59OVLdPoHo3OVVHS360G8Gf+Y6bCshCRM7gCCanobV
	o1iTkCHPvQDo1oAvuqMQGMlji8CjRn7s4BlT3Q7RevQ==
X-Gm-Gg: ASbGncvSgJ1QyY9BI0DESC8Xle9QzPhTwQkOJDiQqjaQoh73QsE6OqbDZ1vfZau5y+o
	txuJxXqztLf53VZKBE0ezTtvndg6dUZaLeI3MAcwAjFXcgFde9eBi6RFxKt9bk0BOJFbevhr6i5
	gx6dUPQxWe1wCnFUuBcpvExSLv8ZE7ZX0IIALjsdo56SPiN1W2A75Xcz8eJVAHJTjzXoe0PfqKO
	eo=
X-Google-Smtp-Source: AGHT+IHvS446xvLPK4L3nBgc/n6UEzlBnh/45t0Qzd2cdLYok3/BiFxq3PIM+UJHwhPd15yJKKm9Afsvelurkz4YHr4=
X-Received: by 2002:a05:690c:9987:b0:70e:3970:aaad with SMTP id
 00721157ae682-71140ae2b59mr4327757b3.14.1749576855731; Tue, 10 Jun 2025
 10:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749571556.git.steve@sakoman.com> <742e6867-f955-4db7-a6a2-6bacbd613c55@amd.com>
In-Reply-To: <742e6867-f955-4db7-a6a2-6bacbd613c55@amd.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 Jun 2025 10:34:05 -0700
X-Gm-Features: AX0GCFuEk6hM8S5guCWsnCsquA95L6aAi4YI7FZN393DV0VZqDvoZ8evHqe3wyU
Message-ID: <CAOSpxdZK=sCu1JzqVq1RKhpMjx+tVHNV2ryty03HNEmjWR5zFw@mail.gmail.com>
Subject: Re: [OE-core][walnascar 00/32] Patch review
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fe52a306373b1aa5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 17:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218403

--000000000000fe52a306373b1aa5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, will add it to the next batch.

In the future it would be helpful to me if you wouldn't send patches
targeted for more than one branch.  When you do this I need to remember to
keep checking the master branch to see if it is accepted. This greatly
increases the odds that I'm going forget about it! So best to submit for
master and then send a version for any other branches after it is already
in master.

Thanks!

Steve


On Tue, Jun 10, 2025, 10:11=E2=80=AFAM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> Hi Steve,
>
> Below patch is missing in your merge, Can you add it?
>
> [OE-core][scarthgap,walnascar,master][PATCH v3] tune-cortexr52: Remove
> aarch64 for ARM Cortex-R52
>
> Thanks,
> Sandeep
>
> On 6/10/2025 10:08 AM, Steve Sakoman via lists.openembedded.org wrote:
> > Please review this set of changes for walnascar and have comments back =
by
> > end of day Thursday, June 12
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768
> >
> > The following changes since commit
> a7322472e41c3cac922e29d867ae3f2f74318279:
> >
> >    sstatetests: Switch to new CDN (2025-05-30 06:32:58 -0700)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/openembedded-core-contrib
> stable/walnascar-nut
> >
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wa=
lnascar-nut
> >
> > Changqing Li (25):
> >    libsoup-2.4: update patch 0001-CVE-2025-32911.patch
> >    libsoup-2.4: fix CVE-2025-32053
> >    libsoup-2.4: fix CVE-2025-2784
> >    libsoup-2.4: fix CVE-2024-52530
> >    libsoup-2.4: fix CVE-2025-32906
> >    libsoup-2.4: fix CVE-2025-32914
> >    libsoup-2.4: fix CVE-2025-46420
> >    libsoup-2.4: fix CVE-2025-46421
> >    libsoup-2.4: fix CVE-2025-32050
> >    libsoup-2.4: fix CVE-2025-32052
> >    libsoup-2.4: fix CVE-2025-32909
> >    libsoup-2.4: fix CVE-2025-32910
> >    libsoup-2.4: fix CVE-2025-32912
> >    libsoup-2.4: fix CVE-2024-52531
> >    libsoup-2.4: fix CVE-2025-4476
> >    libsoup: upgrade 3.6.4 -> 3.6.5
> >    libsoup-2.4: fix CVE-2025-32907
> >    libsoup-2.4: fix CVE-2025-4948
> >    libsoup-2.4: fix CVE-2025-4969
> >    libsoup: fix CVE-2025-32914
> >    libsoup: fix CVE-2025-4476
> >    libsoup: fix CVE-2025-32907
> >    libsoup: fix CVE-2025-32908
> >    libsoup: fix CVE-2025-4948
> >    libsoup: fix CVE-2025-4969
> >
> > Deepesh Varatharajan (2):
> >    binutils: Fix CVE-2025-1181
> >    binutils: Fix CVE-2025-5244
> >
> > Patrick Williams (1):
> >    systemd.bbclass: generate preset for templates
> >
> > Peter Marko (1):
> >    python3: upgrade 3.13.3 -> 3.13.4
> >
> > Ross Burton (2):
> >    python3: remove obsolete deletion of non-deterministic .pyc files
> >    python3: backport the full fix for importlib scanning invalid
> >      distributions
> >
> > Trevor Gamblin (1):
> >    python3: upgrade 3.13.2 -> 3.13.3
> >
> >   meta/classes-recipe/systemd.bbclass           |  11 +-
> >   .../binutils/binutils-2.44.inc                |   3 +
> >   .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
> >   .../binutils/0016-CVE-2025-5244.patch         |  25 ++
> >   .../binutils/0017-CVE-2025-1181-2.patch       | 337 +++++++++++++++++=
+
> >   ...shebang-overflow-on-python-config.py.patch |   2 +-
> >   ...-use-prefix-value-from-build-configu.patch |   2 +-
> >   ...-qemu-wrapper-when-gathering-profile.patch |  14 +-
> >   ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
> >   ..._fileno-test-due-to-load-variability.patch |   2 +-
> >   ...ctive_children-skip-problematic-test.patch |   2 +-
> >   ...t_readline-skip-limited-history-test.patch |  10 +-
> >   ...orlines-skip-due-to-load-variability.patch |   2 +-
> >   .../python3/deterministic_imports.patch       |  39 --
> >   .../python/python3/makerace.patch             |   2 +-
> >   .../python/python3/valid-dists.patch          | 160 +++++++++
> >   .../{python3_3.13.2.bb =3D> python3_3.13.4.bb}  |  18 +-
> >   .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
> >   .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++
> >   .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 ++
> >   .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 +++++++
> >   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++
> >   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ++++
> >   .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 ++
> >   .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++
> >   .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++
> >   .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 ++++
> >   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 +++
> >   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++
> >   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 ++
> >   .../libsoup/libsoup-2.4_2.74.3.bb             |  23 +-
> >   .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 +++++++++++
> >   .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++
> >   .../libsoup/libsoup/CVE-2025-32908-1.patch    |  89 +++++
> >   .../libsoup/libsoup/CVE-2025-32908-2.patch    |  53 +++
> >   .../libsoup/libsoup/CVE-2025-32914.patch      | 112 ++++++
> >   .../libsoup/libsoup/CVE-2025-4476.patch       |  39 ++
> >   .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++
> >   .../libsoup/libsoup/CVE-2025-4969.patch       |  78 ++++
> >   .../{libsoup_3.6.4.bb =3D> libsoup_3.6.5.bb}    |  13 +-
> >   48 files changed, 2541 insertions(+), 77 deletions(-)
> >   create mode 100644
> meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
> >   create mode 100644
> meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
> >   create mode 100644
> meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
> >   delete mode 100644
> meta/recipes-devtools/python/python3/deterministic_imports.patch
> >   create mode 100644
> meta/recipes-devtools/python/python3/valid-dists.patch
> >   rename meta/recipes-devtools/python/{python3_3.13.2.bb =3D>
> python3_3.13.4.bb} (95%)
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
> >   create mode 100644
> meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
> >   rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb =3D>
> libsoup_3.6.5.bb} (83%)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218369):
> https://lists.openembedded.org/g/openembedded-core/message/218369
> > Mute This Topic: https://lists.openembedded.org/mt/113572634/3619217
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sandeep.gundlupet-raju@amd.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000fe52a306373b1aa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ok, will add it to the next batch.=C2=A0<div dir=3D"=
auto"><br></div><div dir=3D"auto">In the future it would be helpful to me i=
f you wouldn&#39;t send patches targeted for more than one branch.=C2=A0 Wh=
en you do this I need to remember to keep checking the master branch to see=
 if it is accepted. This greatly increases the odds that I&#39;m going forg=
et about it! So best to submit for master and then send a version for any o=
ther branches after it is already in master.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks!=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Steve</div><br><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 10, 2025, 10:11=
=E2=80=AFAM Gundlupet Raju, Sandeep &lt;<a href=3D"mailto:sandeep.gundlupet=
-raju@amd.com">sandeep.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Steve,<br>
<br>
Below patch is missing in your merge, Can you add it?<br>
<br>
[OE-core][scarthgap,walnascar,master][PATCH v3] tune-cortexr52: Remove <br>
aarch64 for ARM Cortex-R52<br>
<br>
Thanks,<br>
Sandeep<br>
<br>
On 6/10/2025 10:08 AM, Steve Sakoman via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.=
org</a> wrote:<br>
&gt; Please review this set of changes for walnascar and have comments back=
 by<br>
&gt; end of day Thursday, June 12<br>
&gt;<br>
&gt; Passed a-full on autobuilder:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29=
/builds/1768" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autob=
uilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768</a><br>
&gt;<br>
&gt; The following changes since commit a7322472e41c3cac922e29d867ae3f2f743=
18279:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 sstatetests: Switch to new CDN (2025-05-30 06:32:58 -0700=
)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core=
-contrib" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.opene=
mbedded.org/openembedded-core-contrib</a> stable/walnascar-nut<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core=
-contrib/log/?h=3Dstable/walnascar-nut" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Dstable/walnascar-nut</a><br>
&gt;<br>
&gt; Changqing Li (25):<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: update patch 0001-CVE-2025-32911.patch<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32053<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-2784<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2024-52530<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32906<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32914<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-46420<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-46421<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32050<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32052<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32909<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32910<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32912<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2024-52531<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-4476<br>
&gt;=C2=A0 =C2=A0 libsoup: upgrade 3.6.4 -&gt; 3.6.5<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-32907<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-4948<br>
&gt;=C2=A0 =C2=A0 libsoup-2.4: fix CVE-2025-4969<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-32914<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-4476<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-32907<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-32908<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-4948<br>
&gt;=C2=A0 =C2=A0 libsoup: fix CVE-2025-4969<br>
&gt;<br>
&gt; Deepesh Varatharajan (2):<br>
&gt;=C2=A0 =C2=A0 binutils: Fix CVE-2025-1181<br>
&gt;=C2=A0 =C2=A0 binutils: Fix CVE-2025-5244<br>
&gt;<br>
&gt; Patrick Williams (1):<br>
&gt;=C2=A0 =C2=A0 systemd.bbclass: generate preset for templates<br>
&gt;<br>
&gt; Peter Marko (1):<br>
&gt;=C2=A0 =C2=A0 python3: upgrade 3.13.3 -&gt; 3.13.4<br>
&gt;<br>
&gt; Ross Burton (2):<br>
&gt;=C2=A0 =C2=A0 python3: remove obsolete deletion of non-deterministic .p=
yc files<br>
&gt;=C2=A0 =C2=A0 python3: backport the full fix for importlib scanning inv=
alid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 distributions<br>
&gt;<br>
&gt; Trevor Gamblin (1):<br>
&gt;=C2=A0 =C2=A0 python3: upgrade 3.13.2 -&gt; 3.13.3<br>
&gt;<br>
&gt;=C2=A0 =C2=A0meta/classes-recipe/systemd.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0.../binutils/binutils-2.44.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0.../binutils/0016-CVE-2025-1181-1.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 141 ++++++++<br>
&gt;=C2=A0 =C2=A0.../binutils/0016-CVE-2025-5244.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 25 ++<br>
&gt;=C2=A0 =C2=A0.../binutils/0017-CVE-2025-1181-2.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 337 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0...shebang-overflow-on-python-config.py.patch |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0...-use-prefix-value-from-build-configu.patch |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0...-qemu-wrapper-when-gathering-profile.patch |=C2=A0 14 +=
-<br>
&gt;=C2=A0 =C2=A0...sts-due-to-load-variability-on-YP-AB.patch |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 =C2=A0..._fileno-test-due-to-load-variability.patch |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0...ctive_children-skip-problematic-test.patch |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0...t_readline-skip-limited-history-test.patch |=C2=A0 10 +=
-<br>
&gt;=C2=A0 =C2=A0...orlines-skip-due-to-load-variability.patch |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 =C2=A0.../python3/deterministic_imports.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 39 --<br>
&gt;=C2=A0 =C2=A0.../python/python3/makerace.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0.../python/python3/valid-dists.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 160 +++++++++<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://python3_3.13.2.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">python3_3.13.2.bb</a> =3D&gt; <a href=3D"ht=
tp://python3_3.13.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pyt=
hon3_3.13.4.bb</a>}=C2=A0 |=C2=A0 18 +-<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/0001-CVE-2025-32911.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2024-52530.patch=C2=A0 | 150 +=
+++++++<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/CVE-2024-52531-1.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 39 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/CVE-2024-52531-2.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 133 +++++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-2784.patch=C2=A0 =C2=A0|=
=C2=A0 56 +++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32050.patch=C2=A0 |=C2=A0=
 29 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32052.patch=C2=A0 |=C2=A0=
 32 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32053.patch=C2=A0 |=C2=A0=
 39 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32906.patch=C2=A0 |=C2=A0=
 71 ++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32907.patch=C2=A0 |=C2=A0=
 39 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32909.patch=C2=A0 |=C2=A0=
 38 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/CVE-2025-32910-1.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 32 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/CVE-2025-32910-2.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 94 +++++<br>
&gt;=C2=A0 =C2=A0.../libsoup-2.4/CVE-2025-32910-3.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 28 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32912.patch=C2=A0 |=C2=A0=
 32 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-32914.patch=C2=A0 |=C2=A0=
 35 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-4476.patch=C2=A0 =C2=A0|=
=C2=A0 38 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-46420.patch=C2=A0 |=C2=A0=
 61 ++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-46421.patch=C2=A0 |=C2=A0=
 47 +++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-4948.patch=C2=A0 =C2=A0|=
=C2=A0 38 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup-2.4/CVE-2025-4969.patch=C2=A0 =C2=A0|=
=C2=A0 37 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/<a href=3D"http://libsoup-2.4_2.74.3.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libsoup-2.4_2.74.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 +-<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-32907-1.patch=C2=A0 =C2=A0 | =
200 +++++++++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-32907-2.patch=C2=A0 =C2=A0 |=
=C2=A0 68 ++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-32908-1.patch=C2=A0 =C2=A0 |=
=C2=A0 89 +++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-32908-2.patch=C2=A0 =C2=A0 |=
=C2=A0 53 +++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-32914.patch=C2=A0 =C2=A0 =C2=
=A0 | 112 ++++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-4476.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 39 ++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-4948.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 97 +++++<br>
&gt;=C2=A0 =C2=A0.../libsoup/libsoup/CVE-2025-4969.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 78 ++++<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://libsoup_3.6.4.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">libsoup_3.6.4.bb</a> =3D&gt; <a href=3D"http=
://libsoup_3.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsou=
p_3.6.5.bb</a>}=C2=A0 =C2=A0 |=C2=A0 13 +-<br>
&gt;=C2=A0 =C2=A048 files changed, 2541 insertions(+), 77 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils=
/0016-CVE-2025-1181-1.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils=
/0016-CVE-2025-5244.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils=
/0017-CVE-2025-1181-2.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/python/python3/de=
terministic_imports.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/python/python3/va=
lid-dists.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://pyt=
hon3_3.13.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.1=
3.2.bb</a> =3D&gt; <a href=3D"http://python3_3.13.4.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">python3_3.13.4.bb</a>} (95%)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2024-52530.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2024-52531-1.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2024-52531-2.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-2784.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32050.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32052.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32053.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32906.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32907.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32909.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32910-1.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32910-2.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32910-3.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32912.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-32914.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-4476.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-46420.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-46421.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-4948.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.=
4/CVE-2025-4969.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-32907-1.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-32907-2.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-32908-1.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-32908-2.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-32914.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-4476.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-4948.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup/CV=
E-2025-4969.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-support/libsoup/{<a href=3D"http://lib=
soup_3.6.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsoup_3.6.=
4.bb</a> =3D&gt; <a href=3D"http://libsoup_3.6.5.bb" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">libsoup_3.6.5.bb</a>} (83%)<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#218369): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/218369" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2183=
69</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11357263=
4/3619217" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/113572634/3619217</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:sandeep.gu=
ndlupet-raju@amd.com" target=3D"_blank" rel=3D"noreferrer">sandeep.gundlupe=
t-raju@amd.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000fe52a306373b1aa5--

