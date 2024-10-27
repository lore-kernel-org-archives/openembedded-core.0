Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867F5D1357E
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:54:35 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.36504.1730058873435342113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 12:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c+ztbm8U;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so3736381276.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730058872; x=1730663672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiaY5bBQ29otFFxSAmDWFdCFc3wIM9ceSxnnEVTdYnY=;
        b=c+ztbm8UDqoFcUnBfEwMXvoZR71TJeKQQFSoE17SjJW9/hyGfarjWT8oGZ73mnrSZQ
         zV6IYZbD3/tFDR2mrizO898W4q4Kyjicp8Ntz4m3RA7kvb90iWbVJGvWyeJhUisIws7w
         YZadOmkk5HvD9GuHlCsnQaSycT66CdQSYxnlgBcI46pmHEc1IllLVlHtzPS9yIYbaEt3
         kWA7d20S3U7bRoDlXp+AzjJTgoon/83mTcaWXU24pRziZLHkE8NsajewZPrk3TyRymlg
         Ah8Rxbg+TmOBvoT4uAMbLcOID+6hvzNU2aKFoOzU6Rs0xIaPwVX/dPZCcosEy0AKolzH
         tObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058872; x=1730663672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiaY5bBQ29otFFxSAmDWFdCFc3wIM9ceSxnnEVTdYnY=;
        b=MUN5fuhcc/3nQgK1SWShUwyLBFwoppBZ+5MhIn2CBuhIt9knXZPnXAGmI3WFtX5o6U
         Qtm2UdG0fJXX8wAX4RAWjk847hQ3EuHg6LfYQdbSdbh3pkFQT8CNTdUchC1DWB6R2wwh
         KxWpxcaC38ScNwYuopiXP1kY0viaWqs7FDCL5BbAWJu0hQr+4gmn7BCwgS1oWQ61lUyb
         k4lMQZjoNWWen35tHVzdcegJrcP0xEH/25pfddW50Iyfjulk1JBiNva2x8je/Wk3gMif
         ztcDTu13+hSlZFQU668+RgoO0gSNk9E1Idzkwr+UtL9htZnMgcSVntUoyGDz2oxnn+5u
         2R+w==
X-Gm-Message-State: AOJu0YzGjH8wwNSg7Y4yVL8IBQpxZmD4suIdE9XVVPGiKloRH8JWkZKD
	n+IW3uXSbmmmp9tVL0DOmDjtZafUPTKqhI0XSM7Bf3v4avVSsBaX1ZbnnfvXqiEqb2ZBynsAriZ
	WX5Wu8nOFJ3khslqPPbjwO063qdgeyX4dTaHytg==
X-Google-Smtp-Source: AGHT+IEAYYnLMSMYX29C5d7OC0baHoZTeVIBtMQSoizgnTABsl8GPABdW9osH//DgP0FlB94sx3pHeh6aocwiChlhjg=
X-Received: by 2002:a05:6902:2102:b0:e28:ece9:fb01 with SMTP id
 3f1490d57ef6-e3087a46b15mr4408800276.7.1730058872502; Sun, 27 Oct 2024
 12:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170119.2876289-1-martin.jansa@gmail.com>
In-Reply-To: <20241027170119.2876289-1-martin.jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 27 Oct 2024 12:54:21 -0700
Message-ID: <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] xmlto: backport a patch to fix build with
 gcc-14 on host
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 19:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206412

Unfortunately I'm getting an autobuilder failure with this patch:

https://errors.yoctoproject.org/Errors/Details/810853/

Steve

On Sun, Oct 27, 2024 at 10:01=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> * need to add dependency on flex-native because now when the
>   .l file is modified by the .patch file it will try to regenerate
>   the c code and fail:
>
> | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/b=
uild'
> | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xmlif=
/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.2=
8/missing' flex
> | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 81:=
 flex: command not found
> | WARNING: 'flex' is missing on your system.
> |          You should only need it if you modified a '.l' file.
> |          You may want to install the Fast Lexical Analyzer package:
> |          <https://github.com/westes/flex>
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...001-Fix-return-type-of-main-function.patch | 42 +++++++++++++++++++
>  .../0001-fix-Wimplicit-int-for-ifsense.patch  | 33 +++++++++++++++
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  4 +-
>  3 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-ret=
urn-type-of-main-function.patch
>  create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wim=
plicit-int-for-ifsense.patch
>
> diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-typ=
e-of-main-function.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fi=
x-return-type-of-main-function.patch
> new file mode 100644
> index 0000000000..f28f1fb56a
> --- /dev/null
> +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-ma=
in-function.patch
> @@ -0,0 +1,42 @@
> +From 6347e1b9da2140acdd55e3e7ac1199456793e17c Mon Sep 17 00:00:00 2001
> +From: Thomas Kuehne <thomas@kuehne.cn>
> +Date: Sat, 11 Dec 2021 20:56:00 +0000
> +Subject: [PATCH] Fix return type of main function
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +xmlif/xmlif.l:242:1: warning: return type defaults to =E2=80=98int=E2=80=
=99 [-Wimplicit-int]
> +  242 | main(int argc, char *argv[])
> +      | ^~~~
> +
> +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/8e34f087bf4=
10bcc5fe445933d6ad9bae54f24b5?branch=3Dmaster]
> +---
> + xmlif/xmlif.l | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> +index ac42136..78a62bc 100644
> +--- a/xmlif/xmlif.l
> ++++ b/xmlif/xmlif.l
> +@@ -239,7 +239,7 @@ WS         [ \t\n]*
> +
> + int yywrap() {exit(0);};
> +
> +-main(int argc, char *argv[])
> ++int main(int argc, char *argv[])
> + {
> +     int i;
> +
> +@@ -265,7 +265,7 @@ main(int argc, char *argv[])
> +           exit(1);
> +       }
> +
> +-    yylex();
> ++    return yylex();
> + }
> +
> + /*
> diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-=
int-for-ifsense.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-W=
implicit-int-for-ifsense.patch
> new file mode 100644
> index 0000000000..d5c25ba08a
> --- /dev/null
> +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for=
-ifsense.patch
> @@ -0,0 +1,33 @@
> +From 1375e2df75530cd198bd16ac3de38e2b0d126276 Mon Sep 17 00:00:00 2001
> +From: Thomas Kuehne <thomas@kuehne.cn>
> +Date: Sat, 11 Dec 2021 21:10:41 +0100
> +Subject: [PATCH] fix -Wimplicit-int for ifsense
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fixes:
> +xmlif/xmlif.l:46:8: warning: type defaults to =E2=80=98int=E2=80=99 in d=
eclaration of =E2=80=98ifsense=E2=80=99 [-Wimplicit-int]
> +   46 | static ifsense;                 /* sense of last `if' or unless =
seen */
> +      |        ^~~~~~~
> +
> +Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/1375e2df755=
30cd198bd16ac3de38e2b0d126276?branch=3Dmaster
> +---
> + xmlif/xmlif.l | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
> +index ac42136..6e5970e 100644
> +--- a/xmlif/xmlif.l
> ++++ b/xmlif/xmlif.l
> +@@ -43,7 +43,7 @@
> +
> + static char **selections;     /* selection tokens */
> + static int nselections;               /* number of selections */
> +-static ifsense;                       /* sense of last `if' or unless s=
een */
> ++static int ifsense;           /* sense of last `if' or unless seen */
> + static char *attribute;               /* last attribute scanned */
> +
> + struct stack_t {
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-d=
evtools/xmlto/xmlto_0.0.28.bb
> index 5cb9a4c57b..2c9ee27f82 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b=
29e73d4adb9f9f6552"
>
>  SRC_URI =3D "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
>             file://configure.in-drop-the-test-of-xmllint-and-xsltproc.pat=
ch \
> +           file://0001-Fix-return-type-of-main-function.patch \
> +           file://0001-fix-Wimplicit-int-for-ifsense.patch \
>  "
>  SRC_URI[md5sum] =3D "a1fefad9d83499a15576768f60f847c6"
>  SRC_URI[sha256sum] =3D "2f986b7c9a0e9ac6728147668e776d405465284e13c74d41=
46c9cbc51fd8aad3"
> @@ -16,7 +18,7 @@ inherit autotools
>
>  CLEANBROKEN =3D "1"
>
> -DEPENDS =3D "libxml2-native"
> +DEPENDS =3D "libxml2-native flex-native"
>
>  RDEPENDS:${PN} =3D "docbook-xml-dtd4 \
>                    docbook-xsl-stylesheets \
> --
> 2.47.0
>

