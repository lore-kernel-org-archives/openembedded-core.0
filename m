Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E151CF6C16
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:05:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2097.1767776745877283550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A9AEXBBK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dCPuvDa0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073dGCn4091593
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 09:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAkuU5+IKm7mBR51jejcZd4ZlAgCMdEtVBhORXCRTWQ=; b=A9AEXBBKDVxHUbWM
	rtHaA4QDMsePnTm2+iaEov+sCuNazioCtSJL8YWj7bDKiDTGdGux4va02xCfpPVS
	8JkWfkcP5+k+D3Y2V8UmYWAWqu79e+/AMYK/xPd7ibpUWRD+80/BLQ3rsbuItpAe
	WtRaTlkWN/DBF4Rhw/HC56ZpNyPAETtFX+hXc3xCiQdfLl1CG3DPUpud5XCC5Vqe
	xOnn5vbSXW0dSaDN/MPBv3QjsRZ46eO8sUwe3HTY6OlNxkC6DDopnCzeXgUz7xHr
	cudWtaZkg5nB091L1aG7GkONrOW/t+NPjCdooaBC1NFbifgDTEnFAjvKSQpXRM/c
	/dHGGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunbtj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:05:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso24641046d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 01:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767776744; x=1768381544; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAkuU5+IKm7mBR51jejcZd4ZlAgCMdEtVBhORXCRTWQ=;
        b=dCPuvDa06iYG5f8WUVgC0Q2y28cTAa/4KF8V4lUVYNBEh621CAMcC07y5pu7JtfwMs
         IFJTmUybdrEbVGkq6llOv5hVJ7kKl/WhEYUwk9YiCHgxKIBH+xGckAUBn49GpEjWaayr
         mbH4s9cm+PrSEdcpKOQriPxOyc0yWw3k8VnfinzqNDz/s+6NcE3+gKoHvVqx6eyvRIrC
         cMkjQMRmNkr+J6bqGjqREue+QaTBCDCXetZr7GzKjpwnnrmORvwuUy0HnD2wsiVi7+2D
         9gl1hiu73Jhwn6OuEne/V1fAzMpn4MTKRRmQsqeBMaQLz1xzwV2ind7FA8mGqtcSmi13
         kYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776744; x=1768381544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAkuU5+IKm7mBR51jejcZd4ZlAgCMdEtVBhORXCRTWQ=;
        b=b7b5rw+snIycIfWDFQyAPtmO8dB2aXCKC9DAmsDGBtJzAUiunrGg2uqDKJvGdOaZxp
         bDSzdl1ZSkpoAER97kVP7fKiF+j9kY5Anh2G97zrPp3Xt0TLZdHwOrmr64jGAYtE7IqK
         fLlWBok0EbZ2ZiJD1Y3sUkCA8KiNtF7UfYgKSr64QHa+u7I5QUnSeQc9P9IGhBCMC0FK
         cnjpGAp8+oNvuVnrUH8nnQnyQ70xG58Bd5i2SlspFxhqWYAv+WgRif6cQOEAhFqRyfZs
         2jtjr1524AxQAF2e8WioMNaMpzV9s04ZcRBw9cIoqWH5PoxpswYuRqeSK3haPmh323/I
         tLWA==
X-Gm-Message-State: AOJu0YwnIfWi2k+2eJDNI+fNevEErzwdSOcdceXHmz7gZOh/tUcuT6mx
	dSXMQgzDR/lTQw7dhbkvyjtpJKqodUOAod+lSnd0mMkEIrvaioWcUnxavhoY4WdgLQ71qr/WING
	38dKZ7Isvjh2gd8qeM4VWbRkQfLy3iIvWs2gXNeraG+Rj/XV+rV+cSBI52pzhNk7c8ISyKPUucR
	Xhu8lHuaiRV3kfhsXUV/8+UqIMWp2/A+wLeoXlPbCNpQhS/rB1UhTHbxWkgg==
X-Gm-Gg: AY/fxX6MZZnlbvK2xDJAPIekUPzwyLCkmpjXRTe7sTvK1kqkah9az0mCvFxlZAqR+sD
	VTgQJMN/H1I7QHKlkjrib+1E0btcN9OpeNuf1ZUdvwRRXnEIFclkCUk6oGmENpKyrAP4tWcVw00
	sK1iQPE/Sx5GCdVC0eOUEFEplbyrrbAd4zIC1mhaaVABpvvMIeSKhA1tQR4ZL9t6dc
X-Received: by 2002:a05:6214:2e43:b0:882:93db:53dc with SMTP id 6a1803df08f44-890842a2657mr20909426d6.51.1767776744047;
        Wed, 07 Jan 2026 01:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtlKCIfFB6FpWVeHF4zgrs8/wK4ZsTpPX/6J3DL3KewqMEB9dJXbieyhsiEw4sKwy18oPNkL1WanykQrs9CG8=
X-Received: by 2002:a05:6214:2e43:b0:882:93db:53dc with SMTP id
 6a1803df08f44-890842a2657mr20909076d6.51.1767776743618; Wed, 07 Jan 2026
 01:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20260107063605.3838495-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260107063605.3838495-1-mohammad.rafi.shaik@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 17:05:32 +0800
X-Gm-Features: AQt7F2qXZWJ191u7QJ_6L5W2lMTHH-cBvNkaqz3AqWizG_3AUUqYfu_xwq5gqIQ
Message-ID: <CA+s=J=wMDt6CgKHF4G2xtgKQQnYNybEDGsDmYS=PE6fuiOZyyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] alsa-utils: Include upstream fix for
 unsupported bit format
To: mohammad.rafi.shaik@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3MyBTYWx0ZWRfX/GHem9BWU4bl
 71OLZAvvjfU8W9U0NL+8gmYO8sc+HT+SHQR5FJAL3QDTOziHQfJ6lFyuABbmGbe5KcR4qR5K+Xp
 9aJ7KQS/IYVt57WMhzy1zUDZn9mKVBW6ArYkN9SaIy4ttdgnk59L6GjmKeKOau9qpStITmo3zn4
 jxAguVHm2J1mXb7ECZKJgGLL5+h6ZJLbFBH2EOLYPd3xFqHY2/iOrtrddp4iDjo9IVL1QPyZO4h
 5aUP7rYNKw9qF8tczICQ+o4wAspdYVTw1A3ZNWUitKhEEvq/ZuDzY2AqV3UGziFU6QVyP8YRUN4
 gChypeLNfVyrTcBRnCympTRdSwDOMij2UDjTuXEPVgWwPNsEwSDVBPNptTWwLIF3ByLZDHKPHAd
 8B1fB0IMVwu063zWIWVuNfwjUTVwQz1sbRsqEyumqPAub4juwnyZ7cx0O1j9yjzeK3LWpHcd7JT
 WHk8wPsHK9bhtiuSuMA==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695e21e8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8
 a=Q4-j1AaZAAAA:8 a=Aj322w45A8rpz7RnV2MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=h8a9FgHX5U4dIE3jaWyr:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: NZDl6S8yvZRA5rfnDFwSCSg4QHbJlOCn
X-Proofpoint-ORIG-GUID: NZDl6S8yvZRA5rfnDFwSCSg4QHbJlOCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228961

On Wed, Jan 7, 2026 at 4:44=E2=80=AFPM Mohammad Rafi Shaik via
lists.openembedded.org
<mohammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Include upstream patch addressing the unsupported bit format issue
> in arecord/aplay.
>
> Commit:
> https://github.com/alsa-project/alsa-utils/commit/a12ec83fa93e16a76f5c57f=
128f819dfe332f96c
>
> Upstream change log:
> https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#aplay/arecord
>

There's already a patch on list to upgrade to this version.

Thanks,

Anuj

