Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAD4C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:25:11 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.45300.1751300709777183460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 09:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gQb8LcEf;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81f8679957so1719141276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751300709; x=1751905509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1qtam1KGzLF50mCrgceGYKtDpMj4kTvwSdAwMM5kc0=;
        b=gQb8LcEf5KMdl0AMQsT+CWWeMUD/a6ENfL8Efza0vnZ9qmjNsoXJj6vdomzJn7h6u1
         4ape2RAoJuoQ/byNAcjXnyR1XFuljB/p9++7iVuZyzyfgpQ4Vr8Q9wY/drBYUplli/oV
         3MUE37VwVkfsdRdBLzKAkJGcFlfmQCchmRJR9dwsbw1US23OvrVO03UaYIPP858trtEs
         ndtYuVe8YTO+nS5p1cD5CpZrGPAIfgcLUa1ub0kfPG0wWgMeKiUq6cOiBxdMPovGiMIK
         qRiBzb351z46lRrTezl55g+bxUFPBScfg5lM0JwIWgdHEf1mWlwD+Oj/uPWHdztyZHee
         FjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300709; x=1751905509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1qtam1KGzLF50mCrgceGYKtDpMj4kTvwSdAwMM5kc0=;
        b=gzion+JBPI3fzz5oNp/96TOPzJnyuoiDP1KC/YQwys2D2unIJ8LJUwQ0iaFF3R0pie
         Qt6WERm8eDKsBVUe775y7o7mMvLw736PD9xe3xmXQ403ARqWG+UmzaxOgaOXDCz4imDk
         qnMu049wx2NeuuVQe0DjviZn970jtgJF9XIMKnk2Ji8Y7oCc9LU9a3HZYQB2QYdTf6WW
         xRgBYPUIbdqCDw6aKOtuavRlshfhefC5u+9O8VPPU5capeK01V+y5flJ5lMPwKvHX2/b
         K11dWjo0ePsJdYvK6MffP/GQ1UVTPe2bl8RNkGelqIxnwjNJeQRC87dnt4TBghcvu/dE
         rmhg==
X-Gm-Message-State: AOJu0YwlDL5at3d939xNs7r1zDNzV3wKX92FQMLfkcKcSFfqdFGWg35y
	yq628htxnAWBTGfRBOvgE5mMQUSyTnGN10BQy3j3l1NFPiJJDum0dE7hiZnvz3bbuYyxEs2sc5M
	Ecaays/kBdxVyKm1zbjIq03yBgg6MrAfboDEq6QDDvQ==
X-Gm-Gg: ASbGncsOdwXdM78gixXkPfA0R5Y+6uj+7qvtfxwHb3DZdZD7tBCTj6YybJTIyvlIlAP
	JTNqkZfnYrLZVKKFENpdMmKe5pYQ0vY37Fvka9TD35KCN5Xz/Ho+TJSNRp/HdorPfnIfbKi+R19
	EjxQKFN02SSCV4o+KYRfeLS3jMpXoCoZbydRxMxIQUDz/Gl/ky81b1iefqhKKHJGNlfZSpIZn6A
	Woi/mWf/2YOOA==
X-Google-Smtp-Source: AGHT+IFMsZO58peTPwbJzjBJitNReifriCqrRqdmvgCcCaG3AZnMSjWKMiRux5OrVkiJ+WHH/GZtej5Qh3NbN4sQV0Y=
X-Received: by 2002:a05:690c:f95:b0:70f:253d:f278 with SMTP id
 00721157ae682-71517148d5bmr208070997b3.15.1751300708473; Mon, 30 Jun 2025
 09:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250630082443.303735-1-Qi.Chen@windriver.com>
In-Reply-To: <20250630082443.303735-1-Qi.Chen@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 30 Jun 2025 09:24:57 -0700
X-Gm-Features: Ac12FXytZ-0pX3VYVokP06jnYErI0BiZHWgQla0Q1saflW2BM1WBz76qj7Wlp8E
Message-ID: <CAOSpxdbWjOq+haxwAeL1+pMD2f6PffhRst+Sgi=CU2mJzBNRfQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] systemd: backport patches to fix CVE-2025-4598
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 16:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219529

On Mon, Jun 30, 2025 at 1:25=E2=80=AFAM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Patch 0003 is the actual patch to fix CVE.
>
> Patch 0002 is a preparation patch which systemd upstream uses for
> all actively maintained branches in preparation for patch 0003.
>
> Patch 0001 is a bug fix patch and is needed to avoid conflict introduced
> by patch 0002. Note that patch 0002 claims itself to be of no functional
> change, so this patch 0001 is really needed for patch 0002.
>
> Patch 0004 is a compilation fix patch which adds a macro needed by
> previous 0002 patch.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...re-compatibility-with-older-patterns.patch |  92 +++++++++++
>  ...edump-get-rid-of-_META_MANDATORY_MAX.patch | 106 +++++++++++++
>  ...oredump-use-d-in-kernel-core-pattern.patch | 144 ++++++++++++++++++-1=
.patch
>  ...o-add-macro-to-iterate-variadic-args.patch |  36 +++++
>  meta/recipes-core/systemd/systemd_250.14.bb   |   4 +
>  5 files changed, 382 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-coredump-resto=
re-compatibility-with-older-patterns.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-coredump-get-r=
id-of-_META_MANDATORY_MAX.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0003-coredump-use-d=
-in-kernel-core-pattern.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0004-basic-macro-ad=
d-macro-to-iterate-variadic-args.patch

Please rename these patches to make it clear that they are associated
with a CVE fix, i.e. CVE-2025-4598-1.patch, CVE-2025-4598-2.patch, ...

>
> diff --git a/meta/recipes-core/systemd/systemd/0001-coredump-restore-comp=
atibility-with-older-patterns.patch b/meta/recipes-core/systemd/systemd/000=
1-coredump-restore-compatibility-with-older-patterns.patch
> new file mode 100644
> index 0000000000..b408a56bfa
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-coredump-restore-compatibili=
ty-with-older-patterns.patch
> @@ -0,0 +1,92 @@
> +From 2108812a76bd078a2bbd7583308ff18bf01f2383 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
> +Date: Tue, 29 Apr 2025 14:47:59 +0200
> +Subject: [PATCH 1/3] coredump: restore compatibility with older patterns
> +
> +This was broken in f45b8015513d38ee5f7cc361db9c5b88c9aae704. Unfortunate=
ly
> +the review does not talk about backward compatibility at all. There are
> +two places where it matters:
> +- During upgrades, the replacement of kernel.core_pattern is asynchronou=
s.
> +  For example, during rpm upgrades, it would be updated a post-transacti=
on
> +  file trigger. In other scenarios, the update might only happen after
> +  reboot. We have a potentially long window where the old pattern is in
> +  place. We need to capture coredumps during upgrades too.
> +- With --backtrace. The interface of --backtrace, in hindsight, is not
> +  great. But there are users of --backtrace which were written to use
> +  a specific set of arguments, and we can't just break compatiblity.
> +  One example is systemd-coredump-python, but there are also reports of
> +  users using --backtrace to generate coredump logs.
> +
> +Thus, we require the original set of args, and will use the additional a=
rgs if
> +found.
> +
> +A test is added to verify that --backtrace works with and without the op=
tional
> +args.
> +
> +(cherry picked from commit ded0aac389e647d35bce7ec4a48e718d77c0435b)
> +(cherry picked from commit f9b8b75c11bba9b63096904be98cc529c304eb97)
> +(cherry picked from commit 385a33b043406ad79a7207f3906c3b15192a3333)
> +(cherry picked from commit c6f79626b6d175c6a5b62b8c5d957a83eb882301)
> +(cherry picked from commit 9f02346d50e33c24acf879ce4dd5937d56473325)
> +(cherry picked from commit ac0aa5d1fdc21db1ef035fce562cb6fc8602b544)
> +
> +Upstream-Status: Backport [cadd1b1a1f39fd13b1115a10f563017201d7b56a]

Rather than a commit id please include a link to the upstream commit.


> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/coredump/coredump.c | 21 ++++++++++++++-------
> + 1 file changed, 14 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
> +index 79280ab986..d598f6f59a 100644
> +--- a/src/coredump/coredump.c
> ++++ b/src/coredump/coredump.c
> +@@ -84,8 +84,12 @@ enum {
> +         META_ARGV_SIGNAL,       /* %s: number of signal causing dump */
> +         META_ARGV_TIMESTAMP,    /* %t: time of dump, expressed as secon=
ds since the Epoch (we expand this to =C2=B5s granularity) */
> +         META_ARGV_RLIMIT,       /* %c: core file size soft resource lim=
it */
> +-        META_ARGV_HOSTNAME,     /* %h: hostname */
> ++        _META_ARGV_REQUIRED,
> ++        /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
> ++        META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
> +         _META_ARGV_MAX,
> ++        /* If new fields are added, they should be added here, to maint=
ain compatibility
> ++         * with callers which don't know about the new fields. */
> +
> +         /* The following indexes are cached for a couple of special fie=
lds we use (and
> +          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
> +@@ -96,7 +100,7 @@ enum {
> +         _META_MANDATORY_MAX,
> +
> +         /* The rest are similar to the previous ones except that we won=
't fail if one of
> +-         * them is missing. */
> ++         * them is missing in a message sent over the socket. */
> +
> +         META_EXE =3D _META_MANDATORY_MAX,
> +         META_UNIT,
> +@@ -1278,14 +1282,17 @@ static int gather_pid_metadata_from_argv(
> +         char *t;
> +
> +         /* We gather all metadata that were passed via argv[] into an a=
rray of iovecs that
> +-         * we'll forward to the socket unit */
> ++         * we'll forward to the socket unit.
> ++         *
> ++         * We require at least _META_ARGV_REQUIRED args, but will accep=
t more.
> ++         * We know how to parse _META_ARGV_MAX args. The rest will be i=
gnored. */
> +
> +-        if (argc < _META_ARGV_MAX)
> ++        if (argc < _META_ARGV_REQUIRED)
> +                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
> +-                                       "Not enough arguments passed by =
the kernel (%i, expected %i).",
> +-                                       argc, _META_ARGV_MAX);
> ++                                       "Not enough arguments passed by =
the kernel (%i, expected between %i and %i).",
> ++                                       argc, _META_ARGV_REQUIRED, _META=
_ARGV_MAX);
> +
> +-        for (int i =3D 0; i < _META_ARGV_MAX; i++) {
> ++        for (int i =3D 0; i < MIN(argc, _META_ARGV_MAX); i++) {
> +
> +                 t =3D argv[i];
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/0002-coredump-get-rid-of-_=
META_MANDATORY_MAX.patch b/meta/recipes-core/systemd/systemd/0002-coredump-=
get-rid-of-_META_MANDATORY_MAX.patch
> new file mode 100644
> index 0000000000..7b94df01cc
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0002-coredump-get-rid-of-_META_MA=
NDATORY_MAX.patch
> @@ -0,0 +1,106 @@
> +From fb22bb743556d4d14463b0f0373c24d07d2e7b28 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
> +Date: Mon, 26 May 2025 12:04:44 +0200
> +Subject: [PATCH 2/3] coredump: get rid of _META_MANDATORY_MAX
> +
> +No functional change. This change is done in preparation for future chan=
ges.
> +Currently, the list of fields which are received on the command line is =
a
> +strict subset of the fields which are always expected to be received on =
a
> +socket. But when we add new kernel args in the future, we'll have two
> +non-overlapping sets and this approach will not work. Get rid of the var=
iable
> +and enumerate the required fields. This set will never change, so this i=
s
> +actually more maintainable.
> +
> +The message with the hint where to add new fields is switched with
> +_META_ARGV_MAX. The new order is more correct.
> +
> +(cherry-picked from 49f1f2d4a7612bbed5211a73d11d6a94fbe3bb69)
> +(cherry-picked from aea6a631bca93e8b04a11aaced694f25f4da155e)
> +(cherry picked from cf16b6b6b2e0a656531bfd73ad66be3817b155cd)
> +
> +(cherry picked from commit b46a4f023cd80b24c8f1aa7a95700bc0cb828cdc)
> +(cherry picked from commit 5855552310ed279180c21cb803408aa2ce36053d)
> +(cherry picked from commit cc31f2d4146831b9f2fe7bf584468908ff9c4de5)
> +
> +Upstream-Status: Backport [2c81e60fe0b8c506a4fe902e45bed6f58f482b39]

Rather than a commit id please include a link to the upstream commit.

> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/coredump/coredump.c | 29 ++++++++++++++++++++---------
> + 1 file changed, 20 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
> +index d598f6f59a..0b27086288 100644
> +--- a/src/coredump/coredump.c
> ++++ b/src/coredump/coredump.c
> +@@ -71,7 +71,7 @@
> +  * size. See DATA_SIZE_MAX in journal-importer.h. */
> + assert_cc(JOURNAL_SIZE_MAX <=3D DATA_SIZE_MAX);
> +
> +-enum {
> ++typedef enum {
> +         /* We use these as array indexes for our process metadata cache=
.
> +          *
> +          * The first indices of the cache stores the same metadata as t=
he ones passed by
> +@@ -87,9 +87,9 @@ enum {
> +         _META_ARGV_REQUIRED,
> +         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
> +         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
> +-        _META_ARGV_MAX,
> +         /* If new fields are added, they should be added here, to maint=
ain compatibility
> +          * with callers which don't know about the new fields. */
> ++        _META_ARGV_MAX,
> +
> +         /* The following indexes are cached for a couple of special fie=
lds we use (and
> +          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
> +@@ -97,16 +97,15 @@ enum {
> +          * environment. */
> +
> +         META_COMM =3D _META_ARGV_MAX,
> +-        _META_MANDATORY_MAX,
> +
> +         /* The rest are similar to the previous ones except that we won=
't fail if one of
> +          * them is missing in a message sent over the socket. */
> +
> +-        META_EXE =3D _META_MANDATORY_MAX,
> ++        META_EXE,
> +         META_UNIT,
> +         META_PROC_AUXV,
> +         _META_MAX
> +-};
> ++} meta_argv_t;
> +
> + static const char * const meta_field_names[_META_MAX] =3D {
> +         [META_ARGV_PID]       =3D "COREDUMP_PID=3D",
> +@@ -1192,12 +1191,24 @@ static int process_socket(int fd) {
> +         if (r < 0)
> +                 goto finish;
> +
> +-        /* Make sure we received at least all fields we need. */
> +-        for (int i =3D 0; i < _META_MANDATORY_MAX; i++)
> ++        /* Make sure we received all the expected fields. We support be=
ing called by an *older*
> ++         * systemd-coredump from the outside, so we require only the ba=
sic set of fields that
> ++         * was being sent when the support for sending to containers ov=
er a socket was added
> ++         * in a108c43e36d3ceb6e34efe37c014fc2cda856000. */
> ++        meta_argv_t i;
> ++        VA_ARGS_FOREACH(i,
> ++                        META_ARGV_PID,
> ++                        META_ARGV_UID,
> ++                        META_ARGV_GID,
> ++                        META_ARGV_SIGNAL,
> ++                        META_ARGV_TIMESTAMP,
> ++                        META_ARGV_RLIMIT,
> ++                        META_ARGV_HOSTNAME,
> ++                        META_COMM)
> +                 if (!context.meta[i]) {
> +                         r =3D log_error_errno(SYNTHETIC_ERRNO(EINVAL),
> +-                                            "A mandatory argument (%i) =
has not been sent, aborting.",
> +-                                            i);
> ++                                            "Mandatory argument %s not =
received on socket, aborting.",
> ++                                            meta_field_names[i]);
> +                         goto finish;
> +                 }
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-coredump-use-d-in-ker=
nel-core-pattern.patch b/meta/recipes-core/systemd/systemd/0003-coredump-us=
e-d-in-kernel-core-pattern.patch
> new file mode 100644
> index 0000000000..99bea31a3c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0003-coredump-use-d-in-kernel-cor=
e-pattern.patch
> @@ -0,0 +1,144 @@
> +From 89730dea979b2d22fd548b622cd88bac99ff1d6b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
> +Date: Tue, 29 Apr 2025 14:47:59 +0200
> +Subject: [PATCH 3/3] coredump: use %d in kernel core pattern
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The kernel provides %d which is documented as
> +"dump mode=E2=80=94same as value returned by prctl(2) PR_GET_DUMPABLE".
> +
> +We already query /proc/pid/auxv for this information, but unfortunately =
this
> +check is subject to a race, because the crashed process may be replaced =
by an
> +attacker before we read this data, for example replacing a SUID process =
that
> +was killed by a signal with another process that is not SUID, tricking u=
s into
> +making the coredump of the original process readable by the attacker.
> +
> +With this patch, we effectively add one more check to the list of condit=
ions
> +that need be satisfied if we are to make the coredump accessible to the =
user.
> +
> +Reportedy-by: Qualys Security Advisory <qsa@qualys.com>
> +
> +(cherry-picked from commit 0c49e0049b7665bb7769a13ef346fef92e1ad4d6)
> +(cherry-picked from commit c58a8a6ec9817275bb4babaa2c08e0e35090d4e3)
> +(cherry picked from commit 19d439189ab85dd7222bdd59fd442bbcc8ea99a7)
> +(cherry picked from commit 254ab8d2a7866679cee006d844d078774cbac3c9)
> +(cherry picked from commit 7fc7aa5a4d28d7768dfd1eb85be385c3ea949168)
> +(cherry picked from commit 19b228662e0fcc6596c0395a0af8486a4b3f1627)
> +
> +CVE: CVE-2025-4598
> +
> +Upstream-Status: Backport [2eb46dce078334805c547cbcf5e6462cf9d2f9f0]

Rather than a commit id please include a link to the upstream commit.

> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + man/systemd-coredump.xml     | 12 ++++++++++++
> + src/coredump/coredump.c      | 21 ++++++++++++++++++---
> + sysctl.d/50-coredump.conf.in |  2 +-
> + 3 files changed, 31 insertions(+), 4 deletions(-)
> +
> +diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
> +index cb9f47745b..ba7cad12bc 100644
> +--- a/man/systemd-coredump.xml
> ++++ b/man/systemd-coredump.xml
> +@@ -259,6 +259,18 @@ COREDUMP_FILENAME=3D/var/lib/systemd/coredump/core.=
Web=E2=80=A6.552351.=E2=80=A6.zst
> +         </listitem>
> +       </varlistentry>
> +
> ++      <varlistentry>
> ++        <term><varname>COREDUMP_DUMPABLE=3D</varname></term>
> ++
> ++        <listitem><para>The <constant>PR_GET_DUMPABLE</constant> field =
as reported by the kernel, see
> ++        <citerefentry
> ++        project=3D'man-pages'><refentrytitle>prctl</refentrytitle><manv=
olnum>2</manvolnum></citerefentry>.
> ++        </para>
> ++
> ++        <xi:include href=3D"version-info.xml" xpointer=3D"v258"/>
> ++        </listitem>
> ++      </varlistentry>
> ++
> +       <varlistentry>
> +         <term><varname>COREDUMP_OPEN_FDS=3D</varname></term>
> +
> +diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
> +index 0b27086288..aca6a2eb6b 100644
> +--- a/src/coredump/coredump.c
> ++++ b/src/coredump/coredump.c
> +@@ -87,6 +87,7 @@ typedef enum {
> +         _META_ARGV_REQUIRED,
> +         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
> +         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
> ++        META_ARGV_DUMPABLE,     /* %d: as set by the kernel */
> +         /* If new fields are added, they should be added here, to maint=
ain compatibility
> +          * with callers which don't know about the new fields. */
> +         _META_ARGV_MAX,
> +@@ -115,6 +116,7 @@ static const char * const meta_field_names[_META_MAX=
] =3D {
> +         [META_ARGV_TIMESTAMP] =3D "COREDUMP_TIMESTAMP=3D",
> +         [META_ARGV_RLIMIT]    =3D "COREDUMP_RLIMIT=3D",
> +         [META_ARGV_HOSTNAME]  =3D "COREDUMP_HOSTNAME=3D",
> ++        [META_ARGV_DUMPABLE]  =3D "COREDUMP_DUMPABLE=3D",
> +         [META_COMM]           =3D "COREDUMP_COMM=3D",
> +         [META_EXE]            =3D "COREDUMP_EXE=3D",
> +         [META_UNIT]           =3D "COREDUMP_UNIT=3D",
> +@@ -125,6 +127,7 @@ typedef struct Context {
> +         const char *meta[_META_MAX];
> +         size_t meta_size[_META_MAX];
> +         pid_t pid;
> ++        unsigned dumpable;
> +         bool is_pid1;
> +         bool is_journald;
> + } Context;
> +@@ -470,14 +473,16 @@ static int grant_user_access(int core_fd, const Co=
ntext *context) {
> +         if (r < 0)
> +                 return r;
> +
> +-        /* We allow access if we got all the data and at_secure is not =
set and
> +-         * the uid/gid matches euid/egid. */
> ++        /* We allow access if dumpable on the command line was exactly =
1, we got all the data,
> ++         * at_secure is not set, and the uid/gid match euid/egid. */
> +         bool ret =3D
> ++                context->dumpable =3D=3D 1 &&
> +                 at_secure =3D=3D 0 &&
> +                 uid !=3D UID_INVALID && euid !=3D UID_INVALID && uid =
=3D=3D euid &&
> +                 gid !=3D GID_INVALID && egid !=3D GID_INVALID && gid =
=3D=3D egid;
> +-        log_debug("Will %s access (uid=3D"UID_FMT " euid=3D"UID_FMT " g=
id=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
> ++        log_debug("Will %s access (dumpable=3D%u uid=3D"UID_FMT " euid=
=3D"UID_FMT " gid=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
> +                   ret ? "permit" : "restrict",
> ++                  context->dumpable,
> +                   uid, euid, gid, egid, yes_no(at_secure));
> +         return ret;
> + }
> +@@ -1102,6 +1107,16 @@ static int save_context(Context *context, const s=
truct iovec_wrapper *iovw) {
> +         if (r < 0)
> +                 return log_error_errno(r, "Failed to parse PID \"%s\": =
%m", context->meta[META_ARGV_PID]);
> +
> ++        /* The value is set to contents of /proc/sys/fs/suid_dumpable, =
which we set to 2,
> ++         * if the process is marked as not dumpable, see PR_SET_DUMPABL=
E(2const). */
> ++        if (context->meta[META_ARGV_DUMPABLE]) {
> ++                r =3D safe_atou(context->meta[META_ARGV_DUMPABLE], &con=
text->dumpable);
> ++                if (r < 0)
> ++                        return log_error_errno(r, "Failed to parse dump=
able field \"%s\": %m", context->meta[META_ARGV_DUMPABLE]);
> ++                if (context->dumpable > 2)
> ++                        log_notice("Got unexpected %%d/dumpable value %=
u.", context->dumpable);
> ++        }
> ++
> +         unit =3D context->meta[META_UNIT];
> +         context->is_pid1 =3D streq(context->meta[META_ARGV_PID], "1") |=
| streq_ptr(unit, SPECIAL_INIT_SCOPE);
> +         context->is_journald =3D streq_ptr(unit, SPECIAL_JOURNALD_SERVI=
CE);
> +diff --git a/sysctl.d/50-coredump.conf.in b/sysctl.d/50-coredump.conf.in
> +index 5fb551a8cf..9c10a89828 100644
> +--- a/sysctl.d/50-coredump.conf.in
> ++++ b/sysctl.d/50-coredump.conf.in
> +@@ -13,7 +13,7 @@
> + # the core dump.
> + #
> + # See systemd-coredump(8) and core(5).
> +-kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h
> ++kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h %d
> +
> + # Allow 16 coredumps to be dispatched in parallel by the kernel.
> + # We collect metadata from /proc/%P/, and thus need to make sure the cr=
ashed
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/0004-basic-macro-add-macro=
-to-iterate-variadic-args.patch b/meta/recipes-core/systemd/systemd/0004-ba=
sic-macro-add-macro-to-iterate-variadic-args.patch
> new file mode 100644
> index 0000000000..b5fad170b8
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0004-basic-macro-add-macro-to-ite=
rate-variadic-args.patch
> @@ -0,0 +1,36 @@
> +From a0c698c720441782fcf2cb7dfd01e69baf8f1f39 Mon Sep 17 00:00:00 2001
> +From: Dan Streetman <ddstreet@ieee.org>
> +Date: Thu, 2 Feb 2023 15:58:10 -0500
> +Subject: [PATCH] basic/macro: add macro to iterate variadic args
> +
> +(cherry picked from commit e179f2d89c9f0c951636d74de00136b4075cd1ac)
> +(cherry picked from commit cd4f43bf378ff33ce5cfeacd96f7f3726603bddc)
> +
> +Upstream-Status: Backport [c288a3aafdf11cd93eb7a21e4d587c6fc218a29c]

Rather than a commit id please include a link to the upstream commit.

> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/basic/macro.h | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/basic/macro.h b/src/basic/macro.h
> +index 9e62f9c71c..16242902ec 100644
> +--- a/src/basic/macro.h
> ++++ b/src/basic/macro.h
> +@@ -454,4 +454,13 @@ typedef struct {
> +
> + assert_cc(sizeof(dummy_t) =3D=3D 0);
> +
> ++/* Iterate through each variadic arg. All must be the same type as 'ent=
ry' or must be implicitly
> ++ * convertable. The iteration variable 'entry' must already be defined.=
 */
> ++#define VA_ARGS_FOREACH(entry, ...)                                    =
 \
> ++        _VA_ARGS_FOREACH(entry, UNIQ_T(_entries_, UNIQ), UNIQ_T(_curren=
t_, UNIQ), ##__VA_ARGS__)
> ++#define _VA_ARGS_FOREACH(entry, _entries_, _current_, ...)         \
> ++        for (typeof(entry) _entries_[] =3D { __VA_ARGS__ }, *_current_ =
=3D _entries_; \
> ++             ((long)(_current_ - _entries_) < (long)ELEMENTSOF(_entries=
_)) && ({ entry =3D *_current_; true; }); \
> ++             _current_++)
> ++
> + #include "log.h"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-c=
ore/systemd/systemd_250.14.bb
> index b3e31e1f23..4be27d814e 100644
> --- a/meta/recipes-core/systemd/systemd_250.14.bb
> +++ b/meta/recipes-core/systemd/systemd_250.14.bb
> @@ -31,6 +31,10 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://0001-core-fix-build-when-seccomp-is-off.patch \
>             file://0001-journal-Make-sd_journal_previous-next-return-0-at=
-HE.patch \
>             file://0001-basic-do-not-warn-in-mkdir_p-when-parent-director=
y-e.patch \
> +           file://0001-coredump-restore-compatibility-with-older-pattern=
s.patch \
> +           file://0002-coredump-get-rid-of-_META_MANDATORY_MAX.patch \
> +           file://0003-coredump-use-d-in-kernel-core-pattern.patch \
> +           file://0004-basic-macro-add-macro-to-iterate-variadic-args.pa=
tch \
>             "
>
>  # patches needed by musl
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219458): https://lists.openembedded.org/g/openembedde=
d-core/message/219458
> Mute This Topic: https://lists.openembedded.org/mt/113904462/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

