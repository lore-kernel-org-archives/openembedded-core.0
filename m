Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D08ACD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:04:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.372.1778256279275996270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 09:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TuLBfqeX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PEnqWbAu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648D9xVP3891064
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 16:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xfDYjey4m/zMBG9REOUqaSpKdJbdw6XlK0jMohjvcE=; b=TuLBfqeXWRVwMrru
	1YAdL5A8+TEso12IPgJlAc4mukR9ruHpE5L1RuYc7dzo0pXleEsnaheB/6Hmg5PH
	lcxjA576X/OiCVIaPg396A4UW2DrmZ/Rs4BS/IMuP3Ct6Y5BbwVqoSZXLxd9s+Iz
	9eMhseOTBgnbDRe//7eMnjgbRMIwo7mDkqnjA4KbbRIUrIxJIQiF/7pksGcKlKk/
	dG+ZbbOBH6B/HMq2iJVQ0puON6Jg09+GP+eGLTi9wj8E0aaXDu4BK/uYjUKmVaG0
	xh90gCaaHghV4syY1zQqLI+MIt43M+tQE1WTSWKYCmbty1dVYHP34mSusec1NK9Q
	4dZN4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1gfqru9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 16:04:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso24159095ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 09:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778256278; cv=none;
        d=google.com; s=arc-20240605;
        b=Hrz2NfHnvPGGeOqbs3hZNYd4KMwLFz231bfoemjV6dMQvHzmTHk4MCiI0itx3hVzkB
         xRgiFOAchzxesGufhGBYfVPvMCHOIKqMMeP0LiJqRZZgn2bXkVxsLQ8daW8avz33wh4+
         ZE+B8RK3yLNwkT60ZRJjMHKf/18X3lY9bMNVY/fQmUIM4PjI98OVQfOzlum6X2KIjymz
         fDqaV/JGpwIQhhOkTRKFUNy2zOcM/Axlnmu5+yA47G5itFd80m+NRpvbwGbygpqOJotU
         fgCXHQFpnpjiLUwT4SXfR8dHGPT7ibsyFOHAyadZX5HIRBfG22Te+FE7mC68LDh9LCBp
         KHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xfDYjey4m/zMBG9REOUqaSpKdJbdw6XlK0jMohjvcE=;
        fh=bDj0C6K6ljUdXnuZ4dQT3fMpBXg2UKnrLxEaSSWas04=;
        b=eefdB2ahbcPB+lZ+Z3Jkjg6qvyJyYjJEb9/k9oZeZb9JMW3mtUwS2/5pItif08G7KL
         FQ1RTsgX4dGZZdxU1z45QTGvDS7BBAjwtpgDBCWuWaXCfGOOBbFY2yxIdo8uLKSIK0EP
         Ufy5B0K9wpXDPAPAZwGMjji+3DhPIG6UUIZSU1MVXNxBLgDhcYAxCzgo+8WiYP0cpMT3
         dmq8kDzwkXmPTS7w4l0IwVO881LAN1/29Cxe7plOoC8CTgaoHcKigrFmJ60Qh5MNjoDw
         rdRPkNI37CxFZDppuI7WYYQhGi/Xqlcma8Q/PHgZf+J/dloRjsOlecdBuL85v/cvNtGb
         liUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778256278; x=1778861078; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xfDYjey4m/zMBG9REOUqaSpKdJbdw6XlK0jMohjvcE=;
        b=PEnqWbAuGMIhHk+GSVCFlEkUQxUp4PAJpbvg9EZo36UIUdxjCrcse0KL3bAayLYD5o
         kNuZTMSF62+iupwMzsrTuLQigfK918bS5jPfsu2P6otHhitcqRxltn5B+GUra24G/P+Z
         Xfr1DpwywcETRXJIh3jadEqg/jK+cN2QtW1Bs0owPrs974rTbQMWIvXfkcUOWgQYjFOb
         FrvGGbp8U9WTVulKa38tW2RY/pCHUEFoQg8KjTB3qdpPDDJ+M1tkNuywVBkVZjIm9Zf1
         0JAybpWMcbclnoKhMlkXJvHeiQ75jJiZ71OeYEFB38ke2qW2Bp1yYYZcuYZQfU3t7EVL
         /zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778256278; x=1778861078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xfDYjey4m/zMBG9REOUqaSpKdJbdw6XlK0jMohjvcE=;
        b=JxCwm7cP2FR0W1QGaAMTwGOlCTkCoy+ydbRpuVQp2qgbT6VCgbPZu3zszwVuQVR0Os
         gNwaLEZHUkfUBPw8YQESDIkaKefkPIZobnovqxO6xA1dXqZi2Hz7BHeYd8UI3pKcqYIx
         O4Gsy9OfnkR+IOGm3QVAsTWNP0KhB9vSMDXEX11Ch+FoXQxoltODZqCPNppNYbc12dzE
         8AO5PX01m3kZJcLB+ThjCeU/uZualooQZqXliQ/kTYXpJvbvaJB198ZkBJ9yd1PR4MN3
         XcgBNtjybgdL2zbvnpCVgBIvv2TJxMuFOhR6yiiiOKBTSsaWbXzA1OZwrJtKwJHPRr/R
         vkHA==
X-Gm-Message-State: AOJu0YxVjQ0htGabgsqQSnhxUPKY6zIpCwGoveBHnZD+nFrR0YxWNucH
	o76J4b6BpLYISGca60D+EETf/t6pY8eJrR/HaKTTbNfpYe+fRt8nBySbawBaB3N6cCUzt5qBfI7
	TWLxBi051NusXIbimbXFYlhmhFLi+3jaD5zHC0cuyjKKkCaxb5l+S0RhSLomPYiBlbhordrTta8
	sns5H2qkQdpgEkO0pw6d6eKjttArVso4UoL6i7M56ZykfBMWMeMSOHIs5AIg==
X-Gm-Gg: Acq92OGsJg7tDPAzVK0QOenix4H0EnIbA7p1mN/rBXcS3U0Xbeh+zVSV6eTOerONdXJ
	sg8UKNtAiRPf/LdSV+GmFnPQ1W0QbVv5gmqvqeemKopTa5l7eL7K2v1OZWNrh6FRJk2RI1eZNgr
	V1YG76DNbei79L3b6CHe357r80JVTolxZWZBzBzh2IWjPDOMvHskYPf9W3Tq/vTs3ZqO+9JXeMc
	SNT9YguzVTCCowaE9o=
X-Received: by 2002:a17:903:1aa6:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ba798c46c9mr138968225ad.17.1778256277932;
        Fri, 08 May 2026 09:04:37 -0700 (PDT)
X-Received: by 2002:a17:903:1aa6:b0:2ae:450c:951e with SMTP id
 d9443c01a7336-2ba798c46c9mr138967755ad.17.1778256277335; Fri, 08 May 2026
 09:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com> <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de>
In-Reply-To: <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:04:00 -0300
X-Gm-Features: AVHnY4INZvCPRzEyfZ-BwhhUJ0Mn8Nh8TJ3mA3rAmX2ms0qTtlClWYZOq1Wf-Jc
Message-ID: <CAA_5yovyQCpgUFQFgak5T9CVmVLo-9dnECOQ7v8Z+YguuE_6JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE2MCBTYWx0ZWRfX+q9KG+RGa1Xk
 DbNFMYbv+If7q8YdsVwHn55GYcjR6xYxd/UojIEiaFkwnkIOwfBxRCvi4alx3j/gqE4bID556Ac
 U5/KdObKmntZktD4yD6FnKLtq+m9tEPxl8XD94r//PLkozm6wHyYbUG49TfYTr3xJNCedugukC3
 BAoo0hRGBqpydTJG18jayaaPg11xeFaA9dsgAXFmaMXSFP30GhmGRLJ5pNy++/fB0oW7w9Tb5pE
 vsHRNzBc64IRBX1+Z5mvTl/cZt/nqRIex0oBffDv9UMmPOi+a8H6ygdS2u4Gi4OWwHDymA5/jXK
 IV5caPPX3FPEYMHdcioZC5H7k4l2s9vppnk5GMqVpoe0BX7ZhymQgp4iFgzMR0dCMxj6DHnSVeW
 bpwOyEO30fdxpw2uT1tP3Y5YyZHn7J5PJ3EuwXH9x3RKdafJDGMhdhpEBz0w8ho/AqnXBKMkGZ/
 wPosjlS9rhUNrLbDgTQ==
X-Authority-Analysis: v=2.4 cv=W80IkxWk c=1 sm=1 tr=0 ts=69fe0996 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=gxoyNg6y6-uQNFO8U90A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: FNJ_CFVTW5j_2GPSey8KlZ0WwvIL9y1r
X-Proofpoint-GUID: FNJ_CFVTW5j_2GPSey8KlZ0WwvIL9y1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 16:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236729

On Fri, May 8, 2026 at 11:35=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Ricardo,
>
> On 5/7/26 10:40 PM, Ricardo Salveti via lists.openembedded.org wrote:
> > Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added =
the
> > backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it =
up.
> >
> > This issue is because the v1 of the patch was merged instead the v2 (wh=
ich
> > is also not fully correct as it is not patching u-boot-tools). Drop the
> > patch from SRC_URI_RISCV and move it to u-boot-common.inc so it is appl=
ied
> > consistently to both u-boot and u-boot-tools.
> >
> > Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > ---
> >   meta/recipes-bsp/u-boot/u-boot-common.inc | 5 ++++-
> >   meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 -
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-b=
sp/u-boot/u-boot-common.inc
> > index 574768b9f8..15e94a4e37 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -14,7 +14,10 @@ PE =3D "1"
> >   # repo during parse
> >   SRCREV =3D "88dc2788777babfd6322fa655df549a019aa1e69"
> >
> > -SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;b=
ranch=3Dmaster;tag=3Dv${PV}"
> > +SRC_URI =3D "\
> > +    git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dm=
aster;tag=3Dv${PV} \
> > +    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \
> > +"
> >
>
> This means any recipe including recipes-bsp/u-boot/u-boot-common.inc
> will need to override SRC_URI in addition to SRCREV otherwise the patch
> may not apply.
>
> Wondering if we should move SRCREV and that patch into a
>
> u-boot-2026.04.inc
>
> which we can then include from
> meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
> meta/recipes-bsp/u-boot/u-boot_2026.04.bb
>
> with
> require u-boot-${PV}.inc

u-boot-common.inc is really minimal and mostly just to add the common
homepage, license, srcrev and src_uri, so not sure if other variants
should really be including it (e.g. LIC_FILES_CHKSUM could as well
change based on the base version used).

If we move SRCREV and SRC_URI to another common include file then
u-boot-common.inc will just be used to share non-critical variables,
which should probably also be customized by other alternatives (e.g.
HOMEPAGE could be different).

So not sure if this would help much.

Thanks,

Ricardo

