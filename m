Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE42EC761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 03:04:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.15743.1680059048710872795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 20:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lTTr+B0X;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id i5so57924945eda.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680059046; x=1682651046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KImDzPkq0Bs/H8aBj3VYY9L8/895vPDPXbCyorU4QY=;
        b=lTTr+B0X0KQ1m4U/Mc3afDTFw8R2reB059ASHLIOC0oZTsusN+Q0h9KIp+TmEYtYA3
         btMBIoMFc25BIn8a1Qjx5PcktsMQqRplFIYCiuYOz9ljtZqi+MUMHkhY32bkYiLJZwHR
         Ehk2TsVv/ptpelpvREMnEXcq7AxBUjqMgo2QLFaX/HBEIX9uLhovZOQqLKPLfmiu8oD4
         S5MLBLNpCVXir01YzPUuLZbS6/IqddBVE3ijOX89MYadXDODUnkd7ZMKFlEEFPvjXvS2
         N5bDiiagaV5ySRYviwta1hACO+7AD+nzBB23/bEFnBEAArP4Mz7uZKtNukK3SDp2czdD
         GKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680059046; x=1682651046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KImDzPkq0Bs/H8aBj3VYY9L8/895vPDPXbCyorU4QY=;
        b=KrrutyDEb3J9HGb4KuCtb0GH3LjG5QmBOHK3oDIXIpLo2Rx3hRLUMj65N0GyA7mK/s
         DV+db0/V3sSnixAGJs/FKeB2d5awCW6OmiwwycXmfDRgB5hLTJtq6C4Y65Qpho0PPDxS
         hpBdLsZpp1j41DPAX84DQPmL6Ashmy1dnN+tchCsYTiaghVuHabdF1PSRp6gaX0vYbH9
         VPxVR5iBrk3AaQIoMlR5MxgMCUOlwnpUnjmGJdpW1VlPbhshGNTyoQEQJcIjxyqbn+LT
         By0BkBQlxW7XDFPkfDA5/u5Ds705wexyruPOy/za70+gXbmUNBdssPLQXPt++ZzapmuR
         hy0Q==
X-Gm-Message-State: AAQBX9cOSto+YbJGhHLu5I+H1ZjAHN/1VZJ5s1KhL8tR6+LAIWreQAk+
	LQakk6OkCFBGfVBnibOwi4+4fsDWOXhI/F6xRmoFLA==
X-Google-Smtp-Source: AKy350bDTgbwAeEzx2KwqnlBgkjZzOyoUS9uH+y0GpCeae2GAZBLXeAonAW0jL/NwXSxkiLgQEwfUh/f2vqp9/HJ8po=
X-Received: by 2002:a50:cd0b:0:b0:4fc:a484:c6ed with SMTP id
 z11-20020a50cd0b000000b004fca484c6edmr8711049edi.2.1680059045938; Tue, 28 Mar
 2023 20:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230320091151.1118311-1-vanusuri@mvista.com> <CANQUz1-uJuDR_LeVoLyVRjHnPHdN7XMS6YnE_oXebOxJRhhnVw@mail.gmail.com>
In-Reply-To: <CANQUz1-uJuDR_LeVoLyVRjHnPHdN7XMS6YnE_oXebOxJRhhnVw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 28 Mar 2023 17:03:55 -1000
Message-ID: <CAOSpxdasR1MgqHbNY9BSoaR89ig-6ipCxBsHXzEKN-HJKogdAw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] git: Security fix for CVE-2023-22490
 and CVE-2023-23946
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 03:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179258

On Tue, Mar 28, 2023 at 4:49=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Team,
>
> Any update for this patch?

Not sure how I missed this, but I've got it now!

Thanks for the reminder.

Steve

>
> Thanks & Regards,
> Vijay
>
> On Mon, Mar 20, 2023 at 2:42=E2=80=AFPM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Upstream-Status: Backport from
>> https://github.com/git/git/commit/58325b93c5b6212697b088371809e9948fee80=
52
>> &
>> https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293fc=
e9
>> & https://github.com/git/git/commit/bffc762f87ae8d18c6001bf0044a76004245=
754c
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../git/files/CVE-2023-22490-1.patch          | 179 +++++++++++++++++
>>  .../git/files/CVE-2023-22490-2.patch          | 122 ++++++++++++
>>  .../git/files/CVE-2023-22490-3.patch          | 154 +++++++++++++++
>>  .../git/files/CVE-2023-23946.patch            | 184 ++++++++++++++++++
>>  meta/recipes-devtools/git/git.inc             |   4 +
>>  5 files changed, 643 insertions(+)
>>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-1.pat=
ch
>>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-2.pat=
ch
>>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-3.pat=
ch
>>  create mode 100644 meta/recipes-devtools/git/files/CVE-2023-23946.patch
>>
>> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch b/me=
ta/recipes-devtools/git/files/CVE-2023-22490-1.patch
>> new file mode 100644
>> index 0000000000..cc9b448c5c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
>> @@ -0,0 +1,179 @@
>> +From 58325b93c5b6212697b088371809e9948fee8052 Mon Sep 17 00:00:00 2001
>> +From: Taylor Blau <me@ttaylorr.com>
>> +Date: Tue, 24 Jan 2023 19:43:45 -0500
>> +Subject: [PATCH 1/3] t5619: demonstrate clone_local() with ambiguous tr=
ansport
>> +
>> +When cloning a repository, Git must determine (a) what transport
>> +mechanism to use, and (b) whether or not the clone is local.
>> +
>> +Since f38aa83 (use local cloning if insteadOf makes a local URL,
>> +2014-07-17), the latter check happens after the remote has been
>> +initialized, and references the remote's URL instead of the local path.
>> +This is done to make it possible for a `url.<base>.insteadOf` rule to
>> +convert a remote URL into a local one, in which case the `clone_local()=
`
>> +mechanism should be used.
>> +
>> +However, with a specially crafted repository, Git can be tricked into
>> +using a non-local transport while still setting `is_local` to "1" and
>> +using the `clone_local()` optimization. The below test case
>> +demonstrates such an instance, and shows that it can be used to include
>> +arbitrary (known) paths in the working copy of a cloned repository on a
>> +victim's machine[^1], even if local file clones are forbidden by
>> +`protocol.file.allow`.
>> +
>> +This happens in a few parts:
>> +
>> + 1. We first call `get_repo_path()` to see if the remote is a local
>> +    path. If it is, we replace the repo name with its absolute path.
>> +
>> + 2. We then call `transport_get()` on the repo name and decide how to
>> +    access it. If it was turned into an absolute path in the previous
>> +    step, then we should always treat it like a file.
>> +
>> + 3. We use `get_repo_path()` again, and set `is_local` as appropriate.
>> +    But it's already too late to rewrite the repo name as an absolute
>> +    path, since we've already fed it to the transport code.
>> +
>> +The attack works by including a submodule whose URL corresponds to a
>> +path on disk. In the below example, the repository "sub" is reachable
>> +via the dumb HTTP protocol at (something like):
>> +
>> +    http://127.0.0.1:NNNN/dumb/sub.git
>> +
>> +However, the path "http:/127.0.0.1:NNNN/dumb" (that is, a top-level
>> +directory called "http:", then nested directories "127.0.0.1:NNNN", and
>> +"dumb") exists within the repository, too.
>> +
>> +To determine this, it first picks the appropriate transport, which is
>> +dumb HTTP. It then uses the remote's URL in order to determine whether
>> +the repository exists locally on disk. However, the malicious repositor=
y
>> +also contains an embedded stub repository which is the target of a
>> +symbolic link at the local path corresponding to the "sub" repository o=
n
>> +disk (i.e., there is a symbolic link at "http:/127.0.0.1/dumb/sub.git",
>> +pointing to the stub repository via ".git/modules/sub/../../../repo").
>> +
>> +This stub repository fools Git into thinking that a local repository
>> +exists at that URL and thus can be cloned locally. The affected call is
>> +in `get_repo_path()`, which in turn calls `get_repo_path_1()`, which
>> +locates a valid repository at that target.
>> +
>> +This then causes Git to set the `is_local` variable to "1", and in turn
>> +instructs Git to clone the repository using its local clone optimizatio=
n
>> +via the `clone_local()` function.
>> +
>> +The exploit comes into play because the stub repository's top-level
>> +"$GIT_DIR/objects" directory is a symbolic link which can point to an
>> +arbitrary path on the victim's machine. `clone_local()` resolves the
>> +top-level "objects" directory through a `stat(2)` call, meaning that we
>> +read through the symbolic link and copy or hardlink the directory
>> +contents at the destination of the link.
>> +
>> +In other words, we can get steps (1) and (3) to disagree by leveraging
>> +the dangling symlink to pick a non-local transport in the first step,
>> +and then set is_local to "1" in the third step when cloning with
>> +`--separate-git-dir`, which makes the symlink non-dangling.
>> +
>> +This can result in data-exfiltration on the victim's machine when
>> +sensitive data is at a known path (e.g., "/home/$USER/.ssh").
>> +
>> +The appropriate fix is two-fold:
>> +
>> + - Resolve the transport later on (to avoid using the local
>> +   clone optimization with a non-local transport).
>> +
>> + - Avoid reading through the top-level "objects" directory when
>> +   (correctly) using the clone_local() optimization.
>> +
>> +This patch merely demonstrates the issue. The following two patches wil=
l
>> +implement each part of the above fix, respectively.
>> +
>> +[^1]: Provided that any target directory does not contain symbolic
>> +  links, in which case the changes from 6f054f9 (builtin/clone.c:
>> +  disallow `--local` clones with symlinks, 2022-07-28) will abort the
>> +  clone.
>> +
>> +Reported-by: yvvdwf <yvvdwf@gmail.com>
>> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
>> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/git/git/commit/58325b93c5b6212697b088371809e9948fee=
8052]
>> +CVE: CVE-2023-22490
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + t/t5619-clone-local-ambiguous-transport.sh | 63 ++++++++++++++++++++++
>> + 1 file changed, 63 insertions(+)
>> + create mode 100644 t/t5619-clone-local-ambiguous-transport.sh
>> +
>> +diff --git a/t/t5619-clone-local-ambiguous-transport.sh b/t/t5619-clone=
-local-ambiguous-transport.sh
>> +new file mode 100644
>> +index 0000000..7ebd31a
>> +--- /dev/null
>> ++++ b/t/t5619-clone-local-ambiguous-transport.sh
>> +@@ -0,0 +1,63 @@
>> ++#!/bin/sh
>> ++
>> ++test_description=3D'test local clone with ambiguous transport'
>> ++
>> ++. ./test-lib.sh
>> ++. "$TEST_DIRECTORY/lib-httpd.sh"
>> ++
>> ++if ! test_have_prereq SYMLINKS
>> ++then
>> ++      skip_all=3D'skipping test, symlink support unavailable'
>> ++      test_done
>> ++fi
>> ++
>> ++start_httpd
>> ++
>> ++REPO=3D"$HTTPD_DOCUMENT_ROOT_PATH/sub.git"
>> ++URI=3D"$HTTPD_URL/dumb/sub.git"
>> ++
>> ++test_expect_success 'setup' '
>> ++      mkdir -p sensitive &&
>> ++      echo "secret" >sensitive/secret &&
>> ++
>> ++      git init --bare "$REPO" &&
>> ++      test_commit_bulk -C "$REPO" --ref=3Dmain 1 &&
>> ++
>> ++      git -C "$REPO" update-ref HEAD main &&
>> ++      git -C "$REPO" update-server-info &&
>> ++
>> ++      git init malicious &&
>> ++      (
>> ++              cd malicious &&
>> ++
>> ++              git submodule add "$URI" &&
>> ++
>> ++              mkdir -p repo/refs &&
>> ++              touch repo/refs/.gitkeep &&
>> ++              printf "ref: refs/heads/a" >repo/HEAD &&
>> ++              ln -s "$(cd .. && pwd)/sensitive" repo/objects &&
>> ++
>> ++              mkdir -p "$HTTPD_URL/dumb" &&
>> ++              ln -s "../../../.git/modules/sub/../../../repo/" "$URI" =
&&
>> ++
>> ++              git add . &&
>> ++              git commit -m "initial commit"
>> ++      ) &&
>> ++
>> ++      # Delete all of the references in our malicious submodule to
>> ++      # avoid the client attempting to checkout any objects (which
>> ++      # will be missing, and thus will cause the clone to fail before
>> ++      # we can trigger the exploit).
>> ++      git -C "$REPO" for-each-ref --format=3D"delete %(refname)" >in &=
&
>> ++      git -C "$REPO" update-ref --stdin <in &&
>> ++      git -C "$REPO" update-server-info
>> ++'
>> ++
>> ++test_expect_failure 'ambiguous transport does not lead to arbitrary fi=
le-inclusion' '
>> ++      git clone malicious clone &&
>> ++      git -C clone submodule update --init &&
>> ++
>> ++      test_path_is_missing clone/.git/modules/sub/objects/secret
>> ++'
>> ++
>> ++test_done
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch b/me=
ta/recipes-devtools/git/files/CVE-2023-22490-2.patch
>> new file mode 100644
>> index 0000000000..0b5b40f827
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
>> @@ -0,0 +1,122 @@
>> +From cf8f6ce02a13f4d1979a53241afbee15a293fce9 Mon Sep 17 00:00:00 2001
>> +From: Taylor Blau <me@ttaylorr.com>
>> +Date: Tue, 24 Jan 2023 19:43:48 -0500
>> +Subject: [PATCH 2/3] clone: delay picking a transport until after get_r=
epo_path()
>> +
>> +In the previous commit, t5619 demonstrates an issue where two calls to
>> +`get_repo_path()` could trick Git into using its local clone mechanism
>> +in conjunction with a non-local transport.
>> +
>> +That sequence is:
>> +
>> + - the starting state is that the local path https:/example.com/foo is =
a
>> +   symlink that points to ../../../.git/modules/foo. So it's dangling.
>> +
>> + - get_repo_path() sees that no such path exists (because it's
>> +   dangling), and thus we do not canonicalize it into an absolute path
>> +
>> + - because we're using --separate-git-dir, we create .git/modules/foo.
>> +   Now our symlink is no longer dangling!
>> +
>> + - we pass the url to transport_get(), which sees it as an https URL.
>> +
>> + - we call get_repo_path() again, on the url. This second call was
>> +   introduced by f38aa83 (use local cloning if insteadOf makes a
>> +   local URL, 2014-07-17). The idea is that we want to pull the url
>> +   fresh from the remote.c API, because it will apply any aliases.
>> +
>> +And of course now it sees that there is a local file, which is a
>> +mismatch with the transport we already selected.
>> +
>> +The issue in the above sequence is calling `transport_get()` before
>> +deciding whether or not the repository is indeed local, and not passing
>> +in an absolute path if it is local.
>> +
>> +This is reminiscent of a similar bug report in [1], where it was
>> +suggested to perform the `insteadOf` lookup earlier. Taking that
>> +approach may not be as straightforward, since the intent is to store th=
e
>> +original URL in the config, but to actually fetch from the insteadOf
>> +one, so conflating the two early on is a non-starter.
>> +
>> +Note: we pass the path returned by `get_repo_path(remote->url[0])`,
>> +which should be the same as `repo_name` (aside from any `insteadOf`
>> +rewrites).
>> +
>> +We *could* pass `absolute_pathdup()` of the same argument, which
>> +86521ac (Bring local clone's origin URL in line with that of a remote
>> +clone, 2008-09-01) indicates may differ depending on the presence of
>> +".git/" for a non-bare repo. That matters for forming relative submodul=
e
>> +paths, but doesn't matter for the second call, since we're just feeding
>> +it to the transport code, which is fine either way.
>> +
>> +[1]: https://lore.kernel.org/git/CAMoD=3DBi41mB3QRn3JdZL-FGHs4w3C2jGpnJ=
B-CqSndO7FMtfzA@mail.gmail.com/
>> +
>> +Signed-off-by: Jeff King <peff@peff.net>
>> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
>> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/git/git/commit/cf8f6ce02a13f4d1979a53241afbee15a293=
fce9]
>> +CVE: CVE-2023-22490
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + builtin/clone.c                            |  8 ++++----
>> + t/t5619-clone-local-ambiguous-transport.sh | 15 +++++++++++----
>> + 2 files changed, 15 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/builtin/clone.c b/builtin/clone.c
>> +index 53e04b1..b57e703 100644
>> +--- a/builtin/clone.c
>> ++++ b/builtin/clone.c
>> +@@ -1112,10 +1112,6 @@ int cmd_clone(int argc, const char **argv, const=
 char *prefix)
>> +                   branch_top.buf);
>> +       refspec_append(&remote->fetch, default_refspec.buf);
>> +
>> +-      transport =3D transport_get(remote, remote->url[0]);
>> +-      transport_set_verbosity(transport, option_verbosity, option_prog=
ress);
>> +-      transport->family =3D family;
>> +-
>> +       path =3D get_repo_path(remote->url[0], &is_bundle);
>> +       is_local =3D option_local !=3D 0 && path && !is_bundle;
>> +       if (is_local) {
>> +@@ -1135,6 +1131,10 @@ int cmd_clone(int argc, const char **argv, const=
 char *prefix)
>> +       }
>> +       if (option_local > 0 && !is_local)
>> +               warning(_("--local is ignored"));
>> ++
>> ++      transport =3D transport_get(remote, path ? path : remote->url[0]=
);
>> ++      transport_set_verbosity(transport, option_verbosity, option_prog=
ress);
>> ++      transport->family =3D family;
>> +       transport->cloning =3D 1;
>> +
>> +       transport_set_option(transport, TRANS_OPT_KEEP, "yes");
>> +diff --git a/t/t5619-clone-local-ambiguous-transport.sh b/t/t5619-clone=
-local-ambiguous-transport.sh
>> +index 7ebd31a..cce62bf 100644
>> +--- a/t/t5619-clone-local-ambiguous-transport.sh
>> ++++ b/t/t5619-clone-local-ambiguous-transport.sh
>> +@@ -53,11 +53,18 @@ test_expect_success 'setup' '
>> +       git -C "$REPO" update-server-info
>> + '
>> +
>> +-test_expect_failure 'ambiguous transport does not lead to arbitrary fi=
le-inclusion' '
>> ++test_expect_success 'ambiguous transport does not lead to arbitrary fi=
le-inclusion' '
>> +       git clone malicious clone &&
>> +-      git -C clone submodule update --init &&
>> +-
>> +-      test_path_is_missing clone/.git/modules/sub/objects/secret
>> ++      test_must_fail git -C clone submodule update --init 2>err &&
>> ++
>> ++      test_path_is_missing clone/.git/modules/sub/objects/secret &&
>> ++      # We would actually expect "transport .file. not allowed" here,
>> ++      # but due to quirks of the URL detection in Git, we mis-parse
>> ++      # the absolute path as a bogus URL and die before that step.
>> ++      #
>> ++      # This works for now, and if we ever fix the URL detection, it
>> ++      # is OK to change this to detect the transport error.
>> ++      grep "protocol .* is not supported" err
>> + '
>> +
>> + test_done
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch b/me=
ta/recipes-devtools/git/files/CVE-2023-22490-3.patch
>> new file mode 100644
>> index 0000000000..08fb7f840b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
>> @@ -0,0 +1,154 @@
>> +From bffc762f87ae8d18c6001bf0044a76004245754c Mon Sep 17 00:00:00 2001
>> +From: Taylor Blau <me@ttaylorr.com>
>> +Date: Tue, 24 Jan 2023 19:43:51 -0500
>> +Subject: [PATCH 3/3] dir-iterator: prevent top-level symlinks without F=
OLLOW_SYMLINKS
>> +
>> +When using the dir_iterator API, we first stat(2) the base path, and
>> +then use that as a starting point to enumerate the directory's contents=
.
>> +
>> +If the directory contains symbolic links, we will immediately die() upo=
n
>> +encountering them without the `FOLLOW_SYMLINKS` flag. The same is not
>> +true when resolving the top-level directory, though.
>> +
>> +As explained in a previous commit, this oversight in 6f054f9
>> +(builtin/clone.c: disallow `--local` clones with symlinks, 2022-07-28)
>> +can be used as an attack vector to include arbitrary files on a victim'=
s
>> +filesystem from outside of the repository.
>> +
>> +Prevent resolving top-level symlinks unless the FOLLOW_SYMLINKS flag is
>> +given, which will cause clones of a repository with a symlink'd
>> +"$GIT_DIR/objects" directory to fail.
>> +
>> +Signed-off-by: Taylor Blau <me@ttaylorr.com>
>> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/git/git/commit/bffc762f87ae8d18c6001bf0044a76004245=
754c]
>> +CVE: CVE-2023-22490
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + dir-iterator.c             | 13 +++++++++----
>> + dir-iterator.h             |  5 +++++
>> + t/t0066-dir-iterator.sh    | 27 ++++++++++++++++++++++++++-
>> + t/t5604-clone-reference.sh | 16 ++++++++++++++++
>> + 4 files changed, 56 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/dir-iterator.c b/dir-iterator.c
>> +index b17e9f9..3764dd8 100644
>> +--- a/dir-iterator.c
>> ++++ b/dir-iterator.c
>> +@@ -203,7 +203,7 @@ struct dir_iterator *dir_iterator_begin(const char =
*path, unsigned int flags)
>> + {
>> +       struct dir_iterator_int *iter =3D xcalloc(1, sizeof(*iter));
>> +       struct dir_iterator *dir_iterator =3D &iter->base;
>> +-      int saved_errno;
>> ++      int saved_errno, err;
>> +
>> +       strbuf_init(&iter->base.path, PATH_MAX);
>> +       strbuf_addstr(&iter->base.path, path);
>> +@@ -213,10 +213,15 @@ struct dir_iterator *dir_iterator_begin(const cha=
r *path, unsigned int flags)
>> +       iter->flags =3D flags;
>> +
>> +       /*
>> +-       * Note: stat already checks for NULL or empty strings and
>> +-       * inexistent paths.
>> ++       * Note: stat/lstat already checks for NULL or empty strings and
>> ++       * nonexistent paths.
>> +        */
>> +-      if (stat(iter->base.path.buf, &iter->base.st) < 0) {
>> ++      if (iter->flags & DIR_ITERATOR_FOLLOW_SYMLINKS)
>> ++              err =3D stat(iter->base.path.buf, &iter->base.st);
>> ++      else
>> ++              err =3D lstat(iter->base.path.buf, &iter->base.st);
>> ++
>> ++      if (err < 0) {
>> +               saved_errno =3D errno;
>> +               goto error_out;
>> +       }
>> +diff --git a/dir-iterator.h b/dir-iterator.h
>> +index 0822915..e3b6ff2 100644
>> +--- a/dir-iterator.h
>> ++++ b/dir-iterator.h
>> +@@ -61,6 +61,11 @@
>> +  *   not the symlinks themselves, which is the default behavior. Broke=
n
>> +  *   symlinks are ignored.
>> +  *
>> ++ *   Note: setting DIR_ITERATOR_FOLLOW_SYMLINKS affects resolving the
>> ++ *   starting path as well (e.g., attempting to iterate starting at a
>> ++ *   symbolic link pointing to a directory without FOLLOW_SYMLINKS wil=
l
>> ++ *   result in an error).
>> ++ *
>> +  * Warning: circular symlinks are also followed when
>> +  * DIR_ITERATOR_FOLLOW_SYMLINKS is set. The iteration may end up with
>> +  * an ELOOP if they happen and DIR_ITERATOR_PEDANTIC is set.
>> +diff --git a/t/t0066-dir-iterator.sh b/t/t0066-dir-iterator.sh
>> +index 92910e4..c826f60 100755
>> +--- a/t/t0066-dir-iterator.sh
>> ++++ b/t/t0066-dir-iterator.sh
>> +@@ -109,7 +109,9 @@ test_expect_success SYMLINKS 'setup dirs with symli=
nks' '
>> +       mkdir -p dir5/a/c &&
>> +       ln -s ../c dir5/a/b/d &&
>> +       ln -s ../ dir5/a/b/e &&
>> +-      ln -s ../../ dir5/a/b/f
>> ++      ln -s ../../ dir5/a/b/f &&
>> ++
>> ++      ln -s dir4 dir6
>> + '
>> +
>> + test_expect_success SYMLINKS 'dir-iterator should not follow symlinks =
by default' '
>> +@@ -145,4 +147,27 @@ test_expect_success SYMLINKS 'dir-iterator should =
follow symlinks w/ follow flag
>> +       test_cmp expected-follow-sorted-output actual-follow-sorted-outp=
ut
>> + '
>> +
>> ++test_expect_success SYMLINKS 'dir-iterator does not resolve top-level =
symlinks' '
>> ++      test_must_fail test-tool dir-iterator ./dir6 >out &&
>> ++
>> ++      grep "ENOTDIR" out
>> ++'
>> ++
>> ++test_expect_success SYMLINKS 'dir-iterator resolves top-level symlinks=
 w/ follow flag' '
>> ++      cat >expected-follow-sorted-output <<-EOF &&
>> ++      [d] (a) [a] ./dir6/a
>> ++      [d] (a/f) [f] ./dir6/a/f
>> ++      [d] (a/f/c) [c] ./dir6/a/f/c
>> ++      [d] (b) [b] ./dir6/b
>> ++      [d] (b/c) [c] ./dir6/b/c
>> ++      [f] (a/d) [d] ./dir6/a/d
>> ++      [f] (a/e) [e] ./dir6/a/e
>> ++      EOF
>> ++
>> ++      test-tool dir-iterator --follow-symlinks ./dir6 >out &&
>> ++      sort out >actual-follow-sorted-output &&
>> ++
>> ++      test_cmp expected-follow-sorted-output actual-follow-sorted-outp=
ut
>> ++'
>> ++
>> + test_done
>> +diff --git a/t/t5604-clone-reference.sh b/t/t5604-clone-reference.sh
>> +index 4894237..615b981 100755
>> +--- a/t/t5604-clone-reference.sh
>> ++++ b/t/t5604-clone-reference.sh
>> +@@ -354,4 +354,20 @@ test_expect_success SYMLINKS 'clone repo with syml=
inked or unknown files at obje
>> +       test_must_be_empty T--shared.objects-symlinks.raw
>> + '
>> +
>> ++test_expect_success SYMLINKS 'clone repo with symlinked objects direct=
ory' '
>> ++      test_when_finished "rm -fr sensitive malicious" &&
>> ++
>> ++      mkdir -p sensitive &&
>> ++      echo "secret" >sensitive/file &&
>> ++
>> ++      git init malicious &&
>> ++      rm -fr malicious/.git/objects &&
>> ++      ln -s "$(pwd)/sensitive" ./malicious/.git/objects &&
>> ++
>> ++      test_must_fail git clone --local malicious clone 2>err &&
>> ++
>> ++      test_path_is_missing clone &&
>> ++      grep "failed to start iterator over" err
>> ++'
>> ++
>> + test_done
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/git/files/CVE-2023-23946.patch b/meta=
/recipes-devtools/git/files/CVE-2023-23946.patch
>> new file mode 100644
>> index 0000000000..3629ff57b2
>> --- /dev/null
>> +++ b/meta/recipes-devtools/git/files/CVE-2023-23946.patch
>> @@ -0,0 +1,184 @@
>> +From fade728df1221598f42d391cf377e9e84a32053f Mon Sep 17 00:00:00 2001
>> +From: Patrick Steinhardt <ps@pks.im>
>> +Date: Thu, 2 Feb 2023 11:54:34 +0100
>> +Subject: [PATCH] apply: fix writing behind newly created symbolic links
>> +
>> +When writing files git-apply(1) initially makes sure that none of the
>> +files it is about to create are behind a symlink:
>> +
>> +```
>> + $ git init repo
>> + Initialized empty Git repository in /tmp/repo/.git/
>> + $ cd repo/
>> + $ ln -s dir symlink
>> + $ git apply - <<EOF
>> + diff --git a/symlink/file b/symlink/file
>> + new file mode 100644
>> + index 0000000..e69de29
>> + EOF
>> + error: affected file 'symlink/file' is beyond a symbolic link
>> +```
>> +
>> +This safety mechanism is crucial to ensure that we don't write outside
>> +of the repository's working directory. It can be fooled though when the
>> +patch that is being applied creates the symbolic link in the first
>> +place, which can lead to writing files in arbitrary locations.
>> +
>> +Fix this by checking whether the path we're about to create is
>> +beyond a symlink or not. Tightening these checks like this should be
>> +fine as we already have these precautions in Git as explained
>> +above. Ideally, we should update the check we do up-front before
>> +starting to reflect the computed changes to the working tree so that
>> +we catch this case as well, but as part of embargoed security work,
>> +adding an equivalent check just before we try to write out a file
>> +should serve us well as a reasonable first step.
>> +
>> +Digging back into history shows that this vulnerability has existed
>> +since at least Git v2.9.0. As Git v2.8.0 and older don't build on my
>> +system anymore I cannot tell whether older versions are affected, as
>> +well.
>> +
>> +Reported-by: Joern Schneeweisz <jschneeweisz@gitlab.com>
>> +Signed-off-by: Patrick Steinhardt <ps@pks.im>
>> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/git/git/commit/fade728df1221598f42d391cf377e9e84a32=
053f]
>> +CVE: CVE-2023-23946
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + apply.c                  | 27 ++++++++++++++
>> + t/t4115-apply-symlink.sh | 81 ++++++++++++++++++++++++++++++++++++++++
>> + 2 files changed, 108 insertions(+)
>> +
>> +diff --git a/apply.c b/apply.c
>> +index f8a046a..4f303bf 100644
>> +--- a/apply.c
>> ++++ b/apply.c
>> +@@ -4373,6 +4373,33 @@ static int create_one_file(struct apply_state *s=
tate,
>> +       if (state->cached)
>> +               return 0;
>> +
>> ++      /*
>> ++       * We already try to detect whether files are beyond a symlink i=
n our
>> ++       * up-front checks. But in the case where symlinks are created b=
y any
>> ++       * of the intermediate hunks it can happen that our up-front che=
cks
>> ++       * didn't yet see the symlink, but at the point of arriving here=
 there
>> ++       * in fact is one. We thus repeat the check for symlinks here.
>> ++       *
>> ++       * Note that this does not make the up-front check obsolete as t=
he
>> ++       * failure mode is different:
>> ++       *
>> ++       * - The up-front checks cause us to abort before we have writte=
n
>> ++       *   anything into the working directory. So when we exit this w=
ay the
>> ++       *   working directory remains clean.
>> ++       *
>> ++       * - The checks here happen in the middle of the action where we=
 have
>> ++       *   already started to apply the patch. The end result will be =
a dirty
>> ++       *   working directory.
>> ++       *
>> ++       * Ideally, we should update the up-front checks to catch what w=
ould
>> ++       * happen when we apply the patch before we damage the working t=
ree.
>> ++       * We have all the information necessary to do so.  But for now,=
 as a
>> ++       * part of embargoed security work, having this check would serv=
e as a
>> ++       * reasonable first step.
>> ++       */
>> ++      if (path_is_beyond_symlink(state, path))
>> ++              return error(_("affected file '%s' is beyond a symbolic =
link"), path);
>> ++
>> +       res =3D try_create_file(state, path, mode, buf, size);
>> +       if (res < 0)
>> +               return -1;
>> +diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
>> +index 872fcda..1acb7b2 100755
>> +--- a/t/t4115-apply-symlink.sh
>> ++++ b/t/t4115-apply-symlink.sh
>> +@@ -44,4 +44,85 @@ test_expect_success 'apply --index symlink patch' '
>> +
>> + '
>> +
>> ++test_expect_success 'symlink setup' '
>> ++      ln -s .git symlink &&
>> ++      git add symlink &&
>> ++      git commit -m "add symlink"
>> ++'
>> ++
>> ++test_expect_success SYMLINKS 'symlink escape when creating new files' =
'
>> ++      test_when_finished "git reset --hard && git clean -dfx" &&
>> ++
>> ++      cat >patch <<-EOF &&
>> ++      diff --git a/symlink b/renamed-symlink
>> ++      similarity index 100%
>> ++      rename from symlink
>> ++      rename to renamed-symlink
>> ++      --
>> ++      diff --git /dev/null b/renamed-symlink/create-me
>> ++      new file mode 100644
>> ++      index 0000000..039727e
>> ++      --- /dev/null
>> ++      +++ b/renamed-symlink/create-me
>> ++      @@ -0,0 +1,1 @@
>> ++      +busted
>> ++      EOF
>> ++
>> ++      test_must_fail git apply patch 2>stderr &&
>> ++      cat >expected_stderr <<-EOF &&
>> ++      error: affected file ${SQ}renamed-symlink/create-me${SQ} is beyo=
nd a symbolic link
>> ++      EOF
>> ++      test_cmp expected_stderr stderr &&
>> ++      ! test_path_exists .git/create-me
>> ++'
>> ++
>> ++test_expect_success SYMLINKS 'symlink escape when modifying file' '
>> ++      test_when_finished "git reset --hard && git clean -dfx" &&
>> ++      touch .git/modify-me &&
>> ++
>> ++      cat >patch <<-EOF &&
>> ++      diff --git a/symlink b/renamed-symlink
>> ++      similarity index 100%
>> ++      rename from symlink
>> ++      rename to renamed-symlink
>> ++      --
>> ++      diff --git a/renamed-symlink/modify-me b/renamed-symlink/modify-=
me
>> ++      index 1111111..2222222 100644
>> ++      --- a/renamed-symlink/modify-me
>> ++      +++ b/renamed-symlink/modify-me
>> ++      @@ -0,0 +1,1 @@
>> ++      +busted
>> ++      EOF
>> ++
>> ++      test_must_fail git apply patch 2>stderr &&
>> ++      cat >expected_stderr <<-EOF &&
>> ++      error: renamed-symlink/modify-me: No such file or directory
>> ++      EOF
>> ++      test_cmp expected_stderr stderr &&
>> ++      test_must_be_empty .git/modify-me
>> ++'
>> ++
>> ++test_expect_success SYMLINKS 'symlink escape when deleting file' '
>> ++      test_when_finished "git reset --hard && git clean -dfx && rm .gi=
t/delete-me" &&
>> ++      touch .git/delete-me &&
>> ++
>> ++      cat >patch <<-EOF &&
>> ++      diff --git a/symlink b/renamed-symlink
>> ++      similarity index 100%
>> ++      rename from symlink
>> ++      rename to renamed-symlink
>> ++      --
>> ++      diff --git a/renamed-symlink/delete-me b/renamed-symlink/delete-=
me
>> ++      deleted file mode 100644
>> ++      index 1111111..0000000 100644
>> ++      EOF
>> ++
>> ++      test_must_fail git apply patch 2>stderr &&
>> ++      cat >expected_stderr <<-EOF &&
>> ++      error: renamed-symlink/delete-me: No such file or directory
>> ++      EOF
>> ++      test_cmp expected_stderr stderr &&
>> ++      test_path_is_file .git/delete-me
>> ++'
>> ++
>> + test_done
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/g=
it/git.inc
>> index 3c4c0fd37b..5eca2e21bf 100644
>> --- a/meta/recipes-devtools/git/git.inc
>> +++ b/meta/recipes-devtools/git/git.inc
>> @@ -24,6 +24,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git=
-${PV}.tar.gz;name=3Dtarball \
>>             file://CVE-2022-41903-10.patch \
>>             file://CVE-2022-41903-11.patch \
>>             file://CVE-2022-41903-12.patch \
>> +           file://CVE-2023-22490-1.patch \
>> +           file://CVE-2023-22490-2.patch \
>> +           file://CVE-2023-22490-3.patch \
>> +           file://CVE-2023-23946.patch \
>>             "
>>  S =3D "${WORKDIR}/git-${PV}"
>>
>> --
>> 2.25.1
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179257): https://lists.openembedded.org/g/openembedde=
d-core/message/179257
> Mute This Topic: https://lists.openembedded.org/mt/97727285/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

