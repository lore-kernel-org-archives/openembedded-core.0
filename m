Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0C3C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 09:27:32 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26199.1786354047813792586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 02:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FqKVMrX1;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8edda5d56a5so13910306d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 02:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786354047; cv=none;
        d=google.com; s=arc-20260327;
        b=KmA5z4pmvMt3+nz8YdW2liYYFDF/PDW7ugQVng0aJw/Y3aGhSirNOBrqnrOTp1YP+E
         hJiAFbqVJUdPXjPp2thUdRD1F3BeaMKwo2x0+nLI6c53mcccSuK+qnsxGY+PwhzK4aID
         9b1RNDFOfMrycQrmPY7Z3uCKE8Eu0ck9wTd6Mh3G52qPIa3iVQcK9zZTsJ1ZmDyc2p/A
         9gGRPtfdTv0MUYiINw+tEBOxka/xWQRl5LTXq2sOLkP+clrXhlfZIdez/nJHqmVKwGtd
         riBGUQ8mCbYWrXDqUi4hB2uWTPVlUt0Cb8GGGjFUWnNiaGIMDJbb3XeTAfvRpIVhXQ1u
         X1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JQsSFDlc0KDEpMWlN/Ohxrz+zCAqMW0BgwFtDBQrRkI=;
        fh=WZ3pXLClGmT4BOVdMybpx6VK1h28CXZemz0HGmu1slE=;
        b=dDmuku6GpNCtLGWyBj5nUsBq4jhUClUe3LIbiB/fzJei9gfw+hwq2fRDt1SrhW9kr5
         cYvAAC5l3dYu53rIYJEIjAILM2XMRtdcG+y6fOntuNHMoQDAshj6RpvudD4PGYckBkab
         n1tz8I/aCWKlLj69f1ERa64tyfD+A6pgz+LgdTIKaNpIVTpl4YRLRLOUFxR0yy1bkqOt
         eoiDk3UPB5Zrjpi1+TI32DIFiOiHGou9Wm/IgotmWJkVzMae/sS86D83zhew1Cdeqe5w
         ruivUCv+fuAyVfD7oIca0hMiySrhHRIhhT9i7qrix8MBjkmd8+g/mDuuEM0N+C0zahwp
         SAIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354047; x=1786958847; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQsSFDlc0KDEpMWlN/Ohxrz+zCAqMW0BgwFtDBQrRkI=;
        b=FqKVMrX1hXMjqdah0izcf8kQB9Ai2zUdIQhIktVXNusBIYS39johMj3S0I4clma4VO
         r83wJqB4udr0muI2MF78cHiSq8obALfXZXSqcdAM0jzt9EBRdSTCyifYM8rCiZsg2tsw
         dIl/LZnkkDiPk5gjJsAP/olKdphAYH9T/wlyYOyXTXu1QxgYRdA8bVmWh9vAaZ/Xwxxc
         JLy3OsBbiw+AEoQRGq4MN5DDb2Qca0Aq4TGGXp5vJIP+WUGW1FtIZjOr27B8kXd+iFDL
         X+OJgkwKdTSasWYsPRW1tluX8hls0QDkM8IH+RGOdYmTL8BwBcgWHghv4iCtLfR+Q7LQ
         x+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354047; x=1786958847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JQsSFDlc0KDEpMWlN/Ohxrz+zCAqMW0BgwFtDBQrRkI=;
        b=iWO+zVRIY9V9KhQUaRKAzG5McFmUdQCf+MPLWcjndnf4GbMr4nUhCZXjY1UsZMO93Y
         7JAlhs0uliTbSa3DsJEvQSm8x65HHG8TtmVlUHlTZQ3QNBqbmHlEx0MXjkA7Veuhng6H
         o9nq8EM7eYIXGPqVrilApRSSN0yKST8LfKjB4xH89VsAScB3xjO1ieV3n2UAer+KNBEx
         /J5G9i9hi90iKVWrLkljvfLbMo/oz2pjeMoyoz/7X14zjM2EM6EnDfi2VoBXdlfF/JAV
         6FcXACv6EbKtAEROKT4KvvpvNtD9Eb3poH2S3lve/f1I+Q712APwl725OJ93feBdDrqS
         kjYg==
X-Gm-Message-State: AOJu0YznQmfjDq9IRkM+xkdLpFCgSNrTMFswnt3hq0d9h/bza3J/qfAt
	i4GrSePx2kdYyL1mXLY6SWXObepCGGQnTRk+9bqMUkAJTsH6xcWYz1jQv//ynZQb2qnAbeWfd7t
	zTEHyrja2DFrwYXvN0sS2qGCmsM6KbiU=
X-Gm-Gg: AR+sD10WbAZ/hIcI8MrT8niLK5Cz+QU43AOxjarGmvKzzzYxoRurH/GUrcQOvRCIsJZ
	/2P+1J43ryadVmGX042DLWphDyqNmsUfB2UvXBxIEtoEzManLgJ7744uSyOnj7qpQQC2J/hDdWG
	pJky4ZRxUkqiOI5ouHNRqzT/VLZyMFrDHG1psEWTpYjxBk4onIrfk5p3X7DzMMU+sPr2AdECZxC
	11hiDGioabw9wvFGpnDoGVK7NO96ToQejBAX/IDB/5ho6bqQlHA3sJsQeQ/sIfDSwPhIGUXqTYe
	0+ZuNeIS0UxZHtJEOMrGeUW+I5pwDolCei7Cs+ll+27ZxAIjJslXN25dtmf81gERjt/IzNb3B4m
	f0cwEoEy6VWXgpyRfN/loCKBd+w==
X-Received: by 2002:a05:6214:2581:b0:8f2:4723:d88d with SMTP id
 6a1803df08f44-90a345ece40mr219382696d6.4.1786354046674; Mon, 10 Aug 2026
 02:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260807100237.1218728-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260807100237.1218728-1-Hemanth.KumarMD@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Aug 2026 11:27:14 +0200
X-Gm-Features: AUfX_mxB8Cnpwe93L7eygecxCXd9bp6PXyvAdmRRC-J1Y4SJw6r8d6Vb6uAAUcM
Message-ID: <CANNYZj80mFKe+=1_6j5j+kFG1WC1xX46WwCx=EVWU7re820Qzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add timeout to HOSTTOOLS
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243119

On Fri, 7 Aug 2026 at 12:03, Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
> The glibc iconv/tst-iconv_prog test uses timeout(1) on the host to
> guard against hangs during charset conversion testing. Since timeout
> is not listed in HOSTTOOLS, it is unavailable in the Yocto build
> environment, causing the test to fail with exit code 127 (command not
> found) instead of the expected conversion error code.
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -533,7 +533,7 @@ HOSTTOOLS += " \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
> -    sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
> +    sleep sort split stat strings strip tail tar tee test timeout touch tr true truncate uname \
>      uniq unzstd wc wget which xargs zstd xz \
>  "

Adding to hosttools just to fix a single test is very excessive.
Rather make it depend on coreutils-native.

Alex

