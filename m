Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7C1103E193
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:54:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16114.1773845664445599911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 07:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XFdLVRTI;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439af7d77f0so5191796f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773845662; x=1774450462; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bodVKsRoklZaxt8a7zkvVIhCtS0XmJEBbhNsmuhnXOc=;
        b=XFdLVRTIl1+QPlNAh78D9qrFCJ5xY0WOaCiq5a0QGfXq9+8quitmMi6mu0E3n4ic1T
         MeaahDLxj7Ni2zCd++xJGygQ6f68HRn2EqamkEW9ppoTU64vkoYP6NeIQSbbomc618Aa
         ztBFQgx5HKVxs1bVsQiSC0ZBRY7SYo2vbRryw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845662; x=1774450462;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bodVKsRoklZaxt8a7zkvVIhCtS0XmJEBbhNsmuhnXOc=;
        b=Bry1wfCVobAZfESdqk3sdjkXoRtAKpCRVW1L85o+s66xDjNPBwKXgoYzN2h3mvNMqU
         zzChwsJR3ldRtAtinUaeAl9yEiPUFL7mmnQJD7p3QNUQnSSzyD/OMGgSJkfLUhDVLKgN
         4m5c9444wMNXE2ZcDjaE5g8NYnCy/gg0Zqy+CJN8t6+y7C5sDuOqavpi4sLz8x5ZepVn
         WDoiwsKU8a+HcOx+nfUnB4L+Z3sS6H6jnURL5hkL4bBwjDIDrvToAJwiv8+GMyAQK37D
         bB+/n1hXpruBUGE4yjYzyWIwCFAxwrJsBzuGptS1pgBAC4OwuXuVzJ2wZB2ZSV/MZpG9
         ywpg==
X-Forwarded-Encrypted: i=1; AJvYcCWwbzWI4TdrlaRFLcvPVhFnM1Y1dTn7Pa0txU+JEDAe2rvBnStwbaZOH0k01hv6zzFwGOvL7Ss41JPw1vG0tUWZVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJcUo6NTj27LnVCTLSuTCJXY4pTtg5m22v/plxpAp0yjeAlC7Z
	AKeaQjoWSFMylWYTm9HTO0u1K+pPluJYBPBuxVwtQd9qBFUmpMT9zdBYgFW/HNRk4uE=
X-Gm-Gg: ATEYQzyf2GCg1lhnOclXWzOQlSxYDWCgRWBcx2K2F6oatKuu9/XqL3M8OqXCBiy5prb
	F2zbUshdcx5ltCs7gVC5KW0Hx2BYTMUADHX8xiBvicK9uKA2mVw0VYVQ0X2fMxZIhAFh+zZmADs
	gzDYetMLODAdECFt4BMPTIcg2XtbiA3toLsUPwLAdV7OhxZg1XaFyIqByLGZ03PDkincPe0XA82
	CG7W2YjrgBWdJs6Fq1L8+DGyYX8sq69riEiPAKi+BUd1fpD1JX0O3lHXnmwxbOXI6R10P8Oy2X1
	NrBL3tLg9K29l6q4I36fQ2Y/QWEe9apQvboywAZKsnZ6YGhlpePjaS3uZkJoNyF5vlgNQZiXs1H
	2Edagb/Af4J0NEztEZu+KfIdplmb/AH3CxgZkFGwRDHdiiIFFnbXaU51nxNhX+dlq/TLFet7MmC
	jwOfXzJZrcUnJmWU7EIQbP79UBZjZZg9TsOkIhZ28T3WZ6XjDVuvH6IJ5vTJFk+xyAlsXhYLWp4
	Q4Modabp8M=
X-Received: by 2002:a5d:5f82:0:b0:439:b440:b8b5 with SMTP id ffacd0b85a97d-43b527c7746mr6315462f8f.43.1773845662396;
        Wed, 18 Mar 2026 07:54:22 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm9115358f8f.5.2026.03.18.07.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:54:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 15:54:21 +0100
Message-Id: <DH5ZT3815YCS.3KCLUDAHIOFAB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143,
 CVE-2025-61144 and CVE-2025-61145
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "ankur.tyagi85@gmail.com"
 <ankur.tyagi85@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
 <20260307064540.1257672-3-ankur.tyagi85@gmail.com>
 <DH5YA0P6BUNT.1ORBJDTA4DDT3@smile.fr>
 <AS1PR10MB56979261E8061598669F8586FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56979261E8061598669F8586FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 14:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233406

On Wed Mar 18, 2026 at 2:58 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Wednesday, March 18, 2026 14:42
>> To: ankur.tyagi85@gmail.com; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143=
, CVE-
>> 2025-61144 and CVE-2025-61145
>>=20
>> On Sat Mar 7, 2026 at 7:45 AM CET, Ankur Tyagi via lists.openembedded.or=
g
>> wrote:
>> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> >
>> > These CVEs are for tools which were removed in v4.6.0[1]
>> >
>> > [1]https://gitlab.com/libtiff/libtiff/-
>> /commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45
>> >
>> > Details:
>> > https://nvd.nist.gov/vuln/detail/CVE-2025-61143
>>=20
>> This CVE: "libtiff up to v4.7.1 was discovered to contain a NULL pointer
>> dereference via the component libtiff/tif_open.c."
>>=20
>> Despite tools being removed in the commit you mentionned
>> libtiff/tif_open.c was not touched and the patch linked by NVD apply to
>> files outside of "archive/" were the removed tools are...
>>=20
>> Are you sure we can ignore this CVE?
>>=20
>> FYI, Peter patched it on kirkstone:
>> [OE-core][kirkstone 07/17] tiff: patch CVE-2025-61143 - Yoann Congal
>> https://lore.kernel.org/openembedded-
>> core/944f481d214bebeaf51769d77fe16cd93cbff351.1773652940.git.yoann.conga=
l
>> @smile.fr/
>>=20
>> Regards,
>
> If I remember correctly, the archived files are not included in release t=
arball.
> We're not fetching the git repository in our recipe.

Indeed, we don't have tools/tiffcrop.c nor tools/tiffdither.c (the files
patched by the NVD linked merge request) in our sources. So the added
CVE_STATUS looks correct.

Thanks Peter.

I will take this with a note for clarification.

>
> Peter
>
>>=20
>> > https://nvd.nist.gov/vuln/detail/CVE-2025-61144
>> > https://nvd.nist.gov/vuln/detail/CVE-2025-61145
>> >
>> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> > ---
>> >  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/reci=
pes-
>> multimedia/libtiff/tiff_4.6.0.bb
>> > index 777783d7cc..07540692fc 100644
>> > --- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
>> > +++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
>> > @@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] =3D "fixed-version: Tested
>> with check from https://secur
>> >  CVE_STATUS[CVE-2023-3164] =3D "cpe-incorrect: Issue only affects the =
tiffcrop
>> tool not compiled by default since 4.6.0"
>> >
>> >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_REMOVED_TOOLS"
>> > -CVE_STATUS_REMOVED_TOOLS =3D "CVE-2024-13978 CVE-2025-8176 CVE-
>> 2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
>> > +CVE_STATUS_REMOVED_TOOLS =3D "CVE-2024-13978 CVE-2025-8176 CVE-
>> 2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961 CVE-2025-61143 CVE-
>> 2025-61144 CVE-2025-61145"
>> >  CVE_STATUS_REMOVED_TOOLS[status] =3D "cpe-incorrect: tools affected b=
y
>> these CVEs are not present in this release"
>> >
>> >  inherit autotools multilib_header
>>=20
>>=20
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


