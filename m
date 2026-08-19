Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AD2C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 13:55:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7618.1787147730362321109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2LQT8xjd;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4994c49f588so10859575e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787147729; x=1787752529; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aeMdPyjdXtB3RtaPa+NDjt3f8OAspfBU6HsNAhKv1vM=;
        b=2LQT8xjdtNityh41F681GM3UKqe50HfHr2jLk/Ibvuk7FFUdynfXNHT9Lh6Uy6/uuT
         M6LtKxo8ow3sxWhN9xWPEGM/8ssahRwiX1psa426Q6hIYD0giJN+t3sMq5nn2QgdK99A
         KMWB4v27idDOyUzzQRloIG4dyYYpb5zELNWg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147729; x=1787752529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeMdPyjdXtB3RtaPa+NDjt3f8OAspfBU6HsNAhKv1vM=;
        b=VlaKfnDKoo32Hj8W5xi+1VmO3G1vK5WJc16HfKUDoJJtoHMYVU1rvXUQSL0PahfJrr
         UhvRTnclOPM3WIxLj0uCwrG8wWcIK9mVAy+kvGYjozWGQTx/lProuxz61OF7cpuKza0U
         YibBNgd5c8lftYpqoBDvru290cMPghO5psWH1GNc+rxid4EUmPw6nJ98H23pXUxs9EnK
         IMXZk2m6XVecFaZ5g8l2UmCKqW/kHrxOv0amLSQiphR89gAAPGERKNpQgCzm55x2xegp
         zHNpnvWNBoi0Qc4QcByyEwT2MOkUZUbNlmWpDV3XyVOZoUzsXVqkrsVb28YU2hUffkKG
         7OQA==
X-Forwarded-Encrypted: i=1; AHgh+RqdtvwTHlDIw2bBz0b5Ng+xW+7W//rPFjb9FhwOOXCZUvEgtzLi3gwcj1QNeyMRdKN/8h8f0M6Ky7ORjwgPjexMyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRFsMVPrRLSOqPO+pHGOqZynY5hFaXIYA+i0nsWxTTLKTx3l7i
	7gUJyBEDzWRzm3YM6KMeRhpDh2Fc8FaHe56gtM2hMKoar3Q6lgRZJYQrDNFBEsyVd8k=
X-Gm-Gg: AR+sD13RTAKBe1XEhIkfB53VQiuectzF4AFW0Vu2OZGxIoEthZx9Qvb7QbDbH934vY3
	tDN1leAMWj2WWoJW9BGHmcyWrrQAVUZeBzZzD/YS0nkLHfd15nxvKKGLtNGHCVOSHt/EYBoxX6e
	n4ItM+z6RAvXpEXZ4zpk4mAENR+3JUk+gdN0pFEpzSKKqTcudNU+3zwbJf0g/dUA6Oy0xYu5ne/
	x1wvXvaqW1Ltdns8LE/H/p8JN6puQCCGic/gkyXm/riFCqEVIraAJWlzpLosc6ZMncwz34Uwxpb
	ywzQ5PJxZ5w/TAHAU1kn6Yr75aYKQbt4sQapziCtPIqav1zD+euzJz2LZMBd0xnjsR8jnfh0MiJ
	sIFjtoEaNiTI2YBILkVFiIBbgqYkGE5BeL8QpY8IQUFhQydXoj7qoYSLYIIRFZ1nvHO9SRgi6m7
	hVKmOwS+/PyHtXR09yjcBrMj9dkOPNG9VGljv6SofN534gN7OTRxFGps8K92DbgrhBbjG5oVSYy
	fKfTINu0PKqywgxZbeDhfkTvodMPGFrLdonmAwjrMxg0j0/pvWE6v0Up1HsHzWEUWzzaluMY128
	rY9w38qTbYluGEdYFIp9AQD2sw1WEUpMHis=
X-Received: by 2002:a05:600c:4e88:b0:495:648c:a1 with SMTP id 5b1f17b1804b1-499aa0b7b16mr81443545e9.3.1787147728638;
        Wed, 19 Aug 2026 06:55:28 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm69671575e9.4.2026.08.19.06.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:55:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 15:55:27 +0200
Message-Id: <DKSYZW23CEN0.39QRZPNJI0ZQY@smile.fr>
Cc: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for
 CVE-2026-58055
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <deeratho@cisco.com>, "Fabien Thomas" <fabien.thomas@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260805080334.2604235-1-deeratho@cisco.com>
 <DKN2SEC32827.35IBSQC8DBN5H@smile.fr>
 <DM4PR11MB618958FDF26AD3CD29C84EE6C4DB2@DM4PR11MB6189.namprd11.prod.outlook.com> <DM4PR11MB61890AA22D68992DB6912558C4A52@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61890AA22D68992DB6912558C4A52@DM4PR11MB6189.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 13:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243730

On Wed Aug 19, 2026 at 1:45 PM CEST, Deepak Rathore -X (deeratho - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hello Fabien Thomas,
> I hope you are doing well.
> Just a gentle follow-up on my previous email regarding CVE-2026-58055. Wh=
en you have a chance, could you please share your thoughts on the validatio=
n approach for a backport in this case?
> I would appreciate any guidance you can provide.
> Thank you for your time.
> Best regards,
> Deepak
> ________________________________
> From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <deeratho@cisco.com>
> Sent: Thursday, August 13, 2026 11:34 AM
> To: Fabien Thomas <fabien.thomas@smile.fr>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
> Cc: Viral Chavda (vchavda) <vchavda@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-5=
8055
>
> Hello Fabien,
>
> Thank you for highlighting the risk of checking EXTRA_OECMAKE directly. I=
 agree that a user could modify the CMake options through a .bbappend while=
 the original -DENABLE_LIB_ONLY=3DON option remains present. In that case, =
the conditional CVE_STATUS could produce a misleading result.
>
> I tested the complete upstream fix against nghttp2 1.68.1 with patch fuzz=
 disabled:
> https://github.com/nghttp2/nghttp2/commit/ab28105c4a0197da24f8bfc414bc116=
055249e1e
>
> Unfortunately, it is not a clean or straightforward backport. Thirteen hu=
nks fail across six nghttpx source files because the fix was developed afte=
r substantial nghttpx refactoring that was included in the 1.70.0 release.
>
> The current OE-Core recipe intentionally builds only libnghttp2 using -DE=
NABLE_LIB_ONLY=3DON. Consequently, nghttpx and the affected shrpx sources a=
re not compiled by the default recipe. This behavior was introduced when th=
e recipe was converted to a library-only recipe.
>
> To validate a manual backport, I would need to use a temporary local .bba=
ppend that:
>
> - adds the nghttpx build dependencies;
> - disables ENABLE_LIB_ONLY;
> - enables ENABLE_APP;
> - builds nghttpx with the backported patch.
>
> I also have a question regarding validation: since nghttpx is not enabled=
 by the recipe=E2=80=99s default configuration, how would the community nor=
mally validate changes to this disabled component?
>
> Thank you for your guidance.
>
> Best regards,
> Deepak
> ________________________________
> From: Fabien Thomas <fabien.thomas@smile.fr>
> Sent: Wednesday, August 12, 2026 9:07 PM
> To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded=
-core@lists.openembedded.org>
> Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for CVE-2026-5=
8055
>
> On Wed Aug 5, 2026 at 10:03 AM CEST, Deepak Rathore via lists.openembedde=
d.org wrote:
>> From: Deepak Rathore <deeratho@cisco.com>
>>
>> CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
>> Upgrade requests with a Content-Length header and body.
>>
>> The default recipe does not build nghttpx. Add a conditional
>> CVE_STATUS entry so the CVE remains unpatched if app support is
>> enabled, while default builds are marked not-applicable-config.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-58055
>>
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>>  meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recip=
es-support/nghttp2/nghttp2_1.68.1.bb
>> index 71d5eef8d6..29a7d26819 100644
>> --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
>> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
>> @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D "-DENABLE_DOC=3DON,-DENABL=
E_DOC=3DOFF"
>>
>>  EXTRA_OECMAKE =3D "-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_BINDINGS=3DOF=
F"
>>
>> +CVE_STATUS[CVE-2026-58055] =3D "${@bb.utils.contains('EXTRA_OECMAKE', '=
-DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is not built=
 in the default nghttp2 configuration', 'unpatched', d)}"
>> +
>>  BBCLASSEXTEND =3D "native nativesdk"
>
> Hello Deepak,
>
> I'm filling in for Yoann while he's on leave.
>
> We would prefer to avoid conditional CVE_STATUS entries whenever possible=
.
> The risk is that users who enable this feature through other means think =
they
> are protected but actually no.
>
> Conditional CVE_STATUS should really be a last resort. Could you please c=
heck
> if the actual fix for CVE-2026-58055 can be easily backported instead?
>
> Best regards
>
> --
> Fabien Thomas
> Smile ECS

Hi Deepak,

Sorry for my late reply.

Thank you for analysis and testing the backport.

I agree, backporting a complex patch that isn't built in default
configuration is not what we want.

To answer your question, recipes are maintained and validated based on=20
their default configuration. We do not maintain heavy backports=20
for disabled components.

So, even if conditionnal CVE_STATUS is usually not the preferred approach,
we'll take your patch as is (but probably in the next round of review).

Regards,
--=20
Fabien Thomas
Smile ECS


