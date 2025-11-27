Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89611D116F1
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 03:01:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10260.1764212491588204584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 19:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UoKo3/nf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hPQsZJkc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVc192355326
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p48OZhVuWUssCch9EDQQmsGeTYfWN0Lw+7sADJZMPBw=; b=UoKo3/nfovwWoDDN
	l84aWxnZCPMPg+8wAprEcDAkgpJUUBE69+Gke3wRKfQj9mk2JU4y/yUXMMi46O4w
	LWT1FDkNShmv3n0Q4NrJxlhmfCweOX/BrIr1UZ+uOrmN6/sXuCKwpyENmtb/nMos
	oalmWwrBn+YFuQsxodZjF8Q0XL+lAEnD6MkupKlQuNmXiwzh+kLsvGw3GZwKyMnK
	XCDAjVQjKBy4W0ZfXTW59M4+RDPQ8jHibms2/jIoZRRCUMxiY57wCGl9lJjil4RM
	3b1vwPz6bUk2nY5ZFYzKtK3JiTIJHy/wQ0PeF/5VdutnVivnNEk26URd3wO0OtVg
	AVEoFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1hsgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:01:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so108229485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764212490; x=1764817290; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48OZhVuWUssCch9EDQQmsGeTYfWN0Lw+7sADJZMPBw=;
        b=hPQsZJkc4H/ab8U8Rj8VCWHd5YDs7K9sq1Hfmi/YfMsT+aXtD2UvROkNK9bOqFRO3H
         mX9pdqSkZVSjjbT0wBeTG+7fH+f2SXK/mco083AGbjZ7lT6YIZZ0BEzCPvntl6KemcJP
         TmsBYTOixUQtYIxHRJHe3k8xj6v3Va6K6HSaI3xjpfavRrz6FmF9u5HcwgkbpJdmWPze
         J+Jye+lqZokkTORpm98F2JxXJtLQWgg0Vy99KE8/+ReZHmI0flhlm0+3nVuOJUZjNN7j
         vrbKjzv+Kg0AC5e4IqessHf5Usu4al3gOVms+jBu+9FQrynkZYPvJ7E/vHN/QBhY3n2B
         TbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764212490; x=1764817290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p48OZhVuWUssCch9EDQQmsGeTYfWN0Lw+7sADJZMPBw=;
        b=jlSiVsYgykbPcLCmCMnBsFpdxzRer1NakBk+3iaeqD7GMyDkPZaZ2O9XyYJa5lVU/R
         MCS68BAlw5fTOtxvQZby0MPnXShH0n/HTHpPnNUujgJNaYcrTBYwvxFUzWuQnZQhtNUp
         kqVSk5QmWJduSzFXm53yDvTlXlRNJcPFn6qfR+Zxyp7X3NX73kFQLq17J63ScC5qo2L9
         6hAn5Fq0L4/FT12y/Kv7cHdAq156D9F0Km4/9GGPYrKYumo2q338GG3rXE7BjcM/axhf
         Ju+RLoYclgdRnaHbJ/tJlgR5RA5x2k4KPGHOMZM7PzjBi7z5LNdwAWHiVsk2SAKo9i1Z
         vP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7e/5ognD5Ociv5XAs8oqGk23yuxkFdHhYZ2rXumy8OYpLR69CG9H/Q34RMPRuHdiOJIdB33lhsDjYNUf9uLSO5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwiNesMjlNMfrh/3g9uh8fbD0lCXshCMFzUtdh4dAnuhB9tIxXd
	cKPIS66QKfc/eLBZT/wwTcjops2n7N0mAxndgCF/iuwh4IFh9Fge1iR3/Ant/Vf8+fcEIRidZ2C
	JDRp8GEDRQlh1ItY4tso50uSvJiK6iAE9596EMDJwCyghtt9pPKmwgAc86BnFPVRKguKg3fGpSb
	+U+Ka8H5ATB7scDfYyrd2/6AhJOS+JKsjEiuIQCCFjkDlHX7YFmpWAR1voYg==
X-Gm-Gg: ASbGncsVWMBIXMBTINUSWDH1VdtpGJ7n7wE0D8JCviBN4fDZjQjyymJoHiRNs4zARrC
	1lNHj47IjhVAidQPf6kV3JGq/ktiFjXeacfs4i+pbhIPKntmY+t6wdqQ4nny4JOv6C46rC1WIwd
	1wB7WYew3SFCXMq0uWw5TJEvU/55vzdkLjZB17QmGBDfgvnOYN6zXW/aWCKnIy24bW
X-Received: by 2002:a05:620a:3942:b0:8b2:fa94:e48a with SMTP id af79cd13be357-8b33d4a7314mr2984979885a.52.1764212489844;
        Wed, 26 Nov 2025 19:01:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXMNV8OEdRhqFAJQjMURRe+IFgNgt1+r0JjgARfGIug2dUQGbx0c3BC3eH4HhrPtpgPeJJ2+5L3mWxIwkSQRo=
X-Received: by 2002:a05:620a:3942:b0:8b2:fa94:e48a with SMTP id
 af79cd13be357-8b33d4a7314mr2984975185a.52.1764212489368; Wed, 26 Nov 2025
 19:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com>
 <20251126140713.1414484-5-miaoqing.pan@oss.qualcomm.com> <CAO9ioeVU7jKd9mKy_XCGGyfp-uwuqJWgM4OyDxfB02ApGw2k5w@mail.gmail.com>
 <df6c774a-f330-4cab-8ce2-32b84e8b8906@oss.qualcomm.com>
In-Reply-To: <df6c774a-f330-4cab-8ce2-32b84e8b8906@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:01:17 +0800
X-Gm-Features: AWmQ_blGsY8CQlN9Sr5v2r52MgVasgyT4-6t2YYVA2NT7y3BEtco-9EJAbPL0zM
Message-ID: <CA+s=J=zAyrR-ACs147zxg6oWO_4eKZqiK2+iHgk1LrqQv8y4kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] wpa-supplicant: enable OWE support
To: miaoqing.pan@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MT-aRLhzyM0zuuAxjJcDX-OSMUPuflVf
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=6927bf0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=OviUlO-iUVahgcf9MGAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: MT-aRLhzyM0zuuAxjJcDX-OSMUPuflVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMyBTYWx0ZWRfX2pP8VqQmQx4U
 a4Dt8EVWAodoyIoXNzRYfw7KcJb4WcU0S3wgyaAX0wiVTdzY2qjOFztt91FjUUTBm9mbxC7KdcL
 i4eGnHnlHHPYoa0o6TdriMPM/neQvFmEsLe9tqmc58rrehQY7LOVrDBfFv9G80EPU5WW50hu/FG
 I3bST1NnNORIZlcdz4kCTnHmlb7OaW7hrQ34cEP644ydfKIjdrFlVE2shBy606HDPlZt4VaBMaU
 4waNVsIGu3pyan4v0cmfW9jMDLJ3x4xXs/NyN2q5CEiuU9Hkg55/jmxLss/NDOFfQryyXOOYpqk
 upEACXIj7E/TBe1Y/htil98HM6eaeQSdAWY1EGPfH3sxPspks+ny2BxxJ6swl9DryKwwWW4NTMp
 r/QpWoHHcu4Tqitc2vYoSDWFpx5+yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 03:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226825

On Thu, Nov 27, 2025 at 10:54=E2=80=AFAM Miaoqing Pan via
lists.openembedded.org
<miaoqing.pan=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>
>
> On 11/27/2025 2:43 AM, Dmitry Baryshkov wrote:
> > On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
> > <miaoqing.pan@oss.qualcomm.com> wrote:
> >>
> >> OWE is now standardized under IEEE 802.11-2024 (RFC 8110, RFC 9672).
> >> Enable CONFIG_OWE=3Dy in defconfig for easier testing and examples.
> >>
> >> Disable OWE when PACKAGECONFIG selects gnutls to prevent build
> >> failures.
> >>
> >> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> >> ---
> >>   .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 =
+-
> >>   meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 =
+
> >>   2 files changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/d=
efconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfi=
g
> >> index e313894ecd..8a68d56ffd 100644
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfi=
g
> >> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfi=
g
> >> @@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=3Dy
> >>
> >>   # Opportunistic Wireless Encryption (OWE)
> >>   # Experimental implementation of draft-harkins-owe-07.txt
> >
> > Again, this mentions an outdated draft. Does it (supposedly) conform
> > to the final standard?
> >
>
> OWE is specified by RFC 8110 and updated by RFC 9672. The
> implementation conforms to the finalized IEEE 802.11-2024 baseline
> where OWE operation is recognized in the context of 802.11 WLANs;
> it does not rely on any outdated drafts.

Another data point that might help - Debian has had this enabled since
2018. Fedora has it enabled as well.


>
> And will add the information in patch v2.
>
> >> -#CONFIG_OWE=3Dy
> >> +CONFIG_OWE=3Dy
> >>
> >>   # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Conne=
ct)
> >>   CONFIG_DPP=3Dy
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2=
.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> >> index 4a8ee1423f..971e55150d 100644
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> >> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> >> @@ -48,6 +48,7 @@ do_configure () {
> >>                  echo 'CONFIG_TLS=3Dgnutls' >>wpa_supplicant/.config
> >>                  sed -i -e 's/\(^CONFIG_DPP=3D\)/#\1/' \
> >>                      -e 's/\(^CONFIG_EAP_PWD=3D\)/#\1/' \
> >> +                   -e 's/\(^CONFIG_OWE=3D\)/#\1/' \
> >>                      -e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_supplicant/.co=
nfig
> >>          fi
> >>
> >> --
> >> 2.34.1
> >>
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226819): https://lists.openembedded.org/g/openembedde=
d-core/message/226819
> Mute This Topic: https://lists.openembedded.org/mt/116489736/3616702
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
uj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

