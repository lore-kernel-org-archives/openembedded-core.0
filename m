Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11988105F79E
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 08:02:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5930.1773475338055785507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 01:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hg7uWGUc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so28569065e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773475336; x=1774080136; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7+g/Rbq0kkuGjEDjvBaM0rAOX7uVr2eAl3ncQ2HZqo4=;
        b=Hg7uWGUcG6Fnow+PlCCz9XOO+GMJxkrzTUVvQ3GNCqvdbVM339/I6fSw9RFnaq8b6a
         l/ZuJju1DmMkFn0nYxAH+hqiFUqEACZCujbOrQcyebtLisXO1CjdlJ9LbC8eX5m6c/FR
         yti8l45CNzdlyvcqgI7VzQND6E2HQY6JI0Vm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475336; x=1774080136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+g/Rbq0kkuGjEDjvBaM0rAOX7uVr2eAl3ncQ2HZqo4=;
        b=HtOtXqZW3wSyTvaVmDgFnS5Qo3pVBHxIfqG1dLK6wGuCeib/Z7RaRyTW+u2PfH2QfN
         urR3rhX3IG253nKzbtQ/dy3+AL3QxKBkceSBtmmvOWt/Cd21Ci9xdCCbHPWPlNXQO53K
         ypf8CRJrj0sWJbfSa+O23heaCrPZDEJ0I0KhxhLu/yBdbITV9orll3E6jZgpeQ6ur4qc
         u2w9jvQAzhgp2aurGbyN2MG2Uc0F0mWK9LC7dnqLqzA1Om5K7s6vK1gFMyx1tVwtYwUu
         UqPUk3q40ejwggD/jwZdPv443ABbJXTcHq3Fq0aFDKnokam5WUJVU7LJBiAoCXRS0TVH
         Vabw==
X-Forwarded-Encrypted: i=1; AJvYcCXG317e+yNqiHeMfq1Q2zxgtWrYOIcfBCTKbATF25KV4DKVNA7QS5DEhorS17ew1Lx1+I3mIIMDdoqjkQVqtV5zGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwH9tQOC+RmSQXSesYL4pnBQdtp+wxM3dQJrLrOW6kkBtJjf0M7
	spRW9lndb4ifv9MgjnPClSSrf+aK1TREFuf0SkxDa4QLVvcE04+L0WzkvyP+neb8HVI=
X-Gm-Gg: ATEYQzxZd2BWULzgkhNEcDlsCdAMlK9xX3rIG6tBt1f3V6sjNUkstGOfM2Hj+ki7x7N
	NnqUR94wEmDgGzD4OEWdUmmiyAR9L6f4ST9lDP6Eyxy8gLjn5D/v3afyYxaKpvnK6CqfvOUl17k
	4paKJGkkQV1pfFkyoJc7vfLhoRqWyVmTdatq0L9iZrfcIw1CQ32Ur2Memls6ZSXP7zUgtsEoy3n
	4seqhcjHYyf9ImhPgRw3tGLiiNxryztlDOG9xVtlLYv9oTF14Tl+Jz4YYHs474JfabLXO+TCuJe
	pcHy8s2L2oZnnMWaCMrxc1eQpeNl4BXNLezi7KpshssoAv6/lEEC5wYwdHKNsCkBZWT4SG5A28l
	W//rR38y0VBVKgnYqJvXgE2bm4itpMW48hGpqLYNVIiZD/QNS0KEptnFsm43fKthWGZVl/9O+1k
	EhTtBvonlPdmPj63l2nAU/c7CkPkUrOzx6hj3j+U0WIga03iva95SxIF89IAzvqvHDzcQJlhI9s
	82vFxmebI0SHt0=
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr105433145e9.29.1773475336145;
        Sat, 14 Mar 2026 01:02:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1366:c81f:8eb8:9990? ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm260329945e9.10.2026.03.14.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:02:15 -0700 (PDT)
Message-ID: <85a2a6b63bb35ea7748763500ceec3f411dd63ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 4/9] glib/python3/acl: Add pkgconfig to
 RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org, 
 Ross Burton <ross.burton@arm.com>
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com
Date: Sat, 14 Mar 2026 08:02:14 +0000
In-Reply-To: <af076df542e7b42d2c3d7ab46188a98b400aac45.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
	 <af076df542e7b42d2c3d7ab46188a98b400aac45.1773324129.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233073

On Thu, 2026-03-12 at 07:09 -0700, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Fixed issues like::
> Error:
> =C2=A0Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from =
oe-repo requires python3-dev, but none of the providers can be installed
> =C2=A0 - conflicting requests
> =C2=A0 - nothing provides /usr/bin/pkg-config needed by python3-dev-3.14.=
2-r0.cortexa15t2hf_neon from oe-repo
> =C2=A0Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon=
 from oe-repo requires glib-2.0-dev, but none of the providers can be insta=
lled
> =C2=A0 - conflicting requests
> =C2=A0 - nothing provides /usr/bin/pkg-config needed by libglib-2.0-dev-1=
:2.86.3-r0.cortexa15t2hf_neon from oe-repo
> (try to add '--skip-broken' to skip uninstallable packages or '--setopt=
=3Doptional_metadata_types=3Dfilelists' to load additional filelists metada=
ta)
>=20
> This is because the rpm 6.0.1 can find the pkg-config files (.pc)
> provides/requires correctly now, the rpm 4.20.1 couldn't find that.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

I'm a bit worried about the pkg-config dependencies. Are we able to
turn this off if we need/want to?

The reason why is that installing a -dev package doesn't necessarily
mean you actually need/want pkg-config. I appreciate there is a .pc
file there, but just because you have a .pc file, it doesn't mean you
are going to need/want to use it.

Do you have any comparison of the dependencies before/after the change
and are there any other changes we need to be aware of?

Cheers,

Richard

