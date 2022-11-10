Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031BDC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:55:32 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.9153.1668095728056550166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 07:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UVS8jqoa;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id m22so6014598eji.10
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f8CrtnC7+Ij+d61jdcEaCPBsBJchVfDxUZ1aA7wzIbE=;
        b=UVS8jqoaMdm6D3FVTYWQcI3ggHVG2zQrmMXXKI6ZLHSD3zSt28msLd9szvusvSzhpu
         S/Hp/SMsrp7mfyvC7tJBlq7hamxPvJAsPVP90ls8I6jX3Ftk9I2bSYethdkORaeZqGlW
         N4Q4ZpntZns4KaX1Xh9zRPCHCG4pBtJVvrQljz1sDexaVKJG56GI0AF+dxxaien/7UtA
         eSrvIHdrsw2dcN/G66xIBOOQubcdReMYuWkt71Nki0ClSyIyfj3hQC3s62xlSMtM9BS3
         lDK3cE40tAi1hhNnM0Ly00AtTPxX6QnJJTR1cBqWd6SKYg2Y/3qMm9YT/t+o0LdxkJpX
         TpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8CrtnC7+Ij+d61jdcEaCPBsBJchVfDxUZ1aA7wzIbE=;
        b=FJObZBaD8UYWOduNxQYa0WYYZQHLeY7kRcoTZMJ69TFsOt6ggKGdBXRMmUU2RQW2/3
         bOTwPY2JCRcbzp5AGOyeBeH43LJAtSvB9RCacyShzyscLmaaQHudzBIoyb/MXDPEtolQ
         skMaylJaxfBlsIogzNw/K2F0E7CYwVQ+N9QQ2mMaiYTwiJzIufcttdLMF9PHZcHMY+Ft
         3kv1xQvHGeJbKppDMihsTeY2ZZcir+xPFT7zeCPC7a/e9sFlLGwqESoKe0rLKPxy4sms
         yPdjNstxic+AiCQEtIds0wRGvBenUiEiqHROmOFe9DgpsnAp69CnKOqXd1VEst3/ExW8
         +NzA==
X-Gm-Message-State: ACrzQf3BWhi8buAMOOTZnYHwu722CdkBzpcN4zoP/5ytyrH0MNGcl20K
	PfUrA+FavS8wovbXz6y/Cf+j0DPSdCyfk6zVY07Q8Q==
X-Google-Smtp-Source: AMsMyM57VfYHUQWbtb3WjVR+wc5kfOUYH6knFs2G3PV0IzxWV4u5tMWIYl9akMR3j9eLCtlxt5PP3JOFqUTWW2oW+zY=
X-Received: by 2002:a17:906:dc8c:b0:7ad:a030:c305 with SMTP id
 cs12-20020a170906dc8c00b007ada030c305mr58628829ejc.132.1668095726224; Thu, 10
 Nov 2022 07:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20221108081323.89901-1-hprajapati@mvista.com>
In-Reply-To: <20221108081323.89901-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Nov 2022 05:55:15 -1000
Message-ID: <CAOSpxdaKqN0afKDuW0Dz158iaDuonDTeVoieAg8x+Zhb2ZZWzg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] golang: CVE-2022-2880 ReverseProxy
 should not forward unparseable query parameters
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173079

Unfortunately this patch fails to apply:

Applying: golang: CVE-2022-2880 ReverseProxy should not forward
unparseable query parameters
error: sha1 information is lacking or useless
(meta/recipes-devtools/go/go-1.17.13.inc).
error: could not build fake ancestor
Patch failed at 0001 golang: CVE-2022-2880 ReverseProxy should not
forward unparseable query parameters

Steve

On Mon, Nov 7, 2022 at 10:13 PM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Upstream-Status: Backport from https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.18/CVE-2022-2880.patch            | 164 ++++++++++++++++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
> index b9129e3d75..8230cf2187 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -18,6 +18,7 @@ SRC_URI += "\
>      file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://CVE-2022-27664.patch \
>      file://CVE-2022-41715.patch \
> +    file://CVE-2022-2880.patch \
>  "
>  SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch
> new file mode 100644
> index 0000000000..ef274a8543
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch
> @@ -0,0 +1,164 @@
> +From f91f888dd6f10e3c776d4a6b8b776241cca67a9e Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Tue, 8 Nov 2022 10:35:06 +0530
> +Subject: [PATCH] CVE-2022-2880
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e]
> +CVE: CVE-2022-2880
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +
> +net/http/httputil: avoid query parameter
> +
> +Query parameter smuggling occurs when a proxy's interpretation
> +of query parameters differs from that of a downstream server.
> +Change ReverseProxy to avoid forwarding ignored query parameters.
> +
> +Remove unparsable query parameters from the outbound request
> +
> +   * if req.Form != nil after calling ReverseProxy.Director; and
> +   * before calling ReverseProxy.Rewrite.
> +
> +This change preserves the existing behavior of forwarding the
> +raw query untouched if a Director hook does not parse the query
> +by calling Request.ParseForm (possibly indirectly).
> +---
> + src/net/http/httputil/reverseproxy.go      | 36 +++++++++++
> + src/net/http/httputil/reverseproxy_test.go | 74 ++++++++++++++++++++++
> + 2 files changed, 110 insertions(+)
> +
> +diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
> +index 8b63368..c76eec6 100644
> +--- a/src/net/http/httputil/reverseproxy.go
> ++++ b/src/net/http/httputil/reverseproxy.go
> +@@ -249,6 +249,9 @@ func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
> +       }
> +
> +       p.Director(outreq)
> ++      if outreq.Form != nil {
> ++              outreq.URL.RawQuery = cleanQueryParams(outreq.URL.RawQuery)
> ++      }
> +       outreq.Close = false
> +
> +       reqUpType := upgradeType(outreq.Header)
> +@@ -628,3 +631,36 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
> +       _, err := io.Copy(c.backend, c.user)
> +       errc <- err
> + }
> ++
> ++func cleanQueryParams(s string) string {
> ++      reencode := func(s string) string {
> ++              v, _ := url.ParseQuery(s)
> ++              return v.Encode()
> ++      }
> ++      for i := 0; i < len(s); {
> ++              switch s[i] {
> ++              case ';':
> ++                      return reencode(s)
> ++              case '%':
> ++                      if i+2 >= len(s) || !ishex(s[i+1]) || !ishex(s[i+2]) {
> ++                              return reencode(s)
> ++                      }
> ++                      i += 3
> ++              default:
> ++                      i++
> ++              }
> ++      }
> ++      return s
> ++}
> ++
> ++func ishex(c byte) bool {
> ++      switch {
> ++      case '0' <= c && c <= '9':
> ++              return true
> ++      case 'a' <= c && c <= 'f':
> ++              return true
> ++      case 'A' <= c && c <= 'F':
> ++              return true
> ++      }
> ++      return false
> ++}
> +diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/httputil/reverseproxy_test.go
> +index 4b6ad77..8c0a4f1 100644
> +--- a/src/net/http/httputil/reverseproxy_test.go
> ++++ b/src/net/http/httputil/reverseproxy_test.go
> +@@ -1517,3 +1517,77 @@ func TestJoinURLPath(t *testing.T) {
> +               }
> +       }
> + }
> ++
> ++const (
> ++      testWantsCleanQuery = true
> ++      testWantsRawQuery   = false
> ++)
> ++
> ++func TestReverseProxyQueryParameterSmugglingDirectorDoesNotParseForm(t *testing.T) {
> ++      testReverseProxyQueryParameterSmuggling(t, testWantsRawQuery, func(u *url.URL) *ReverseProxy {
> ++              proxyHandler := NewSingleHostReverseProxy(u)
> ++              oldDirector := proxyHandler.Director
> ++              proxyHandler.Director = func(r *http.Request) {
> ++                      oldDirector(r)
> ++              }
> ++              return proxyHandler
> ++      })
> ++}
> ++
> ++func TestReverseProxyQueryParameterSmugglingDirectorParsesForm(t *testing.T) {
> ++      testReverseProxyQueryParameterSmuggling(t, testWantsCleanQuery, func(u *url.URL) *ReverseProxy {
> ++              proxyHandler := NewSingleHostReverseProxy(u)
> ++              oldDirector := proxyHandler.Director
> ++              proxyHandler.Director = func(r *http.Request) {
> ++                      // Parsing the form causes ReverseProxy to remove unparsable
> ++                      // query parameters before forwarding.
> ++                      r.FormValue("a")
> ++                      oldDirector(r)
> ++              }
> ++              return proxyHandler
> ++      })
> ++}
> ++
> ++func testReverseProxyQueryParameterSmuggling(t *testing.T, wantCleanQuery bool, newProxy func(*url.URL) *ReverseProxy) {
> ++      const content = "response_content"
> ++      backend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
> ++              w.Write([]byte(r.URL.RawQuery))
> ++      }))
> ++      defer backend.Close()
> ++      backendURL, err := url.Parse(backend.URL)
> ++      if err != nil {
> ++              t.Fatal(err)
> ++      }
> ++      proxyHandler := newProxy(backendURL)
> ++      frontend := httptest.NewServer(proxyHandler)
> ++      defer frontend.Close()
> ++
> ++      // Don't spam output with logs of queries containing semicolons.
> ++      backend.Config.ErrorLog = log.New(io.Discard, "", 0)
> ++      frontend.Config.ErrorLog = log.New(io.Discard, "", 0)
> ++
> ++      for _, test := range []struct {
> ++              rawQuery   string
> ++              cleanQuery string
> ++      }{{
> ++              rawQuery:   "a=1&a=2;b=3",
> ++              cleanQuery: "a=1",
> ++      }, {
> ++              rawQuery:   "a=1&a=%zz&b=3",
> ++              cleanQuery: "a=1&b=3",
> ++      }} {
> ++              res, err := frontend.Client().Get(frontend.URL + "?" + test.rawQuery)
> ++              if err != nil {
> ++                      t.Fatalf("Get: %v", err)
> ++              }
> ++              defer res.Body.Close()
> ++              body, _ := io.ReadAll(res.Body)
> ++              wantQuery := test.rawQuery
> ++              if wantCleanQuery {
> ++                      wantQuery = test.cleanQuery
> ++              }
> ++              if got, want := string(body), wantQuery; got != want {
> ++                      t.Errorf("proxy forwarded raw query %q as %q, want %q", test.rawQuery, got, want)
> ++              }
> ++      }
> ++}
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172952): https://lists.openembedded.org/g/openembedded-core/message/172952
> Mute This Topic: https://lists.openembedded.org/mt/94886241/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

