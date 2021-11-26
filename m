Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E666C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 22:45:19 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.30111.1637966713162924866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 14:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qZf1Ekct;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id f9so23655615ybq.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7xkJ61fF97jIGWqmPMkV5TkBx0G6UrDqkl/LaD8Kw1c=;
        b=qZf1EkctfziODkczUUKVWkLfESUuEtcYaYW6VlgtipiG9SMNZtUi4RLDBjaiL95t3Z
         VmtfTYSVqYdLB3Hf+E3z2qilJ3fhRVtsDD4/5dhbbom+DCnIunvcfD642X6kUxbFUWdb
         +W9vD3vVXAKEGgT1dz8S5nPMeqkkAFX5jZjtc8mIygMv9yOGpQ+lfgEUPcVpeR+t7mUH
         JWeJsTv6iWClkGQBqdgMJaTgjuaP8Jvobb9KYq6Cc3cP4xll0/6Fsq/tlGyZDDJ5IlJC
         QFPx1t9N4kWv5iBKc644De7Ax8IA6bG4a9YDeO5rmL97xhAws9JVaF9EpfiVb3f4vadj
         Vd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7xkJ61fF97jIGWqmPMkV5TkBx0G6UrDqkl/LaD8Kw1c=;
        b=3mZNlnQCx3Q/TKckIQ1bo7mRGOiHMqYgAi4W9hqPa6BDuXZLZ8N8HiqAH3fp5KgRqq
         YoN4VAarPPK4I/TRaB1DYsVASMTORkKMIniVyOgeEAyNfH1F9AJAufI82Mp8FVqiCD9P
         BHAp0kjMXKWVFNokOpAj4fBWAiAve3vkXvc27oRD4/Jbf+WlePr0YCCS2RrnoxbOvTMw
         NL90ulX7ylDDc7dkB7zqaiGNl/C1Yw6jl2aUEMTPz3Dnwvw61Fo/dGUJHCIW4HxbO+l0
         JcF82bnIPBccDv7jRM/v9PrcAyU83BOSPD7ZGg8qL03xa7DZD65qFw9qX40qnMHuXISm
         2Nzw==
X-Gm-Message-State: AOAM531WDMU13ubJXuF2N0nr+hm0+4+FIFukLAVl/vsZdq1JyLjAWj4V
	JO1kP/V4pDXZqAF9cG80Vhoe8jkygL29rTxMmTo=
X-Google-Smtp-Source: 
 ABdhPJzIM62bITl/3+HMacWRiafmmYpwXcQFCC+jGw78SHCzza1la3Nd760NaxCPifzTDVtSiVEsBdPzrKpe2x9F4W8=
X-Received: by 2002:a25:903:: with SMTP id 3mr18858036ybj.378.1637966712261;
 Fri, 26 Nov 2021 14:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20211125104912.1704-1-flowergom@gmail.com>
In-Reply-To: <20211125104912.1704-1-flowergom@gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Fri, 26 Nov 2021 12:45:01 -1000
Message-ID: 
 <CAGDS+nkUY+72V-RYWBk7aHkuiX6y1njC7oAve93neZd_nOt7bA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] git: fix CVE-2021-40330
To: Minjae Kim <flowergom@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 22:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158844

On Thu, Nov 25, 2021 at 12:49 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> git_connect_git in connect.c in Git before 2.30.1 allows a repository path to contain a newline character,
> which may result in unexpected cross-protocol requests,
> as demonstrated by the git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 substring.
>
> Upstream-Status: Backport [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
> CVE: CVE-2021-40330
> Signed-off-by: Minjae Kim <flowergom@gmail.com>
> ---
>  .../git/files/CVE-2021-40330.patch            | 108 ++++++++++++++++++

This patch file will not apply:

ERROR: git-2.24.3-r0 do_patch: Applying patch 'CVE-2021-40330.patch'
on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/git/2.24.3-r0/git-2.24.3'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/git/2.24.3-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2021-40330.patch
patching file connect.c
Hunk #1 FAILED at 1064.
1 out of 1 hunk FAILED -- rejects in file connect.c
patching file t/t5570-git-daemon.sh
Hunk #1 succeeded at 103 with fuzz 1.
Patch CVE-2021-40330.patch does not apply (enforce with -f)
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/git/2.24.3-r0/temp/log.do_patch.298303
ERROR: Task (/home/steve/builds/poky-contrib/meta/recipes-devtools/git/git_2.24.3.bb:do_patch)
failed with exit code '1'

Taking a closer look at this, it seems there are two issues.  The
first is that your mailer (?) is changing tabs to spaces, and this is
why the patch won't apply.

There is a second more minor issue -- there is a fuzz of 1 in the second hunk.

I can fix these issues if you like, but it might be good for you to
track down why this is happening so it isn't an issue with future
patches you submit to the list.

Let me know what you prefer!

Steve
>  meta/recipes-devtools/git/git.inc             |   4 +-
>  2 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/git/files/CVE-2021-40330.patch
>
> diff --git a/meta/recipes-devtools/git/files/CVE-2021-40330.patch b/meta/recipes-devtools/git/files/CVE-2021-40330.patch
> new file mode 100644
> index 0000000000..282cd3fbe5
> --- /dev/null
> +++ b/meta/recipes-devtools/git/files/CVE-2021-40330.patch
> @@ -0,0 +1,108 @@
> +From e77ca0c7d577408878d2b3e8c7336e6119cb3931 Mon Sep 17 00:00:00 2001
> +From: Minjae Kim <flowergom@gmail.com>
> +Date: Thu, 25 Nov 2021 06:36:26 +0000
> +Subject: [PATCH] git_connect_git(): forbid newlines in host and path
> +
> +When we connect to a git:// server, we send an initial request that
> +looks something like:
> +
> +  002dgit-upload-pack repo.git\0host=example.com
> +
> +If the repo path contains a newline, then it's included literally, and
> +we get:
> +
> +  002egit-upload-pack repo
> +  .git\0host=example.com
> +
> +This works fine if you really do have a newline in your repository name;
> +the server side uses the pktline framing to parse the string, not
> +newlines. However, there are many _other_ protocols in the wild that do
> +parse on newlines, such as HTTP. So a carefully constructed git:// URL
> +can actually turn into a valid HTTP request. For example:
> +
> +  git://localhost:1234/%0d%0a%0d%0aGET%20/%20HTTP/1.1 %0d%0aHost:localhost%0d%0a%0d%0a
> +
> +becomes:
> +
> +  0050git-upload-pack /
> +  GET / HTTP/1.1
> +  Host:localhost
> +
> +  host=localhost:1234
> +
> +on the wire. Again, this isn't a problem for a real Git server, but it
> +does mean that feeding a malicious URL to Git (e.g., through a
> +submodule) can cause it to make unexpected cross-protocol requests.
> +Since repository names with newlines are presumably quite rare (and
> +indeed, we already disallow them in git-over-http), let's just disallow
> +them over this protocol.
> +
> +Hostnames could likewise inject a newline, but this is unlikely a
> +problem in practice; we'd try resolving the hostname with a newline in
> +it, which wouldn't work. Still, it doesn't hurt to err on the side of
> +caution there, since we would not expect them to work in the first
> +place.
> +
> +The ssh and local code paths are unaffected by this patch. In both cases
> +we're trying to run upload-pack via a shell, and will quote the newline
> +so that it makes it intact. An attacker can point an ssh url at an
> +arbitrary port, of course, but unless there's an actual ssh server
> +there, we'd never get as far as sending our shell command anyway.  We
> +_could_ similarly restrict newlines in those protocols out of caution,
> +but there seems little benefit to doing so.
> +
> +The new test here is run alongside the git-daemon tests, which cover the
> +same protocol, but it shouldn't actually contact the daemon at all.  In
> +theory we could make the test more robust by setting up an actual
> +repository with a newline in it (so that our clone would succeed if our
> +new check didn't kick in). But a repo directory with newline in it is
> +likely not portable across all filesystems. Likewise, we could check
> +git-daemon's log that it was not contacted at all, but we do not
> +currently record the log (and anyway, it would make the test racy with
> +the daemon's log write). We'll just check the client-side stderr to make
> +sure we hit the expected code path.
> +
> +Reported-by: Harold Kim <h.kim@flatt.tech>
> +Signed-off-by: Jeff King <peff@peff.net>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +
> +Upstream-Status: Backported [https://github.com/git/git/commit/a02ea577174ab8ed18f847cf1693f213e0b9c473]
> +CVE: CVE-2021-40330
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + connect.c             | 2 ++
> + t/t5570-git-daemon.sh | 5 +++++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/connect.c b/connect.c
> +index b6451ab..929de9a 100644
> +--- a/connect.c
> ++++ b/connect.c
> +@@ -1064,6 +1064,8 @@ static struct child_process *git_connect_git(int fd[2], char *hostandport,
> +                target_host = xstrdup(hostandport);
> +
> +        transport_check_allowed("git");
> ++       if (strchr(target_host, '\n') || strchr(path, '\n'))
> ++               die(_("newline is forbidden in git:// hosts and repo paths"));
> +
> +        /*
> +         * These underlying connection commands die() if they
> +diff --git a/t/t5570-git-daemon.sh b/t/t5570-git-daemon.sh
> +index 34487bb..79cd218 100755
> +--- a/t/t5570-git-daemon.sh
> ++++ b/t/t5570-git-daemon.sh
> +@@ -103,6 +103,11 @@ test_expect_success 'fetch notices corrupt idx' '
> +        )
> + '
> +
> ++test_expect_success 'client refuses to ask for repo with newline' '
> ++       test_must_fail git clone "$GIT_DAEMON_URL/repo$LF.git" dst 2>stderr &&
> ++       test_i18ngrep newline.is.forbidden stderr
> ++'
> ++
> + test_remote_error()
> + {
> +        do_export=YesPlease
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index 2b75bed055..a89dd42e8b 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -10,7 +10,9 @@ PROVIDES_append_class-native = " git-replacement-native"
>  SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
>             ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
>            file://CVE-2021-21300.patch \
> -           file://fixsort.patch"
> +           file://fixsort.patch \
> +           file://CVE-2021-40330.patch \
> +           "
>
>  S = "${WORKDIR}/git-${PV}"
>
> --
> 2.30.1 (Apple Git-130)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158777): https://lists.openembedded.org/g/openembedded-core/message/158777
> Mute This Topic: https://lists.openembedded.org/mt/87300019/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

