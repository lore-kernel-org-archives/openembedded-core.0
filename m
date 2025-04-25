Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA72C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:12:17 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.2217.1745568727795968130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHG8m7w6;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so20192506d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745568727; x=1746173527; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCzpT/sgrzUQq9fZuNHkfmJTw9ulSu0tcGozK9/po0=;
        b=GHG8m7w64t5FA567wsOzQcu82F+36Gua3Fj+nemjf5TE8PzJGmh8f1cutd/7eMtmXY
         fKNUWbSUGtF/PRujSS88G61gGLjnEtW7Sp01wA1Rh5dYujixgBnp7k6B9NLnE7wzGNrv
         FCRB3871avhHbzxM+XU0MniFhnBqAD9Ar+s7oGeaWiOqBjT3OZoF9BhYHXUm5IwStxhq
         9NKSgVffKz6DICg8tjuMeu3iW9KVLUSw0lretMCIlnFoQVgOqrPtlr1dbcBGBXaLm1v9
         AvpbuQpaxxLfcuz4Q0Bu8nxkWbLomIZDDPRSthZrZUuoL/klpgpIhDuGzorU7luZJdrj
         Q9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568727; x=1746173527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hCzpT/sgrzUQq9fZuNHkfmJTw9ulSu0tcGozK9/po0=;
        b=iofXwmgNqVKLfDY8abQMWqtm0CyLmlaoZ8yrZJ953PHNEiCRiaZhavIgMFqVXRO96A
         NX8ijcSgKC5Dq56q2Wf9jTsQquYGT4DSRrSeZ+Lj8XyPPw+LlnUNbPFpBuuy24/IwY/J
         PpwU/LEWVkmrPCj9Ud2pLJHSkPiZid+QDf1njOAwixOvBjq4spfT3/58t6dOjwEVj5i4
         AFZemIAiQaJS1IngMHhkKaX6waYN/cawxiA/CtIuAwOvN8v63dIHd5SoeKUL4Y4Wsdx0
         1HraCoOVWuFW4f81yMbNU2F/IkghS2zQ6K2eKuqKOb7Mc0bj6QcouWTkCyXdRvU5QG1W
         LcsQ==
X-Gm-Message-State: AOJu0YyK9Ws+RIvolIG4uGijv0auaKQnYgx7qXbqrrYex51p6N0Gl53m
	ESSjxA9ah3lFMinvJVDRbzny9zvNyfuKhnNjZIj4byxFROcqf95lbmYfPMpNOIlymVkoEFL0jmT
	/E+VDR72L+eXzSz81HjcpZYNT0R9CdA==
X-Gm-Gg: ASbGncuxZbiPiN0dGdL6qKuUeWyfJ5ETy50fanDqoAn8ZC4727Qv4fxOGoOJQu8Gupl
	1YwcYTeBVE8G0kBCViS5lA2Jjoh+NbRXtqcunn0klKUybnRj6f80CVJkfEIxvjiHOP32/Y2OPpv
	3C4vzznSOYsHyehiVI6ffgGPnY4IW3OBKqiIHT0RvcYrShdhhUNOwY+kFClfs1/hr9UY8=
X-Google-Smtp-Source: AGHT+IGvSf8dR8s1CG4an9YWPkhSoAp4zE1p8hGzaGo7kd4uTNFDNwtza7A1jp8QuH+S2zL4zwfWEdhVinGkk+mrZzw=
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id
 6a1803df08f44-6f4cb9d675bmr22839896d6.17.1745568726736; Fri, 25 Apr 2025
 01:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250425073757.498411-1-yi.zhao@windriver.com> <20250425073757.498411-2-yi.zhao@windriver.com>
In-Reply-To: <20250425073757.498411-2-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 10:11:55 +0200
X-Gm-Features: ATxdqUHBqc2uxYtczsekDA2VG_DDH2x9o510hv3A-aHnXzs40hlHAbzRbx_Eg5U
Message-ID: <CANNYZj9p6PoEKJ+FC+K=goQWhGSDi5n+AcGJ8yzq1U5PSXcCcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2 v3] sassc: fix runtime version
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215440

Thanks, v3 for both patches look good.

Can you review usage of these components in core and meta-oe? Are they
optional or hard dependencies?

Alex

On Fri, 25 Apr 2025 at 09:38, Yi Zhao via lists.openembedded.org
<yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>
> The sassc_version.h should be generated from sassc_version.h.in. But
> there is already a sassc_version.h file in source directory. When ${S}
> != ${B}, the sassc_version.h is generated in build directory, and the
> original sassc_version.h in source directory is not overwritten.
> However, the latter is used during the build, resulting in a missing
> runtime version. Remove sassc_version.h from source directory to ensure
> that the one in build directory is used during the build.
>
> Before the fix:
> $ sassc --version
> sassc: [NA]
> libsass: [NA]
> sass2scss: 1.1.1
> sass: 3.5
>
> After the fix:
> $ sassc  --version
> sassc: 3.6.2
> libsass: 3.6.6
> sass2scss: 1.1.1
> sass: 3.5
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...assc_version.h-from-source-directory.patch | 61 +++++++++++++++++++
>  meta/recipes-support/sass/sassc_git.bb        |  4 +-
>  2 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
>
> diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
> new file mode 100644
> index 0000000000..c6717995c5
> --- /dev/null
> +++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-source-directory.patch
> @@ -0,0 +1,61 @@
> +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 24 Apr 2025 21:28:55 +0800
> +Subject: [PATCH] Remove sassc_version.h from source directory
> +
> +The sassc_version.h should be generated from sassc_version.h.in. If the
> +build directory is out of the source directory, the sassc_version.h is
> +generated in build directory and the original sassc_version.h in source
> +directory is not overwritten. However, the latter is used during the
> +build, resulting in a missing runtime version:
> +
> +$ sassc --version
> +sassc: [NA]
> +libsass: [NA]
> +sass2scss: 1.1.1
> +sass: 3.5
> +
> +Remove sassc_version.h from source directory to ensure that the
> +sassc_version.h in build directory is used during the build.
> +
> +Also remove '--dirty' option from 'git describe' command line in
> +version.sh to get rid of '-dirty' suffix from version number that
> +was introduced with this change.
> +
> +Upstream-Status: Submitted [https://github.com/sass/sassc/pull/283]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + sassc_version.h | 8 --------
> + version.sh      | 2 +-
> + 2 files changed, 1 insertion(+), 9 deletions(-)
> + delete mode 100644 sassc_version.h
> +
> +diff --git a/sassc_version.h b/sassc_version.h
> +deleted file mode 100644
> +index 3ca12e3..0000000
> +--- a/sassc_version.h
> ++++ /dev/null
> +@@ -1,8 +0,0 @@
> +-#ifndef SASSC_VERSION_H
> +-#define SASSC_VERSION_H
> +-
> +-#ifndef SASSC_VERSION
> +-#define SASSC_VERSION "[NA]"
> +-#endif
> +-
> +-#endif
> +diff --git a/version.sh b/version.sh
> +index d56af99..cf97d82 100755
> +--- a/version.sh
> ++++ b/version.sh
> +@@ -1,5 +1,5 @@
> + if test "x$SASSC_VERSION" = "x"; then
> +-  SASSC_VERSION=`git describe --abbrev=4 --dirty --always --tags 2>/dev/null`
> ++  SASSC_VERSION=`git describe --abbrev=4 --always --tags 2>/dev/null`
> + fi
> + if test "x$SASSC_VERSION" = "x"; then
> +   SASSC_VERSION=`cat VERSION 2>/dev/null`
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-support/sass/sassc_git.bb
> index b7f57ca244..64e92f48cf 100644
> --- a/meta/recipes-support/sass/sassc_git.bb
> +++ b/meta/recipes-support/sass/sassc_git.bb
> @@ -7,7 +7,9 @@ DEPENDS = "libsass"
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https \
> +           file://0001-Remove-sassc_version.h-from-source-directory.patch"
> +
>  SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
>  S = "${WORKDIR}/git"
>  PV = "3.6.2"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215435): https://lists.openembedded.org/g/openembedded-core/message/215435
> Mute This Topic: https://lists.openembedded.org/mt/112447458/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

