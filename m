Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EE21099B2C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:24:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18614.1774027491437088495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hGEiJXCA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F8D81A2F20;
	Fri, 20 Mar 2026 17:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 362F6600E0;
	Fri, 20 Mar 2026 17:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5FA710450CC1;
	Fri, 20 Mar 2026 18:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774027488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IXy4OMs0cuK7MHj6CjSdqkdYVdvRq32UMxb4DfYyFxU=;
	b=hGEiJXCA9a8d4rrjLPdAmxYx+WhnXRbrb7eUP7TWXEV+s/BcYr/bMr3at8FlZEznRjDc7U
	qhzdI/7iT2+d8YiHewev5huiVCx6gxb79j6iLjcm/Vjv8soIWOjdsVC4JeOT6tTGCAGvMr
	h3CCbn+7no0cRjjOMxGQu0epIORXU2PbZytaRuFjIJ1wwUcgN16wPxnSVWfL0w54q5coGY
	WUQK1EDTlsUMjz8Ky4qVR0aIiyp+lARVfBvco0twSFYaGUoa96Cg4wfVzJ35P8/gcq+h4x
	a1ODQp5QLeQm1qUwidU2V2GfEdGw7/vCAE0m/WG71w2NhvsfvQsjH6yBtMMM8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:24:47 +0100
Message-Id: <DH7S9CSYLAE7.KCFID0H8JCFK@bootlin.com>
Cc: <JPEWhacker@gmail.com>, "Stefano Tondo" <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v9 0/7] SPDX 3.0 SBOM enrichment and compliance
 improvements
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
 <DH7S7WZ1RF7O.FSB1M0J2ZLLO@bootlin.com>
In-Reply-To: <DH7S7WZ1RF7O.FSB1M0J2ZLLO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233631

On Fri Mar 20, 2026 at 6:22 PM CET, Mathieu Dubois-Briand wrote:
> On Thu Mar 12, 2026 at 4:38 PM CET, Stefano Tondo via lists.openembedded.=
org wrote:
>> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>>
>> This series enhances SPDX 3.0 SBOM generation with enriched
>> metadata, ecosystem-specific Package URLs, and compliance
>> improvements.
>>
>> Changes since v8 (addressing Joshua Watt's review):
>>
>>   1/7: File exclusion now uses re.compile() for proper regex
>>        matching instead of substring matching. Excluded files
>>        are tracked in a set() returned from add_package_files()
>>        and passed to get_package_sources_from_debug() for
>>        precise cross-checking.
>>
>>   2/7: Unchanged (Reviewed-by added).
>>
>>   3/7: Fixed npm_spdx_name() to use bpn[5:] instead of bpn[4:]
>>        since "node-" is 5 characters.
>>
>>   4/7: Dropped PV fallback for non-Git source versions since
>>        the recipe version does not necessarily match individual
>>        downloaded file versions. Ecosystem PURLs (which include
>>        version) from SPDX_PACKAGE_URLS are still used.
>>
>>   5/7: Renamed recipe-m4/recipe-tar to build-m4/build-tar in
>>        tests to align with upstream rename.
>>
>>   6/7: Unchanged (Reviewed-by added).
>>
>>   7/7: Unchanged (Reviewed-by added).
>>
>> Stefano Tondo (7):
>
> Hi Stefano,
>
> Joshua series has been merged. I've been trying to rebase this series on
> top of it, but I've got a few failures in
> spdx.SPDX30Check.test_download_location_defensive_handling and
> spdx.SPDX30Check.test_version_extraction_patterns. Either my conflicts
> merges were wrong or a few changes are needed.
>
> Can you rebase this series on top of master, make sure the said tests
> pass and resend? I believe this is the last step before we can merge it.
>
> Thanks,
> Mathieu

Sorry, my mailer did not fetch correctly, I just saw your new series and
Richard replies.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


