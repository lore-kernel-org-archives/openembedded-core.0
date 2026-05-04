Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99110CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 08:36:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10421.1777883802645682900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 01:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TDfark7f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso39845975e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777883801; x=1778488601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fj8sRoLrzeM0YjEPxTP2vK8t13vhvmOgyxYC81IZRQk=;
        b=TDfark7f3THJHIuaRPf7oyshWPAU372CjCKpHtm4sNr9VGEwr0jhvukOTsdrhkZP5Z
         9FjK9trxG3SfOh+o+ID5EspSEbMumyUQiTOhxDaHFD4OEJ1+L0YEtHt9lDgU9dVnO3Mt
         v+++cVRbywBIid0UtTFaLYxgPoYiFhAEpI2Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777883801; x=1778488601;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fj8sRoLrzeM0YjEPxTP2vK8t13vhvmOgyxYC81IZRQk=;
        b=NyIYfJfBkaQBxma+cW4G/Kkc/zA4ezG/DoyaapJi0a6BcXpClTNq0XVgm4VxpS3PjV
         mgyfan8RbMvVyeT8xkbVV5wHWa88/5yN4l7nqu9gQw3W0gftdET4cMdWxhr2gDkQ0AXX
         Grz1r5CDBDqxeBL1tJEQZwbIzcsnfHiyc8QSHVbYrPSBP9sOruvDgKOyweqb5ztTXvbE
         ydID7W3YVuaKU1IRTEyb0CnhNUdBLIPho1I1vyxcZoR603gDVnS0g8bP4KwxNDfiA78c
         c9tIilx9iMnzUK3l/LqcX0SAATnDdQyUmHd5M+Du5N7LJjKVI2Ivh8GL9ZPY+Pg4i6eW
         RkJw==
X-Forwarded-Encrypted: i=1; AFNElJ9+kKoHYZw/+gdaUBP3gd/myY14/3JgwfS6fqKSiD11WUBXcFm591b37+NON7HvboL1taZmETCT2x3BNy/JSsgoDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJFPnZS2OqdY8e/pFc2sA8ISBUVq5hVXWjUOGlNV8PW/L39Pot
	5nIF19j9Dkw9A+HklNw+e1Jb9uS2ZsGuT9DChIxD3dRASAl9I9qV8VBfVzsdlfST+G71ZQRvwEV
	hvYhP41BzDevrM3Y421Hw/k/k2yvl6uyCKfwn59E1LPAE75f+qisK8PSPKDk5DDLC0O4pzs1KSG
	M=
X-Gm-Gg: AeBDieuikCBWVV4xhpL6AnYiVtpGRvSpsNufcZK+1q7kD01oTCXwJNM61hquOSjZY/1
	pHucS+kYS8gamTd8NorEcArY+uRB32Y+E2vBnBMCnmQMmd3jZjS7VTTMy42+2sYgAAl727COCGr
	0VliV7PnMYHkONjyfYaJ17EQNjKIUKmHB1Z5BhF+VcuaWSLJ9/H9omcqT0NPAWJwSTMK5Q+3dDN
	GB8zklP9p0bvRpCavl/TvYcvL/uhajxUbpf8NvwWCkbWUgLA7YEPVXHnncxQUVf9UNHMmafHEOS
	IQ0aimA042StuRl/kxKVnvEuFPVmPz7B01fKuGhv+8juPYDWoQqFPoliYh7q4M1ATErEBf7k7NR
	uKB4+TQPCIDDWFN6Q5sQ4fvkMhOhrsVIfVpkjcGlftmRmOmW+FVtdrjDms+FzIwctgN1Mbdmdcy
	JVPs/P3kN8XdwS1sGb9zKUFE3P7UMjhFq4bQXpBmdDK+Wo9+NKWiyc1MHf9MZTrasdiGfGjKsib
	dKtyYy/FWN6yT3kf6EYHc1joAA=
X-Received: by 2002:a05:600c:c0c5:b0:48a:72ab:f88c with SMTP id 5b1f17b1804b1-48a9865f865mr112690025e9.17.1777883800951;
        Mon, 04 May 2026 01:36:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3e:601d:3692:f075? ([2001:8b0:aba:5f3c:fc3e:601d:3692:f075])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm366040595e9.3.2026.05.04.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:36:40 -0700 (PDT)
Message-ID: <0b0308b434031f0715e060fbdd6408d36528cee7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] machine: include: arm: simplify
 conditional operations with bb.utils.filter
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, quentin.schulz@cherry.de, 
	qi.chen@windriver.com
Date: Mon, 04 May 2026 09:36:39 +0100
In-Reply-To: <20260427130846.96013-4-joaomarcos.costa@bootlin.com>
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
	 <20260427130846.96013-4-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 08:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236439

On Mon, 2026-04-27 at 15:08 +0200, Joao Marcos Costa via lists.openembedded=
.org wrote:
> Some configuration files use bb.utils.contains to check for a string
> inside a variable, and return the exact same string if true.
>=20
> This can be simplified by a call to bb.utils.filter, since the result is
> the same, and the inline is shorter.
>=20
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".
>=20
> bb.utils.filter() does not return the string with a leading space, and
> this is handled by a leading space outside of the helper. This
> workaround, however, has its limitations: the leading space is always
> added. To avoid any potential issues, use .strip() when dereferencing
> TUNE_CCARGS_MFPU in the if statements.
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
> =C2=A0meta/conf/machine/include/arm/feature-arm-neon.inc | 8 ++++----
> =C2=A0meta/conf/machine/include/arm/feature-arm-vfp.inc=C2=A0 | 8 ++++---=
-
> =C2=A02 files changed, 8 insertions(+), 8 deletions(-)

We've taken the other patches but not this one since we don't think
this one is a net gain in readability or usability and there is no
pressing reason we have to change.

Cheers,

Richard

