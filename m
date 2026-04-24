Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172D0FB44C4
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 07:16:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15636.1777014983422330027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WcgEgqXJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85744c60c8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5QY004120347
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 00:16:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=MQQ9Hv+dTyX0PIEmhU0fDE
	pfaLjMKEl6LBOX4AuZv7g=; b=WcgEgqXJCUZWlnyNI9SZaDh4koqZLTNtu+9/e0
	gSPgl4OpgMw2MBelbvCb2GQRo8qmvuVc9G7+nu7MVY3WkusysIiC9rH9HChhogMJ
	9NZ4jHGjVZUTy/CaNNt4wgz4b2gxBTwx1UF0eUx0b6w+ZFzpsrH8mE3qX45QB+CG
	Wnz7SsthBP9+gG61ZN3sgRnY7b4SNZS+Lo7TtvLxV6LUkEkErMgdpuWfI+ILOKv2
	qVLZs2Wy/J2ZTARlwIk1lPsB9ZjBwS+2hI2CtMHKKX7ITGFbdCynixeLtRjGxH9t
	XA3BT8Ode20ElLwabJCGbqIYEytqVJ3Ps8/zPecRTn3GsmQg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcspmh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 00:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBjOQsSi9pPZEgq6PUsDxJ/sLEa4XXllaYv2QP/eaHcnp3oGBWVPQQq+85GSUB2QwvINylgMDz9tOhtWqShl2zDH3+ugS6lbZKCsSW250Lq6a4X3UwFQXWFRqtmldEFYWC1Sgxx/gQz/RHmlxsarH27Bi+IroGSXaOPwYd8ZKkr7IQxgLAxQ9oM0U9IHTcKHQDKP/16FHgSuWoseTGMg4tUn9joVLavXisheX4OewZbLKWKUHZ/b2GFNBTHn4zzmLo0Wc6LZMDbzef4SvkkRKp4rutnfvBwbYIwDwMiCztxftet/rmmvusrVDehGK5i0VQmtzLu99JjQ+jxdoz+rrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQQ9Hv+dTyX0PIEmhU0fDEpfaLjMKEl6LBOX4AuZv7g=;
 b=PBJbhXNaJnFK8SvKW1eVrEhWlE/LkMxEMmLIpE5d1s/Wp2zPyIs/Bg/WytBO9Di99VLhNSttdaUnfW/komu7B3ieEYdet5H3jau6rVZjVrv7I7kBTdfnTQtzR9FErD3KeW8bOKa59E2QndYiN9HPG/AUSdL7qA/h6CwSREQqPWXY0JSVQbCZdLddTRp99IcSzntPFhg/WOJppCkjoWc8LqxbfvJlu4ZtK952bFl0ogZkctGhx5U9+DuWkhYX1Eyde+iyeU296qI+JzYMM5hOJY3PIl3jhJIdYo54M3O/XkzrMncg2AQhhDUG89T4TAiS+tt+H/9igyrrcCDYseZOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Fri, 24 Apr
 2026 07:16:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:16:18 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: "Wang, Jinfeng (CN)" <Jinfeng.Wang.CN@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 02/12] libsoup: fix
 CVE-2025-14523/CVE-2025-32049
Thread-Topic: [OE-core] [scarthgap][PATCH 02/12] libsoup: fix
 CVE-2025-14523/CVE-2025-32049
Thread-Index: AQHc00Q2NM3aooq2i0G4fJccDAhzl7XtzVDA
Date: Fri, 24 Apr 2026 07:16:17 +0000
Message-ID: 
 <DS0PR11MB73126A316573110FD8DD45AB822B2@DS0PR11MB7312.namprd11.prod.outlook.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-3-jinfeng.wang.cn@windriver.com>
 <DI0P845NZBF6.2EOFV0FW4KH53@smile.fr>
In-Reply-To: <DI0P845NZBF6.2EOFV0FW4KH53@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-24T07:16:16.954Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7312:EE_|IA1PR11MB7890:EE_
x-ms-office365-filtering-correlation-id: 9802f5b4-43bf-4a82-4ab5-08dea1d160e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|8096899003|13003099007|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 eMB4TpNQ8ZEqzBsU4q1rmGm91He54N5iESTDbWz8x5H3knmf25Go/IoYJhalklbtZd4D3Ybbrq95TGbDl94BLC6osohYhrGGYL1aabepl+iBTwlxC5H2DsodQ1FTfuUk/EXpNxY9wYanC8TiUXsllh+Q8asYLd6kZUl6OzvYmCDx9aSP8CG72n0xYn/T6ppgH0/4rPw73IDNzDKtmEXZCpdjVMA6XxZWeoaA3K36JRo627EXVwWw9czM6Oz8buQk7s8gROkzc8tUU4RIzC0jO2ep3+0enr0GUxxhPLHLVNLy5sAoH/8/KBBfYltnQrFDXpue6bDY88/6dxoLimQHs3DBkXbCS3pq1qz9JKTAmursSa9Xgo0nL9LCzJRAeUzoUIQmXG/9HaPyqOJu+aXtU3j4kiQuT5S5bZueAzAPphDThBpsxV9YfhuQciv8pQj9ja3DYZ9f2YH9oWmHJsuBSP617McuZq/4gMFddL6MhQVWiY50wPItZ9PEPsW/kMZFW63BdY8CnDYG+bcB0chk0w5LumbwEU11cVdTXEGiH7kFZJpTiifUm9Olzn2sGzG9Ckwl6wDeCqjoijZPo07kAcFhVltdgXlppSXtIlEy1oq9Hbze3UUvlMx59d51Zf1MGPt17Z4CD2NGVNIr7cYVqhYrBLlTbMR+RiW+dFOLkvnnJ89m0CbcyUfKuH4aE1Oej9Wu+v5NVy6XlH7RqqrV9BTTPNwy8vT/jzlRH4ut5Jbiwlfk7wzSmiYlnHOdPyLV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(8096899003)(13003099007)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qhTgcTTOJKXSbdB4I0yWK0fYQ93jpSAFhtJJyrbzKiwYXSyUogywClaA/g?=
 =?iso-8859-1?Q?QAiF16CmvJpnZhjpqDbZWDeCHkQXPs1LMoM+z9r/HcOOnav95igkUIbzKe?=
 =?iso-8859-1?Q?j7uY7P5000L2S4nl/bRy8JyvrHbTZGeRaxBGpRZ29HgOBt+l6cb6EFpaTi?=
 =?iso-8859-1?Q?/v9vr+fxtwl97CxBtnuQ5j/+6reTkhMeL4smnI76vWwZjR72VoxNtwkarJ?=
 =?iso-8859-1?Q?e+wFj18nP9mXgJvQaH1AtZiu/FXpiuQsXUsRU4HBNE3MqHsNc1oTAWz6T8?=
 =?iso-8859-1?Q?Qp0lqtLOnsPnBtOsL8Tx0m+U2NAyv56DJgk3sCJ6STm38UFsJUMfN9z8+V?=
 =?iso-8859-1?Q?oTNjQnmXzIWMEoslhxHi6aiLN580u0uau1SYri/GrPmSTSlBJ+LozcEZII?=
 =?iso-8859-1?Q?WS0ylExo/5u0jq7wYF0fhXheZKjXWKt3OSiu5w6krTlcnzRylNnB3WMkvB?=
 =?iso-8859-1?Q?tlqFyfCH/DxllaeD/4/uxGI7MaLhR2JMwDKO74HKOHL/0U5assV3YkmhSi?=
 =?iso-8859-1?Q?We+6Y0u2CpZx3j7PPXc2EaKFwQv6l2NfeUJbWYsOShjMPTlSheFu/4AaHt?=
 =?iso-8859-1?Q?dF6G3OJQxu0FZzZOshdLvVs/0PSIX8iHDb9Ob+dqoT/RaflZHrIYLXPFuD?=
 =?iso-8859-1?Q?c9mklbpwGQSoKoeOxbK3omOh0/Jqh6AXu152RvoT5GPIsfGa/pDe+aoLkL?=
 =?iso-8859-1?Q?Psc8XBGNnqTYxHR7EG0HNf5rmUpsRvkriu1RGwjw24woTcZ53yWmDg813r?=
 =?iso-8859-1?Q?XEWvOZqF9IMARE50O7lp2+u6p1draQXPQc4v1L1t3BdXcSL6p8rhzMW534?=
 =?iso-8859-1?Q?liKxGgSLloA/HhgB0Uf6bqLWQ5YZrhmPIp7K5I1eU7UGSE6hbKLhodvgyc?=
 =?iso-8859-1?Q?BklPVYgfm29wW3vTmcBLsO6MGjPzSSP36iUAUBZyLjFiDucvML/fPKIATq?=
 =?iso-8859-1?Q?gNNv6qIHeuc1cCY3l41fpWEmypVLta00N8OxSyId1eD97oTNLkX4X+8qYS?=
 =?iso-8859-1?Q?aGpPgjzcCkGHi1dM4A5Hkkeve6YAX+ms93B1uQqD/4THYqcupqmE1m6H/X?=
 =?iso-8859-1?Q?/nEgTlUYWmJa8B9Mhb0mFPpFCGUKzC/FS4GN7qv4PhUkBN167EBUiUCmMY?=
 =?iso-8859-1?Q?cXkafguar4cPUcFdxjlW5Lo0PsLe4yG8ZnlqIXzimIUzBpsSxSl0QFUAdI?=
 =?iso-8859-1?Q?SEVi/vXyulRlL+oOnipTAFdbbgVjPOSYl1GM0qyuJbb3WgAvuCZKzsPxWS?=
 =?iso-8859-1?Q?TNHcS36OKvyn8ct5H2UluwlwVL2NBF5RZ/RbTzyqdV5j+dRscUftq0/LYG?=
 =?iso-8859-1?Q?YFiGRIECr4jqOiN3/CiZ/9AzOW4M/59jtjU4XT9ZJh3PfhisfufKnAgFJN?=
 =?iso-8859-1?Q?nZqDR9JyOQYEpDLlVpUHxbqiOvJ6t6+R71B6dai7Ct2DbwplIhJVhPfiWc?=
 =?iso-8859-1?Q?3lCbNV/+P1D5/+FRAB0twhUEmD3oBZRfDISjwT1bozcy4DQjsfnJr2ddnx?=
 =?iso-8859-1?Q?DMIsLsWHotQsozQwA6W2NbX6i5WpzA86WsplvFh0r514lLj5RTcHoEjAcI?=
 =?iso-8859-1?Q?s1H9+PZGhrVRUfySSESomqLoTWtdHS7VUrosKZEx2jRzmuelFyq/tJy4kv?=
 =?iso-8859-1?Q?bKmAkI5wHYSof1UmyYP79Sj9bwTAfAxTIq4qeswR4OlMCizlUWOss9bqHV?=
 =?iso-8859-1?Q?8kxair8Qm6DSqWkBecmI+QeWqrppyh6S0YTF0wZA30QNW3degQYN/dZd12?=
 =?iso-8859-1?Q?Y6tYYU64E7VsiuVMZ5CHOeLqkhRz0sSBgKsXuWzUIqchVrKguavDX4ruzd?=
 =?iso-8859-1?Q?4729wFn1/2JUZHDiqWPQlkE7jhMJtc0M0Ua09dndSRTy2CJJi+L6HEycNc?=
 =?iso-8859-1?Q?nJ?=
x-ms-exchange-antispam-messagedata-1: /rA94n2fYMkQvg==
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB73126A316573110FD8DD45AB822B2DS0PR11MB7312namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	MswFfA0p/hZunqXkQCdPZF7xmPHB8paiYwHVJlTKA94YutSo9Ks9SdP7LM11n8oJDRrhUa1tSfeecHqxymugqNbQ1mQbCp+8yfhsASxBInh7doIsZlAAH+N4sXXoVPY4nEsVZ3Yy5e4Z57FcZrAZq284ME/dKJHqrCPB/VWaQh2ox56Cz2S6mZG16oPwfUdqpQ4+I6aobLMT82VfQ18qtL0e7Sz67gmqz8Lgfu2oeVep4H91lCYarZuPPe3/H/p4/DhQQxVnNWAXOHPcLqcyYpnmg86JZ8l5CXfcusVlU7UKe7IIhasCS8NRIyiLj0I3NrLWyTLcKIxRP3Bj0g0zBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9802f5b4-43bf-4a82-4ab5-08dea1d160e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 07:16:17.8976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D96FaFJ7gzcMqOd7Vi0v8wa+nyPzEn0/c6yAeILOuCxt3E18cr9tzNLVLDpQ5judOqjnCvK7FetibEGmP/qaztpx2HuiaOLebBl/ozBcTcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: jpu-lidbm9HKsFCJdBlOILCETa6SWL-h
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69eb18c6 cx=c_pps
 a=utdtqqQbqC3rwi1NYZt6Rw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=GHR8O2WEAAAA:20 a=A1X0JdhQAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=QIhr-27iAAAA:8 a=vggBfdFIAAAA:8 a=Re7gvdZ6iuu3mywg3Y8A:9
 a=GFdXm6h18mk6GF9j:21 a=wPNLvfGTeEIA:10 a=Hsl7rojFQxznK_tSI5IA:9
 a=UQUGPare4G4FGqIV:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-GUID: 6r0DFPRiRummwRFRK17goz6k4vx7cyqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA2NSBTYWx0ZWRfX03Xc+FfnB3bq
 xvvNnfJShVlAcWfwhRPBr1RytSmVDqIAvtO3KLP9PsEHjq76Xh4XYj0n40I17NfdpMqjCXD+0iG
 +50hMPXfSou3fmeCgsH36VvdlmBWSvux0ZTi2fmF3u4+WXjkvkto6k0efq2TVTSvcJUF4lhQrmF
 RBOSfIDSLKn0wTfRMz8gZC7a0MZ3KP057RvRqG+Stb62LyaoSujWHiR+3AdhlvJFgESzbtYfaLj
 KuTDFAjgFxTDcMmn8dQKcHAbmasO0DHmL9p3eq+E5kyA3+2YUzUzHt/Tj2XONYaubILbglKS3vF
 MSsdwxb8DV0R1XMeneCiioj3g2WGqexjP03a7tNwBZRx/xN6B90ISjfdamxpv3YbrgQF44LgbLi
 0OpjHVzEHmOnvLGdzxM2jGjXQB+a3e39TmXuI3fdd9BqhNQ1kdlMsMbq+3En0lxbR2r5/IoooTv
 rUg9JQp4mi7wjkHcYdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235839

--_000_DS0PR11MB73126A316573110FD8DD45AB822B2DS0PR11MB7312namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Friday, April 24, 2026 1:09 AM
To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 02/12] libsoup: fix CVE-2025-14523=
/CVE-2025-32049

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
>  .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
>  .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
>  .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++
>  .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
>  6 files changed, 1409 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-1=
4523.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-2.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-3.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-4.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..b90f8bd29d
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> @@ -0,0 +1,715 @@
> +From 70123da95418f5d6e00e8ac2d586fb6c5d02cdc6 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 7 Jan 2026 14:50:33 -0600
> +Subject: [PATCH] Reject duplicate Host headers
> +
> +RFC 9112 section 3.2 says:
> +
> +A server MUST respond with a 400 (Bad Request) status code to any
> +HTTP/1.1 request message that lacks a Host header field and to any
> +request message that contains more than one Host header field line or a
> +Host header field with an invalid field value.
> +
> +In addition to rejecting a duplicate header when parsing headers, also
> +reject attempts to add the duplicate header using the
> +soup_message_headers_append() API, and add tests for both cases.
> +
> +These checks will also apply to HTTP/2. I'm not sure whether this is
> +actually desired or not, but the header processing code is not aware of
> +which HTTP version is in use.
> +
> +(Note that while SoupMessageHeaders does not require the Host header to
> +be present in an HTTP/1.1 request, SoupServer itself does. So we can't
> +test the case of missing Host header via the header parsing test, but it
> +really is enforced.)
> +
> +Fixes #472
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/d3db5a6f8f03e1f0133754872877c92c0284c472]

Sorry but I don't see this commit mentionned in
(CVE-2025-14523) (#YWH-PGM9867-116) Lack of Duplicate Header Rejection in l=
ibsoup can lead to host header parsing discrepancy between libsoup server a=
nd proxy (#472) =B7 Issue =B7 GNOME/libsoup
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472

I admit this commit looks related but I very much like a detailled trail
between a trusted source (eg. NVD, debian security tracker or upstream)
and the commit.

Also, that commit is only in the "mcatanzaro/rhel9" branch, that would
need some justification.

This may apply to the other CVE.

I  pasted the commit link for libsoup2 by accident,  actually,  this patch =
is from https://gitlab.gnome.org/GNOME/libsoup/-/commit/aecd8daadc110f8561f=
b2d6b2806a4cacf2e4c85,
the link address in commit message need update.

Finally, I'd rather have 1 CVE fix per commit, would it be possible to
split the commit?

Sure!

Regards
//Changqing

Thanks!

> +CVE: CVE-2025-14523
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c                 |   3 +-
> + libsoup/soup-message-headers-private.h |   4 +-
> + libsoup/soup-message-headers.c         |  80 +++++++------
> + tests/header-parsing-test.c            | 148 +++++++++++++++++--------
> + 4 files changed, 153 insertions(+), 82 deletions(-)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index 155c11d..3fec9b3 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -139,7 +139,8 @@ soup_headers_parse (const char *str, int len, SoupMe=
ssageHeaders *dest)
> +             for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> +                     *p =3D ' ';
> +
> +-            soup_message_headers_append_untrusted_data (dest, name, val=
ue);
> ++            if (!soup_message_headers_append_untrusted_data (dest, name=
, value))
> ++                        goto done;
> +         }
> +     success =3D TRUE;
> +
> +diff --git a/libsoup/soup-message-headers-private.h b/libsoup/soup-messa=
ge-headers-private.h
> +index 9815464..770f3ef 100644
> +--- a/libsoup/soup-message-headers-private.h
> ++++ b/libsoup/soup-message-headers-private.h
> +@@ -10,10 +10,10 @@
> +
> + G_BEGIN_DECLS
> +
> +-void        soup_message_headers_append_untrusted_data  (SoupMessageHea=
ders *hdrs,
> ++gboolean    soup_message_headers_append_untrusted_data  (SoupMessageHea=
ders *hdrs,
> +                                                          const char    =
     *name,
> +                                                          const char    =
     *value);
> +-void        soup_message_headers_append_common          (SoupMessageHea=
ders *hdrs,
> ++gboolean    soup_message_headers_append_common          (SoupMessageHea=
ders *hdrs,
> +                                                          SoupHeaderName=
      name,
> +                                                          const char    =
     *value);
> + const char *soup_message_headers_get_one_common         (SoupMessageHea=
ders *hdrs,
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index d69d6e8..ce4b3b3 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -267,12 +267,16 @@ soup_message_headers_clean_connection_headers (Sou=
pMessageHeaders *hdrs)
> +     soup_header_free_list (tokens);
> + }
> +
> +-void
> ++gboolean
> + soup_message_headers_append_common (SoupMessageHeaders *hdrs,
> +                                     SoupHeaderName      name,
> +                                     const char         *value)
> + {
> +         SoupCommonHeader header;
> ++        if (name =3D=3D SOUP_HEADER_HOST && soup_message_headers_get_on=
e (hdrs, "Host")) {
> ++                g_warning ("soup_message_headers_append_common: Rejecti=
ng duplicate Host header");
> ++                return FALSE;
> ++        }
> +
> +         if (!hdrs->common_headers)
> +                 hdrs->common_headers =3D g_array_sized_new (FALSE, FALS=
E, sizeof (SoupCommonHeader), 6);
> +@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessageHea=
ders *hdrs,
> +                 g_hash_table_remove (hdrs->common_concat, GUINT_TO_POIN=
TER (header.name));
> +
> +         soup_message_headers_set (hdrs, name, value);
> ++        return TRUE;
> + }
> +
> +-/**
> +- * soup_message_headers_append:
> +- * @hdrs: a #SoupMessageHeaders
> +- * @name: the header name to add
> +- * @value: the new value of @name
> +- *
> +- * Appends a new header with name @name and value @value to @hdrs.
> +- *
> +- * (If there is an existing header with name @name, then this creates a=
 second
> +- * one, which is only allowed for list-valued headers; see also
> +- * [method@MessageHeaders.replace].)
> +- *
> +- * The caller is expected to make sure that @name and @value are
> +- * syntactically correct.
> +- **/
> +-void
> +-soup_message_headers_append (SoupMessageHeaders *hdrs,
> +-                         const char *name, const char *value)
> ++static gboolean
> ++soup_message_headers_append_internal (SoupMessageHeaders *hdrs,
> ++                         const char *name, const char *value)
> + {
> +     SoupUncommonHeader header;
> +         SoupHeaderName header_name;
> +
> +-    g_return_if_fail (name !=3D NULL);
> +-    g_return_if_fail (value !=3D NULL);
> ++    g_return_val_if_fail (name !=3D NULL, FALSE);
> ++    g_return_val_if_fail (value !=3D NULL, FALSE);
> +
> +     /* Setting a syntactically invalid header name or value is
> +      * considered to be a programming error. However, it can also
> +@@ -317,23 +307,22 @@ soup_message_headers_append (SoupMessageHeaders *h=
drs,
> +      * compiled with G_DISABLE_CHECKS.
> +      */
> + #ifndef G_DISABLE_CHECKS
> +-    g_return_if_fail (*name && strpbrk (name, " \t\r\n:") =3D=3D NULL);
> +-    g_return_if_fail (strpbrk (value, "\r\n") =3D=3D NULL);
> ++    g_return_val_if_fail (*name && strpbrk (name, " \t\r\n:") =3D=3D NU=
LL, FALSE);
> ++    g_return_val_if_fail (strpbrk (value, "\r\n") =3D=3D NULL, FALSE);
> + #else
> +     if (*name && strpbrk (name, " \t\r\n:")) {
> +-            g_warning ("soup_message_headers_append: Ignoring bad name =
'%s'", name);
> +-            return;
> ++            g_warning ("soup_message_headers_append: Rejecting bad name=
 '%s'", name);
> ++            return FALSE;
> +     }
> +     if (strpbrk (value, "\r\n")) {
> +-            g_warning ("soup_message_headers_append: Ignoring bad value=
 '%s'", value);
> +-            return;
> ++            g_warning ("soup_message_headers_append: Rejecting bad valu=
e '%s'", value);
> ++            return FALSE;
> +     }
> + #endif
> +
> +         header_name =3D soup_header_name_from_string (name);
> +         if (header_name !=3D SOUP_HEADER_UNKNOWN) {
> +-                soup_message_headers_append_common (hdrs, header_name, =
value);
> +-                return;
> ++                return soup_message_headers_append_common (hdrs, header=
_name, value);
> +         }
> +
> +         if (!hdrs->uncommon_headers)
> +@@ -344,21 +333,48 @@ soup_message_headers_append (SoupMessageHeaders *h=
drs,
> +     g_array_append_val (hdrs->uncommon_headers, header);
> +     if (hdrs->uncommon_concat)
> +             g_hash_table_remove (hdrs->uncommon_concat, header.name);
> ++        return TRUE;
> ++}
> ++
> ++/**
> ++ * soup_message_headers_append:
> ++ * @hdrs: a #SoupMessageHeaders
> ++ * @name: the header name to add
> ++ * @value: the new value of @name
> ++ *
> ++ * Appends a new header with name @name and value @value to @hdrs.
> ++ *
> ++ * (If there is an existing header with name @name, then this creates a=
 second
> ++ * one, which is only allowed for list-valued headers; see also
> ++ * [method@MessageHeaders.replace].)
> ++ *
> ++ * The caller is expected to make sure that @name and @value are
> ++ * syntactically correct.
> ++ **/
> ++void
> ++soup_message_headers_append (SoupMessageHeaders *hdrs,
> ++                         const char *name, const char *value)
> ++{
> ++    soup_message_headers_append_internal (hdrs, name, value);
> + }
> +
> + /*
> +- * Appends a header value ensuring that it is valid UTF8.
> ++ * Appends a header value ensuring that it is valid UTF-8, and also che=
cking the
> ++ * return value of soup_message_headers_append_internal() to report whe=
ther the
> ++ * headers are invalid for various other reasons.
> +  */
> +-void
> ++gboolean
> + soup_message_headers_append_untrusted_data (SoupMessageHeaders *hdrs,
> +                                             const char         *name,
> +                                             const char         *value)
> + {
> +         char *safe_value =3D g_utf8_make_valid (value, -1);
> +         char *safe_name =3D g_utf8_make_valid (name, -1);
> +-        soup_message_headers_append (hdrs, safe_name, safe_value);
> ++        gboolean result =3D soup_message_headers_append_internal (hdrs,=
 safe_name, safe_value);
> ++
> +         g_free (safe_value);
> +         g_free (safe_name);
> ++        return result;
> + }
> +
> + void
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index 9490559..98a22a4 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -24,6 +24,7 @@ static struct RequestTest {
> +     const char *method, *path;
> +     SoupHTTPVersion version;
> +     Header headers[10];
> ++    GLogLevelFlags log_flags;
> + } reqtests[] =3D {
> +     /**********************/
> +     /*** VALID REQUESTS ***/
> +@@ -33,7 +34,7 @@ static struct RequestTest {
> +       "GET / HTTP/1.0\r\n", -1,
> +       SOUP_STATUS_OK,
> +       "GET", "/", SOUP_HTTP_1_0,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Req w/ 1 header", NULL,
> +@@ -42,7 +43,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header, no leading whitespace", NULL,
> +@@ -51,7 +52,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header including trailing whitespace", NULL,
> +@@ -60,7 +61,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header, wrapped", NULL,
> +@@ -69,7 +70,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header, wrapped with additional whitespace", NULL,
> +@@ -78,7 +79,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header, wrapped with tab", NULL,
> +@@ -87,7 +88,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header, wrapped before value", NULL,
> +@@ -96,7 +97,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 1 header with empty value", NULL,
> +@@ -105,7 +106,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 2 headers", NULL,
> +@@ -115,7 +116,7 @@ static struct RequestTest {
> +       { { "Host", "example.com" },
> +         { "Connection", "close" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 3 headers", NULL,
> +@@ -126,7 +127,7 @@ static struct RequestTest {
> +         { "Connection", "close" },
> +         { "Blah", "blah" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 3 headers, 1st wrapped", NULL,
> +@@ -137,7 +138,7 @@ static struct RequestTest {
> +             { "Foo", "bar baz" },
> +         { "Blah", "blah" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 3 headers, 2nd wrapped", NULL,
> +@@ -148,7 +149,7 @@ static struct RequestTest {
> +         { "Blah", "blah" },
> +         { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ 3 headers, 3rd wrapped", NULL,
> +@@ -159,7 +160,7 @@ static struct RequestTest {
> +         { "Blah", "blah" },
> +         { "Foo", "bar baz" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ same header multiple times", NULL,
> +@@ -168,7 +169,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Foo", "bar, baz, quux" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Connection header on HTTP/1.0 message", NULL,
> +@@ -178,21 +179,21 @@ static struct RequestTest {
> +       { { "Connection", "Bar, Quux" },
> +             { "Foo", "bar" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "GET with full URI", "667637",
> +       "GET http://example.com HTTP/1.1\r\n", -1,
> +       SOUP_STATUS_OK,
> +       "GET", "http://example.com", SOUP_HTTP_1_1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "GET with full URI in upper-case", "667637",
> +       "GET HTTP://example.com HTTP/1.1\r\n", -1,
> +       SOUP_STATUS_OK,
> +       "GET", "HTTP://example.com", SOUP_HTTP_1_1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     /* It's better for this to be passed through: this means a SoupServ=
er
> +@@ -202,7 +203,7 @@ static struct RequestTest {
> +       "GET AbOuT: HTTP/1.1\r\n", -1,
> +       SOUP_STATUS_OK,
> +       "GET", "AbOuT:", SOUP_HTTP_1_1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     /****************************/
> +@@ -217,7 +218,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     /* RFC 2616 section 3.1 says we MUST accept this */
> +@@ -228,7 +229,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     /* RFC 2616 section 19.3 says we SHOULD accept these */
> +@@ -240,7 +241,7 @@ static struct RequestTest {
> +       { { "Host", "example.com" },
> +         { "Connection", "close" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "LF instead of CRLF after Request-Line", NULL,
> +@@ -249,7 +250,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Mixed CRLF/LF", "666316",
> +@@ -261,7 +262,7 @@ static struct RequestTest {
> +         { "e", "f" },
> +         { "g", "h" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ incorrect whitespace in Request-Line", NULL,
> +@@ -270,7 +271,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Req w/ incorrect whitespace after Request-Line", "475169",
> +@@ -279,7 +280,7 @@ static struct RequestTest {
> +       "GET", "/", SOUP_HTTP_1_1,
> +       { { "Host", "example.com" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     /* If the request/status line is parseable, then we
> +@@ -293,7 +294,7 @@ static struct RequestTest {
> +       { { "Host", "example.com" },
> +         { "Bar", "two" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "First header line is continuation", "666316",
> +@@ -303,7 +304,7 @@ static struct RequestTest {
> +       { { "Host", "example.com" },
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Zero-length header name", "666316",
> +@@ -313,7 +314,7 @@ static struct RequestTest {
> +       { { "a", "b" },
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "CR in header name", "666316",
> +@@ -323,7 +324,7 @@ static struct RequestTest {
> +       { { "a", "b" },
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "CR in header value", "666316",
> +@@ -336,7 +337,7 @@ static struct RequestTest {
> +         { "s", "t" },               /* CR at end is ignored */
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Tab in header name", "666316",
> +@@ -351,7 +352,7 @@ static struct RequestTest {
> +         { "p", "q z: w" },
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     { "Tab in header value", "666316",
> +@@ -364,7 +365,7 @@ static struct RequestTest {
> +         { "z", "w" },       /* trailing tab ignored */
> +         { "c", "d" },
> +         { NULL }
> +-      }
> ++      }, 0
> +     },
> +
> +     /************************/
> +@@ -375,77 +376,77 @@ static struct RequestTest {
> +       "GET /\r\n", -1,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "HTTP 1.2 request (no such thing)", NULL,
> +       "GET / HTTP/1.2\r\n", -1,
> +       SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "HTTP 2000 request (no such thing)", NULL,
> +       "GET / HTTP/2000.0\r\n", -1,
> +       SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Long HTTP version terminating at missing minor version", "https:=
//gitlab.gnome.org/GNOME/libsoup/-/issues/404",
> +       unterminated_http_version, sizeof (unterminated_http_version),
> +       SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Non-HTTP request", NULL,
> +       "GET / SOUP/1.1\r\nHost: example.com\r\n", -1,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Junk after Request-Line", NULL,
> +       "GET / HTTP/1.1 blah\r\nHost: example.com\r\n", -1,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "NUL in Method", NULL,
> +       "G\x00T / HTTP/1.1\r\nHost: example.com\r\n", 37,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "NUL at beginning of Method", "666316",
> +       "\x00 / HTTP/1.1\r\nHost: example.com\r\n", 35,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "NUL in Path", NULL,
> +       "GET /\x00 HTTP/1.1\r\nHost: example.com\r\n", 38,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "No terminating CRLF", NULL,
> +       "GET / HTTP/1.1\r\nHost: example.com", -1,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Unrecognized expectation", NULL,
> +       "GET / HTTP/1.1\r\nHost: example.com\r\nExpect: the-impossible\r\=
n", -1,
> +       SOUP_STATUS_EXPECTATION_FAILED,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     // https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> +@@ -453,21 +454,40 @@ static struct RequestTest {
> +       "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> +       SOUP_STATUS_BAD_REQUEST,
> +       NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "NUL in header value", NULL,
> +       "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> +       SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> +     },
> +
> +     { "Only newlines", NULL,
> +       only_newlines, sizeof (only_newlines),
> +       SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-      { { NULL } }
> ++      { { NULL } }, 0
> ++    },
> ++    { "Duplicate Host headers",
> ++      "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++      "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
> ++      -1,
> ++      SOUP_STATUS_BAD_REQUEST,
> ++      NULL, NULL, -1,
> ++      { { NULL } },
> ++      G_LOG_LEVEL_WARNING
> ++    },
> ++
> ++    { "Duplicate Host headers, case insensitive",
> ++      "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++      "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
> ++      -1,
> ++      SOUP_STATUS_BAD_REQUEST,
> ++      NULL, NULL, -1,
> ++      { { NULL } },
> ++      G_LOG_LEVEL_WARNING
> +     }
> + };
> + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
> +@@ -915,10 +935,17 @@ do_request_tests (void)
> +                     len =3D strlen (reqtests[i].request);
> +             else
> +                     len =3D reqtests[i].length;
> ++
> ++            if (reqtests[i].log_flags)
> ++                    g_test_expect_message ("libsoup", reqtests[i].log_f=
lags, "*");
> ++
> +             status =3D soup_headers_parse_request (reqtests[i].request,=
 len,
> +                                                  headers, &method, &pat=
h,
> +                                                  &version);
> +             g_assert_cmpint (status, =3D=3D, reqtests[i].status);
> ++            if (reqtests[i].log_flags)
> ++                    g_test_assert_expected_messages ();
> ++
> +             if (SOUP_STATUS_IS_SUCCESSFUL (status)) {
> +                     g_assert_cmpstr (method, =3D=3D, reqtests[i].method=
);
> +                     g_assert_cmpstr (path, =3D=3D, reqtests[i].path);
> +@@ -1312,6 +1339,32 @@ do_bad_header_tests (void)
> +     soup_message_headers_unref (hdrs);
> + }
> +
> ++static void
> ++do_append_duplicate_host_test (void)
> ++{
> ++   SoupMessageHeaders *hdrs;
> ++   const char *list_value;
> ++
> ++   hdrs =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
> ++   soup_message_headers_append (hdrs, "Host", "a");
> ++
> ++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
> ++                      "soup_message_headers_append_common: Rejecting du=
plicate Host header");
> ++   soup_message_headers_append (hdrs, "Host", "b");
> ++   g_test_assert_expected_messages ();
> ++
> ++        /* Case insensitive */
> ++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
> ++                      "soup_message_headers_append_common: Rejecting du=
plicate Host header");
> ++   soup_message_headers_append (hdrs, "host", "b");
> ++   g_test_assert_expected_messages ();
> ++
> ++   list_value =3D soup_message_headers_get_list (hdrs, "Host");
> ++   g_assert_cmpstr (list_value, =3D=3D, "a");
> ++
> ++   soup_message_headers_unref (hdrs);
> ++}
> ++
> + int
> + main (int argc, char **argv)
> + {
> +@@ -1327,6 +1380,7 @@ main (int argc, char **argv)
> +     g_test_add_func ("/header-parsing/content-type", do_content_type_te=
sts);
> +     g_test_add_func ("/header-parsing/append-param", do_append_param_te=
sts);
> +     g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
> ++    g_test_add_func ("/header-parsing/append-duplicate-host", do_append=
_duplicate_host_test);
> +
> +     ret =3D g_test_run ();
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
> new file mode 100644
> index 0000000000..0772c759dc
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
> @@ -0,0 +1,229 @@
> +From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 24 Jul 2024 15:20:35 +0200
> +Subject: [PATCH 1/4] websocket: add a way to restrict the total message =
size
> +
> +Otherwise a client could send small packages smaller than
> +total-incoming-payload-size but still to break the server
> +with a big allocation
> +
> +Fixes: #390
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/db87805ab565d67533dfed2cb409dbfd63c7fdce]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/websocket/soup-websocket-connection.c | 107 +++++++++++++++++-
> + libsoup/websocket/soup-websocket-connection.h |   7 ++
> + 2 files changed, 110 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/web=
socket/soup-websocket-connection.c
> +index 5eb8150..19bdd39 100644
> +--- a/libsoup/websocket/soup-websocket-connection.c
> ++++ b/libsoup/websocket/soup-websocket-connection.c
> +@@ -84,7 +84,7 @@ enum {
> +     PROP_MAX_INCOMING_PAYLOAD_SIZE,
> +     PROP_KEEPALIVE_INTERVAL,
> +     PROP_EXTENSIONS,
> +-
> ++    PROP_MAX_TOTAL_MESSAGE_SIZE,
> +         LAST_PROPERTY
> + };
> +
> +@@ -126,6 +126,7 @@ typedef struct {
> +     char *origin;
> +     char *protocol;
> +     guint64 max_incoming_payload_size;
> ++    guint64 max_total_message_size;
> +     guint keepalive_interval;
> +
> +     gushort peer_close_code;
> +@@ -156,6 +157,7 @@ typedef struct {
> + } SoupWebsocketConnectionPrivate;
> +
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +
> +@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection *s=
elf)
> + }
> +
> + static void
> +-too_big_error_and_close (SoupWebsocketConnection *self,
> +-                         guint64 payload_len)
> ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self=
,
> ++                                          guint64 payload_len)
> + {
> +         SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connect=
ion_get_instance_private (self);
> +     GError *error;
> +@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection *s=
elf,
> +     emit_error_and_close (self, error, TRUE);
> + }
> +
> ++static void
> ++too_big_message_error_and_close (SoupWebsocketConnection *self,
> ++                                 guint64 len)
> ++{
> ++    SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_=
get_instance_private (self);
> ++    GError *error;
> ++
> ++    error =3D g_error_new_literal (SOUP_WEBSOCKET_ERROR,
> ++                                 SOUP_WEBSOCKET_CLOSE_TOO_BIG,
> ++                                 priv->connection_type =3D=3D SOUP_WEBS=
OCKET_CONNECTION_SERVER ?
> ++                                 "Received WebSocket payload from the c=
lient larger than configured max-total-message-size" :
> ++                                 "Received WebSocket payload from the s=
erver larger than configured max-total-message-size");
> ++    g_debug ("%s received message of size %" G_GUINT64_FORMAT " or grea=
ter, but max supported size is %" G_GUINT64_FORMAT,
> ++             priv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SER=
VER ? "server" : "client",
> ++             len, priv->max_total_message_size);
> ++    emit_error_and_close (self, error, TRUE);
> ++}
> ++
> + static void
> + close_connection (SoupWebsocketConnection *self,
> +                   gushort                  code,
> +@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,
> +             switch (priv->message_opcode) {
> +             case 0x01:
> +             case 0x02:
> ++                    /* Safety valve */
> ++                    if (priv->max_total_message_size > 0 &&
> ++                        (priv->message_data->len + payload_len) > priv-=
>max_total_message_size) {
> ++                            too_big_message_error_and_close (self, (pri=
v->message_data->len + payload_len));
> ++                            return;
> ++                    }
> +                     g_byte_array_append (priv->message_data, payload, p=
ayload_len);
> +                     break;
> +             default:
> +@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)
> +     /* Safety valve */
> +     if (priv->max_incoming_payload_size > 0 &&
> +         payload_len > priv->max_incoming_payload_size) {
> +-            too_big_error_and_close (self, payload_len);
> ++            too_big_incoming_payload_error_and_close (self, payload_len=
);
> +             return FALSE;
> +     }
> +
> +@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObject *=
object,
> +             g_value_set_pointer (value, priv->extensions);
> +             break;
> +
> ++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++            g_value_set_uint64 (value, priv->max_total_message_size);
> ++            break;
> ++
> +     default:
> +             G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> +             break;
> +@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObject *=
object,
> +             priv->extensions =3D g_value_get_pointer (value);
> +             break;
> +
> ++    case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++            priv->max_total_message_size =3D g_value_get_uint64 (value)=
;
> ++            break;
> ++
> +     default:
> +             G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> +             break;
> +@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +                                       G_PARAM_CONSTRUCT_ONLY |
> +                                       G_PARAM_STATIC_STRINGS);
> +
> ++    /**
> ++     * SoupWebsocketConnection:max-total-message-size:
> ++     *
> ++     * The total message size for incoming packets.
> ++     *
> ++     * The protocol expects or 0 to not limit it.
> ++     *
> ++     * Since: 3.8
> ++     */
> ++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =3D
> ++                g_param_spec_uint64 ("max-total-message-size",
> ++                                     "Max total message size",
> ++                                     "Max total message size ",
> ++                                     0,
> ++                                     G_MAXUINT64,
> ++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                     G_PARAM_READWRITE |
> ++                                     G_PARAM_CONSTRUCT |
> ++                                     G_PARAM_STATIC_STRINGS);
> ++
> +         g_object_class_install_properties (gobject_class, LAST_PROPERTY=
, properties);
> +
> +     /**
> +@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_payloa=
d_size (SoupWebsocketConnection
> +     }
> + }
> +
> ++/**
> ++ * soup_websocket_connection_get_max_total_message_size:
> ++ * @self: the WebSocket
> ++ *
> ++ * Gets the maximum total message size allowed for packets.
> ++ *
> ++ * Returns: the maximum total message size.
> ++ *
> ++ * Since: 3.8
> ++ */
> ++guint64
> ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConn=
ection *self)
> ++{
> ++    SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_=
get_instance_private (self);
> ++
> ++    g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTA=
L_MESSAGE_SIZE_DEFAULT);
> ++
> ++    return priv->max_total_message_size;
> ++}
> ++
> ++/**
> ++ * soup_websocket_connection_set_max_total_message_size:
> ++ * @self: the WebSocket
> ++ * @max_total_message_size: the maximum total message size
> ++ *
> ++ * Sets the maximum total message size allowed for packets.
> ++ *
> ++ * It does not limit the outgoing packet size.
> ++ *
> ++ * Since: 3.8
> ++ */
> ++void
> ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConn=
ection *self,
> ++                                                      guint64          =
        max_total_message_size)
> ++{
> ++    SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_=
get_instance_private (self);
> ++
> ++    g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
> ++
> ++    if (priv->max_total_message_size !=3D max_total_message_size) {
> ++            priv->max_total_message_size =3D max_total_message_size;
> ++            g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_=
MAX_TOTAL_MESSAGE_SIZE]);
> ++    }
> ++}
> ++
> + /**
> +  * soup_websocket_connection_get_keepalive_interval:
> +  * @self: the WebSocket
> +diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/web=
socket/soup-websocket-connection.h
> +index eeb093d..922de56 100644
> +--- a/libsoup/websocket/soup-websocket-connection.h
> ++++ b/libsoup/websocket/soup-websocket-connection.h
> +@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
> + void                soup_websocket_connection_set_max_incoming_payload_=
size (SoupWebsocketConnection *self,
> +                                                                        =
      guint64                  max_incoming_payload_size);
> +
> ++SOUP_AVAILABLE_IN_3_0
> ++guint64             soup_websocket_connection_get_max_total_message_siz=
e    (SoupWebsocketConnection *self);
> ++
> ++SOUP_AVAILABLE_IN_3_0
> ++void                soup_websocket_connection_set_max_total_message_siz=
e    (SoupWebsocketConnection *self,
> ++                                                                       =
      guint64                  max_total_message_size);
> ++
> + SOUP_AVAILABLE_IN_ALL
> + guint               soup_websocket_connection_get_keepalive_interval (S=
oupWebsocketConnection *self);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
> new file mode 100644
> index 0000000000..6f00fabfdb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
> @@ -0,0 +1,34 @@
> +From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Fri, 20 Sep 2024 12:12:38 +0200
> +Subject: [PATCH 2/4] websocket-test: set the total message size
> +
> +This is required when sending a big amount of data
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/4904a46a2d9a014efa6be01a186ac353dbf5047b]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index a0b8334..827b041 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,
> +     soup_websocket_connection_set_max_incoming_payload_size (test->serv=
er, 1000 * 1000 + 1);
> +     g_assert (soup_websocket_connection_get_max_incoming_payload_size (=
test->server) =3D=3D (1000 * 1000 + 1));
> +
> ++    soup_websocket_connection_set_max_total_message_size (test->client,=
 1000 * 1000 + 1);
> ++    g_assert (soup_websocket_connection_get_max_total_message_size (tes=
t->client) =3D=3D (1000 * 1000 + 1));
> ++    soup_websocket_connection_set_max_total_message_size (test->server,=
 1000 * 1000 + 1);
> ++    g_assert (soup_websocket_connection_get_max_total_message_size (tes=
t->server) =3D=3D (1000 * 1000 + 1));
> ++
> +     sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 10=
00);
> +     soup_websocket_connection_send_text (test->server, g_bytes_get_data=
 (sent, NULL));
> +     WAIT_UNTIL (received !=3D NULL);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
> new file mode 100644
> index 0000000000..29fb0d7ddb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
> @@ -0,0 +1,134 @@
> +From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Thu, 8 May 2025 16:16:25 -0500
> +Subject: [PATCH] Set message size limit in SoupServer rather than
> + SoupWebsocketConnection
> +
> +We're not sure about the compatibility implications of having a default
> +size limit for clients.
> +
> +Also not sure whether the server limit is actually set appropriately,
> +but there is probably very little server usage of
> +SoupWebsocketConnection in the wild, so it's not so likely to break
> +things.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/server/soup-server.c                  | 24 +++++++++++++----
> + libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++------
> + 2 files changed, 37 insertions(+), 13 deletions(-)
> +
> +diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
> +index 6b486f5..c779f7d 100644
> +--- a/libsoup/server/soup-server.c
> ++++ b/libsoup/server/soup-server.c
> +@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] =3D { =
NULL, };
> +
> + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
> +
> ++/* SoupWebsocketConnection by default limits only maximum packet size. =
But a
> ++ * message may consist of multiple packets, so SoupServer additionally =
restricts
> ++ * total message size to mitigate denial of service attacks on the serv=
er.
> ++ * SoupWebsocketConnection does not do this by default because I don't =
know
> ++ * whether that would or would not cause compatibility problems for web=
sites.
> ++ *
> ++ * This size is in bytes and it is arbitrary.
> ++ */
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> ++
> + static void request_finished (SoupServerMessage      *msg,
> +                               SoupMessageIOCompletion completion,
> +                               SoupServer             *server);
> +@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer        *ser=
ver,
> +
> +     g_object_ref (msg);
> +     stream =3D soup_server_message_steal_connection (msg);
> +-    conn =3D soup_websocket_connection_new (stream, uri,
> +-                                          SOUP_WEBSOCKET_CONNECTION_SER=
VER,
> +-                                          soup_message_headers_get_one_=
common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
> +-                                          soup_message_headers_get_one_=
common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEB=
SOCKET_PROTOCOL),
> +-                                          handler->websocket_extensions=
);
> ++    conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCK=
ET_CONNECTION,
> ++                                      "io-stream", stream,
> ++                                      "uri", uri,
> ++                                      "connection-type", SOUP_WEBSOCKET=
_CONNECTION_SERVER,
> ++                                      "origin", soup_message_headers_ge=
t_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_OR=
IGIN),
> ++                                      "protocol", soup_message_headers_=
get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER=
_SEC_WEBSOCKET_PROTOCOL),
> ++                                      "extensions", handler->websocket_=
extensions,
> ++                                      "max-total-message-size", (guint6=
4)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                      NULL));
> +     handler->websocket_extensions =3D NULL;
> +     g_object_unref (stream);
> +
> +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/web=
socket/soup-websocket-connection.c
> +index 26476df..cbb1b72 100644
> +--- a/libsoup/websocket/soup-websocket-connection.c
> ++++ b/libsoup/websocket/soup-websocket-connection.c
> +@@ -149,7 +149,6 @@ typedef struct {
> + } SoupWebsocketConnectionPrivate;
> +
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +
> +@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +     /**
> +      * SoupWebsocketConnection:max-incoming-payload-size:
> +      *
> +-     * The maximum payload size for incoming packets.
> +-     *
> +-     * The protocol expects or 0 to not limit it.
> ++     * The maximum payload size for incoming packets, or 0 to not limit=
 it.
> ++     *
> ++     * Each message may consist of multiple packets, so also refer to
> ++     * [property@WebSocketConnection:max-total-message-size].
> +      */
> +         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =3D
> +                 g_param_spec_uint64 ("max-incoming-payload-size",
> +@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +     /**
> +      * SoupWebsocketConnection:max-total-message-size:
> +      *
> +-     * The total message size for incoming packets.
> ++     * The maximum size for incoming messages.
> ++     *
> ++     * Set to a value to limit the total message size, or 0 to not
> ++     * limit it.
> ++     *
> ++     * [method@Server.add_websocket_handler] will set this to a nonzero
> ++     * default value to mitigate denial of service attacks. Clients mus=
t
> ++     * choose their own default if they need to mitigate denial of serv=
ice
> ++     * attacks. You also need to set your own default if creating your =
own
> ++     * server SoupWebsocketConnection without using SoupServer.
> +      *
> +-     * The protocol expects or 0 to not limit it.
> ++     * Each message may consist of multiple packets, so also refer to
> ++     * [property@WebSocketConnection:max-incoming-payload-size].
> +      *
> +      * Since: 3.8
> +      */
> +@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> +                                      "Max total message size ",
> +                                      0,
> +                                      G_MAXUINT64,
> +-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                     0,
> +                                      G_PARAM_READWRITE |
> +                                      G_PARAM_CONSTRUCT |
> +                                      G_PARAM_STATIC_STRINGS);
> +@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message_si=
ze (SoupWebsocketConnection *s
> + {
> +     SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_=
get_instance_private (self);
> +
> +-    g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTA=
L_MESSAGE_SIZE_DEFAULT);
> ++    g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
> +
> +     return priv->max_total_message_size;
> + }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
> new file mode 100644
> index 0000000000..6f391e98e2
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
> @@ -0,0 +1,292 @@
> +From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Fri, 16 May 2025 16:55:40 -0500
> +Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
> + max-total-message-size
> +
> +An even better test would verify that it's possible to send big messages
> +containing small packets, but libsoup doesn't offer control over packet
> +size, and I don't want to take the time to learn how WebSockets work to
> +figure out how to do that manually. Instead, I just check that both
> +limits work, for both client and server.
> +
> +I didn't add deflate variants of these tests because I doubt that would
> +add valuable coverage.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++----
> + 1 file changed, 197 insertions(+), 17 deletions(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 827b041..ec1324c 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,
> + {
> +     GBytes *sent =3D NULL;
> +     GBytes *received =3D NULL;
> ++    gulong signal_id;
> +
> +-    g_signal_connect (test->client, "message", G_CALLBACK (on_text_mess=
age), &received);
> +-
> +-    sent =3D g_bytes_new_take (g_strnfill (400, '!'), 400);
> +-    soup_websocket_connection_send_text (test->server, g_bytes_get_data=
 (sent, NULL));
> +-    WAIT_UNTIL (received !=3D NULL);
> +-    g_assert (g_bytes_equal (sent, received));
> +-    g_bytes_unref (sent);
> +-    g_bytes_unref (received);
> +-    received =3D NULL;
> ++    signal_id =3D g_signal_connect (test->client, "message", G_CALLBACK=
 (on_text_message), &received);
> +
> +     sent =3D g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000=
);
> +     soup_websocket_connection_send_text (test->server, g_bytes_get_data=
 (sent, NULL));
> +@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,
> +     received =3D NULL;
> +
> +     soup_websocket_connection_set_max_incoming_payload_size (test->clie=
nt, 1000 * 1000 + 1);
> +-    g_assert (soup_websocket_connection_get_max_incoming_payload_size (=
test->client) =3D=3D (1000 * 1000 + 1));
> ++    g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payloa=
d_size (test->client), =3D=3D, 1000 * 1000 + 1);
> +     soup_websocket_connection_set_max_incoming_payload_size (test->serv=
er, 1000 * 1000 + 1);
> +-    g_assert (soup_websocket_connection_get_max_incoming_payload_size (=
test->server) =3D=3D (1000 * 1000 + 1));
> ++    g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payloa=
d_size (test->server), =3D=3D, 1000 * 1000 + 1);
> +
> +     soup_websocket_connection_set_max_total_message_size (test->client,=
 1000 * 1000 + 1);
> +-    g_assert (soup_websocket_connection_get_max_total_message_size (tes=
t->client) =3D=3D (1000 * 1000 + 1));
> ++    g_assert_cmpuint (soup_websocket_connection_get_max_total_message_s=
ize (test->client), =3D=3D, 1000 * 1000 + 1);
> +     soup_websocket_connection_set_max_total_message_size (test->server,=
 1000 * 1000 + 1);
> +-    g_assert (soup_websocket_connection_get_max_total_message_size (tes=
t->server) =3D=3D (1000 * 1000 + 1));
> ++    g_assert_cmpuint (soup_websocket_connection_get_max_total_message_s=
ize (test->server), =3D=3D, 1000 * 1000 + 1);
> +
> +     sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 10=
00);
> +     soup_websocket_connection_send_text (test->server, g_bytes_get_data=
 (sent, NULL));
> +     WAIT_UNTIL (received !=3D NULL);
> +     g_assert (g_bytes_equal (sent, received));
> ++    g_bytes_unref (received);
> ++    received =3D NULL;
> ++
> ++    /* Reverse the test and send the big message to the server. */
> ++    g_signal_handler_disconnect (test->client, signal_id);
> ++    g_signal_connect (test->server, "message", G_CALLBACK (on_text_mess=
age), &received);
> ++
> ++    soup_websocket_connection_send_text (test->client, g_bytes_get_data=
 (sent, NULL));
> ++    WAIT_UNTIL (received !=3D NULL);
> ++    g_assert_true (g_bytes_equal (sent, received));
> +     g_bytes_unref (sent);
> +     g_bytes_unref (received);
> + }
> +
> ++static void
> ++test_send_big_packets_direct (Test *test,
> ++                              gconstpointer data)
> ++{
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 0);
> ++
> ++   test_send_big_packets (test, data);
> ++}
> ++
> ++static void
> ++test_send_big_packets_soup (Test *test,
> ++                            gconstpointer data)
> ++{
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   /* Max total message size defaults to 0 (unlimited), but SoupServer =
applies its own limit by default. */
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 128 * 1024);
> ++
> ++   test_send_big_packets (test, data);
> ++}
> ++
> ++static void
> ++test_send_exceeding_client_max_payload_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++
> ++   soup_websocket_connection_set_max_incoming_payload_size (test->serve=
r, 0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 0);
> ++
> ++   /* The message to the client is dropped due to the client's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->server, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_server_max_payload_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_incoming_payload_size (test->clien=
t, 0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 0);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++
> ++   /* The message to the server is dropped due to the server's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->client, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_client_max_message_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->client, =
128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 128 * 1024);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->server, =
0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 0);
> ++
> ++   /* The message to the client is dropped due to the client's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->server, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_server_max_message_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->client, =
0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   /* Set the server message total message size manually, because its
> ++    * default is different for direct connection vs. soup connection.
> ++    */
> ++   soup_websocket_connection_set_max_total_message_size (test->server, =
128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 128 * 1024);
> ++
> ++   /* The message to the server is dropped due to the server's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->client, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++
> + static void
> + test_send_empty_packets (Test *test,
> +                      gconstpointer data)
> +@@ -2064,11 +2208,47 @@ main (int argc,
> +
> +     g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
> +                 setup_direct_connection,
> +-                test_send_big_packets,
> ++                test_send_big_packets_direct,
> +                 teardown_direct_connection);
> +     g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
> +                 setup_soup_connection,
> +-                test_send_big_packets,
> ++                test_send_big_packets_soup,
> ++                teardown_soup_connection);
> ++
> ++    g_test_add ("/websocket/direct/send-exceeding-client-max-payload-si=
ze", Test, NULL,
> ++                setup_direct_connection,
> ++                test_send_exceeding_client_max_payload_size,
> ++                teardown_direct_connection);
> ++    g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size=
", Test, NULL,
> ++                setup_soup_connection,
> ++                test_send_exceeding_client_max_payload_size,
> ++                teardown_soup_connection);
> ++
> ++    g_test_add ("/websocket/direct/send-exceeding-server-max-payload-si=
ze", Test, NULL,
> ++                setup_direct_connection,
> ++                test_send_exceeding_server_max_payload_size,
> ++                teardown_direct_connection);
> ++    g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size=
", Test, NULL,
> ++                setup_soup_connection,
> ++                test_send_exceeding_server_max_payload_size,
> ++                teardown_soup_connection);
> ++
> ++    g_test_add ("/websocket/direct/send-exceeding-client-max-message-si=
ze", Test, NULL,
> ++                setup_direct_connection,
> ++                test_send_exceeding_client_max_message_size,
> ++                teardown_direct_connection);
> ++    g_test_add ("/websocket/soup/send-exceeding-client-max-message-size=
", Test, NULL,
> ++                setup_soup_connection,
> ++                test_send_exceeding_client_max_message_size,
> ++                teardown_soup_connection);
> ++
> ++    g_test_add ("/websocket/direct/send-exceeding-server-max-message-si=
ze", Test, NULL,
> ++                setup_direct_connection,
> ++                test_send_exceeding_server_max_message_size,
> ++                teardown_direct_connection);
> ++    g_test_add ("/websocket/soup/send-exceeding-server-max-message-size=
", Test, NULL,
> ++                setup_soup_connection,
> ++                test_send_exceeding_server_max_message_size,
> +                 teardown_soup_connection);
> +
> +     g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
> +@@ -2217,11 +2397,11 @@ main (int argc,
> +
> +     g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NUL=
L,
> +                 setup_direct_connection_with_extensions,
> +-                test_send_big_packets,
> ++                test_send_big_packets_direct,
> +                 teardown_direct_connection);
> +     g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
> +                 setup_soup_connection_with_extensions,
> +-                test_send_big_packets,
> ++                test_send_big_packets_soup,
> +                 teardown_soup_connection);
> +
> +     g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, N=
ULL,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes=
-support/libsoup/libsoup_3.4.4.bb
> index c09b06fec2..fc4a286dcf 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> @@ -46,6 +46,11 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libso=
up-${PV}.tar.xz \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
>             file://CVE-2025-12105.patch \
> +           file://CVE-2025-14523.patch \
> +           file://CVE-2025-32049-1.patch \
> +           file://CVE-2025-32049-2.patch \
> +           file://CVE-2025-32049-3.patch \
> +           file://CVE-2025-32049-4.patch \
>  "
>  SRC_URI[sha256sum] =3D "291c67725f36ed90ea43efff25064b69c5a2d1981488477c=
05c481a3b4b0c5aa"
>


--
Yoann Congal
Smile ECS


--_000_DS0PR11MB73126A316573110FD8DD45AB822B2DS0PR11MB7312namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded=
-core@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openem=
bedded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Friday, April 24, 2026 1:09 AM<br>
<b>To:</b>&nbsp;Wang, Jinfeng (CN) &lt;Jinfeng.Wang.CN@windriver.com&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap][PATCH 02/12] libsoup: fix CV=
E-2025-14523/CVE-2025-32049</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">CAUTION: This email comes from a non Wind R=
iver email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:<br>
&gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt;<br>
&gt; Refer:<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/472" id=3D"=
OWA1d05c28e-f577-9aa2-5627-a4f459fd28b1" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472</a><br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/390" id=3D"=
OWA5a4a56d2-91cb-7060-8da6-b4e5c2fb1c36" class=3D"OWAAutoLink" data-auth=3D=
"NotApplicable">
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390</a><br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; Signed-off-by: Jinfeng Wang &lt;jinfeng.wang.cn@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../libsoup-3.4.4/CVE-2025-14523.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 715 ++++++++++++++++++<br>
&gt;&nbsp; .../libsoup-3.4.4/CVE-2025-32049-1.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 229 ++++++<br>
&gt;&nbsp; .../libsoup-3.4.4/CVE-2025-32049-2.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 34 +<br>
&gt;&nbsp; .../libsoup-3.4.4/CVE-2025-32049-3.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 134 ++++<br>
&gt;&nbsp; .../libsoup-3.4.4/CVE-2025-32049-4.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 292 +++++++<br>
&gt;&nbsp; meta/recipes-support/libsoup/libsoup_3.4.4.bb |&nbsp;&nbsp; 5 +<=
br>
&gt;&nbsp; 6 files changed, 1409 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-14523.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-32049-1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-32049-2.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-32049-3.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-32049-4.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523=
.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..b90f8bd29d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch<=
br>
&gt; @@ -0,0 +1,715 @@<br>
&gt; +From 70123da95418f5d6e00e8ac2d586fb6c5d02cdc6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Catanzaro &lt;mcatanzaro@redhat.com&gt;<br>
&gt; +Date: Wed, 7 Jan 2026 14:50:33 -0600<br>
&gt; +Subject: [PATCH] Reject duplicate Host headers<br>
&gt; +<br>
&gt; +RFC 9112 section 3.2 says:<br>
&gt; +<br>
&gt; +A server MUST respond with a 400 (Bad Request) status code to any<br>
&gt; +HTTP/1.1 request message that lacks a Host header field and to any<br=
>
&gt; +request message that contains more than one Host header field line or=
 a<br>
&gt; +Host header field with an invalid field value.<br>
&gt; +<br>
&gt; +In addition to rejecting a duplicate header when parsing headers, als=
o<br>
&gt; +reject attempts to add the duplicate header using the<br>
&gt; +soup_message_headers_append() API, and add tests for both cases.<br>
&gt; +<br>
&gt; +These checks will also apply to HTTP/2. I'm not sure whether this is<=
br>
&gt; +actually desired or not, but the header processing code is not aware =
of<br>
&gt; +which HTTP version is in use.<br>
&gt; +<br>
&gt; +(Note that while SoupMessageHeaders does not require the Host header =
to<br>
&gt; +be present in an HTTP/1.1 request, SoupServer itself does. So we can'=
t<br>
&gt; +test the case of missing Host header via the header parsing test, but=
 it<br>
&gt; +really is enforced.)<br>
&gt; +<br>
&gt; +Fixes #472<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472" id=3D"OWA53f3243=
1-d11b-c83e-cddd-3f0bb739ec25" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f013375=
4872877c92c0284c472</a>]<br>
<br>
Sorry but I don't see this commit mentionned in<br>
(CVE-2025-14523) (#YWH-PGM9867-116) Lack of Duplicate Header Rejection in l=
ibsoup can lead to host header parsing discrepancy between libsoup server a=
nd proxy (#472) =B7 Issue =B7 GNOME/libsoup<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/472" id=3D"OWA8b=
3a94b5-705a-b79c-9c60-751b04d5de67" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">https://gitlab.gnome.org/GNOME/libsoup/-/issues/472</a><br>
<br>
I admit this commit looks related but I very much like a detailled trail<br=
>
between a trusted source (eg. NVD, debian security tracker or upstream)<br>
and the commit.<br>
<br>
Also, that commit is only in the &quot;mcatanzaro/rhel9&quot; branch, that =
would<br>
need some justification.<br>
<br>
This may apply to the other CVE.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">I&nbsp; pasted the=
 commit link for libsoup2 by accident,&nbsp; actually,&nbsp; this patch is =
from
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/aecd8daadc110f85=
61fb2d6b2806a4cacf2e4c85">https://gitlab.gnome.org/GNOME/libsoup/-/commit/a=
ecd8daadc110f8561fb2d6b2806a4cacf2e4c85</a>,</span></div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">the link address i=
n commit message need update.<br>
<br>
Finally, I'd rather have 1 CVE fix per commit, would it be possible to<br>
split the commit?</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Sure!</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Regards</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">//Changqing<br>
<br>
Thanks!<br>
<br>
&gt; +CVE: CVE-2025-14523<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/soup-headers.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
&gt; + libsoup/soup-message-headers-private.h |&nbsp;&nbsp; 4 +-<br>
&gt; + libsoup/soup-message-headers.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp; 80 +++++++------<br>
&gt; + tests/header-parsing-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 148 +++++++++++++++++--------<br>
&gt; + 4 files changed, 153 insertions(+), 82 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c<br>
&gt; +index 155c11d..3fec9b3 100644<br>
&gt; +--- a/libsoup/soup-headers.c<br>
&gt; ++++ b/libsoup/soup-headers.c<br>
&gt; +@@ -139,7 +139,8 @@ soup_headers_parse (const char *str, int len, Sou=
pMessageHeaders *dest)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p =3D ' ';<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
oup_message_headers_append_untrusted_data (dest, name, value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!soup_message_headers_append_untrusted_data (dest, name, value))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto=
 done;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success =3D TRUE;<br>
&gt; +<br>
&gt; +diff --git a/libsoup/soup-message-headers-private.h b/libsoup/soup-me=
ssage-headers-private.h<br>
&gt; +index 9815464..770f3ef 100644<br>
&gt; +--- a/libsoup/soup-message-headers-private.h<br>
&gt; ++++ b/libsoup/soup-message-headers-private.h<br>
&gt; +@@ -10,10 +10,10 @@<br>
&gt; +<br>
&gt; + G_BEGIN_DECLS<br>
&gt; +<br>
&gt; +-void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_=
append_untrusted_data&nbsp; (SoupMessageHeaders *hdrs,<br>
&gt; ++gboolean&nbsp;&nbsp;&nbsp; soup_message_headers_append_untrusted_dat=
a&nbsp; (SoupMessageHeaders *hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *name,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);<br>
&gt; +-void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_=
append_common&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (SoupMe=
ssageHeaders *hdrs,<br>
&gt; ++gboolean&nbsp;&nbsp;&nbsp; soup_message_headers_append_common&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (SoupMessageHeaders *hdrs,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupHeaderName&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; name,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);<br>
&gt; + const char *soup_message_headers_get_one_common&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; (SoupMessageHeaders *hdrs,<br>
&gt; +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-he=
aders.c<br>
&gt; +index d69d6e8..ce4b3b3 100644<br>
&gt; +--- a/libsoup/soup-message-headers.c<br>
&gt; ++++ b/libsoup/soup-message-headers.c<br>
&gt; +@@ -267,12 +267,16 @@ soup_message_headers_clean_connection_headers (=
SoupMessageHeaders *hdrs)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_header_free_list (tokens);<br>
&gt; + }<br>
&gt; +<br>
&gt; +-void<br>
&gt; ++gboolean<br>
&gt; + soup_message_headers_append_common (SoupMessageHeaders *hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So=
upHeaderName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
nst char&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupCommonHeader hea=
der;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (name =3D=3D SOUP_HEAD=
ER_HOST &amp;&amp; soup_message_headers_get_one (hdrs, &quot;Host&quot;)) {=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; g_warning (&quot;soup_message_headers_append_common:=
 Rejecting duplicate Host header&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hdrs-&gt;common=
_headers)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; hdrs-&gt;common_headers =3D g_array_sized_new (=
FALSE, FALSE, sizeof (SoupCommonHeader), 6);<br>
&gt; +@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessage=
Headers *hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; g_hash_table_remove (hdrs-&gt;common_concat, GU=
INT_TO_POINTER (header.name));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers=
_set (hdrs, name, value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TRUE;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-/**<br>
&gt; +- * soup_message_headers_append:<br>
&gt; +- * @hdrs: a #SoupMessageHeaders<br>
&gt; +- * @name: the header name to add<br>
&gt; +- * @value: the new value of @name<br>
&gt; +- *<br>
&gt; +- * Appends a new header with name @name and value @value to @hdrs.<b=
r>
&gt; +- *<br>
&gt; +- * (If there is an existing header with name @name, then this create=
s a second<br>
&gt; +- * one, which is only allowed for list-valued headers; see also<br>
&gt; +- * [method@MessageHeaders.replace].)<br>
&gt; +- *<br>
&gt; +- * The caller is expected to make sure that @name and @value are<br>
&gt; +- * syntactically correct.<br>
&gt; +- **/<br>
&gt; +-void<br>
&gt; +-soup_message_headers_append (SoupMessageHeaders *hdrs,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const char *name, const char *value)<br>
&gt; ++static gboolean<br>
&gt; ++soup_message_headers_append_internal (SoupMessageHeaders *hdrs,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const char *name, const char *value)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; SoupUncommonHeader header;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupHeaderName heade=
r_name;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_return_if_fail (name !=3D NULL);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_return_if_fail (value !=3D NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (name !=3D NULL, FALSE);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (value !=3D NULL, FALSE);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Setting a syntactically invalid header na=
me or value is<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * considered to be a programming error=
. However, it can also<br>
&gt; +@@ -317,23 +307,22 @@ soup_message_headers_append (SoupMessageHeaders=
 *hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * compiled with G_DISABLE_CHECKS.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; + #ifndef G_DISABLE_CHECKS<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_return_if_fail (*name &amp;&amp; strpbrk (name,=
 &quot; \t\r\n:&quot;) =3D=3D NULL);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_return_if_fail (strpbrk (value, &quot;\r\n&quot=
;) =3D=3D NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (*name &amp;&amp; strpbrk (n=
ame, &quot; \t\r\n:&quot;) =3D=3D NULL, FALSE);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (strpbrk (value, &quot;\r\n&=
quot;) =3D=3D NULL, FALSE);<br>
&gt; + #else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (*name &amp;&amp; strpbrk (name, &quot; \=
t\r\n:&quot;)) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_warning (&quot;soup_message_headers_append: Ignoring bad name '%s'&quot;, =
name);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_warning (&quot;soup_message_headers_append: Rejecting bad name '%s'&quot;,=
 name);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn FALSE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (strpbrk (value, &quot;\r\n&quot;)) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_warning (&quot;soup_message_headers_append: Ignoring bad value '%s'&quot;,=
 value);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_warning (&quot;soup_message_headers_append: Rejecting bad value '%s'&quot;=
, value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn FALSE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header_name =3D soup=
_header_name_from_string (name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (header_name !=3D=
 SOUP_HEADER_UNKNOWN) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; soup_message_headers_append_common (hdrs, header_nam=
e, value);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return soup_message_headers_append_common (hdrs, hea=
der_name, value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hdrs-&gt;uncomm=
on_headers)<br>
&gt; +@@ -344,21 +333,48 @@ soup_message_headers_append (SoupMessageHeaders=
 *hdrs,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_array_append_val (hdrs-&gt;uncommon_header=
s, header);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (hdrs-&gt;uncommon_concat)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; g_hash_table_remove (hdrs-&gt;uncommon_concat, header.name);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return TRUE;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/**<br>
&gt; ++ * soup_message_headers_append:<br>
&gt; ++ * @hdrs: a #SoupMessageHeaders<br>
&gt; ++ * @name: the header name to add<br>
&gt; ++ * @value: the new value of @name<br>
&gt; ++ *<br>
&gt; ++ * Appends a new header with name @name and value @value to @hdrs.<b=
r>
&gt; ++ *<br>
&gt; ++ * (If there is an existing header with name @name, then this create=
s a second<br>
&gt; ++ * one, which is only allowed for list-valued headers; see also<br>
&gt; ++ * [method@MessageHeaders.replace].)<br>
&gt; ++ *<br>
&gt; ++ * The caller is expected to make sure that @name and @value are<br>
&gt; ++ * syntactically correct.<br>
&gt; ++ **/<br>
&gt; ++void<br>
&gt; ++soup_message_headers_append (SoupMessageHeaders *hdrs,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; const char *name, const char *value)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; soup_message_headers_append_internal (hdrs, name,=
 value);<br>
&gt; + }<br>
&gt; +<br>
&gt; + /*<br>
&gt; +- * Appends a header value ensuring that it is valid UTF8.<br>
&gt; ++ * Appends a header value ensuring that it is valid UTF-8, and also =
checking the<br>
&gt; ++ * return value of soup_message_headers_append_internal() to report =
whether the<br>
&gt; ++ * headers are invalid for various other reasons.<br>
&gt; +&nbsp; */<br>
&gt; +-void<br>
&gt; ++gboolean<br>
&gt; + soup_message_headers_append_untrusted_data (SoupMessageHeaders *hdrs=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *name,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *safe_value =3D=
 g_utf8_make_valid (value, -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *safe_name =3D =
g_utf8_make_valid (name, -1);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_appe=
nd (hdrs, safe_name, safe_value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean result =3D soup_=
message_headers_append_internal (hdrs, safe_name, safe_value);<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (safe_value);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (safe_name);<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return result;<br>
&gt; + }<br>
&gt; +<br>
&gt; + void<br>
&gt; +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.=
c<br>
&gt; +index 9490559..98a22a4 100644<br>
&gt; +--- a/tests/header-parsing-test.c<br>
&gt; ++++ b/tests/header-parsing-test.c<br>
&gt; +@@ -24,6 +24,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *method, *path;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; SoupHTTPVersion version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; Header headers[10];<br>
&gt; ++&nbsp;&nbsp;&nbsp; GLogLevelFlags log_flags;<br>
&gt; + } reqtests[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**********************/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*** VALID REQUESTS ***/<br>
&gt; +@@ -33,7 +34,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.0\r\n&quot;, =
-1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_OK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_0,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header&quot;, NULL,<br>
&gt; +@@ -42,7 +43,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header, no leading whitespa=
ce&quot;, NULL,<br>
&gt; +@@ -51,7 +52,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header including trailing w=
hitespace&quot;, NULL,<br>
&gt; +@@ -60,7 +61,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header, wrapped&quot;, NULL=
,<br>
&gt; +@@ -69,7 +70,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Foo&quot;, &quot;bar b=
az&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header, wrapped with additi=
onal whitespace&quot;, NULL,<br>
&gt; +@@ -78,7 +79,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Foo&quot;, &quot;bar b=
az&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header, wrapped with tab&qu=
ot;, NULL,<br>
&gt; +@@ -87,7 +88,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Foo&quot;, &quot;bar b=
az&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header, wrapped before valu=
e&quot;, NULL,<br>
&gt; +@@ -96,7 +97,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Foo&quot;, &quot;bar b=
az&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 1 header with empty value&quo=
t;, NULL,<br>
&gt; +@@ -105,7 +106,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;&quo=
t; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 2 headers&quot;, NULL,<br>
&gt; +@@ -115,7 +116,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Connection&q=
uot;, &quot;close&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 3 headers&quot;, NULL,<br>
&gt; +@@ -126,7 +127,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Connection&q=
uot;, &quot;close&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Blah&quot;, =
&quot;blah&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 3 headers, 1st wrapped&quot;,=
 NULL,<br>
&gt; +@@ -137,7 +138,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; { &quot;Foo&quot;, &quot;bar baz&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Blah&quot;, =
&quot;blah&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 3 headers, 2nd wrapped&quot;,=
 NULL,<br>
&gt; +@@ -148,7 +149,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Blah&quot;, =
&quot;blah&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Foo&quot;, &=
quot;bar baz&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ 3 headers, 3rd wrapped&quot;,=
 NULL,<br>
&gt; +@@ -159,7 +160,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Blah&quot;, =
&quot;blah&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Foo&quot;, &=
quot;bar baz&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ same header multiple times&qu=
ot;, NULL,<br>
&gt; +@@ -168,7 +169,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Foo&quot;, &quot;bar, =
baz, quux&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Connection header on HTTP/1.0 messag=
e&quot;, NULL,<br>
&gt; +@@ -178,21 +179,21 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Connection&quot;, &quo=
t;Bar, Quux&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; { &quot;Foo&quot;, &quot;bar&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;GET with full URI&quot;, &quot;66763=
7&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET <a href=3D"http://exam=
ple.com" id=3D"OWA955e7050-1830-e7f6-73da-9b3b35595924" class=3D"OWAAutoLin=
k" data-auth=3D"NotApplicable">
http://example.com</a>&nbsp;HTTP/1.1\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_OK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;<a href=
=3D"http://example.com" id=3D"OWA3d360fea-f1c0-dee1-52b1-d37e7700ee3e" clas=
s=3D"OWAAutoLink" data-auth=3D"NotApplicable">http://example.com</a>&quot;,=
 SOUP_HTTP_1_1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;GET with full URI in upper-case&quot=
;, &quot;667637&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET HTTP://example.com HTT=
P/1.1\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_OK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;HTTP://ex=
ample.com&quot;, SOUP_HTTP_1_1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* It's better for this to be passed through=
: this means a SoupServer<br>
&gt; +@@ -202,7 +203,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET AbOuT: HTTP/1.1\r\n&qu=
ot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_OK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;AbOuT:&qu=
ot;, SOUP_HTTP_1_1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /****************************/<br>
&gt; +@@ -217,7 +218,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* RFC 2616 section 3.1 says we MUST accept =
this */<br>
&gt; +@@ -228,7 +229,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* RFC 2616 section 19.3 says we SHOULD acce=
pt these */<br>
&gt; +@@ -240,7 +241,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Connection&q=
uot;, &quot;close&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;LF instead of CRLF after Request-Lin=
e&quot;, NULL,<br>
&gt; +@@ -249,7 +250,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Mixed CRLF/LF&quot;, &quot;666316&qu=
ot;,<br>
&gt; +@@ -261,7 +262,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;e&quot;, &qu=
ot;f&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;g&quot;, &qu=
ot;h&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ incorrect whitespace in Reque=
st-Line&quot;, NULL,<br>
&gt; +@@ -270,7 +271,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Req w/ incorrect whitespace after Re=
quest-Line&quot;, &quot;475169&quot;,<br>
&gt; +@@ -279,7 +280,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET&quot;, &quot;/&quot;, =
SOUP_HTTP_1_1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* If the request/status line is parseable, =
then we<br>
&gt; +@@ -293,7 +294,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Bar&quot;, &=
quot;two&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;First header line is continuation&qu=
ot;, &quot;666316&quot;,<br>
&gt; +@@ -303,7 +304,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;Host&quot;, &quot;exam=
ple.com&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Zero-length header name&quot;, &quot=
;666316&quot;,<br>
&gt; +@@ -313,7 +314,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;a&quot;, &quot;b&quot;=
 },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;CR in header name&quot;, &quot;66631=
6&quot;,<br>
&gt; +@@ -323,7 +324,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { &quot;a&quot;, &quot;b&quot;=
 },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;CR in header value&quot;, &quot;6663=
16&quot;,<br>
&gt; +@@ -336,7 +337,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;s&quot;, &qu=
ot;t&quot; },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* CR at end is ignored */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Tab in header name&quot;, &quot;6663=
16&quot;,<br>
&gt; +@@ -351,7 +352,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;p&quot;, &qu=
ot;q z: w&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Tab in header value&quot;, &quot;666=
316&quot;,<br>
&gt; +@@ -364,7 +365,7 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;z&quot;, &qu=
ot;w&quot; },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* trailing tab ignored *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;c&quot;, &qu=
ot;d&quot; },<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NULL }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /************************/<br>
&gt; +@@ -375,77 +376,77 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET /\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;HTTP 1.2 request (no such thing)&quo=
t;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.2\r\n&quot;, =
-1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_HTTP_VERSION_NOT_SUP=
PORTED,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;HTTP 2000 request (no such thing)&qu=
ot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/2000.0\r\n&quot=
;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_HTTP_VERSION_NOT_SUP=
PORTED,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Long HTTP version terminating at mis=
sing minor version&quot;, &quot;<a href=3D"https://gitlab.gnome.org/GNOME/l=
ibsoup/-/issues/404" id=3D"OWA36180896-b07e-0064-6982-1a606a707572" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://gitlab.gnome.org/GNOME=
/libsoup/-/issues/404</a>&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unterminated_http_version, sizeo=
f (unterminated_http_version),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NU=
LL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Non-HTTP request&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / SOUP/1.1\r\nHost: ex=
ample.com\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Junk after Request-Line&quot;, NULL,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1 blah\r\nHos=
t: example.com\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;NUL in Method&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;G\x00T / HTTP/1.1\r\nHost:=
 example.com\r\n&quot;, 37,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;NUL at beginning of Method&quot;, &q=
uot;666316&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;\x00 / HTTP/1.1\r\nHost: e=
xample.com\r\n&quot;, 35,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;NUL in Path&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET /\x00 HTTP/1.1\r\nHost=
: example.com\r\n&quot;, 38,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;No terminating CRLF&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1\r\nHost: ex=
ample.com&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Unrecognized expectation&quot;, NULL=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1\r\nHost: ex=
ample.com\r\nExpect: the-impossible\r\n&quot;, -1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_EXPECTATION_FAILED,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // <a href=3D"https://gitlab.gnome.org/GNOME=
/libsoup/-/issues/377" id=3D"OWAa1f33943-4cfb-9a4c-0e38-a4b422023250" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.gnome.org/GNOME/libsoup/-/issues/377</a><br>
&gt; +@@ -453,21 +454,40 @@ static struct RequestTest {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1\r\nHost\x00=
: example.com\r\n&quot;, 36,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;NUL in header value&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;HTTP/1.1 200 OK\r\nFoo: b\=
x00&quot; &quot;ar\r\n&quot;, 28,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NU=
LL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; { &quot;Only newlines&quot;, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; only_newlines, sizeof (only_newl=
ines),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NU=
LL, NULL, -1,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } }, 0<br>
&gt; ++&nbsp;&nbsp;&nbsp; },<br>
&gt; ++&nbsp;&nbsp;&nbsp; { &quot;Duplicate Host headers&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<a href=3D"https://gitlab.gnome=
.org/GNOME/libsoup/-/issues/472" id=3D"OWA581a3734-946a-09ae-e8a0-171062e92=
877" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://gitlab.gnome=
.org/GNOME/libsoup/-/issues/472</a>&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1\r\nHost: example=
.com\r\nHost: example.org\r\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -1,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } },<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_LOG_LEVEL_WARNING<br>
&gt; ++&nbsp;&nbsp;&nbsp; },<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; { &quot;Duplicate Host headers, case insensitive&=
quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<a href=3D"https://gitlab.gnome=
.org/GNOME/libsoup/-/issues/472" id=3D"OWA7b9ddead-33ea-fcc9-36c3-d671783ce=
1ab" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://gitlab.gnome=
.org/GNOME/libsoup/-/issues/472</a>&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;GET / HTTP/1.1\r\nHost: example=
.com\r\nhost: example.org\r\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -1,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_STATUS_BAD_REQUEST,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL, -1,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { { NULL } },<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G_LOG_LEVEL_WARNING<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + };<br>
&gt; + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);<br>
&gt; +@@ -915,10 +935,17 @@ do_request_tests (void)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D strlen (reqtest=
s[i].request);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D reqtests[i].len=
gth;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (reqtests[i].log_flags)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_expect_message (&quot=
;libsoup&quot;, reqtests[i].log_flags, &quot;*&quot;);<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; status =3D soup_headers_parse_request (reqtests[i].request, len,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 headers, &amp;method, &amp;path,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;version);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; g_assert_cmpint (status, =3D=3D, reqtests[i].status);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (reqtests[i].log_flags)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_test_assert_expected_messa=
ges ();<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (SOUP_STATUS_IS_SUCCESSFUL (status)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_assert_cmpstr (method=
, =3D=3D, reqtests[i].method);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_assert_cmpstr (path, =
=3D=3D, reqtests[i].path);<br>
&gt; +@@ -1312,6 +1339,32 @@ do_bad_header_tests (void)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_unref (hdrs);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static void<br>
&gt; ++do_append_duplicate_host_test (void)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; SoupMessageHeaders *hdrs;<br>
&gt; ++&nbsp;&nbsp; const char *list_value;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; hdrs =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS=
_REQUEST);<br>
&gt; ++&nbsp;&nbsp; soup_message_headers_append (hdrs, &quot;Host&quot;, &q=
uot;a&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_test_expect_message (&quot;libsoup&quot;, G_LOG_LEVEL=
_WARNING,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;soup_messa=
ge_headers_append_common: Rejecting duplicate Host header&quot;);<br>
&gt; ++&nbsp;&nbsp; soup_message_headers_append (hdrs, &quot;Host&quot;, &q=
uot;b&quot;);<br>
&gt; ++&nbsp;&nbsp; g_test_assert_expected_messages ();<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Case insensitive */<br=
>
&gt; ++&nbsp;&nbsp; g_test_expect_message (&quot;libsoup&quot;, G_LOG_LEVEL=
_WARNING,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;soup_messa=
ge_headers_append_common: Rejecting duplicate Host header&quot;);<br>
&gt; ++&nbsp;&nbsp; soup_message_headers_append (hdrs, &quot;host&quot;, &q=
uot;b&quot;);<br>
&gt; ++&nbsp;&nbsp; g_test_assert_expected_messages ();<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; list_value =3D soup_message_headers_get_list (hdrs, &qu=
ot;Host&quot;);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpstr (list_value, =3D=3D, &quot;a&quot;);<br=
>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_message_headers_unref (hdrs);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + int<br>
&gt; + main (int argc, char **argv)<br>
&gt; + {<br>
&gt; +@@ -1327,6 +1380,7 @@ main (int argc, char **argv)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/header-parsing/conte=
nt-type&quot;, do_content_type_tests);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/header-parsing/appen=
d-param&quot;, do_append_param_tests);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/header-parsing/bad&q=
uot;, do_bad_header_tests);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add_func (&quot;/header-parsing/append-dup=
licate-host&quot;, do_append_duplicate_host_test);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D g_test_run ();<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049=
-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0772c759dc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patc=
h<br>
&gt; @@ -0,0 +1,229 @@<br>
&gt; +From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ignacio Casal Quinteiro &lt;qignacio@amazon.com&gt;<br>
&gt; +Date: Wed, 24 Jul 2024 15:20:35 +0200<br>
&gt; +Subject: [PATCH 1/4] websocket: add a way to restrict the total messa=
ge size<br>
&gt; +<br>
&gt; +Otherwise a client could send small packages smaller than<br>
&gt; +total-incoming-payload-size but still to break the server<br>
&gt; +with a big allocation<br>
&gt; +<br>
&gt; +Fixes: #390<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce" id=3D"OWAbaafadb=
c-2df9-98c3-45fc-2ed91366776a" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfe=
d2cb409dbfd63c7fdce</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/websocket/soup-websocket-connection.c | 107 ++++++++++++++++=
+-<br>
&gt; + libsoup/websocket/soup-websocket-connection.h |&nbsp;&nbsp; 7 ++<br>
&gt; + 2 files changed, 110 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/=
websocket/soup-websocket-connection.c<br>
&gt; +index 5eb8150..19bdd39 100644<br>
&gt; +--- a/libsoup/websocket/soup-websocket-connection.c<br>
&gt; ++++ b/libsoup/websocket/soup-websocket-connection.c<br>
&gt; +@@ -84,7 +84,7 @@ enum {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_MAX_INCOMING_PAYLOAD_SIZE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_KEEPALIVE_INTERVAL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PROP_EXTENSIONS,<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp; PROP_MAX_TOTAL_MESSAGE_SIZE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LAST_PROPERTY<br>
&gt; + };<br>
&gt; +<br>
&gt; +@@ -126,6 +126,7 @@ typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *origin;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *protocol;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; guint64 max_incoming_payload_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp; guint64 max_total_message_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; guint keepalive_interval;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gushort peer_close_code;<br>
&gt; +@@ -156,6 +157,7 @@ typedef struct {<br>
&gt; + } SoupWebsocketConnectionPrivate;<br>
&gt; +<br>
&gt; + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; + #define READ_BUFFER_SIZE 1024<br>
&gt; + #define MASK_LENGTH 4<br>
&gt; +<br>
&gt; +@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection=
 *self)<br>
&gt; + }<br>
&gt; +<br>
&gt; + static void<br>
&gt; +-too_big_error_and_close (SoupWebsocketConnection *self,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; guint64 payload_len)<br>
&gt; ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *s=
elf,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; guint64 payload_len)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupWebsocketConnect=
ionPrivate *priv =3D soup_websocket_connection_get_instance_private (self);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GError *error;<br>
&gt; +@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection=
 *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; emit_error_and_close (self, error, TRUE);<br=
>
&gt; + }<br>
&gt; +<br>
&gt; ++static void<br>
&gt; ++too_big_message_error_and_close (SoupWebsocketConnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guint64 len)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; SoupWebsocketConnectionPrivate *priv =3D soup_web=
socket_connection_get_instance_private (self);<br>
&gt; ++&nbsp;&nbsp;&nbsp; GError *error;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; error =3D g_error_new_literal (SOUP_WEBSOCKET_ERR=
OR,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_WEBSOCKET_CLOSE_TOO_=
BIG,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;connection_type =
=3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER ?<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Received WebSocket =
payload from the client larger than configured max-total-message-size&quot;=
 :<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Received WebSocket =
payload from the server larger than configured max-total-message-size&quot;=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_debug (&quot;%s received message of size %&quot=
; G_GUINT64_FORMAT &quot; or greater, but max supported size is %&quot; G_G=
UINT64_FORMAT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; priv-&gt;connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER ? &qu=
ot;server&quot; : &quot;client&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; len, priv-&gt;max_total_message_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp; emit_error_and_close (self, error, TRUE);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + close_connection (SoupWebsocketConnection *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gushort&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
code,<br>
&gt; +@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; switch (priv-&gt;message_opcode) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 0x01:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 0x02:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Safety valve */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;max_total_messa=
ge_size &gt; 0 &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pri=
v-&gt;message_data-&gt;len + payload_len) &gt; priv-&gt;max_total_message_s=
ize) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; too_big_message_error_and_close (self, (priv-&gt;messag=
e_data-&gt;len + payload_len));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_byte_array_append (pr=
iv-&gt;message_data, payload, payload_len);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; default:<br>
&gt; +@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Safety valve */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;max_incoming_payload_size &gt; =
0 &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; payload_len &gt; pri=
v-&gt;max_incoming_payload_size) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t=
oo_big_error_and_close (self, payload_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t=
oo_big_incoming_payload_error_and_close (self, payload_len);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return FALSE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObjec=
t *object,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; g_value_set_pointer (value, priv-&gt;extensions);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PROP_MAX_TOTAL_MESSA=
GE_SIZE:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_value_set_uint64 (value, priv-&gt;max_total_message_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObjec=
t *object,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; priv-&gt;extensions =3D g_value_get_pointer (value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; case PROP_MAX_TOTAL_MESSAGE_SIZE:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
riv-&gt;max_total_message_size =3D g_value_get_uint64 (value);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebs=
ocketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; G_PARAM_CONSTRUCT_ONLY |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; G_PARAM_STATIC_STRINGS);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; /**<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-total-message=
-size:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The total message size for incoming packe=
ts.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The protocol expects or 0 to not limit it=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Since: 3.8<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; properties[PROP_MAX_TOTAL=
_MESSAGE_SIZE] =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; g_param_spec_uint64 (&quot;max-total-message-size&qu=
ot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;Max total message size&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;Max total message size &quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
_MAXUINT64,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M=
AX_TOTAL_MESSAGE_SIZE_DEFAULT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
_PARAM_READWRITE |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
_PARAM_CONSTRUCT |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
_PARAM_STATIC_STRINGS);<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_object_class_insta=
ll_properties (gobject_class, LAST_PROPERTY, properties);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_pay=
load_size (SoupWebsocketConnection<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/**<br>
&gt; ++ * soup_websocket_connection_get_max_total_message_size:<br>
&gt; ++ * @self: the WebSocket<br>
&gt; ++ *<br>
&gt; ++ * Gets the maximum total message size allowed for packets.<br>
&gt; ++ *<br>
&gt; ++ * Returns: the maximum total message size.<br>
&gt; ++ *<br>
&gt; ++ * Since: 3.8<br>
&gt; ++ */<br>
&gt; ++guint64<br>
&gt; ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketC=
onnection *self)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; SoupWebsocketConnectionPrivate *priv =3D soup_web=
socket_connection_get_instance_private (self);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTIO=
N (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; return priv-&gt;max_total_message_size;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/**<br>
&gt; ++ * soup_websocket_connection_set_max_total_message_size:<br>
&gt; ++ * @self: the WebSocket<br>
&gt; ++ * @max_total_message_size: the maximum total message size<br>
&gt; ++ *<br>
&gt; ++ * Sets the maximum total message size allowed for packets.<br>
&gt; ++ *<br>
&gt; ++ * It does not limit the outgoing packet size.<br>
&gt; ++ *<br>
&gt; ++ * Since: 3.8<br>
&gt; ++ */<br>
&gt; ++void<br>
&gt; ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketC=
onnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_total_mess=
age_size)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; SoupWebsocketConnectionPrivate *priv =3D soup_web=
socket_connection_get_instance_private (self);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (s=
elf));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (priv-&gt;max_total_message_size !=3D max_tota=
l_message_size) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
riv-&gt;max_total_message_size =3D max_total_message_size;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_MESSAGE=
_SIZE]);<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * soup_websocket_connection_get_keepalive_interval:<br>
&gt; +&nbsp; * @self: the WebSocket<br>
&gt; +diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/=
websocket/soup-websocket-connection.h<br>
&gt; +index eeb093d..922de56 100644<br>
&gt; +--- a/libsoup/websocket/soup-websocket-connection.h<br>
&gt; ++++ b/libsoup/websocket/soup-websocket-connection.h<br>
&gt; +@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL<br>
&gt; + void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_paylo=
ad_size (SoupWebsocketConnection *self,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_incoming_payload_=
size);<br>
&gt; +<br>
&gt; ++SOUP_AVAILABLE_IN_3_0<br>
&gt; ++guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; soup_websocket_connection_get_max_total_message_size&nbsp;&nbsp=
;&nbsp; (SoupWebsocketConnection *self);<br>
&gt; ++<br>
&gt; ++SOUP_AVAILABLE_IN_3_0<br>
&gt; ++void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_=
size&nbsp;&nbsp;&nbsp; (SoupWebsocketConnection *self,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; guint64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_total_message_size);<b=
r>
&gt; ++<br>
&gt; + SOUP_AVAILABLE_IN_ALL<br>
&gt; + guint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_get_keepalive_interval (Sou=
pWebsocketConnection *self);<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049=
-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6f00fabfdb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patc=
h<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ignacio Casal Quinteiro &lt;qignacio@amazon.com&gt;<br>
&gt; +Date: Fri, 20 Sep 2024 12:12:38 +0200<br>
&gt; +Subject: [PATCH 2/4] websocket-test: set the total message size<br>
&gt; +<br>
&gt; +This is required when sending a big amount of data<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/4904a46a2d9a014efa6be01a186ac353dbf5047b" id=3D"OWAfcb0e00=
4-29e8-efbe-8bea-5b1ac6b45081" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/4904a46a2d9a014efa6be=
01a186ac353dbf5047b</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + tests/websocket-test.c | 5 +++++<br>
&gt; + 1 file changed, 5 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/tests/websocket-test.c b/tests/websocket-test.c<br>
&gt; +index a0b8334..827b041 100644<br>
&gt; +--- a/tests/websocket-test.c<br>
&gt; ++++ b/tests/websocket-test.c<br>
&gt; +@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_p=
ayload_size (test-&gt;server, 1000 * 1000 + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_=
incoming_payload_size (test-&gt;server) =3D=3D (1000 * 1000 + 1));<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_s=
ize (test-&gt;client, 1000 * 1000 + 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_total=
_message_size (test-&gt;client) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_s=
ize (test-&gt;server, 1000 * 1000 + 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_total=
_message_size (test-&gt;server) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 =
* 1000, '?'), 1000 * 1000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_send_text (test-&g=
t;server, g_bytes_get_data (sent, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WAIT_UNTIL (received !=3D NULL);<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049=
-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..29fb0d7ddb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patc=
h<br>
&gt; @@ -0,0 +1,134 @@<br>
&gt; +From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Catanzaro &lt;mcatanzaro@redhat.com&gt;<br>
&gt; +Date: Thu, 8 May 2025 16:16:25 -0500<br>
&gt; +Subject: [PATCH] Set message size limit in SoupServer rather than<br>
&gt; + SoupWebsocketConnection<br>
&gt; +<br>
&gt; +We're not sure about the compatibility implications of having a defau=
lt<br>
&gt; +size limit for clients.<br>
&gt; +<br>
&gt; +Also not sure whether the server limit is actually set appropriately,=
<br>
&gt; +but there is probably very little server usage of<br>
&gt; +SoupWebsocketConnection in the wild, so it's not so likely to break<b=
r>
&gt; +things.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7" id=3D"OWA854a727=
f-cd79-c2a2-3541-79035cf7db65" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3=
b36f098cf69233b1df7</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libsoup/server/soup-server.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 24 +++++++=
++++++----<br>
&gt; + libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++----=
--<br>
&gt; + 2 files changed, 37 insertions(+), 13 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-serve=
r.c<br>
&gt; +index 6b486f5..c779f7d 100644<br>
&gt; +--- a/libsoup/server/soup-server.c<br>
&gt; ++++ b/libsoup/server/soup-server.c<br>
&gt; +@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] =3D=
 { NULL, };<br>
&gt; +<br>
&gt; + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)<=
br>
&gt; +<br>
&gt; ++/* SoupWebsocketConnection by default limits only maximum packet siz=
e. But a<br>
&gt; ++ * message may consist of multiple packets, so SoupServer additional=
ly restricts<br>
&gt; ++ * total message size to mitigate denial of service attacks on the s=
erver.<br>
&gt; ++ * SoupWebsocketConnection does not do this by default because I don=
't know<br>
&gt; ++ * whether that would or would not cause compatibility problems for =
websites.<br>
&gt; ++ *<br>
&gt; ++ * This size is in bytes and it is arbitrary.<br>
&gt; ++ */<br>
&gt; ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; ++<br>
&gt; + static void request_finished (SoupServerMessage&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; *msg,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupMessageIOCompletion completion,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SoupServer&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *server);<br>
&gt; +@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *server,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_object_ref (msg);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; stream =3D soup_server_message_steal_connect=
ion (msg);<br>
&gt; +-&nbsp;&nbsp;&nbsp; conn =3D soup_websocket_connection_new (stream, u=
ri,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; SOUP_WEBSOCKET_CONNECTION_SERVER,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_get_one_common (soup_serv=
er_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; soup_message_headers_get_one_common (soup_serv=
er_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),=
<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; handler-&gt;websocket_extensions);<br>
&gt; ++&nbsp;&nbsp;&nbsp; conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new =
(SOUP_TYPE_WEBSOCKET_CONNECTION,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;io-stream&quot;, stream,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;uri&quot;, uri,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;connection-type&quot;, SOUP_WEBSOCKET_CONNECTION_SERVER,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;origin&quot;, soup_message_headers_get_one_common (soup_server_m=
essage_get_request_headers (msg), SOUP_HEADER_ORIGIN),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;protocol&quot;, soup_message_headers_get_one_common (soup_server=
_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;extensions&quot;, handler-&gt;websocket_extensions,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;max-total-message-size&quot;, (guint64)MAX_TOTAL_MESSAGE_SIZE_DE=
FAULT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; handler-&gt;websocket_extensions =3D NULL;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_object_unref (stream);<br>
&gt; +<br>
&gt; +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/=
websocket/soup-websocket-connection.c<br>
&gt; +index 26476df..cbb1b72 100644<br>
&gt; +--- a/libsoup/websocket/soup-websocket-connection.c<br>
&gt; ++++ b/libsoup/websocket/soup-websocket-connection.c<br>
&gt; +@@ -149,7 +149,6 @@ typedef struct {<br>
&gt; + } SoupWebsocketConnectionPrivate;<br>
&gt; +<br>
&gt; + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT&nbsp;&nbsp; 128 * 1024<br>
&gt; + #define READ_BUFFER_SIZE 1024<br>
&gt; + #define MASK_LENGTH 4<br>
&gt; +<br>
&gt; +@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebs=
ocketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-incoming=
-payload-size:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The maximum payload size for incoming pac=
kets.<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The protocol expects or 0 to not limit it=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The maximum payload size for incoming pac=
kets, or 0 to not limit it.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Each message may consist of multiple pack=
ets, so also refer to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * [property@WebSocketConnection:max-total-m=
essage-size].<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; properties[PROP_MAX_=
INCOMING_PAYLOAD_SIZE] =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; g_param_spec_uint64 (&quot;max-incoming-payload=
-size&quot;,<br>
&gt; +@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebs=
ocketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SoupWebsocketConnection:max-total-me=
ssage-size:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The total message size for incoming packe=
ts.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * The maximum size for incoming messages.<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Set to a value to limit the total message=
 size, or 0 to not<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * limit it.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * [method@Server.add_websocket_handler] wil=
l set this to a nonzero<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * default value to mitigate denial of servi=
ce attacks. Clients must<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * choose their own default if they need to =
mitigate denial of service<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * attacks. You also need to set your own de=
fault if creating your own<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * server SoupWebsocketConnection without us=
ing SoupServer.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; * The protocol expects or 0 to not limit it=
.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * Each message may consist of multiple pack=
ets, so also refer to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; * [property@WebSocketConnection:max-incomin=
g-payload-size].<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Since: 3.8<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebso=
cketConnectionClass *klass)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;Max total message size &quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_MAXUINT64,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M=
AX_TOTAL_MESSAGE_SIZE_DEFAULT,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_PARAM_READWRITE |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_PARAM_CONSTRUCT |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; G_PARAM_STATIC_STRINGS);<br>
&gt; +@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message=
_size (SoupWebsocketConnection *s<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; SoupWebsocketConnectionPrivate *priv =3D sou=
p_websocket_connection_get_instance_private (self);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTIO=
N (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTIO=
N (self), 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return priv-&gt;max_total_message_size;<br>
&gt; + }<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049=
-4.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6f391e98e2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patc=
h<br>
&gt; @@ -0,0 +1,292 @@<br>
&gt; +From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael Catanzaro &lt;mcatanzaro@redhat.com&gt;<br>
&gt; +Date: Fri, 16 May 2025 16:55:40 -0500<br>
&gt; +Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and<br>
&gt; + max-total-message-size<br>
&gt; +<br>
&gt; +An even better test would verify that it's possible to send big messa=
ges<br>
&gt; +containing small packets, but libsoup doesn't offer control over pack=
et<br>
&gt; +size, and I don't want to take the time to learn how WebSockets work =
to<br>
&gt; +figure out how to do that manually. Instead, I just check that both<b=
r>
&gt; +limits work, for both client and server.<br>
&gt; +<br>
&gt; +I didn't add deflate variants of these tests because I doubt that wou=
ld<br>
&gt; +add valuable coverage.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b" id=3D"OWA8259b0c=
3-d487-5213-25e6-cdea3b791198" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">https://gitlab.gnome.org/GNOME/libsoup/-/commit/4d00b45b7eebdcfa0706b=
58e34c40b8a0a16015b</a>]<br>
&gt; +CVE: CVE-2025-32049<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; +---<br>
&gt; + tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++--=
--<br>
&gt; + 1 file changed, 197 insertions(+), 17 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/tests/websocket-test.c b/tests/websocket-test.c<br>
&gt; +index 827b041..ec1324c 100644<br>
&gt; +--- a/tests/websocket-test.c<br>
&gt; ++++ b/tests/websocket-test.c<br>
&gt; +@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GBytes *sent =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GBytes *received =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp; gulong signal_id;<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_signal_connect (test-&gt;client, &quot;message&=
quot;, G_CALLBACK (on_text_message), &amp;received);<br>
&gt; +-<br>
&gt; +-&nbsp;&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (400, '!'),=
 400);<br>
&gt; +-&nbsp;&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;ser=
ver, g_bytes_get_data (sent, NULL));<br>
&gt; +-&nbsp;&nbsp;&nbsp; WAIT_UNTIL (received !=3D NULL);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_assert (g_bytes_equal (sent, received));<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_bytes_unref (received);<br>
&gt; +-&nbsp;&nbsp;&nbsp; received =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp; signal_id =3D g_signal_connect (test-&gt;client, =
&quot;message&quot;, G_CALLBACK (on_text_message), &amp;received);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (100 *=
 1000, '?'), 100 * 1000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_send_text (test-&g=
t;server, g_bytes_get_data (sent, NULL));<br>
&gt; +@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; received =3D NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_p=
ayload_size (test-&gt;client, 1000 * 1000 + 1);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_incom=
ing_payload_size (test-&gt;client) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_m=
ax_incoming_payload_size (test-&gt;client), =3D=3D, 1000 * 1000 + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_p=
ayload_size (test-&gt;server, 1000 * 1000 + 1);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_incom=
ing_payload_size (test-&gt;server) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_m=
ax_incoming_payload_size (test-&gt;server), =3D=3D, 1000 * 1000 + 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_mess=
age_size (test-&gt;client, 1000 * 1000 + 1);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_total=
_message_size (test-&gt;client) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_m=
ax_total_message_size (test-&gt;client), =3D=3D, 1000 * 1000 + 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_set_max_total_mess=
age_size (test-&gt;server, 1000 * 1000 + 1);<br>
&gt; +-&nbsp;&nbsp;&nbsp; g_assert (soup_websocket_connection_get_max_total=
_message_size (test-&gt;server) =3D=3D (1000 * 1000 + 1));<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_m=
ax_total_message_size (test-&gt;server), =3D=3D, 1000 * 1000 + 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 =
* 1000, '?'), 1000 * 1000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; soup_websocket_connection_send_text (test-&g=
t;server, g_bytes_get_data (sent, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WAIT_UNTIL (received !=3D NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_assert (g_bytes_equal (sent, received));<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp; g_bytes_unref (received);<br>
&gt; ++&nbsp;&nbsp;&nbsp; received =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Reverse the test and send the big message to t=
he server. */<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_signal_handler_disconnect (test-&gt;client, sig=
nal_id);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_signal_connect (test-&gt;server, &quot;message&=
quot;, G_CALLBACK (on_text_message), &amp;received);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;cli=
ent, g_bytes_get_data (sent, NULL));<br>
&gt; ++&nbsp;&nbsp;&nbsp; WAIT_UNTIL (received !=3D NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_assert_true (g_bytes_equal (sent, received));<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_bytes_unref (received);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static void<br>
&gt; ++test_send_big_packets_direct (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;client), =3D=3D, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;client), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;server), =3D=3D, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;server), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; test_send_big_packets (test, data);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_send_big_packets_soup (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;client), =3D=3D, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;client), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* Max total message size defaults to 0 (unlimited), bu=
t SoupServer applies its own limit by default. */<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;server), =3D=3D, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;server), =3D=3D, 128 * 1024);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; test_send_big_packets (test, data);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_send_exceeding_client_max_payload_size (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; GBytes *sent =3D NULL;<br>
&gt; ++&nbsp;&nbsp; GBytes *received =3D NULL;<br>
&gt; ++&nbsp;&nbsp; gboolean close_event =3D FALSE;<br>
&gt; ++&nbsp;&nbsp; GError *error =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;server, &quot;error&quot;, G=
_CALLBACK (on_error_copy), &amp;error);<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;client, &quot;closed&quot;, =
G_CALLBACK (on_close_set_flag), &amp;close_event);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;client), =3D=3D, 128 * 1024);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_payload_size=
 (test-&gt;server, 0);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;server), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* The message to the client is dropped due to the clie=
nt's limit. */<br>
&gt; ++&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'=
), 1000 * 1000);<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;server, g=
_bytes_get_data (sent, NULL));<br>
&gt; ++&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; ++&nbsp;&nbsp; WAIT_UNTIL (close_event);<br>
&gt; ++&nbsp;&nbsp; g_assert_null (received);<br>
&gt; ++&nbsp;&nbsp; g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTIO=
N_CLOSED);<br>
&gt; ++&nbsp;&nbsp; g_assert_no_error (test-&gt;client_error);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_send_exceeding_server_max_payload_size (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; GBytes *sent =3D NULL;<br>
&gt; ++&nbsp;&nbsp; GBytes *received =3D NULL;<br>
&gt; ++&nbsp;&nbsp; gboolean close_event =3D FALSE;<br>
&gt; ++&nbsp;&nbsp; GError *error =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;client, &quot;error&quot;, G=
_CALLBACK (on_error_copy), &amp;error);<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;server, &quot;closed&quot;, =
G_CALLBACK (on_close_set_flag), &amp;close_event);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_incoming_payload_size=
 (test-&gt;client, 0);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;client), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_inc=
oming_payload_size (test-&gt;server), =3D=3D, 128 * 1024);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* The message to the server is dropped due to the serv=
er's limit. */<br>
&gt; ++&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'=
), 1000 * 1000);<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;client, g=
_bytes_get_data (sent, NULL));<br>
&gt; ++&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; ++&nbsp;&nbsp; WAIT_UNTIL (close_event);<br>
&gt; ++&nbsp;&nbsp; g_assert_null (received);<br>
&gt; ++&nbsp;&nbsp; g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTIO=
N_CLOSED);<br>
&gt; ++&nbsp;&nbsp; g_assert_no_error (test-&gt;client_error);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_send_exceeding_client_max_message_size (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; GBytes *sent =3D NULL;<br>
&gt; ++&nbsp;&nbsp; GBytes *received =3D NULL;<br>
&gt; ++&nbsp;&nbsp; gboolean close_event =3D FALSE;<br>
&gt; ++&nbsp;&nbsp; GError *error =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;server, &quot;error&quot;, G=
_CALLBACK (on_error_copy), &amp;error);<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;client, &quot;closed&quot;, =
G_CALLBACK (on_close_set_flag), &amp;close_event);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_size (t=
est-&gt;client, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;client), =3D=3D, 128 * 1024);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_size (t=
est-&gt;server, 0);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;server), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* The message to the client is dropped due to the clie=
nt's limit. */<br>
&gt; ++&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'=
), 1000 * 1000);<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;server, g=
_bytes_get_data (sent, NULL));<br>
&gt; ++&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; ++&nbsp;&nbsp; WAIT_UNTIL (close_event);<br>
&gt; ++&nbsp;&nbsp; g_assert_null (received);<br>
&gt; ++&nbsp;&nbsp; g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTIO=
N_CLOSED);<br>
&gt; ++&nbsp;&nbsp; g_assert_no_error (test-&gt;client_error);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_send_exceeding_server_max_message_size (Test *test,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer data)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp; GBytes *sent =3D NULL;<br>
&gt; ++&nbsp;&nbsp; GBytes *received =3D NULL;<br>
&gt; ++&nbsp;&nbsp; gboolean close_event =3D FALSE;<br>
&gt; ++&nbsp;&nbsp; GError *error =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;client, &quot;error&quot;, G=
_CALLBACK (on_error_copy), &amp;error);<br>
&gt; ++&nbsp;&nbsp; g_signal_connect (test-&gt;server, &quot;closed&quot;, =
G_CALLBACK (on_close_set_flag), &amp;close_event);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_size (t=
est-&gt;client, 0);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;client), =3D=3D, 0);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* Set the server message total message size manually, =
because its<br>
&gt; ++&nbsp;&nbsp;&nbsp; * default is different for direct connection vs. =
soup connection.<br>
&gt; ++&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_set_max_total_message_size (t=
est-&gt;server, 128 * 1024);<br>
&gt; ++&nbsp;&nbsp; g_assert_cmpuint (soup_websocket_connection_get_max_tot=
al_message_size (test-&gt;server), =3D=3D, 128 * 1024);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; /* The message to the server is dropped due to the serv=
er's limit. */<br>
&gt; ++&nbsp;&nbsp; sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'=
), 1000 * 1000);<br>
&gt; ++&nbsp;&nbsp; soup_websocket_connection_send_text (test-&gt;client, g=
_bytes_get_data (sent, NULL));<br>
&gt; ++&nbsp;&nbsp; g_bytes_unref (sent);<br>
&gt; ++&nbsp;&nbsp; WAIT_UNTIL (close_event);<br>
&gt; ++&nbsp;&nbsp; g_assert_null (received);<br>
&gt; ++&nbsp;&nbsp; g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTIO=
N_CLOSED);<br>
&gt; ++&nbsp;&nbsp; g_assert_no_error (test-&gt;client_error);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + test_send_empty_packets (Test *test,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gconstpointer dat=
a)<br>
&gt; +@@ -2064,11 +2208,47 @@ main (int argc,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-big=
-packets&quot;, Test, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; setup_direct_connection,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets_direct,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/send-big-p=
ackets&quot;, Test, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; setup_soup_connection,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets_soup,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-exceedin=
g-client-max-payload-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_direct_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_client_max_payload_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/send-exceeding-=
client-max-payload-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_soup_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_client_max_payload_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-exceedin=
g-server-max-payload-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_direct_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_server_max_payload_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/send-exceeding-=
server-max-payload-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_soup_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_server_max_payload_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-exceedin=
g-client-max-message-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_direct_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_client_max_message_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/send-exceeding-=
client-max-message-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_soup_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_client_max_message_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-exceedin=
g-server-max-message-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_direct_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_server_max_message_size,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; ++&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/send-exceeding-=
server-max-message-size&quot;, Test, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; setup_soup_connection,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_exceeding_server_max_message_size,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/send-emp=
ty-packets&quot;, Test, NULL,<br>
&gt; +@@ -2217,11 +2397,11 @@ main (int argc,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/deflate-=
send-big-packets&quot;, Test, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; setup_direct_connection_with_extensions,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets_direct,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; teardown_direct_connection);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/soup/deflate-se=
nd-big-packets&quot;, Test, NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; setup_soup_connection_with_extensions,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; test_send_big_packets_soup,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; teardown_soup_connection);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; g_test_add (&quot;/websocket/direct/deflate-=
send-empty-packets&quot;, Test, NULL,<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/reci=
pes-support/libsoup/libsoup_3.4.4.bb<br>
&gt; index c09b06fec2..fc4a286dcf 100644<br>
&gt; --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb<br>
&gt; @@ -46,6 +46,11 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VE=
R}/libsoup-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-2784.patch" id=3D"OWA86b39f0a-af91-c954-0ce9-e=
0245a4837b6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-2784.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-4945.patch" id=3D"OWAbfe16a8d-2bff-c78c-4e6b-5=
0cee399413f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-4945.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2025-12105.patch" id=3D"OWAc031a286-2670-8dbb-2e75-=
e559f88655d7" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-12105.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-14523.patch" id=3D"OWA2cbe0c4d-aa61-49c9-0fd6-a66932032=
fb3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-14523.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-1.patch" id=3D"OWAf6d5f894-6a8c-91c6-bfad-75995fd=
65780" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-1.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-2.patch" id=3D"OWA49047a92-b7f4-9392-6bce-ae6c235=
da64a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-2.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-3.patch" id=3D"OWAee7f095d-f2e2-150b-cf81-8d85743=
92957" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-3.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-32049-4.patch" id=3D"OWA84d9f208-7215-4ac7-206d-4589276=
da99b" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-32049-4.patch</a>&nbsp;\<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;291c67725f36ed90ea43efff25064b69c5a=
2d1981488477c05c481a3b4b0c5aa&quot;<br>
&gt;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DS0PR11MB73126A316573110FD8DD45AB822B2DS0PR11MB7312namp_--

