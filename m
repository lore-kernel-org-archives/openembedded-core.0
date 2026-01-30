Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F76EE6BF1F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 15:23:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12974.1769786578368685239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 07:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HBeBHZ93;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UZw8nUE5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAlcjC2992837
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z0pNkm6Vlz97QZd4gtdiECkByYNm1tnpekTq0N97ji8=; b=HBeBHZ93pEz2f2pn
	mX5LdKES+PdUrhZ8mSlLndslhCcYwUqbzxtn8BPaNTJxBjdSOmjUHQ57B2lgyuut
	7NfA9GiMSDYZTBTLDeO2xgwSRDr6v7zsCjkVwibPnTkjBH2UGsaf2C2vdLHwQrTa
	z2Amci8iwm6yKhbiy85qTd/6hEBDjT5fmyKNw2SzlgcuT3nOInkbi1zeIrT15pC2
	0ZQNBJmvs7u8gjlMY5ljg3pT0oxVwZ4tkzwypGkUCvaq7Tb9I1EzlzJUl64ccPh4
	TCa4xJxfFVa9AMZwH5GUY0Qo199P/rGHN+aY7et8MjQ3vKgSPSTpIdeRYC0UmrRA
	u4bDHw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1k9tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 15:22:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c613929d317so1437718a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769786577; cv=none;
        d=google.com; s=arc-20240605;
        b=W5qiTsZeFO3Aydsk4wk4rKuX5JGDgrOPUyzZE/0oZBZo4Jjl7gBrj3mX3twNajYWLU
         5LxNO5tlpdg6OiDnk3HInJmr3FVPfDaQ0JebsTZry/xx8D88UZMGw8KT6ESra7Njmj3a
         iGjrFBuNje13gWM9vw7zMuvgD7ebywv77SRD69ybP7dwSzqp+MgnD/pmwBFcehW5J61R
         D8nvju6mKTdtmh0FAOn2061uQ3bkmTi2eS3ebvFfrXvOuzKUXFsYv5CzbCKiWP5CqqEn
         0K7ZCeAVtGrpGWrOeYocx2HzMQHEKhpd3P4hzUv8DotVhX3r3G1oXhVamTvnd5Mz19ZH
         kkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0pNkm6Vlz97QZd4gtdiECkByYNm1tnpekTq0N97ji8=;
        fh=p57tlJDhBiXedMNcOIEQ6UxZANzqaQrKlFpde0K0ux8=;
        b=HtwKVY87eA9zcTOr8bkRupxNCXEAL8DrhXfQboYuVjkeEBSgiL/IKOSU8QTc5aOFyG
         jKZ3JEyQGymC8M+MVWLQwXApsaZKuAErVLEVrGdicPaS0c+F3vJop+foanWhObf/a23D
         4GQXo99a90nJ8CjFFS6mSgUiNtM1ySZmz6dgDRt+ffBabqmFjaJGxG6O6XNLJLt3Y4Qj
         hkweDnv2pYuY8ncQ+/PK2iTp+Yd/QkxxqET3QgnDGzqTWc/KQESXl7TJVfcMshf6CRnn
         6QPXYGDgNbbt0tXujYXiKsuMDQKQfigYewZpE5pdI0MU9+mc5DIoa2nKdOVVJ6qtA1e4
         hsSw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786577; x=1770391377; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0pNkm6Vlz97QZd4gtdiECkByYNm1tnpekTq0N97ji8=;
        b=UZw8nUE5fF/8NJ1F6pLVYDz3DVvPSKWV/hADpfKiaN2HEuq6DBC6t2TneEdyFX4Gau
         TIMVOcgiJIEfFcmxARkK94aIMeTxhaf30dnv7IS7zzUt4tpsdLywyFUV2/5HSR0z9Pxb
         T37MH0S4dJUHuZ8B1ANzCXTFSrM3b/ph1MMrK/pG75RpvqAPs4hlNqRkDf6azQ4PsK4k
         A9ur7k+TJphKLKPjPkWLqX0SX+c31Grgv1mo8MRrCg6VA3LwXuJbwUt1IyDUFIFYY+xo
         B9P82uRdg0ycgyRtUSFEXj7FolVes/dwaQiW1ADVe703V6kQQwredNK6E/Fi6w8vjD9u
         YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786577; x=1770391377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z0pNkm6Vlz97QZd4gtdiECkByYNm1tnpekTq0N97ji8=;
        b=bCXNUF07Y/BiB/K5EmrCbOl63a9hpY8m2b+cQYXW377m4ZBxvDRd/0baIjkiKvCu3w
         BUXnNvo4Abtv25tD294U/imD6mayfWsPZEABFLN5JrMxH4DsPCxzHttqIJQAYeR3RWzS
         h8k2F+ZZDqjmqM4vI9fORe0SXYSRCT9PgY6/vzyq9uQ60cvKVuSE8uqL03vT4MgOxz9a
         3MO1sjCNyOeFPFhennXOxmfky2O3sp9noM764YmVMCL+tNkUn4pem8YI/UCg0+B0qnWD
         3dtkgQ1MhLdoSGGWUt6BWYVl+Nr6+xmqGVLaD7J9cNsaV4ZEPRcPGiScDuwV4M2Q8tfh
         cX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCM6lr4PU7IEFKkhZiszPdDlWVrtsiPQVTZopHmMTBW+EczdamEPuj36vHXO1Is2mQupJvdYkkbG5W1rZ/MQFWwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcWu9tCOleyriANGxmcrcAZ+Ov/tndzwcIQ/NfnC2SGRC0wTV6
	f/wPHm5G9Tjh2grlomPpoDYXPErSS7ZgGrVpwNsH5ry3Ll9MmJ9P+UM5wTPqSBWxBw+hrbSbI61
	afjnQia6b42UyL0vPyAKmetddwxcfXoo0/kVlF5+87d2dxXkF5tNWkZCNriTyUYuayU/fB5/QIT
	I6eyUz9zNZSDlt/MyD4QmIW5hsLLvhK/7w6x5jZn+g1uHSaTPsPOjy4QXZpg==
X-Gm-Gg: AZuq6aInXzDurPqDDlugpriFr3u9LgD1jLGeOQZJRG3+aXDKEqlfy9PDto3hF4HZJnw
	I5Jvv1eKYpZtp1WOmaOOCu1RdjebHo9SbZuhVw6h1OuizWFViVBBbKZ6WL055INmaTmLTcRRZLX
	a0/8Xjex6BQiRYQfDMGpbFOlolanH+ENK8yYrMweXBYXuZf8vBl05MQ6n39fMIXnYKGio=
X-Received: by 2002:a05:6a20:9c8e:b0:38b:e750:bc27 with SMTP id adf61e73a8af0-392e014ba5emr2982879637.58.1769786576895;
        Fri, 30 Jan 2026 07:22:56 -0800 (PST)
X-Received: by 2002:a05:6a20:9c8e:b0:38b:e750:bc27 with SMTP id
 adf61e73a8af0-392e014ba5emr2982848637.58.1769786576300; Fri, 30 Jan 2026
 07:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20260122194959.13457-2-rs@ti.com> <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com> <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com> <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com> <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
 <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com> <DG1HOGASBF39.XTOA1VCZCPSR@ti.com>
In-Reply-To: <DG1HOGASBF39.XTOA1VCZCPSR@ti.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:22:18 -0300
X-Gm-Features: AZwV_QgziVDd8rKA-F2Dqfs487VDdRsZbVM-2XdpruPy0arNS8wrvjzq6V5TnJo
Message-ID: <CAA_5yotjKeeJHf+vio5e=KpojE=yOBAPem71SoZmNUwAUNT8xg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
To: Randolph Sapp <rs@ti.com>
Cc: raj.khem@gmail.com, changqing.li@windriver.com,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: z7KH6VVOWQPCLZIlag2k3QN4LwNyHsrh
X-Proofpoint-GUID: z7KH6VVOWQPCLZIlag2k3QN4LwNyHsrh
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697cccd1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Q4-j1AaZAAAA:8 a=1V80N_lKPjFHL27_Z8QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX/oE8xm3NCLn7
 Swp1/HU7oy65vL/mTdbd1gyYAISQy2B/UegbmPZs78zZ7ntOZgdUIXcbts8tbolNqBvFA9f3sr9
 6CoNtF7eh34+Se1CfDuyecwyxmUSMQk6UXDCKvhspjwA4bvdiV0A8cO9ivX+40JUeOP9Eg8bPXx
 zi26fYKUCBMlkHswOmmRJsrLPgRE5Ay73p+bcydakD2qomX0p/981EA+HE10ZfpX8Zmp/K2Wkod
 dSCZP+RDrXauVQeLU6w0Zgfvh0+QZSFcfNmK0sj9oYHfMP7D0HO4ZONRni3guv+0bilm9Rr6gfB
 RLeBFwef4lbL+mZ6fhKLLPwkBNbgDSdzDxpowezUh3Q9tAEJSRiTGYL4I+lLfNC8IV9LcOgDpdH
 Kh3qTM5RKVWfdoxfoQTMxuo2t8tqzcSy72JG8zUIPDrV6t+ZTkRF0KfujqV9OzcuhO3jBqJ7p7c
 IVL75MIchPqMbWZkF4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 15:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230200

On Thu, Jan 29, 2026 at 9:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openembedde=
d.org wrote:
> > On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembedded=
.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> wrot=
e:
> >>>
> >>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded.=
org wrote:
> >>> > I am seeing some additional diagnostics see
> >>> >
> >>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/r=
aw_inline
> >>> >
> >>> > I wonder if this is related.
> >>>
> >>> Man, the mail clients are having fun with this thread.
> >>>
> >>> Yeah, I'm able to reproduce that issue locally now. Not sure why it's=
 this
> >>> package subset that's acting up, but it is directly related to the LD=
FLAGS
> >>> change unfortunately.
> >>
> >> I think this is exposing the underlying issue in packages perhaps beca=
use they are
> >> not respecting CFLAGS and when it's gone from LDFLAGS the mapping rela=
ted
> >> flags go missing. I have a local patch to fix memstat e.g in master-ne=
xt, all failures
> >> perhaps need to be looked into one by one and passed cflags from OE en=
v which
> >> might have been missed thus far.
> >
> > Just noticed a similar failure with lxc (meta-virtualization), but
> > while the prefix-map options are provided via CFLAGS, it only works
> > when provided via LDFLAGS, probably due LTO (enabled by default by
> > lxc).
> >
> > Patch available at
> > https://lists.yoctoproject.org/g/meta-virtualization/message/9553
> >
> > I guess recipes forcing LTO will probably have similar issues.
>
> Ran a test locally. Looking at the do_compile log there are actually seve=
ral
> compilation steps that do not have the macro prefixes passed as cc argume=
nts.
>
> That LTO bug has actually been addressed, it's just as Khem Raj pointed o=
ut,
> sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS was mas=
king
> that problem.

I did look into one of the binaries and it was built with the right
cflags options, but didn't investigate too much.

I can also confirm that it works fine after disabling LTO, that is why
I think it could be related to it.

Thanks,

Ricardo

