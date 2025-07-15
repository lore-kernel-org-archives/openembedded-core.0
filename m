Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410D4C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 17:18:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.987.1752599928761418060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 10:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iEB6HH0L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDD9j024478
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xHeq4+4mM1xKnhwJacfGknIDqJRBloYD47yToeajqE=; b=iEB6HH0L5R5xXKaF
	rS0hjRsGT6FHsvTtmdyPF1h+MDBPWzGi8+mKFKfiUUfc4J32SWXCyR7hpLbeZiE9
	NlPnoflKlCULhJX7OIHZuOAeTIJ8EKMLOknBqEn22n1K6ujWfJKvQXoRiw264E9y
	gGCPB9jqHl/KD1ON1PWc6dTjhFcKo3UvHy18VuCE0HP2GAnChbcq6L0GvyH0vh2T
	h+Abz4MO4l8Zo6/tQnpznaITHrYUI1qsThf/i0juIIo8k3BOCgLqAxuYKi7ovIHP
	HzWXdMpzALepgVJbknwzHAjVDIYbqBte6WchmyoSKm3aJL+VJxtTTYJvA9N1SrqS
	uiZRew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpbyqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 17:18:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so10047595a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 10:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752599927; x=1753204727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xHeq4+4mM1xKnhwJacfGknIDqJRBloYD47yToeajqE=;
        b=KZ+JrX91CJmnmeBkHqAVggyC9JebhZjke/lLlYE0TDFiMsFHpYBDWntrcx11JnDwyg
         d3gn3Rem5OHK82gBObnIyu5FQEc4g5Rhpac0KRL7RF73NV2USw25QDLroI+/oGkfKR3f
         8vMkHJzGeONMdjd/d3osjB4to4/LmU0EwbldfOf9LHXQQFEaxIWRQwCeZ84+zA+LWcyx
         3y2EDSbQXP4ZiesUj5haC3I3xbbE5HcAuYXaVetHaUcTyybJcR5UKAEBSzBPpyWNPUMQ
         JHGikkiacGC2qWwQgH4ywtlFMRXFzsxSb+5Z0zoKzlic9EdmW0C7uZtq1LSSAvQ+RYPj
         jYww==
X-Gm-Message-State: AOJu0YxocxzL+1YLZ5uHHh7IE0UfkQK3T+RI9vH4kUgQa84PA3EQSswR
	NTtpu5Pb1jgY8izGqXucO7UI3rxWuYK1VKWlr5lyXAONKrg/J7PUw4Nh0cDQ6r9cayW4eKRc3Y6
	4XQ3GO5RQh117xYtAlLJL6SM+/85EMucn3nGPfOGgamKHMEz3/pMHrb+9mBjEBAA+zVYD1ILmsw
	BaA0CV6NcvdYrQpxbljuyLsTNd+rlqsIQ2mv4mc0PpLKWpFn9G418e/kiLEQ==
X-Gm-Gg: ASbGncuwy3fBjdsscv7GS30ZDP+uYE/WqDeehj0luBRSKrCCcaKKDhl3tGY0HwNQNPa
	7kucdAEbyjpLteNeImstXJhk3cPDx5hygD7oQy4Vbs8HBfizqKxeokqDxVTFYFLotCHZnydt0hc
	1wlehUQubeeLZM9VnM5Q==
X-Received: by 2002:a17:90b:2b50:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-31c4ca83b5bmr25366998a91.13.1752599927275;
        Tue, 15 Jul 2025 10:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHWGolqaSGJSL9gXYrPmMXA74G24Wj89IPN/ooECm1z51d6FvFrLMiNApfHAkvlu3hVirrUcFMo0wZcXK81c=
X-Received: by 2002:a17:90b:2b50:b0:311:a4d6:30f8 with SMTP id
 98e67ed59e1d1-31c4ca83b5bmr25366946a91.13.1752599926539; Tue, 15 Jul 2025
 10:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250715143139.1829393-1-ross.burton@arm.com> <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
 <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com> <CANNYZj_eT9sKEBORBOPdCSbh86N3eTngJ6qxQexbpa9oo2EbGA@mail.gmail.com>
 <42374d49-7520-4aee-9c47-665f807dd543@oss.qualcomm.com> <2445E616-D8A2-4480-AB94-DDDA2E37336B@arm.com>
In-Reply-To: <2445E616-D8A2-4480-AB94-DDDA2E37336B@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 20:18:34 +0300
X-Gm-Features: Ac12FXySRfUy7HYaBrhC7V6J3kb8uy7_11NVMbF31lz9kgMhM-_6J_SNqO6brz4
Message-ID: <CAO9ioeWVpBeRY0xhOaVEP8NN4YXU6jrvjq+hSCwQChTK5jDqYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libclc: split out of clang
To: Ross Burton <Ross.Burton@arm.com>,
        Quentin Schulz <quentin.schulz@cherry.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1OCBTYWx0ZWRfX7v4ZI0DBLXia
 A2COvTvhFhYhb8PTNmBXLjfAgUBdXGfJfCqHo+7LBAjDtMMliXBM0SkdsLC7oMKHFgxSBBxAlJD
 z5J8DB8aybwdNZM023ZXpMXIYNy+R2TX7h19G7l1QKa4yy4Sh1jlXFmOwANdWTAY8irq67iRZx7
 SRTZmkqVVwkgiR6QtyGYwfZnZljYH18hK8pJCQyvEELhSt6ht/SpJ8wFXnAoKO9ASXUly+nTdaQ
 fn9Qm/QSfLlkgM1cVPj4gJffkXi5clilbBo4aUcmLHL5DoJN79nRhqfCqU1nCrI3XXAGURC0L6a
 mgJUISihKDaRgizCaXkXpxcPAPT0N00HES9HAiHYFSloYAH1D/CSzoKJrsfF5dvAbPz1/d3nqzh
 Cl70wlTAGUkWwwGOaKhoPMmPqZt3Wv17bqXYiYLfm1b+ONAMo3x79JrCWNDJpP85d5H9XpK2
X-Proofpoint-GUID: BY3ii6g488F_TD5_z7oUd9H503n6c4lB
X-Proofpoint-ORIG-GUID: BY3ii6g488F_TD5_z7oUd9H503n6c4lB
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68768d78 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=04Q8pBaxhybToRBeUjIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 17:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220408

On Tue, 15 Jul 2025 at 19:29, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 15 Jul 2025, at 16:53, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm=
.com> wrote:
> >
> > There were patches to get rid of the second clang build.
>
> That haven=E2=80=99t merged?  Can you point me at the discussion for thes=
e because I=E2=80=99m struggling to remember what ones they were.

https://lore.kernel.org/openembedded-core/20250624-mesa-libclc-panfrost-v1-=
0-9ed8ca980e21@cherry.de/



--=20
With best wishes
Dmitry

