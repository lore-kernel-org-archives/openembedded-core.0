Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF8D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 09:44:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12534.1764323059592406399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 01:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E9cJ8uuK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JkRMnUkE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NwgT3123328
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 09:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vN+FvEQx5wdZmMJBJvf0ZO4G
	HrIvWO4mDF6aVy0d3xg=; b=E9cJ8uuKCdmXzT6qqG1tDcrq7qmNmvcGxc1kzik8
	J3/GkXT4MErA1nZDUt/XbLFSBiw12gUTF05qIUvzwqqOAOE9v4vxSkT2/dEBvrG9
	sRzGLEaIikRstrOShNAirfrfYj1ci3K2PeaMi4+n83dXAzPzu22GpR0rQO1TC1XX
	wL/RkOSulplJ23BUIqsj7Nux2BbSPLNRCIswumUYAxQqp182h3KjgqPB34iXylKx
	s66TP2oGK8tYU6huxIFPNO0BX8Xr5VE7ZTlqCX4nRvwX43+KSWNpbf924L/+ENUC
	k4ZDvpzK1kV65gQkpuRTYK4vwo4qAwIi0n07HlBauT6xHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58ugrkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 09:44:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88236bcdfc4so33475976d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764323058; x=1764927858; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vN+FvEQx5wdZmMJBJvf0ZO4GHrIvWO4mDF6aVy0d3xg=;
        b=JkRMnUkEwXsD8XpSwVSNDX6HficbZ5Aj0xMeew7dMDtW2rAhoAWEy6UrPhoybAMBWS
         hrxZnUM369PYTHdXZR4KInCQ9B1aBW7k7lQBu9Vaw9k1pn+pI2YHsevn2dW2XcKHI1BE
         hshbkFEfeka2bKtFVIxaNvQW2mqnoD95ktXbZhtnvKomHaywOqs8Rp5Y7ksZEBF7Iu9K
         4OKnCnOA66eojPa2FKeWI4xxM2apFE/poeUgPjoiobheXaqSTyD9SX3VdLWNZ+oiatLC
         yqj5WenCW9XZSODWoseynYzVa79vEIbGGUgurozqp4ky0h6zZ5AbP2QuNRi3MXpZx5Pa
         rsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764323058; x=1764927858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN+FvEQx5wdZmMJBJvf0ZO4GHrIvWO4mDF6aVy0d3xg=;
        b=ihGPprP46sZT1GkOk20Y3BN3HpMsIavVIyoEaNSbknnfUnljRXuzbm65Db5P/7Fymz
         LWuZWlOvcqA94kVaLOAigYG3ipkVk88PbJI1f+aasVyiAjNmNCPSr4TQrVyb7JUy/7xB
         ZQr/nKhu7bQfnhZKHmj0Kp5Thm8+OrTpHXwToQvdRJPKRD1YKzqB3asPjijJXcTsrlyO
         EHT/3ydHye/IodBEdawuzGDTepVtL/RKDvwRyoTV9llDgDzph2KWFPutLZj/CmYehngK
         m2ZaAsJmHR2lqtWXvEH5ifJGb23EgMKeoydShW0ZragfeCXUxJKgLb1Y9rXHIeAosxJJ
         t15Q==
X-Gm-Message-State: AOJu0YzgZ17mzLm0KkveyBWlHNBNPxaPe8NL8KDev0r5tBLMBsfizzvj
	Qo/Llhb9z077/70eMV5fdWVqr9M+taCP3QTtwVLg2flctTjVvT+vtcVuBFejGilfPG5iuRMPuEH
	Hy0/RbIPRm6UEz+QdsJ6xSNIal9gN+6alJvnaFbA1Pg99P2eGkDckpe248v7snFcFT6qUZoU3T+
	AFVn8oarw=
X-Gm-Gg: ASbGncu9IXfo7++5fj+/28Qv+FIJNew/5MSW35fvX7kL+dk22qmWVwomZcr5V52tlBl
	+00LhTHT63kf1Opty1sLzGSWktG7XutpjaV/Cs5x60e8mnwfTcd5+vYsTIlMpGGfsq4CwxItkQo
	LU1dUdvSEozXLtC8GZWkHiAp/f03y1nAU7+imFyDpAGFWjCO62JQeuLxlzqklGZ24m2IGsYWhta
	SJ57kwazc7yxoEQKfUMnQq6YDJFMmjiyA2hqWvuc1uQu8WMOyO4MhZdOH8HCzvALhbMq64OwX7H
	dw4Zvi714a1sUH5LZnmwGj1gntIEUK1e1HW/aZpkRLepJxTLrcCrJ1WnFxpbdwl/S5BSADvI4pB
	+DH8UB7OS5sUYh/kEGPNH8FjAAXX2xtxCPConxG29mmy6nojYO7sleiDZdHxXwzbfyuUoN1yiK9
	k9WtfQI8Ib5M5rm+wUMm+E8VE=
X-Received: by 2002:ac8:7d51:0:b0:4ee:2868:4e4a with SMTP id d75a77b69052e-4efbd90da68mr202369561cf.14.1764323058120;
        Fri, 28 Nov 2025 01:44:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnwcCDHE24u+XPFiee8mPDyIJCzt8vVLwFQ20QL/w1sC9k7uf58i0n3e7vQA+sDzwIt7RFBw==
X-Received: by 2002:ac8:7d51:0:b0:4ee:2868:4e4a with SMTP id d75a77b69052e-4efbd90da68mr202369351cf.14.1764323057667;
        Fri, 28 Nov 2025 01:44:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48c9bsm1038204e87.81.2025.11.28.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 01:44:17 -0800 (PST)
Date: Fri, 28 Nov 2025 11:44:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20251111 -> 20251125
Message-ID: <j7bqsa7uxryiqrdk667ln56s3pemetk4w5jcgscmh7aaqnyska@gscg2riqvaqm>
References: <20251128050953.3619530-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128050953.3619530-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: fW946COtjc-wfZyBaCkgza6LAxSOmL3r
X-Authority-Analysis: v=2.4 cv=UKvQ3Sfy c=1 sm=1 tr=0 ts=69296ef3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pXhZ73U421YX1p7hF3cA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3MCBTYWx0ZWRfX+1uKdqCZPeaB
 dUMxqqFdX/it37OqEMXrkgWNHrW48AFMTA5fowxD0CRyD/WUO87Hc8hO+JGDzOWb9US6nNUTGQ6
 fDwvj+7KjrNqY6Ligd9SEXF0OXJqYVfc7iTNFWRM8MBd/fjG7ekN1cbqxOD05KQhzu5Ck+wldS1
 H43OWLzAL/sTcGWGHd087PVYPyFsakdnM6X88up1g1Gt8iq0ngdK/zfbppxHDbcVwXqofm7yVme
 f+X3Eotl1Ei+9SPXic74osgr7D6uf7+DmN3zmxOxdEIU616GFlPgozxU4Kk2x7y4GOh3+tvxiLY
 tlJYxNHyjnhLDHIAeGY4LIJ9i7gGfvZvmpEWko3AxvHX+DABQcxa0OK3yxHIUkp/nTR3RkfkL1p
 cDBv2vTG7GpkOMuryypMwyizARakFg==
X-Proofpoint-ORIG-GUID: fW946COtjc-wfZyBaCkgza6LAxSOmL3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226902

On Fri, Nov 28, 2025 at 10:39:53AM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add CS42L45 SDCA
> codec firmware for dell laptops, and some several Qualcomm packages.
> Update license for Qualcomm kaanapali packages, update order of
> ${PN}-qcom-sm8350-adreno alphabetically.
> 
> License-Update: new and updated firmware
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20251111.bb => linux-firmware_20251125.bb} | 55 ++++++++++++++-----
>  1 file changed, 40 insertions(+), 15 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251111.bb => linux-firmware_20251125.bb} (98%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

