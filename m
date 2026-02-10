Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2C0E7E0DB
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:47:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17074.1770720421866567851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iz90LPm0;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-481188b7760so38738465e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770720420; x=1771325220; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bbb5Lpnte5nXEexBrmfyTEjAPtxSgD7yZstba2UNM+g=;
        b=iz90LPm0lyW/qf/vMuCq8SirOpHCrbIbXFq1txRs+mHOSar+HRBW7K+NqudMNBQG7D
         +Taf4q3Pw9KIIxzJjo8UkyLTVg8E5YrsFTTbALHmVXdUkZULE2pj0vxuaGI4JmzCEwO9
         H6FZ5I+06+e2VW+j0tfj2wgUnqpc+rC9gWWbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720420; x=1771325220;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bbb5Lpnte5nXEexBrmfyTEjAPtxSgD7yZstba2UNM+g=;
        b=qd7038ItsDJZKpU+BwCxiOB3XwY77nfAHxACJFmyUf4YcqbSUiNobvNkoYCZIWOilS
         0SPIXeD4bicEgCqTe0yWcsc8J9wtTxDFX9J26krrC2icoBAlipnROpseNzbJYXAOurz6
         dpaceziN1desEZ65TFoxF9pQ13y3su+LmW3FnPSqiRLOuh8EGKn6vzbeie/HV5OtcwZp
         e2PbZDK2MRcR/uOjuqgpG8NwO88hluH9aG4aKadTE+5EM+3Pu7YZ6sUfEjOj4sYNoqb2
         iALk/ADIX9tH0QA2+pdTLhJxy6I4hJAJi6VUW/mv2a8FMHeK33eJIRJifnJckD70+Je8
         MUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP1LSEqxnIJLI+Ev/IP8AeDA43aU34+PTmASHFr7jB8jFXhCa0EJhwx4NaYe8EMpUMpqyCeDEPtXH5sPQ2JZO/9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzlc4Zh3TkMnDhNGshhpoyn9lrGA6UClb/tIxjIUeXZF7py2auq
	D4AVaJYiQ0rZaEjT+YZvD87jF5/RyVzNkC57nNDOO0ShFnv9BeUw6V3u/klajJAAQ9w=
X-Gm-Gg: AZuq6aLxNk20HgpqTAUNlyh6T3iYlvG4e8BZqUDV8PHldq2s9TqbAoNespCSKur00C4
	wqIJ0OxLcMaWMbgppyq0LNk54h1QCiK2WCBPV5o1XPd3GkVvUbo7bfE64kUyN3Uf676E5JLoBxE
	N62/FgIYTBxmSyunnOwoUtWQkq5dTilV9cqrdH4LRujqFi0B9ZyeHMDRGoRyALlib575HcYgafa
	oSf/Ak7RIjbKm0pA9RzV5uWihxaUPJqNIn8VmQpSfWhfDMI8EYExBMNJIy30KXsKX0X6TatBn8u
	cwhZ20DvQP9Btuqz9OwlMD2Sy5nm77DQv4oqmyxdf5+Uodn9WcnB/XKYtvbLFqRhDoiYFtQYA2o
	Dh84m4FbEI1xzZFCw9GBzJ2yexnQhmqVOCuZW3asTlklFjLzMNzErE0X6MZh7Xd5xJcXd62r90D
	xkRv15BmkPHDyVXSaVKbGzMvW8cjqFsbSCPlsmK8BvV/MkFCGaZOAoBDNO2tjDtLhnjfiGO5L/3
	Uemhqmv0bgp8Lfr
X-Received: by 2002:a05:600c:8207:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-48320928e6emr186169965e9.6.1770720420155;
        Tue, 10 Feb 2026 02:47:00 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd1c9sm32672078f8f.15.2026.02.10.02.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:46:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:46:59 +0100
Message-Id: <DGB802Q1LFPJ.2VTMZ8JDI9O9M@smile.fr>
Subject: Re: [OE-core][scarthgap 21/25] improve_kernel_cve_report: add
 script for postprocesing of kernel CVE data
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Paul Barker"
 <paul@pbarker.dev>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1770626074.git.yoann.congal@smile.fr>
 <1adc13b185d18abd926ceab4fc893374b35f9adf.1770626074.git.yoann.congal@smile.fr> <18f85f4429057b6d39eb7f9d80d41e63d69e40e7.camel@pbarker.dev> <DGB6HIM1ZK8A.2S3O9NW59L2DC@smile.fr>
In-Reply-To: <DGB6HIM1ZK8A.2S3O9NW59L2DC@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230883

On Tue Feb 10, 2026 at 10:35 AM CET, Yoann Congal wrote:
> On Mon Feb 9, 2026 at 11:58 AM CET, Paul Barker wrote:
>> On Mon, 2026-02-09 at 10:29 +0100, Yoann Congal via
>> lists.openembedded.org wrote:
>>> From: Daniel Turull <daniel.turull@ericsson.com>
>>>=20
>>> Adding postprocessing script to process data from linux CNA that includ=
es more accurate metadata and it is updated directly by the source.
>>>=20
>>> Example of enhanced CVE from a report from cve-check:
>>>=20
>>> {
>>>   "id": "CVE-2024-26710",
>>>   "status": "Ignored",
>>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>>>   "summary": "In the Linux kernel, the following vulnerability [...]",
>>>   "scorev2": "0.0",
>>>   "scorev3": "5.5",
>>>   "scorev4": "0.0",
>>>   "modified": "2025-03-17T15:36:11.620",
>>>   "vector": "LOCAL",
>>>   "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
>>>   "detail": "not-applicable-config",
>>>   "description": "Source code not compiled by config. ['arch/powerpc/in=
clude/asm/thread_info.h']"
>>> },
>>>=20
>>> And same from a report generated with vex:
>>> {
>>>   "id": "CVE-2024-26710",
>>>   "status": "Ignored",
>>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>>>   "detail": "not-applicable-config",
>>>   "description": "Source code not compiled by config. ['arch/powerpc/in=
clude/asm/thread_info.h']"
>>> },
>>>=20
>>> For unpatched CVEs, provide more context in the description:
>>> Tested with 6.12.22 kernel
>>> {
>>>   "id": "CVE-2025-39728",
>>>   "status": "Unpatched",
>>>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
>>>   "summary": "In the Linux kernel, the following vulnerability has been=
 [...],
>>>   "scorev2": "0.0",
>>>   "scorev3": "0.0",
>>>   "scorev4": "0.0",
>>>   "modified": "2025-04-21T14:23:45.950",
>>>   "vector": "UNKNOWN",
>>>   "vectorString": "UNKNOWN",
>>>   "detail": "version-in-range",
>>>   "description": "Needs backporting (fixed from 6.12.23)"
>>> },
>>>=20
>>> CC: Peter Marko <peter.marko@siemens.com>
>>> CC: Marta Rybczynska <rybczynska@gmail.com>
>>> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
>>> Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>
>> This looks like a backport of a new feature, if we're making an
>> exception to allow this to be backported then we should document the
>> reason why (apologies if this is somewhere on the list and I've missed
>> it).
>
> I've talked about it briefly there:
> https://lore.kernel.org/openembedded-core/CAMSfU+6DXfuaG0uyPtEg5hE7oHqP=
=3D8pRhSttciF+NHcwr0Hpjg@mail.gmail.com/t/#u
> Mainly, since this is "contrib/", I don't mind relaxing rules a bit.
> @Paul, do you think this is reasonable?
>
> I agree that this exception should be documented (I will add a note in th=
e
> commit message)

@Paul, see the update commit message in
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/s=
carthgap-nut&id=3D26138b9f4c1cfe4718f719ea7710c80290d9a8da :
> [Yoann: Stable policy exception: This change is clearly a new feature
> and thus should be rejected from stables by policy. But, since this is
> contrib/ an exception can be made]
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>


>> If we do take this, we should also consider the other changes made to
>> this script since it was added to master.
>
> Yes, if I accept this one, I would also accept further updates on this
> script.
>
> Cheers,


--=20
Yoann Congal
Smile ECS


