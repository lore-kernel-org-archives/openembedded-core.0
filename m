Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F244C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:14:13 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3183.1790190851220101244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hDz7x0sZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso10039255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790190849; x=1790795649; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+PFYy0Dzyr//nGnLKNecJ4mWTA32gbKFWh88LuCR8IE=;
        b=hDz7x0sZGZNaXxqh5pGQwlLX4Q+pTeex1+cgiavbWrimQl98XQb1euShNoD+F1jgXA
         XKZnSKrecTpz8EJHAQ8SyK6fzk7V471qG8+2t89pozxx8GRVHAkcZ7KlZGSeOH8pvUW/
         4gIOtIXTfrvybVMzrCSXlyLwULmByNRqN3tBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190849; x=1790795649;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PFYy0Dzyr//nGnLKNecJ4mWTA32gbKFWh88LuCR8IE=;
        b=Ykyck5rUiE4A8fkEWOoadr6h/ROM7E1XbJiqMt6YCnvNJZ292i6MU5ASkpkug7h7n1
         jFkZOGKRUZYxKX/tYl314QH0go0qxOrCIDM2P/qPqLlElHP+lemjzM4vBkUh6efOGf0w
         V22XV1YtrKZL9iVQIlD2CaWPwfSOn3mFalMy73q0/S8Ja4btRU2pzqF18JvKlFRIToHg
         H/4JvnNwPQFDwmSSvaz6Cp2T6adPX88us9Gvao+RZPCaXs8OrMWQs7EFKp2hkhAg7amE
         eLsVlmO3G2a7pxm3Qdb5tNmHj6rhScFNNSVJ+OKnEX8Tt2GsP/46kiD1xU1BG+dE7jby
         26XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBdsE447GrM0s7uIVR5RxCbcZLn6baASeUGLBk+GpGfS2lj6mcrMa3I4cjl41y/XVd3+mpm1iv2JErfUujA38TnA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mNlhMA624dXVC4EwYLxCYiUVIn2ykX/dSLYeBPcHhlnTynjqL4
	kotv3Z4W/OPb2AZLIMiIviw++uDgGRMcgRQQjjJtO/lLHHhH6Sy4Ome/J83ixI5e0FI=
X-Gm-Gg: AYBFou0c3p6YrIWlt41N1Jc0ezjBESx36yO78L9xuWNYbe6tl/p0KwZZnkYGaaVb/yF
	X/vWqpPhNK9OF9Yeqnpv6nuX5+Lhzh+et4kUdcG1Y9srZpKmLorzzqYcSy9B7PPDPWbgbqaINSr
	Xx+WhU8pqhsGByl+VffTE2TUI/ccuk5OAGUVnjTZKEbYr65E4xR/ReTjeQY/ffHAe/cYM9vQ9R5
	O3R/DItJ824IfPcC97368kjdd890EI0E6R6UR/zcSpuF6PCtj08mYethezAAAxPLkl6T7aCmeC+
	ntq8D8pHAB3SZ2m/+JTiL70IBJs/B7Sj3Gwb+f/cqp/Hrb0dKUY2zCQiRkMVDUujD6kxO1F1Dqv
	mjDcDYZoh6ijwVdYwGzQtYivspACYAV7E5hOjQX3gHJgDWYJOvfaCQ73+rZ1d73R3L8TrUvqwwC
	F0mWSaHrVZNz9bhqzgI9EuTmMdwrFJ0I0oINbNXCs9oALJKLRCMYOw/kv3cEq/SmcQW7uaZ1swU
	qHLLlqssDXhkII3h/jiXRK+eqz0/LQZBu2Ov9y0T4fN4SZp+Qla2BUkf/Uz3uUs8IacWUdO+w==
X-Received: by 2002:a05:600c:1d1c:b0:49f:db7d:856 with SMTP id 5b1f17b1804b1-49fe6708033mr2246115e9.33.1790190849391;
        Wed, 23 Sep 2026 12:14:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:36fd:f492:2703:247a? ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm9296536f8f.23.2026.09.23.12.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:14:08 -0700 (PDT)
Message-ID: <0b88403ebbb7db6f816034bca582227e3b175694.camel@linuxfoundation.org>
Subject: Re: [OE-core] Topic: native libstdc++ and uninative
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Date: Wed, 23 Sep 2026 20:14:08 +0100
In-Reply-To: <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
	<AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246538

On Wed, 2026-09-23 at 14:54 +0000, Peter Marko via lists.openembedded.org w=
rote:
> Dear Yocto toolchain experts,
> =C2=A0
> we have come across a problem with C++ native libraries and sstate-cache =
reuse on different host distros under uninative.
> =C2=A0
> Our scenario:
> For generation of sstate-cache, we're using only x86-64 Debian machines, =
each Yocto branch on a fixed version.
> For example for wrynose we use Debian 13.
> However, the clients can have a different host distro (different Debian r=
elease or even Ubuntu or Fedora).
> I think this is how Yocto uninative sstate-cache is intended to be used.
> =C2=A0
> The problem is following:
> GCC version is different between different Host distros, especially libst=
dc++ from newer GCC has more symbols than from older GCC.
> So when re-using a native c++ library generated on Debian-13, Debian-12 l=
iker can report failures.
> Concrete case we experienced is linking against googletest-native and mis=
sing symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12 (GCC 1=
2.2.0).
> =C2=A0
> We don't want to go away from uninative as that would force us to produce=
 separate sstate-cache for each host distro and explode storage size and bu=
ild times.
> =C2=A0
> Has anyone else come across this problem?
> What would be the recommended way to solve this?
> =C2=A0
> Could libstdc++ be included in uninative?
> Would that work with all the different GCC versions in all supported host=
 distros?
> =C2=A0
> Or some magical compiler option we could use to disable usage of some new=
er symbols?
> =C2=A0
> I know that we could use buildtools tarball, however that's against the i=
dea of running Yocto natively.
> It's also a step very easy to be forgotten during build setup unless ther=
e is some magical qa check for that.
> And for application developers it's yet another Yocto obstacle and argume=
nt against developing with Yocto.

This sounds very familiar.

https://git.openembedded.org/openembedded-core/commit/?id=3Dd18bf7fa8e80d6c=
faf3fdbe1ab06eec84b954432

Basically we link with -Wl,--allow-shlib-undefined and then by the time
we run it, we have the uninative glibc available which will have the
missing symbols.

Cheers,

Richard



