Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39082CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:42:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3179.1759164160185155762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IqV1qVEd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TA44iI017780
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZI9kv4umhuCTNdXFtVTYhsZxxKfVaQ0ijAjEnKZjb78=; b=IqV1qVEdAU9D2SEj
	2z8e8IHo2xJEBrDkkbrLoH6KOoMBg3ml8lpdbWBVLIAY82BtD/ymagzGu4Z7F6Et
	Z1nclShiiPKhOE28Rk1f/17n6aqW8I4NcGTyz4zPkyHtufbFSe/zayi/0q8Zn6Q7
	e2Hcqu4UF8sxSeCcFE01Dr6ziWNLKYJpjR01IfyGvDHzYAM+tyU5lM2uD1r2eW1H
	21047JBNv2dhx/4C3GFKpf1LneYb3aRB2tL1W0hOax/Ofs5SDINTcyaB8F5JxsCC
	Dho/2WiO6bjJZ4HD+FWzKNyWcCm/oPB3IqhE5yFexcCqQEjAlVRJeJx2m1ONzXW/
	zLFPHw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tp382-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:42:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so3381764a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 09:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759164158; x=1759768958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI9kv4umhuCTNdXFtVTYhsZxxKfVaQ0ijAjEnKZjb78=;
        b=pj/B5tJRKsWHX6cRh4xKMWu1svo192kps4+h37vo/cGfeAEwGrz4nSFUsdns2rPlem
         cZGbfGguWejPxBY/rxnBvc1FOvIIgs1ayL+xTCjqLQSMo0m/j1Xul25gewXygGkpt78c
         nknd3vQ1uANR+d5zonxn4rTgviaN7U2WQJ98IPCitvitaU9mWIinJS6J0iBmbncZgBtd
         ymzSzIQUgnogTVIIE3ynpholWhaa895sHeGUbfF+n0+TU0LuwVQDtycOo4PoJSCqJmRV
         WxFxUnlsWPPnY2QHJyQCZ5cphaS90a92QGAYGjfDav7xUc73mgGHA2nluS+nO6ueV/HZ
         XisQ==
X-Gm-Message-State: AOJu0Yw/S+52qz/kdLpOcjzR9X7r+qU5E8WvrRlNuB1Tgkxbm6cUcbee
	nZnS1YfdoJB65hQeslHhP26BOrpSwQj/pgrlET2HY5bWaDaV3Ow2ChKAwlpMp63exTWB+39tgAK
	LsxdruJQjlyGe8yCkwNGwxxb1ktKHhrYwiKr6nRCTia46WXMphujAWPEDbS9Z89ADXi6+ZXuaGo
	aGwIfIN/lm6YL0We60lOHvWzo+uS4gG0RDU2+vfyGlzgxMgfuWFMftDFY2kQ==
X-Gm-Gg: ASbGncuK8JEBbvC4b4HiecrqtgIqnF2uypPPL7BXBZoZI0zB82ntcU0ZBZNrBhV1UCN
	B2xQ6TY3AocZovtjKk5RKOCZb8Ay5XPGcs5v8Eum6VFagajqvZpqPM4buzlsDWEIFBTp1yMittS
	VKPUociuAnBtLowD/wYWkIA6VRwBlZFIe22iUHpMa5N4iTaDqg55ujG78=
X-Received: by 2002:a17:90b:2245:b0:336:b604:78be with SMTP id 98e67ed59e1d1-336b6047956mr8452494a91.25.1759164157885;
        Mon, 29 Sep 2025 09:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhd7iYStFLPFZpOnRa3xp6MvgYrrlx879CVMSn8yy+J1AdGPxaqvPSn9jkSUzXeh+WBbyM1vPy8a1QIhYrcgw=
X-Received: by 2002:a17:90b:2245:b0:336:b604:78be with SMTP id
 98e67ed59e1d1-336b6047956mr8452472a91.25.1759164157431; Mon, 29 Sep 2025
 09:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250929161225.1290751-1-kavinaya@qti.qualcomm.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 13:42:00 -0300
X-Gm-Features: AS18NWAMlzlDJi4TRJMTFDXnubys84fZYwJiJ5z10te-e6G90sYkbEfrAp4OQHU
Message-ID: <CAA_5yos1jzc55U=Ct4NSt9B+Mf_ES8yx0YKSrSYu9N94oTHc2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/1] Add support for custom compatible string
 via optional parameter
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX+EluxBl68+8B
 k8PQlyX4Hs8UrjiiqUA7ou3ezGSeoG/i41EOo5ojg11Ih4BsieDhU/LMZzjYg+jGjxdm+1qXBjq
 pr1RuKnUXF6OwVX0bnVhQ9U1llcf5wDt24DwPIDuF6yLFVG7w0Kc9SfiHkg4N5eAI5LYMMqxvo3
 WHv+up6z2CatVWkRX2fzMleYKq1O/yPDp0mSdN44BWIC0aXQ7oXnCcBmpqIqc75yKznyqpKYF7b
 v5zwxoltf+IPdm4XN4h6Lzya2ji/P0shDuthAnve5V2EBiyJ1ciawTpReE8jg5a/ITQdnqzshZl
 LMt72BWk9XdeGVBSBnOWAYDAZHh0KiooXJbzd/IRjx91wOcoRduZbpmtBUnvd922kbUhmeSChvT
 CeTsXqHuWfn+DZrNNdiYIO6e74rZxQ==
X-Proofpoint-GUID: EC7-aFIE4pDFND0cQbUBK9vlCgF13y7l
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dab6ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=Q4-j1AaZAAAA:8 a=BGjT--XvUAaY15OPQ34A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: EC7-aFIE4pDFND0cQbUBK9vlCgF13y7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224156

On Mon, Sep 29, 2025 at 1:12=E2=80=AFPM Kavinaya S via lists.openembedded.o=
rg
<kavinaya=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> This update adds flexibility to FIT image generation by introducing
> an optional mechanism to override the DTB compatible string.
> Instead of always extracting the value from the DTB, the generator
> can now use a custom string defined in build metadata. This is
> particularly useful when the FIT configuration requires a different
> compatible value than what is embedded in the DTB.

Please provide an example showing how this will be used in your scenario.

Cheers,

Ricardo

