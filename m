Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B816C83030
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 21:09:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.52233.1751317757717351656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 14:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bzWdYvG0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFtg6r002603
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YDlNRRq/4bb9wEYKZGILQxIt
	sjgwYx4QsCV7vn+tCwk=; b=bzWdYvG0g6tIrzGq33T32oaLkiwyyM/Rvrr8DdFq
	vo/Q1EjeJfnJznSkaIS3N+vN7aLnzKcgqiBxx/OViUE4XeaBGN6NPyDJIVuEAaid
	u7iVG1FCVevwuYEXZHbOqKxoWi7cgCiqRuPdHOxlrCl0h8g33CP96c937p16fSBC
	HVoejmPWuE6Rl6jEAl9PHpBVXwzzjWCjjMIbRND4hS9e9VwVnwn1BrO28X0xlcH0
	NamfHN5RWUyQyta2/SnRspr55w9OINgli7kHl66IE8Jvkkp3RU0wxeyt3FXx7Xfo
	seYaxwVrm28qk5etg6q+48yxesfXAEf6kl179DsUS0rhYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcp3a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:09:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad2a25b65so46284246d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317756; x=1751922556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDlNRRq/4bb9wEYKZGILQxItsjgwYx4QsCV7vn+tCwk=;
        b=i49QV6RWJLCWX7CS3ff6EKj/lJphK7fieZmYQK+krknnr6t2WfCFcMZbqUJWApUYNE
         VmK1dkdaR98C4+11ZgRqS50Df+yT+q6M1CttbyBtDrA7mTTiU8bEWCSdM6WWkgcicrYS
         iAZGQoh5+e+6SfvvfBBKLkL8ExAnYF830vlFVGAlFAUQGHLhwh8MqtDau2aNTbPxIEAy
         iDvkrR3nQid5CMRuEZFnIiERsJ84TqFWIA5MWWMdo5guC7aXVWSdngYx0KUE3m6tiTRp
         K4HqeFod2W+HOiMBOODbRP7onKg6qBtZcNAJNLg0J64fKGcJ9pjEzDoiSswRpEPhzHvY
         farQ==
X-Gm-Message-State: AOJu0YwnASCEywvnNw9TUt3UfORGAwzlcqnLS6caubI7ADxPF4TCgX5k
	zVV0rGChcXNo/Arwc3+3bfRNf8MySatuVNvq081Xm4zjBK2ABZfrwYBga4F+MFyEEa0HY1ZCiXS
	bXNbOnr/G6lK8XvkylLk48n+xkD2QrVk6Py8OeZIR50HqdhxOOC3dHsF7oiv57t+QPHt13wJRUc
	RCkMNCFVI=
X-Gm-Gg: ASbGncvo2p0XtI4wmDbCay2MT0Z/wn2rXx8+SqbEriPTu4Kvafj4EeqAU+g9kQl/E/Z
	sNoR6TDOuXnRZx8AsNgK5tlGbznrK89zKRrwdDpMcWhaCnVGnFrNkQKx7BXOymoIAtbtG65/49K
	PWm95pTbAlK6ezVqpIv6/+Ual6eBtEwAqGBEJJwBoa4hWtTOKYo/CxSA5Nl92zduNUjY7vtsgEg
	CcNuAtl92OICXQIeuzydWGW3KK2Su7GWDDI7BeocYFNrD/t7zKhvSKalSOexXS12O9j6fVz9Bz/
	14IR+Or0lspGE1kNXlEgYVXxveq0FSk1q9iK6AVEU38JBYtFi0oKX16/48+QVEmZ9WwAbw4WZri
	+cLlqu5T3h/bPKp1yzGfsHvMp56l+J5DFXY8=
X-Received: by 2002:a05:6214:ccb:b0:6fa:c6e6:11f9 with SMTP id 6a1803df08f44-70002b08277mr196106876d6.11.1751317755608;
        Mon, 30 Jun 2025 14:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHkkk7KodN52PcfxmzTsuwtsmQ2bgJhE/005KOtIxvOxqOOyEkdBd/u9UavFWPh6ly/GeheQ==
X-Received: by 2002:a05:6214:ccb:b0:6fa:c6e6:11f9 with SMTP id 6a1803df08f44-70002b08277mr196106386d6.11.1751317755060;
        Mon, 30 Jun 2025 14:09:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a874csm1556888e87.91.2025.06.30.14.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:09:14 -0700 (PDT)
Date: Tue, 1 Jul 2025 00:09:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/3] linux-firmware: add missing license
Message-ID: <zw5sas47rawq7difpzh75o7rz3briugennfgwpnez323fkpvtj@e2mejojy4jgh>
References: <20250630194803.2279528-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630194803.2279528-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: ryqi7GHv8LT-2dBj_ZebAZCNm2O3Pb6G
X-Proofpoint-ORIG-GUID: ryqi7GHv8LT-2dBj_ZebAZCNm2O3Pb6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE3MiBTYWx0ZWRfXyJm2anaupWoG
 05O0os3zc4M3zzcT5iWIN/OOEQNHvsJcv17vIohftaO8FIzvgXY8yk8XKCGeo9/ERZ255sJOPJs
 up/TShBuqRUiGLVSdGPl5+Hm0PhgE9uykXoZArioGSmd7FiMogWZwFin88HAiumac2B1anH+8Vq
 RDRYYNwowAqldOQc2OnYENaXC5/Jqgm9643A9PGaBI8XCTADsFcFO/Cyy87xQQzyP97r/lN1sv0
 dk+ec6Xi6udPl+511IcbD3TaFeIgK9y//0mA1+RY0mJhqVvXwzZM9FAq0qcFyy49fPN4bHnN80z
 YoIhY21qlEEjD4qJRmiceIUJk6Ie0xR6pChUC0oJd9Ts5U3Au9PnCfw6dTBxkmMph0qpjCywiQf
 L/JGK93OC9t7loVkH33Z7Ma/JnXRDVdmzXPTr2GN5IAJnw2QeW4x6QWGdgt3yVbiNkD8+cPq
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6862fcfd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ak8_hw8EYB5ILp713PQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219540

On Tue, Jul 01, 2025 at 01:18:01AM +0530, Vivek Puar wrote:
> Some license were part of the linux-firmware but were not added to the
> recipe, so adding those missing license
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../linux-firmware/linux-firmware_20250509.bb | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

