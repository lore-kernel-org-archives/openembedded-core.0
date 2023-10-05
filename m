Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48698E92703
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 14:17:29 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.16525.1696515441535717345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 07:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K/BpIaOD;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9b281a2aa94so187264666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696515440; x=1697120240; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpSJKNKz7XPRRaigks6pu/fCRvYPdCa9Gml48+GiOvY=;
        b=K/BpIaODiaIMxO1emyo5RyXj2f3phtCXP/aG9JMz9SBzNb9WjH2AMBC4UG2A9p/qgO
         bUgLRa/LMEUmBbSTmm1ZgjNQ4ECrjgFCpzFxF/+hzTTW86qrxxOcUA2aRFYeQSi5JG66
         SccrmVmb4rWZq1E9j2RaUk8ZHf/U1hZIYodd52zlej3is2mvnEshg9iaUjkLa119ZtuJ
         xPDC3U11Oj9RPco+rQulL4yJ0wo087vzG8HtooxKOTzeUfjCXYbilAVkFd3pBTyert2B
         Ehj6H5iPHyQvrWGb4v9Xf11/84XcEbPIiuON7JQq9kk7Hvd2KInnn803TPwu78kzn1lv
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696515440; x=1697120240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpSJKNKz7XPRRaigks6pu/fCRvYPdCa9Gml48+GiOvY=;
        b=A7LCAQ9G+o3ugqxxn3IJ1964KI0iLz5t6c0uiT1DrPARhhSqRjB6544hRsN/ahrl6i
         GPT42QqSyeKszGpbvgXcGFCqR8SKZtbeqRXwd+KBmGz2d3Gp9izcX697HKnu9nw7V3t9
         6FBSEF4uQL8HKBngwYx/8QoqYV6yl6gZXXwKfYAErjtGyWz9CD3Ov15LuTKOXa9/o3qN
         ZHl7kNIsTYhcip5Wd747qNwzPiiVXk4I/QRnU4807WqMfuD82soZl3T0jpWf5b/MC0FO
         iTPwvsJuqlPMbVVRzJh6uZnLuhY7m1LIhP8aL+i4L7YKa0b6YGJO2c/q4YDJMImvYi0X
         QBzA==
X-Gm-Message-State: AOJu0YxLGBuzUvMlg9eXUH47IWlkpD8YWoMsm1n7vP7ZQ70uciFE2jin
	gvyppZXU3LYkS4wg9VHBgZCIM56mOXfcuOYfcc4VSA==
X-Google-Smtp-Source: AGHT+IEvREjakLabyAX3cTOiUvttB/svqTGSlTpooOUWZvoPVHbU//49+e1oFESxwzdRWOYj4DNNO8/v2ScQiAIAhXc=
X-Received: by 2002:a17:906:cc55:b0:9ae:7088:6e5d with SMTP id
 mm21-20020a170906cc5500b009ae70886e5dmr4626333ejb.3.1696515439165; Thu, 05
 Oct 2023 07:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231005085407.2200644-1-mac@mcrowe.com>
In-Reply-To: <20231005085407.2200644-1-mac@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 5 Oct 2023 04:17:08 -1000
Message-ID: <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney Tunables"
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 14:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188721

Hmmm ... does this build for you?

I'm getting:

ERROR: glibc-2.31+gitAUTOINC+2d4f26e5cf-r0 do_patch: Applying patch
'CVE-2023-4911.patch' on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2=
.31+gitAUTOINC+2d4f26e5cf-r0/git'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2.=
31+gitAUTOINC+2d4f26e5cf-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2023-4911.patch
patching file elf/dl-tunables.c
Hunk #1 FAILED at 187.
Hunk #2 FAILED at 251.
2 out of 2 hunks FAILED -- rejects in file elf/dl-tunables.c
Patch CVE-2023-4911.patch does not apply (enforce with -f)

Steve

On Wed, Oct 4, 2023 at 10:54=E2=80=AFPM Mike Crowe via lists.openembedded.o=
rg
<mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>
> From: Mike Crowe <mac@mcrowe.com>
>
> Take the patch from the source for Debian's glibc 2.31-13+deb11u7
> package, the changelog for which starts with:
>
>  glibc (2.31-13+deb11u7) bullseye-security; urgency=3Dmedium
>
>    * debian/patches/any/local-CVE-2023-4911.patch: Fix a buffer overflow =
in the
>      dynamic loader's processing of the GLIBC_TUNABLES environment variab=
le
>      (CVE-2023-4911).
>
> This addresses the "Looney Tunables" vulnerability described at
> https://www.qualys.com/2023/10/03/cve-2023-4911/looney-tunables-local-pri=
vilege-escalation-glibc-ld-so.txt
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  .../glibc/glibc/CVE-2023-4911.patch           | 63 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch b/meta/rec=
ipes-core/glibc/glibc/CVE-2023-4911.patch
> new file mode 100644
> index 0000000000..4d3146509a
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
> @@ -0,0 +1,63 @@
> +From d2b77337f734fcacdfc8e0ddec14cf31a746c7be Mon Sep 17 00:00:00 2001
> +From: Siddhesh Poyarekar <siddhesh@redhat.com>
> +Date: Mon, 11 Sep 2023 18:53:15 -0400
> +Subject: [PATCH v2] tunables: Terminate immediately if end of input is r=
eached
> +
> +The string parsing routine may end up writing beyond bounds of tunestr
> +if the input tunable string is malformed, of the form name=3Dname=3Dval.
> +This gets processed twice, first as name=3Dname=3Dval and next as name=
=3Dval,
> +resulting in tunestr being name=3Dname=3Dval:name=3Dval, thus overflowin=
g
> +tunestr.
> +
> +Terminate the parsing loop at the first instance itself so that tunestr
> +does not overflow.
> +---
> +Changes from v1:
> +
> +- Also null-terminate tunestr before exiting.
> +
> + elf/dl-tunables.c | 17 ++++++++++-------
> + 1 file changed, 10 insertions(+), 7 deletions(-)
> +
> +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> +CVE: CVE-2023-4911
> +
> +diff --git a/elf/dl-tunables.c b/elf/dl-tunables.c
> +index 8e7ee9df10..76cf8b9da3 100644
> +--- a/elf/dl-tunables.c
> ++++ b/elf/dl-tunables.c
> +@@ -187,11 +187,7 @@ parse_tunables (char *tunestr, char *valstring)
> +       /* If we reach the end of the string before getting a valid name-=
value
> +        pair, bail out.  */
> +       if (p[len] =3D=3D '\0')
> +-      {
> +-        if (__libc_enable_secure)
> +-          tunestr[off] =3D '\0';
> +-        return;
> +-      }
> ++      break;
> +
> +       /* We did not find a valid name-value pair before encountering th=
e
> +        colon.  */
> +@@ -251,9 +247,16 @@ parse_tunables (char *tunestr, char *valstring)
> +           }
> +       }
> +
> +-      if (p[len] !=3D '\0')
> +-      p +=3D len + 1;
> ++      /* We reached the end while processing the tunable string.  */
> ++      if (p[len] =3D=3D '\0')
> ++      break;
> ++
> ++      p +=3D len + 1;
> +     }
> ++
> ++  /* Terminate tunestr before we leave.  */
> ++  if (__libc_enable_secure)
> ++    tunestr[off] =3D '\0';
> + }
> + #endif
> +
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/gl=
ibc/glibc_2.31.bb
> index 8d216f6ed1..1862586749 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -80,6 +80,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.pa=
tch \
>             file://0037-Avoid-deadlock-between-pthread_create-and-ctors.p=
atch \
>             file://CVE-2023-0687.patch \
> +           file://CVE-2023-4911.patch \
>             "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.39.2
>
> BrightSign considers your privacy to be very important. The emails you se=
nd to us will be protected and secured. Furthermore, we will only use your =
email and contact information for the reasons you sent them to us and for t=
racking how effectively we respond to your requests.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188708): https://lists.openembedded.org/g/openembedde=
d-core/message/188708
> Mute This Topic: https://lists.openembedded.org/mt/101773057/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

