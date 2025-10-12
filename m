Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C588CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 15:07:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.20409.1760281626000378889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 08:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dfJ8JaRo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CDFaMZ031630
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j21sKRf3FUlLs3WLXbPbe/gW
	BeXlNkwGgkUF/Wy9kH4=; b=dfJ8JaRosUiIHb0IU+fOlDqY+YvaeMbcpzdqHTtA
	jHEZz4Og0SxvzpH050XGKSkTTfx1CLxjhhuenP6Cqj4GWnezH3KCpCrR1BTKGN3Z
	Tw3HjPniinpxMao7M/1/WIAYzQl6VAOwY1cqvzHnKRdmPguDzvZn7YTWGKfIbIud
	ar00EMouYPs3+p7BoQo7tX8vgr4q6poH2CI4oi6ATUMq9E+SddSLMgSv/Ipr6YEk
	IyAZSLfQvWhTTQlf9TuDNAlHJ3bgrDYHrL1WdwTyPZsvzRmjWtMzIEpRO3SxwvIz
	4CH4FxIO6zxIZd7yaIKJAdocssvLXo6K5W4/l1aAfJ24iA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfert6jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:07:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e5b6f1296so196034036d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760281624; x=1760886424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j21sKRf3FUlLs3WLXbPbe/gWBeXlNkwGgkUF/Wy9kH4=;
        b=xAssNLbWc+ErMOqZLUXrYsOR+S9hfo0CEDDh3POyy7cHV/CuWW+T+gzEekMZgCf2PZ
         3BcgjNhByV4jMQxTlwsnz+hQbXF9CONkn0bkpAF3OEsLx0GBAmU710I0+aynEOT6lfJ1
         mLRpmMEBIaEUtW6NeHaOhLIzruCtF3YnS1wVXVqZ+w9Wur3KrAzqtYSr5NoWbfEZKEhB
         uj7Lbj3YFiVDDDk1ASInc0CLoa7wC3M/S5YJmApLJHgOLeoYULVQgR3SQGvTyr4jZqus
         eF167lMvQY6s6uPmic1iFEaCFNgVjBFEWhHJvnsiYriY0mCdaLps8jCPWjaukvsHWWwX
         QjwQ==
X-Gm-Message-State: AOJu0YzX3dNDZDA89q6THGw/4WnLs5UD7ExpwUFLl44y9O/xarRULzmQ
	Yy5qj6PpMmcjYISRUO0IPhjxx0MFoAXFpDDaCcuEzzxunFRvvAD+oddp7esqC2rCaDn4q0tvb72
	qSbeMYpg8KDllubyWsu4uh56Qod6v1ERxBMfg7vGWmpWzFR6TzdoG3GAsFiAEgue3LoZDrddwK+
	IYgz24qr0=
X-Gm-Gg: ASbGncu0XCnMqz64+v1h4Zg2DWjr0mZarkvtNC7ZIdH3BNFfLKUpfxAYr3M7M9dy42W
	eKc+BFl/ABJkZOSRd4S9+zZI8RWIQLur/ypwRWhvxtM2riDJ/QYhUld6YiV1Slivd56432us+uZ
	QmOpIOKpgW46RpBWKcsBbBl2fi8lC3yGF6vVI/QN7X8mA4pfo54XPoLLI30fcKx53tNPVPPgDUi
	WdH5fd+BJSDsZscw81gmu7Pa91KKOVIQ3J86vQTzTKFM0Q3qBCBNGyB40F2NwyibmkQQ9w0DYTO
	1GNIZ1iX1v9IpU2NgOTrfWg/Oe9ICsPlXI3yQUGEIeHPjhZsx00m7bJUMDA7jy/YJ77rS+46RWm
	WXgHW2dE39WUWs77jMUCc1xV1e1XRvGSW4aM2eW6lR9TzajPMgvG6
X-Received: by 2002:a05:622a:7e09:b0:4e6:eb5b:beba with SMTP id d75a77b69052e-4e6eb5bd42amr189483521cf.71.1760281624272;
        Sun, 12 Oct 2025 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr3PwS7SCRwXVzv38RAutfhA6NTHnxQ4OFkvz9Fc/mNnRrItqaWwPSpo4Srze7CMmROhj/UA==
X-Received: by 2002:a05:622a:7e09:b0:4e6:eb5b:beba with SMTP id d75a77b69052e-4e6eb5bd42amr189481781cf.71.1760281622588;
        Sun, 12 Oct 2025 08:07:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea1136bsm22135311fa.29.2025.10.12.08.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 08:07:01 -0700 (PDT)
Date: Sun, 12 Oct 2025 18:06:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] kernel-fit-image: allow extending compatible string
 property for DTBs
Message-ID: <zrwonq2yfn75ymhosfncxsrr2yqt4zbbdnllqelbea3sv577nz@nbav227oqsfx>
References: <4zwfavcdo2ukd2cwpk33jvnsmtd5agufejpwwacozm4owjuqws@6rpar627gd2z>
 <6802.1760242682153497146@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6802.1760242682153497146@lists.openembedded.org>
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ebc419 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=HQYkZ7pTOzzhw2dhwzEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 4Vn5BLYcGpIGF0lxJUUgD_TT8hBvnsQ_
X-Proofpoint-ORIG-GUID: 4Vn5BLYcGpIGF0lxJUUgD_TT8hBvnsQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/Mwb9TXAgUTY
 bXk8ZzoqZFJ8fA3wVB14GpDuib9CdMSX3Z8irWkO2QQJLxWaC0tKyICU01yl25VR/djOV33Z+Co
 I3HhcJwTo7z1f1EUa1IezVhwm2A3XFl07KRX37Ne4jgw8kQeNfvdVlGMSXcoRlfWgeDrTbxcdhs
 mOxZHF6jBHXS+BV+2JSJo/Qqo97HR/mrYqOF0X8S7xPWZkMkSDo+41PftR5Vn0fHK0/YYQ/9hWs
 doPnsVBjrwf1ZAFCQqjbLdItKuXJpstddst8OW0LmFtU2mYrs5W3shDcgMUWh9DImcnx4hCZn1L
 E+C9sztack9txbH7S49COmdtjtXyY7AhdubYgY0P3I8MPfD2EY52DWPG2fApBQHeCbN277tVUKl
 Gc45Tq+51gz5Cu1hFEOydY5LGqn/Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224737

On Sat, Oct 11, 2025 at 09:18:02PM -0700, Kavinaya S wrote:
> Hi Dmitry,
> 
> If other reviewers agree I have no concern with replacement of complete compatible string.

Please don't trim the contents. What are you replying to? How would one
know it?

Anyway, what is the plan to handle our DTB fitImages?

-- 
With best wishes
Dmitry

