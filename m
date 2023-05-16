Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBEDC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 21:45:55 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.35378.1684273554262855730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 14:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hIQF7cEn;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so57685a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684273552; x=1686865552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsuNzl5IWpIuZRC6TIDKXI+a80C74UDEYKt1c/7MGns=;
        b=hIQF7cEnGYE84ue6iSRFQ+MQ9qLesRzcM3MbdbjMTFGVdOfjV3oRmqyZvzjD5JR3/6
         FLn2t7pEYXgsPa9hI3aiV/wOjxww+qUddXybbr1LwFjeI1Ia/hkO1eMmB1GQMOpkGS1Z
         xK3Z6fh3wPFWMRjOBoKoeleg9z0Z53yCziev4mqLxb5nDPBfFBiCYkh3aIYuLn/Mo2jG
         PmdPbKlSYURessUck4OSfU75ilAuURy8KYV9O1Vf9jKHdJFOHQWvxyneDqUas2bm5Avg
         vvykh9HXjSJu9TVrI1NASaz9BzvH3aQjNI82T/cLjMU0Yqum9oHy3cEFpAQpWXsZW6tz
         MutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684273552; x=1686865552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsuNzl5IWpIuZRC6TIDKXI+a80C74UDEYKt1c/7MGns=;
        b=G1CF9j5FcgH6wAsEn+gAaVJyRKbbofb4XQcWGxROpHCoV69yfRDIYL/QuaaYMQTbUX
         EEbiqy/CsOiNsuKcPxIfl4y4nOHF3GQoYCX4wvGTfyceYJnEPN5eOS+ftuiYrx2a8lQn
         SwzbL4/hOJtOBojCJTlAVQKd9J/lwhxKWHgxpIOxAJL5Ldjgh/Rb3+hQrXYSx5CHpYPh
         hRIQZgAk2O+FqK97u163stOROtuSfNW7bVebf1CVrrhwNmpVQv6pewUqzHlspH5f+ekd
         NiYmRuO46rwXDtk7OeUFqYtMo19U5QULnJS24QHy/zy5MYDDP8iBVq5/HiKyf95ieEsD
         FMsw==
X-Gm-Message-State: AC+VfDz3cQS64HoDo9BkhR92YHgUfWtPkzz7KdKa07DtlXRM2MQXT0LZ
	SJwL/T3+biQ7gxtz/RfBiSwgPIgKMzgjkRpmjdk7rQ==
X-Google-Smtp-Source: ACHHUZ7OSQyXZkj9WVXLo+548KvJQTloFcqf8q7vFW3rXlZmzbGNG4jWtO4b5hjBOo5KHI2mtRtUN1VPQwU2bRhYCbE=
X-Received: by 2002:a17:907:6e07:b0:966:4033:d1dd with SMTP id
 sd7-20020a1709076e0700b009664033d1ddmr30199593ejc.34.1684273552235; Tue, 16
 May 2023 14:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230515052517.29549-1-hprajapati@mvista.com>
In-Reply-To: <20230515052517.29549-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 16 May 2023 11:45:41 -1000
Message-ID: <CAOSpxda7AuB=w+iTCEJXh37fB5ziXpT_-jBd3b+W5qKpj9zz+w@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] git: fix CVE-2023-25652
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 21:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181424

I'm getting patch fuzz errors:

WARNING: git-2.24.4-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-25652.patch
patching file apply.c
Hunk #1 succeeded at 4531 (offset 27 lines).
Hunk #2 succeeded at 4571 (offset 27 lines).
patching file t/t4115-apply-symlink.sh
Hunk #1 succeeded at 125 with fuzz 1 (offset 81 lines).

The context lines in the patches can be updated with devtool:

    devtool modify git
    devtool finish --force-patch-refresh git <layer_path>

Don't forget to review changes done by devtool!

WARNING: git-2.24.4-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

Steve

On Sun, May 14, 2023 at 7:25=E2=80=AFPM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.=
7,
> 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by fe=
eding
> specially crafted input to `git apply --reject`, a path outside the worki=
ng
> tree can be overwritten with partially controlled contents (corresponding=
 to
> the rejected hunk(s) from the given patch). A fix is available in version=
s
> 2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2=
.39.3,
> and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when=
 applying
> patches from an untrusted source. Use `git apply --stat` to inspect a pat=
ch before
> applying; avoid applying one that create a conflict where a link correspo=
nding to
> the `*.rej` file exists.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-25652
>
> Upstream-Status: Backport from https://github.com/git/git/commit/9db05711=
c98efc14f414d4c87135a34c13586e0b
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../git/files/CVE-2023-25652.patch            | 95 +++++++++++++++++++
>  meta/recipes-devtools/git/git.inc             |  1 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-25652.patch
>
> diff --git a/meta/recipes-devtools/git/files/CVE-2023-25652.patch b/meta/=
recipes-devtools/git/files/CVE-2023-25652.patch
> new file mode 100644
> index 0000000000..9dde2626cc
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2023-25652.patch
> @@ -0,0 +1,95 @@
> +From 9db05711c98efc14f414d4c87135a34c13586e0b Mon Sep 17 00:00:00 2001
> +From: Johannes Schindelin <johannes.schindelin@gmx.de>
> +Date: Thu, 9 Mar 2023 16:02:54 +0100
> +Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it
> + exists
> +
> +The `git apply --reject` is expected to write out `.rej` files in case
> +one or more hunks fail to apply cleanly. Historically, the command
> +overwrites any existing `.rej` files. The idea being that
> +apply/reject/edit cycles are relatively common, and the generated `.rej`
> +files are not considered precious.
> +
> +But the command does not overwrite existing `.rej` symbolic links, and
> +instead follows them. This is unsafe because the same patch could
> +potentially create such a symbolic link and point at arbitrary paths
> +outside the current worktree, and `git apply` would write the contents
> +of the `.rej` file into that location.
> +
> +Therefore, let's make sure that any existing `.rej` file or symbolic
> +link is removed before writing it.
> +
> +Reported-by: RyotaK <ryotak.mail@gmail.com>
> +Helped-by: Taylor Blau <me@ttaylorr.com>
> +Helped-by: Junio C Hamano <gitster@pobox.com>
> +Helped-by: Linus Torvalds <torvalds@linuxfoundation.org>
> +Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
> +
> +Upstream-Status: Backport [https://github.com/git/git/commit/9db05711c98=
efc14f414d4c87135a34c13586e0b]
> +CVE: CVE-2023-25652
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + apply.c                  | 14 ++++++++++++--
> + t/t4115-apply-symlink.sh | 15 +++++++++++++++
> + 2 files changed, 27 insertions(+), 2 deletions(-)
> +
> +diff --git a/apply.c b/apply.c
> +index f8a046a..8253173 100644
> +--- a/apply.c
> ++++ b/apply.c
> +@@ -4504,7 +4504,7 @@ static int write_out_one_reject(struct apply_state=
 *state, struct patch *patch)
> +       FILE *rej;
> +       char namebuf[PATH_MAX];
> +       struct fragment *frag;
> +-      int cnt =3D 0;
> ++      int fd, cnt =3D 0;
> +       struct strbuf sb =3D STRBUF_INIT;
> +
> +       for (cnt =3D 0, frag =3D patch->fragments; frag; frag =3D frag->n=
ext) {
> +@@ -4544,7 +4544,17 @@ static int write_out_one_reject(struct apply_stat=
e *state, struct patch *patch)
> +       memcpy(namebuf, patch->new_name, cnt);
> +       memcpy(namebuf + cnt, ".rej", 5);
> +
> +-      rej =3D fopen(namebuf, "w");
> ++      fd =3D open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
> ++      if (fd < 0) {
> ++              if (errno !=3D EEXIST)
> ++                      return error_errno(_("cannot open %s"), namebuf);
> ++              if (unlink(namebuf))
> ++                      return error_errno(_("cannot unlink '%s'"), nameb=
uf);
> ++              fd =3D open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
> ++              if (fd < 0)
> ++                      return error_errno(_("cannot open %s"), namebuf);
> ++      }
> ++      rej =3D fdopen(fd, "w");
> +       if (!rej)
> +               return error_errno(_("cannot open %s"), namebuf);
> +
> +diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
> +index 872fcda..1e9e006 100755
> +--- a/t/t4115-apply-symlink.sh
> ++++ b/t/t4115-apply-symlink.sh
> +@@ -44,4 +44,19 @@ test_expect_success 'apply --index symlink patch' '
> +
> + '
> +
> ++test_expect_success SYMLINKS '--reject removes .rej symlink if it exist=
s' '
> ++      test_when_finished "git reset --hard && git clean -dfx" &&
> ++
> ++      test_commit file &&
> ++      echo modified >file.t &&
> ++      git diff -- file.t >patch &&
> ++      echo modified-again >file.t &&
> ++
> ++      ln -s foo file.t.rej &&
> ++      test_must_fail git apply patch --reject 2>err &&
> ++      test_i18ngrep "Rejected hunk" err &&
> ++      test_path_is_missing foo &&
> ++      test_path_is_file file.t.rej
> ++'
> ++
> + test_done
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index 36318eed20..33da20cd26 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -28,6 +28,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-$=
{PV}.tar.gz;name=3Dtarball \
>             file://CVE-2023-22490-2.patch \
>             file://CVE-2023-22490-3.patch \
>             file://CVE-2023-23946.patch \
> +           file://CVE-2023-25652.patch \
>             "
>  S =3D "${WORKDIR}/git-${PV}"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181228): https://lists.openembedded.org/g/openembedde=
d-core/message/181228
> Mute This Topic: https://lists.openembedded.org/mt/98897685/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

