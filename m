Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA17C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:41:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1148.1785566482906619200
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SN2YrfE3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954df200ddso3086045e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785566481; x=1786171281; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7vckk/DE2QVIm4zbLrmaqfPyReVep1BYUB280+nqPe8=;
        b=SN2YrfE3W4x/dwA/M4UJ5j66TiMm2DhGIBwcIPm341PBN2g0G24MpRjKronwIiP6Qt
         f5ErszUua3V3dK0YU4LfmRuDPpllk2v1K4mp33xgc5xoa+lgeYeWCjnYSbNZohNTtZnv
         o0oyv4Oz4qJ6Tbt+fy/kF0LKZCze+FHqosOE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566481; x=1786171281;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vckk/DE2QVIm4zbLrmaqfPyReVep1BYUB280+nqPe8=;
        b=Hx+I9YclyDPnKbZ2dHsSh/9y3URANCdRCQpgFxGeHMA1saz+Bell9y5WOuqyENx9J+
         /UVRu++DWnqLHykqUJ3KZy3rjWyakb+VYpKF+psXwzEeRn37qJitye/rkaui0KOELE/H
         8YEbut4dXHRpiMnXuXUYKHWZOtnxfIXsMhDF6VMn2aFzUB7N9qOwtHqLHQV3HEGT2wJg
         yyqYxn5Y9wtGbl4ibQGoVeWlEqrx3dSANyZzBoe6c4qX+gG6IReFckKWLPck+mAQi2DL
         EgHrnR7e5z9GoRIgFz6/hmeaUpuEFModSnKriIl2+mzC2zpxle05oV6j102/u5NjS5z3
         1oyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6a5WEeSEicZqHb26lSu1yQ+XWKK5CL64y8KTkwKglmwpiEBufQEQREVomPnTLJ/njqLLm++KFE/ZCJhcgnofJxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE0Uqq6fGRnYBEqHWXUyZtA6rS/8n1tApvF0vEiG5riOkHwmz8
	9iBlI5adLQdsTEQ1WlA+fFSZp3JqbGB10FLKbVcsSeM6IxIHE2ascxmfovoN9NZ7K1g=
X-Gm-Gg: AR+sD13mCpBSc55kIFW3eFS7e2qfSjsNa187/DQYNDiLiDvzQqBdISJ9Ry+lJQyn1Nd
	xxiuXBUH3mVPJ282wZdcKMbLeg71VKA5HM4VH8ZAdlWcsFQBLsCIR62B1Fgjss36cZx/D5nuUTC
	uwQTKsYAqr/bez6f1a2UDSdn5nv+Ux/WWvh8BocHDYt5ABOg4jjzI4MS4N2+e8bnTWthV1bsA3Q
	2u3VbxAGD29PARTiCs7ICFinRQgU6J8uuzRWvGgHm7AbgKw5A9l85W5nBBvGBhnp3iJHUgMj74t
	jXtu8d9X4hFcUKOOqUf7fHXzqpA1ai+DiLCTr/Y52VpnpYg53yIP2OXoaBKfJzeqfPU12PEIwyK
	eIZ3YdU2ZYGDPBKqaR5h69OuGAId6yGd9/YgxMga2rLHEurNTW3BzVnVV5cINrUQkQyASu/VXXx
	G3J6YKhFxCLZ9cITrWn7gshwhUs1QaH52rzYQk8CQHYMwOBY3O9ADiXz3inXMwLgS6RAH2rHhd3
	Kem84WOR1gXOdFHEHP5Lggb0LdiU57crxBHFOsFCQ5G/EECPjXvkg==
X-Received: by 2002:a05:600c:840f:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4980c6507e7mr21342325e9.14.1785566481033;
        Fri, 31 Jul 2026 23:41:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585? ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808195136sm12783615e9.3.2026.07.31.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:41:20 -0700 (PDT)
Message-ID: <f92d86a076733c5368cae9c94fb76a14cac2cafc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/2] coreutils: fix multiple CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: collin.funk1@gmail.com, openembedded-core@lists.openembedded.org, Leonid
 Iziumtsev <leonid.iziumtsev@est.tech>
Date: Sat, 01 Aug 2026 07:41:19 +0100
In-Reply-To: <m1o6fm66ok.fsf@gmail.com>
References: <m1o6fm66ok.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242477

On Fri, 2026-07-31 at 17:11 -0700, Collin Funk via lists.openembedded.org w=
rote:
> Leonid Iziumtsev said:
>=20
> > This series backports upstream fixes to coreutils 9.11 to address
> > multiple CVEs.
> >=20
> > Leonid Iziumtsev (2):
> > =C2=A0 coreutils: fix CVE-2026-56391
> > =C2=A0 coreutils: fix CVE-2026-56392
> >=20
> > =C2=A0.../coreutils/coreutils/CVE-2026-56391.patch=C2=A0 | 66 +++++++++=
++++++++++
> > =C2=A0.../coreutils/coreutils/CVE-2026-56392.patch=C2=A0 | 65 +++++++++=
+++++++++
> > =C2=A0meta/recipes-core/coreutils/coreutils_9.11.bb |=C2=A0 2 +
> > =C2=A03 files changed, 133 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026=
-56391.patch
> > =C2=A0create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026=
-56392.patch
>=20
> Note that CVEs don't really have a security impact. I'm mildly annoyed
> there were assigned. It seems that Afine's entire existence as a company
> is sending LLM generated essays to maintainers, bogus a large portion of
> the time. For the others, which have dubious security implications, they
> file CVEs with exaggerations [1].
>=20
> Theoretically CVE-2026-56392 could allow problematic writes to the heap,
> but that would require you to run it with untrusted slop as the input
> and as arguments. If someone can do that on your system, they have much
> better things to do.

Sadly, I suspect this is becoming all the more common and I share your
frustrations.

We have an difficult position on whether to take things or not as we
probably don't have the time/experience to tell in many cases and not
taking a CVE fix means we'd get beaten over the head with the patch for
ever more as "there is a security problem" :(.

Cheers,

Richard

