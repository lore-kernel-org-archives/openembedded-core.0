Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C5AC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:22:14 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.48048.1679502129870966530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2iNnOgaD;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id ew6so12257137edb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679502128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRStXOV2AsA6TN1ic/lX8NaVLZUUsc27Lp4frvAzJBE=;
        b=2iNnOgaDxqP0+HZ+JxPwtJBlTkT8v2OwZ+sqYFjU+e7bpYY4dHnYAAOeISnXozsAi0
         m6ov1jOkyS65Kno60f1ac/0rlMQYoUh26obJS9YzjXlgPNKtStRg9NHf6j8RioiCAKB8
         iJAn+WXSAO/eup7cEI8j1FuLDV/nAt7Cb6jSoGQYyeKPIM6El76plEyp5dHWN5dYlNp6
         k9Fck3lsx1drlaQ+Nj9AIEjmpuP6cCRvp7WIa7Hgg6zsvFeNwQE5FIaNc2FIDWI+VdMB
         Q36eMjFPx8C6eRwHtfrmQPu8gIHoATgO7RsrdWUuEXDGVcdokkrWkWuzSxl+94YRPHh3
         C8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRStXOV2AsA6TN1ic/lX8NaVLZUUsc27Lp4frvAzJBE=;
        b=VFK6f+wBdizGxfJUDau2F7YWDJsVhHQUqxpH/S4fhDNCfFBR3CdFNUqrDXB12QyJsk
         99D8kOf/Or/nkoo9St4NZYXY5nSEdXUXxZYusQEmzu6yDsC9ohIBhAYTcLe7p0F6adU0
         P315sHPtdZ+xmqknKPgoidBALdIjbkpOmBgxRYfoSh9TbBsF7PSQKbP9O5vhP0hrJMLP
         xcTTCb+TbynLy4u/xlT9MCpxGI+qKimHoRX7K9pEZn1RV6NZs48Fiw9BopxOvGBcyIur
         ATb5AVpRDOuGEzkSU/ENwRcX3H4JQRUT8zrligOSDRvt9lcC3ey3wqg4NB6iM7SSoeGM
         dTcg==
X-Gm-Message-State: AO0yUKXLtKOvMf4D+TktwZYMPeQHUnOa0df76hBydCl+uw+/vskGTpSG
	FcjoWOyIRHxtlWCTIj0nBf6Ynr5uC9M0ADKUj70FpOJo+1ANjUSbqzs=
X-Google-Smtp-Source: AK7set8Uv7gG955w6bgQXKzNfKrZgc0dCBfJ3dT8R8XQa4oNuDqkRgr6IB1W/BNtEmNNMU3s4wvBifoauSLNrC5HmPU=
X-Received: by 2002:a17:906:2cc5:b0:931:c1a:b517 with SMTP id
 r5-20020a1709062cc500b009310c1ab517mr3432883ejr.3.1679502127719; Wed, 22 Mar
 2023 09:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230321193606.2656701-1-sakib.sajal@windriver.com>
In-Reply-To: <20230321193606.2656701-1-sakib.sajal@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 22 Mar 2023 06:21:56 -1000
Message-ID: <CAOSpxdb6Lo=TxqXNSjCR5mrHdCsw419wmf_be+oQYQYxJgs0Ng@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] go: fix CVE-2022-2879 and CVE-2022-41720
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 16:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178949

On Tue, Mar 21, 2023 at 9:36=E2=80=AFAM Sakib Sajal <sakib.sajal@windriver.=
com> wrote:
>
> Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.
>
> Modified the original fix for CVE-2022-2879 to remove a testdata tarball
> and any references to it since git binary diffs are not supported in
> quilt.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
>  ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
>  ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 ++++++++++++++++++
>  3 files changed, 693 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar-lim=
it-size-of-headers.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http-avo=
id-escapes-from-os.DirFS-and-http.Dir.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index 99662bd298..a6081bdee7 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -20,6 +20,8 @@ SRC_URI +=3D "\
>      file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch =
\
>      file://CVE-2022-41715.patch \
>      file://CVE-2022-41717.patch \
> +    file://0001-archive-tar-limit-size-of-headers.patch \
> +    file://0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.pat=
ch \

Could you please resubmit with the patch file names changed to reflect
the CVE they are fixing? i.e.

      file://CVE-2022-2879.patch \
      file://CVE-2022-41720.patch \

Thanks!

Steve

>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size=
-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit=
-size-of-headers.patch
> new file mode 100644
> index 0000000000..0315e1a3ee
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-hea=
ders.patch
> @@ -0,0 +1,177 @@
> +From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Fri, 2 Sep 2022 20:45:18 -0700
> +Subject: [PATCH] archive/tar: limit size of headers
> +
> +Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
> +GNU link names), to avoid reading arbitrarily large amounts of data
> +into memory.
> +
> +Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
> +this issue.
> +
> +Fixes CVE-2022-2879
> +Updates #54853
> +Fixes #55925
> +
> +Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1565555
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1590622
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/438500
> +Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
> +Reviewed-by: Carlos Amedee <carlos@golang.org>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Run-TryBot: Carlos Amedee <carlos@golang.org>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +CVE: CVE-2022-2879
> +Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/archive/tar/format.go      |  4 ++++
> + src/archive/tar/reader.go      | 14 ++++++++++++--
> + src/archive/tar/reader_test.go |  8 +++++++-
> + src/archive/tar/writer.go      |  3 +++
> + src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
> + 5 files changed, 53 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
> +index cfe24a5..6642364 100644
> +--- a/src/archive/tar/format.go
> ++++ b/src/archive/tar/format.go
> +@@ -143,6 +143,10 @@ const (
> +       blockSize  =3D 512 // Size of each block in a tar stream
> +       nameSize   =3D 100 // Max length of the name field in USTAR forma=
t
> +       prefixSize =3D 155 // Max length of the prefix field in USTAR for=
mat
> ++
> ++      // Max length of a special file (PAX header, GNU long name or lin=
k).
> ++      // This matches the limit used by libarchive.
> ++      maxSpecialFileSize =3D 1 << 20
> + )
> +
> + // blockPadding computes the number of bytes needed to pad offset up to=
 the
> +diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
> +index 1b1d5b4..f645af8 100644
> +--- a/src/archive/tar/reader.go
> ++++ b/src/archive/tar/reader.go
> +@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
> +                       continue // This is a meta header affecting the n=
ext header
> +               case TypeGNULongName, TypeGNULongLink:
> +                       format.mayOnlyBe(FormatGNU)
> +-                      realname, err :=3D io.ReadAll(tr)
> ++                      realname, err :=3D readSpecialFile(tr)
> +                       if err !=3D nil {
> +                               return nil, err
> +                       }
> +@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]string=
) (err error) {
> + // parsePAX parses PAX headers.
> + // If an extended header (type 'x') is invalid, ErrHeader is returned
> + func parsePAX(r io.Reader) (map[string]string, error) {
> +-      buf, err :=3D io.ReadAll(r)
> ++      buf, err :=3D readSpecialFile(r)
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err=
 error) {
> +       return n, err
> + }
> +
> ++// readSpecialFile is like io.ReadAll except it returns
> ++// ErrFieldTooLong if more than maxSpecialFileSize is read.
> ++func readSpecialFile(r io.Reader) ([]byte, error) {
> ++      buf, err :=3D io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
> ++      if len(buf) > maxSpecialFileSize {
> ++              return nil, ErrFieldTooLong
> ++      }
> ++      return buf, err
> ++}
> ++
> + // discard skips n bytes in r, reporting an error if unable to do so.
> + func discard(r io.Reader, n int64) error {
> +       // If possible, Seek to the last byte before the end of the data =
section.
> +diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_tes=
t.go
> +index 789ddc1..926dc3d 100644
> +--- a/src/archive/tar/reader_test.go
> ++++ b/src/archive/tar/reader_test.go
> +@@ -6,6 +6,7 @@ package tar
> +
> + import (
> +       "bytes"
> ++      "compress/bzip2"
> +       "crypto/md5"
> +       "errors"
> +       "fmt"
> +@@ -625,9 +626,14 @@ func TestReader(t *testing.T) {
> +                       }
> +                       defer f.Close()
> +
> ++                      var fr io.Reader =3D f
> ++                      if strings.HasSuffix(v.file, ".bz2") {
> ++                              fr =3D bzip2.NewReader(fr)
> ++                      }
> ++
> +                       // Capture all headers and checksums.
> +                       var (
> +-                              tr      =3D NewReader(f)
> ++                              tr      =3D NewReader(fr)
> +                               hdrs    []*Header
> +                               chksums []string
> +                               rdbuf   =3D make([]byte, 8)
> +diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
> +index e80498d..893eac0 100644
> +--- a/src/archive/tar/writer.go
> ++++ b/src/archive/tar/writer.go
> +@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdr=
s map[string]string) error {
> +                       flag =3D TypeXHeader
> +               }
> +               data :=3D buf.String()
> ++              if len(data) > maxSpecialFileSize {
> ++                      return ErrFieldTooLong
> ++              }
> +               if err :=3D tw.writeRawFile(name, data, flag, FormatPAX);=
 err !=3D nil || isGlobal {
> +                       return err // Global headers return here
> +               }
> +diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_tes=
t.go
> +index a00f02d..4e709e5 100644
> +--- a/src/archive/tar/writer_test.go
> ++++ b/src/archive/tar/writer_test.go
> +@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
> +       }
> + }
> +
> ++func TestWriteLongHeader(t *testing.T) {
> ++      for _, test :=3D range []struct {
> ++              name string
> ++              h    *Header
> ++      }{{
> ++              name: "name too long",
> ++              h:    &Header{Name: strings.Repeat("a", maxSpecialFileSiz=
e)},
> ++      }, {
> ++              name: "linkname too long",
> ++              h:    &Header{Linkname: strings.Repeat("a", maxSpecialFil=
eSize)},
> ++      }, {
> ++              name: "uname too long",
> ++              h:    &Header{Uname: strings.Repeat("a", maxSpecialFileSi=
ze)},
> ++      }, {
> ++              name: "gname too long",
> ++              h:    &Header{Gname: strings.Repeat("a", maxSpecialFileSi=
ze)},
> ++      }, {
> ++              name: "PAX header too long",
> ++              h:    &Header{PAXRecords: map[string]string{"GOLANG.x": s=
trings.Repeat("a", maxSpecialFileSize)}},
> ++      }} {
> ++              w :=3D NewWriter(io.Discard)
> ++              if err :=3D w.WriteHeader(test.h); err !=3D ErrFieldTooLo=
ng {
> ++                      t.Errorf("%v: w.WriteHeader() =3D %v, want ErrFie=
ldTooLong", test.name, err)
> ++              }
> ++      }
> ++}
> ++
> + // testNonEmptyWriter wraps an io.Writer and ensures that
> + // Write is never called with an empty buffer.
> + type testNonEmptyWriter struct{ io.Writer }
> diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-esca=
pes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.18/000=
2-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
> new file mode 100644
> index 0000000000..6c2e8804b3
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-fro=
m-os.DirFS-and-http.Dir.patch
> @@ -0,0 +1,514 @@
> +From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Thu, 10 Nov 2022 12:16:27 -0800
> +Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.Dir =
on
> + Windows
> +
> +Do not permit access to Windows reserved device names (NUL, COM1, etc.)
> +via os.DirFS and http.Dir filesystems.
> +
> +Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
> +the root to the relative path with a path separator, making
> +os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
> +a UNC name. Not only does this not open the intended file, but permits
> +reference to any file on the system rather than only files on the
> +current drive.
> +
> +Make os.DirFS("") invalid, with all file access failing. Previously,
> +a root of "" was interpreted as "/", which is surprising and probably
> +unintentional.
> +
> +Fixes CVE-2022-41720.
> +Fixes #56694.
> +
> +Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1663832
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/455360
> +Reviewed-by: Michael Pratt <mpratt@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Jenny Rakoczy <jenny@golang.org>
> +
> +CVE: CVE-2022-41720
> +Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/go/build/deps_test.go                 |  1 +
> + src/internal/safefilepath/path.go         | 21 +++++
> + src/internal/safefilepath/path_other.go   | 23 ++++++
> + src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
> + src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++++
> + src/net/http/fs.go                        |  8 +-
> + src/net/http/fs_test.go                   | 28 +++++++
> + src/os/file.go                            | 36 +++++++--
> + src/os/os_test.go                         | 38 +++++++++
> + 9 files changed, 328 insertions(+), 10 deletions(-)
> + create mode 100644 src/internal/safefilepath/path.go
> + create mode 100644 src/internal/safefilepath/path_other.go
> + create mode 100644 src/internal/safefilepath/path_test.go
> + create mode 100644 src/internal/safefilepath/path_windows.go
> +
> +diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
> +index 45e2f25..dc3bb8c 100644
> +--- a/src/go/build/deps_test.go
> ++++ b/src/go/build/deps_test.go
> +@@ -165,6 +165,7 @@ var depsRules =3D `
> +       io/fs
> +       < internal/testlog
> +       < internal/poll
> ++      < internal/safefilepath
> +       < os
> +       < os/signal;
> +
> +diff --git a/src/internal/safefilepath/path.go b/src/internal/safefilepa=
th/path.go
> +new file mode 100644
> +index 0000000..0f0a270
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path.go
> +@@ -0,0 +1,21 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++// Package safefilepath manipulates operating-system file paths.
> ++package safefilepath
> ++
> ++import (
> ++      "errors"
> ++)
> ++
> ++var errInvalidPath =3D errors.New("invalid path")
> ++
> ++// FromFS converts a slash-separated path into an operating-system path=
.
> ++//
> ++// FromFS returns an error if the path cannot be represented by the ope=
rating
> ++// system. For example, paths containing '\' and ':' characters are rej=
ected
> ++// on Windows.
> ++func FromFS(path string) (string, error) {
> ++      return fromFS(path)
> ++}
> +diff --git a/src/internal/safefilepath/path_other.go b/src/internal/safe=
filepath/path_other.go
> +new file mode 100644
> +index 0000000..f93da18
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_other.go
> +@@ -0,0 +1,23 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++//go:build !windows
> ++
> ++package safefilepath
> ++
> ++import "runtime"
> ++
> ++func fromFS(path string) (string, error) {
> ++      if runtime.GOOS =3D=3D "plan9" {
> ++              if len(path) > 0 && path[0] =3D=3D '#' {
> ++                      return path, errInvalidPath
> ++              }
> ++      }
> ++      for i :=3D range path {
> ++              if path[i] =3D=3D 0 {
> ++                      return "", errInvalidPath
> ++              }
> ++      }
> ++      return path, nil
> ++}
> +diff --git a/src/internal/safefilepath/path_test.go b/src/internal/safef=
ilepath/path_test.go
> +new file mode 100644
> +index 0000000..dc662c1
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_test.go
> +@@ -0,0 +1,88 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package safefilepath_test
> ++
> ++import (
> ++      "internal/safefilepath"
> ++      "os"
> ++      "path/filepath"
> ++      "runtime"
> ++      "testing"
> ++)
> ++
> ++type PathTest struct {
> ++      path, result string
> ++}
> ++
> ++const invalid =3D ""
> ++
> ++var fspathtests =3D []PathTest{
> ++      {".", "."},
> ++      {"/a/b/c", "/a/b/c"},
> ++      {"a\x00b", invalid},
> ++}
> ++
> ++var winreservedpathtests =3D []PathTest{
> ++      {`a\b`, `a\b`},
> ++      {`a:b`, `a:b`},
> ++      {`a/b:c`, `a/b:c`},
> ++      {`NUL`, `NUL`},
> ++      {`./com1`, `./com1`},
> ++      {`a/nul/b`, `a/nul/b`},
> ++}
> ++
> ++// Whether a reserved name with an extension is reserved or not varies =
by
> ++// Windows version.
> ++var winreservedextpathtests =3D []PathTest{
> ++      {"nul.txt", "nul.txt"},
> ++      {"a/nul.txt/b", "a/nul.txt/b"},
> ++}
> ++
> ++var plan9reservedpathtests =3D []PathTest{
> ++      {`#c`, `#c`},
> ++}
> ++
> ++func TestFromFS(t *testing.T) {
> ++      switch runtime.GOOS {
> ++      case "windows":
> ++              if canWriteFile(t, "NUL") {
> ++                      t.Errorf("can unexpectedly write a file named NUL=
 on Windows")
> ++              }
> ++              if canWriteFile(t, "nul.txt") {
> ++                      fspathtests =3D append(fspathtests, winreservedex=
tpathtests...)
> ++              } else {
> ++                      winreservedpathtests =3D append(winreservedpathte=
sts, winreservedextpathtests...)
> ++              }
> ++              for i :=3D range winreservedpathtests {
> ++                      winreservedpathtests[i].result =3D invalid
> ++              }
> ++              for i :=3D range fspathtests {
> ++                      fspathtests[i].result =3D filepath.FromSlash(fspa=
thtests[i].result)
> ++              }
> ++      case "plan9":
> ++              for i :=3D range plan9reservedpathtests {
> ++                      plan9reservedpathtests[i].result =3D invalid
> ++              }
> ++      }
> ++      tests :=3D fspathtests
> ++      tests =3D append(tests, winreservedpathtests...)
> ++      tests =3D append(tests, plan9reservedpathtests...)
> ++      for _, test :=3D range tests {
> ++              got, err :=3D safefilepath.FromFS(test.path)
> ++              if (got =3D=3D "") !=3D (err !=3D nil) {
> ++                      t.Errorf(`FromFS(%q) =3D %q, %v; want "" only if =
err !=3D nil`, test.path, got, err)
> ++              }
> ++              if got !=3D test.result {
> ++                      t.Errorf("FromFS(%q) =3D %q, %v; want %q", test.p=
ath, got, err, test.result)
> ++              }
> ++      }
> ++}
> ++
> ++func canWriteFile(t *testing.T, name string) bool {
> ++      path :=3D filepath.Join(t.TempDir(), name)
> ++      os.WriteFile(path, []byte("ok"), 0666)
> ++      b, _ :=3D os.ReadFile(path)
> ++      return string(b) =3D=3D "ok"
> ++}
> +diff --git a/src/internal/safefilepath/path_windows.go b/src/internal/sa=
fefilepath/path_windows.go
> +new file mode 100644
> +index 0000000..909c150
> +--- /dev/null
> ++++ b/src/internal/safefilepath/path_windows.go
> +@@ -0,0 +1,95 @@
> ++// Copyright 2022 The Go Authors. All rights reserved.
> ++// Use of this source code is governed by a BSD-style
> ++// license that can be found in the LICENSE file.
> ++
> ++package safefilepath
> ++
> ++import (
> ++      "syscall"
> ++      "unicode/utf8"
> ++)
> ++
> ++func fromFS(path string) (string, error) {
> ++      if !utf8.ValidString(path) {
> ++              return "", errInvalidPath
> ++      }
> ++      for len(path) > 1 && path[0] =3D=3D '/' && path[1] =3D=3D '/' {
> ++              path =3D path[1:]
> ++      }
> ++      containsSlash :=3D false
> ++      for p :=3D path; p !=3D ""; {
> ++              // Find the next path element.
> ++              i :=3D 0
> ++              dot :=3D -1
> ++              for i < len(p) && p[i] !=3D '/' {
> ++                      switch p[i] {
> ++                      case 0, '\\', ':':
> ++                              return "", errInvalidPath
> ++                      case '.':
> ++                              if dot < 0 {
> ++                                      dot =3D i
> ++                              }
> ++                      }
> ++                      i++
> ++              }
> ++              part :=3D p[:i]
> ++              if i < len(p) {
> ++                      containsSlash =3D true
> ++                      p =3D p[i+1:]
> ++              } else {
> ++                      p =3D ""
> ++              }
> ++              // Trim the extension and look for a reserved name.
> ++              base :=3D part
> ++              if dot >=3D 0 {
> ++                      base =3D part[:dot]
> ++              }
> ++              if isReservedName(base) {
> ++                      if dot < 0 {
> ++                              return "", errInvalidPath
> ++                      }
> ++                      // The path element is a reserved name with an ex=
tension.
> ++                      // Some Windows versions consider this a reserved=
 name,
> ++                      // while others do not. Use FullPath to see if th=
e name is
> ++                      // reserved.
> ++                      if p, _ :=3D syscall.FullPath(part); len(p) >=3D =
4 && p[:4] =3D=3D `\\.\` {
> ++                              return "", errInvalidPath
> ++                      }
> ++              }
> ++      }
> ++      if containsSlash {
> ++              // We can't depend on strings, so substitute \ for / manu=
ally.
> ++              buf :=3D []byte(path)
> ++              for i, b :=3D range buf {
> ++                      if b =3D=3D '/' {
> ++                              buf[i] =3D '\\'
> ++                      }
> ++              }
> ++              path =3D string(buf)
> ++      }
> ++      return path, nil
> ++}
> ++
> ++// isReservedName reports if name is a Windows reserved device name.
> ++// It does not detect names with an extension, which are also reserved =
on some Windows versions.
> ++//
> ++// For details, search for PRN in
> ++// https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-fil=
e.
> ++func isReservedName(name string) bool {
> ++      if 3 <=3D len(name) && len(name) <=3D 4 {
> ++              switch string([]byte{toUpper(name[0]), toUpper(name[1]), =
toUpper(name[2])}) {
> ++              case "CON", "PRN", "AUX", "NUL":
> ++                      return len(name) =3D=3D 3
> ++              case "COM", "LPT":
> ++                      return len(name) =3D=3D 4 && '1' <=3D name[3] && =
name[3] <=3D '9'
> ++              }
> ++      }
> ++      return false
> ++}
> ++
> ++func toUpper(c byte) byte {
> ++      if 'a' <=3D c && c <=3D 'z' {
> ++              return c - ('a' - 'A')
> ++      }
> ++      return c
> ++}
> +diff --git a/src/net/http/fs.go b/src/net/http/fs.go
> +index 57e731e..43ee4b5 100644
> +--- a/src/net/http/fs.go
> ++++ b/src/net/http/fs.go
> +@@ -9,6 +9,7 @@ package http
> + import (
> +       "errors"
> +       "fmt"
> ++      "internal/safefilepath"
> +       "io"
> +       "io/fs"
> +       "mime"
> +@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, name string)=
 error {
> + // Open implements FileSystem using os.Open, opening files for reading =
rooted
> + // and relative to the directory d.
> + func (d Dir) Open(name string) (File, error) {
> +-      if filepath.Separator !=3D '/' && strings.ContainsRune(name, file=
path.Separator) {
> +-              return nil, errors.New("http: invalid character in file p=
ath")
> ++      path, err :=3D safefilepath.FromFS(path.Clean("/" + name))
> ++      if err !=3D nil {
> ++              return nil, errors.New("http: invalid or unsafe file path=
")
> +       }
> +       dir :=3D string(d)
> +       if dir =3D=3D "" {
> +               dir =3D "."
> +       }
> +-      fullName :=3D filepath.Join(dir, filepath.FromSlash(path.Clean("/=
"+name)))
> ++      fullName :=3D filepath.Join(dir, path)
> +       f, err :=3D os.Open(fullName)
> +       if err !=3D nil {
> +               return nil, mapDirOpenError(err, fullName)
> +diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
> +index b42ade1..941448a 100644
> +--- a/src/net/http/fs_test.go
> ++++ b/src/net/http/fs_test.go
> +@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
> +       }
> + }
> +
> ++func TestFileServerNamesEscape(t *testing.T) {
> ++      t.Run("h1", func(t *testing.T) {
> ++              testFileServerNamesEscape(t, h1Mode)
> ++      })
> ++      t.Run("h2", func(t *testing.T) {
> ++              testFileServerNamesEscape(t, h2Mode)
> ++      })
> ++}
> ++func testFileServerNamesEscape(t *testing.T, h2 bool) {
> ++      defer afterTest(t)
> ++      ts :=3D newClientServerTest(t, h2, FileServer(Dir("testdata"))).t=
s
> ++      defer ts.Close()
> ++      for _, path :=3D range []string{
> ++              "/../testdata/file",
> ++              "/NUL", // don't read from device files on Windows
> ++      } {
> ++              res, err :=3D ts.Client().Get(ts.URL + path)
> ++              if err !=3D nil {
> ++                      t.Fatal(err)
> ++              }
> ++              res.Body.Close()
> ++              if res.StatusCode < 400 || res.StatusCode > 599 {
> ++                      t.Errorf("Get(%q): got status %v, want 4xx or 5xx=
", path, res.StatusCode)
> ++              }
> ++
> ++      }
> ++}
> ++
> + type fakeFileInfo struct {
> +       dir      bool
> +       basename string
> +diff --git a/src/os/file.go b/src/os/file.go
> +index e717f17..cb87158 100644
> +--- a/src/os/file.go
> ++++ b/src/os/file.go
> +@@ -37,12 +37,12 @@
> + // Note: The maximum number of concurrent operations on a File may be l=
imited by
> + // the OS or the system. The number should be high, but exceeding it ma=
y degrade
> + // performance or cause other issues.
> +-//
> + package os
> +
> + import (
> +       "errors"
> +       "internal/poll"
> ++      "internal/safefilepath"
> +       "internal/testlog"
> +       "internal/unsafeheader"
> +       "io"
> +@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {
> + // the /prefix tree, then using DirFS does not stop the access any more=
 than using
> + // os.Open does. DirFS is therefore not a general substitute for a chro=
ot-style security
> + // mechanism when the directory tree contains arbitrary content.
> ++//
> ++// The directory dir must not be "".
> + func DirFS(dir string) fs.FS {
> +       return dirFS(dir)
> + }
> +@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
> + type dirFS string
> +
> + func (dir dirFS) Open(name string) (fs.File, error) {
> +-      if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && contai=
nsAny(name, `\:`) {
> +-              return nil, &PathError{Op: "open", Path: name, Err: ErrIn=
valid}
> ++      fullname, err :=3D dir.join(name)
> ++      if err !=3D nil {
> ++              return nil, &PathError{Op: "stat", Path: name, Err: err}
> +       }
> +-      f, err :=3D Open(string(dir) + "/" + name)
> ++      f, err :=3D Open(fullname)
> +       if err !=3D nil {
> +               return nil, err // nil fs.File
> +       }
> +@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, error=
) {
> + }
> +
> + func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
> +-      if !fs.ValidPath(name) || runtime.GOOS =3D=3D "windows" && contai=
nsAny(name, `\:`) {
> +-              return nil, &PathError{Op: "stat", Path: name, Err: ErrIn=
valid}
> ++      fullname, err :=3D dir.join(name)
> ++      if err !=3D nil {
> ++              return nil, &PathError{Op: "stat", Path: name, Err: err}
> +       }
> +-      f, err :=3D Stat(string(dir) + "/" + name)
> ++      f, err :=3D Stat(fullname)
> +       if err !=3D nil {
> +               return nil, err
> +       }
> +       return f, nil
> + }
> +
> ++// join returns the path for name in dir.
> ++func (dir dirFS) join(name string) (string, error) {
> ++      if dir =3D=3D "" {
> ++              return "", errors.New("os: DirFS with empty root")
> ++      }
> ++      if !fs.ValidPath(name) {
> ++              return "", ErrInvalid
> ++      }
> ++      name, err :=3D safefilepath.FromFS(name)
> ++      if err !=3D nil {
> ++              return "", ErrInvalid
> ++      }
> ++      if IsPathSeparator(dir[len(dir)-1]) {
> ++              return string(dir) + name, nil
> ++      }
> ++      return string(dir) + string(PathSeparator) + name, nil
> ++}
> ++
> + // ReadFile reads the named file and returns the contents.
> + // A successful call returns err =3D=3D nil, not err =3D=3D EOF.
> + // Because ReadFile reads the whole file, it does not treat an EOF from=
 Read
> +diff --git a/src/os/os_test.go b/src/os/os_test.go
> +index 506f1fb..be269bb 100644
> +--- a/src/os/os_test.go
> ++++ b/src/os/os_test.go
> +@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
> +       if err =3D=3D nil {
> +               t.Fatalf(`Open testdata\dirfs succeeded`)
> +       }
> ++
> ++      // Test that Open does not open Windows device files.
> ++      _, err =3D d.Open(`NUL`)
> ++      if err =3D=3D nil {
> ++              t.Errorf(`Open NUL succeeded`)
> ++      }
> ++}
> ++
> ++func TestDirFSRootDir(t *testing.T) {
> ++      cwd, err :=3D os.Getwd()
> ++      if err !=3D nil {
> ++              t.Fatal(err)
> ++      }
> ++      cwd =3D cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix=
 (C:) on Windows
> ++      cwd =3D filepath.ToSlash(cwd)               // convert \ to /
> ++      cwd =3D strings.TrimPrefix(cwd, "/")        // trim leading /
> ++
> ++      // Test that Open can open a path starting at /.
> ++      d :=3D DirFS("/")
> ++      f, err :=3D d.Open(cwd + "/testdata/dirfs/a")
> ++      if err !=3D nil {
> ++              t.Fatal(err)
> ++      }
> ++      f.Close()
> ++}
> ++
> ++func TestDirFSEmptyDir(t *testing.T) {
> ++      d :=3D DirFS("")
> ++      cwd, _ :=3D os.Getwd()
> ++      for _, path :=3D range []string{
> ++              "testdata/dirfs/a",                          // not DirFS=
(".")
> ++              filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not DirFS=
("/")
> ++      } {
> ++              _, err :=3D d.Open(path)
> ++              if err =3D=3D nil {
> ++                      t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
> ++              }
> ++      }
> + }
> +
> + func TestDirFSPathsValid(t *testing.T) {
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178900): https://lists.openembedded.org/g/openembedde=
d-core/message/178900
> Mute This Topic: https://lists.openembedded.org/mt/97763091/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

