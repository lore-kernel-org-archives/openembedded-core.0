Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA9AC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:36:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.5899.1744310186047610404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ii1DjXKD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFt5Yq019629
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q+BvbkV7Alb3HKOiwFRsIRHa
	+h+gKrIoXw0mlSb+RNs=; b=ii1DjXKDbDFxsNomdFBN9m4fO8AHUBZxDrl9AtUJ
	1/cTeNlz72A2fJ9/5KfwgNHdUDp7aCvvUAEUKYxDkEJrho4ryaXS8rjfvvpfxP8M
	hA48cvSbbphWn028dud5f1tSI7UXkcN/cUDPcAb8kawTlA7YKhBUwvCKa2ckevpx
	5Ztd2zPTY1JglMzt3BcD+MZlvxdHsPBim2haim3FbrdRFeU0NNMe5KgDglL2tJDm
	hWYWI+gg5Pok74Jl7TZODZB0U5ngL6Lrx0QNUcRH/TVPljHdc9dFOqo3Odf3XqLy
	Yz+xG0tOxTPiREqmrMfA+TFp5HL03uc+/70eEixVepAh0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrr5ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:36:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f4367446so11853886d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744310184; x=1744914984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+BvbkV7Alb3HKOiwFRsIRHa+h+gKrIoXw0mlSb+RNs=;
        b=diKo+lkQETG2yLLnHnc2S3RKUohpUBpACQyrKt/a4x0RKYq1DB6nGHNkc+uHSp3MqI
         DdtCiElpBLicJVxQeRAutRiViO0dWxk8mqmE4mpNwiUT+4iOZEIyfO5YW0weI0q+BQgz
         UHvH7fc6yvtdmRYx4DLfXxawcDa4yW3tp0tCNsNKlX7aXccWTwsa2f+XqFcYdzzlnfB0
         7epHvcUjp+aNiJA3SOsghFoRTX8vu/j6PHE5ZKO20JR5jp72mrbiLHzX9Rw1wSmE3OWQ
         LxY3SeiMe16Jb30krOaChNOhGkKWna9nDg7Pyfcfas0jFHe1ZRQzYzJgh8agxUOeCHq3
         MJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUciJPgMjpbtocZ1qEpEvImpA561KVan3eY9mcJT1nyRE36Sj/o6xRRHz7kkWYCQKBoI0+CSESHgy6Pa2W4qmj/Gw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx16ixdsHvIVUzr5tY0q7UK1ktKC4GdcrLiFfBS7KxzRIV2Bdvq
	JqHsGoonhbgKSXWO0593ex0H0sC1xkojAF9wjymdbd/CfdtjKtbOQ4+JDJoVPGsUV+2NXSX0Klp
	O9+EvUCkjXjQTQbSEAzSicMQUg+Q9W0zJsCWvbtULxRW9K2F1g/rjthcqTPJi0fE4zeFsV9xGQ0
	LZGoU=
X-Gm-Gg: ASbGnctX5x7q47su31+Kyb2JFyQmUDHS2yDBd2knsiJuVcCQF1At60MqFrdOQek6gyW
	TYT8MJI5ricMJfrqr88D9O53/sSEDk3ScfbPPe0JICAOGI/XCefgN7nv/BMd4+vwB8sKOO4ptx0
	4CVO+jRkbR8ZpJ3D2pSp6S8vyj3BPC/smd6sYzhkZlHjFMyg6Vu6vC+gT1FxRjNwo1dIvYW43xc
	BzMbXoPYbx6pWgnQTwPD4fIRrGNg7ZOtUfFCgBaYLV+cotxz9HCNiZcWGi8xZtzdRg9bGszmKEL
	rbGM5Kmgannqol6d6hpJiSYP5BifYa/puYxS45JpDSSVBcW6OQhcIifGjDKbxPbgITaF/AsWEFI
	=
X-Received: by 2002:ad4:5c8a:0:b0:6ea:d393:962b with SMTP id 6a1803df08f44-6f0e767d09emr53302496d6.22.1744310184134;
        Thu, 10 Apr 2025 11:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG55W66C2Vur8BWvyqZOkIyxnG8MgpSCIN5eN5I3/wZpOLjnNGF6ymWCcOf7dat7q5xoMRiWA==
X-Received: by 2002:ad4:5c8a:0:b0:6ea:d393:962b with SMTP id 6a1803df08f44-6f0e767d09emr53302176d6.22.1744310183744;
        Thu, 10 Apr 2025 11:36:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4f78sm5630161fa.87.2025.04.10.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:36:22 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:36:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate
 package
Message-ID: <s2gh445rrjgnljexk25k2k5tnbf2ogkcrtb2twykoujpcsdype@yjgziyjlhdaa>
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
 <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
 <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: PwbnPLck1TkbdeLqrmQk6c6AnoTgf_X9
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f80fa8 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0bxR4af2IOl5aB1rSw8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: PwbnPLck1TkbdeLqrmQk6c6AnoTgf_X9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214691

On Thu, Apr 10, 2025 at 02:12:36PM +0200, Alexander Kanavin wrote:
> On Thu, 10 Apr 2025 at 13:29, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > The commit message definitely needs to be improved. Anyway, here is an
> > error that we've faced:
> >
> > ERROR: packagegroup-qcom-1.0-r0 do_package_write_ipk: An allarch
> > packagegroup shouldn't depend on packages which are dynamically renamed
> > (libinput to libinput10)
> 
> Can you provide a way to reproduce this with just oe-core/poky?

echo 'RDEPENDS:${PN} += "libinput"' >> ../meta/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb && bitbake bitbake packagegroup-core-weston

ERROR: packagegroup-core-weston-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (libinput to libinput10)

-- 
With best wishes
Dmitry

