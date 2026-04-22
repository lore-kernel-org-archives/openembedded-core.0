Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FB7F5A8DD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:20:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80110.1776856819044038911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bzVVw6Sx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=U45pS5E9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M9kTFB2000973
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vk2VJt2/t75i3JBMl7s5EJtdO/xq136p1pt38h4q0yY=; b=bzVVw6SxMMVJ9XxG
	5iBEBqu6sLJ34E3CY2xG2bMrFp0SymcvIK7DJSVk48RgkYNXX0cdsNCYyFTncoEY
	v9e0Ob7w9y+zgWV+FQsBivdAQwTMvZHYJ9EHN6uA0ke12n7+pfLN1fAsL8joR8a1
	QbW+9lAFcosV3cFpS7u9VLXAEyd1x7tshHddC03OGhYwMYKIj1+1MlAPFJKtOwUP
	SuVfer7OkeUs2SGOqjVOX+2dpTERhkzQHWuZhfSo90q2Zkqk/GBcLjBmGtIB4vOu
	Ye06p2xH+MwtXqIPfcjT0CXhuEx7aBACMRv6J82T1S9iZ+c1CONHUw+gH5GDSE43
	RqMozw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfb72g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:20:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so4748315a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 04:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776856818; cv=none;
        d=google.com; s=arc-20240605;
        b=A/fqe9ObZF8W+foT9Sz+E6xLg2NGId0rbVOCtKB2fvF+lEU89DBUsI7Hp9FwRkX4O2
         z1Hbo6Zfroa6uoi2ufVwjj39AMATkYVB5t+AgfZfn9m1kndvYxyEkz9TA8SCinr7WYcX
         IXmY0ASjszFDirlegbaiNbxhGDZDlU48/X3SfDE1pwUDKJfbL1lTvfiFMRCjaPVgupYY
         b3kwSLwUA3T/U5DCfQVGGX3kNVsv0mEW6bzc5wuEDofyRzD6pCfjN2q/k7jyewPKN0ck
         vsFYpm1bEssXQ90azC0lLr3FyWWeyrAo1L76daKv9wZpeyVd5KsrQ3cK6UsEiYrIiMh2
         VtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vk2VJt2/t75i3JBMl7s5EJtdO/xq136p1pt38h4q0yY=;
        fh=AdhjSeDoqowOlLYUX6gu60K3PuEGZNW3x/WlHJoTcbg=;
        b=keHSRrNXf9ry5ypNtU6biVBTFZ8vKqT1u2DHzESIl3vSO6c0ooKVQZhCc7LKAz4aqv
         WdFWUOiAX4oKAWuZgj9zOtsukW2YQiXTS/cGH+ESZGSX7FKQZpfHOjKFcz4rs+8zh5Ef
         iN1H0ZTdJp8/LJKIMa4h5fB/H1btrlcxa8hHhIu9JNdP/H2ppplqvj1BighEpMV1QinM
         cdMX06B+OTm12/p42tSwrMTiDDPRvA18ImPprhFX/G6F8Wnm+L0eQ+2oQdMYcCiVG4f8
         5AbhgXxgiLUM/ccS3RjjxlFsvO7IhnTi52PW3N+bth6INhSO8wAq1IvBNA6cQp3fKA9+
         2Ruw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856818; x=1777461618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk2VJt2/t75i3JBMl7s5EJtdO/xq136p1pt38h4q0yY=;
        b=U45pS5E9npH3MvyMS3OTMVDaAzItKJHIJoBtGVBI4Fdzy2I6aipP8UnufQhSydGLa4
         /1dyMMa9NVe/HWMGNaawM3HFPMs1yxbkJZgX38akSlNt7OFyHTOLjT2ZFz8cPN1PQjtg
         UfiOFouq217NmGkiWqfYqB2INBWlc63Lj0qvA+kiIT7Y/lNQ7nwt+BUPkvNCWy6q2pSK
         raLK+WTP+4l7iwY1cP7zPgOq34w9cbsUhPlU3n7qt2MFFq/mP+yC3YAC60+cToqqPvt5
         F+0wOQf6ygvj5jADp0gNaSIIZqd80aZ9aqYd3GESha624PkGdGtzS3GsoN8eBqZFWyP9
         a79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856818; x=1777461618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vk2VJt2/t75i3JBMl7s5EJtdO/xq136p1pt38h4q0yY=;
        b=mPGU4LWPSAUb40CkAsa7u8hmEdd5NPZWi6v7/YZmuRa54SWqq5jvUTcZMY3nuMiIz5
         CdaIrdwqoT0+2OU5isobZUOrLeHqPCVnRSnjlIHJAGlJh/Q3yDJRfS/l3usohed+Y54J
         /ShHW9+pMSBT00kMF+6/j46qECqQovheLWW2hIBb+qiNmW0tUvGkMi0f4+czk1ShpF2+
         UqdGqqu8dypEqpegSLqR0aHEHAba4KwNkBWAMfEbVknQMc74zMSTsapZro0yZfQim855
         XGyruAvE7Z/g5Nk3IdgpU92PFf7JwcC00Myja9bCF2hMBwg+E6SXjLwj1JAijhTaf7eQ
         SJDw==
X-Gm-Message-State: AOJu0YxnfDdn/Gm+6/USazNTMK/m8rHIcAY0ISgxb6qYuFJmGg3BXn58
	CpYtllIWVHY4rrjDk1h8qv1WB1YvWpgc5mEUgfGohgXZsEL2+9xAUwLKad/xnug52HcbtnRVzTK
	pVnngzK4/VcMVbhhao8TXlVPVRKGIKf34IJgzNkq9kODTeuYLaVPJm0/v7nHtrPmS8Ci8m5KUnL
	N+ncuaoBporhM+SmIciwHRWqeKy1A2BJYuSUWyt/MYyyBlZTNTyxy61iG89g==
X-Gm-Gg: AeBDieuwhr4xR5Y3H5sFjqHDkMWG515REM9MgZCEXAbD4dHOf+ZzGvhhqmOicgSOaG4
	wK5B7tV4C5z5S7gGHWrwD8R/nhe3ZfChOvT4LENznmPsvaiTlYZrmPE5DAajAoorb+55Mo02rO7
	rYoUVFmDF8zKIAQGDFDEvyjI5Spk7uNv4r//T1yCV2KcIoWtJZPN+VjErBsLZafbExzUfLcn21n
	HfpngZoAHK+ScQAWA==
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3a08d93976bmr24684829637.50.1776856817608;
        Wed, 22 Apr 2026 04:20:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id
 adf61e73a8af0-3a08d93976bmr24684791637.50.1776856817115; Wed, 22 Apr 2026
 04:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260422102935.1299772-1-jiacheng.shi@oss.qualcomm.com>
In-Reply-To: <20260422102935.1299772-1-jiacheng.shi@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:20:06 +0300
X-Gm-Features: AQROBzAhqu5jr-ewPrCdK2ppkWHZGI6_otwDf2makG_NyD8Q7ZrqJtyA9HCr3MI
Message-ID: <CAO9ioeVyLUStRoqdWuu84bT-yQy42u+rffLRHsB1uXx6GAMhbQ@mail.gmail.com>
Subject: Re: [PATCH] wpa-supplicant: add patches to support RSNE/RSNXE overriding
To: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, zhi.chen@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, pengfei.zhang@oss.qualcomm.com,
        gaole.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6gr63xvR2KbHizTJ2RUDrPwG4fX6VXDc
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8aef2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=q6vMkDZWV5q42etU6roA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX1iYmT4AdtJJU
 +l/XJavy5zPodXFWRCLoWukdk2lX7laMHfxpcz3jBpGLvqV7Wc3UfP9INOS/z1qzyIxyf87ktmf
 mDESmKJFDAtCAfh4ZKzTPdtzG9FkMGgiZum0ycnAP1HCKp7vdwylhKnWB7ycIUI3pUT7HG6t2L6
 TpCZ7f169pgNejwkbSSQ6il4ksk43PDcISotZqVumbMyUM47SpYWpBSPZFsY1bjff6cF5lV6Jox
 n0SX80heMEWj27NYefR5dRVmLTWx1oBgVvFpPGFrVzvHVA2GsoIdT0Irya311eRxRSeFAPYcGCE
 MDkDOPywX48wfxrCaoPfeM9lQpZIqMoC5CaFjcHTq+g2TR7Pcb7bR4sDWW52GXiHIdC2SAcOMVy
 qE8gDpyuefpDOLtqzxuFrm0eCL9X3KGyIysnIQo+shXSWrqC/ixZCbyCQH6zab1ol3eRu4HDwL6
 hMbjvkVZ3XeylqOkpFw==
X-Proofpoint-GUID: 6gr63xvR2KbHizTJ2RUDrPwG4fX6VXDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235717

On Wed, 22 Apr 2026 at 13:29, Jiacheng Shi
<jiacheng.shi@oss.qualcomm.com> wrote:
>
> Fix WFA test case 5.2.3.3 "STAUT forward compatibility to
> an AP with various AKMs in RSN IE" failure caused by missing
> SNonce_Cookie handling.

I can't really decrypt your commit message. Please remember that you
are speaking to non-WiFi people here.

>
> During the 2EAPMSG exchange, the STA did not apply the
> SNonce_Cookie provided by the AP as required by the test
> specification, resulting in sniffer validation failure.
> To address this, add full support for RSN/RSNX overriding
> for STA mode and explicitly signal SNonce_Cookie=E2=80=93based
> override capability.

Please adjust the line length in your editor. I think it's way too short.

>
> Change-Id: I443bdc00b1983db1a8a97ffa3f1f4998cd826a86

No Gerrit tags, thank you.

> Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
> ---
>  ...r-specific-element-types-for-RSNE-RS.patch |  34 +
>  ...-overriding-elements-into-IE-parsing.patch |  58 ++
>  ...ide-element-to-override-RSNE-content.patch |  36 +
>  ...ride-element-to-override-RSNXE-conte.patch |  36 +
>  ...eature-flags-to-indicate-RSN-overrid.patch |  67 ++
>  ...a-capability-flag-for-RSN-overriding.patch |  65 ++
>  ...ions-to-access-RSNE-RSNXE-from-BSS-e.patch | 448 +++++++++++
>  ...bilities-for-AKM-suites-available-wi.patch |  66 ++
>  .../0013-RSNE-RSNXE-overriding-for-STA.patch  | 739 ++++++++++++++++++
>  ...-Selection-element-to-indicate-which.patch | 415 ++++++++++
>  ...cookie-to-indicate-support-for-RSN-o.patch |  84 ++
>  .../wpa-supplicant/wpa-supplicant_2.11.bb     |  11 +
>  12 files changed, 2059 insertions(+)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0005-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0006-Add-RSN-overriding-elements-into-IE-parsing.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0007-Allow-RSNE-Override-element-to-override-RSNE-content.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0008-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0010-nl80211-Add-a-capability-flag-for-RSN-overriding.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0012-Make-driver-capabilities-for-AKM-suites-available-wi.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0013-RSNE-RSNXE-overriding-for-STA.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0014-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch
>


--=20
With best wishes
Dmitry

