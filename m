Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD861F34C44
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:51:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270494.1776081083115185491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BO8A4OkU;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso35025955e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 04:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776081081; cv=none;
        d=google.com; s=arc-20240605;
        b=hcYeDoRfN36k5mBgDSxMhYIROLxlHFfEAaX61GCAYQ+sjDSz2q3mp+myFJucuHGPuX
         PXrIzxS4OMLA7EetoRY3TISBGSNFBJ0TVrI7KivatwswIuAUdZ009PgTRRkYz5FAdj/N
         6LyaQCEc6Jcin6DlTTBxi+UIXyfHZ/gsVceyB0w37isG589+HRZbZupNZL/9sI/gmpRU
         8aSMndxecB6ezRZoVOB157zAwv/FiAwRrAIxwpx0083SQfiC8FGJeUQksXHhR7VlK/l+
         nv83JJuQfWa6BkL3HTNaK92elQ68xjkE0SD2B/etTlTPwSfnEIXpHFtb+nMrghD2HNSS
         IsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=709vQn2mOUZyXIN6A/+VWC8no33+0ShCBF1bG9ezoK0=;
        fh=iAGVe4HNv0uXKS/1nGwUDoA4x9G50oO+Bw97EqEnttc=;
        b=F2nfz/uAkf6U6PIkXsP9+rL3nz9MYWGA5Dg5xCSC4DBPunwJ/QUa6SKWnBg9u4ZqxX
         sMcstOIsHtUpZAb7EkuwJMfKvZxBbxQTKbfTqxS04+Zru0rytErTNAPoUUn0mbsI+xKw
         /I8J8SR/aT8J6hBR5Psb6iKcFfgyqTCxixEOvkdKth2RJoF5yB8l67VAVhjmyrBk0WGK
         87Jo7ymn2YFq7Mh0692una1vkIDhoV9NqdyqRju9Orlr3GG38okwbb4JX39g5Ym5ETCS
         H0DRdaplAyMgC/VD2YfVqtkuYQWQejDN0wRb5Jqsg18jFkGkqW3ED+XJ/2UcQYeUipeG
         /0Xg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776081081; x=1776685881; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=709vQn2mOUZyXIN6A/+VWC8no33+0ShCBF1bG9ezoK0=;
        b=BO8A4OkU1tZcvt6nxLsGIqUKTfGpAgwR4KW7btr1PcrWNhI3vkFnfEc15f+doRpkg0
         p9IiMl7c2SJoBy90Q4S1N38osV7x5dFJCWCi8Jk4iAJCYqaV48w0YsRKVIOkmbiqTBJ0
         h+JJWcbwEoZB078NUl8z296w3J+Lr/Wl5Ih8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776081081; x=1776685881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=709vQn2mOUZyXIN6A/+VWC8no33+0ShCBF1bG9ezoK0=;
        b=rg62TU4eZsxv8waO3QScFyJvVwywTjqejJ7pLA8+C5WK95D3zUdrOQtz0eqj64iw+F
         6jGdrU7eGZwLcWze58Yrnz26B0guT8JwcuHY3OQAIMWNWBTO/4uMcx4P+liyAVdvfn/E
         PFmcBZnD8G/rOM3V7MsWfb7FcvLfBaFS72/jzPmMUg+4Wg3IhQzYCXsGMpvgQdbfH4iI
         x5KK9PX+J3KUWegMRTXY4pNPQwbRNjldii6abhx1Gs/UCY9xrJImM8EXPn9tdrZX20P1
         him0rksd10g7HgRGZsVfEusRb7dC2ZtzkSvndFf0UybFG1jTzyK1Z2/sxPwHCDfVi36G
         Ovsg==
X-Gm-Message-State: AOJu0YxsEEXt4oztKAUzdMRmEfhucelis+/TOJiOHzjIzaQbTeE58kez
	AyXzwOR0GFPusdVpzERZjT9mYoEP25a6SAHqtQRZru7HlTSQRzKS1VLlhaXaUIOdoxuM16TxX0T
	d0zxSyPG8y9i1g6V83j9HS9q9hAWd/xn3x1eVZpwODA==
X-Gm-Gg: AeBDiesjhJNYRY2dhpEJU/2s14P/DwtHNKZG0VdhNG0x9UFyNBdji/r0s5gBppK39FF
	v36XrnMEaWRslUV3fvtWW175MKTyMhcWxkaQf/CgNh3oUuYI+Lcsnm5kSjFKskOgegU727A5jI4
	/2YAOHnyjeqzdftRXihApsCKZyFR2m+x7rLzZLoDuqPP5xRqOMJnxtyNdfMC5RlfNBUG14vpEiY
	4Il4ONxzLPZFNQl2r0mMJERSfrDakeRoLz7hzwqiyjAULOT4Do2GNVpgH7QX2UBzvvbCaxG56WU
	3aQTz41aCPwpu2I0HE4TQuXGwgkTV6As6VYrtpEvVpo/D94v2ks=
X-Received: by 2002:a05:600c:8883:b0:488:9e54:94c8 with SMTP id
 5b1f17b1804b1-488d689cf93mr139955435e9.31.1776081081226; Mon, 13 Apr 2026
 04:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260413113708.69695-2-yoann.congal@smile.fr> <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 13 Apr 2026 13:50:55 +0200
X-Gm-Features: AQROBzAjQS27YJDsUaMvOdtVb8IbQouPouvgOb-LTrcC0-HNapOIGRirhdMdlQA
Message-ID: <CAMSfU+54dn_fucg6U+8QaqSoqE5ZZ1DbOO8+VowcXYKD8+r6Pg@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07 2026
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: OE-Core ML <openembedded-core@lists.openembedded.org>, 
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f06ec6064f5619d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235106

--000000000000f06ec6064f5619d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 13 avr. 2026 =C3=A0 13:42, Marko, Peter <Peter.Marko@siemens.com> a
=C3=A9crit :

> This is a report with old cve-check, so old master branch hash.
>

Actually this is master but with the cve-check class removal reverted.
I need to port this process to sbom-cve-check but I lack the
bandwidth right now (hence the shortcut).

The new sbom-cve-check more than triples reported CVEs.
> Especially kernel jumps from 12 to 110 open CVEs.
>
> I'm slowly digging trough the new false positives and will send first
> batch today...
>

Awesome, thank you!


>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Yoann Congal via
> > lists.openembedded.org
> > Sent: Monday, April 13, 2026 1:37 PM
> > To: OE-Core ML <openembedded-core@lists.openembedded.org>; Yocto
> Security
> > ML <yocto-security@lists.yoctoproject.org>
> > Subject: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:0=
7
> 2026
> >
> > Branch: master
> >
> > New this week: 4 CVEs
> > CVE-2008-6713 (CVSS3: N/A): wic:wic-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
> > CVE-2026-35093 (CVSS3: N/A): libinput
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
> > CVE-2026-35094 (CVSS3: N/A): libinput
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
> > CVE-2026-4046 (CVSS3: N/A): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
> >
> > Removed this week: 13 CVEs
> > CVE-2025-69650 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69650 *
> > CVE-2025-69651 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69651 *
> > CVE-2026-2920 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2920 *
> > CVE-2026-2921 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2921 *
> > CVE-2026-2922 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2922 *
> > CVE-2026-2923 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2923 *
> > CVE-2026-3081 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3081 *
> > CVE-2026-3082 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3082 *
> > CVE-2026-3083 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3083 *
> > CVE-2026-3084 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3084 *
> > CVE-2026-3085 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3085 *
> > CVE-2026-3086 (CVSS3: N/A): gstreamer1.0
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3086 *
> > CVE-2026-33412 (CVSS3: N/A): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33412 *
> >
> > Full list:  Found 44 unpatched CVEs
> > CVE-2008-6713 (CVSS3: N/A): wic:wic-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
> > CVE-2019-14899 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> > CVE-2021-3714 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> > CVE-2021-3864 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> > CVE-2022-0400 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> > CVE-2022-1247 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> > CVE-2022-4543 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> > CVE-2023-3397 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> > CVE-2023-3640 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> > CVE-2023-4010 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> > CVE-2023-6238 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> > CVE-2023-6240 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> > CVE-2024-50613 (CVSS3: N/A): libsndfile1
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> > CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
> > CVE-2025-12801 (CVSS3: N/A): nfs-utils
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-12801 *
> > CVE-2025-52194 (CVSS3: N/A): libsndfile1
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-52194 *
> > CVE-2025-59529 (CVSS3: N/A): avahi
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-59529 *
> > CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61662 *
> > CVE-2025-69649 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69649 *
> > CVE-2025-69652 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69652 *
> > CVE-2025-69693 (CVSS3: N/A): ffmpeg
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69693 *
> > CVE-2025-71074 (CVSS3: N/A): linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71074 *
> > CVE-2026-1467 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1467 *
> > CVE-2026-1536 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1536 *
> > CVE-2026-1539 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1539 *
> > CVE-2026-1801 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1801 *
> > CVE-2026-2443 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2443 *
> > CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
> > CVE-2026-3099 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3099 *
> > CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33416 *
> > CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33636 *
> > CVE-2026-3441 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3=
441
> *
> > CVE-2026-3442 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3=
442
> *
> > CVE-2026-34714 (CVSS3: N/A): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34714 *
> > CVE-2026-35093 (CVSS3: N/A): libinput
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
> > CVE-2026-35094 (CVSS3: N/A): libinput
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
> > CVE-2026-35414 (CVSS3: N/A): openssh
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35414 *
> > CVE-2026-3632 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3632 *
> > CVE-2026-3633 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3633 *
> > CVE-2026-3634 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3634 *
> > CVE-2026-4046 (CVSS3: N/A): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
> > CVE-2026-4271 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4271 *
> > CVE-2026-4647 (CVSS3: N/A):
> binutils:binutils-cross-x86_64:binutils-native:binutils-
> > testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4=
647
> *
> > CVE-2026-5119 (CVSS3: N/A): libsoup
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5119 *
> >
> > Summary of CVE counts by recipe:
> >   linux-yocto: 12
> >   libsoup: 11
> >   binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 5
> >   libinput: 2
> >   libpng:libpng-native: 2
> >   libsndfile1: 2
> >   avahi: 1
> >   ffmpeg: 1
> >   glibc: 1
> >   grub:grub-efi:grub-native: 1
> >   nfs-utils: 1
> >   openssh: 1
> >   python3-requests:python3-requests-native: 1
> >   qemu:qemu-native:qemu-system-native: 1
> >   vim: 1
> >   wic:wic-native: 1
> >
> > For further information see:
> https://valkyrie.yocto.io/pub/non-release/patchmetrics/
>


--=20
Yoann Congal
Smile ECS

--000000000000f06ec6064f5619d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 13 avr. 2026 =C3=A0=C2=A013:=
42, Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko=
@siemens.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gma=
il_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This =
is a report with old cve-check, so old master branch hash.<br></blockquote>=
<div>=C2=A0</div><div>Actually this is master but with the=C2=A0cve-check c=
lass removal reverted.</div><div>I need to port this process to sbom-cve-ch=
eck but I lack the bandwidth=C2=A0right now (hence the shortcut).<br><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">The new sbom-cve-chec=
k more than triples reported CVEs.<br>
Especially kernel jumps from 12 to 110 open CVEs.<br>
<br>
I&#39;m slowly digging trough the new false positives and will send first b=
atch today...<br></blockquote><div><br></div><div>Awesome, thank you!</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Yoann Congal via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Monday, April 13, 2026 1:37 PM<br>
&gt; To: OE-Core ML &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
; Yocto Security<br>
&gt; ML &lt;<a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=
=3D"_blank">yocto-security@lists.yoctoproject.org</a>&gt;<br>
&gt; Subject: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:=
07 2026<br>
&gt; <br>
&gt; Branch: master<br>
&gt; <br>
&gt; New this week: 4 CVEs<br>
&gt; CVE-2008-6713 (CVSS3: N/A): wic:wic-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008=
-6713" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2008-6713</a> *<br>
&gt; CVE-2026-35093 (CVSS3: N/A): libinput<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-35093" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-35093</a> *<br>
&gt; CVE-2026-35094 (CVSS3: N/A): libinput<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-35094" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-35094</a> *<br>
&gt; CVE-2026-4046 (CVSS3: N/A): glibc<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-4046" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-4046</a> *<br>
&gt; <br>
&gt; Removed this week: 13 CVEs<br>
&gt; CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-n=
ative:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2025-69650" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2025-69650</a> *<br>
&gt; CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-n=
ative:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2025-69651" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2025-69651</a> *<br>
&gt; CVE-2026-2920 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-2920" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-2920</a> *<br>
&gt; CVE-2026-2921 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-2921" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-2921</a> *<br>
&gt; CVE-2026-2922 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-2922" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-2922</a> *<br>
&gt; CVE-2026-2923 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-2923" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-2923</a> *<br>
&gt; CVE-2026-3081 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3081" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3081</a> *<br>
&gt; CVE-2026-3082 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3082" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3082</a> *<br>
&gt; CVE-2026-3083 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3083" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3083</a> *<br>
&gt; CVE-2026-3084 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3084" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3084</a> *<br>
&gt; CVE-2026-3085 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3085" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3085</a> *<br>
&gt; CVE-2026-3086 (CVSS3: N/A): gstreamer1.0<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3086" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3086</a> *<br>
&gt; CVE-2026-33412 (CVSS3: N/A): vim<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-33412" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-33412</a> *<br>
&gt; <br>
&gt; Full list:=C2=A0 Found 44 unpatched CVEs<br>
&gt; CVE-2008-6713 (CVSS3: N/A): wic:wic-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008=
-6713" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2008-6713</a> *<br>
&gt; CVE-2019-14899 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019=
-14899" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2019-14899</a> *<br>
&gt; CVE-2021-3714 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021=
-3714" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2021-3714</a> *<br>
&gt; CVE-2021-3864 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021=
-3864" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2021-3864</a> *<br>
&gt; CVE-2022-0400 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022=
-0400" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-0400</a> *<br>
&gt; CVE-2022-1247 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022=
-1247" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-1247</a> *<br>
&gt; CVE-2022-4543 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022=
-4543" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2022-4543</a> *<br>
&gt; CVE-2023-3397 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-3397" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-3397</a> *<br>
&gt; CVE-2023-3640 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-3640" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-3640</a> *<br>
&gt; CVE-2023-4010 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-4010" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-4010</a> *<br>
&gt; CVE-2023-6238 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-6238" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-6238</a> *<br>
&gt; CVE-2023-6240 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023=
-6240" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-6240</a> *<br>
&gt; CVE-2024-50613 (CVSS3: N/A): libsndfile1<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024=
-50613" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2024-50613</a> *<br>
&gt; CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024=
-6519" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2024-6519</a> *<br>
&gt; CVE-2025-12801 (CVSS3: N/A): nfs-utils<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-12801" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-12801</a> *<br>
&gt; CVE-2025-52194 (CVSS3: N/A): libsndfile1<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-52194" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-52194</a> *<br>
&gt; CVE-2025-59529 (CVSS3: N/A): avahi<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-59529" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-59529</a> *<br>
&gt; CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-61662" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-61662</a> *<br>
&gt; CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-n=
ative:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2025-69649" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2025-69649</a> *<br>
&gt; CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-n=
ative:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2025-69652" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2025-69652</a> *<br>
&gt; CVE-2025-69693 (CVSS3: N/A): ffmpeg<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-69693" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-69693</a> *<br>
&gt; CVE-2025-71074 (CVSS3: N/A): linux-yocto<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025=
-71074" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2025-71074</a> *<br>
&gt; CVE-2026-1467 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-1467" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-1467</a> *<br>
&gt; CVE-2026-1536 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-1536" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-1536</a> *<br>
&gt; CVE-2026-1539 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-1539" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-1539</a> *<br>
&gt; CVE-2026-1801 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-1801" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-1801</a> *<br>
&gt; CVE-2026-2443 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-2443" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-2443</a> *<br>
&gt; CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native<=
br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-25645" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-25645</a> *<br>
&gt; CVE-2026-3099 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3099" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3099</a> *<br>
&gt; CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-33416" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-33416</a> *<br>
&gt; CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-33636" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-33636</a> *<br>
&gt; CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-na=
tive:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2026-3441" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2026-3441</a> *<br>
&gt; CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-na=
tive:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2026-3442" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2026-3442</a> *<br>
&gt; CVE-2026-34714 (CVSS3: N/A): vim<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-34714" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-34714</a> *<br>
&gt; CVE-2026-35093 (CVSS3: N/A): libinput<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-35093" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-35093</a> *<br>
&gt; CVE-2026-35094 (CVSS3: N/A): libinput<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-35094" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-35094</a> *<br>
&gt; CVE-2026-35414 (CVSS3: N/A): openssh<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-35414" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2026-35414</a> *<br>
&gt; CVE-2026-3632 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3632" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3632</a> *<br>
&gt; CVE-2026-3633 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3633" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3633</a> *<br>
&gt; CVE-2026-3634 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-3634" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-3634</a> *<br>
&gt; CVE-2026-4046 (CVSS3: N/A): glibc<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-4046" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-4046</a> *<br>
&gt; CVE-2026-4271 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-4271" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-4271</a> *<br>
&gt; CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-na=
tive:binutils-<br>
&gt; testsuite <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2026-4647" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2026-4647</a> *<br>
&gt; CVE-2026-5119 (CVSS3: N/A): libsoup<br>
&gt; <a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026=
-5119" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2026-5119</a> *<br>
&gt; <br>
&gt; Summary of CVE counts by recipe:<br>
&gt;=C2=A0 =C2=A0linux-yocto: 12<br>
&gt;=C2=A0 =C2=A0libsoup: 11<br>
&gt;=C2=A0 =C2=A0binutils:binutils-cross-x86_64:binutils-native:binutils-te=
stsuite: 5<br>
&gt;=C2=A0 =C2=A0libinput: 2<br>
&gt;=C2=A0 =C2=A0libpng:libpng-native: 2<br>
&gt;=C2=A0 =C2=A0libsndfile1: 2<br>
&gt;=C2=A0 =C2=A0avahi: 1<br>
&gt;=C2=A0 =C2=A0ffmpeg: 1<br>
&gt;=C2=A0 =C2=A0glibc: 1<br>
&gt;=C2=A0 =C2=A0grub:grub-efi:grub-native: 1<br>
&gt;=C2=A0 =C2=A0nfs-utils: 1<br>
&gt;=C2=A0 =C2=A0openssh: 1<br>
&gt;=C2=A0 =C2=A0python3-requests:python3-requests-native: 1<br>
&gt;=C2=A0 =C2=A0qemu:qemu-native:qemu-system-native: 1<br>
&gt;=C2=A0 =C2=A0vim: 1<br>
&gt;=C2=A0 =C2=A0wic:wic-native: 1<br>
&gt; <br>
&gt; For further information see: <a href=3D"https://valkyrie.yocto.io/pub/=
non-release/patchmetrics/" rel=3D"noreferrer" target=3D"_blank">https://val=
kyrie.yocto.io/pub/non-release/patchmetrics/</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f06ec6064f5619d3--

