Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1871DCCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:34:00 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web10.36871.1759764830143901050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jjyB/Utu;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.42, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-637dc2292cfso5618518d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759764829; x=1760369629; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+89fIeh2y8AS6pZg2pUYz2BEAhM8EqzwfB4pcer1LQ=;
        b=jjyB/UtuJAg2u5kSIBbNdmJdQ6l//Mg7D32N6HwBz81QzuOHLNIgWv4unHVguvbpoA
         YdRRaztC1KnNjWcaMZrHrxZdJKU8s4UDj6/jvlDWhKSpqtxNzKKyegzGmnqW6iI5Zbdo
         wsp6Ff2bescQeNIvwPuF097H9P0jF4iQjBp2ujtCMzTONF0LxLWJvhbgLQJ92o2PZoGV
         A53pey+m/xBTWQdDgpd5lUnNj6ueNXO5nN1TvmSXWxYwTNRg927xMdnA20OUDyevtalI
         CIcX/sOOYc/xK6FsEgVqLBjRh/eWAWXR/AoLHfVxFhbivILdL/CJkAls8YWHHOMWZyJ6
         G0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764829; x=1760369629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+89fIeh2y8AS6pZg2pUYz2BEAhM8EqzwfB4pcer1LQ=;
        b=ErEFGu7BIJTSIzKlFHmywtSdBEP2yLRG9j302tjkefrw1PWNwCKD8haHEpto6xsrb/
         +oOLDHPJA//ASJc3+NRcq1E0XubpgFUs8zWehMvgIYwgpUlV15PSCdNKqJzaYwLcWVzA
         ltk7rePYzgRu/HoHIGGHt8JpvkK/8qec2J+UcaemBMMhdWYDuYROA8TECVpwehq06xEM
         pejPFWLJM0Xfp9UKvSgsydwy2k/LGeeXNK0K6A5i+JgDay5wOoD9fQaZwlndokzC7TRS
         KGJMBeBuHcPFE8emSUkJj+7LWhFGLbIlsx+zflXTfRRWvjKTqeiRcx8OIIiCzQualtO8
         q3dw==
X-Gm-Message-State: AOJu0YyF2Sw3vJr29DsRyhCM3hQM1BsqELO633+UlEoJ1XzvVFWF/uSX
	UtlEF+jhShelW0DofWkEIs1Dp/SMMLJRk4iLPwhBYrwLu+lvBME6V7jkitTMfEH5/4UI5qerguY
	Fa3uAGTYJdS/oPTj4JGQV29fCfNn4tHAKuRK1XTk5Pg==
X-Gm-Gg: ASbGncvYBTEHkPiqDRKjkwGNhlbQitWiwvoouJQCpdzOyPeZJn4dAIi2RPMKW8ya1wQ
	iRQsYK+iWpFooEBFR52opf4gjW8PZolWmFq02iPDn4oHY22SZm3XR69awM5wNWNCvmQ2h5KcHIN
	bpFLfGi5GEEVLp0EzQwuOOOOtX383E+K/TEJmfGewuNwgk8uQ5H/9Cp4ctHNrV/GN6HlBo92Ny9
	3dCkj0QGwrxi0+Cs2lE25wAEOMAySE8GX5elh5CjCteHp4H3rV6aS/G322Lhg==
X-Google-Smtp-Source: AGHT+IFpCiUECFQIQY9GBgM8DkIMA0SAxzGZBuBH3tYnT2Wp1owZ9NvKWhLU+irYXaxRIb4/TXDp0Br7w4G/laYzmMQ=
X-Received: by 2002:a05:690c:6e8e:b0:772:3578:2ec5 with SMTP id
 00721157ae682-77f942c2c16mr242168387b3.0.1759764828712; Mon, 06 Oct 2025
 08:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251006105247.611808-1-archana.polampalli@windriver.com>
In-Reply-To: <20251006105247.611808-1-archana.polampalli@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 6 Oct 2025 08:33:37 -0700
X-Gm-Features: AS18NWCxm3EEpMznFYnitj29xHm2HNEX8kT1jJkaooS9oG1IbOctyEpf0e7TS2Q
Message-ID: <CAOSpxdbJr6qi_n8uK+oSX0FMDc1L_h4kFcO-K0NB8j0cfHBvwA@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][PATCH 1/1] go: fix CVE-2025-47906
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 15:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224493

This patch doesn't apply:

Applying: go: fix CVE-2025-47906
error: sha1 information is lacking or useless
(meta/recipes-devtools/go/go-1.22.12.inc).
error: could not build fake ancestor
Patch failed at 0001 go: fix CVE-2025-47906

It appears that you aren't at the current scarthgap HEAD.  Could you
please rebase and resend?

Thanks,

Steve

On Mon, Oct 6, 2025 at 3:52=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> If the PATH environment variable contains paths which are executables
> (rather than just directories), passing certain strings to LookPath
> ("", ".", and ".."), can result in the binaries listed in the PATH
>  being unexpectedly returned.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
>  .../go/go/CVE-2025-47906.patch                | 183 ++++++++++++++++++
>  2 files changed, 184 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47906.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devto=
ols/go/go-1.22.12.inc
> index 4de087170c..af4ec39f56 100644
> --- a/meta/recipes-devtools/go/go-1.22.12.inc
> +++ b/meta/recipes-devtools/go/go-1.22.12.inc
> @@ -18,5 +18,6 @@ SRC_URI +=3D "\
>      file://CVE-2025-22871.patch \
>      file://CVE-2025-4673.patch \
>      file://CVE-2025-4674.patch \
> +    file://CVE-2025-47906.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b=
9cf4d9ca02db986e17d71"
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-47906.patch b/meta/reci=
pes-devtools/go/go/CVE-2025-47906.patch
> new file mode 100644
> index 0000000000..88895f496d
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2025-47906.patch
> @@ -0,0 +1,183 @@
> +From 8fa31a2d7d9e60c50a3a94080c097b6e65773f4b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Olivier=3D20Mengu=3DC3=3DA9?=3D <olivier.mengue@gmail.=
com>
> +Date: Mon, 30 Jun 2025 16:58:59 +0200
> +Subject: [PATCH] [release-branch.go1.23] os/exec: fix incorrect expansio=
n of
> + "", "." and ".." in LookPath Fix incorrect expansion of "" and "." when=
 $PATH
> + contains an executable file or, on Windows, a parent directory of a %PA=
TH%
> + element contains an file with the same name as the %PATH% element but w=
ith
> + one of the %PATHEXT% extension (ex: C:\utils\bin is in PATH, and
> + C:\utils\bin.exe exists).
> +
> +Fix incorrect expansion of ".." when $PATH contains an element which is
> +an the concatenation of the path to an executable file (or on Windows
> +a path that can be expanded to an executable by appending a %PATHEXT%
> +extension), a path separator and a name.
> +
> +"", "." and ".." are now rejected early with ErrNotFound.
> +
> +Fixes CVE-2025-47906
> +Fixes #74803
> +
> +Change-Id: Ie50cc0a660fce8fbdc952a7f2e05c36062dcb50e
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/685755
> +LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gse=
rviceaccount.com>
> +Auto-Submit: Damien Neil <dneil@google.com>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +(cherry picked from commit e0b07dc)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/691855
> +Reviewed-by: Michael Knyszek <mknyszek@google.com>
> +
> +CVE: CVE-2025-47906
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/8fa31a2d7=
d9e60c50a3a94080c097b6e65773f4b]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/os/exec/dot_test.go   | 56 +++++++++++++++++++++++++++++++++++++++
> + src/os/exec/exec.go       | 10 +++++++
> + src/os/exec/lp_plan9.go   |  4 +++
> + src/os/exec/lp_unix.go    |  4 +++
> + src/os/exec/lp_windows.go |  7 +++++
> + 5 files changed, 81 insertions(+)
> +
> +diff --git a/src/os/exec/dot_test.go b/src/os/exec/dot_test.go
> +index ed4bad2..86e9cbb 100644
> +--- a/src/os/exec/dot_test.go
> ++++ b/src/os/exec/dot_test.go
> +@@ -178,4 +178,60 @@ func TestLookPath(t *testing.T) {
> +                       }
> +               }
> +       })
> ++
> ++      checker :=3D func(test string) func(t *testing.T) {
> ++              return func(t *testing.T) {
> ++                      t.Helper()
> ++                      t.Logf("PATH=3D%s", os.Getenv("PATH"))
> ++                      p, err :=3D LookPath(test)
> ++                      if err =3D=3D nil {
> ++                              t.Errorf("%q: error expected, got nil", t=
est)
> ++                      }
> ++                      if p !=3D "" {
> ++                              t.Errorf("%q: path returned should be \"\=
". Got %q", test, p)
> ++                      }
> ++              }
> ++      }
> ++
> ++      // Reference behavior for the next test
> ++      t.Run(pathVar+"=3D$OTHER2", func(t *testing.T) {
> ++              t.Run("empty", checker(""))
> ++              t.Run("dot", checker("."))
> ++              t.Run("dotdot1", checker("abc/.."))
> ++              t.Run("dotdot2", checker(".."))
> ++      })
> ++
> ++      // Test the behavior when PATH contains an executable file which =
is not a directory
> ++      t.Run(pathVar+"=3Dexe", func(t *testing.T) {
> ++              // Inject an executable file (not a directory) in PATH.
> ++              // Use our own binary os.Args[0].
> ++              testenv.MustHaveExec(t)
> ++              exe, err :=3D os.Executable()
> ++              if err !=3D nil {
> ++                      t.Fatal(err)
> ++              }
> ++
> ++              t.Setenv(pathVar, exe)
> ++              t.Run("empty", checker(""))
> ++              t.Run("dot", checker("."))
> ++              t.Run("dotdot1", checker("abc/.."))
> ++              t.Run("dotdot2", checker(".."))
> ++      })
> ++
> ++      // Test the behavior when PATH contains an executable file which =
is not a directory
> ++      t.Run(pathVar+"=3Dexe/xx", func(t *testing.T) {
> ++              // Inject an executable file (not a directory) in PATH.
> ++              // Use our own binary os.Args[0].
> ++              testenv.MustHaveExec(t)
> ++              exe, err :=3D os.Executable()
> ++              if err !=3D nil {
> ++                      t.Fatal(err)
> ++              }
> ++
> ++              t.Setenv(pathVar, filepath.Join(exe, "xx"))
> ++              t.Run("empty", checker(""))
> ++              t.Run("dot", checker("."))
> ++              t.Run("dotdot1", checker("abc/.."))
> ++              t.Run("dotdot2", checker(".."))
> ++      })
> + }
> +diff --git a/src/os/exec/exec.go b/src/os/exec/exec.go
> +index b8ef5a0..2c7f510 100644
> +--- a/src/os/exec/exec.go
> ++++ b/src/os/exec/exec.go
> +@@ -1310,3 +1310,13 @@ func addCriticalEnv(env []string) []string {
> + // Code should use errors.Is(err, ErrDot), not err =3D=3D ErrDot,
> + // to test whether a returned error err is due to this condition.
> + var ErrDot =3D errors.New("cannot run executable found relative to curr=
ent directory")
> ++
> ++// validateLookPath excludes paths that can't be valid
> ++// executable names. See issue #74466 and CVE-2025-47906.
> ++func validateLookPath(s string) error {
> ++      switch s {
> ++      case "", ".", "..":
> ++              return ErrNotFound
> ++      }
> ++      return nil
> ++}
> +diff --git a/src/os/exec/lp_plan9.go b/src/os/exec/lp_plan9.go
> +index dffdbac..39f3d33 100644
> +--- a/src/os/exec/lp_plan9.go
> ++++ b/src/os/exec/lp_plan9.go
> +@@ -36,6 +36,10 @@ func findExecutable(file string) error {
> + // As of Go 1.19, LookPath will instead return that path along with an =
error satisfying
> + // errors.Is(err, ErrDot). See the package documentation for more detai=
ls.
> + func LookPath(file string) (string, error) {
> ++      if err :=3D validateLookPath(file); err !=3D nil {
> ++              return "", &Error{file, err}
> ++      }
> ++
> +       // skip the path lookup for these prefixes
> +       skip :=3D []string{"/", "#", "./", "../"}
> +
> +diff --git a/src/os/exec/lp_unix.go b/src/os/exec/lp_unix.go
> +index 3787132..2543525 100644
> +--- a/src/os/exec/lp_unix.go
> ++++ b/src/os/exec/lp_unix.go
> +@@ -54,6 +54,10 @@ func LookPath(file string) (string, error) {
> +       // (only bypass the path if file begins with / or ./ or ../)
> +       // but that would not match all the Unix shells.
> +
> ++      if err :=3D validateLookPath(file); err !=3D nil {
> ++              return "", &Error{file, err}
> ++      }
> ++
> +       if strings.Contains(file, "/") {
> +               err :=3D findExecutable(file)
> +               if err =3D=3D nil {
> +diff --git a/src/os/exec/lp_windows.go b/src/os/exec/lp_windows.go
> +index 698a97c..e0b74e3 100644
> +--- a/src/os/exec/lp_windows.go
> ++++ b/src/os/exec/lp_windows.go
> +@@ -68,6 +68,9 @@ func findExecutable(file string, exts []string) (strin=
g, error) {
> + // As of Go 1.19, LookPath will instead return that path along with an =
error satisfying
> + // errors.Is(err, ErrDot). See the package documentation for more detai=
ls.
> + func LookPath(file string) (string, error) {
> ++      if err :=3D validateLookPath(file); err !=3D nil {
> ++              return "", &Error{file, err}
> ++      }
> +       return lookPath(file, pathExt())
> + }
> +
> +@@ -81,6 +84,10 @@ func LookPath(file string) (string, error) {
> + // "C:\foo\example.com" would be returned as-is even if the
> + // program is actually "C:\foo\example.com.exe".
> + func lookExtensions(path, dir string) (string, error) {
> ++      if err :=3D validateLookPath(path); err !=3D nil {
> ++              return "", &Error{path, err}
> ++      }
> ++
> +       if filepath.Base(path) =3D=3D path {
> +               path =3D "." + string(filepath.Separator) + path
> +       }
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224476): https://lists.openembedded.org/g/openembedde=
d-core/message/224476
> Mute This Topic: https://lists.openembedded.org/mt/115614883/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

