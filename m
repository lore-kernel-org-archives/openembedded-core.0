Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE30CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 23:44:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2711.1778283875671643979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 16:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oWE0Kw5x;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=anK+KMxe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G55Nx1116855
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 23:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wp7dpmQ9QSQn4JSPUb8l2tta6Yp1J6DujU6hkouuNE8=; b=oWE0Kw5xiRDb6kVb
	pB3Qno4MSMZRiaS2xMVCzzQpgTeCCSVA51YELy/GHaLFyXG5Hw+IUrcl7cEBl0pZ
	Fa19atbkS2lkPhSxC8+BWkpOwy5YceoyLXOk3NOaPKaYpt5y5XF5SqO3Lh7MJNKC
	19aycxKlLgyImo+EzFLTkPmtfZ5AWAnKjdjQwU8bUnfWT+vmGLk/CAruCHtcoBOF
	q7b5/A2lA73rKQ+F/sc6qcJCCtEoy4SzN+QBCEBH1BOAninZnhlHq2iGEZ9T8Bnw
	kfQlBg9WUUghzom7A4tKy3SIieG2AV+7PKv4IopwtT0R7fTxge592pssE3z4UVSV
	848OdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pha8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 23:44:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so10359165ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 16:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778283874; cv=none;
        d=google.com; s=arc-20240605;
        b=Ubzixmvc4wFfzwmFyOVspSctqZp8gIOSyn4aARdZCKp5iKH6SNqQCVPIyWui47ZvNJ
         4Hbj63cZqBTC7UXPux4LR8pcW8rGi8d1Fa5LNOej/uDghV0nAijGEpBwt6ZE9VyyYQ1K
         3eN2imKBFvPcCvU7oka4hBUUtYmsrtA+qpbaC8Pt0rurTGSgwk5kHWbE5OoAEIYD9iLt
         ziK5F9i0EL2E+5C5nhu+xW5UwswJWoMoMvivsI93U2L7lbzwXF5dUmi7ytxJx/5vTVEc
         n80or6BG+0rMqSAKMk8Dew2EGweXhWB53qYWODDRtJB18KkbZHxZxKsdHzze5HLZOJSz
         PcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wp7dpmQ9QSQn4JSPUb8l2tta6Yp1J6DujU6hkouuNE8=;
        fh=fy7ByOhigq/hGRtiahhnFvvsuJytjtj4fstpKvSYlFE=;
        b=LGswawMFqMM2KWfbzXRl5DP9V2nbdB8jaaKGJ6cUIlP4e/o50I3JtBq71zOwmFiHhP
         j180+7YUmlM14ayvTogWWVUcoyAc1Y0plxaWhZivHrtEKeU9N5c8pDNWpQDUiOkVF0Qz
         70nsQGPpl2LruSHAW7775CdNF93mtOfgHU2qcHLGY05xcC1CGEOkiLxemMlDqAeFOBTn
         3bbeyKZdaGbHG0cEHb01Ph7NVtsBqDU94yXIMwcCGZkS4zFcwaWWOhbqfoTa7svA7VYN
         I6A1WGzmrEPFDWorJG1ADJXNkpyJ56HZbsys4a2JJzHBDKswgOxjqs+ooEPGlycqca5L
         cUlg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283874; x=1778888674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp7dpmQ9QSQn4JSPUb8l2tta6Yp1J6DujU6hkouuNE8=;
        b=anK+KMxeaUoqYhbQXUdXIGpDBgr6LdD24IS3jQs0Nnhh01tqUMbqLJV0W7tAFTJog8
         fmnM0gXpLg8dH1wRQp80zyFBjJ6aDY3LsKHrbtH/3vY5E1UMb4ELu0W568gPQrtJV5zX
         foMwFQpI5a3AV96rAS/pxAVrdCcqYIG+73GyDtIR+AidMsCChn4xPnzpKcW5S9RM+JLX
         aBWpZv5y7mdWiNez9RHZCnS8R9WIo63Q6/qaNf0X3MldJZcLMUCSDBeZOpzDcl3uR0vj
         qUvE1DbvCeW/xpU9EvslFKRvkJTsDnuLLd92GZWB/aHDskTcqXdHZMsZmEz4obYtl1K3
         QtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283874; x=1778888674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wp7dpmQ9QSQn4JSPUb8l2tta6Yp1J6DujU6hkouuNE8=;
        b=jg202bzBVc5OvUPAenncRMc2ArvTziuucQc/mN4/jJjkEn2LVU1YvJV3N1sQSKSLyn
         l1YxUrrRHE/g8gwdhajaFviYcMjjajn2v9Xwh4mRKTP5sxouV2ukyyvDsE9Asv/QRZfc
         w9VmcPDg/fp9TPgP7KM7tUAcfiliufV/W+/1pg8zLp/BVFkAkjbYWw4Hd2ltvt2cXCwp
         Pz/f7SeKoKiDFRuAtsy04mRq22xk1yLZz2KsIdtrxM3B3oppXyR9M7cfkVx3NTOlLpK+
         cTaQFyFiUheQNvHic98jm4as3xSNNY2YoMGz4c8IJ2GMeLTKIMoqMMf+IpNXqWL9Qe/o
         ErBA==
X-Forwarded-Encrypted: i=1; AFNElJ8u2sjxbGuRdkNnnMeNSAs9l0OUa5efON7PMX0dwdO8xMsfJOcazDcnPq7xUuzxDnTD34Hwvg8yfmwwi/yif0PExA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOdmrYGozPGsmWKrYTIo3Z1Uc4EhJMaFQJRlPYh3t3Ydg4kIo0
	xyHGCp6LnnHolWzwMQVqI9tgZxAnfT/D9Gb5m0iMb9Z54H2Sf7dfw0pjQ3K6WjRLddQWKDwArhI
	jH1QTCTUNOWithgyFedVeEvtx6z85gisDvVtpkUM50fFdgzhZWmj2SsP2jXOVL0TlR4pKwSW8qj
	k9ycLXaKv6WUGQX3IKaA5GFMuVRksYXW6CEJPEMiOH3r306vXW5bS4aAPcww==
X-Gm-Gg: Acq92OHv1nb0g8qRRD5SojKe6CHjb7fvkm5tWD8MAV80og1VEhTdZvD5eKvua3jKHQ5
	m2z7nwEKOpMFHiPxy6ghi9bU1zwS9D2KmaCgDwzNsCWhsys/M0SyUo047KGd+shkmB6bg+a2IDP
	b/g1xOY7G5OxMZc+0nBK+Y783aMhkLdpQDkBzzMkSFqENepuOuVUqTOr8u34a8hKHCSMZdvzoud
	L6dYDTL
X-Received: by 2002:a17:902:ef11:b0:2ba:60a:3108 with SMTP id d9443c01a7336-2ba79bfcbe3mr145394445ad.34.1778283874395;
        Fri, 08 May 2026 16:44:34 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2ba:60a:3108 with SMTP id
 d9443c01a7336-2ba79bfcbe3mr145394215ad.34.1778283873839; Fri, 08 May 2026
 16:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de> <3e713ce0-bc74-4c5c-873b-d6402f664a79@bootlin.com>
In-Reply-To: <3e713ce0-bc74-4c5c-873b-d6402f664a79@bootlin.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 8 May 2026 20:43:57 -0300
X-Gm-Features: AVHnY4IiXg5cdeBUHQoyfJ-hyR3V62ELlw19gJR6aAuAf7XvGxZom4-KubZHvPg
Message-ID: <CAA_5you_+_3pOhGgC_JP8YvaqRpeqAUXqJDP1dX20YCbe3z90g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: XJEdsjs7TUoGO9NHrTHiTAO0OD7VGiyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzNCBTYWx0ZWRfX7MtPRhEvovPA
 8UMcYw23C/IVL6DoTjcQzxqz4MkXkrygedHJDkql2DsMVhHd1YcuKQovMLWw7agLgJA+Y/dIKVY
 zNQbBmEraAgFxWtDUXnkuaTxWdparWVL9F/NK60qQNBvcC0eVK8YfgDOvzhtzH2EFybeTWEgaPn
 ExC+KKYYAm5EauTDn/QapWKITGWgJzkPY4+iEpdcEoHOmBqQyhp37CCuCzgyF8duOAvej7dDaWv
 gj0guhzJefPMJ7YRWrxpM2CDNgZ/uy0hbmv+4JSQ3QmRB8dh4hy3Z3C1oVvqeDS1TNxVDfZLH6Q
 UONBt89/w6aAtzllW/vwPlPUNhXWmgt4vHOy8vA7BjCn209HAjWuqocVSwCWnMxdGS4V5BnJ1jm
 rAj0qz++lt9zDKbp5L4D+JzwyXfkk7MP/mOuasc4sFTNO5jJ6oBZH65ycU0Qg9Ujxyku9HthZm8
 NUYoFU6JhBvLzx0ZlRw==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe7563 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=ZIE0f7oNPoBCG_HORQAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: XJEdsjs7TUoGO9NHrTHiTAO0OD7VGiyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 23:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236748

On Fri, May 8, 2026 at 7:51=E2=80=AFPM Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
>
> Hello Quentin and Ricardo,
>
> First, thanks @Ricardo for spotting this v1-instead-of-v2 error!
>
> On 5/8/26 16:35, Quentin Schulz via lists.openembedded.org wrote:
> (...)
> >
> > This means any recipe including recipes-bsp/u-boot/u-boot-common.inc
> > will need to override SRC_URI in addition to SRCREV otherwise the patch
> > may not apply.
>
> It's actually a bit harsher than not applying:
>
> ERROR:
> /src/openembedded-core/meta/recipes-bsp/dummy-u-boot/u-boot-foo_2026.04.f=
oo.bb:
> Unable to get checksum for u-boot-foo SRC_URI entry
> 0001-scripts-dtc-drop-yaml-in-DT-validation.patch: file could not be foun=
d
>
> so bitbake halts right away, far before do_patch.
>
> While I agree the v2 was not fully correct, this patch cannot be added
> to .inc files, since they may be required by recipes whose FILESPATH
> list wouldn't include the patch in the first place.

I don't think it correct to import an .inc and later replace SRCREV
without having to also deal with other side effects, and this inc file
is really minimal, mostly to set the common recipe-related variables,
the dependencies and the source rev for both u-boot and u-boot-tools.

We could duplicate these variables per recipe, or create yet another
common file based on the version (as suggested by Quentin), but I
think it is just an overkill.

If you look at how patches were managed here before, they were always
included together with SRCREV, as it is OK to expect both to be
defined together.

Thanks,

Ricardo

