Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BEDC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:39:17 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.2700.1690997954291727223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kiHHkWKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c10ba30afso262571966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690997952; x=1691602752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyAVyOvjAzuvNlgYWXx+7vXFyLYyOTO657j4IeCRA6k=;
        b=kiHHkWKKU9xhtnVGe/l73BxnFY50BschtHO/xzcjekIXAQaRkk2LP8YIniPctv0oF2
         BRcV3gWt9DsCBjl8juW59+ElVZd/SBdoDuPzFMe/5kIZqdqGCahZy6Cl4RlG8cH1RQ1n
         sRzY8ESU7qDqFS4RVacAsEkV7/xJruc6cTR307t/YWtY/wxS0hrKXzR/lgh1dozOpAOw
         EDEvTkXH3Y3qxYqk/y0KAG6bvt78nCdLZSt+hpL50JWtse0PG+E47kvtEFtlVyewR+qJ
         3Wq5T7bRKjMgulkXiZSyuGViqGLL3sDurChXRDI8FDu+GLZWRtQU4OMVnaw38JFyY6gk
         hMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690997952; x=1691602752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyAVyOvjAzuvNlgYWXx+7vXFyLYyOTO657j4IeCRA6k=;
        b=O0DJkTS6SzQhAIw2VZVzV3t7t8sZKOAuPQaEarT8tfFbkQ4ouHMc6JcQpD38k95i8d
         AxUOhvlu75Gr+4m+uxDasj7Pn5rMXWliIA6L5IR7pci4I2t1S+bJQqXMXzta3tKFw+/J
         3rm5vQLblQMJXqZVCsy2ktvKdVxH7xGujmGDsMV9r3ZdltNuZo9BbUKaZq0Um2VKmgbO
         NfBs21T+0Pdc1cNgU1XXDFhkXIZTCyisFtodvokNtQZSnUAU/9ZsNH2eIngIMEs0Eu2k
         rgDYt1Qz6kk354xwlzO1vcim7alBEOgxjO3JDcZ6x+UYurUFPdG9PDEVVGQ5ij1t7gRY
         d/3Q==
X-Gm-Message-State: ABy/qLaSyrVJMluZGo8tjvthlaXcgCxko5gyvoU5O8NrV7rif2RuDMj6
	n85BGPsfD+sYbM6jAsV8VaUPShKN3HcM6k9LgPLXqQ==
X-Google-Smtp-Source: APBJJlFj8UCb6N1ViahEYZJayY5CrtQlvUQDikhJ9eMAqY/9qWhwwPuBSZHMLeHD1X9V/kppt9L8VBivBbqjIasWXhw=
X-Received: by 2002:a17:907:7886:b0:988:71c8:9f3a with SMTP id
 ku6-20020a170907788600b0098871c89f3amr8072577ejc.16.1690997952264; Wed, 02
 Aug 2023 10:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230802001813.3521965-1-sakib.sajal@windriver.com> <20230802001813.3521965-3-sakib.sajal@windriver.com>
In-Reply-To: <20230802001813.3521965-3-sakib.sajal@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 2 Aug 2023 07:39:01 -1000
Message-ID: <CAOSpxdaS5qdRY3hjOY4oj+q7QVmZVieNEt=UU1Z6RvdAfwgw5g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 3/3] go: fix CVE-2023-29406
To: sakib.sajal@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185420

There is already a patch for this CVE in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D4596433a54c12e=
e229e923ae39e3ec0d16d6f067

So I've dropped this patch from your series and adjusted the other two
to take into account the above commit.

Thanks!

Steve

On Tue, Aug 1, 2023 at 2:18=E2=80=AFPM Sakib Sajal via lists.openembedded.o=
rg
<sakib.sajal=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Backport required patch to fix CVE-2023-29406.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.19/CVE-2023-29406.patch           | 210 ++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index d46eab01a0..b9d905a616 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -41,6 +41,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-24536_3.patch \
>      file://CVE-2023-24531_1.patch \
>      file://CVE-2023-24531_2.patch \
> +    file://CVE-2023-29406.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch b/meta=
/recipes-devtools/go/go-1.19/CVE-2023-29406.patch
> new file mode 100644
> index 0000000000..8a82d5c18c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch
> @@ -0,0 +1,210 @@
> +From 3077df09879fb1aad0ccfc009fee6fc5e5f532bc Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Wed, 28 Jun 2023 13:20:08 -0700
> +Subject: [PATCH] net/http: validate Host header before sending
> +
> +Verify that the Host header we send is valid.
> +Avoids surprising behavior such as a Host of "go.dev\r\nX-Evil:oops"
> +adding an X-Evil header to HTTP/1 requests.
> +
> +Add a test, skip the test for HTTP/2. HTTP/2 is not vulnerable to
> +header injection in the way HTTP/1 is, but x/net/http2 doesn't validate
> +the header and will go into a retry loop when the server rejects it.
> +CL 506995 adds the necessary validation to x/net/http2.
> +
> +Updates #60374
> +Fixes #61075
> +For CVE-2023-29406
> +
> +Change-Id: I05cb6866a9bead043101954dfded199258c6dd04
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/506996
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +(cherry picked from commit 499458f7ca04087958987a33c2703c3ef03e27e2)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/507358
> +Run-TryBot: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +
> +CVE: CVE-2023-29406
> +Upstream-Status: Backport [5fa6923b1ea891400153d04ddf1545e23b40041b]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/net/http/http_test.go      | 29 ----------------------
> + src/net/http/request.go        | 45 ++++++++--------------------------
> + src/net/http/request_test.go   | 11 ++-------
> + src/net/http/transport_test.go | 18 ++++++++++++++
> + 4 files changed, 30 insertions(+), 73 deletions(-)
> +
> +diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go
> +index 0d92fe5..f03272a 100644
> +--- a/src/net/http/http_test.go
> ++++ b/src/net/http/http_test.go
> +@@ -48,35 +48,6 @@ func TestForeachHeaderElement(t *testing.T) {
> +       }
> + }
> +
> +-func TestCleanHost(t *testing.T) {
> +-      tests :=3D []struct {
> +-              in, want string
> +-      }{
> +-              {"www.google.com", "www.google.com"},
> +-              {"www.google.com foo", "www.google.com"},
> +-              {"www.google.com/foo", "www.google.com"},
> +-              {" first character is a space", ""},
> +-              {"[1::6]:8080", "[1::6]:8080"},
> +-
> +-              // Punycode:
> +-              {"=D0=B3=D0=BE=D1=84=D0=B5=D1=80.=D1=80=D1=84/foo", "xn--=
c1ae0ajs.xn--p1ai"},
> +-              {"b=C3=BCcher.de", "xn--bcher-kva.de"},
> +-              {"b=C3=BCcher.de:8080", "xn--bcher-kva.de:8080"},
> +-              // Verify we convert to lowercase before punycode:
> +-              {"B=C3=9CCHER.de", "xn--bcher-kva.de"},
> +-              {"B=C3=9CCHER.de:8080", "xn--bcher-kva.de:8080"},
> +-              // Verify we normalize to NFC before punycode:
> +-              {"goph=C3=A9r.nfc", "xn--gophr-esa.nfc"},            // N=
FC input; no work needed
> +-              {"goph\u0065\u0301r.nfd", "xn--gophr-esa.nfd"}, // NFD in=
put
> +-      }
> +-      for _, tt :=3D range tests {
> +-              got :=3D cleanHost(tt.in)
> +-              if tt.want !=3D got {
> +-                      t.Errorf("cleanHost(%q) =3D %q, want %q", tt.in, =
got, tt.want)
> +-              }
> +-      }
> +-}
> +-
> + // Test that cmd/go doesn't link in the HTTP server.
> + //
> + // This catches accidental dependencies between the HTTP transport and
> +diff --git a/src/net/http/request.go b/src/net/http/request.go
> +index 09cb0c7..2f4e740 100644
> +--- a/src/net/http/request.go
> ++++ b/src/net/http/request.go
> +@@ -17,7 +17,6 @@ import (
> +       "io"
> +       "mime"
> +       "mime/multipart"
> +-      "net"
> +       "net/http/httptrace"
> +       "net/http/internal/ascii"
> +       "net/textproto"
> +@@ -27,6 +26,7 @@ import (
> +       "strings"
> +       "sync"
> +
> ++      "golang.org/x/net/http/httpguts"
> +       "golang.org/x/net/idna"
> + )
> +
> +@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy bo=
ol, extraHeaders Header, waitF
> +       // is not given, use the host from the request URL.
> +       //
> +       // Clean the host, in case it arrives with unexpected stuff in it=
.
> +-      host :=3D cleanHost(r.Host)
> ++      host :=3D r.Host
> +       if host =3D=3D "" {
> +               if r.URL =3D=3D nil {
> +                       return errMissingHost
> +               }
> +-              host =3D cleanHost(r.URL.Host)
> ++              host =3D r.URL.Host
> ++      }
> ++      host, err =3D httpguts.PunycodeHostPort(host)
> ++      if err !=3D nil {
> ++              return err
> ++      }
> ++      if !httpguts.ValidHostHeader(host) {
> ++              return errors.New("http: invalid Host header")
> +       }
> +
> +       // According to RFC 6874, an HTTP client, proxy, or other
> +@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {
> +       return idna.Lookup.ToASCII(v)
> + }
> +
> +-// cleanHost cleans up the host sent in request's Host header.
> +-//
> +-// It both strips anything after '/' or ' ', and puts the value
> +-// into Punycode form, if necessary.
> +-//
> +-// Ideally we'd clean the Host header according to the spec:
> +-//   https://tools.ietf.org/html/rfc7230#section-5.4 (Host =3D uri-host=
 [ ":" port ]")
> +-//   https://tools.ietf.org/html/rfc7230#section-2.7 (uri-host -> rfc39=
86's host)
> +-//   https://tools.ietf.org/html/rfc3986#section-3.2.2 (definition of h=
ost)
> +-// But practically, what we are trying to avoid is the situation in
> +-// issue 11206, where a malformed Host header used in the proxy context
> +-// would create a bad request. So it is enough to just truncate at the
> +-// first offending character.
> +-func cleanHost(in string) string {
> +-      if i :=3D strings.IndexAny(in, " /"); i !=3D -1 {
> +-              in =3D in[:i]
> +-      }
> +-      host, port, err :=3D net.SplitHostPort(in)
> +-      if err !=3D nil { // input was just a host
> +-              a, err :=3D idnaASCII(in)
> +-              if err !=3D nil {
> +-                      return in // garbage in, garbage out
> +-              }
> +-              return a
> +-      }
> +-      a, err :=3D idnaASCII(host)
> +-      if err !=3D nil {
> +-              return in // garbage in, garbage out
> +-      }
> +-      return net.JoinHostPort(a, port)
> +-}
> +-
> + // removeZone removes IPv6 zone identifier from host.
> + // E.g., "[fe80::1%en0]:8080" to "[fe80::1]:8080"
> + func removeZone(host string) string {
> +diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
> +index fac12b7..368e87a 100644
> +--- a/src/net/http/request_test.go
> ++++ b/src/net/http/request_test.go
> +@@ -776,15 +776,8 @@ func TestRequestBadHost(t *testing.T) {
> +       }
> +       req.Host =3D "foo.com with spaces"
> +       req.URL.Host =3D "foo.com with spaces"
> +-      req.Write(logWrites{t, &got})
> +-      want :=3D []string{
> +-              "GET /after HTTP/1.1\r\n",
> +-              "Host: foo.com\r\n",
> +-              "User-Agent: " + DefaultUserAgent + "\r\n",
> +-              "\r\n",
> +-      }
> +-      if !reflect.DeepEqual(got, want) {
> +-              t.Errorf("Writes =3D %q\n  Want =3D %q", got, want)
> ++      if err :=3D req.Write(logWrites{t, &got}); err =3D=3D nil {
> ++              t.Errorf("Writing request with invalid Host: succeded, wa=
nt error")
> +       }
> + }
> +
> +diff --git a/src/net/http/transport_test.go b/src/net/http/transport_tes=
t.go
> +index eeaa492..58f12af 100644
> +--- a/src/net/http/transport_test.go
> ++++ b/src/net/http/transport_test.go
> +@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t *te=
sting.T) {
> +       close(r2c)
> +       wg.Wait()
> + }
> ++
> ++func TestRequestSanitization(t *testing.T) {
> ++      setParallel(t)
> ++      defer afterTest(t)
> ++
> ++      ts :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(rw Respon=
seWriter, req *Request) {
> ++              if h, ok :=3D req.Header["X-Evil"]; ok {
> ++                      t.Errorf("request has X-Evil header: %q", h)
> ++              }
> ++      })).ts
> ++      defer ts.Close()
> ++      req, _ :=3D NewRequest("GET", ts.URL, nil)
> ++      req.Host =3D "go.dev\r\nX-Evil:evil"
> ++      resp, _ :=3D ts.Client().Do(req)
> ++      if resp !=3D nil {
> ++              resp.Body.Close()
> ++      }
> ++}
> +--
> +2.35.5
> +
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185367): https://lists.openembedded.org/g/openembedde=
d-core/message/185367
> Mute This Topic: https://lists.openembedded.org/mt/100496289/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

