Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92268C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 15:59:04 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.22298.1671638338700865126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 07:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zknGCK8f;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id a1so7587929edf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 07:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+333I+VehYVHijOTGQ66qhkdN2+cEyJDTjjMv0gPxRU=;
        b=zknGCK8f8bFEPV6yJC3E76gAJTLCGme+QOF8ICF4ApXdY31XmUzqwaEkxuf/vEUt1u
         5ByKLAi8eSugQ+AnqNuugI0Nt8Xuwrvmh35KjXhUBDr4cF9JZR3nCN25MO8W6izALqVQ
         kkGT0BXveKY5VsRGHGcQOd6CoDgXXCGLGUiV8/sdbxHfB+KE4Cayaki2ElYftB3DYFV2
         2KEQQrIhV5/NRW/jRqqtzPTbwB1RlATxASkP7H1F8cBXf3Uqpl3c92rIcKl/vfdZXZkA
         JcE34oMJaLnAnAt3WYfFtPvzyA4zWSjy+vSU3OmWO9FkBo4qZuh34ZSQguDDz2WuS9yz
         HKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+333I+VehYVHijOTGQ66qhkdN2+cEyJDTjjMv0gPxRU=;
        b=uCO/vMsYtArJIETfOVr0CLZZ1Dk8O/pdrtqJxYyT+TDJQeg4VIHDHJq9niXQbbWPtQ
         vyrR6NGbw0oae0NheH3FQ4iXlmO0rqcnejEkNdcLGyrqffL/iiV+c4R967DB4Z2eifOx
         yHPfK7QgEIObwM/OFxQtWAdQLx/1Q1o/Ou3ogY3DRL+VMuMJznx3WQI8120fnLHaq5/N
         vxKZsVdDRBB6HaOurt/tu72C2wEN91MvsAI8+5FK1fJRiOJ64qe5Td7oTr/1zqfG16cU
         xdZrJZlBKoB/L7/1lIZhWXcq6u++DoB7zbtmhoZ+oTRB4u5i7SRHxiW1Vella06vk9Wp
         TfQA==
X-Gm-Message-State: AFqh2ko1oNvmHM7nVsPZX9PWQCMs18LfK0NkEWBW423SigIUTDo0Wu08
	x6TqEe5w5aNSo8oBt4A3a+HQ2udU92oAwOq/RqncVw==
X-Google-Smtp-Source: AMrXdXtMlQ7xixnr5nw5Misao3Y3vJbsePBA+X9jQ+Oq+Cp72QEGJxtnSeaDqVjWzzEcr7rWRjCK0HR+q7q1Fzf000k=
X-Received: by 2002:aa7:c246:0:b0:46b:7645:86a9 with SMTP id
 y6-20020aa7c246000000b0046b764586a9mr193629edo.311.1671638336916; Wed, 21 Dec
 2022 07:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221051735.32282-1-hprajapati@mvista.com>
In-Reply-To: <20221221051735.32282-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 Dec 2022 05:58:45 -1000
Message-ID: <CAOSpxdbqvnbPBe8Sj2_jq10ne5cnz11EXVho+UWQXx5q-50XNg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] go: fix CVE-2022-41717 Excessive
 memory use in got server
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174918

On Tue, Dec 20, 2022 at 7:17 PM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Upstream-Status: Backport from https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
>  .../go/go-1.18/CVE-2022-41717.patch           | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
> index 9c467d63b2..b29efe3a2f 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -18,6 +18,7 @@ SRC_URI += "\
>      file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://CVE-2022-27664.patch \
>      file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
> +    file://CVE-2022-41717.patch \
>  "
>  SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
> new file mode 100644
> index 0000000000..05452ac825
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
> @@ -0,0 +1,90 @@
> +From 618120c165669c00a1606505defea6ca755cdc27 Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Wed, 30 Nov 2022 16:46:33 -0500
> +Subject: [PATCH] [release-branch.go1.19] net/http: update bundled
> + golang.org/x/net/http2
> +
> +Disable cmd/internal/moddeps test, since this update includes PRIVATE
> +track fixes.
> +
> +For #56350.
> +For #57009.
> +Fixes CVE-2022-41717.
> +
> +Change-Id: I5c6ce546add81f361dcf0d5123fa4eaaf8f0a03b
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1663835
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/455363
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Jenny Rakoczy <jenny@golang.org>
> +Reviewed-by: Michael Pratt <mpratt@google.com>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27]
> +CVE: CVE-2022-41717
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/cmd/internal/moddeps/moddeps_test.go |  2 ++
> + src/net/http/h2_bundle.go                | 18 +++++++++++-------
> + 2 files changed, 13 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
> +index 56c3b25..8552c4a 100644
> +--- a/src/cmd/internal/moddeps/moddeps_test.go
> ++++ b/src/cmd/internal/moddeps/moddeps_test.go
> +@@ -34,6 +34,8 @@ import (

This patch doesn't apply for me:

ERROR: go-cross-core2-64-1.17.13-r0 do_patch: Applying patch
'CVE-2022-41717.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/go-cross-core2-64/1.17.13-r0/go'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/go-cross-core2-64/1.17.13-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2022-41717.patch
patching file src/cmd/internal/moddeps/moddeps_test.go
Hunk #1 FAILED at 34.
1 out of 1 hunk FAILED -- rejects in file
src/cmd/internal/moddeps/moddeps_test.go
patching file src/net/http/h2_bundle.go
Hunk #1 succeeded at 4189 (offset 1 line).
Hunk #2 succeeded at 4369 (offset 1 line).
Hunk #3 succeeded at 4391 (offset 1 line).
Patch CVE-2022-41717.patch does not apply (enforce with -f)

Steve

> + // See issues 36852, 41409, and 43687.
> + // (Also see golang.org/issue/27348.)
> + func TestAllDependencies(t *testing.T) {
> ++      t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
> ++
> +       goBin := testenv.GoToolPath(t)
> +
> +       // Ensure that all packages imported within GOROOT
> +diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
> +index b049a79..92c2c12 100644
> +--- a/src/net/http/h2_bundle.go
> ++++ b/src/net/http/h2_bundle.go
> +@@ -4188,6 +4188,7 @@ type http2serverConn struct {
> +       headerTableSize             uint32
> +       peerMaxHeaderListSize       uint32            // zero means unknown (default)
> +       canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
> ++      canonHeaderKeysSize         int               // canonHeader keys size in bytes
> +       writingFrame                bool              // started writing a frame (on serve goroutine or separate)
> +       writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
> +       needsFrameFlush             bool              // last frame write wasn't a flush
> +@@ -4367,6 +4368,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
> +       }
> + }
> +
> ++// maxCachedCanonicalHeadersKeysSize is an arbitrarily-chosen limit on the size
> ++// of the entries in the canonHeader cache.
> ++// This should be larger than the size of unique, uncommon header keys likely to
> ++// be sent by the peer, while not so high as to permit unreasonable memory usage
> ++// if the peer sends an unbounded number of unique header keys.
> ++const http2maxCachedCanonicalHeadersKeysSize = 2048
> ++
> + func (sc *http2serverConn) canonicalHeader(v string) string {
> +       sc.serveG.check()
> +       http2buildCommonHeaderMapsOnce()
> +@@ -4382,14 +4390,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
> +               sc.canonHeader = make(map[string]string)
> +       }
> +       cv = CanonicalHeaderKey(v)
> +-      // maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
> +-      // entries in the canonHeader cache. This should be larger than the number
> +-      // of unique, uncommon header keys likely to be sent by the peer, while not
> +-      // so high as to permit unreaasonable memory usage if the peer sends an unbounded
> +-      // number of unique header keys.
> +-      const maxCachedCanonicalHeaders = 32
> +-      if len(sc.canonHeader) < maxCachedCanonicalHeaders {
> ++      size := 100 + len(v)*2 // 100 bytes of map overhead + key + value
> ++      if sc.canonHeaderKeysSize+size <= http2maxCachedCanonicalHeadersKeysSize {
> +               sc.canonHeader[v] = cv
> ++              sc.canonHeaderKeysSize += size
> +       }
> +       return cv
> + }
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174900): https://lists.openembedded.org/g/openembedded-core/message/174900
> Mute This Topic: https://lists.openembedded.org/mt/95801606/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

