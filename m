Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C58C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 21:02:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39881.1786395755822727496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 14:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fbh5zp+p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1887733f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786395754; x=1787000554; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MxOvrmqZtiLhGDyC4RT1UNpIp5reD7l1RlJbIO2hBfo=;
        b=Fbh5zp+pT3p2cRFezj+cot3glZq8U1BKcwpbI+yMmlSyKQFB5KKK6iSI3Avq2u9qNe
         nT9d9O0clXF+KhEmaO7+azf1vAXjWEYrMr7p4IP14FS215T9JEGnWQIJ/hg64IT0DLc0
         ObkTdQaIHF4B6qCXO2GqwKaf0HPZ5982iMZjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395754; x=1787000554;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxOvrmqZtiLhGDyC4RT1UNpIp5reD7l1RlJbIO2hBfo=;
        b=lH+iS9UIt+0NqIXX/E5di7FN6owJt3X5l/HgLHzz5kZUTMonZlNxe9UCxaLwqOJGwH
         R0K3plPtqyFxQss1RKOAvJpWBsvmOP3aTWE6oDcMpHTZysN+e6yPluyAVwNuMf88fESY
         RF470icIbl2xq3w9Dkoif3YUdZwHosYCfP8jX+COXj3WyV47DF4UlZTaBK3jJ8TilkH1
         hwfBtsJ9Z1UVOrIM+fonirwwavRF3uWMdfDd5+cF36C99UpEqBaC7Lo79N1D4VC1wyVb
         IMfHNqFzxe6hEf8vNt+/TtjH63ePBhXJ4ie8urB4I90b8IqKQ0X7Wjgeffn+Z1aF88/y
         51vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3f3slrWx2Ha/jutX6JugPA5NuUjAW5JfFp32wncsoGzCLhF0CFbSiTt5XlY00ODaIvg0TYnN3BZd5b3mUGxsXSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJ/UE7qLwVinhcJynwMzNsCNeorAa9MdrCpu8Y+NruvHFr6zMz
	vfGbv0PDq7c6uIZ5dmXo+TBpTQWkiU1EUQaxwQLK5cikNjO8yhZChgdfso2H5+8TAsY=
X-Gm-Gg: AR+sD12IbzYw85FvkYCZ16RRGc6995D9ELIdrEKPT1XqUOPCWbMzn+8fqj5/ci/h56w
	fYRcGWqrkEpGGBKsTw+1zV4zJVwY7Hd/XjoXFe+/CIEDl9xUZaJH21bfUGjpQR4aEG+E//lldd1
	q1xdQiQgUKlf7tmRrmNFt1MwzgQGaac60M8CKAOiIUulNV3Xbt7Ufi0DtlC0928lWut6Xt7096z
	tfVHBKW4uLx20N9QNVZKOyssa1ANUKMGgZnErfYE70Sgv/WQCDqNC6ZHO4kiWFSbsyjwVQkzkZn
	FZhzgal4Dupg3zLIFq06rpDnJZKTBRxCf3LuOhAQJVc/egdMGUG1GVD7tBQ4cIWSYmQgtTE2oW7
	mrSOEjV8u1rYHLz4UvAY/H/E0268a5h7OWtPpyyWnj7gYvaHEl+nyl4GxEj5EJ/bQgZdBGWTrNS
	R6SNoXgfq2s8KiVdj5WoCZlBT71BK6azIM0FXgYwQ4Xj/4YFIX3dp6AfcrApv1FDK9ZtUA7TRNs
	5LCi2pFkkujqq7+05ubxkeW74SXacJt4W385yfloMMpOr8aPz9pjw==
X-Received: by 2002:adf:f184:0:b0:47f:8fc8:af01 with SMTP id ffacd0b85a97d-47fec63302bmr54341860f8f.27.1786395753984;
        Mon, 10 Aug 2026 14:02:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eeae:76a1:bebb:c786? ([2001:8b0:aba:5f3c:eeae:76a1:bebb:c786])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm43578781f8f.27.2026.08.10.14.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:02:33 -0700 (PDT)
Message-ID: <d7fc4bae1fc4bddb2e407d19aaa8b4a1cce0a89b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] swig: upgrade 4.4.1 -> 4.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2026 22:02:31 +0100
In-Reply-To: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 21:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243148

On Mon, 2026-08-10 at 17:45 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> ChangeLog: https://www.swig.org/Release/CHANGES.current
>=20
> Release Notes: https://www.swig.org/Release/RELEASENOTES
>=20
> CompareLog: https://github.com/swig/swig/compare/v4.4.1...v4.5.0
>=20
> - Refresh determinism.patch
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0.../swig/swig/determinism.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++++++----------
> =C2=A0.../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
> =C2=A02 files changed, 12 insertions(+), 12 deletions(-)
> =C2=A0rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb=
} (92%)

Seems to break babeltrace2, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4362

Cheers,

Richard

