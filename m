Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A5ECD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 11:31:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5295.1778671898527765186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 04:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fp8/lT8x;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98C04C5DC48;
	Wed, 13 May 2026 11:32:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AB205FE21;
	Wed, 13 May 2026 11:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E61F11AF8CB9;
	Wed, 13 May 2026 13:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778671894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xmqmhoHgkY2WtPxB+hQTeVkh1/4MIQYDLXamgiNr2X8=;
	b=fp8/lT8x1yKs6YyEZbWhctxMUPP6soVQ803vb0y5jDi9s6dsIhemzHKyVHGpjlAG/icWQW
	BgtqFAFzwM1xtfbY2II3xK2lvuL1td6yIkS1Tw5So+VqggOMeG+KC2PleNVrd+TFAan9Un
	RY3lTvPmqye+AI65ykP2j9Wg9EpNcKX6FqiieaVBHbdf591EwcytxJy+1IdINSokLbXVgn
	0E47//SJy/LRXVtodRFT58BQorkJu4uVfu+NfrECaRyTsolMBAYyX9ijLDDO5LWsKb0SRs
	xfJOqvacLpKMxyeFO0tajEKN6Aq987yxXOgtmOzycZt5KTrm1SdIFoSSA/bT+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 13:31:31 +0200
Message-Id: <DIHIKAQL0NEQ.2BWFTYOSD28MQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Cc: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM> <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com> <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM> <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com> <DIHAXWVL9CB6.2DT385U5BQUR8@bootlin.com> <GV2P189MB3005E48C410DEC97170387B2FE062@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005E48C410DEC97170387B2FE062@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 11:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236963

On Wed May 13, 2026 at 10:27 AM CEST, Pratik Farkase wrote:
> Hi Mathieu,
>
> I was able to reproduce the multilib symlinks conflict locally with the s=
ame configuration. The root cause is that packagegroup-core-buildessential =
pulls in
> gcc-symlinks, g++-symlinks, and cpp-symlinks which conflict in multilib i=
mages (both arches try to own /usr/bin/gcc).
>
> The fix is to replace:
>   RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
>  with:
>   RDEPENDS:${PN}-ptest +=3D "gcc g++ make"
>
> And update run-ptest to find the compiler dynamically rather than hardcod=
ing gcc/g++. I've verified this resolves the multilib conflict -lib64-core-=
image-sato-sdk builds cleanly with the fix applied.

Thanks.

>
> Once you've had a chance to reproduce the glib-2.0 locale selftest issue,=
 I'll send v4 addressing all three problems:
> - glib-2.0 locale selftest issue
> - Multilib symlinks conflict (use gcc/g++/make instead of packagegroup)
> - complex_int exclusion (fails on riscv64)

I failed to do that yesterday, and I won't have time to look at this in
the coming days. As I said, it might be some other issue that just shows
here.

Send your v4 when you are ready, if we are a bit lucky we won't see this
issue anymore.

>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Sent: Wednesday, May 13, 2026 7:33 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
>
> On Tue May 12, 2026 at 5:16 PM CEST, Mathieu Dubois-Briand wrote:
>> On Tue May 12, 2026 at 10:30 AM CEST, Pratik Farkase wrote:
>>> Hi Mathieu,
>>>
>>> I tested v3 on qemux86-64 against current master and was unable to
>>> reproduce the glib-2.0 locale or multilib symlinks failures.
>>>
>>> Could you share the steps or configuration you used to reproduce the
>>> these two issues? That would help me investigate further.
>>>
>>> Best Regards,
>>> Pratik
>>>
>>
>> Hi Pratik,
>>
>> Regarding the multilib one, I just managed to reproduce it locally:
>>
>> Using tag oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3808 from
>> poky-ci-archive git:
>> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder=
.yoctoproject.org/valkyrie/a-full-3808
>>
>> Default local.conf template, with these lines added:
>> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib64'
>> SANITY_TESTED_DISTROS =3D ''
>> OEQA_TESTDISPLAY =3D ':1'
>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobui=
lder/autobuilder-resource-constraints'
>> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allo=
w-root-login'
>> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
>>
>> Then:
>> bitbake lib64-core-image-sato-sdk
>> ...
>> ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.=
 Command '...' returned 1:
>> ...
>> Running transaction check
>> Transaction check succeeded.
>> Running transaction test
>> Error: Transaction test error:
>>   file /usr/bin/g++ conflicts between attempted installs of lib64-g++-sy=
mlinks-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
>>   file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks=
-15.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
>>   file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-sy=
mlinks-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32
>>
>> I will try to reproduce the selftest failures.
>>
>
> I don't have the selftest issue locally. We can assume it is some sstate
> pollution for now, we will go back to it later if it happens again.
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


