Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003CCCD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 21:38:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1523.1777585073783019909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 14:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=AAl5jYHq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: ricardo@foundries.io)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKID551854109
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 21:37:53 GMT
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g08pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 21:37:53 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6948eac3522so2519604eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 14:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777585072; cv=none;
        d=google.com; s=arc-20240605;
        b=iVHmrsIObDsXW2ZATiTuTjAni08VJ/NvreptW0mIHTp0BTp4AeLRTmA1Y+BHVosgNB
         dggZqOg8RL6RxnyW2lef18BzjtCMh0PTKX7xHTxceorAVTdBJSs4N6JyecIOg3a2375U
         f3xnRC3kb7+lEc213HItW5xcp+YkAmxo/hNkNlLHeW2SfwQrW/ZXjEZvrd/K9Vqv3ZAu
         P+tq2CLmagNVZ4twDDhN0iyR0HWzhAHaimzW2g4n5cyl9AVGs73PR7rxLrWxZNQZvrsf
         8vDBT4ro5bN0WYsJuCuzKVrDL+DysYuQJtJb/No9sRQpLQozsi5DvQjMdCh9c6E5EQ1r
         x+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UzaTjPK5cT8dW7E8gMQhOaIuqYjMFl+7WdA+00Ba8Js=;
        fh=oo8Kb3h3cr40VJTL7ybdyvGx8mdNetM3RknXwbXr6Sk=;
        b=WJWmAMavgQ/P+MQUMxqOIa4udHtKHjBrVlzVz97TdIciDkV/yW4SYVaPyFQzxzVFLO
         Bd1hZRWVIDVgQSaB1DBu04YxKKYk2L6NkNJRd9K6YY4aKQTMY5hC3MeWFG45bANmCPaF
         jp7Wil73/FO5XJlFRsXsl8XfS11PLKanKtuWJBiwSLHLFkWc3SAvqWUw6QI7722UVqt/
         QpNKgTaYu2U4LMf1iXaCj+BgRKsv75MhVlnKohooGSxIVAyRtSOhuVcar2981zqeZjIz
         jQi7dw60sS3+4FAS326Dy8Ft12AVSA7BFMtqPRcWvYIhmQGgUo6BFlugAuXnGnBpIlCk
         FofQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1777585072; x=1778189872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzaTjPK5cT8dW7E8gMQhOaIuqYjMFl+7WdA+00Ba8Js=;
        b=AAl5jYHq+mEvND9UqYqZSR77niq8Qtuib6aBEPLiSa6CNMu0ASj/xYHpe3jauzQzy0
         e/WXjeB2pgnTWmwOGYTC36SwjfhrMtKC0D4xmk4Xx7SGMJDAEylrDm5na4GqenyPz0fx
         Wb/WejMy4cnUYjFWmZ2z9pDCo4nbk+cJj8uPrki+Udhq37RywLwY4TKOTiV+p9TzlKnR
         ioYoXVhG7diTptg0RKCs9R0uPdn0a0fj8RXWr4KPSP4y1qbIxOBsM0rQsvDGKd89Rzy4
         UZrgZOlj2x6K+CTDUzQNer7BQNsMYnNEcc+dPKOwXFr/jdaYaMCe3dfkVbxAjpLVRMxd
         +KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777585072; x=1778189872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UzaTjPK5cT8dW7E8gMQhOaIuqYjMFl+7WdA+00Ba8Js=;
        b=h03/LSoHTcTokU7y+X8jGVsom1eoRw1nIovqIBZgifR+QeVDawyceZvkfiZbGK+MmW
         fRxc4Pq4a59QqUpz1iRV0B40tdgrQvLRCAxSp/rUABpPy4tsDcXItbfEnEd8+Fv3G8Md
         GFN7atTL8gA88wvKcQZ361LCSdMnLtEW5aXOApeNZO8ZaaAaKvWcPLzqU7dgz2J833kW
         ierqmJZACxROfsewiD4iJjd1GX+hcGRL/BhFiwfx0waZ3m5XSuFPoItkpu/8QkA4L8Xj
         7Ka0JQR8QRS82orHxKlNbX++0fx3F99fbid2u2fu50hFeEo3E3Ifpf3lAqwBlYZxfd5M
         mkmg==
X-Forwarded-Encrypted: i=1; AFNElJ+sgQdh5W5LLmfufp8USvzBwsL2F2FFl8Q3AfuA+p65/6zMFqABHa59FmbwGg56UJfZ3urZs3lzBfe6EhY4mOcaZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoGSr34JDXcAiSCpYhnQQHyBvrn8pPSMQU3ptNniQSZpK/HcX+
	gpzVIFRGQe0IuxJYhbjIJM60QGZx4GGbVEOYp6IfksWKHqmEubs7UUOh9DxGsNDnQuBvDW9bbm6
	P1Uxvhx98t1Tc8DTOwseDCGEq4syTvo7eDN33RV8cVpNsSE/7Gcry6BZTMWuqreMsg/RGc60Db0
	uN/ajo1lCtIo3fuqsDZN2bsLJZYO+ittPn71XiH8STOimJv/9QXPghkNA=
X-Gm-Gg: AeBDietm+Lj3y/11mQvz+hUntDG/3g0XI3nlG70KrIxhcOk1ucpzFDlS+ycQ6iIEuN4
	KlBT17Pd/vEzBw38127/SDejLOS/4kIm/WnbPu9KWyY3+lHHCryVFbcJrJDMkCiAPC3cboxcEc7
	Vbr4iL9lwIXVBnnutSLYDsiRls74cUbkkv27wSA3yQcAfUCm9VrSyUDm8qKiJsUauOlpZsyghjx
	VrBmA0KoVKXZuVm
X-Received: by 2002:a05:6820:4b06:b0:696:6e0c:85de with SMTP id 006d021491bc7-6967a9f847bmr2548680eaf.39.1777585072608;
        Thu, 30 Apr 2026 14:37:52 -0700 (PDT)
X-Received: by 2002:a05:6820:4b06:b0:696:6e0c:85de with SMTP id
 006d021491bc7-6967a9f847bmr2548668eaf.39.1777585072282; Thu, 30 Apr 2026
 14:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
 <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com>
 <5b7f9fe72cb1863826c7a7757c90eab97853f134.camel@linuxfoundation.org>
 <CABWbsgBwu32+X4RYM5kzc747qAWs2WWbszo3enTJY=zkxqHpww@mail.gmail.com> <c260940fde9975b059d0e56619b0c0d02939403f.camel@linuxfoundation.org>
In-Reply-To: <c260940fde9975b059d0e56619b0c0d02939403f.camel@linuxfoundation.org>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 30 Apr 2026 18:37:14 -0300
X-Gm-Features: AVHnY4J5sJhPVnscISAaUucmKrBU7V92K9rqpiQrG_RK_VLXZbh27OpI84mklV4
Message-ID: <CAAaKDhE_kFJe8h-c3OiR+=_vwV_JA7Md5cE0pzKzDaTQFFFSMQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
To: richard.purdie@linuxfoundation.org
Cc: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>,
        Paul Barker <paul@pbarker.dev>, Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f3cbb1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Q4-j1AaZAAAA:8 a=V8vuiYjcb3c6i_Q-eAUA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: D-DrxMffR1IbQHrm4wM_T8dsDo32A9Ud
X-Proofpoint-ORIG-GUID: D-DrxMffR1IbQHrm4wM_T8dsDo32A9Ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfXxEOip0CkMf6u
 3Xr4CBPCMiJPpXZtrcV7RUfirEFZOONyUxY/HoXzUTatp3sgjzvGLS/siADzkrCkQ9+YRny7dfL
 TgFQ9XrmM2JmLrjEWPWvz9WHYWdWk/aeJJ6YiiZO4EeSArhnIMQj9yMuFQVV7BeAMDbM25MitTK
 hEItzUE/xhx7KY9QdJLWFHjIlJPVF2C5IeMSCTAEOxo1X76GUmtAuiKOOG5aTfdWDXtB94fmHUn
 Gozm6VcLfqbxBWLIqbWnXya/J8yUI4DQndjLo1B6L/oqnMlM+mVCQ4eI1Itr2MTuOk/4+d2MQXT
 g4AXVeiAG8TeD3pTblFI/i38+WbrZklmskUAEv9FsZXQ1m0zqCRv4Q7T+YYMTZP458RvJTXSvqM
 Fh6dAZimRAVeigVza86oAVUMAFKVeNxvgGOOe2SRfHxKQrBtYM/dcPdVp6vXL1XMnvoT5zqWMWM
 zWxdekrU1CJ1PbH1MRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 21:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236189

On Thu, Feb 26, 2026 at 10:58=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> On Thu, 2026-02-26 at 14:10 +0100, Nicolas Dechesne wrote:
> > Other distros manage linux-firmware in different ways. Debian seems to
> > either take full upgrade, or cherry picks specific firmware files
> > upgrade. Ubuntu is stricter and only updates firmware files (or add
> > new files) on-demand, as needed.
>
> Would/could someone take on "stable" updates to linux-firmware?
>
> This could be stable branch releases of firmware where the contributors
> are attesting it is fixes only? I can see plenty of potential problems
> but if someone did try and make a go of that it might be easier for us
> and the other distros to get behind?
>
> Alternatively, a mix in layer? That is one of our other options.

As we are getting closer to wrynose release, this came back again due
our own specific need to keep updating linux-firmware, and I believe
the mixin layer will probably be easier to manage for everyone (we can
be initial layer maintainers).

I believe we don't expect another linux-firmware bump for wrynose, so
any release post 20260410 could go to this mixin layer, would that be
fine with you all?

Thanks,
--=20
Ricardo Salveti

