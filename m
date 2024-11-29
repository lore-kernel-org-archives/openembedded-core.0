Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A19D729FB
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 18:58:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.120958.1732906705977267536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 10:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oxsR25Kq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83fFc004209
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 18:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqhHfII/BKQ0/crp2Gt9SWgRmtpz/YtgVwslvM46Fuw=; b=oxsR25Kqm/fE2gqd
	kOA/mQ7+FmXvgqBhEHBxzvTM4j26b8EEXaRD1bcVfjk2cKjKxHRRuV3qBevgO62P
	TdJ6PL9SLeId7PcFNMP0tLoD9blAkGg8X/dhe5LjwgLJHbuL0e+L8mkzke/wEpum
	Q+m2czu/igKEuTTbzbZzgN52excL0GeXYXtFUB1GIN8PonLlSQSgCblTbkMfnz3o
	RJy9NQfxvLWTpcDWJrFPEIYHdbZKM66qofNJPQfuMHmI8FvgLgcV0iYRK43mXe8E
	4NhQWYu+qPu5fCYwXJQQhTDI4r4UygmHs3y0xNMmgYfNWcNnyaLjS1RqyFLtadxN
	GnALiQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6sk4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 18:58:25 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6ef581d8e7cso13402727b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 10:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732906704; x=1733511504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhHfII/BKQ0/crp2Gt9SWgRmtpz/YtgVwslvM46Fuw=;
        b=io9cfdZIip89M7E2Zyl7HQwjzMAIXgxOMcHcdL0JPmqkVALFFo5uX42mgGSshpTloT
         qxghbveF9VQZ53ZBZBQq4CSp2AfQyVIDOf39SeKtHInLCLvZ1oNn+B704Bpzb48l+3Ry
         A2xF7oSlQlUKsAQ8wB0Kbto9r4YFG8PXBS2pmOhw5B8Nsf/3p/fIN8sToRfCxZyMO0f8
         xp1599QKEbehQ3m6N/+5K1BknF32xBGs5AxgX4Jmo5OwNNZr7Ah0QGDqWI0Nny0vJWdE
         LrKH1FlJszFy1cGbfphz60S1u4KzMybm//uFzCYw0KX075T/3t4cnj64ekj9u7/YOIWc
         /inA==
X-Gm-Message-State: AOJu0YzLwDxXGDgw72qMw06SdYPuEaOnd0y+Tgdicg68kkSuj26+mgdX
	gT1ad8qct+L5tHePdRf3BYWxwfH9LzT5vQLK8hZuCiZAwyGp5k5x6FmmpS0vk/+0NU/7UIOkgRT
	W7VV14HZPw6FOLf4TGmJ4u2OWznaRpTT6DI1eRvnLj8u82u3Z+BcRTnmuE7mKRScEdLxdhaLpBo
	grpWrqmYZZaGZ0Bg2RTFQoNpbwr0xoID7oOBUnbCT6ILUhRJD1rWA6YJLv3HOoMFx0
X-Gm-Gg: ASbGncsbO3r1IPyz8EGZZZ2to+PY1Lcc/JFbSAMqE1IJOG7QSMx2wO/SZPstr/JhS2q
	nRQd5wrrGayZq014xZUtDlNWKlwNLXThX
X-Received: by 2002:a05:690c:650f:b0:6ef:6f24:d092 with SMTP id 00721157ae682-6ef6f24d859mr846837b3.1.1732906704173;
        Fri, 29 Nov 2024 10:58:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpF7WqPipybbDoe6tkrBfrO4KGKc5ZuGxiJjYQtY9grGhXbMckDCGh5/ZUwEYfOuysNwcF0nzW7LNH1qOrjWY=
X-Received: by 2002:a05:690c:650f:b0:6ef:6f24:d092 with SMTP id
 00721157ae682-6ef6f24d859mr846537b3.1.1732906703694; Fri, 29 Nov 2024
 10:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20241129033654.1275825-2-ricardo.salveti@oss.qualcomm.com> <01010193760741f1-9fbe5e5d-8d96-4d65-8dbf-e5163559acdc-000000@us-west-2.amazonses.com>
In-Reply-To: <01010193760741f1-9fbe5e5d-8d96-4d65-8dbf-e5163559acdc-000000@us-west-2.amazonses.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 15:57:47 -0300
Message-ID: <CAA_5yov2dE2SukEA2ipVThDmMv=vFQKVPBhn=fN36nUOb-NUUA@mail.gmail.com>
Subject: Re: Patchtest results for [PATCH 2/2] systemd: remove custom
 rootlibexecdir and replace with nonarch_base_libdir
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PkQ1sATa3WUu_w8l0aVDvWzpgigc-Y9v
X-Proofpoint-GUID: PkQ1sATa3WUu_w8l0aVDvWzpgigc-Y9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 18:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208032

On Fri, Nov 29, 2024 at 12:46=E2=80=AFAM <patchtest@automation.yoctoproject=
.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/2-2-systemd-remove-custom-root=
libexecdir-and-replace-with-nonarch_base_libdir.patch
>
> FAIL: test max line length: Patch line too long (current length 224, maxi=
mum is 200) (test_metadata.TestMetadata.test_max_line_length)

Caused by:

-               $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
rootlibexecdir=3D"${rootlibexecdir}"
PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
base_bindir=3D"${base_bindir}"
+               $INTERCEPT_DIR/postinst_intercept update_udev_hwdb
${PKG} mlprefix=3D${MLPREFIX} binprefix=3D${MLPREFIX}
rootlibexecdir=3D"${nonarch_base_libdir}"
PREFERRED_PROVIDER_udev=3D"${PREFERRED_PROVIDER_udev}"
base_bindir=3D"${base_bindir}"

Didn't want to break that line as part of the change as this is basically a=
 sed.

Can break and send a v2 if needed.

Cheers,

Ricardo

