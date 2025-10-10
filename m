Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF88CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 13:27:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.9078.1760102840960136350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 06:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mueF6haT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6XHkY007169
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 13:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=g4gNo146WiZb4AL27lrYfuFJs99ICaKfCISvXRWVXkw=; b=mu
	eF6haTNlRqSGENOZ2Q4DCoGeTMvSTPjH3JTpFlWThRqDdbiByFCFAAac08qLIrlW
	oA+xwtdoYW+HlB6K2pu3ybhY4HXq99LG5ADGSNRpXfMBKhp9mSTefsgzQI6bPVzh
	7YK+Y1rHb2+14RK/c/XMnZojfpBEtJdLYGzWLW8ZCUrcNGKVHBC9RwKBB7ifm3/9
	Y7UMUzHFAHu7+Alifq9ZdkTrtHCSkc9s1FGIjNQQ68T66HDGbZWZ65nuj3TEhw/7
	dE8AuP41FVJ/zqZVz98n43MkBDXhlg7GHaUiGYr/17WHDtUcIHL2RAS9qcyyo7PZ
	6YxFOiXbq78lhGgejuPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j6juk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 13:27:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d9ec6e592bso63855141cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 06:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760102839; x=1760707639;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4gNo146WiZb4AL27lrYfuFJs99ICaKfCISvXRWVXkw=;
        b=iEvkcUDU8Twaalpof5AiCODX8G5uchzJH9FF5gIGn/Q5TniHq4HudPWFB1EzDSZiwB
         VGUp/R7aQBiA3/SSb6b9YP0G576BD879gY4XIiaTDcKUx3J/5NYCnPPucZl+WJMWcpq5
         mltGyUgQbXew5opdATy6cUPyh46TrPhepbDzL1qSJXXuKadWCXAil9eolWUyXFl97vdz
         +CdNYTpsf2xuGHJCjH8BNeacPjyz0bs+trEzHdWqxDiBhSLt2IL54QWFNGP0ZIauLzKa
         SFTIDnqWmL8cPbQNYLSf1I/KhMqVsXiqD7o+aSbH9gXe9uixO9juYk6tdwV2IizQHlhW
         H+eg==
X-Gm-Message-State: AOJu0YzxL51imY3xIP+BUFBxIBeuQR7uNKZJQbtzZJ9RmPmKINJ6Ode7
	y755Pj2vDY/2waVHw3Dq5C21gKSfoyo7ZMEa3gQ2fTonnfDWSMv6+93zfdBKt5FD1i4ACLl68TZ
	V5VDDS/zD3JueMUC9Qtm3mjJBIBbKUXvJZY56/fNXbGzoC7QfRIqEwn0/05cp+EXJfud0rj5GXd
	ZXtHE4SEtAVRCiKNc=
X-Gm-Gg: ASbGncvgzsvsNd3VZhEc6W1xNkKOwn2WOxfOf/Aj/M/WNkNBSmHcmHXQT+uEDdkvVHB
	rcMnK49eFcZJ98mtTrd9MhBkZtJvXZ0cmB4UbHRNYmpD+WRfDfeSj52vQbAF2MsUOxsqfjleqqI
	nAJJgSm+Ydfytu2NQanbj4EmwGFdOrIYybCo9UsFNl3fviu8etmA6j5qViEUupwmRwjhl+t7o/+
	0M0F54B6D67zRSNx8e2luPWt9R5u0rm8rGkov+rrZsT4XMwmguGWl60rPTxaP4mlN3e7/707qy/
	khhV8A1+hFEUda/mY0Ykt+j46cumDhnl6MICdPz68Fy66xug1oPgErAxsK9DP9VzRLq85r8TuJK
	4zBOw5wnQzwdCKwyNHH+EadaMQBA+Mw9BJ7PY7PJk1yN1dn0CKmyj
X-Received: by 2002:ac8:58cd:0:b0:4df:6b24:ebee with SMTP id d75a77b69052e-4e6ead62ec0mr162406311cf.58.1760102838961;
        Fri, 10 Oct 2025 06:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0JuTApznOU1oKZpEaHCgOWRSP39366DDsGP8+CWOSFOAGUcPTUNxS+fjS1GL1ErMqoBib6A==
X-Received: by 2002:ac8:58cd:0:b0:4df:6b24:ebee with SMTP id d75a77b69052e-4e6ead62ec0mr162405701cf.58.1760102838337;
        Fri, 10 Oct 2025 06:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d2dsm6228761fa.32.2025.10.10.06.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:27:15 -0700 (PDT)
Date: Fri, 10 Oct 2025 16:27:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: rust: building UEFI software in OE
Message-ID: <rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: oUCkRcSkyN0jfEDTcAqTvASdwj8oDqQ-
X-Proofpoint-ORIG-GUID: oUCkRcSkyN0jfEDTcAqTvASdwj8oDqQ-
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e909b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=CpQL7Z0zyc2FfLCU4NoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3rMM72NORe8R
 LhNXQOoCfSG9r5zKGZTMv9/CHdVMYiSR7npS5CvYCirFK1KrM8ZGm4zdP+fNBp/OaLxWHX3PC/W
 p+y8qNQdr0JHzBtOFhZre8Kp5FApuZIOrbilxZFHnfRvVVnOL58hMdQSyIL+bwhBO2ovLSndCve
 GTgFSoEqkABSl1ExjhfHszL2LcbfdNs/h1TA05p9sk50xsG5+n21hUv775H5hSt/IpFdZt7SceY
 1w5GdBcO62EflMH5o0wlAbIutpftqF/ALZ5LCHdAuvASrj8Y6Q4ZtMtkLLd9QnmLorAYZUs+aUz
 kS2YiEuh5I9PBqAhqWefTMOWGQiq8lwz72Ihea32fk3/UmHIfflmf5W0c+Dz/1TdiJyp3ATQNgm
 EteBVrqueyTH0LG0HzDYpr2v1Hjmcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 13:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224686

Hi,

I have tried using OE to package the UEFI binary built using Rust ([1]).
So far I can compile the crates with minimal hacks to OE, but the
linking stage fails. The ccld wrapper tries to use the (non-existing)
"aarch64-unknown-uefi-gcc" (and fails). The aarch64-unknown-uefi
toolchain installed through rustup uses rust-lld for linking, but we
cannot even try building rust-lld because Rust doesn't allow building
LLD with the external LLVM.

So, several connected questions:

- What is the reason for rust / rust-llvm split? Would it make sense to
  squash them together and enable building of lld (which we won't use by
  default)

- If that's not possible, what would be a recommended way to enable
  building of UEFI software written in Rust?

[1] https://github.com/qualcomm/abl2esp

-- 
With best wishes
Dmitry

