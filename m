Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D19EC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 21:22:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.33925.1752700935441415963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 14:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tep1I1ti;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-711d4689084so2477317b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752700934; x=1753305734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/8TYMj+QOy50YdRBK0d1Z+5HBsxxHbT+g/jQrtLYx0=;
        b=Tep1I1tin6XLPkWScuZmI++tNH6euQIYtCvesYmWBHIMjb5EQsh5iuh9AKnmkwiPou
         XeDevElL6yo0COHJRzsDjJz2yp7vSnleu+rJUPd3logB0XG/gJzHCImW5BzeI8i72Qwb
         VxWgAfYfzCe6KP5fRl8GfqOwX4/6AGFNjIiAQywtsQK0kRRHxNGbrZyGp8i2NemUSAdv
         GQKhs0aAQAllMQ3LomW7AD7dz09rUVsWIhUZSrmQfZXE3K2SR00fnwXcJtlTcfH04T/R
         pcQ0+A3KKjfDJl7sq9Tyad1JOUcYuq19Z1syWbehAgBhJvPJremnr/twYuJP/7B1bGG7
         5Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752700934; x=1753305734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/8TYMj+QOy50YdRBK0d1Z+5HBsxxHbT+g/jQrtLYx0=;
        b=knPXnuEZQEH4mIiRphmgPteqbTD0o+u4LPdRY+FcY+Dz0G8B8TSogPik9n7kQAmlNe
         w7IRJVvhm2OLfriOvsFAXSx8qpDJ4F6uvuz3llv89suC2ZhyDKG5zzc7uZ0JOvd9q4BV
         q/CuA6eaVzNwmhe/5llgQPJZ31GNahuiUCVMFTnx6gv/pwTZs0Rqy3Vjw5F8qAvWmtof
         M/e7qVVOjFq1vcs4BU6cm/TLi/dvMDRgOyJMySXe1e0Qx08R3zyKiL9dpzEiLt25lafc
         OAsirFnSugTq6pPDqyTpyNnngyRVUZy67lA9R3huKaUXlDc+X09i/n91GOY3HB5CafU/
         qMMg==
X-Gm-Message-State: AOJu0YxEdzQf7oFOepq/vVKuscUVJGuEENQLbRZurgYsiYraA7jGclAU
	b5C/cCr2wjsDfXC3Hrijn5UGlZJb70nYjp4Pye/0LhviV2AufhmVX+50hzgToyyfD/08mksVGIW
	R322HmtehT23qJZOQICENZ8YExiQ0AAN4ARXy+YVKng3ajQ60IzJqExc=
X-Gm-Gg: ASbGncush5OV/PBFjzOlTGtLM7rTMhtTQTZbItH6vus/Gumz8+/W3nuXB8//Bjvf1MH
	8dYLfshGCkYpFSJsCwsw1UW+enBnAQM9xKiamP5gb43ezQq6DN7QvAMr+bi0/vVieyOT1e2clje
	ffuQ1ykbK9VkpUeViTIl5EmycNj+RxiyPiwxQYkFB0DHmxzq43TcpIWP9rwj+hHuDPloCVFopUg
	Kr7AhkQgGafzL3UW2zfemgRXwuKHvJlTp2e1Os=
X-Google-Smtp-Source: AGHT+IGUi6Vu5SJgeDRxD1luUq+3kQVzcrEKL3W+cT2e718L0uZxsFvnoq52tKLTrAbT6q33zXhSmFpHco66QfQ5yrE=
X-Received: by 2002:a05:690c:6a0d:b0:70c:9364:2c62 with SMTP id
 00721157ae682-7183515a465mr65416957b3.25.1752700934290; Wed, 16 Jul 2025
 14:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250710221053.2418550-1-peter.marko@siemens.com>
In-Reply-To: <20250710221053.2418550-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Jul 2025 14:22:03 -0700
X-Gm-Features: Ac12FXysx2wrLrxmSkV85UPh9HuntLIf9Tr2kSNwXmvVhtprmWujv5cugKCLLSA
Message-ID: <CAOSpxdYxCkPfndRGWQpjAjMYhO3PEnNg8hhSGpxhysLmc-oMcQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] openssl: upgrade 3.2.4 -> 3.2.5
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 21:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220474

Unfortunately I'm getting python3 ptest failures with this patch.

Here are three examples:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1910/st=
eps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1902/st=
eps/12/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1907/st=
eps/12/logs/stdio

Search for "failing ptests" to quickly locate the error in the log.

Steve

On Thu, Jul 10, 2025 at 3:11=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Release information:
> https://github.com/openssl/openssl/blob/openssl-3.2/NEWS.md#major-changes=
-between-openssl-324-and-openssl-325-1-jul-2025
>
> Handles CVE-2025-27587.
>
> Refresh patches.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch       | 2 +-
>  .../openssl/{openssl_3.2.4.bb =3D> openssl_3.2.5.bb}              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.2.4.bb =3D> openssl_=
3.2.5.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-=
not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/000=
1-Configure-do-not-tweak-mips-cflags.patch
> index 3f6ab97795..153bb1e843 100644
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-cflags.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-twe=
ak-mips-cflags.patch
> @@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
>  index 4569952..adf019b 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1485,16 +1485,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help 2>&1` =3D~ m/-mno-cygwin/m)
> +@@ -1486,16 +1486,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --targe=
t-help 2>&1` =3D~ m/-mno-cygwin/m)
>           push @{$config{shared_ldflag}}, "-mno-cygwin";
>           }
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.5.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.2.4.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.2.5.bb
> index c4ad80e734..ca2c0d18bc 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.5.bb
> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D "b23ad7fd9f73e43ad1767e636040e88ba7c9e5775bfa5618=
436a0dd2c17c3716"
> +SRC_URI[sha256sum] =3D "b36347d024a0f5bd09fefcd6af7a58bb30946080eb8ce8f7=
be78562190d09879"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative man=
pages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220131): https://lists.openembedded.org/g/openembedde=
d-core/message/220131
> Mute This Topic: https://lists.openembedded.org/mt/114091452/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

