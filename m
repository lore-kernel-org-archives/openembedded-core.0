Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B378B112588E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:33:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4992.1773257610897386817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B0qeOSRW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C8BAF4E42630;
	Wed, 11 Mar 2026 19:33:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9015B60004;
	Wed, 11 Mar 2026 19:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEC4510369BD3;
	Wed, 11 Mar 2026 20:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773257607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O/IMBmxEcIwCsyasMJDLchwC9iFsc1m34IriSE/pDrs=;
	b=B0qeOSRWk1bJBrq+c67LqZGAAuWG4tb6FQ8S4YfXUz4fbjHQGaC0dggfZeN7A7PT/D4kPo
	LyrAVrhBUrkthOOi0Mjsx8Zlw7s2Z4dqyL5ni1bi56QYgIbj19s5ddkkRMHNCi6QtUKpRZ
	MKTZPKameRzVdT61EhA78XcU5R4YX3/PvgCIxmgw9xIUJ/e0EABeD//vrPHC5ZF8LpaplE
	1sSaHjPlb9NUd0eyNa3meJ5Sb6HzGjRy7OH5g72SEugmyZcdKqVMPwVWRMJPUgMvfgs44L
	O5He7JDjvYcVKpLkn3sG6Y3W5nwK5Z+JKYTslCGljSBMI479jS8cVuwGDVO7hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 20:33:26 +0100
Message-Id: <DH07CY9W3KAN.1BJBA53F4F1J5@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joshua Watt" <jpewhacker@gmail.com>
Subject: Re: [OE-core][PATCH v6 00/15] Add SPDX 3 Recipe Information
Cc: <openembedded-core@lists.openembedded.org>, "Stefano Tondo"
 <stefano.tondo.ext@siemens.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
 <DH00629IS6EY.1W6LCNY88LTHL@bootlin.com>
 <CAJdd5GajmhYOAO_+5G5ou0fUMeCcRxzDo0-yYLzmzk1-PHJrNA@mail.gmail.com>
In-Reply-To: <CAJdd5GajmhYOAO_+5G5ou0fUMeCcRxzDo0-yYLzmzk1-PHJrNA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232906

On Wed Mar 11, 2026 at 5:39 PM CET, Joshua Watt wrote:
> On Wed, Mar 11, 2026 at 7:55=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>>
>> On Tue Mar 10, 2026 at 7:38 PM CET, Joshua Watt via lists.openembedded.o=
rg wrote:
>> > Changes the SPDX 3 output to include a "recipe" package that describe
>> > static information available at parse time (without building). This is
>> > primarily useful for gathering SPDX 3 VEX information about some or al=
l
>> > recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
>> > vex.bbclass.
>> >
>> > Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
>> > helping work through this.
>> >
>> > V2: Fixes a bug where do_populate_sysroot was running when it should n=
ot
>> > be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
>> > incorrect (this is already handled by bitbake in the taskgraph, and
>> > doesn't need to be manually removed).
>> >
>> > V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
>> > dependency. meta-world-recipe-sbom also no longer runs in world builds=
,
>> > as there's no reason to this. Finally, fixes a bug where
>> > NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
>> > (because do_unpack was not run).
>> >
>> > V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
>> > information is linked to binary packages, or just recipes. Defaults to
>> > "0" to significantly reduce the size of the SPDX output.
>> >
>> > V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
>> > does funny things with its arch which prevents it from rebuilding SPDX
>> > data properly, and no SPDX data is needed for it anyway
>> >
>> > V6: Fixes a bug where SPDX task would not correctly re-run when they
>> > change, which would cause errors about missing SPDX document. Also
>> > updates to the latest version of the SPDX bindings which improves
>> > performance
>> >
>>
>> Hi Joshua,
>>
>> Ok, we are almost there!
>>
>> I suspect it would work fine on master, but we have a fail on two tests
>> that were recently added by Stefano, and were not merged so far.
>>
>> As both series might still evolve or get reviews, I will probably keep
>> both in my branch, but some changes are needed if we want to merge both
>> series.
>
> This is actually semi-intentional. I renamed the "recipe-" SPDX files
> to "build-". The fix is simple, but it either needs to be applied to
> my changes or Stephanos, depending on the order. Do you have a
> preference?
>

I do not have any particular preference, so please do as is easier for
you.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


