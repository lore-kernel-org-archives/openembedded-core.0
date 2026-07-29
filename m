Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CEEC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:27:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8319.1785320864874164921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 03:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gDWPdn5F;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49558ce01afso5270455e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785320863; x=1785925663; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4yhkKk3ad+vt9kCFv2jjx5vtI/qRAwBgw8I4UCRQ4so=;
        b=gDWPdn5FdHPS08eLo92jy2S7z0HmqKwYDTxC18KqiwxBJnW+awdRuZ+CQ+xkBkqtgu
         Krz8oKy9XlrONKZASpzqCqaogUbIbHkt/rSHTmjDcq6OQnpc1419BkVlsGVWEuFxrtbV
         /6MYFa0+PyZKayLubfjLI7ezekCcHo5p8i0hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320863; x=1785925663;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yhkKk3ad+vt9kCFv2jjx5vtI/qRAwBgw8I4UCRQ4so=;
        b=kcBbUH09muU1LEnnquW/F2yjG271D8QRruFwZz01/kld99c/wPcAaeE5KBrndmam8e
         yIL9eDTCbST8H60+OhwFHze94deMo5I9LMas487BNcs4+bn+qv0Lg/wrUludKmRtODjX
         uY4vA7dcc7hYeLuOCaMVyLaLNmB2YbiwuIqhiPeNmkWybI5iR7pWxmQcJkg5v/RhglZT
         G4G8jmNwG0ENzII/CPxM85kfUoF/P/ghunBYMbp+2wBzaDC9U2AlIchQT+/qx7Z2hr63
         SHYINv2j86ey7rvVzcLAcDPJHwh/+ksxPncOQ2TVoh7vo7ZO6YqcECBBgcXkShjfBScN
         goTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGyGm/ODaDyg3JweANtUrrgROy9q9K14lisFTslZgO1G5cFLnUBesEQf99By3zyeKb9etDisguHI4O3S7vNErAow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMvQgD80t2gZmdnpyZqOdNbc7Fcl4kI134B0dfpvfEFzbruY8m
	mcFH2Jy0I/E/FTK4EwQiUZQZbVFH/BxkCqiZDLyI0yMAHVqS/nKz+xM3Rsc7wdOrxVQ=
X-Gm-Gg: AR+sD12vpfZQwxZaNzJJ8UXIBPKymD0fnK2jB9PRoSkxoE5XCZn/9XiEJd+Rle2pKn/
	Bxl9C6PJWeXMsR/YHgDCQ4Xe2ncBPGgnhxj/r9Tp5LRTDHa4ihOtVV15Z9xysdlJ2mr5w0M/9Mv
	NnDvmQY4cW2BtfmMI0+dcRVrf6Yddx0Af3ra8co/pHrUHUSsZ/TqoscMEszQFXzDA+pq76upYpj
	ES9RIk0YmjYMMP7c2S99BMMboiQ3IAcEj25XRP3lP8swgNTzTIZdkO15MfF1HwiMTIeBQmZ5FHL
	JfzRgsZwIlGuAsih9Sf/xruOi3RM9eIIRSwTxZIMWH/JLGWVyrcfDRaCRu8XFfQ9gMe/pvWxXsM
	XSAypRo4XEeIlBtkT4gN/tUw4BoxR0Sult2BNI8xaQI01Eer45+xZeRGr18efEYiPDoAm6S6SqJ
	eL5eFQTM3bBAk47BDtBQ5oZI5mWhAQivSs6VRzuBEMDrziL2JjfJynswR59RpXEpra5FiDNdtJG
	nAXp0OtXXmyDUl9WIIj5SDGvld0ZcTu+jmqTFZNHoraosMeMAhV
X-Received: by 2002:a05:600c:4f86:b0:496:c933:c276 with SMTP id 5b1f17b1804b1-496c933c2afmr54493635e9.25.1785320862845;
        Wed, 29 Jul 2026 03:27:42 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd45fc5sm30293305e9.1.2026.07.29.03.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:27:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 12:27:41 +0200
Message-Id: <DKAZFDFRUHBF.2SVVF2X00US95@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
X-Mailer: aerc 0.20.0
References: <20260724043914.4061351-1-asparmar@cisco.com>
 <DKA8MSUA8QRC.3P1RM7SCLTGG4@smile.fr>
 <PH0PR11MB59020D843247D3B789DCE7E7CFCA2@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB59020D843247D3B789DCE7E7CFCA2@PH0PR11MB5902.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242270

On Wed Jul 29, 2026 at 8:33 AM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hello Yoann,
>
> Thanks for reporting this.
>
> I tested the complete rsync series in a clean Debian 11 environment. The
> rsync-native build passed all 157 tasks without sstate reuse.
>
> This differs from the Scarthgap issue. Wrynose already includes the upstr=
eam
> openat2 portability fix as CVE-2026-43619_p6.patch, including the
> configure-time checks for <linux/openat2.h> and SYS_openat2.
>
> The reported Wrynose failure instead occurs during the compiler sanity ch=
eck,
> where the linker rejects the unsupported --no-rosegment option:
>
> /usr/bin/ld: unrecognized option '--no-rosegment'
>
> This appears to come from stale or mismatched hosttools/ld state rather t=
han
> the rsync patches.
>
> Could you retry after regenerating hosttools/ld?

You are right, it does build, sorry (my hosttools/ld was not
up-to-date).

FYI, even if the patch build and passes tests, there are questions in
the Yocto community on how to handle these large CVE patches that AI
tend to generate. This was discussed at yesterday's "weekly engineering
sync" meeting:
https://www.yoctoproject.org/community/get-involved/#virtual-meetings

The main points that were raised:
* The patches size prevent us from reviewing it realistically: A usual
  (for us) CVE patch is a few lines long. Those are a few thousand!
  We (as in the Yocto community) might have to decide if we'd rather
  have a CVE fixed at the risk of stability or ensure stability at the
  cost of having a few CVEs unfixed.
* The patches size force to backport a lot of dependant changes to
  handle backport conflicts until a point where we backport most of the
  development branch. And then, what is a point of the stable policy?

So, I'll put these patches (wrynose&scarthgap) on hold for now.until we
reach a consensus/decision.

Regards,

>
> Regards,
> Ashish
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 28 July 2026 18:57
> To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembe=
dded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
>
> On Fri Jul 24, 2026 at 6:39 AM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> This patch backports the upstream rsync v3.4.3 security fix train for
>> CVE-2026-29518. The direct CVE fixes are [3] and [4]:
>>
>> - [3] enables secure_relative_open() for daemon modules running with
>>   "use chroot =3D no", closing the receiver-side basis-file TOCTOU.
>> - [4] routes the sender read path through secure_relative_open() from
>>   the trusted module root, closing the matching sender-side TOCTOU.
>>
>> This patch also carries [1] and [2] from the same upstream v3.4.3
>> security/update train. These are supporting secure_relative_open()
>> changes, not standalone direct CVE fixes: [1] uses Linux
>> openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing
>> legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
>> equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
>> rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
>> before the direct CVE-2026-29518 commits.
>>
>> The upstream fixed release is referenced in [5], and the public CVE
>> record is referenced in [6]. Individual backported commit links are
>> also recorded in the embedded patch headers.
>>
>> [1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18=
fe2fd6cd79adef8a1
>> [2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707e=
c8b829524c3809a43
>> [3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569=
faa60216582fb6c5d
>> [4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba05=
0337ef32092f2894c
>> [5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
>> [6] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>> Changes in v2:
>> - No changes made; rebase only.
>>
>>  .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
>>  .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
>>  .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
>>  .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
>>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
>>  5 files changed, 893 insertions(+)
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.=
patch
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.=
patch
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.=
patch
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.=
patch
>
> Hello,
>
> This series caused a build issue.
> See: https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoann=
.congal@smile.fr/T/#mac8cd24d85cb37cd8fa468a51921ac376e238c7f
>
> Regards,
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


