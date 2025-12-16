Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D9BD5E13D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:44:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20271.1765885464615736734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JqNelRSK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IlftToy5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8SAMr3745394
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIcC9y3uovRa4VcwsxVpFwFlBxigrQTEYToPX28kw4k=; b=JqNelRSK6C6RofR+
	9ir1GvNYO5BhREqWrse2uMZUe7dufgYQ2StCTgmx3Bdfh1VCx6z46dbR8UL9MyWk
	Jotf7HKDmoWlcdnDuPBdTpcefgVUMGZd4zDFQHweXzwS2/bEKIqqtyNB211z5ZIY
	0ku0RWQdt2yUGcpUttblCvF6dWsHJnXCkAOIEaOrYJK2BzKLiWNnz3/65Dza02rG
	er/LKDOPfDHUCO1y1lVDCRvxG8v6gyX/F7Nu7cTlv6Refg7T5a9PQEDdFjnxdzs4
	2HweLoicm/3ALKO3SnqtsuVMN/tDbYvuCRosxKZnZNdDHuwKgr/BnMUXqRU+EMYu
	xOvAfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj0s22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:44:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so999504585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765885463; x=1766490263; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIcC9y3uovRa4VcwsxVpFwFlBxigrQTEYToPX28kw4k=;
        b=IlftToy5Ii6AB9RDVV+Bj1ffMU0pvNkocs/L/QxqZlLOmMs3+XAkQ1hz13d/OkbvbO
         ejydoNjKHjNOFatR9fvA+5l2dUcb2ZxlMn8W/zG514hesxeylzfC3FDrvyk3C1MIdUfc
         hjZF7iIDpvN5e6jK174LEArpYl56YyrzU//1jmANMHjjZ09Z/WjGssEbkVGmlkdvkI9R
         LrN5zAhL7P4S+cK73oqNwMEscN5f/KMNICjdzh460Rrj5s6ePAg61x+lDWuXUmsBKgLS
         eZMyxfb6hC3AdsHMAgaLdQiAXbMhvAGrZaSrlKMLp9aZaAR2PFcySB4Q7fxS30QnfbV8
         dhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885463; x=1766490263;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIcC9y3uovRa4VcwsxVpFwFlBxigrQTEYToPX28kw4k=;
        b=h9Hvu3xpwShVqs38738znIUWDUKALdjgBKj9ARRMEmK91RaY1RA+IuyQdA4LmhA/xP
         sf8CNYePCpHgreucFk5peRDYnrsF1c6o/FfF40H6ncsFLeF/VGjYqhKdCuQMuoPPfd0W
         KUUBs+IO0O/AWx8lzvUpsHEXM7eOBArN7HbxOGjNQWjErboKDf5bpKD/oGZxR8bg4RWz
         l6pGxG6Kqalua9sTE1W2Mr/GThlm8pMxnIOWJQIxiUYUaX05YeCbPwJnx1RRzyWoJ0Ax
         sRV24o6iJ/CQxUq6jj8R69+63JcO9HTZsWTiCDTe7erfih0EuJ1wbWmd1AIYQPPLNRp2
         I6TA==
X-Gm-Message-State: AOJu0YwrhKPe6dGRCjDjzCu7MqAOSc8jaqmn3sQaKZaN8CM/YoPcGE4Y
	5Wt0SUR7pmEgJxE1UoPyzrmW6rL9dGe6uFadh7OMJ5ZFufNzU1fIL7AmYiqMMI4a+u7aQyubs1V
	GNCitQIvOgLfzFSG/qqDGMTPIqUU0OOAq6XKIahL8z++2ahsDb26ZopZXaX/ihuspbIxuy8+CQr
	m2NW7XNE9U/ZRAeM4DoQ==
X-Gm-Gg: AY/fxX67Iqih1Bbvhh13CeVza3Vpbhb/e97FpziwnU8OIJxbNlOr+SaSMlBBYkHOjdc
	bC1fvJa0GDWrojz9Zb2Buf6UD+t/08OXE7twsSH7Ldlzop1+ZL+8zMR4PMYz/dnVa6KcoK3TB5b
	NK3HipHz94YUYHvbjdU47bJYmLawjWtyq3iMLg744tXEbvmXC1qBm1UjQCt3Z8teZxbfOR3UF6f
	j6DES1R8lLZDi0bwTj+O7fFFgNY2zxXxYbAhOax0IF2ylCovs8XW0z+eI0pd7wz+rB58ojkT5PO
	KmJqStdsDiZhc2VPH1LoTZNVH+fIOS4HOFOfbR2aRhYyWKH5ACkRgFkEKy+CB572K5cLJ+1GZle
	hQvfEExHuwu7acfz8znm8g/oyCa2sLiy5Z+dikmAbRZHkTZK7a6jJg9kzFjxftblbNA==
X-Received: by 2002:a05:620a:199f:b0:8b2:1ee9:dd03 with SMTP id af79cd13be357-8bb399dc66emr1795434485a.1.1765885462633;
        Tue, 16 Dec 2025 03:44:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAnLh//w7Ytft4bwZzoVOuGI/hDaolwyWqY9X0vvQ9zy/ImntK7+68LNt3KQGLhdynbxBnlg==
X-Received: by 2002:a05:620a:199f:b0:8b2:1ee9:dd03 with SMTP id af79cd13be357-8bb399dc66emr1795432185a.1.1765885462125;
        Tue, 16 Dec 2025 03:44:22 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d1e89sm1643650466b.69.2025.12.16.03.44.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Dec 2025 03:44:21 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core] [PATCH 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <CANNYZj8xx5Qn7Wj2JzdjXyUzysppG3DB5usZTjswfOeYbcfiGg@mail.gmail.com>
Date: Tue, 16 Dec 2025 12:44:01 +0100
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D42421B6-915F-498B-BF38-8CD4DD62EDC7@oss.qualcomm.com>
References: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
 <20251216095459.3551985-2-koen.kooi@oss.qualcomm.com>
 <CANNYZj8xx5Qn7Wj2JzdjXyUzysppG3DB5usZTjswfOeYbcfiGg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-ORIG-GUID: ruJWb5uGYiLQ3Z85kkE6vn9JK6-DoHno
X-Proofpoint-GUID: ruJWb5uGYiLQ3Z85kkE6vn9JK6-DoHno
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69414617 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=MhHPBemT2F-kL3ZUezQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA5OSBTYWx0ZWRfX8JIOdw2zf8YT
 ErhM5NVnYMqvdJFgphOiuSB9xp25J1Hx0XK5qeXxizLO3u/Z0/u6wGeOMpUj8S37q2FXIQgWfIV
 Z+vzO8eVrYmEdUyJaoEcHbmpXDABgo6sbt7DgX26ME/VyPfGh5TOhuIvrBAk/GwIo5KrOHJeFue
 lYuIJYNdQDzYyfWtNQBUl+U4CCoXdCYcl7CHf/p9axiqmn8m7usf89rJvzdOn2TwPGUJpc/MMLc
 YUQwEnYxQSe47dNY+/ialhooi6iiJCC0Zbq7mEYrBWN3GEAmElsx/Mmya4o5Jk8Lq3X+t0pGzHX
 rxA1gdSc/3fwqdaVFMecM9ptYEooVqSSwHgCOTDDyClrt+UqIG4QkoEvoaAQ8dDqIesGnun+kfQ
 l7iNYsfqa2XtISnDcvbGOzwBtftk5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 11:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227945



> Op 16 dec 2025, om 12:38 heeft Alexander Kanavin =
<alex.kanavin@gmail.com> het volgende geschreven:
>=20
> On Tue, 16 Dec 2025 at 10:55, Koen Kooi via lists.openembedded.org
> <koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>> +-requires =3D ["setuptools>=3D64,<74"]
>> ++requires =3D ["setuptools>=3D64,<89"]
>=20
> The upper limit should perhaps be dropped altogether perhaps?
> Setuptools gets bumped in oe-core all the time, this patch shouldn't
> stand in the way.

Thanks for the fast review and great catch! I'll run some tests and send =
a v2 later this week if that works as expe.

regards,

Koen=

