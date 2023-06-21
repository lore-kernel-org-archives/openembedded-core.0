Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEDDEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:14:57 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.11755.1687356891993522544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bKsxX2aY;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: sakoman@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-47164fe4941so1721197e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687356891; x=1689948891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEtVvQhHPwHplTtoqscycTwii9VbuA8LJx2SIoMv1Mk=;
        b=bKsxX2aYIPonlzqIjllDnEu37XL/iTfB+mTmEfLyhs5vdM8rtm3aVVhSE0g5fiKbhm
         ESBHH9t680mqmk0rFCZMZeyY4wciaRV1k/LM7ircwsBud0dCYd5idwcCNPE3nEjHJD2u
         Ml3c8CtjzexuC6ExgPIFwC7Dn5w1KP+AxMosx7B1ZpiD7v2mp7ByJswq/TXSlgh57hyD
         /v8AS+a2fyMTCxqrjuAD2HjfSwCoXrVLiMXWVWKn9aKdRURZB6W33AQPMWbpFkpSyfUU
         O1TazGy6LDR43KUMpwCjJwpOZV34OuSYoHjFnLK1CRlM9t2v2ATo4pAEJk7J5DzzwWSy
         zJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356891; x=1689948891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEtVvQhHPwHplTtoqscycTwii9VbuA8LJx2SIoMv1Mk=;
        b=jnxe+nci9kfQeirak2WYvyUKuRhPgrnSf3tPwCfWM4AOxrKAMUtgfsKpgsFyi2QKgf
         1cbMF/woCrswvNk+Q5vo160cUZkvTxjGyKCSbRFQV99GFGute2apRXbjFM72g1rH3kSU
         ABLVgNMWdGb4uftMjABZeuM/iUPqiN+ExTaizMbHT7Q1F3BaJ9lCR3WMSHAfzV8e+0lt
         wHZHjZHLVjLIK5RB4sCsssgNuqfDuEck1VZtl1P02BUYAgkbyJc5tFj/0sNCqVfVuTkd
         AJw8QfvYcMiI702DCAFdI6ozLkS3KUbCHSL1m8IkYcKIDrUOw2287aGUsetPGefcQ+Cj
         Orkw==
X-Gm-Message-State: AC+VfDynqc2X0bwkJpL79LCDAz5Rcu8pJxDl/lpX3obSE4eF8UK13iGl
	sQ82aYJv/igJ7Shm9qliuEQy0yxG+NORuSULXBQ=
X-Google-Smtp-Source: ACHHUZ53QYTGU03pT1oNlNKVy97+rxI/jmZjDV/EwRekHxW01x0NgSIktCO5dycp2Tf3ThLE14wXg3cx8HNe6dLwXEY=
X-Received: by 2002:a1f:bf92:0:b0:46e:4ffb:2f8 with SMTP id
 p140-20020a1fbf92000000b0046e4ffb02f8mr6478516vkf.0.1687356890907; Wed, 21
 Jun 2023 07:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <17684EF49825A362.24824@lists.openembedded.org> <SJ0PR11MB6717769519ADFAB3420CD874DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6717769519ADFAB3420CD874DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Wed, 21 Jun 2023 04:14:39 -1000
Message-ID: <CAGDS+nn=eq889XVPJt0mn0f+KCcFSMFcCg-dk7QFN4rjVaHtew@mail.gmail.com>
Subject: Re: [OE-core] [OE-core,dunfell][PATCH] cups: Fix CVE-2023-32324
To: schitrod@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 14:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183182

On Tue, Jun 20, 2023 at 10:04=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) via lists.openembedded.org
<schitrod=3Dcisco.com@lists.openembedded.org> wrote:
>
> Hi Steve,
>
> CVE fix for cups package is accepted and merged on master.
> https://github.com/openembedded/openembedded-core/commit/a4bdbc82f7e5cc9a=
5cb603cb720f09b0216b0a0e
>
> Is there any comment for similar fix on dunfell branch?

Hi Sanjay,

It is in the current test queue for dunfell, which you can browse at:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunf=
ell-nut

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod -=
 E-INFO CHIPS INC at Cisco) via lists.openembedded.org
> Sent: Wednesday, June 14, 2023 1:04 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co) <schitrod@cisco.com>
> Subject: [OE-core] [OE-core,dunfell][PATCH] cups: Fix CVE-2023-32324
>
> OpenPrinting CUPS is an open source printing system. In versions 2.4.2 an=
d prior, a heap buffer overflow vulnerability would allow a remote attacker=
 to launch a denial of service (DoS) attack. A buffer overflow vulnerabilit=
y in the function `format_log_line` could allow remote attackers to cause a=
 DoS on the affected system. Exploitation of the vulnerability can be trigg=
ered when the configuration file `cupsd.conf` sets the value of `loglevel `=
to `DEBUG`. No known patches or workarounds exist at time of publication.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-32324
> https://security-tracker.debian.org/tracker/CVE-2023-32324
>
> Upstream Patch:
> https://github.com/OpenPrinting/cups/commit/fd8bc2d32589
>
> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index 21c56e1430..d6e7d95800 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -14,6 +14,7 @@ SRC_URI =3D "https://github.com/apple/cups/releases/dow=
nload/v${PV}/${BP}-source.t
>             file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
>             file://0004-cups-fix-multilib-install-file-conflicts.patch\
>             file://CVE-2022-26691.patch \
> +           file://CVE-2023-32324.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/apple/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/=
recipes-extended/cups/cups/CVE-2023-32324.patch
> new file mode 100644
> index 0000000000..40b89c9899
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
> @@ -0,0 +1,36 @@
> +From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Thu, 1 Jun 2023 12:04:00 +0200
> +Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes
> +CVE-2023-32324)
> +
> +CVE: CVE-2023-32324
> +Upstream-Status: Backport
> +[https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
> +
> +(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
> +Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> +---
> + cups/string.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/cups/string.c b/cups/string.c index 93cdad19..6ef58515
> +100644
> +--- a/cups/string.c
> ++++ b/cups/string.c
> +@@ -1,6 +1,7 @@
> + /*
> +  * String functions for CUPS.
> +  *
> ++ * Copyright =C2=A9 2023 by OpenPrinting.
> +  * Copyright =C2=A9 2007-2019 by Apple Inc.
> +  * Copyright =C2=A9 1997-2007 by Easy Software Products.
> +  *
> +@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,             /* O - De=
stination string */
> +   size_t      srclen;                 /* Length of source string */
> +
> +
> ++  if (size =3D=3D 0)
> ++    return (0);
> ++
> +  /*
> +   * Figure out how much room is needed...
> +   */
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183175): https://lists.openembedded.org/g/openembedde=
d-core/message/183175
> Mute This Topic: https://lists.openembedded.org/mt/99513156/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

