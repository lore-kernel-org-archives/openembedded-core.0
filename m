Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9422AEA3F2E
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:35:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16174.1770716146571643772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wDpd3RfE;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso44823805e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770716145; x=1771320945; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfs/akhYwlrDgz/XFGrj8WcZim4AkdDaIp96psljMm4=;
        b=wDpd3RfEW+ZvG821piv9QqYxiy+nk1OFvIhgKbmteBeafpya/qckSjwI+IpiV15kIQ
         FIFIWWZ9bWYOOjEEWnk7h7UVGwP0zvOyDAwgxMsWZaLnlreFBXJFKvH4D/QW7wWvpxza
         yMFAVtlFPA84DMiohj9+JuLavEGtPqRzsoN0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716145; x=1771320945;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfs/akhYwlrDgz/XFGrj8WcZim4AkdDaIp96psljMm4=;
        b=gjCz9xqyJut4H2ujH4JbTMKEN16iuvxPvdae/jSE3/a8XOhTcVwnP5v5vinfqPCMpO
         3xyCZKeCTd6ZUxM2j5PhjYsj9dqwSu3BUQgW1seOimzDVx4T0m47W5JQsVhBUkJT26NP
         gNeGg3+jVEUW/IaJxaX0R8Q9/yOVF5v23G2EMCcvjDgxKrdbBJ6wW/9cD4SL/UIkXZyC
         dC/OLFjYTQyGwKNt8chgfgZ5z5EX/xhfOXQrKnk17NpW7hOjMhy5e6BgKhY70gkUkDJ1
         PzlOY5jEVcRGMhWUZDznziPyUKWmCdp9I/+YWkl3HbbxsCsoaRrIqt+AjrnHfKJ10xFb
         wU2g==
X-Forwarded-Encrypted: i=1; AJvYcCUG4h8ZV+E/4uxN4zu0En5MX8wxjkKNjM+nPUpRzyDVqkZ7OmL9oJxg7wqMI4SbgLrzFp2k4MAvoaZgEvoVPk13sA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxvS4bW+jeruBQrHSWSik8zsAkoOmU6Qf2T1LNeddh0IGPln2Yx
	tx0+E8lZb8uPF9eDicWgRnCsstS5NiqEqCnw+fX59ptoZQS1JQLVSAD+9AgqFGE42Sc=
X-Gm-Gg: AZuq6aKtV0PT/V85ErvUH2EiWbgvyZTJmdVvQRkKIscwNGYbXXCjO5kM5xXlxCpPvI0
	a6/mTYtW7KvpZNPJVSa2DG7HvTUmwKN1eqgP5VIXaSKyPd3Uf4747UUxlwNzQYbviwr0Z9js9Xa
	RmK1o7e6AVKiEKyH4GZuRbwXQJ7fjXsAzk5yj7U5bZoHJol8XluB++j4Dhcba+ySss2MtFU6Hlo
	yWkq5w3Cfcm++Ut/oeItQ5vx3R6LD8ky9Ofm1y+vrhrLykQjydaOq3c/8Sq2dup1yCo37+hZPTn
	TAuy75ms92bUdTHECWULxVxYv9EJKDj15dukGdGzRsnfW5f2iWKEi+ymj7i0Nb0i7ghxs22k2HZ
	tS0zfDHhXndEEV7Rz8osT9fuj3OG3qZW0l+VDDiu+TCtaWqSrqmmgfTN2jvNM6/S7e4Do9vkfDQ
	Ar/21svXeyTkDnK6ubrsdPnSFaP7CE5+8BOT/vJnTaxMhMP7bH1lkc5oyiGCYAEDqid5XoEP3Ub
	9MWPC3I63xUlB/nt1vkrQrWzyc=
X-Received: by 2002:a05:600c:1390:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-483201dc4bamr193578465e9.3.1770716144755;
        Tue, 10 Feb 2026 01:35:44 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm79862615e9.10.2026.02.10.01.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:35:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 10:35:43 +0100
Message-Id: <DGB6HIM1ZK8A.2S3O9NW59L2DC@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 21/25] improve_kernel_cve_report: add
 script for postprocesing of kernel CVE data
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1770626074.git.yoann.congal@smile.fr>
 <1adc13b185d18abd926ceab4fc893374b35f9adf.1770626074.git.yoann.congal@smile.fr> <18f85f4429057b6d39eb7f9d80d41e63d69e40e7.camel@pbarker.dev>
In-Reply-To: <18f85f4429057b6d39eb7f9d80d41e63d69e40e7.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230869

On Mon Feb 9, 2026 at 11:58 AM CET, Paul Barker wrote:
> On Mon, 2026-02-09 at 10:29 +0100, Yoann Congal via
> lists.openembedded.org wrote:
>> From: Daniel Turull <daniel.turull@ericsson.com>
>>=20
>> Adding postprocessing script to process data from linux CNA that include=
s more accurate metadata and it is updated directly by the source.
>>=20
>> Example of enhanced CVE from a report from cve-check:
>>=20
>> {
>>   "id": "CVE-2024-26710",
>>   "status": "Ignored",
>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>>   "summary": "In the Linux kernel, the following vulnerability [...]",
>>   "scorev2": "0.0",
>>   "scorev3": "5.5",
>>   "scorev4": "0.0",
>>   "modified": "2025-03-17T15:36:11.620",
>>   "vector": "LOCAL",
>>   "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
>>   "detail": "not-applicable-config",
>>   "description": "Source code not compiled by config. ['arch/powerpc/inc=
lude/asm/thread_info.h']"
>> },
>>=20
>> And same from a report generated with vex:
>> {
>>   "id": "CVE-2024-26710",
>>   "status": "Ignored",
>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>>   "detail": "not-applicable-config",
>>   "description": "Source code not compiled by config. ['arch/powerpc/inc=
lude/asm/thread_info.h']"
>> },
>>=20
>> For unpatched CVEs, provide more context in the description:
>> Tested with 6.12.22 kernel
>> {
>>   "id": "CVE-2025-39728",
>>   "status": "Unpatched",
>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
>>   "summary": "In the Linux kernel, the following vulnerability has been =
[...],
>>   "scorev2": "0.0",
>>   "scorev3": "0.0",
>>   "scorev4": "0.0",
>>   "modified": "2025-04-21T14:23:45.950",
>>   "vector": "UNKNOWN",
>>   "vectorString": "UNKNOWN",
>>   "detail": "version-in-range",
>>   "description": "Needs backporting (fixed from 6.12.23)"
>> },
>>=20
>> CC: Peter Marko <peter.marko@siemens.com>
>> CC: Marta Rybczynska <rybczynska@gmail.com>
>> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
>> Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>
> This looks like a backport of a new feature, if we're making an
> exception to allow this to be backported then we should document the
> reason why (apologies if this is somewhere on the list and I've missed
> it).

I've talked about it briefly there:
https://lore.kernel.org/openembedded-core/CAMSfU+6DXfuaG0uyPtEg5hE7oHqP=3D8=
pRhSttciF+NHcwr0Hpjg@mail.gmail.com/t/#u
Mainly, since this is "contrib/", I don't mind relaxing rules a bit.
@Paul, do you think this is reasonable?

I agree that this exception should be documented (I will add a note in the
commit message)

> If we do take this, we should also consider the other changes made to
> this script since it was added to master.

Yes, if I accept this one, I would also accept further updates on this
script.

Cheers,
--=20
Yoann Congal
Smile ECS


