Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E3FD11192
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 18:41:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1428.1764182504018859331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 10:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i/vnY6Xi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eLwgju29;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB3qot1667760
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KsNQX5KCkjpprAP2fvTegrcb
	Kx23G2UnalzlokWMruw=; b=i/vnY6XiA95u1IkVzYjyXXyA+eQTZqZaDj+gCXde
	WCR6Y2LINysxn0lNlkuk44SARND4ztir0fsXmc2Y0r5LW4XIZE6DNB+pcVs2lMgZ
	fBKH6WZatgqa2QIW9TJ6JgiWJPeW13RVQ+ceLs/NvwJEy3yUaR9OZqNdPBKynVMj
	uTocWuDGw/SzIEjBcO/JqlqsSCWo04CXTzN2iPmv3ssFe7bsirTryne2sLWa6bi3
	GJjVxfuBjXlFZAG3BrkhWY0Keq+9DkIIbqNTYTAA5JxUhevJEicX4MmYOPAOR7Nt
	P86KwIAUsY1bA2Aw5C3ZbHr6+9iZ+ba34JML00dmstmNuA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bms87y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:41:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso44758a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764182502; x=1764787302; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KsNQX5KCkjpprAP2fvTegrcbKx23G2UnalzlokWMruw=;
        b=eLwgju29dhCANqrQqhQG7JkkD6hXs0c+grE5fQ4Rv81Xgpa62ec/RO/8r9VFDCHSzT
         c3yhjgqncLwCeF6AScbY9AOv/bj5M14WKSuukunF6t8KcOCbTMKsTgSjNGNlH9uBDyBD
         QlkNrges22j8pyawt+CI9iZnzBZj6tajnkxNw2bamfF8nMS+br6nGLsIc6/ThXKUSIzE
         4FD6c+Fl4pdHokzuizkH5bp3g7PRRc3px1Utm7KDYuwrMrVM/R4QvgpfUaZbOJ3xUNcZ
         Y9lra8wpZsDSJrHtnyhmJ3sWUw5MzFumdPHkDa9YATx2sArMCx9uqX9iYttCLnNOm/9F
         DTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182502; x=1764787302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsNQX5KCkjpprAP2fvTegrcbKx23G2UnalzlokWMruw=;
        b=BGWURngzP11M0e/jwSWPe4ZvcWZPbF+P64WUwik8vmiE3MP7sVWbgxKnLDd15CjyUv
         k3G2ViyesZFefUL94TktqDOtXUEKN1YGd7rlVOeDqA/VJMyQRTq6e1OV6lG4gnNi4TvE
         2HI1T4qPyOeoMZesc6ED1mQk//CSXMrSISKaqYjN6gfZ6E4iu3bhR7F94Yq9WhOGhRzV
         l7PR6/CSrLRHPbPLfJX2yToOmx5lj6IGrlKTUKHrN2iDqTjHtsNqc/3qCsQkVaiGNSRF
         VF4W+4YmWenzp7v0Hl1D/yhuyrBa7hC6i4PcPIo5E+hCU2r4Y8hURPVqXn/nyuR/xf6l
         MonQ==
X-Gm-Message-State: AOJu0YyCC6O3rqib2YJhVYJ0qkltVsnjTLA+vQY/Ie2JxA/w1YqeuIE1
	rjeFTRKjmVuEkD2T5Cxaq+9GuWyZCX65OWIpwP0SOSr+cgS+oNlxX3nlR08qALDP5+R0F6FhJ2V
	2AfSemSiL38iOY2jObcFj5CVnCJIP6RYImcvCPcY3K7kXKS7tTzi85JnQk7/xGXjTN7TN2Z60pF
	fYkSb/cenEFzKmB47cdYxVhZmPkvw/5m92jU9dnpivtT3EfF2D9reKLdRK4M0k9vgFJw==
X-Gm-Gg: ASbGncse+YHeVVbvuPf4NUjQDCKcPsEP58PZSeSW0OkQX+V/28BSPFojqVm+xMq8gMp
	LiDaVCbU1U3H5Rf8a8Z/86ydI7nHWIVcF8lFsqQ9+y8STWj7TK429YTa/rDs1X2Ayn9J33W0h9p
	GQIFa0/bfZxBfOyaVc/Ve56NHNkBX4QnW4WXMnlp94bvZ64u99Dzqs3HVYmlibPawclUWi8oOZy
	bbXTxWL
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-3475ebf9b44mr7594587a91.12.1764182502010;
        Wed, 26 Nov 2025 10:41:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAXUzEyqCLAvk+6D84dbLn9j9A84h8OBtuGXCtkW0yMXM6NNGm0ccpvwTjv0fkA6I4VeaLJPOTNnlVq1cbYtY=
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id
 98e67ed59e1d1-3475ebf9b44mr7594568a91.12.1764182501503; Wed, 26 Nov 2025
 10:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com> <20251126140713.1414484-3-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251126140713.1414484-3-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 20:41:30 +0200
X-Gm-Features: AWmQ_bl4yAnLr4I66x75Bu6GEIyDvYujMeMFKWryUmBdPSFR_GM7sZsLkgoPj84
Message-ID: <CAO9ioeUy34E9fM71YdmiKWGOnRg4L55cPnoD-GBjuM_TUwtqrw@mail.gmail.com>
Subject: Re: [PATCH 2/4] wpa-supplicant: fix sed indentation
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=692749e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=CCWz0V2UZF_ZPnjAgsAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MiBTYWx0ZWRfX2WgfnsNTaMXt
 4w8msjuTS16VI0DRlxAe5rUErTSi4quv7Z6NykaQtGmc2GfQRpFHB10Q1B/P1htwo33LxavP1Hw
 UvEE1SNULgSLnDOTADNQAI5kVtepBinuz06JqcOlRsTThkWbdcMQRaD+iqr2ciSJ/6bT2D3LW70
 lzd1NSrJk8VQBCKGahRUL743NSX9lLLin/J33AqM/rI4dsHmr+BwazJeAuuexDyN5SZaf4IlpG5
 SmDMrdNB/neYyMO8c51MnS4NWZR117Gv7eNFOaOwvSnEeWJOkb3RYXIAI0GvcLEY3qJF80ryBfB
 0qMrBeBUYqMGtnpa1/DlkWjUGw/fZ2fJUtoB8DnS4ci+LjFqLNNNatO1JLq9cvdD8jWti5+dULt
 Oxrk02uCYYIBPJTsU1+wyHhhPvlIIA==
X-Proofpoint-GUID: jGzHnA1emIAxvZSwDYpofPio1lE60Odh
X-Proofpoint-ORIG-GUID: jGzHnA1emIAxvZSwDYpofPio1lE60Odh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226810

On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> Unify indentation of sed commands in do_configure() for better
> readability. No functional changes.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant_2.11.bb                   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

