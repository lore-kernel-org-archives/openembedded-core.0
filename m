Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D31BCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:03:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.23035.1761822224774191210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 04:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VWsTML1u;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kdNzBrPl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PDHX3508813
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WG8EFZ3bo5Teatbh9p1Xnf50
	AVhX53iX+YMQMyNtSi4=; b=VWsTML1uSWj1OnUkjFpsDO3L2lbneQrmu1Jt9lWv
	Ecbpme+S32TjTRHSWKlXXXSTXODRuv6KrbEHv9HDjvOcXps0tM9VdTGqpxBrAdYF
	/qEX4uqtoZw0iYbyq5/CCtGZ6BbqSeL8uGKGoubkIoclZ+aknox4zJ9zgdfdWFM8
	1XRMU12aY0e1FGSr4shMKMfJbiNc8cCua8QKStlrnoq6Nd1sWal9ezvxEbrp8Gex
	W6aGOIMFwCrBZ53LVheMxc/DExIWv15GNstuyPltNMui+/MJ8dtnkquMi7gNCkHU
	SCJ9lyQReoc7KRQnuDnjUtWFx3a279GPv+1b/iSC2x/wow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdg9dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:03:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso839261a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822223; x=1762427023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WG8EFZ3bo5Teatbh9p1Xnf50AVhX53iX+YMQMyNtSi4=;
        b=kdNzBrPl6reJonEPl5B6l/PR8jm0oS1M4lT+0qo32XfhM1LyJ4HuabZ95Hj5ByDBzd
         FnJf0yrtn2/4T5z+4cPM0gdn3/M20J+YyebGPUq+0EXnEPa+eVT38qt/mfcG/cCtL0Qr
         iavoI9oIUICpypCnKjNPgfrSjRejy68X/XrdMfKgnjKN4QNHL67ByQdBOcQJTqcvacEg
         fzeojWxOLWFtCViQFYrr2i39edeSbQEYQ4bSLZaezLaoPxLjMoS073wCDWj3EvLmoYOe
         MMYDJlDjTNtkCwosMPJGshNjDkRa3P6DB6tQCn5X9GjW7ICJuHkPitlEtGKEq1EeGz/B
         ZssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822223; x=1762427023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG8EFZ3bo5Teatbh9p1Xnf50AVhX53iX+YMQMyNtSi4=;
        b=w5HEioerYpCY5MNl2pVACD8MktR0wq4P+N21DWzNwYAkvE4QfAPLpi7k3nk1Cqx0+9
         wvxNWCd0wPb1gyV/kmqC8FT1jCj/OVPBxMDcxfFVbik+6oGIVltr+2IwZ3Rx7jypBi6+
         LCQi6VuaAJtx6BAj7dYNk1uFcpMhr4YccEBCQb3tV0qiUy0irCCd2hA8nXeiz4tmiNBH
         67SkAU+IlrJmeIjqF51to7sGz/F2IgIV+8P79lrDdem8zRMI9ZLgD4Im3NbJc9BlvuQE
         HlFaLv5n+iwxeaPft4u2NrRh30oTVWd4XUrVOdJIoP7MTgTcYV9RKc+w9lW4nGxZSza4
         ZHKQ==
X-Gm-Message-State: AOJu0YxNGM4Hp4cm5Hry6mJHPcvs1Q7TE5guiY47i8gn8bsfUM8KhByg
	2kK5xiOkY5FLL61x32FkxqdR5SDU3Ny1t0Gr0/HJvJoJ2ZRx6CE5nrc5sKUhhAeB4i8ZKA1/0i9
	qwFURNAeU7up4hrl0V/kSxslEh8PVmAmM3/0zGeunL2xo2+AK97n2ZGALpU2dbzXlouN0r9+nGe
	HWxBNw6f6BgBIKm6rpMGBNamc2p2/DFyaSwfJXbeCRXNNOi1vIgDajA4GXTA==
X-Gm-Gg: ASbGncv8agYlfxYlLJwkHQa4W3Nv4gRLvQ+4hjLph/vGBBikhOqN0iwSPknczhlfgES
	xwd8zkNtyrU7oemRFuuV+TS5KTx0xPqzeFhd4qAX3Lgmawr0NzL3i2beJfv7dZheWnwjViEbhDm
	LRyANxigI17v1JPvwQ7/qbL5NPJgIjZDJcILnnd1uWKzoqdP3lCzAiXuFR
X-Received: by 2002:a17:90b:134f:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-3404c4011b3mr3097321a91.1.1761822222632;
        Thu, 30 Oct 2025 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XydR6IsMnFbZ5WR6D0I6i89lIf2VsCs9uppj+Hh0qNbYdJnTjJpipyA3KbVOTt/ECaGIQpGrBdK1V8kuVGo=
X-Received: by 2002:a17:90b:134f:b0:32e:a4d:41cb with SMTP id
 98e67ed59e1d1-3404c4011b3mr3097235a91.1.1761822221881; Thu, 30 Oct 2025
 04:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com> <DDVJU7K6KUXQ.19OJZEVXK2O0@bootlin.com>
In-Reply-To: <DDVJU7K6KUXQ.19OJZEVXK2O0@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 13:03:33 +0200
X-Gm-Features: AWmQ_bnYV0-LPi2sdhj8S6OuaXaQJFtWJFpeHnH5JuJb6iAAoGfnYU4HZmMSJyI
Message-ID: <CAO9ioeU3X441ppjnRJheXQQbVuJajRMyXConPRVNGtMWNsOdOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] libconfig: import recipe from meta-oe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: sy5pz8PD47czZRPvw87lwjMn6uG3gpIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX84hlewSHG4eg
 m6bds9LdoQ8JRh9XELXuinBY1eAxDOovK1JxgJgm5oOcTb0PmzOpBTjeH1IQ5HsQc4LtuxWL2dv
 konTiUYVvJUsqd6d3otCdj0ltofeO1YiRVlvaKkOYPqWWJbBcVUHYIpkEO9OQv2pqpTXoboYaQN
 F2X0baUIB6R2BfqNxuabB1W/mXEtnh2co+Oc8cF4KN3AoKjoC8be5r2lz+mzPyFucfZI37V1R9E
 KAeXFx4oRmgqnc7zD312CrbDfC1L58idX8ODah0g9H/s6PWt/miwsnyNTX97+NMF3Iu0QGLnOUS
 bEyY/OWM0NnqeJX7WGSXb7qn+9A9UKkx8yyFc+6C+DUGatqwGkjH6oC9QD7jlBPQ7trM3U64EXl
 yL9MF2G7V5y1S7Jv2M0MG8zZpdrCoQ==
X-Proofpoint-ORIG-GUID: sy5pz8PD47czZRPvw87lwjMn6uG3gpIJ
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903460f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=sCKEJbf7gVzliRuT2kYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 11:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225487

On Thu, 30 Oct 2025 at 11:29, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Oct 30, 2025 at 12:32 AM CET, Dmitry Baryshkov via lists.openembedded.org wrote:
> > One of the freedreno tools in the Mesa package depends on libconfig.
> > Recipes from other layers also depend on libconfig. It makes sense to
> > move libconfig to OE-Core in order to reduce inter-layer dependencies.
> >
> > Changes between meta-oe and this recipe:
> > - Upgraded to 1.8.1
> > - Switched to UPSTREAM_CHECK_GITTAGREGEX
> > - Switched from autotools-brokensep to autotools
> > - Added a patch fixing reproducibility issues
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> Hi Dmitry,
>
> Thanks for the new version, but the reproducibility test still fails,
> sorry. Same packages IIRC:

Interesting. I can no longer reproduce the issue locally. Let me try
another attempt in v3.

>
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/libconfig++15_1.8.1-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/libconfig-dbg_1.8.1-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/libconfig-src_1.8.1-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/libconfig15_1.8.1-r0_amd64.deb
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2801
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251030-hmneez8f/packages/diff-html/


-- 
With best wishes
Dmitry

