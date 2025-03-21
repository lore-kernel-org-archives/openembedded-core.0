Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88965C3600A
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:55:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.19679.1742559069777542141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 05:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=g+51uFzT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATCSQ011445
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ecS7x/s0O1iAPcbJIx2oQV+8
	Xzz6Z9tj5GKvpucvt/4=; b=g+51uFzTSPFiLhD66kxCAXH4dZB8d4fmK2apqgE5
	SFZi+krFS+0WduhO2mqgBkEJWZm7c/89iE3KvovCoyIkSizTb1q6xXUhzaD5mtQm
	3y8JKlde8OjtiOYKW4OYptKKQZIWskVhsrZVMM5rDukbRyA+Beq0kNiySBMYuJQM
	5lYYmlrhHJ0vSLN6N4TfSjodRZH+QMNL9R7Mbx26K491wgz/2uG6YfsRs7s5tMFV
	fLZG6N0qnnpCd4Ih7EyBtMYDLNI33jLtN/sIvfoSOX+UTPSlnXzsg8/cDxLN3tpU
	L4uH1cLOBDCNrA1RGd3Vl0xmCWFYt1KKLirWERIm1Aakrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y6c8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:11:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c03b6990so320183385a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 05:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559068; x=1743163868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecS7x/s0O1iAPcbJIx2oQV+8Xzz6Z9tj5GKvpucvt/4=;
        b=VYYoUojCvriTrwN0tr11cGijNRt4LJo3vNBKitUafDW1N3Tnm5u7pcrAGG9FDgdpbK
         Dz+yE9zyVRW3b3CHe0b9zU2N/1ijdYO4WFU9DL3IMksVHgNyF8Bw198ZPM2HcnpyKKav
         N227DPG0DZo2AHuNASkz4eH44+9PpJadH/gSBKdNO4JAO3PmcFjlAjod1SxjDbWHglOm
         v1qEvB5xRM07Xk+tYBiaKLKqcWb2XZVGurhNFwMP+/QbOiqychgJ6nRo0QB2Vw7fWe6p
         RGpE/PMt/zn8oJwasQaua5Urjbl8toPcwKyQGfPMRJQdDjCOWoRuJQYVZ159NbLgDYf0
         aceQ==
X-Gm-Message-State: AOJu0YzlstyPuLNKaNTTxMgaJKn2N63Z6c0/0RI1nP5KcoZzqYmw5Yzg
	40cAAn07SOOU5B9BJ8vLVqUFQ0yRWCiUd5p4fTi5OBr6t+AmRQNlxzkdiC4W8WCWocrbu+4RC0k
	vGyjCI9PDKUXk1MfdNazREYzbhvaDHAMoRNjoMOUUdw/BrEzW3jFj5pU4G4Qu6+PkVLZN3++PIR
	gUFJ4=
X-Gm-Gg: ASbGncvvSTaae0ZRAAYOK1jsswsi0LnSmfbxoIejyzCF5Oxq8KbkeRR/DolQxgvFvEi
	/zT4+LRfuaRxjsSpNdoqJFGUbZQFeXa+bc47lcIydSglE+j7reiUwtwqpILJ2OCCcMei96XXYLO
	Ml+Jb3Cogmmu01Psqq/ZGjm0ySD4L4H7Cf9QyU0ck0v0a0UHuPTqZNmNeg0waetrkE5gXqA54/m
	wQl5C6muf/UiKVlmiTrufEpnmzKh0d30WsvIsefhcfdEEMk7SrS8utQwRda/plS9XAzo7h4NMOH
	FZTKYl2nfqmtyOzfBjJajWbSkXPS0KkBgHkVVqYFf/gy4t35/mXSAaN55IvbzYatw/g36RhAESa
	bH0A=
X-Received: by 2002:a05:620a:394a:b0:7c5:3c69:2bc7 with SMTP id af79cd13be357-7c5ba1302e2mr383153985a.5.1742559068231;
        Fri, 21 Mar 2025 05:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxLoazjUl/vj1wcCb4wnbDU5/bZnAIy6FLoujDUSh5G8eP68xIANQkQY6OiGlGctjrDxdBqw==
X-Received: by 2002:a05:620a:394a:b0:7c5:3c69:2bc7 with SMTP id af79cd13be357-7c5ba1302e2mr383151485a.5.1742559067898;
        Fri, 21 Mar 2025 05:11:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64806dcsm166745e87.96.2025.03.21.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:11:06 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:11:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: update qca-qca61x4-usb package contents
Message-ID: <4lmv52leopzotx4m5teojfrpjqbvo6lizbkxhvjheadyz4qsrv@a47q6ibyqzds>
References: <20250319192325.952672-1-quic_vpuar@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20250319192325.952672-1-quic_vpuar@quicinc.com>
X-Proofpoint-GUID: Je1XuH6s7bZTVeVY3rhTjxVwiBKmSFxF
X-Proofpoint-ORIG-GUID: Je1XuH6s7bZTVeVY3rhTjxVwiBKmSFxF
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dd575c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=u0vRAmVh3_OemV0DXGkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=930 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210090
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213445

On Thu, Mar 20, 2025 at 12:53:25AM +0530, Vivek Puar wrote:
> The NVM and rampatch files for QCA61x4 USB chips went 
> to qca-qca2066 instead of -qca-qca61x4. Fix package contents.
> 
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  .../linux-firmware/linux-firmware_20250311.bb               | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

