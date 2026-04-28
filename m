Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655A9FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 20:48:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2498.1777409286924480451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 13:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ITpEHfbF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so143973775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777409285; x=1778014085; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDe7sICMOstaMGhlTgi9A1fHQtVcgxloB9D2bIX7RSA=;
        b=ITpEHfbFvofuFKRjG3Xr5b1ML80vfQAbuvcNBdooVCTfp37d4ia5kMUJTud5TdeyEG
         EYI9EDv/qs2hu4U0DmVd/FArGOmxvrRPpfH8zaR9j2VrRFr6uqDBdbz5SuMeRzB1e2RW
         oRSrK4RBOjiPcL4+p13dO8nWFZEZqPBFiQYc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777409285; x=1778014085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDe7sICMOstaMGhlTgi9A1fHQtVcgxloB9D2bIX7RSA=;
        b=Gay30lhyUsdzmBfm8vWjuSy2HQPwFXH/iuSliv7y6HivbMHmWR+K99AiBSDLbQOf2p
         atyxTIiXt9fwlZhw0/RQJGNBPsmCEEs6l+/a7iPfWWUXQP5vzzUGs7rTS3bFWLG3jtdj
         MrxfREOImODXIkitJyI6wy2wM+W8RGqDIiwB8PIE7y8us0NnskzKLkJpOwvyNihQF3cg
         EOPb2OZ/jUjMEKr7vDvz0c+yfxkE/5R2gO+YIcTiJX1G5ziKRsGSk1CcgBc3ukKR+N+y
         0Xdg9MgrtwkvJGXR23C0Sheqk84zLpbNdMHhWoODP38ZHIgI2lqFM75gI3VIY8LBGlAF
         eQCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7APACQ/hotVqfMTIKWSSxD2bNrN7h9XgjcATAlgiB5h5f4zZyLnduZImdlQqfYF4ebvoXEK2HXjqemZzxiuthxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+yxRJ1/K0BPQayM1x8O6Fh6qDQYkTtHNPy+5xI3qouvmtJ9Ac
	k+GE10Fq3hsIwgTFyyHcuykxyAbWUFhN6/2oDN3L4h1cT+htH3apuntv3jEPhI03oJLVADV6di/
	ycrQxcm4=
X-Gm-Gg: AeBDiev3fIeC07K3eOU6baqwoqekqvEC251dGlaMvQ19S8+jw7q3XVVrR37ZeI2K1kR
	QaV8rLY6bL2S6DESI71vVVQn0Jo37VRdAVVmIW9Y7KSZ3B0uZO16IJx+lo5qJUq5Zy/DyK5HzT/
	RiYOECXLs0En2PGTGZrIQs/Y35CRaLlaPqKSLe48BJmX3YhmTXGatRqNp/km/PO0BKeJ0IEtTZ6
	8eTvDZYkUCpgzUZ4mGi1WVFqXoFN3MEye3KWskFNYdavoCmowGHo1rapQsPrymL6BM4wYtzZAhS
	KCqgC0bx1JFdTMlGQAgnKZiGv3eSiYhClsOEMou5Pd0aQVQaA7+Dl1Y0/bQ5gjZds67nz68eQOR
	VR8kiy5p6DQ6eOT9hppG4H5rqnBqZBf3b31yBGEdVHU3uA197o8307cByg8kVQ8Y0HIhPdfe116
	Ba/k3I9gEbh2RtUuXr7F3/bOBSl8JFw7ytjqVarGvZhkrhBIWxWactU1GMLdGWaob4uB+dJXQ34
	2N0rzEJ3rdtpzKUrGGqvUIbGSBka81cGEI=
X-Received: by 2002:a05:600c:e41a:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a77b0625emr54884705e9.16.1777409285242;
        Tue, 28 Apr 2026 13:48:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:549b:62f6:707:b10a? ([2001:8b0:aba:5f3c:549b:62f6:707:b10a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca64ffsm481298f8f.37.2026.04.28.13.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:48:04 -0700 (PDT)
Message-ID: <ac0e3ae4822c8cc0bb28e449cead5725ad049230.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] oe/package: add unit tests for kernel
 module detection helpers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sam.john.kent@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2026 21:48:04 +0100
In-Reply-To: <20260428081046.1660101-3-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
	 <20260428081046.1660101-3-sam.john.kent@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 20:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236072

On Tue, 2026-04-28 at 09:10 +0100, Sam Kent via lists.openembedded.org wrot=
e:
> Add unit tests for the filename pre-filter logic, is_kernel_module(),
> and the is_kernel_module_signed() detection.
>=20
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---
> =C2=A0meta/lib/oe/tests/__init__.py=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 0
> =C2=A0meta/lib/oe/tests/test_package.py | 121 +++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 121 insertions(+)
> =C2=A0create mode 100644 meta/lib/oe/tests/__init__.py
> =C2=A0create mode 100644 meta/lib/oe/tests/test_package.py

Thanks, this is a good step in the right direction, however if won't be
executed by our standard autobuilder tests if it is in this location.
We run tests via oe-selftest (amongst other places).

The tests for lib/oe are in lib/oeqa/sefltest/cases/oelib/

You can run them with "oe-selftest -r oelib"

A recent example of a change which adds tests would be:

https://git.openembedded.org/openembedded-core/commit/?id=3D20322406a77b178=
a6655427612ed25e79b308b21

If we extend them that way, they will be run as part of our regular
testing and then hopefully regressions get caught.

Your base patch 1/3 looked fine and passed review so we've merged that,
thanks!

Cheers,

Richard

