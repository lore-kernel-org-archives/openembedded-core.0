Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF68AD216AF
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:32:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48117.1764865630734828478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=id+ORKZV;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=LoUZ0K2L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jouni.malinen@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEugr1159647
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 15:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xru2sxttw+FxDn+ehg83fMkA1xWwNXgR/zzJWwBJZqU=; b=id+ORKZVnLqCcgnt
	n/o/8I/ocd3yEgewN7jOFU1cOtVKSkG6TxowxIt9NfFpDLh1pEclsmjVQGLFxTTD
	YLdHeF4qEHOn+ZrzOGWAPPnF8+KZoNX2CWfRJQO8WEGN/Q3nYsvHolGAjb+hoCfo
	3u5vs/t3s/my33hbujIO0w5aPGrclgZppC7M5wXmmMURBUUwvCZxemVnsk56JdxC
	BvyCBjtn7U5tO2/RuPw7JHv2zyBJuZ2t9FklVXV8/cKB+8yu/sTwI/5eBL7Wof5o
	Jewopogo0WUwa3sjpzm67gDfWw6WpaF58MOzq4gBWSPX5c8TMp7HkIYmzahDKwKI
	4ykC1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h3abn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 15:49:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so134518085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 07:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764863370; x=1765468170; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xru2sxttw+FxDn+ehg83fMkA1xWwNXgR/zzJWwBJZqU=;
        b=LoUZ0K2LW6idPse7l55q8KUyRBZVHolm4TkqTHrUhHq3NdmwLMlctRMdsSxe3sCRAJ
         LbNL1HSKBnYxANsRv569jLwOXSCYv3t5Lr6pc9duthN4lYOw2E8z7j/K5E+G9saV7aK+
         MLLjU1LjQ2y0U9Yqh9tdelQiOZxu9HfkSPBUms2JjsW2Z/i/7uGnprdZMDr1TNn9fQeF
         UpiL7Hf/W3pyWYI5ACBogG04KbMlcL+GISXlxlNVK/rMc7RuyfhQRxTgHuset7zHmkfO
         pGeeoSiTxpoauTC2gkqxrSnxNp6KKhT65njYYk5kxkwYrJljxoLfEGrtBUuGOxyPTN5Q
         UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863370; x=1765468170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xru2sxttw+FxDn+ehg83fMkA1xWwNXgR/zzJWwBJZqU=;
        b=Gci4d0vKQsNAaNHLQwdhgeC6ozsl6DdljdAZEYIgSDpTvz/ffySM/BFccG4k/81sbK
         9oA4IBOZIGL7IBrMvL7k0utQqF8IKzttm5f9evaGvlkCgr8spyTdDyfKHzMSilwEZfal
         v9nf32+LA2fb/5db8QlPDOEtNgzzvhrW+o7DBtSjYrVCh99BQVi6TJh21L+cr5ozM6G6
         LCiYyylXw0JADk+b30mFZtxwMKn4j1ElGBKTf+Reg1ExtnYSHZTgCrFI7W5uDKKvQ0ev
         +Wx7Xgt1lTX2+f+ty5zZduQJwcRNuhCJhC0NBElI+jXWlDCKqdkG/WiXM0X0zO0pm6Oj
         uFZA==
X-Forwarded-Encrypted: i=1; AJvYcCXmDH2cYID2a6oOpwrbyb7rTRDlvj+JVPOiRrZXtJZJWMkSJ8nqRM47UfZavWdkxX/id4jvnn8WSIuqK2gihAIjBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxq145CZZ/cvVYnUsC7Jz9sv/VIHp+qEp5aZhSL2pXeO2diogwA
	wKFQG3IWpUdM5yCxs6jcIadRLacj+KRi7WtPQbyAz3LS5tqAjU+tsFYC73w/LYM35IaUM1AUXKk
	f6Dc9NdPKdNREl/eIW4tcPqeotaMGvfCY3LcIQu2v1GU3LJFdXgd64ZQ2CaQkkA5RV2f3Dh1yoa
	2Msq4PKqk=
X-Gm-Gg: ASbGncvpFn6DIPIOV2gyY9e1RwUftmv1YGHqZYnux4JsHIGjSyO7s8IJKwG5X9JujW9
	Vw9o0ThHl4eELvz9dFRSLoBJqotCLN5j1JA7JyIJA/p+jTQlTaiO7jsSjxjp7k9Q0j5EuPcFeWc
	LBo7O1qGIVmJ8MJBhiazgjhLmd8ox9ESoTunsij89iV5Q/lEpejFUlrFTtNVGyddgOCqCwCVxiw
	N0aoQWOQw7HWvTsf0Tary1nLQkNtUx2m3vjNYQvjIdbA9BGomWm3HubamVCQ2IkQucQFflBGDO4
	Gr3IjVcxtGdzU/AHLaiBJqx7UrP2BRR8qDDjpKooFCwM83/UHeT+GMPwF3VNq6azxoCN7siNw8p
	xsRvvm8iT9sjY1NZP3aqh6rxLWDdrYoQYfKv2va/zpcl3ToLCNA==
X-Received: by 2002:a05:620a:2584:b0:89f:12af:e55f with SMTP id af79cd13be357-8b6181ee58fmr469485085a.44.1764863369952;
        Thu, 04 Dec 2025 07:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1erwIZnAeIDTatiURYu2UkiDoGpwV+A02HYzuAdIvDhemQYBV9zLZvj+aMyFmaGVil7fd0g==
X-Received: by 2002:a05:620a:2584:b0:89f:12af:e55f with SMTP id af79cd13be357-8b6181ee58fmr469478485a.44.1764863369195;
        Thu, 04 Dec 2025 07:49:29 -0800 (PST)
Received: from anonymous (85-76-36-51-nat.elisa-mobile.fi. [85.76.36.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595fd5sm6367601fa.26.2025.12.04.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:49:28 -0800 (PST)
Date: Thu, 4 Dec 2025 17:49:26 +0200
From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged defconfig
Message-ID: <aTGthgduOuJaLV-2@anonymous>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com>
 <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
 <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
 <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
 <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEyNyBTYWx0ZWRfX42FKHkdljEHu
 Z7IJwzlESUbzvRxh+cfwKmlvTjtZu2HPnYDclO/R7n19+7kew34sF+lTt02ftCcQYFmrSsHr3DC
 WrmxogUsAyZQL/Tx82WKaSJUClZQMv6FZWqTx/XRa5OjnhrTNpq3YLK9KqfwxdCtxo03HA14pQU
 8Ox+UW6p8Zp+i4FHBjA0pq+UdcMgR9pWcRRiJdiQz9zWQzqSvM30Xvzep9oLXq7f5THyBqIObO9
 4F4hJFygzrPXNNgnMNgLISY4W7DyRDnzg4X/YSAUbEYuOGvkvfcdPmS7P/7LoKNTtLIpJZgZQJc
 UL+f7jAZLMveY30qIREzGMkhWq9MrJhZV4bmQuR0zxS3HkYAY98qaN7myGuzSmYP2xKQ0A2Hsbm
 0YvN1dJ79dWO51/HzZN6oya7dl+cmg==
X-Proofpoint-GUID: GU1eu70tJWLpRx3xYtsnerTk2iRSekp4
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=6931ad8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qdmtR4F+NVILg0/YlAOkAg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-EHL5aZlBa6jUzfNMakA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GU1eu70tJWLpRx3xYtsnerTk2iRSekp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040127
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5B4AEugr1159647
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227305

On Thu, Dec 04, 2025 at 03:56:06PM +0800, Miaoqing Pan wrote:
> Jouni, do you think it=E2=80=99s the right time to enable CONFIG_IEEE80=
211BE and
> CONFIG_OWE in the upstream codebase?

defconfig in upstream is mainly a documentation of the .config file. It
is not a specific recommendation of how to configure any particular
build. Each project should consider what are appropriate features for
their use cases instead of doing this based on what happens to be
enabled in the defconfig file. In other words, I would store build
configuration in some other location that is specific to a platform or
project using wpa_supplicant.

--=20
Jouni Malinen                                            PGP id EFC895FA

