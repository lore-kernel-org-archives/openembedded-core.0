Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C57CD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 23:48:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5798.1764632904242356159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 15:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=MQpj5tlq;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=gUcvY+9L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KA1Dt1740533
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 23:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOv18fWzB1GZF1ekBdPk0vOG+OerqoyjC2zFhyGjctk=; b=MQpj5tlqB+1i5H+w
	TnCDqatDqG9YbIijia5BKmlSHBTsu6lHg7jHJOSZywzj/zMZ2sEw4RsiDmIiyDR9
	/PHgSbYoyECB61uI3M/LQ+fW0osKX1K2B73rDqs3NIMIGj/IYhnU5tsd/CEZA1PS
	3AwApZBRbs0aqENBo9P8Jrpv0709LuSu7M04+dWg9laYxGKpdhzvzWYNgpEL/oZ3
	pBmbWEjAH2LZt/eAsBTbJU7FWO+LyrWCmHHL9Uayk8R0NI5aOmLnWEUskYKcAaXK
	umub6yKwomLY/g4JPieFVi0D9kxVbsAFUd3WPg8nuWFEziTme+C1b8evF053owsr
	+OssyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ashtkrkh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 23:48:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so1125469485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 15:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764632902; x=1765237702; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOv18fWzB1GZF1ekBdPk0vOG+OerqoyjC2zFhyGjctk=;
        b=gUcvY+9Li/IRMThj8chV/6c1Xu2GlZ8GUh8RbiMH1PRgUjLPkmIgv7wGam6oLfh58s
         x2d/NxY4oTn0QCYXAtZXE07k6GayAbgQHlmC5v8oUqn9QZlG5sHfbK0Kfg8goKgTouXx
         uikH9O40T9LU4b22B91i8thKpyTTPM4vamD++pFOeae3G5h4/0R7pKRhBs9gayZtcuCW
         cga15eQI5572cfX2I8NSs27EDRyoUoT8xTROd8MT9RwY5UfJHqWKbgaR7NEYGD/WqOLa
         qLDH56rxTW8pbK05/OcZYh/PcdrW5bRcgTBVmlhSGJ9Y4SLEGMTWmwrcGGtfAPRMMkQi
         vffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764632902; x=1765237702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOv18fWzB1GZF1ekBdPk0vOG+OerqoyjC2zFhyGjctk=;
        b=YJjCUyc1WANTnAKL4Ar7Nx18DWjqy2Oo4vJ4UcuYHd5PiC8j/46qdFJk5J5ugPNN0w
         RHLBWpc8sXSfaf0+drMaiGgjDcaZGZEfenYNc2DMk9km6o8UyV3AnztuBQJx8nxbW7eq
         v6yVENazezP7+G8Heq/ERHEyYYgFe3OKMH2apGH8SD492FB1BMUWyeU+v+4Sfgn97+yM
         E+Bh7Kq9Pvs8raNrMEPAC2SPIjcgHHytWLeMAjz6bO1F3BwgxUUQXkAhvd+fiaQP60ca
         pjhZvQjFxE8jAqOhJkW4QsWuMw7Ok8ua2zD5fAd/5Z+x2DC409FObHZU+WMl5Gpq4vyc
         w8Rg==
X-Gm-Message-State: AOJu0Yyc7+dtFHhzfhUaLN52tOtUjzm4LYDBLkyA+3tD3FEo9heAjJTn
	5HUo1zFS73Unn8pivOVYeKc0t5YPJzw3vLHZrVBFEab4AdXPXpjfLWTcHwUHRbvdrYhEW2gjsZu
	HGdmU4FwMIcJ94YvO7TXjeUgwu8rwc5N2No5f+DEktKM4D6ew4+LeHlM8lRLYTc3EetlhbpIqcV
	xsU7A5Wuk=
X-Gm-Gg: ASbGncv4O5EKkTLMTNSGR9iAsrl0Dj1D78mquXaSfqi/pzIDVvCSs2wgGEx0gIKNpH9
	yPDRBbdLojFOLj8ZDr2FP9+foJjssnv9S+HRqu7W719vfma/5vnEnTtnOUEVI6iJmrMlYXpeASO
	e0DA5P2lceZMq6A1mKAbxDzfpTQXW+uhAOkuUGB01YDp6uECUZx9/WbWhjbKqFe55NWvo2Kkqmh
	sCYZA0w+t59zSSHzq4L8nxBBweBYveOWvllT7UXBOafTOLHtNvGllTLP1uQMULRCkt5/HoiHgTJ
	tQpVxFmRUYL21t9FhwJOLC9Ng4ttrkl5VLAk3YPaL8iynlWgFvJjWrn4GOokFX9rB/qegIjGZ+s
	PnOicBewH8WSBUja9RhH2DzPbNaT0Ko1SA2UPZoH79SLb9kO1Qv7aZsvmLlMXgzAYAT6jNY8EGs
	oj7xqi89p5Og2cehpIE9cjhq9BBJBS7eIblascYfApdUfXx0zK9Q==
X-Received: by 2002:a05:620a:17a1:b0:8b2:e38d:2f03 with SMTP id af79cd13be357-8b33d1b13acmr4989859585a.9.1764632902282;
        Mon, 01 Dec 2025 15:48:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5+zgKjELc/OkDZKQthYj1XtPaF1XRTcgJJ+jytwMHAXgV662GtrOKlzA+es3/U/syqx+jCA==
X-Received: by 2002:a05:620a:17a1:b0:8b2:e38d:2f03 with SMTP id af79cd13be357-8b33d1b13acmr4989854285a.9.1764632901675;
        Mon, 01 Dec 2025 15:48:21 -0800 (PST)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236e6e5fsm33929241fa.18.2025.12.01.15.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 15:48:20 -0800 (PST)
Message-ID: <d066656a-dc2e-463b-bac5-fc56b48fc859@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 01:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 2/2] mesa: drop freedreno-fdperf
 PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251030115415.2566247-2-dmitry.baryshkov@oss.qualcomm.com>
 <C831BC71-F6F4-4D2B-B8C7-BDE128F16745@arm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <C831BC71-F6F4-4D2B-B8C7-BDE128F16745@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-GUID: rhCPeERbcZm1b2cW5yP-3yb9gL5nXErv
X-Proofpoint-ORIG-GUID: rhCPeERbcZm1b2cW5yP-3yb9gL5nXErv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE5MSBTYWx0ZWRfX9/QlFpZj01ZM
 oC6KAMeRhiAzB8fJYykKVvxpAe0TjZwTKVDSo7zdJPrnmQK6pa7jdxZ2K6gbJB/pYetI+UQ9+GI
 PwJaxNmnYXzWBKPipuSFQS02PY3BpQ5wKm3UIOV9n/9++IWbt66aswHMih5rgunMZEuKC+FaDbe
 bqiuXXUomjz2ogVRg8T7dXguqA/bmiqdIgr0YEijB6DzgNeQLInkTTZ9wZUy/9mIdXar8BbWhgq
 Yh5j1uHV+uTslx7KG3lWGcnP0e98K7DGLvC9fZpIwvy4mScF/+S0oRdVhLfr1PRNqUD0ORvQRPt
 ZonlKzYUYQx61dXFf0xZ9YdZ9vA2UFoyrvZZiJO3Es1Yz+jmNgLUxyvJg8oYx/xCTqQRLwH1d4a
 nldBc4botn6UeaomP3HAcflu/WVM2g==
X-Authority-Analysis: v=2.4 cv=DL2CIiNb c=1 sm=1 tr=0 ts=692e2947 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=AKJX-EpgNPBJPy4Iw3kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010191
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5B1KA1Dt1740533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 23:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227140

On 01/12/2025 20:00, Ross Burton wrote:
>=20
>=20
>> On 30 Oct 2025, at 11:54, Dmitry Baryshkov via lists.openembedded.org =
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> # dependencies for tools.
>> -TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ' ncurses libxml2 ', '', d)}"
>> -
>> -# the fdperf tool requires libconfig (a part of meta-oe) so it needs =
special
>> -# treatment in addition to the usual 'freedreno tools'.
>> -PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>> +TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ' ncurses libconfig libxml2 ', '', d)}=E2=80=9D
>=20
> TOOLS_DEPS is just set as this now:
>=20
> TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' nc=
urses libxml2 ', '', d)}=E2=80=9D
>=20
> So just merge those together instead of having two assignments for the =
same configuration.

This is exactly what should happen. The first line is removed by the patc=
h.

--=20
With best wishes
Dmitry

