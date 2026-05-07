Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24DDCD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:06:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5007.1778184368212220339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XI8YSYUH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LyhnqdI8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IIpjt1417690
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 20:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6Vccissg2+hxk2nSrBpx0Ivj/ojf/3wU0iG5EA154M=; b=XI8YSYUHLyE5SZdz
	p0I0otI6nagf5eQf1+Xj7q4s3eVR/PjlhywBP0r5e5zJsBDnDyyNT9/BzNT+fFlG
	O5QN6F5Hh+0oCYBUSoI2WpTaAGmshCx1QLDahWcfFB/y7t7uB9xifjyhbdVsA1pC
	r4+nJ7RxPjFGa8hVo0Nw4mjtGbNMN8W7vlxtpZnocy60D0od4/UARIvCLOMpGA1F
	4Mixq97FxzuykD0zVV683Aox07adr//IQPASR3NpLkTZ/hghn+cnAd7Fu6tNbtQr
	RWnqKiQbbt/JR1X/ztW/5BX/YHdGepEZWUEebr36LJwq/DIXEGfv+WmtyoMVPuRK
	VjfNYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhgbfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:06:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so476838a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 13:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778184367; cv=none;
        d=google.com; s=arc-20240605;
        b=a9J0IiqAi9JCUIukpM5H4eoNxrfSRAn1XYOcRMtIeZbJPzpZ/7lha62jVC3hpxaQgi
         yqi+gzsou0G+FTCLKZuwTZprF3tJN9K5JbuaPHP/8ddMGPaLJ3vW3tFywYTOMSDFcegA
         gkG2bLbtGMtFUHrFwcc4Y5tCHMFNYHwWu2KyXGOrXe3NOEjCTa/YbJa8DekuPo9nLZCo
         1hhGVutU++S8bYmTwABYDDCXaetgrC0UN0CI8g2XpvYRVWin6fsviXclWAyPtKxJGe4s
         32201xqFaa+BiP5idSlBjLn3Aem5sI1w9BBuriCVGyR97FV6NCxs+1rqXz7Cd9UO5Phf
         k97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6Vccissg2+hxk2nSrBpx0Ivj/ojf/3wU0iG5EA154M=;
        fh=scPkxuoXGaJ94+a0mnVuLQGwEAoXl2+waCiO0MASMyw=;
        b=UX06Fq8MqDOyTOBnwdSnbmT8VMQgEjKTCN478r9+x5nKaJYSqcUSDEYeWZqybvfJBQ
         ISwwBf/RPorHWJP0z66VD59htznqBhGPeq5dE22MmTexOen4tZ3ZeCK3thVY33+y3jND
         aRUq5sufkZueh/scKMZo8ND8ion0j4OXIdDp6mGDY6g5TI8rJZecRaZSWdY6KPDH8pbZ
         wqr4Xnahsj+QuoJLui9RyKKuECsu0Iq1XubSf//JmHqk214z/fxoPDhN/ybguvKXr9mo
         FXANa734Z9SCMzKxGvqdHdNIkI9HeEpLVnCGebBm9Fv2bobIgxNm6mfoFF5LCKE4lohR
         Luug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778184367; x=1778789167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6Vccissg2+hxk2nSrBpx0Ivj/ojf/3wU0iG5EA154M=;
        b=LyhnqdI8xdtRS0VrUsz4HM/0Tw5LCe/kgiHWdHStWXSt/+GuO2nDorOYBrj90EdtBB
         hT8Qd5Qj1H8M7GK3gWcW2FLXT7TI8maFyACgc8i4Ze9xHlmI3NDsVXfYmwF4GOH+YcBx
         AwMjPcZN7Rwe4T3wzMFzaOpJYu+H1DI5HgnyD5Hk1lYGAoJybG6/aGB7qqJacgTFkKvg
         iZo9XJXlU43CkKPNm5md4PvdDgipTa6zXVkLu0hvOihiev4dRmhzZDreMze+sbxpaBFv
         vJ+1xU1czOiD/pPTL+E3fe5IXZJWXblcbJM0bN5+PhA18tN1Dff6ws46MSLjSP9VJwwE
         Y4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778184367; x=1778789167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6Vccissg2+hxk2nSrBpx0Ivj/ojf/3wU0iG5EA154M=;
        b=lRMIia34ZLKP877W2ElzVzExjy5q7vXUCY8jvNgoMXAiZYOTfTxgcu1HewsX/7I0Rn
         41SMiWwoT/9TFd3zbk+74f/ns+8OopLc/1UEdDHMA7aoJ9Hw7j66lRiqqreABRKo6Wrd
         nBrEXGv0aLIgFZwi8oRpvzqmNiPqPCckJX+8vsn2PxJHEBFk2MwWGL7bxjxIcb/zVu/H
         bk3PQYSEZ7LljLMadNOP1LF12d/NPjprCGgRRCox+TIcvN8mavJG2IuQnlPxA2itiPs/
         CXOECoXL2gMs5CcGjEkGIwaMavOsR+xfHlXYu8/NL+DPfZk70faIDfwiPp8Eg158n+8y
         Yt7Q==
X-Gm-Message-State: AOJu0Yzjlk0j+qC6Sl9+L7BcR9lEZVDUH6cNO7/nyQEcmUt42by+/Y1T
	8RgCJP897tzuhuyBxpyGvQC1BzelwV9BP7AhKPQlEEHUuCgdtVOWIPFr6+ec+YBcvVLIKccO9Iz
	rFo/QbeRX+984D8RC2IzKSWyTZhCZ1R6UzSZTz470163b0Yh1ibQFV+Tjs7olNEn4sweA4vG4Jr
	Mn/MmZg8NBlBRKN4RhJ0W4AYHQJ1znx3KBElg6eO2OVuGD+S3NOA2RhHt29g==
X-Gm-Gg: Acq92OGghhr7VZBhhPYZhyZnjBDcDg+HQLrhygQWHkHDEakyIoYxKnrQ9DsyVyrklKz
	aJhVn1YDUnE53nr1ZG9QU4PnIDgVpfTaHvCtUQ8AX2S9ocT7NDNzWqU1C/9mlLKvHNqy4yA1msB
	pOXpVZwVTgYIUZF6yN/JQ+JrmOjjkRetB6l3w0c7j7CHP2vO/kBFxlmKgG9AIStpwUgaJ+1LeTa
	wjv
X-Received: by 2002:a17:90b:4b8c:b0:366:4a47:f26d with SMTP id 98e67ed59e1d1-3664a47f57amr106029a91.14.1778184366670;
        Thu, 07 May 2026 13:06:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8c:b0:366:4a47:f26d with SMTP id
 98e67ed59e1d1-3664a47f57amr105987a91.14.1778184366075; Thu, 07 May 2026
 13:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Thu, 7 May 2026 17:05:29 -0300
X-Gm-Features: AVHnY4K6IGJVPQ4twgJh1r5BMcoNfhv8nwU40HT7fva_ikXnjgGdXL2YrIaXMgo
Message-ID: <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
        quentin.schulz@cherry.de, marek.vasut@mailbox.org, festevam@gmail.com,
        khem.raj@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fcf0af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8 a=se8VwwewN4XTrN4cRv8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: sMP8PY2ohBeANeFdFqcP7_J-jzQL1OAT
X-Proofpoint-ORIG-GUID: sMP8PY2ohBeANeFdFqcP7_J-jzQL1OAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwMyBTYWx0ZWRfX/9kVfBvToN4k
 ywNbkq6j9HH4r+ICy5m0awC/NJZvcpoK79KCZryT2NHZ2VrkU/gWpuZfEaXXlRESSSZYtgMojDg
 3nvv108VLOMzPWpkf2BKHLTeX75q4TU+cp53BpaGJcJgfel72Q/DTKqV1xfe/pkbY7+3C+O3+L0
 VxOHv5nb6Q5EW9HC4rPniXp4hkDyH6QT82M+Z90EMp4e6MP/9HlUmd3LACXtRCDVJZGHslNiWDv
 W+z1xmFHU+3scfg8wJQeGp7JmjW88jokA44uzi200AlmqO/dU8DqKwn26LKZsbNT+rby361Z4Xd
 zYqFgRJWB4BUAUE6LdZxjiomg1wwod0qP9cY1rT2XxK/2PoMc09DE3VsSoaeUusbuPPXIK34Wc0
 uaiepwiWI+6Aa9/6qtAezAd04rwDfC71oNtxYBc0V1nJn1K/n8vireOmrUFNHN/tyANLUYCKygO
 bSbACPJ09MlLndnhiEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236617

Hi,

On Wed, Apr 29, 2026 at 3:06=E2=80=AFPM Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I hope this fixes the DTC build issues once and for all!
>
> Changes since v1:
> - The patch was added to SRC_URI_RISCV only, so I replaced it by an appen=
d
>   straight to SRC_URI

It seems v1 was merged instead
(https://git.openembedded.org/openembedded-core/commit/?id=3D5e97f3c1e2cf76=
f8b810da5a8c591eb6e22586f2),
which is causing build failures for non-riscv targets.

Will send a patch to get that fixed.

Thanks,

Ricardo

