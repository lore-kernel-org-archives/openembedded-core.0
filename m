Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DB1CF6AB9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:47:20 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3256.1767865634652299738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVZcpmnA;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8888a1c50e8so35369806d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767865634; x=1768470434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3gWwsfit26fr5kk5u1Uc4rzuxvZap74kFI/stR3ALqA=;
        b=CVZcpmnAL2BADn9Dc0dApAfZUrP7vqb0pw98SIROTImg8zDcuN28b8+SLkROvQ2cd/
         KA+k55OZQWoD9eBVg/WUvnck1UUyYMuOtOeTwSgiY9dPk6aa8T4SuaY49pHJRcaYOx8Y
         kMO5kJqx5r0AGd3W8mOhLryd2VwcJIboSaGB1KWodZZTWoXg1XVHVBCFnNtPfZ86FwwL
         PReLkQf9FrIVkkjNioJpZUKMGI9ZUr4oWYxO7koV7DAGzkYT8YpoJOKhrrlRmi0M32cX
         U+hJQaVLdanM5+2pj+LuplFDQ8KLNG2yYyvBtLYD1QUiAGFivzOLuXKkv8UpGF8fD+6m
         AWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865634; x=1768470434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gWwsfit26fr5kk5u1Uc4rzuxvZap74kFI/stR3ALqA=;
        b=HqshcB7tbgbzhDaktdCXDdwiAxh+DIyIJ0ESUfMC2soeGVS1X2tgYeoV2LdiuIygw1
         mca8olDm50pQwWVglkpsThW5xNqE2NaOKZb5/LvS1sfoYAnoZjU0Sbcm2nTNMD1s908g
         213Pt/2hljDc2084WKPTjC0HRM1x7msSlqRJG9TFtzQpxuqKiuO7mZ3XnLsU+Qqnz2FK
         XZR3B40PoYVpjIplYdaBHcfz/otVa+FJzBzXzPugf3kTAt7YPmuNUjI/IcjFRz+gWrU1
         PMGZYieW9Yd2nJ9CpZx+/rBbSLU/6zOgSXoAPvRrXUv+YXEe6did+shOyyTWgoh3TQ73
         3ugA==
X-Gm-Message-State: AOJu0YzvZjkyKgC1yyIm0vZ7TMuQb63hmPWYB9WiiWVtFIqdUd3LE+Bg
	b2oR1nyKvd8Xz1RYk5qAgK5iYv6XchINy66omxAmUO8DCJnd0u2H+USmCWDZkEq7QhTy4AmE1XK
	VNz/vIc6bIILKzcL2WMXyr6P5yXzgjAYeEw==
X-Gm-Gg: AY/fxX7aHmDx45mEyLRQG1wMjDjj9Q1kM70JfwTqF8leYiof895B1qHHt6M8G68noCA
	k8Bjtw5OJ0aPeo7dTz1FU1frAAKKj4MUF9a05NqzFipovn5o4BpdgTOh7N4UBVK3Sr1PRxOiBGB
	5/XMonIA7ddLd+clOdeH0EWYLKFjCmWwsGSPf2cyfp1hr1dOiBopRyAA08L7EjxqqTLVyBX0tyJ
	y+BbYj9jx/Sd9yxUp19pUWDnWTKaf9FHUGTOpfjWuz1sBwbp/7mbfFOGhbjMahbvAzZsL7hIcga
	/viGV42pv62RviypJ4eZ5pHNd+xprg==
X-Google-Smtp-Source: AGHT+IFgmPew0lAhfc2MyQ0xDvbC7ysGyWV2DcjA3ALj+lR/bhp+JRYxcYy+MFru5fFje3pjHpO3M0crpt7MYC33KC0=
X-Received: by 2002:a05:6214:19e9:b0:88f:fbcf:e7cb with SMTP id
 6a1803df08f44-890842558e0mr71703846d6.51.1767865633514; Thu, 08 Jan 2026
 01:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20260108060842.3340603-1-changqing.li@windriver.com>
In-Reply-To: <20260108060842.3340603-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Jan 2026 10:47:01 +0100
X-Gm-Features: AQt7F2r4ikufJcC_tsF2iYO2XK8LvuT4b_PLatRXLoqZLuoiCcLX02gVnpowwjY
Message-ID: <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] go.bbclass: set buildid to empty string to
 improve reproducibility
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229049

There's go-helloworld in oe-core, which is reproducible as it is. How
can the non-reproducibility that this patch is fixing be observed? Can
we improve our tests for it?

Alex

On Thu, 8 Jan 2026 at 07:08, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Go packages and binaries are stamped with build IDs that record both the
> action ID, which is a hash of the inputs to the action that produced the
> packages or binary, and the content ID, which is a hash of the action
> output, namely the archive or binary itself, Refer [1].
>
> And action ID include hash of modroot, which will include build path,
> so this make go package not reproducible.
> Refer [2], keying off module path instead of module root directory is a TODO.
>
> [snip of log]
> HASH[moduleIndex]: "go1.25.3"
> HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
> HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n"
> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\n"
> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
> HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b
>
> Report this issue to upstream, refer [3]
> Workaround the reproducible by setting buildid to empty, refer [4]
>
> Refer:
> [1] https://github.com/golang/go/blob/master/src/cmd/go/internal/work/buildid.go#L26
> [2] https://github.com/golang/go/blob/master/src/cmd/go/internal/modindex/read.go#L70
> [1] https://github.com/golang/go/issues/77086
> [2] https://github.com/golang/go/issues/34186
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-recipe/go.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
> index b540471ba2..1c43b36fc0 100644
> --- a/meta/classes-recipe/go.bbclass
> +++ b/meta/classes-recipe/go.bbclass
> @@ -51,11 +51,12 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
>  GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
>  GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
>  GO_LINKMODE ?= ""
> +GO_BUILDID ?= "-buildid="
>  GO_EXTRA_LDFLAGS ?= ""
>  GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
>  # Use system loader. If uninative is used, the uninative loader will be patched automatically
>  GO_LINUXLOADER:class-native = ""
> -GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
> +GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'"'
>  export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
>  export GOPATH_OMIT_IN_ACTIONID ?= "1"
>  export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229038): https://lists.openembedded.org/g/openembedded-core/message/229038
> Mute This Topic: https://lists.openembedded.org/mt/117148599/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

