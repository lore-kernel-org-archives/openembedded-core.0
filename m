Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36942FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:25:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12141.1777379125326437853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 05:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d+Oiw8Bi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CM/26MGh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAFJqd1329569
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANEiNMERo0EFPbqB36YK/WNeDmX4BAnj4WQVLwG+A8E=; b=d+Oiw8Biy0DRbb7x
	IMvErDrkg969UvOwD8MMJ5zegADBb9fN9X31bTveaev8QOSVqojw11nF0+6FTPjF
	2hTNnThpXt6vuTpiKf6/KcClOSZHRSrRqOqym9kEAJjjMjE0gQiiMSa/LeyyJI11
	koeNWCQJWH/o3b2r1DZ3jVvNGgqUs4VDC06UF4F297Oqit+b8DLIPjwFjaXNhzAU
	i8yHhtilG9CPTdl3C6x69Q9Bjgv4WIJjjxqFgoZ/q59JBoFO8I543ba9K6aG/qoA
	gHYWAI5onC4gQyotqQms+T79Ebz5UJHDAk4pls8QXv8CnuFAVsWmVkbDFyr7ppA7
	XSvlNw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahsv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:25:24 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6546ccc8989so9523659d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 05:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777379123; cv=none;
        d=google.com; s=arc-20240605;
        b=AKWUrulII4oMleK39sNHlVoqoJLcxtAaw3fKIfd3yl9gZOJgYdTxHpb6qf8M0WXRhn
         2cjZeNh4xIVOA+hu0RS3L+Hn8DJkxA0ZWk3uHj85mqDAACwC75VNptXQxfifzE1Z7jSx
         Ln4kzPMgHLvrfuYJrWyuevvIt3ClSQoRR+Nk+RfNTk1AIlBlNT6qb9eIAo1EYc1KrhM1
         xJHoI3WdVd1m4AANsP1bZzcw/FoOKq5psfqtKemzhKs9dpQ81ztmjkrR1wvqZ59E9fYb
         XJfw76Ghrf0OgAjdCDnV6RY4na8Y0uONtura77MW5LV9qH1WoQehPQ8v8iN2FYti3XQ3
         mNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANEiNMERo0EFPbqB36YK/WNeDmX4BAnj4WQVLwG+A8E=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=cgE2E7jYy1gZbzxP4hRVfVUyvWHd33m6mt8pvwN6qQcDQ+iCu5gKYC1fuT8Apesb+S
         5wfSd3YpyZawSywwN2y6zVp7D9sy5bdY2wEcBUKLoTW2oVmBhVZKf6p8MZaSolly4G0L
         xOjS2ic82UuFQp7EaPYN5ZZjjUkZe6iTO5kmLKT1AU6NEtlJctCc1wXY6l5a3s3L7POM
         6OUi9t230ncfvs4NvmOilyakSewOr3my8V8n//Y6OhxjGa9reBkmgISPFBngEmX0wdCZ
         FBeOfmDXYduLW4hVGZFSAkWuw01JjDoTXBzBJQBXyLWmU6Hg9gp7pMajq+g517lWvZz4
         RkAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379123; x=1777983923; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANEiNMERo0EFPbqB36YK/WNeDmX4BAnj4WQVLwG+A8E=;
        b=CM/26MGhh/LeVvYcW0R5J/vpff+41zdBlUCdjlTfqUrp7DTkKXC+6ixbuYj9HQWwUR
         v/RToCfpxLj8CBT4k2T/NbSUDJWh30LF46UbfUplhwQhdkCTiC31SooluXKzGINgPx4G
         /KrVfHSFGLCHSjziZrfG/QbNupbN8ZElu7DemYTViRZTbHvDWmDS1CVxetfbs72qfLbf
         zxOpNCw/u3hZgjWzC0Vm000DZvmqPGtgzVcUzW1ekLxLW0QXt7cR324dfg/OomTCUbqU
         jd9v6n9H7isx/n6I8PNKghbWHG6FBv8M4ptpp6PjdnmGavNgBnxLo9c6F6BGT4+ZslaY
         rT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379123; x=1777983923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANEiNMERo0EFPbqB36YK/WNeDmX4BAnj4WQVLwG+A8E=;
        b=jPyQA7U6TwZpawb9eYhM3oUTQEDOg0xAdDOcpm7qFzKAh02X/0sSHbUSEJWRW6gIyr
         +XUS4n6F2JzGFc0/T+RaWMGWv14bjTmWmezHvd61PEFw7p2pKPDlZKNNdNJBoNnuhhQG
         KQ9sQk1fudRrrRHeY6Vdviwg0ImFmukFZw/DZJjHQewVgI//oEI5uZjAbJpQG901fCeY
         CdTZ06enOktv3cRa4arzf2IcOHUsqA76wb+m0Xdgmjlqt4vqoLMnAMVp9vobcK0hg4ko
         W8lv1qLdLCtGLNBheHaqMWRAj5ognbav2pbz8nbOOErlV00MXp8HP+jWta4/I3VkJiOa
         CH7g==
X-Gm-Message-State: AOJu0Yxwa4ka3F+YVbLYtn/4t3eY6h1EpYOxYZGUNrNbHCldRhVgm7Eh
	15Q6EeidbnPpPWGRKhu+G5yYBzjGY+jr5VFb6yDGOOrCIwOo8pB9d0mypNe1EDYidPJ9QfgVZce
	Pmm7jwC639n1nb2JRSdGLir1t+cNTQiC7IbDPn4Cnzlfm+K1wZ0KzEA9iIlbF2NWIu8cbPgRZcI
	O0VNXWj2Cj3UC3F2iHtyfRU/0XKtBDgXxf3KFJAGDX7aDI85V2Wjf5VQHKvXwm4bfnzZ43
X-Gm-Gg: AeBDiesbhEq4nRi9Yz6IbNZw74qgtwrIbPvsQwl5UpY4nmoZUzJk7cY+H2sZvnMHQ3N
	SJILc5Giz0wy0aniAwsp+XYyNNSSwNC/4JmWwC6WIDH+e59F5sz7n8OmK67F1bmEztGoEc0mQRv
	SNIMrKEJBKnTCNSnAtwR6PuxJxuNnYZFuh/C0Ircrh6vgQupRFgDvAHe/bqde3CrmrGvJ38aHfs
	Zd2CWrH2W/48NdNKwI2wRJPRaJ8O7ho0IgdIoktBriY5ATJQ2A=
X-Received: by 2002:a53:7c0d:0:b0:650:88fa:f5e5 with SMTP id 956f58d0204a3-65beeec5f29mr1964393d50.59.1777379123554;
        Tue, 28 Apr 2026 05:25:23 -0700 (PDT)
X-Received: by 2002:a53:7c0d:0:b0:650:88fa:f5e5 with SMTP id
 956f58d0204a3-65beeec5f29mr1964368d50.59.1777379123024; Tue, 28 Apr 2026
 05:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com> <c222df959189ef167ca167ba79152454df00d351.camel@linuxfoundation.org>
In-Reply-To: <c222df959189ef167ca167ba79152454df00d351.camel@linuxfoundation.org>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:55:10 +0530
X-Gm-Features: AVHnY4KRggTikLQ6fAkgAC0gQA4lHedleaygYw25-DvLZ86ZNWnbNmg-TUUjvoE
Message-ID: <CAHyS93o7jQSFFGCXtYBVVseLRnxA3RLdXtR7ALWjAJqWWMBXgA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNCBTYWx0ZWRfX6N1ccP9eWnRm
 U1eP2fjaxQPiIL9eyN02kM8AwSi0su/r0j2b5F/YnXgQHVkWMPH47OQdSUNYbMc13uRF91dkq11
 V0BVzW/qcHwD282ZFfYTCtqybhf6Fp7zZv/qd8ny7mr1J8vszwwzmrMpiS8Etd7ynJZKR8EW6uW
 VUITrXct64FuHHQbmhOZranx/emYnUaZCu+17lc8zS7zBV5w2HojrI0uVx0O0REEo+sAdUUbNrD
 M9UzyZxT1CU07G3otY8qC6vxN6WCpIth0Y/0Pq4FsPAmgKS/6zwR8h4b1Edgy1/qHAOHxenLGuD
 RRrrAU7D1riMciekkLuuET1PJu9DDI2jwH1CXpL2uw6flCVLE1fO0u6xr0zIBn3S/57DVYzOO2G
 1ciOijta7RiHJID8BRezOH+dUl2EhgzYN1AhZY08fa5IZKjKYuYSws8HIGmxKIIUxiMQG8KUKsK
 UgOVcp1jZL93SiRiC5g==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0a734 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=EUspDBNiAAAA:8 a=k53qNq1pm9rbLvYtpRcA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: z5cIkRI19pqU8PjZwrxSTHi21TDZD1bQ
X-Proofpoint-ORIG-GUID: z5cIkRI19pqU8PjZwrxSTHi21TDZD1bQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236059

On Tue, Apr 28, 2026 at 5:06=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2026-04-27 at 16:00 +0530, Viswanath Kraleti via lists.openembedd=
ed.org wrote:
> > downloads.yoctoproject.org supports access over HTTPS, which provides
> > better security and reliability than HTTP.
> >
> > Switch the default Yocto Project mirror URLs to use HTTPS instead of
> > HTTP to improve fetch reliability.
> >
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>
> I'm not going to fight against the current on this one but keep in mind
> we checksum/verify anything we download, so http vs https doesn't
> actually matter as much as people think here.
>
> What we did used to care about more was the load on the server of https
> vs http. I'm therefore not convinced about reliability or security.
>

At least in my organization, accessing http servers from behind a
firewall is considered insecure and is subject to restrictions and
audits. I suspect many other workplaces follow similar practices.
Since the server already supports https, which is generally accepted,
switching to it seems like a better approach. Please let me know if
you think otherwise.

If needed, I can reword the commit message to clarify that this change
is primarily about aligning with best practices, rather than
introducing any reliability or security.

> Cheers,
>
> Richard
>
>
>
>
>

