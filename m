Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A08CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:45:07 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16764.1790783099993471039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 08:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ht0Tn5BO;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so4911621f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790783098; x=1791387898; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=URRZDjUeCZFKfNjDK26iukZ71mWbfB7bTgpD4bgE16E=;
        b=ht0Tn5BO0XqmrwyCKh4BkR8U+dzYtfh5Kz+kj6SGX3HY1pXsVor0K7XY9h1o6kZFtM
         h0pDSDix8254yx+hC3fXIx7ZbJSmQADMHFUDisKQsnvZ/8QtDG5ZzSCEnBYAQakL3cu7
         CjsJvRH8QkrNBZX8tNAxfXtAHQ/X8SAwgBVmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783098; x=1791387898;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URRZDjUeCZFKfNjDK26iukZ71mWbfB7bTgpD4bgE16E=;
        b=e+QywPTwqN+ENlRKX25/+iu1BLlW6uHK/faUhkgOTJH3atOaPo/qs6xCEdbqfFUc2H
         sqSFwlbd46K0/OdGjSu1MlnzddViXc76o9bC452ZH2APOLgn5+tN9fCk6J8HOCcZ6IHU
         3HGHsfebe3hPyrfwQp/EA8GMfFq0SmznDbEWKGZKHBL/BgKLknnL8I9fyD11oM+0aQRz
         sbEdiPBVnt07X5idUAohXNA4sQxPdKvnSENjB3LRBl3z4uUVIEOnNQjOlciTJSBuKZhZ
         AeXNTqK65icbgpEV9KmB3h/ImaOOKXENW7F/QWHj8PI3hkps9NF93WEb7NHOynofPzZC
         PXsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7ngh53Tr4rXye2CivBfJMRfULsYVsS3TNhYp81YtLi0094utLNepdl4KO774lh86W8AHCYbT9e1ccx2ItVRZUiA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKgYtnLhf1SEATGq+b2GkK1PNwnDNWNRAfmMnn4f+P4KHKiYhV4
	baK3SOPJKEk6pBRuxrzZ1JqPhhk+quFN6zur62WkeeXGf1nb8pyNz/0WcpJNAXzqPAw=
X-Gm-Gg: AYBFou1VDuWw91e1MtOSRnNPhtpP/SRttUIAKM+hWpqGgk8x3dUjr4vBGlENX3K4HTG
	l72iteDd8unR8GJgm9rVCiIMPAnVarQpracNHP7J92Y+6RP9DtpB6xWK3pQWH/4akIn68Gd+jD+
	nKxR3pBYhSpPILItyNxWlZcMqLOVFpJ+ZviifniA65QMbPiX4Hi8es4kRQPUnV/G3MULAv2cYif
	1Vlb489irhJFd8XCfyLOurir6FFbrBXnHaSC9Toq7v1JrRhoephT9MCF6zaLKlghr42Dx3F/IbR
	frF8TguZHh/VptY2Ed9AzayroYRty8Tki8R+4IoryGDMiowjU2QNsskU5xumFrWIa/WeTIIhmNh
	HAUbtvP/2G/shtlCXeJ55slyhjy4yhIry9cSFaYc0Bg2ygMAqEzJ1vG4p27xrdusA1Y9fJ8MsJy
	B/M9VfV6W9pCfXH9BQM7fNuESFDvCVFt3kL9zPzsC2qHgtiPmrabS5cGkkMQy/IdUXcprgjT2LV
	hgO51CJ17RdySHS1gKEOtBnSkHEkWV/9LHZ6mQvDwh2mW0/HOvNdVo54PP4ZUWuSSSJ/Q==
X-Received: by 2002:a5d:6f1e:0:b0:48b:12f:50da with SMTP id ffacd0b85a97d-48b024d44b8mr3653081f8f.23.1790783098172;
        Wed, 30 Sep 2026 08:44:58 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm4474979f8f.24.2026.09.30.08.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:44:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 17:44:57 +0200
Message-Id: <DLSRMLU0EYKQ.3KSUL5VCXXX11@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Joshua Watt"
 <JPEWhacker@gmail.com>
To: =?utf-8?b?S0FaVVlPU0hJIEFLSVlBTUEgKOeni+WxsSDlkozmhbYp?=
 <kazuyoshi_akiyama@jp.honda>, "Benjamin Robin"
 <benjamin.robin@bootlin.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources
 filter
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
 <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr> <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
 <TYYP301MB11583CEAF49F1D6ABB33F54EEB8D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP301MB11583CEAF49F1D6ABB33F54EEB8D2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246978

Hello,

@Joshua (and other SPDX/SBOM interested parties):
As our "SPDX/SBOM guy", I would love to have your input on this thread.
FYI, We (Paul or I) plan to raise this at the next tech call.

>> -----Original Message-----
>> From: Benjamin Robin <benjamin.robin@bootlin.com>=20
>> Sent: Monday, September 28, 2026 5:57 PM
>> To: KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=B1 =E5=92=8C=E6=85=B6) <kazuyoshi=
_akiyama@jp.honda>; openembedded-core@lists.openembedded.org; Yoann Congal =
<yoann.congal@smile.fr>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Mathieu Dubois-=
Briand <mathieu.dubois-briand@bootlin.com>
>> Subject: Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-source=
s filter
>>
>> On Saturday, September 26, 2026 at 11:19=E2=80=AFAM, Yoann Congal wrote:
>>> On Thu Sep 17, 2026 at 6:24 AM CEST, KAZUYOSHI AKIYAMA via lists.openem=
bedded.org wrote:
>>> > SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files=20
>>> > down to only the ones that were compiled before adding them to the=20
>>> > SBOM, but on wrynose it doesn't work.
>>> > add_package_files() is what picks which files go into the SBOM.
>>> > It walks ${SPDXWORK} itself to get file paths, then keeps only the=20
>>> > ones that match the list of compiled sources returned by=20
>>> > get_compiled_sources().
>>> > get_compiled_sources() just returns what save_debugsources_info()=20
>>> > stored, and that data uses paths rooted at ${TARGET_DBGSRC_DIR} (=3D=
=20
>>> > /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
>>> > add_package_files() compares against.
>>> > So the list get_compiled_sources() returns never matches what=20
>>> > add_package_files() is comparing, and almost every file ends up=20
>>> > marked as not compiled.
>>> > This happens for every recipe except the kernel, which has its own=20
>>> > special-cased path.
>>> >
>>> > This isn't just a matter of the SBOM missing the right files.
>>> > sbom-cve-check uses the same match result to decide whether a=20
>>> > vulnerable file was actually built, for its vulnerability triage.
>>> > If the match count is always zero, that triage doesn't work either.
>>> > On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.
>>> >
>>> > master already has this fixed,
>>> > and this backport brings that fix to wrynose.
>>> > b567c2f0d9 is the commit that fixes it.
>>> > Everything else in the series is a prerequisite for that patch.
>>> > Backporting b567c2f0d9 along with its prerequisites brings wrynose's=
=20
>>> > behavior in line with master.
>>> > With this, compiled sources get counted correctly, and=20
>>> > sbom-cve-check's triage works correctly too.
>>> >
>>> > On wrynose (genericx86-64, core-image-full-cmdline), the match rate=
=20
>>> > goes from effectively zero to 93.9%.
>>> >
>>> > One thing changes.
>>> > What the SBOM records as a source file name changes too.
>>> > aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR, so a=20
>>> > recorded source file name changes (e.g. sources/acl-2.3.2/...=20
>>> > becomes acl-2.3.2/...).
>>> > This is a change to SBOM metadata only.
>>> > The actual build output is unaffected.
>>> > Anyone diffing SBOMs across LTS point releases will see it.
>>>=20
>>> Hello,
>>>=20
>>> Thanks for the series, this sounds like a worthy fix.
>>> But, this SBOM change is a bit more intrusive than I'm confortable=20
>>> with... This will create a lot of noise for users that precisely track=
=20
>>> their SBOMs.
>>
>> Hello Yoann,
>>
>>> Can we do the fix without this change?
>>
>> Technically, we could do it. But it wouldn't be exactly the same series,=
 which I don't really like, and the code will diverge.
>> For information I could develop a solution after ELCE capable of generat=
ing a similar SBOM if Kazuyoshi doesn't feel comfortable doing it.
>> --
>> Benjamin Robin, Bootlin
>> Embedded Linux and Kernel engineering

On Mon Sep 28, 2026 at 11:39 AM CEST, KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=B1=
 =E5=92=8C=E6=85=B6) wrote:
> Thank you for your comments, Yoann and Benjamin.
>
> I agree with Benjamin.
> This series does introduce a visible change that the source path in
> SPDX will be changed from `sources/XXX/YYY.c` to `XXX/YYY.c`.
> However, the design change of the patch 0002 is reasonable, and I
> believe it is better to avoid code divergence whenever possible.
> The impact of this change is very small.
Do you have anything to support this affirmation?
I can imagine users having quite strict processes around SBOMs that
could be disrupted by a change like this (e.g. diff'ing SBOMs across
versions).

> I could write a patch to preserve the `sources/` prefix, but even
> then, wrynose users would still need to adapt to this change in the
> next LTS release.
> Furthermore, if I write such a patch, the path change would occur
> silently in the next LTS release, without sufficient context to
> document it properly in the release notes.
Breaking changes like this when changing release is expected and not a
problem at all.

Regards,
--=20
Yoann Congal
Smile ECS

