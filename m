Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C39FD29FFF
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 12:36:24 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8944.1768394181623291713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 04:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ela/2dnP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4327555464cso5169088f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 04:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768394180; x=1768998980; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omgIVgtwZuSd5XvHrl6SVh/WpRkoULay4wVe2+aO+3A=;
        b=ela/2dnPEhO4LaOQ4ebcCtokj6BlFFsWQQ5vXUWJtbXmh0QNy8jaH6kRoUxOeVAdam
         u3SDpj5wMAM0ir2tEIRphF/eCCQNf9CpIjwKrcE/YA6tgO2cqTs+sfQ+Bwi/v42Wvo5r
         648C27cuAbWugdFdjuj4Ax5SNQWYK0sxlA7Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768394180; x=1768998980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omgIVgtwZuSd5XvHrl6SVh/WpRkoULay4wVe2+aO+3A=;
        b=mQYH6UlozMKKRJsmwNFFn6NGWIyGx6dwm8vuTSc5OOISnHawMbUvrmKiV5KaTSP8ru
         x/Jcl8WnC9T2HOhyJfeuBQ2JgEJ8I9jpnthCyYIToLfivSyabxbUg60IMGlc4iOBT70r
         /7WIP1wfkR5FPnX09qjgviGy70PzELukTNa6jAb003OyPASsNYJs78X8jdZJLPBRqR2b
         VG4Q6LOulkDLAWqjT15gGcEg8gs5Ae+2rSn3h0W3qI4vMrz1woxIpRTyPT5Y1TjGIsM5
         zwlpFSuDbRE6jhuvMGOBM8/kUjV6W2KEvng1Kyfzj57GhP8A0/FlNgTtQcYOgzLdKmEW
         HLmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXijEq1bLhU755MMr91xC5sEqRUt178dLgp7pm6amPcrjhUpHUwsZZa1muky+tGIh6Iw4BBqpY1enrnPt2Dsqyx4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygE5iF+Lw9kk+kAlTUS7AsFVN6x4sq8Q8AkA/jxKO+i2bwYDM7
	wZ44ttvCJ9ANEVez2J3SX5rgJYoq9NgolRWokK14mGtSgWbnbPH2vDU63CD4MhEjNUqhfHlwLul
	1aL3K9TooBg==
X-Gm-Gg: AY/fxX6rS+4W9yPzDwZfjruNcSyf0khj5QZ2XV8D0RTVv1l3sXgPXS/1JsWgfQoEfnH
	NXW3eS2dxJwUh65aXWthjnrJK6mQIdSV26A3kgllpW34L7fd5YFY5Lkn5sGJMLFi7lS+IV57nt2
	5wV2zmjHbU/s9SRbqG76MgQVQy7EZ9u3qeQ2FoRF4vaNLUdk2PooAkW0GLCmDaeNQgzpJqd68hV
	H0qdjYxM1BQSrgvcQQHGyOiBi91v2mm+0GfkeJoPkY9XjpQSrcSPvYzWB2j6ctWBXHad3e/J42v
	F4OuJ/Um6vxKw8ad4XS88kxKUHFlOTb2Pozz8PgNv0ZQRXBlQ5k2v09aiRfgIiXwvCb+HZdJAOr
	XZYITYmJfu2em9l5lDNhIblsuPUq72oNVRN9JI2CAr6jqQZzPzU0obsBjeE1pbbD0HwLBinzwPj
	yFlLMxMHyaU+6dv0+lodnHBjpTyIqwpCkC/vPkKc6TQkD4cZlIMUNLQFtgxFcGUb6kEZXs7UA6s
	ak=
X-Received: by 2002:a5d:5f48:0:b0:431:9d7:5c2e with SMTP id ffacd0b85a97d-4342c535cecmr3252142f8f.35.1768394179811;
        Wed, 14 Jan 2026 04:36:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:94c7:73b9:87a6:4747? ([2001:8b0:aba:5f3c:94c7:73b9:87a6:4747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm51061223f8f.12.2026.01.14.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:36:19 -0800 (PST)
Message-ID: <a065254107d5d01736b8a68b67cf53c0b26fbe6e.camel@linuxfoundation.org>
Subject: Re: [PATCH V4] go.bbclass: set buildid to empty string to improve
 reproducibility
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org, 
	bruce.ashfield@gmail.com, mathieu.dubois-briand@bootlin.com
Date: Wed, 14 Jan 2026 12:36:18 +0000
In-Reply-To: <20260114064400.4070617-1-changqing.li@windriver.com>
References: <20260114064400.4070617-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 12:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229323

On Wed, 2026-01-14 at 14:44 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Go packages and binaries are stamped with build IDs that record both the
> action ID, which is a hash of the inputs to the action that produced the
> packages or binary, and the content ID, which is a hash of the action
> output, namely the archive or binary itself, Refer [1].
>=20
> And action ID include hash of modroot, which will include build path,
> so this make go package not reproducible.
> Refer [2], keying off module path instead of module root directory is a T=
ODO.
>=20
> [snip of log]
> HASH[moduleIndex]: "go1.25.3"
> HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buildah=
/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
> HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86-64=
-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/build=
id\n"
> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\n"
> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
> HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314=
c0cbf4df7b
>=20
> Report this issue to upstream, refer [3]
> Workaround the reproducible by setting buildid to empty, refer [4]

The trouble is there is a lot of potentially important information
going into these buildids and you're just removing that functionality
entirely.

Can we patch out the problematic component until it is fixed instead?

I'm very reticent to remove them entirely, that doesn't feel like a
good solution.

Cheers,

Richard

