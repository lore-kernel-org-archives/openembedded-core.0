Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B70DC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:26:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87899.1783067161904926926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ElTABVPp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47488efcf30so182998f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067160; x=1783671960; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+0G2jLf8qsK+czlVPWCVsgR9d5x/nQ+9NogLnRIRVwk=;
        b=ElTABVPp2BqzFA47gi4TiRhlVLES/v16t8/ccaBmyZtBtM0yL0f+LHDFigJ16Eb6RE
         Z7Pk41RXyI7DlXwx2dltHT8ezLZuS0T9KspvvtsWdCxwiyUZIOlT9YcPcsank4asfUFM
         svwftghv3wikfI4/ZFR6Fogd9bXWLFP/1WeMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067160; x=1783671960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0G2jLf8qsK+czlVPWCVsgR9d5x/nQ+9NogLnRIRVwk=;
        b=GpQF+0NqIcK0NewC1W8j31Yk8kIlIWh3WNyqPBgDCNlf5mRpI0OyauenQcLiqDFpw7
         0fBiu2QOWV33MgY6OiSHrvtXe0lalWuql1VxRFgWlSvbhI0Yy5m/ZKFtY8zJKfhPXLLP
         mSJzQbmZMyfCklcu91DGqcT77KZEdhtsBQGSlNCSnaF66qnKiLyZf2D+8ReujNOtw3D3
         GYut53vyRP5h1kN5K9vs0Mp1RTB5VKO71nGbZjIwQVxnvfDLQZZHYrJI4oD5Iq7T7dMK
         ruX1nXRWXJ3WchXc3YGFv8MUwEe2fs2SG+3DcAHRPegiQtvHAlgSmxM+p3+9VLacIxqJ
         qOJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqs7M/A5ovisWFUUIKIDbES72UXJ/s5oSHpoxJTqn9SEfuLwEhAzCqeBi0KFVSAmSSmBN6oA2Fb26tJEAdfUQgVwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUjrOURd7T+sJ5APMAtBaPOk7srtfKRMHdqlee+AqNLE4/BuFB
	NCD0cAQBajbK1iuA1/9ZWPuuvi2aI9fTfTb8E1/0/ZsIloc/aRJ272RE0cmQr1cJoRw=
X-Gm-Gg: AfdE7clnadpN0S6e3LqPvQZFW84AJgIKKfdTYWnSQ2dXLddIaro9RGuBR820PPvPVxX
	KuEi8pGFdHELQyr4pHVw1C77mqSy80RqQSo5OVdGLMTu1jvhtxN+gvbwW7F+B5EzzJ7sI/kw4D7
	1AMxfdtptrdiwBXdSRmBPTtjK9B2BJIeH0Ld4KVJIQf3VbYbYOVZYTGg2c1XkXfqb0+pzm87JGT
	YVnBv9s+wFNxBi/v0vQTDNBIdjhOV/uA7u9Jz+CYxQzsWKivYa1t1QBy8WolksQ1IdSH0vigJxz
	aF4ykhPtcFHW5xTKxew1lZiFTELKBI90+9Y1LOkEOJrt3dzsZc3eCQYQ6S0SnX4nGzne4Vwcekb
	vsGV+92gxCOnIRCINXorqYHeGtS7INg648zIP8vLypmWzJ0uRW5y6gtYzOXHMJa8+YLS2gCwcI/
	z72FVF6l27axWgnRXVCuKgXjxie/1RkkTsjEVWlQ5WLRCiC5hN+nOc0fObVoLZl9G1xfoJy8YW3
	rgZMQ==
X-Received: by 2002:a05:6000:4702:b0:472:d3ab:34db with SMTP id ffacd0b85a97d-47758328207mr13580420f8f.15.1783067159635;
        Fri, 03 Jul 2026 01:25:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0? ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dba3csm15396028f8f.3.2026.07.03.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:25:58 -0700 (PDT)
Message-ID: <7d10d723252ac2b94c5e6f9c396fbb21d308ab8d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/6] patchtest: cleanups and fixes, part 2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Date: Fri, 03 Jul 2026 09:25:58 +0100
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240082

On Thu, 2026-07-02 at 11:22 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> This is the second split of patches coming from a previous series[1] I
> submitted.=20
>=20
> Changes are mostly to the existing test suites to clean minor issues up
> (duplicated code, inconsistent Python syntax). The most significant diffe=
rences:
>=20
> - Clean up test_patch.py so that it doesn't print misleading CVE-related
> =C2=A0 messages for carried patches which aren't actually targeting CVEs =
- the
> =C2=A0 original code was written under this assumption, but it's incorrec=
t.
> - Add some new logic in the patchtest script so that when someone uses th=
e
> =C2=A0 --directory option to test an entire directory of patches, but the=
n aborts the
> =C2=A0 run with CTRL+C, the whole test suite is properly cancelled rather=
 than a
> =C2=A0 buggy skip forward into the next set of tests.
>=20
> Note that this was driven partially by Claude Code (Sonnet 4.6 and 4.7), =
but
> I've gone back and reworked some of its changes before submission.
>=20
> Selftests still look OK:
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > Testsuite summary for patchtest
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > # TOTAL: 38
> > # XPASS: 18
> > # XFAIL: 18
> > # XSKIP: 2
> > # PASS: 0
> > # FAIL: 0
> > # SKIP: 0
> > # ERROR: 0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> [1]: https://lists.openembedded.org/g/openembedded-core/message/237047
>=20
> Trevor Gamblin (6):
> =C2=A0 patchtest: tests: base.py: remove duplicate Commit object
> =C2=A0 patchtest: tests: test_mbox.py: improve variable and message clari=
ty,
> =C2=A0=C2=A0=C2=A0 fix whitespace
> =C2=A0 patchtest: tests: test_metadata.py: simplify SRC_URI collection,
> =C2=A0=C2=A0=C2=A0 remove unneeded import
> =C2=A0 patchtest: tests: test_patch.py: simplify source patch and upstrea=
m
> =C2=A0=C2=A0=C2=A0 status checking
> =C2=A0 patchtest: tests: test_python_pylint.py: use more Pythonic compari=
son,
> =C2=A0=C2=A0=C2=A0 fix indent
> =C2=A0 patchtest: correctly abort --directory test

This series may have caused:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/71/builds/4041

Cheers,

Richard

