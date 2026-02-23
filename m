Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D07EC1122
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 18:43:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1849.1771872200420572866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 10:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ley23pza;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZDv/uw/5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NDsXcm185758
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oOqKIDPj3/bGoeRaN2bjjQLb
	xsaJeMBpnKAVxQtG2hU=; b=Ley23pza7OmQYYGDAJSgosfH8rA1/N3CFAeTWCt2
	C1E/f6+03ustTZapiSViZAV7OjeuQXI0BYPDOy46fLVGqOj51ZDh6obiA9yrXjHM
	Dxk5MiU62it+icdkfzVkFf6gQMP3SxF1/NtBDqjQ8FtoM/ITu3/yTmS2ekegDIbi
	i5SJPpN2OWJjD4cUBfXYK9p5aFkoMNUPNfZlz4u+wLl5eBxTaWnS62jgG/D99vBg
	l5mdUqcztqn2k9B94FvWNpLOrpZUXx7LIWJ9q4MVIsF+mkunpjHSQ2gNQsAOZ4qW
	p/zPwlb33EFVzBJQshHdNFZyvtIvElekkU6Y20rt5Thvtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69gxpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:43:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so4135121285a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771872199; x=1772476999; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOqKIDPj3/bGoeRaN2bjjQLbxsaJeMBpnKAVxQtG2hU=;
        b=ZDv/uw/5xpoXWfw9+kQPdozakgFv5wLRVJ2o+ErjpDa4j5xsR5V10DIEJN4N4g41fR
         umO0v99272uHKOnr5mEU0zsd9C1blVn4QFoEIq497GfKrPcIMTdM2NPV2kZsgpjM/tKj
         qEbh3ckotc28cxJR9Dgu8xHoZ9IZJ4M5RVVX37KvVFDozZr1SpT5ISY9KhsfRe2wyapP
         iqrlJI6+FxNHLJrklwNEhJiw2EgkCDhBuB3U3ujY/FUn5ob8XiNUQTk/H6qPbXsEumd/
         4icyxI2f8nfDRnep3YULOwY3sxOAJfatefC4CF6s24FteBdpa+Kpl5953TYW7JKbMM3/
         lbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771872199; x=1772476999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOqKIDPj3/bGoeRaN2bjjQLbxsaJeMBpnKAVxQtG2hU=;
        b=lLswu+LHEEnLaVSDlD7WCElbz0+6o4RK2mG6EafkfLkoO8AALEp8WPLqy6jDB93m1H
         nil0yXRzDtrQCsHf82Ih8thz8epOq+HphbPVtKlytikIA0Cc9TkmAV6j6QSbZ5h6gvg8
         /c60WBSv8HM2pjg0FaHdhtn1c1BuSMuo9DV40KQK5VDyhJHmGO8yL/vsqjnawIllesf1
         Agm640wFzTa0eXhyHbRq+OfJk2MQG2B2Z+J9Zo1dKGBUbgX3m/wJ/WtLQOd6WGlFuJdP
         oml6EWDNeLjI3cd90VattJm/jDMcvaJWFIePrFeFX6YNrSl0xhS/fch05anHtkeiDTYB
         RsFA==
X-Gm-Message-State: AOJu0YymSt2hTeNrww4hz9HLw3C+5suyguCud+6Vm3kKidwhJ3kMBiwi
	8dy2qkp+9hBf5bV/UGo+iIYYqefJZsRkdMENziKCyF3pOUqk+rFaPDogULi6DrotapD6rplV/f/
	HZViyYj4fEO586JtePoej2JOWSv12+vIs+VlmykCpDEqU7805kK21wrQZ9GjdLhafIQ95c1sQjg
	NB5PBWtLQ=
X-Gm-Gg: AZuq6aIij7EmFajcs5gGoPVMaA3CyoRovHV7F/H05XyDk+3dBKfzGenbf4gROuTo3PG
	YienRSHoawCoDQVmRnUjV1g1jeePUHS5tfjUONQaOLynW1rxel7PgGL3akmVv4BK4juTQsdLGBK
	a4PQVTWxW2qmrY7Tm9+isGwuTSpNdkD2iCgl7LW+zkmWxKcfmynD74j23fGem+D2hF1l/jQViXW
	yxGzHduvVVqiSt3qsj2dDk3VERTQqXJi6S+EK/dbzFfzENDNYHfnnVxDAtv+HPJ0I8z+Ff+NWSZ
	TkSs2Id3agXUXlTpFDBff5MBAH10J/tamBFbqNWT+tWYtFwLALDG5wJgK5O5ce9V/tkSqPeAzis
	vHhJiLzt8NPFZ/g438FX1Akn6eONgylUIIrJwRO1uH7cF2TUDso9JE8WFanl6QDPtENuOWTD/Zm
	RjcFyOVLup9kJzMyl72LhCIhlgJU/ELaGna0k=
X-Received: by 2002:a05:620a:3943:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cb8cab0d39mr1078543285a.82.1771872198904;
        Mon, 23 Feb 2026 10:43:18 -0800 (PST)
X-Received: by 2002:a05:620a:3943:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cb8cab0d39mr1078541085a.82.1771872198496;
        Mon, 23 Feb 2026 10:43:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c53bsm1743564e87.82.2026.02.23.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:43:17 -0800 (PST)
Date: Mon, 23 Feb 2026 20:43:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260110 -> 20260221
Message-ID: <hc77r3vu25x7l3vn55xoip2ngmvl4kkdtnddvnfkzqtotizs44@iqx6blwuhp6n>
References: <20260222212156.55731-1-dmitry.baryshkov@oss.qualcomm.com>
 <1030996.1771824119017163262@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1030996.1771824119017163262@lists.openembedded.org>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699c9fc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Yw2KmMEBi6ql9nTlWGwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: s-mC2JlNCqszCJ2lZWY-i9L03siLZoQD
X-Proofpoint-GUID: s-mC2JlNCqszCJ2lZWY-i9L03siLZoQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2MiBTYWx0ZWRfXz4ceeEGx1nAB
 ownJw2ScSSpyLHlDlX4jIeGChdG/tUWxmHPaWj2w5O0M2t9O21aPr0/COM2d2Rp4mxD3bYPen/M
 pCaF6zUBwLj1594SPPsO8jKHGCNXHiFEsDgsuL7ZJfSIaaz6HrB5FFHk92a+mcWTHnixH8te/hz
 DSOE8Aj5ifEQxxdzOYcCUmchW5tPEvYGHyURTAtep9tuCJIGXNsLCHlmoAKEID0ATRMCkF6cD2Z
 cIV7oBZf4mLyIdVJrNfKIHQHUkRkcimeLDXTFE8mGWWy7BY3Hk47TOF10HTgcyPKEZ22ICXTTwd
 5Yg2IphZmApQ5gKsV1OpzdhLhFUM5AWtsHUN3NEcaz1JSil1jh9XUeWOkV6oWMkP3tXEx9YhiVn
 j+8uVuhhJgD3tyE4tTMdEKUPO7XKBv442yCRIMaOSbXQSbnkfGKvnVz+ry3SX5Pa23O4dGaEXsl
 3YdHm/gHGp04T0WEYaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231691

On Sun, Feb 22, 2026 at 09:21:59PM -0800, Vivek Puar wrote:
> On Mon, Feb 23, 2026 at 02:52 AM, Dmitry Baryshkov wrote:
> 
> > 
> > +FILES:${PN}-qcom-sm8750-audio =
> > "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*
> > ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.bin.*"
> 
> There is a type, no "." after bin
> 
> > 
> > + ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD-tplg.bin.zst*
> > \
> > 
> 
> It will be, X1E80100-CRD-tplg.bin*?
> 
> > 
> > +LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "Firmware-qcom"
> > 
> 
> Will it have linaro license also?
> 
> Missing RDEPENDS for " qcom-qcs6490-radxa-dragon-q6a-compute"?


I think, I fixed all your comments in v2. Could you please check?

-- 
With best wishes
Dmitry

