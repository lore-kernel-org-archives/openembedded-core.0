Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15973C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:14:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.50822.1683209641471830951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 07:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RZHoATkP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so1068617a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683209640; x=1685801640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDAscNXRXept7eAOjXG0O51wVu+PAbwQhyw5XAs66AU=;
        b=RZHoATkPz0a+6Jehm/BMUe0fbvrmpnCzYjFQj90FpTmQowl9mxjpf+qkPd8fkJtcqf
         g8sdb8q+SIokkMkKUBVOBi39VuTG3SquAoC7mDPtirxAMJ5nG0rO+vNWhD5htHuGDGaf
         khpz2Br8ZA/aSIsiR6yPIlu0DYTxblZCjOmVWz59gmXAq5XYY2p+gQLB46xS6ZI6rCCR
         1uPPTK34Rle7lV2l2DxXpVUE+iUYT2ld/ia997wVao3nqQtwvAZuWS72uWuKtNHVPbtU
         mKxafcfGONcjHdDFi5QT3ezKQgZTlIomc92CFNh0qhvtBseGDnUnPdGndCtPgrQycLTl
         XFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683209640; x=1685801640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDAscNXRXept7eAOjXG0O51wVu+PAbwQhyw5XAs66AU=;
        b=WSAFoyj3iFdolc4uMl7nPZCFvNge0sdM4XEh/pzDq+sMTOAD+jEWvtbQsg93aI4gqV
         LHoTxGYlma5iJpMAhZZBIo1v6qdpnPCDh2Aky3j8l8xuiHq9+5/1rQe2jD0C0lhAcIgl
         ZdL4lz0eLWCC4qa48chng5zcRYX4FLfFwcaXND0X1xgi/5UBNyWGCmtufNu1SGwjyW7F
         F2r9cevs9+3dughmfWrOlcRoMq6imKLBtQfiVKneJzRJGzMZJ9FiWsXUNA/ZFhKDP1Rs
         Zy+2EYBaPispozH9Yqvi2yzofOno/2m59nylFYdBBfpEIH42i5B00wNikhH9cigCVxn1
         hSWA==
X-Gm-Message-State: AC+VfDwMz/58AkEYtUYqV3p7XcZo6/kOE70wclFfXhqctS5GjfSqjipC
	uKmKTPuDRcRxnQ3/bmvuBAcgTgFUM3Q4hgqpHsfQwBNq705hROYxVKc=
X-Google-Smtp-Source: ACHHUZ6ZWrtkkuSVNlnwyERBfLNQaHCdopG2ZccDcGhWGheLW6C6ls/IqNpTZnf7x0MyUmKROXZNAXwA5xSW9pUuS4Q=
X-Received: by 2002:a17:906:6a1f:b0:94e:dbf7:2dfe with SMTP id
 qw31-20020a1709066a1f00b0094edbf72dfemr7375758ejc.11.1683209639556; Thu, 04
 May 2023 07:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230504014730.31190-1-asharma@mvista.com>
In-Reply-To: <20230504014730.31190-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 4 May 2023 04:13:48 -1000
Message-ID: <CAOSpxdZ2=5eP0cPty1cz0npv98UT-CDpYvCpSR8Gv=v4vwtc-Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] shadow:Fix CVE-2023-29383 improper
 input validation
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 14:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180876

Hi Ashish,

We already have a fix for this CVE in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3De8eab4241593cc=
93da7dd24ad7a188bbf1866413

Thanks!

Steve

On Wed, May 3, 2023 at 3:47=E2=80=AFPM Ashish Sharma <asharma@mvista.com> w=
rote:
>
> ChangeID: 2bfa88cb752792ddc37f700f87a896331bb12c95
>
> CVE: CVE-2023-29383
> shadow: Improper input validation in shadow-utils package utility
> chfn
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../shadow/files/CVE-2023-29383.patch         | 46 +++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.pat=
ch
>
> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/me=
ta/recipes-extended/shadow/files/CVE-2023-29383.patch
> new file mode 100644
> index 00000000000..49e62d4e429
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
> @@ -0,0 +1,46 @@
> +From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
> +From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
> +Date: Thu, 23 Mar 2023 23:39:38 +0000
> +Subject: [PATCH] Added control character check
> +
> +Added control character check, returning -1 (to "err") if control charac=
ters are present.
> +---
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit=
/e5905c4b84d4fb90aefcd96ee618411ebfac663d]
> +CVE: CVE-2023-29383
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + lib/fields.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/fields.c b/lib/fields.c
> +index 640be931f..fb51b5829 100644
> +--- a/lib/fields.c
> ++++ b/lib/fields.c
> +@@ -21,9 +21,9 @@
> +  *
> +  * The supplied field is scanned for non-printable and other illegal
> +  * characters.
> +- *  + -1 is returned if an illegal character is present.
> +- *  +  1 is returned if no illegal characters are present, but the fiel=
d
> +- *       contains a non-printable character.
> ++ *  + -1 is returned if an illegal or control character is present.
> ++ *  +  1 is returned if no illegal or control characters are present,
> ++ *       but the field contains a non-printable character.
> +  *  +  0 is returned otherwise.
> +  */
> + int valid_field (const char *field, const char *illegal)
> +@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *ille=
gal)
> +       }
> +
> +       if (0 =3D=3D err) {
> +-              /* Search if there are some non-printable characters */
> ++              /* Search if there are non-printable or control character=
s */
> +               for (cp =3D field; '\0' !=3D *cp; cp++) {
> +                       if (!isprint (*cp)) {
> +                               err =3D 1;
> ++                      }
> ++                      if (!iscntrl (*cp)) {
> ++                              err =3D -1;
> +                               break;
> +                       }
> +               }
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 5106b955719..72891d022fe 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/v${PV}/${BP}
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
>             file://shadow-relaxed-usernames.patch \
>             file://useradd \
> +          file://CVE-2023-29383.patch \
>             "
>
>  SRC_URI:append:class-target =3D " \
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180843): https://lists.openembedded.org/g/openembedde=
d-core/message/180843
> Mute This Topic: https://lists.openembedded.org/mt/98675950/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

