Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747D5C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:45:20 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.19391.1677771912109750050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4FyNQXPb;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id f13so69314422edz.6
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677771910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+NRiWUY3dkPKbep5vxHZRokZBbQDaD/dNLi7g4vWlU=;
        b=4FyNQXPbx5LFJe5aGV04nvDD/B3fPzGU/uIgI1Cvq34Vlyzy57V6RhXfrShl7FIRrW
         HuXBft0WfqhCpb9uurVQCpijAIPtpQm7ECCJId0iXignWUjhpYD65jfhs2qn++GYyTZw
         mXwjbAbide93DhxT/UC0iN6oSv83VZNRQ5rCx6pRh4LFwiZZSz3dn8BLJ0M74pAS5QD3
         RiAIXXUdQJQKWHUoNQJ0DmQx/g7uEqwXcxi/WaOHjuTpo9vu29M0yLzjriFAi8JADKLj
         qiQ6RlZdLL8G1SKSThSrkIMwsDdPXaO5gGbm0p3Uy8AsbiTEe+7k4bnfkiugs4zqpMOz
         h5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677771910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+NRiWUY3dkPKbep5vxHZRokZBbQDaD/dNLi7g4vWlU=;
        b=QAkKPbBgiZ85q5fuc3NwwXTT+7KmYBCOIrQsgf3IMRzhQ/Elt4pHqyB9HMyOhtORQe
         YeCa+oy5xB3CuLwj5ZHoCedTSWy/RU6Xz/DIXCkspfS3yZItWePEgyP+EJqXYGafwSAM
         1SLL8Bkz8XQAh3EkqZUBrFltzO1DwOuzQgA/gGXYeowJXeT9Hlq2WS+iiZvyliY75VEu
         OsvkQSNBRdpou7UUN3e2xJQb8W/aSHhz6TMkCBmj0A2NnUKaGFN6MjJ6w3ZnqhreHRAJ
         N75aWgb0O1KWtFrrVYGsdeUmyM/rC+vLB/hUIOehlWqXhs+XkDpAhLarG9TtTZ+2Y8MZ
         WFvA==
X-Gm-Message-State: AO0yUKUn8c79GYG8ljEVRGZthII7Ck1ELQgAyQrYR/1mf3IN+YRJTmPE
	RBqPKNKiabg4kRPdEbwzpAK5Mt0CGz0ghboxD2tElGI9WzQjl1es
X-Google-Smtp-Source: AK7set+/oGold4t3a3iKPV7WeR+ytWrxMZOU3V9dLZaLAMQPaHkTRTVeXKpOViId9f3q6H9fJjnFpX08vjSsOHuIqqs=
X-Received: by 2002:a50:9fa7:0:b0:4bf:bec0:b865 with SMTP id
 c36-20020a509fa7000000b004bfbec0b865mr1800512edf.3.1677771910328; Thu, 02 Mar
 2023 07:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20230302074816.1017714-1-vkumbhar@mvista.com>
In-Reply-To: <20230302074816.1017714-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Mar 2023 05:44:59 -1000
Message-ID: <CAOSpxdbn43ECHbup99b8hCLJZGZJs6=oYBA84zGAfzwt8wtPCg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] rpm: fix CVE-2021-35938 races with
 chown/chmod/capabilities calls during installation
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 15:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177964

On Wed, Mar 1, 2023 at 9:48=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wrote=
:
>
> Set file metadata via fd-based ops for everything but symlinks
>
> Regular file ops are fd-based already, for the rest we need to open them
> manually. Files with temporary suffix must never be followed, for
> directories (and pre-existing FA_TOUCHed files) use the rpm symlink
> "root or target owner allowed" rule wrt following.
>
> This mostly fixes CVE-2021-35938, but as we're not yet using dirfd-based
> operatiosn for everything there are corner cases left undone. And then
> there's the plugin API which needs updating for all this.

If it only "mostly" fixes the CVE should we be claiming that this
issue is fixed with this patch?

Seems like we would be giving people a false sense of security.

Would appreciate feedback from others on this!

Steve

> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../rpm/files/CVE-2021-35938.patch            | 36 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.17.1.bb       |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-35938.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35938.patch b/meta/=
recipes-devtools/rpm/files/CVE-2021-35938.patch
> new file mode 100644
> index 0000000000..9b2e7ee91f
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/CVE-2021-35938.patch
> @@ -0,0 +1,36 @@
> +From 25a435e90844ea98fe5eb7bef22c1aecf3a9c033 Mon Sep 17 00:00:00 2001
> +From: Panu Matilainen <pmatilai@redhat.com>
> +Date: Mon, 14 Feb 2022 14:29:33 +0200
> +Subject: [PATCH] Set file metadata via fd-based ops for everything but
> + symlinks
> +
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/25a435e90844ea98fe5eb7bef22c1aecf3a9c033]
> +CVE: CVE-2023-25193
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + lib/fsm.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/lib/fsm.c b/lib/fsm.c
> +index 935a0a5c6..50c431d2a 100644
> +--- a/lib/fsm.c
> ++++ b/lib/fsm.c
> +@@ -1000,6 +1000,15 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rp=
mfiles files,
> +                 if (!IS_DEV_LOG(fp->fpath))
> +                     rc =3D RPMERR_UNKNOWN_FILETYPE;
> +             }
> ++
> ++            if (!rc && fd =3D=3D -1 && !S_ISLNK(fp->sb.st_mode)) {
> ++              /* Only follow safe symlinks, and never on temporary file=
s */
> ++              fd =3D fsmOpenat(di.dirfd, fp->fpath,
> ++                              fp->suffix ? AT_SYMLINK_NOFOLLOW : 0);
> ++              if (fd < 0)
> ++                  rc =3D RPMERR_OPEN_FAILED;
> ++          }
> ++
> +       } else if (firstlink && rpmfiArchiveHasContent(fi)) {
> +           /*
> +            * Tricksy case: this file is a being skipped, but it's part =
of
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.17.1.bb
> index 9b6446f265..e12d10c1e9 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.17.x;protoc
>             file://0001-docs-do-not-build-manpages-requires-pandoc.patch =
\
>             file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm=
-me.patch \
>             file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-=
han.patch \
> +           file://CVE-2021-35938.patch \
>             "
>
>  PE =3D "1"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177957): https://lists.openembedded.org/g/openembedde=
d-core/message/177957
> Mute This Topic: https://lists.openembedded.org/mt/97334710/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

