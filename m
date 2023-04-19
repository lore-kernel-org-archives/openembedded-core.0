Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B94C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:39:01 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.42956.1681922338231972048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 09:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0ONcr77D;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-94ed7e49541so352565366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681922336; x=1684514336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmcs9fTXNZQYbulJpxxIr+bWIbf91TePC/UOqw4bf0w=;
        b=0ONcr77DoYby0LI5EqEP2lHk9B/MLJG5xEXdzWKjJiO8Xq3vG71gpLqYXjI3FJXJbw
         ciLOpXjVWfC2F6SvT0nuT5kA3MiS43v/S68FW7t0AHoCeADBxNHo8CAoONEKl8Pb0C4k
         RzLQhtAEGWKbkJKY6eTvrrD3mONxPRSoXEZVK6AJU4ZErOBFoSpI20pUixtJRqdrQ1PV
         Z+4cJflGI+pYNCmIL1pOhJwU85adxJ0BaqaPeSgk6/evsqrIsunOKO9kG/ehrEaQoQ6n
         PjRDILksyXAVSF+/fVzGd9UD7kRzc6z22KwRy/aWBqMpzNO5KFs+9VustLfC6vQanNBB
         I8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922336; x=1684514336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmcs9fTXNZQYbulJpxxIr+bWIbf91TePC/UOqw4bf0w=;
        b=abbCnC33+qkgrqVrZOzfSgEwBU9bHYNxDczCVf6MJ0KFHmfL/u7U0cPhvuS5qw/pfZ
         ZGx13YHlQt6w/JX4AMjZrk/2vJ7OzttUR1DlrhUTDND6BAzTPnKDHQP1mmhb6Tpx0ARP
         haypDqk4CIaluHmSeLYp8d28uNEGgtnAnIamWfKcU+97SVQZk+q/+7cLiZB5ucJqdCsI
         mjSB2WMx2TDQ/ihxFhM64+WP9p3vkRiHc5DQ3ERGtBE9cILmup7j/sZQzjTuS4ILAaCy
         KpNnaNzmXVmtnu1spwElxBjo4ys4JLOtVovjkrWUFI3QyalBcqtwD88L3uTUC2BwR5Jt
         ED8A==
X-Gm-Message-State: AAQBX9erbejnu6VODOQW16GQb2gS2LwVZ7BS/twjjQnDRY3A/Hxzr5Dh
	5BrcWfm/QAS82qDR6QbVXRAaOVVzMgmriZIV4aBalEo87u4UguVG
X-Google-Smtp-Source: AKy350amn6ua1wMTXzwIyiztcRI/yRk6q9NjTivGHiPWDewBYPL9leDrMvtE1V5U2UYH/n8enx6awGUQttwzSmtZMlU=
X-Received: by 2002:aa7:c611:0:b0:504:7d53:2148 with SMTP id
 h17-20020aa7c611000000b005047d532148mr6449581edq.30.1681922336527; Wed, 19
 Apr 2023 09:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230419061739.2924050-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230419061739.2924050-1-xiangyu.chen@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Apr 2023 06:38:45 -1000
Message-ID: <CAOSpxdZDqC0xxLybtPw-3M3tqUuqDHenMs5r_w3n9vHWWRQGEg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] shadow: backport patch to fix CVE-2023-29383
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 16:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180226

On Tue, Apr 18, 2023 at 8:18=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The fix of CVE-2023-29383.patch contains a bug that it rejects all
> characters that are not control ones, so backup another patch named
> "0001-Overhaul-valid_field.patch" from upstream to fix it.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
> Changes
>
> v1->v2:
> 1. Based on latest oe-core commit
> 2. The fix of cve caused useradd/groupadd report errors as below:
> "configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrato=
r)"
> "configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrato=
r)"
> so backport another patch to fix useradd/groupadd wrong paramter's issue.
> 3. Using CVE-xxx as fix of cve patch file name

Thanks!  V2 looks much better :-)

Steve

> ---
>  .../files/0001-Overhaul-valid_field.patch     | 65 +++++++++++++++++++
>  .../shadow/files/CVE-2023-29383.patch         | 53 +++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |  2 +
>  3 files changed, 120 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-vali=
d_field.patch
>  create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.pat=
ch
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field=
.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
> new file mode 100644
> index 0000000000..ac08be515b
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
> @@ -0,0 +1,65 @@
> +From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Christian=3D20G=3DC3=3DB6ttsche?=3D <cgzones@googlemai=
l.com>
> +Date: Fri, 31 Mar 2023 14:46:50 +0200
> +Subject: [PATCH] Overhaul valid_field()
> +
> +e5905c4b ("Added control character check") introduced checking for
> +control characters but had the logic inverted, so it rejects all
> +characters that are not control ones.
> +
> +Cast the character to `unsigned char` before passing to the character
> +checking functions to avoid UB.
> +
> +Use strpbrk(3) for the illegal character test and return early.
> +
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit=
/2eaea70111f65b16d55998386e4ceb4273c19eb4]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + lib/fields.c | 24 ++++++++++--------------
> + 1 file changed, 10 insertions(+), 14 deletions(-)
> +
> +diff --git a/lib/fields.c b/lib/fields.c
> +index fb51b582..53929248 100644
> +--- a/lib/fields.c
> ++++ b/lib/fields.c
> +@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *ille=
gal)
> +
> +       /* For each character of field, search if it appears in the list
> +        * of illegal characters. */
> ++      if (illegal && NULL !=3D strpbrk (field, illegal)) {
> ++              return -1;
> ++      }
> ++
> ++      /* Search if there are non-printable or control characters */
> +       for (cp =3D field; '\0' !=3D *cp; cp++) {
> +-              if (strchr (illegal, *cp) !=3D NULL) {
> ++              unsigned char c =3D *cp;
> ++              if (!isprint (c)) {
> ++                      err =3D 1;
> ++              }
> ++              if (iscntrl (c)) {
> +                       err =3D -1;
> +                       break;
> +               }
> +       }
> +
> +-      if (0 =3D=3D err) {
> +-              /* Search if there are non-printable or control character=
s */
> +-              for (cp =3D field; '\0' !=3D *cp; cp++) {
> +-                      if (!isprint (*cp)) {
> +-                              err =3D 1;
> +-                      }
> +-                      if (!iscntrl (*cp)) {
> +-                              err =3D -1;
> +-                              break;
> +-                      }
> +-              }
> +-      }
> +-
> +       return err;
> + }
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/me=
ta/recipes-extended/shadow/files/CVE-2023-29383.patch
> new file mode 100644
> index 0000000000..f53341d3fc
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
> @@ -0,0 +1,53 @@
> +From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
> +From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
> +Date: Thu, 23 Mar 2023 23:39:38 +0000
> +Subject: [PATCH] Added control character check
> +
> +Added control character check, returning -1 (to "err") if control charac=
ters are present.
> +
> +CVE: CVE-2023-29383
> +Upstream-Status: Backport
> +
> +Reference to upstream:
> +https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee6=
18411ebfac663d
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + lib/fields.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/fields.c b/lib/fields.c
> +index 640be931..fb51b582 100644
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
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 5106b95571..3c1dd2f98e 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,8 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/v${PV}/${BP}
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
>             file://shadow-relaxed-usernames.patch \
>             file://useradd \
> +           file://CVE-2023-29383.patch \
> +           file://0001-Overhaul-valid_field.patch \
>             "
>
>  SRC_URI:append:class-target =3D " \
> --
> 2.34.1
>

