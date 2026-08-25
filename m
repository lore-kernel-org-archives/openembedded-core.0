Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA859C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:43:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17397.1787647416414461655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lh/SR8Ky;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482c58a8683so1822766f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787647415; x=1788252215; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCJlIAiewPnG1QIx2lfsbLKW3HcqWcHyQlSk7Pm0zeE=;
        b=Lh/SR8KyPwdoi5BvTWEDmnMBeZEbkae+rA8/P0JjbYTv/0Rv2T7b2O600NaTwZ0lCH
         399cxr0KS5jy53Ja4tQT4W9UErjMeS1YZI5DyNr/aXTYlOJH3Ltz0rVF1o9t+oLPpV+K
         EI8Qyaogqs2FiRMXuYeqBiWfuknWShwrmr6yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647415; x=1788252215;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCJlIAiewPnG1QIx2lfsbLKW3HcqWcHyQlSk7Pm0zeE=;
        b=jII7sVRT7QSJ5H7uFjmq+8FtKxmjo1NJ1hZrp8CGQtLLY+DpW3AB+vK1F6+7pEMCVw
         TBiAGZQ8HG2/NghNFWUzYXFZlhYOrCiXnmrFk96qvf+jkCS+8AcbOTJ95GHNkupk5f2W
         +IW2Mai0EXXjm30JYYtuKDgWL9mhhZSFkhcxhyOg51GLYPPfJapaHAgkOko4prTEhBmN
         s1H8Y7ps5Qqb2vanWb2JdIbot25WcpCKIp1zQP8rpvppFS9kCLFJ9gVLQUNCK/iIQcLw
         +h1pKYqO9/h6EanwMYi555NRdtokRVWr93WRdQdF9XLBKH4vbwB3WK45WF/VvSI95Pd3
         a2Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqMpk7zrbjxHa5h416TTLBSqYBAnW4B8wRD3I0XS2BtkxHF0U+TeStNJLTrxeEY80SiLEInfFKRHGE5jF+WtbzBYg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nZPCKicVafrfL/5M9bJCnQOEvZt8dtEreAgNyCYpXpjdjlqVyq
	njhgC2LLUi080UrWdShzGh/6izPxzjjm0pnLylzLwsarH7KSgxxZVIu+HJu32kNYetE=
X-Gm-Gg: AR+sD10yN2U/9KwXlDNGu7JRlwR0D2R94IsZ6trAXlksEugBS8j+rKNKHGRjeyk+rxq
	yQBIzoTHBdTSbpVbw9Am3ArPfwxhDyXDx6QFzEozvbmxS5GskclkrmO7bXerPtISx7BSe5GnGn0
	PBsGWE/Iek5MEZgo3/xH1QkPRRNnnb4ntPuugQW8EX/+DTiCu8J0dlymRQQArN6fuE+HYwPxV63
	v/UihA+ZzFZkLVmH4FMcOmoxyGgUoaQ+lmoqPxXgCD8NR+B9OV5rWTKpPqygxe4oUbjqyewV263
	uajPjr4fHVADW2BjCcU7nG4JVE5fpiL9ybE3ZJ0Vpghj5iBdcWZ2lVzqORsWiNRkUmmS2niN2bj
	hvnKuuHuGkuGhFYKiz1lne2AmTzpSHQo7NjtesYiAXaD9vFEQ5931L/Wa46JRjirhsnyQ1gYT1r
	YIVg7TlZ7Dxxn+ekBziG45z+yDw4unl704sdgr3HEPqTvmlvRTa9u4V4lwEOFn/6uUkaeDyxebm
	hBKspeBoZSeJ+6EjDd3gB9OGz8aIpf7UelQVTUi7jcVTXLD
X-Received: by 2002:a05:6000:4811:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-482c0b4ef34mr47236148f8f.9.1787647414604;
        Tue, 25 Aug 2026 01:43:34 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0869bsm11054745f8f.25.2026.08.25.01.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:43:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 10:43:33 +0200
Message-Id: <DKXW4CIOR10C.2WL3O0DP768DB@smile.fr>
Subject: Re: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <amaury.couderc@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706132712.51931-1-amaury.couderc@est.tech>
 <DK2VN8KB0RQM.2Q9LKRBCIRRGZ@smile.fr>
In-Reply-To: <DK2VN8KB0RQM.2Q9LKRBCIRRGZ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244210

On Sun Jul 19, 2026 at 11:48 PM CEST, Yoann Congal wrote:
> Hello,
>
> On Mon Jul 6, 2026 at 3:26 PM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
>> From: Amaury Couderc <amaury.couderc@est.tech>
>>
>> CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
>> Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
>> An attacker can craft XML input that forces O(n=C2=B2) hash collisions i=
n
>> libexpat's internal name dictionary, causing excessive CPU consumption.
>>
>> The previous mitigation seeded libexpat's hash function with only 4
>> bytes of entropy, which is insufficient against a determined attacker.
>> This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
>> providing a full 16-byte secret. Older expat versions fall back
>> gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
>>
>> Backport patch to fix CVE-2026-7210.
>> https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>>
>> Upstream fix:
>>   https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442=
fcd495391e4
>>
>> Tested with ptest:
>> Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
>> After: PASSED: 40020, FAILED: 0, SKIPPED: 1882
>>
>> CVE: CVE-2026-7210
>>
>> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> ---
>>
>> NOTE: CVE-2026-7210 full mitigation requires the companion
>>     expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
>>
>> .../python/python3/CVE-2026-7210.patch        | 122 ++++++++++++++++++
>>  .../python/python3_3.12.13.bb                 |   1 +
>>  2 files changed, 123 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.p=
atch
>>
>> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/=
meta/recipes-devtools/python/python3/CVE-2026-7210.patch
>> new file mode 100644
>> index 0000000000..8acf174a0a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
>> @@ -0,0 +1,122 @@
>> +From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
>> +From: Stan Ulbrych <stan@python.org>
>> +Date: Sun, 10 May 2026 18:36:26 +0100
>> +Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
>> + `pyexpat`/`_elementtree` when possible (#149023)
>> +
>> +
>> +CVE: CVE-2026-7210
>> +Upstream-Status: Backport [https://github.com/python/cpython/commit/24b=
8f12544468e4cedf5bfbe25442fcd495391e4]
>> +
>> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> +---
>> + Include/pyexpat.h                                      |  3 +++
>> + Include/pyhash.h                                       |  8 +++++---
>> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
>> + Modules/_elementtree.c                                 |  8 ++++++--
>> + Modules/pyexpat.c                                      | 10 +++++++++-
>> + 5 files changed, 26 insertions(+), 6 deletions(-)
>> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-is=
sue-149018.a9SqWb.rst
>
> The patched files have slighty changed
> Include/internal/pycore_pyhash.h -> Include/pyhash.h
> This time, I could check that nothing important changed but next time
> I'd like a like a little change log about what changed between upstream
> and the imported patch.
>
>> [...]
>> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
>> +index 79492ca5c4f..388473d3855 100644
>> +--- a/Modules/pyexpat.c
>> ++++ b/Modules/pyexpat.c
>> +@@ -1388,7 +1388,10 @@ newxmlparseobject(pyexpat_state *state, const ch=
ar *encoding,
>> +         Py_DECREF(self);
>> +         return NULL;
>> +     }
>> +-#if XML_COMBINED_VERSION >=3D 20100
>> ++#if XML_COMBINED_VERSION >=3D 20800
>> ++    /* This feature was added upstream in libexpat 2.8.0. */
>> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt=
16);
>> ++#elif XML_COMBINED_VERSION >=3D 20100
>> +     /* This feature was added upstream in libexpat 2.1.0. */
>> +     XML_SetHashSalt(self->itself,
>> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
>> +@@ -2257,6 +2260,11 @@ pyexpat_exec(PyObject *mod)
>> + #else
>> +     capi->SetHashSalt =3D NULL;
>> + #endif
>> ++#if XML_COMBINED_VERSION >=3D 20800
>> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
>> ++#else
>> ++    capi->SetHashSalt16Bytes =3D NULL;
>> ++#endif
>> + #if XML_COMBINED_VERSION >=3D 20600
>> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
>> + #else
>
> We did not upgrade expat but patched in the fixing API
> XML_SetHashSalt16Bytes. Can you check we can activate the fixed code
> path with those "#if XML_COMBINED_VERSION >=3D 20800"?
>
> I will hold the patch in the meantime, I really want to avoid a false
> negative in CVE data.

Hello,

Gentle ping for the above

Regards,
--=20
Yoann Congal
Smile ECS


