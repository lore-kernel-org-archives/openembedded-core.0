Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75631C77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:50:22 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.15854.1681491021825935286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 09:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B36HF4Az;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 39-20020a9d04aa000000b006a1370e214aso7300856otm.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491021; x=1684083021;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaX9yFnfoZzyghU+St2wCLBwMtWuBZoDGgBAJNjuatY=;
        b=B36HF4AzspW18u7WS9s1ZkiVB9P42Co9stxmT6gv4YIw2ulI7hz3zgHpDu7Q3Ymtqb
         U6sZp3cONE1z8H956Xdr8wLtVAFobbTDKJE02zul90eZSoUMH3aIR2HTiZ/WhrB3hAJz
         /yty0yP3VoDDcm+l/4sabMNU+tLKG66pjKricTL3dbSlG1o03JpVwJQaEKmjZJobug+2
         42YAswCFN735IrsZcU+M4HqztURAYRbACrK6K9orLlGlbefdJzYRMwugObyniEK/1zwv
         tEZaJxIZYkMUVaCq8qgn4T8Bu4djiqRyGg6VlJ/QzqXYufjGW0pHrOZ1Dc8gI6CMDBwf
         nEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491021; x=1684083021;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaX9yFnfoZzyghU+St2wCLBwMtWuBZoDGgBAJNjuatY=;
        b=KuZFoNJBVg8DRs/Sd79RuN3i7yflxyF1YOvBjW7QpKndcD6I5P2uAYaPEamixXC6ix
         um08ByLZXbZbfIrFH1/uP4iofHct7D7PmpB24KF3Zj3MgiIuinho8SjDcV560jqwfgjE
         mYAm2KbHzeY5/sjYl8CEx+/TROpc/MQdEHi9kQ1lJChwsNx299UR1n9x1bMqHYYkfO6j
         xkrY2a9COkx74IgkXH7ZuXbKDm4v6p0Jt6pnGyL9Ama1ikWsNhvbfgvFEzRFiv1qY02a
         gO5jTRQZfQ6WhCRQ87FtYfzL6dH9+fiMnBIZq5PIFJLWr4XSyUDTaLQJvPIj/yaqbEnN
         KEBA==
X-Gm-Message-State: AAQBX9eMbqxlprtumv7OIonviJLZvlxBrhYkaeANU2FH3b+f+Zfsst8Z
	lnw5iV5YJVN9FsbGmqcfO74GWHctYmP9dmVTz/7N/wOi
X-Google-Smtp-Source: AKy350YKgRuy39+2IvXoGHN2OuUbz8SffY3wioN+29P2I5fgCL6Epv7skk842jN6Wg+NRGI5kAAXJGsmviEkeWs7HtI=
X-Received: by 2002:a05:6830:18f6:b0:69f:573:6113 with SMTP id
 d22-20020a05683018f600b0069f05736113mr1695852otf.2.1681491020785; Fri, 14 Apr
 2023 09:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230414155511.91980-1-raj.khem@gmail.com>
In-Reply-To: <20230414155511.91980-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2023 09:49:54 -0700
Message-ID: <CAMKF1sqeJyQuDJF1Qqxrj+cBwxND70=pNt4OQ7Mswh+0QoqyKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gawk: Disable known ptest fails on musl
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 16:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180004

ignore this set, it does not work.

On Fri, Apr 14, 2023 at 8:55=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Add needed locale rdeps on musl as well.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Delete failing tests on musl
>
>  meta/recipes-extended/gawk/gawk_5.2.1.bb | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-exte=
nded/gawk/gawk_5.2.1.bb
> index e381bad148..bbb26231a1 100644
> --- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
> @@ -62,8 +62,21 @@ do_install_ptest() {
>         rm -f ${D}${PTEST_PATH}/test/timeout.*
>  }
>
> -RDEPENDS:${PN}-ptest +=3D "make"
> +do_install_ptest:append:libc-musl() {
> +       # Reported  https://lists.gnu.org/archive/html/bug-gawk/2021-02/m=
sg00005.html
> +       rm -f ${D}${PTEST_PATH}/test/clos1way6.*
> +       # Needs en_US.UTF-8 but then does not work with musl
> +       rm -f ${D}${PTEST_PATH}/test/backsmalls1.*
> +       # Needs en_US.UTF-8 but then does not work with musl
> +       rm -f ${D}${PTEST_PATH}/test/commas.*
> +       # The below two need LANG=3DC inside the make rule for musl
> +       rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
> +       rm -f ${D}${PTEST_PATH}/test/regx8bit.*
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "make locale-base-en-us"
>
> -RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us locale-ba=
se-en-us.iso-8859-1"
> +RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us.iso-8859-=
1"
> +RDEPENDS:${PN}-ptest:append:libc-musl =3D " musl-locales"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.0
>

