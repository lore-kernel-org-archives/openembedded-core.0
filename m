Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F895E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 19:20:45 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.136865.1734636036121408299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 11:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bjdDElrA;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e565708beso628419a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734636035; x=1735240835; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLNowh6qumyiSXgZr4kJq7st0+eGA2VBc3gLS+jPX1o=;
        b=bjdDElrAkDJn3W5i7Saig9elYvznpUO21ESJCrVJAb4kJv9ZI9yjrAN8SuqW9zs3Ao
         JFjd6Mj9EK+jSMcU7zt0vpN4OkoVggbDSc7Heq3UrcQ5Wasmv2MWa7Rop5BRws5X+SgY
         1hQhBNRPtdU8qnByJynsI2JUWoY7QlBdXjwEjfMekhLif/+Qn25bPvvtpWxh51zm2xlR
         nIYIYqBiDrA3LAzdnvMGS/84RgZpJGnvLzjcC/NV1i3EBCnqSDwx88n+C66uRzEydEA6
         e+1N2NZNALluyS7EMIlJYMkvtQdW34Fl2kGATwwY/RYlXnJmYyi0wArVDCCtbs65t2fu
         BtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636035; x=1735240835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLNowh6qumyiSXgZr4kJq7st0+eGA2VBc3gLS+jPX1o=;
        b=Fce+7i15XesrLq/TwuWFMLUwCmuFtwKru4DXSIZcizAAQc2kPuc1M3bjUDzaJJjwLn
         HTfGGiqPhhTooCcxmqyh1/b9YWkJEcHSbKTosOSPxy5rFWG2KrkDaAz46yoS26IsJA5t
         Uh0SNe4SeKNNIDHXX40ujRZvXC+rhfRJoI5gzpzzTtiPqufL76I1B13P34frCMDikrP2
         OiPmPesbOGfXRxmj9YShfOp7EbI0380ZGMjF+6Hg8b/DRZgJGCXOzJGbhaA344tWWgag
         fLonvFdPC8RdciLl/8N/YNVyRFuqao3XfN+0PCiMTigMsk9o5s12bKCmQ5pCtya0wQqT
         FXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhZNTRDLAjBa7f6O43Xm+Ld2paF7e7L3tcM/YlwHJq0U9tTgutAjoJs5k7r9xVdwXVwD70qvDttEr91CIdzEyXiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwO9xwbj1WvWpQnoP+QMn3KgoDhdJ/OcU2xcwhAcdSfd3ZoshuA
	MOBKjMraIx0vl0A3syI/ld0XlOoa24zdN/ocIDdxa0nmQ4z2OVd1fF4fTSIAHxG0yTtvHm1mK/W
	iHB9dUrXVcanIzrJgUNKwvVCHWxy/Dg==
X-Gm-Gg: ASbGncsFOvU5bRhloVpBTw8xz/0p9sWLEjxtms+0XkWF46DiSi73KwDr678DdFVY18N
	u0UK8p64oOwfU3x/NkPt7pDbMmTipGZZxZduCkwJfMXFEOttOjO/9
X-Google-Smtp-Source: AGHT+IF5g9WbUZaHBF68dmkgHGu6ciZb13hreeCWzDqJJRq+L/WEic66svUPDo0SVCBW++IsJrghAmLjT4b3oVHxRro=
X-Received: by 2002:a05:6871:60d:b0:29e:d36:6e39 with SMTP id
 586e51a60fabf-2a7fb0aa30emr82497fac.10.1734636035377; Thu, 19 Dec 2024
 11:20:35 -0800 (PST)
MIME-Version: 1.0
References: <1734597713-2663-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj8w3j0i7qPob-X6H7D201A9rtOLGg_-ZH_Y=Ydyaix2sQ@mail.gmail.com> <CAMKF1sp8p+tfzy8-WDOuY42z5-PiSOYwWwQ1Y29Y9_GZy+rBNw@mail.gmail.com>
In-Reply-To: <CAMKF1sp8p+tfzy8-WDOuY42z5-PiSOYwWwQ1Y29Y9_GZy+rBNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Dec 2024 11:20:09 -0800
Message-ID: <CAMKF1sqdvZKOUiRxbsS7JbVAho4CyUkAmvHX+RLj=5_wiBos=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfs-utils: Fix const qualifier error
To: alex.kanavin@gmail.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 19:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208931

On Thu, Dec 19, 2024 at 10:05=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Thu, Dec 19, 2024 at 1:01=E2=80=AFAM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Please do not add new =E2=80=98Penfing=E2=80=99 patches. They should be=
 submitted upstream first or there should be an explanation of what is pend=
ing.
>
> Yeah, i did another patch which is also not correct sadly. Perhaps we
> need to address it differently than simply trying
> type punning.
>

looking a bit closer, it seems changing the type of base from char* to
const char* is enough to get types correct. I have send a v2 patch
to upstream as well as for oe-core.

> >
> > Alex
> >
> > On Thu 19. Dec 2024 at 9.42, wangmy via lists.openembedded.org <wangmy=
=3Dfujitsu.com@lists.openembedded.org> wrote:
> >>
> >> From: Wang Mingyu <wangmy@cn.fujitsu.com>
> >>
> >> error with clang:
> >> file.c:200:8: error: assigning to 'char *' from 'const char *'
> >> discards qualifiers
> >> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >> |   200 |                 base =3D pathname;
> >> |       |                      ^ ~~~~~~~~
> >>
> >> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> >> ---
> >>  .../0001-Fix-const-qualifier-error.patch      | 35 ++++++++++++++++++=
+
> >>  .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
> >>  2 files changed, 36 insertions(+)
> >>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001=
-Fix-const-qualifier-error.patch
> >>
> >> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-co=
nst-qualifier-error.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0=
001-Fix-const-qualifier-error.patch
> >> new file mode 100644
> >> index 0000000000..8fc327e7aa
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-qua=
lifier-error.patch
> >> @@ -0,0 +1,35 @@
> >> +From a21344466e4c315d6d7098920819983f2d15573b Mon Sep 17 00:00:00 200=
1
> >> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
> >> +Date: Thu, 19 Dec 2024 06:18:59 +0000
> >> +Subject: [PATCH] Fix const qualifier error
> >> +
> >> +Fixes clang error
> >> +file.c:200:8: error: assigning to 'char *' from 'const char *'
> >> +discards qualifiers
> >> +[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >> +|   200 |                 base =3D pathname;
> >> +|       |                      ^ ~~~~~~~~
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> >> +---
> >> + support/nsm/file.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/support/nsm/file.c b/support/nsm/file.c
> >> +index de122b0..2733210 100644
> >> +--- a/support/nsm/file.c
> >> ++++ b/support/nsm/file.c
> >> +@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
> >> +
> >> +       base =3D strrchr(pathname, '/');
> >> +       if (base =3D=3D NULL)
> >> +-              base =3D pathname;
> >> ++              base =3D (char*)(&pathname);
> >> +       else
> >> +               base++;
> >> +
> >> +--
> >> +2.43.0
> >> +
> >> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/=
meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> >> index 543c68f7f5..45821b98e8 100644
> >> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> >> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> >> @@ -31,6 +31,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-uti=
ls/${PV}/nfs-utils-${PV}.tar.x
> >>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.=
a.patch \
> >>             file://clang-warnings.patch \
> >>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.pa=
tch \
> >> +           file://0001-Fix-const-qualifier-error.patch \
> >>             "
> >>
> >>  SRC_URI[sha256sum] =3D "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8=
fa8606196d358e7fb15"
> >> --
> >> 2.43.0
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#208899): https://lists.openembedded.org/g/openembed=
ded-core/message/208899
> > Mute This Topic: https://lists.openembedded.org/mt/110195053/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

