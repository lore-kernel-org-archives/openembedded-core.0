Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1C3D1268B
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 00:38:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4065.1764722300229498558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 16:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hnWRxQwS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=U0LGyc8r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2IROuJ386068
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 00:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMfOz9V7qKlYSU04mNMIW0hKp/BIij83vFKVXBP6L/o=; b=hnWRxQwSxakQfsu6
	EZlSAq7+XJcZx3LBePkgPCjupTPmqcFDlgWj0D/2k4rgwmljp+taWB0D5Z10bxti
	Of/iEjubCZFyntYhJKvUvVoC8H13djuwFLK+l5V3fnflLOJjWsGF1Kxv8wGRdhGa
	iQp0J7xo7U91WANYI28ysLKW1CEAwz9a+iRgeyvZlYWwH36kQSZVlXSMXqRSQ4xP
	vKYa0HEnGBgq8w0trCdCp4PEmHVAocanAtTCVGxYmFWFbHw2pdZ+Gv86vXjrb6KP
	ACxkHq0544MToJfvbCZ8dnvb3d7MMXD56jv3mY0znsltgMO3e+xEzzpnVsbG2FpL
	WGF15A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db0w3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 00:38:19 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78a82709389so87825217b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 16:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764722298; x=1765327098; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMfOz9V7qKlYSU04mNMIW0hKp/BIij83vFKVXBP6L/o=;
        b=U0LGyc8reMFYwRody0Yi0wT5Vj24734AagFgKqvS8m8UMmDOWPGcWM1iNQCqU5Wzwl
         0PGAo8dKdglVh99IgMjKFT7n7PWc8Ki+hvTrWDl2pVtkIwzuTeZMwlyEBK0sv/hhxn6K
         dh3CehElY25PrNcHE2YIxkM5iuVBtz9SeoUqwe5g2gKtU9Tx+YV9wIZ+rftvas3lFzdr
         KTyFFkQozTtcYOGFUhvHpE1fYjHKGEvEXj9sUwL0+aNv+dOINKdx3pqZ0dz2kg2SEQaI
         13BgyzMFmEA0GKMt5oPOGwkFat65pYqwJjGChqdSvyFVEMZPgK9Zt3QaD9yeXSK+BePE
         OXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764722298; x=1765327098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMfOz9V7qKlYSU04mNMIW0hKp/BIij83vFKVXBP6L/o=;
        b=XyUVP2QosuP3D8nrHI6GFMU6ljbZa7aMUbFGR0Gps0pkwxqmIE8wqJAFLySDCQS0Iz
         9qR/wYObr8ITBwHVubhWPEHRJkZ5IYG8neHNAmBvd79MY+dNHxspidp+HaN1D87/DMC3
         67vrvi8j+84yigSAETmC8k8dJjxCyI7Opu1LPfMBG6H59HaUKD48M0MZ9a78KfAXnP8I
         xqnHxObT6SS2oKO5rT3LKiTrtztRe6Id00l9KXk3xUvfHQVZS9PPOJliEzPVF4ftrwit
         o25MQYw4uilW52SmhcBEPLHcimWDsmQMRxeZyoPqvs6Rlm41eQzu/W2yypAif9V0J8Ox
         RwMw==
X-Gm-Message-State: AOJu0Yxco3ed6KPMcIR4E34RYPTkgLJFZOKxLneG7ocyApiM/ygLDBoX
	TV+VQpT7kRKp9o5BQm0qudOxxghvLLhgzoux1dp4wzpyCdxSE6XbChifjqL15qtTe9cLzbqFGMO
	GEHIL5dGo0KRxa7jsvNpl90hn+0P8goDU63v6z+OqMpz6EgIpINXtCmKE+ml1KM5mxX27+/nErn
	cwy4ciKRd3r3WroRnGUAUUPyROjUFmN3kCfGgU0uSlSoT6MLvzWgzPLazQ1g==
X-Gm-Gg: ASbGncvA58efT6bAhNmNHsB1Z6RvNnLOetSJalF1DSVVf371DUXaZV9jAFJNsGFqM2X
	FHb3mc/t9AOZFpYI4Ujj8bgcFx6GlGUjdWIUslj8SQ5Q2urPp+KVNJf3jWZ5BvarBhnqHzC7g6Z
	KVBHsi59nTi0itsnKfadUsGem906YiU+F2PKH14bq0m0oA9QbJgKl6kBRN3lUZP4gc6MpK
X-Received: by 2002:a05:690c:3393:b0:786:379a:51e7 with SMTP id 00721157ae682-78c0bf4151fmr4691587b3.16.1764722298557;
        Tue, 02 Dec 2025 16:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErOHHTp5YX0LW0mPnAle1jWRYZYHJHb7yoKhtfXLTelXZdPL/7nSNlFyknAIolIwka9xMw7q5faIVQLfyKGlc=
X-Received: by 2002:a05:690c:3393:b0:786:379a:51e7 with SMTP id
 00721157ae682-78c0bf4151fmr4691427b3.16.1764722298090; Tue, 02 Dec 2025
 16:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20251011095022.950420-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251011095022.950420-1-kavinaya@qti.qualcomm.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 21:37:40 -0300
X-Gm-Features: AWmQ_bm5TkE0EfSfjqPkbKBrtBJV9dT5trlNANsL1ru1gNItQXzJywUnpa6H62Q
Message-ID: <CAA_5youd+pUGbUN0uFJgM7OBBaFYf_OoQXRCn9Dq2usB+e5NHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: allow passing additional
 options to uboot-mkimage
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DAPqR-sQfZkmaJmcc3pp09UNgzZfjf_7
X-Proofpoint-GUID: DAPqR-sQfZkmaJmcc3pp09UNgzZfjf_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAwMiBTYWx0ZWRfX6PRgF92hEFle
 exfD/mRvAyVQVHXexwCcXx8Nir4gdshTYvuDiIF1sXVd9afokYSJwAE/Ju4vVpIPTDPPgHqcqec
 uIJbv/mb47vy7YcqXa8ZBZ7VWL/28v0lnbr8t4XggV3gjJ8Rr54E6APvVFd0wCPQ0695g20xRtQ
 +yxlhYOkSjpsa/Gpypag8PYhiwF0Uuc0rGP9hcmNNG37lyQYZlAclqH4YHU9KdGGd3Bk+b+gE/u
 zn2K+NW/sGlW01KynVWOKsQnMmeAz6zNG+olOOgbgfTziwtk9hwuCbgydA9sH4UhskC0KDHBsWV
 9RctWK/hDF0VfXEyoZS44NOkXMMflvRIdk7tcAkEH8mfXtAL+roYST3FhwxAC/XQWWfgKLMlTT9
 QEDL3LSpo8+dhFSfdOAqx8FJaRCpfw==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=692f867b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=kX3kcMMahlKCl4ZqV48A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 00:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227196

On Sat, Oct 11, 2025 at 6:50=E2=80=AFAM Kavinaya S via lists.openembedded.o=
rg
<kavinaya=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> The uboot-mkimage supports various cmdline options such as -B, -E, -t, et=
c.
> which can be useful for customizing the behavior of FIT image generation.
> Allow passing these additional options to uboot-mkimage to provide
> flexibility for platforms that require specific mkimage flags.
>
> To pass these extra options, define the variable UBOOT_MKIMAGE_EXTRA_OPTS
> in your machine or local configuration. If this variable is not set,
> the default behavior remains unchanged.
>
> Example:
> UBOOT_MKIMAGE_EXTRA_OPTS =3D "-B 0x00001000 -E"
> will result in the mkimage command being invoked as:
> `mkimage -B 0x00001000 -E -f fitImage.its fitImage.itb`

This explains how to use it, but can you explain why you need to
customize the mkimage process for generating fitimage?

Thanks,

Ricards

