Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2127.1792481781595618324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uP9WTVIu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C1754E4128C
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:36:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D65B3606D2;
	Tue, 20 Oct 2026 07:36:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1806F10328D6E;
	Tue, 20 Oct 2026 09:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792481778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=foyA5P3zmyksZKf0Dji1FcF3cCEY6xzw3RyHxFc9a+Y=;
	b=uP9WTVIus8hTgDBMST+XXeJcRxf7QurDRxqCoaPvzGWdSFvNPXBKFN+J0Ve9ACEATbZLnF
	o45X5V9DcOZCSfUV+Zo6nZEpC2fasJDSa0skT9VUkq8e0qtWvPtUv9zrqhjqnaqo8zeKAB
	ow4xuFHHHHY6J2EsMRr4i4NgbsnNaWxuccPOLAE0MumxCl3q8OPEm6cV0p5xFJ0JyREPML
	oaqDMUDWXcE+o2JPHSqy2//DVdtfaV6i6NvE4retPalivQoEJW97Ttdb19B3t886gePPkR
	g7RY6eIe2lucuX5/ZcI5umxnfpwMnK6UWSfFbPPC5uAZLJp88LPjw/61z5a08w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:36:16 +0200
Message-Id: <DM9HRC455YBZ.1G64O77PEY811@bootlin.com>
Subject: Re: [OE-core][PATCH v3] libsoup: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261014085044.14497-1-pratik.farkase@est.tech>
 <20261014120737.24575-1-pratik.farkase@est.tech>
 <18DEF3F6676C6093.2594042@lists.openembedded.org>
In-Reply-To: <18DEF3F6676C6093.2594042@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248239

On Fri Oct 16, 2026 at 10:05 AM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
> On Wed Oct 14, 2026 at 2:07 PM CEST, Pratik Farkase wrote:
>> Build the installed-tests via the meson tests/installed_tests options
>> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
>> DISTRO_FEATURES) and run them under ptest with
>> gnome-desktop-testing-runner.
>>
>> Tested on qemux86-64 with ptest-runner.
>>
>> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
>> ---
>
> Hi Pratik,
>
> Thanks, it's much better now. Still, I do note some intermittent
> failures.
>
> Failed ptests:
> {'libsoup': ['libsoup-3.0/multithread-test.test']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4725
>
> Failed ptests:
> {'libsoup': ['libsoup-3.0/http2-test.test']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/26031
>
> I believe we can keep it in testing for a bit of time and see which test
> fails and how often, then decide if it gets merged or not. But we will
> probably need a bit more work in there.
>
> Thanks,
> Mathieu

Hi Pratik,

So after a few days, here is the situation:

{'libsoup': ['libsoup-3.0/multithread-test.test']}
2 occurrences, 1 qemuarm64-musl-ptest, 1 qemuarm64-ptest
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1400
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4725

{'libsoup': ['libsoup-3.0/http2-test.test']}
8 occurences, all on qemuriscv64-ptest
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2603
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2614
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2615
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2616
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2618
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2621
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2625
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2626

So I believe this will need a bit more work to make these tests a bit
more stable, I'm sorry.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

