Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4ADC61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:49:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17459.1787647769110626774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I0Iw9FrS;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so24467675e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787647767; x=1788252567; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3upxA0uJoO8mXy0xH4FXBcA9dCtsU3/xFoi4+9lhnmI=;
        b=I0Iw9FrSKVJ615V4ZexQ8dctPWhs4o08TpEokxXN71PYQZENpKbur944aT1n/XbsHu
         aShxe0mGVqyzYxcU4W/avt/4VCE7cmo+q4sGW/D12XIMNTJX51C3QZ9uTvVeyftdS1Yn
         FUJk+BYF7C24r3VLBCkunmSa7XCG/YyQKf+TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647767; x=1788252567;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3upxA0uJoO8mXy0xH4FXBcA9dCtsU3/xFoi4+9lhnmI=;
        b=eDLQfroDlA1saX34mO6VeuxvFikOaOhEwZ51gUGMN/l4rJa0MECjbfZQd0ojcfng89
         4YFwPC/1wsWw33AxzFO7IrB/f4R7HAGRajdb6D7/t0quvknKWitSIRRdTlrxh6JinVNd
         o9TR27AXGbb43131Y2PpfDnE8Hd1QFtgEkTQ8t/yqaRlPgRSmc8RM+SnJGlPyRIuMcbS
         7tsGjOZQOH62TL5XruwDdCkOU7qP7UDPXJkzeA1FLymHyIH9Z3M9Slfv2UCMtpVtXVXL
         i0w4VeiB7FF3vK9Rvg+korYBnYKXpH0nxYEHdek0YS/Q3/ZFSjKmIgweCyONLub9T9AA
         22VQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6SEOhqJtIAT6eMoSdo4oMOphClvFf5TbUMjAT7lNKdWmJrIENwE3KXxtSEBJ8nD2mdc4/Y7Qerv8GfLp/ltQbTw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kLzndlDMfH91sOgtVetzkfF7NM9TSPfVhcLv+y40ZWoFL8n7OJ
	O55OawlVGgu1L7VL2GvycQRSaX71bpnAHMIwdX7cFSVWtRRXjbjCFHmWeZ8zAmEh010=
X-Gm-Gg: AR+sD13MynN5ciha6rqe6fAsD8ERijp3fdN+pvNhc0J3OmxZfi+aqXHDBZ8+nGXD5Ob
	MEejdUdHUasR9pX+T3j0e02YwjKdMhbLXzWobyqCGhlEFHVtM0lQu5kOB1ygav4AqmUDslcBlIr
	98ULnFiukTqSxZJQ8UE4FGXnMTWWvSSPIbdqW4eFo6s3CMuCsrdl+UaNfKbrCGm/pSsG/DUwbas
	gkf69TJWQDKjuc+HGdwzH1ohPYEzrxm4aMM9AbaqhHLSO35xEWKUrOf62wDFhTZBqodhuY66UgR
	Y+H6gHr/1FSHBuBL6KofU+3MLoShObpNHrlfV3cnHtl4sJupYtutF1Vjs2tczFfpjjEbtJoeJMr
	zIhR05JvmzEp0Xaim7fpyjKNF+TrFdEL2ISMiqn5z6Im6BMHhErzMqiFVd/tSI1grAdl3KY0cFu
	NXzxMlITjoB34ncgcvU9fyLiUFyg88fHSlYfx+lkBltFFTiMb0TpL/UmcOTp8GGDIqNh23gRiDO
	Zp0eOoICiZLLdmMCYX1YB0c/tvGYV5EssI5J5KiT84di4Ad
X-Received: by 2002:a05:600c:34c6:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-499c19cbbd7mr290304935e9.12.1787647767249;
        Tue, 25 Aug 2026 01:49:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d6350331sm22013365e9.6.2026.08.25.01.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:49:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 10:49:26 +0200
Message-Id: <DKXW8UOQZO4F.2HWCHAX1B3QG5@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <asparmar@cisco.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260724043914.4061351-1-asparmar@cisco.com>
 <DKA8MSUA8QRC.3P1RM7SCLTGG4@smile.fr>
 <PH0PR11MB59020D843247D3B789DCE7E7CFCA2@PH0PR11MB5902.namprd11.prod.outlook.com> <DKAZFDFRUHBF.2SVVF2X00US95@smile.fr>
In-Reply-To: <DKAZFDFRUHBF.2SVVF2X00US95@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244211

On Wed Jul 29, 2026 at 12:27 PM CEST, Yoann Congal wrote:
> On Wed Jul 29, 2026 at 8:33 AM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> Hello Yoann,
>>
>> Thanks for reporting this.
>>
>> I tested the complete rsync series in a clean Debian 11 environment. The
>> rsync-native build passed all 157 tasks without sstate reuse.
>>
>> This differs from the Scarthgap issue. Wrynose already includes the upst=
ream
>> openat2 portability fix as CVE-2026-43619_p6.patch, including the
>> configure-time checks for <linux/openat2.h> and SYS_openat2.
>>
>> The reported Wrynose failure instead occurs during the compiler sanity c=
heck,
>> where the linker rejects the unsupported --no-rosegment option:
>>
>> /usr/bin/ld: unrecognized option '--no-rosegment'
>>
>> This appears to come from stale or mismatched hosttools/ld state rather =
than
>> the rsync patches.
>>
>> Could you retry after regenerating hosttools/ld?
>
> You are right, it does build, sorry (my hosttools/ld was not
> up-to-date).
>
> FYI, even if the patch build and passes tests, there are questions in
> the Yocto community on how to handle these large CVE patches that AI
> tend to generate. This was discussed at yesterday's "weekly engineering
> sync" meeting:
> https://www.yoctoproject.org/community/get-involved/#virtual-meetings
>
> The main points that were raised:
> * The patches size prevent us from reviewing it realistically: A usual
>   (for us) CVE patch is a few lines long. Those are a few thousand!
>   We (as in the Yocto community) might have to decide if we'd rather
>   have a CVE fixed at the risk of stability or ensure stability at the
>   cost of having a few CVEs unfixed.
> * The patches size force to backport a lot of dependant changes to
>   handle backport conflicts until a point where we backport most of the
>   development branch. And then, what is a point of the stable policy?
>
> So, I'll put these patches (wrynose&scarthgap) on hold for now.until we
> reach a consensus/decision.

Hello,

I'm sorry but we ultimately decided to reject this series. See the
updated doc[0][1] for rational:
> Patches submitted for a stable branch need to be isolated changes that
> are human readable and understandable. Fixes for CVEs or other issues
> which have a high complexity, consist of a large number of commits
> and/or a large numbers of changed lines are unlikely to be accepted due
> to the difficulty they cause with maintainability and scalability.

[0]: 4 Contributing Changes to a Component =E2=80=94 The Yocto Project =C2=
=AE dev documentation
     https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.htm=
l#submitting-changes-to-stable-release-branches
[1]: contributor-guide: Note patch complexity requirements for stable branc=
hes - yocto-docs - Versioned project documentation
     https://git.yoctoproject.org/yocto-docs/commit/?id=3D33bf0ff80df6be2aa=
d8eb081752648d3c408a54b

Regards,
>
> Regards,
>
>>
>> Regards,
>> Ashish
>> ________________________________
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: 28 July 2026 18:57
>> To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cis=
co) <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openemb=
edded-core@lists.openembedded.org>
>> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
>> Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
>>
>> On Fri Jul 24, 2026 at 6:39 AM CEST, Ashishkumar Parmar X (asparmar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>>
>>> This patch backports the upstream rsync v3.4.3 security fix train for
>>> CVE-2026-29518. The direct CVE fixes are [3] and [4]:
>>>
>>> - [3] enables secure_relative_open() for daemon modules running with
>>>   "use chroot =3D no", closing the receiver-side basis-file TOCTOU.
>>> - [4] routes the sender read path through secure_relative_open() from
>>>   the trusted module root, closing the matching sender-side TOCTOU.
>>>
>>> This patch also carries [1] and [2] from the same upstream v3.4.3
>>> security/update train. These are supporting secure_relative_open()
>>> changes, not standalone direct CVE fixes: [1] uses Linux
>>> openat2(RESOLVE_BENEATH) to preserve the same confinement while allowin=
g
>>> legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
>>> equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
>>> rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
>>> before the direct CVE-2026-29518 commits.
>>>
>>> The upstream fixed release is referenced in [5], and the public CVE
>>> record is referenced in [6]. Individual backported commit links are
>>> also recorded in the embedded patch headers.
>>>
>>> [1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d1=
8fe2fd6cd79adef8a1
>>> [2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707=
ec8b829524c3809a43
>>> [3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a56=
9faa60216582fb6c5d
>>> [4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba0=
50337ef32092f2894c
>>> [5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
>>> [6] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>>
>>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>>> ---
>>> Changes in v2:
>>> - No changes made; rebase only.
>>>
>>>  .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
>>>  .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
>>>  .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
>>>  .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
>>>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
>>>  5 files changed, 893 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1=
.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2=
.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3=
.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4=
.patch
>>
>> Hello,
>>
>> This series caused a build issue.
>> See: https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoan=
n.congal@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


