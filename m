Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D74DC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:52:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38017.1782741141684299484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cDhRs04D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16406b905d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAVTT42496113
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:52:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jsBgeaDpd9P1QCP3XOEKZM
	0p1W4MkzbCaOezNpxAM+0=; b=cDhRs04DzcrcBuKanQI02DQ73OG2wTIbt9NBta
	O3hSzfY5PPLuJtITfni4blMjl/A0dJO/IcpaKVO94k27XRhZUNyLqtYJZuVC5OqZ
	8dhb1CyoWUz7uSUd4lSLXnCv9Wf4HFp1W0qnX0F6oCwhIXQR8cgbgAJ1yiZ+mkzQ
	jX9+AxdO7IC32FtRU5RMrkYu8+TPaN4eF+BjmTEiJRgNFLqzEiBa0Z/lIp3A92na
	c0or5kzxPC+wzb4Jsg8DL2tuW0v8fb6vdvxVdGCW/vahQCRFlI1eXr/qbhjIhUI2
	s8dsshskfslmIBjNsaPgrw0EHXe7W99iFIJBCMd5mU77hJDg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29syj29g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 06:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQyMUpu0dvhaOTi+cchihLY7nQSr1h7l00/OGFpA6a0zYqOxKh6kW8JsNah/4FPnIf76RMEPiyMJ4DPgLXUiKP+xjXHGljiMG66QHHUM0sVclq+ZgDkikIibzklWTZQnpK4mHIbwvO+0UhDd+L3D+N3cPbfIZVyS7NdfxZub1ay5ZUQdT1wc74reUsS2fU2UsICOz0+7qRHZNu/eIioH7ss3wa8Ux1QL9oq/SJutW7w0/uINRX2mDw3CmY0XXUAS9sPE3X7PfmgFuMBdY7Os9ufEOyFaY8PEi6Mc3lpCLv+JQS7//a1/Yk/PGSjIy3pzmYE9BgjJu/vLREf7BVgSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsBgeaDpd9P1QCP3XOEKZM0p1W4MkzbCaOezNpxAM+0=;
 b=VEW5olpwBi64l1J6taZv3KDOYo35xHvRa681gbHxGrSqNolip+EpymBGHspYSMyCOlm+yLkrhy/d7D7+11uHX2bUS4m+cXScmkNyB5HZ5vjXqwkl7Wi2HDaSlu7xT8/AYin+WiPSKGjB939aynftUlPqrx6ZftD0diqAHJbhsuPqZQArlCAxpmLzX8xUxtsBdM2vhMipuaZjHEUuga64UMOseKbG1uSPZ62xK6EDbBnNAJXTPpjbcdwTWC5QQlHeyJiTCm8T9eP2Xf4BFYgI1LAgzIhADGzJe8TaK4LKTohn4Z0g8iiL6EiKKM6wb4lYpGFwNQPEWLDOcydGaug7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DSVPR11MB9720.namprd11.prod.outlook.com (2603:10b6:8:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:52:17 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:52:16 +0000
Content-Type: multipart/alternative;
 boundary="------------OMcy6SNKz0rewcGUJzcMTLln"
Message-ID: <1094aa0d-cc45-4dd5-92d6-7ee034ea858e@windriver.com>
Date: Mon, 29 Jun 2026 09:52:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gnutls: fix CVE-2026-33846 --> wrynose branch.
To: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>
Cc: Yi.Zhao@windriver.com, Shiva.Komati@windriver.com, Qi.Chen@windriver.com,
        Libo.Chen.CN@windriver.com, Jinfeng.Wang.CN@windriver.com,
        Shailesh.Masih@windriver.com, Tomas.Holmberg@windriver.com,
        Haixiao.Yan.CN@windriver.com
References: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
X-ClientProxiedBy: YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DSVPR11MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c89df58-96fb-498c-2984-08ded5e5a142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|29003799003|12006099003|25016099003|6133799003|11063799006|5023799004|22082099003|18002099003|56012099006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ZzyEyXEg1zOrut/FQL6s0/uPFu94xSKpNoKpoaKDrrwQbwNq7H2nBivUHX5mzxmM771KggOcSGJjX11cgzkL1rdR5XoQ6LqyQFDxjmG38FFFMAlCv4/QdNXAkOTdiGD7q/zS6vg85bu3lZORc7Ghk+hsiNfibYSOwcaUPBWypYCBoi4xtKfv8KsYmPdCH3rH/pIpT7t/GOajr1Wvj5X1bHZKY0446LX45VPwbu+7ihCruPEdNE30Yw7appR1w7rGMYySwUqZZwZVeVnGcaKGvf1xiRBYiLxWC7SGKORe/aTfhVTj+8EHrLFk84z52J3L6cZ6QHmM1YjeBEIo6sb0f7uHeqTb0OmVbmQO4wb5sc3nAPT5QfIud1knbyyV/S+1s/fCeni0g2HlyQo47rZMQS8NMWlA3dhLe9M1o8f8zn0+IXmCJyAbSCanOClFZn2/kN533Ln4vOQ8T7yqt2ZNvL8M5Ojl5Yxl0aD5477GERXjmxkn5p/cFHurmtmRZDw5i2JBeQ8A5LZi96fIJ5oLn1yMENyoIkgNNHQ6SspYVRxs5/NxreMVHSscajbGLw79Cyr7IRzfodr0iesI5WeN1bRyRmoF41/bHPejpbExFjZQYnmvZsNWTqn7dQ3NVoVI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(29003799003)(12006099003)(25016099003)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rm1FazEwcmJpUXNhOUVta0pTRjN6NHYweVU3a2RoWEdzUG9xbnA3SXRWajU5?=
 =?utf-8?B?S3F5TnhBQkpEN1MzV05NL05kN1NTSHV3emQ5QVRobHUzdTZMU09wUUJONThD?=
 =?utf-8?B?VUZvTGNQNjh5WnFqQ2lGY2x3VElUdFgyaXhyTXZ2UHQxWkNsaFlXQUh0NGRD?=
 =?utf-8?B?WHNhWml2Sk92M2ZQaXFhZGRmd1ZvN3c4MXAwSVRHNlhrVGR6a3p6aXhKRHVQ?=
 =?utf-8?B?eTdEaEMrRHE0WldUZVgvUkJ0TTlJWkNlcy9hNjV4S3pmWFN3ZmVHSjQ4OE1H?=
 =?utf-8?B?M1cxdEZVQVJ2a2xwaXk4RnpKdVlmZ1FJcUNDcTVpL3lwYkhudllYbW5ES282?=
 =?utf-8?B?clNKbyt5TjFPckEyMWZJOEhGUTRIRTBzZ0FOc05obEJRMDhRM1hGd3lnSk5h?=
 =?utf-8?B?a01iYS95VGttbVYvVHFYdXB2YlE0ZWxjZmJzM0lONWJES05UN3Y1OEpPSDY5?=
 =?utf-8?B?YmNUVWV4VmpyV3BNRnVMWEVQSXJoT0MxY0ZRRm1FNnByTHhmVmZlNEFGRUtL?=
 =?utf-8?B?VFUxNEk0clV3Mk54dWlHS2xZREVVNE54a0xPcjR6RXRFbFlIM0RCMHphN3Uz?=
 =?utf-8?B?OTQyNmovNG5sZVdzNzFzTjIySTNoTHRxaStDZmV6RXZvb1lSU2hBMzRVRGtN?=
 =?utf-8?B?d3JWT2hwNFlsSWRVQ0VOcXVmRHIxVUhTVkxrT3NEb2RoTE10dTMxZlcxZ0FF?=
 =?utf-8?B?cGh4YXFHTmpMQVlUWkptMDJjUWg3SkgwUlF6M3krdk1WbGh4MlByZEwxUXZB?=
 =?utf-8?B?Q0V5UlQvTWRtd1FkVm01M0VaWUtjMEhldGpJVkY2bGZPUjVGa1dVVXhQU3d0?=
 =?utf-8?B?QWpnNFpQdnhXckY4WDBpWURqMklsU1pWKysva3hEZ29GNnRSOXh3SVNYTHdR?=
 =?utf-8?B?QUZPTFJkaDlQcDdkb3NLbElWLzFnK2pLTUZLTGJycUhhMWU0ckZEd1kwZWpH?=
 =?utf-8?B?NDdmWVVBMkxDVWdUaWsxMmN2aWlsdEgxZ2c3TjdyOUxXZGFHMCtIS05PMCtT?=
 =?utf-8?B?MmpQVlNZUWQ3WWwwaVVyWlVjTW1BWTZtNUt6K3BFVThJMjZ3VDhaOFBxNU9I?=
 =?utf-8?B?ajlXN1F4OUR6NTZpcVNkRVkzT3BvcjhISEllVEp6NjdjbXV3bHhRc21OeGxR?=
 =?utf-8?B?a1NYbXBqa0IrbVdldXAxb1RhRHlFRHZNUzY1MU9abFQwcW1nUUZ0OTVDQnlL?=
 =?utf-8?B?NCtPM1Azb2pnb1paSkVUREZRSVBOcVZDc0VIY0hheVpGMU85QVpCcVR1VVRa?=
 =?utf-8?B?QmFKcG5JNjgvcnI1dkk2UEtPRDF2SXBkUUZpZnl0YVRSc2w2amNMK05zYUxE?=
 =?utf-8?B?dVJUVFZFdkh0YzNkcVMzSDk4OXZDWE8yM3Q0VHRXd1k0YW8ybk02R0ttMGt6?=
 =?utf-8?B?aW1IbEQrei9maFdKNXFYYU1YT2Q2ZUVIRE82QUw3Ry9XUVhFdzdMOEh3TGV0?=
 =?utf-8?B?WXIrRU54RUd5WFRMK25SdEQ4SWZ1SlVEajZLZEFsMWhnSW9oK09CZmtkNk1P?=
 =?utf-8?B?R1V5ZXNuNlEzZUdmMzQrT0dBbjMzanNMKzRoWk5FZ2hUcDUyZTZZSTZYTndi?=
 =?utf-8?B?NXdueFcyTzRkU3hCMHBpbVJJbEs3OEd4RTRYTmlPaS95SXdlNlpOaVkxMHFJ?=
 =?utf-8?B?SC9ISkVxRDIrZDYxRUdydXcvRGk4THpBWGZNdHRscjJJTzlzZ3pielREQlky?=
 =?utf-8?B?ZWhEeXhpREFxSk9jT1Q3ZjR5Y29kdEpkUE1pUmhCNjYyRVVIWjRYaGpJMTZN?=
 =?utf-8?B?RFRCSjdJSnBLTWp2TFNqUFMvRGxoVWgyMjE4MWdIZ1JXOEFYVDBkNXEyV2JN?=
 =?utf-8?B?V1FBbE9wZWZ1ZlFibDRQWWJub0FEUVo4ZFNSR3o1djBxTmQzNkpWYnZXeGFO?=
 =?utf-8?B?WHY2SnBIdnVaUllRS1FzMm5jWkEyQUk5cHVnVFBQUVpkY0ZYS05JVGcveFFo?=
 =?utf-8?B?N2o2TG94emhiRzhWQkVrU3BtOHY5TnhrWkNsSklTdS9OWmJDTVExWGpTcGs2?=
 =?utf-8?B?eVVzem1jR09xM0VnM0dHeXo4RE9UTTRpSkpLL1pOQktwUVF1QWpLekxLM05S?=
 =?utf-8?B?eGR4cUM1S3lCSC9ST1ViclBXUVltL092WHJSMkthbkZpODQrVFNPZjJNRUsx?=
 =?utf-8?B?aW5XRGxOSFNQKy9GcUttekg5TGsyWDcvem8yYVpEZ3NmbEVuajF1V2t5WU1h?=
 =?utf-8?B?QWNSNFlDcHJVTER6OGtaUjZhNCtQYkRQMkd1bVFnQ09vV3pPTXBiOGowRlVU?=
 =?utf-8?B?ZjRkZGpNa1lTZFl3Z25uemxvM2ovL0hMNWRwbGZwMlJqQWZTVWo0WXZHVmhK?=
 =?utf-8?B?eVBvOUk4MEFzM2V6ZmhHR29BOStkVWVDWlpaaS9mN05iR3c3eFRCNHY2RGFP?=
 =?utf-8?Q?qP9TKslGJRwIxr7o=3D?=
X-Exchange-RoutingPolicyChecked: 
	DS9gRHbv/p+nuyMFeqtx/PE9sQ37l6TF0ENmH4FH74/NtZk/vKKT6RqwRUHv/uJ9DHa+cNzD/L5XyFbTh2JTBKF1h9ZQkecAO+R4QhZNsDDjPr9ExjnLUAkWuuUVbBQa1w4f0BwC6y7kvNdoqHqE4vxkOgWt/tTSOu0x/1Qy/EdgKtCKvQ3iTNTDkMax/7tilbd6YNHAwx6BYtltliGQX13Gfl8VQaN7HJFmCccWfHUQaluR4xe2MhvqPomZFwXuJBCjkHTWXrm9QWbxCuYOwXqPi4LbblkBtY87eWmNRhGo3quMaedTAos2PoYQj6yZLSNzkD/n8gYs5X0+90CF8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c89df58-96fb-498c-2984-08ded5e5a142
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:52:16.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67m8S9d+48OW0EigrS8umtj7/BM85WbqWIlpgiMotWT3tGyiXkqTe/5MDDm5WlMv04iByGUTf8IaS6AvMjhxp3K1M+DYm5DPfwRaBKjt8+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9720
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sFY5q-k08f83mB6fTOU19MpZ_3ReU8ii
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a427894 cx=c_pps
 a=2EogD3SZGC0twO92opjmhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=p0WdMEafAAAA:8 a=mDV3o1hIAAAA:8 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=ken-dkCl-D1nmm6MlW4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=3fDrEXjx15q5Nas2SowA:9 a=xH2CnQAA4946FcAH:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=r0dl5i_q2XGqDZkti5dn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VsRv7-dMx0GfyEc_kqGU1KEuhoW2wln5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfX3iJymGi4JN+Y
 OLuTtzMoZZZw/km4eQ76zARG5UPfHWTHGxK0snV3bVjjl1aogyNlM5FSRJHWx2ArFjd41VpkCi9
 ccuYokhBOkMYV2GqPhIuHL4Eev2ofFrn3eAGxa82E6zaIs9M/0f1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNSBTYWx0ZWRfX4gIMSPoNsXZM
 gjNEN+GlRER34ImXfcbtHXzin+uquhhl8dr92ZKeudjoCID1qZMuI4XhG6mURQV6Ht5YUL6qT6d
 hL8X+KzVjwF6YnGJqOY5yguI/TucmE+nEcEek7gyG9jyEG2MHk4M+fCAN6Q1bd/V3LYO6NqrhaE
 CNr01/n+0hOYLj2yFzGnksg1EzkfQ8MPrLQylQZF1Tf1oFIwttnAkHW+zauSAzAihepQVzvqnHn
 jnk6B5CWl1cs7tc6NNib0TVyHlqw24Frpep/fBFtmUzaS9ZA3Q/HKLxT3JyMT0+6I94Ntknyfl9
 wTWPRqGw+zE5d9miHAI71W0qSTMZ1lS7FahAOXPa7UPYX24MgAZF8J7P1xn9FhNMb4wn4FCAe8Q
 tR6t7q14a++2jtulMIf1kC0ledUmoD587JTjQvwiNzm8jn0ZLBdDeVquBSBHqyqe461uLn8jwYC
 ScoU0tbfvzDc48p4L9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239784

--------------OMcy6SNKz0rewcGUJzcMTLln
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yoann,

This is for wrynose.

Pritam, next time use the --subject-prefix option as shown:

https://git.openembedded.org/openembedded-core/tree/README.OE-Core.md?h=wrynose#n29

Thanks,

../Randy

On 2026-06-29 01:02, Pritam Srichandan Sahoo wrote:
> Backport upstream fixes for DTLS handshake fragment reassembly
> vulnerability (CVE-2026-33846).
>
> Includes:
> - 4f94e5cfe1f2: add basic DTLS fragment reassembly test
> - 9deffca528c2: shorten merge_handshake_packet using recv_buf
> - 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
> - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
> - bb427ff74dba: add fragmented ClientHello test coverage
> - 092c65d004e2: match DTLS datagrams by handshake sequence number
> - a2b41be83a1a: add test for mismatched message_seq handling (#1839)
>
> These commits are included in gnutls 3.8.13 and are backported by
> both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
> (gnutls-3.8.10-4.el10) using identical commit selection.
>
> Signed-off-by: Pritam Srichandan Sahoo<PritamSrichandan.Sahoo@windriver.com>"
> ---
>   .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>   meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>   2 files changed, 863 insertions(+)
>   create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> new file mode 100644
> index 0000000000..5c85a531b3
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> @@ -0,0 +1,862 @@
> +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Fri, 20 Mar 2026 16:09:40 +0100
> +Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTLS test
> +
> +Upstream-Status: Backport
> +[1]https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0daf43b9
> +[2]https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0
> +[3]https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78
> +[4]https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb058565d87
> +[5]https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873f762743
> +[6]https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac49a09f78
> +[7]https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a656550e
> +
> +CVE: CVE-2026-33846
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +Signed-off-by: Pritam Srichandan Sahoo<PritamSrichandan.Sahoo@windriver.com>
> +---
> + tests/Makefile.am           |   7 +-
> + tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
> + 2 files changed, 214 insertions(+), 1 deletion(-)
> + create mode 100644 tests/mini-dtls-fragments.c
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index aeeaaf79d..586f1952d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -241,7 +241,8 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
> + 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
> + 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
> + 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
> +-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
> ++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
> ++	 mini-dtls-fragments
> +
> + ctests += tls-channel-binding
> +
> +@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
> + 	-I$(top_srcdir)/gl	\
> + 	-I$(top_builddir)/gl
> +
> ++mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
> ++	-I$(top_srcdir)/gl	\
> ++	-I$(top_builddir)/gl
> ++
> + if ENABLE_PKCS11
> + if !WINDOWS
> + ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +new file mode 100644
> +index 000000000..ee75feeb6
> +--- /dev/null
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -0,0 +1,208 @@
> ++/*
> ++ * Copyright (C) 2026 Red Hat, Inc.
> ++ *
> ++ * Author: Alexander Sosedkin
> ++ *
> ++ * This file is part of GnuTLS.
> ++ *
> ++ * GnuTLS is free software; you can redistribute it and/or modify it
> ++ * under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 3 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * GnuTLS is distributed in the hope that it will be useful, but
> ++ * WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public License
> ++ * along with this program.  If not, see<https://www.gnu.org/licenses/>
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++
> ++#if defined(_WIN32)
> ++
> ++int main(void)
> ++{
> ++	exit(77);
> ++}
> ++
> ++#else
> ++
> ++#include <assert.h>
> ++#include <errno.h>
> ++#include <stdbool.h>
> ++#include <stdint.h>
> ++#include <string.h>
> ++#include <gnutls/gnutls.h>
> ++#include <gnutls/dtls.h>
> ++#include "cert-common.h"
> ++#include "utils.h"
> ++
> ++#include "attribute.h"
> ++
> ++static void server_log_func(int level, const char *str)
> ++{
> ++	fprintf(stderr, "server|<%d>| %s", level, str);
> ++}
> ++
> ++static void client_log_func(int level, const char *str)
> ++{
> ++	fprintf(stderr, "client|<%d>| %s", level, str);
> ++}
> ++
> ++#define QUEUE_SIZE 1024
> ++#define PACKET_SIZE 2048
> ++
> ++typedef struct {
> ++	uint8_t buf[PACKET_SIZE];
> ++	size_t len;
> ++} packet_t;
> ++typedef struct {
> ++	packet_t packets[QUEUE_SIZE];
> ++	size_t head;
> ++	size_t tail;
> ++} queue_t;
> ++
> ++static queue_t c2s, s2c;
> ++
> ++static int queue_put(queue_t *q, const void *buf, size_t len)
> ++{
> ++	assert(len <= PACKET_SIZE);
> ++	memcpy(q->packets[q->tail].buf, buf, len);
> ++	q->packets[q->tail].len = len;
> ++	q->tail++;
> ++	q->tail %= QUEUE_SIZE;
> ++	assert(q->tail != q->head);
> ++	return len;
> ++}
> ++
> ++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, size_t len)
> ++{
> ++	if (q->head == q->tail) {
> ++		gnutls_transport_set_errno(s, EAGAIN);
> ++		return -1;
> ++	}
> ++	size_t n = q->packets[q->head].len;
> ++	memcpy(buf, q->packets[q->head].buf, n);
> ++	q->head++;
> ++	q->head %= QUEUE_SIZE;
> ++	return n;
> ++}
> ++
> ++static void queue_reset(queue_t *q)
> ++{
> ++	q->head = q->tail = 0;
> ++}
> ++
> ++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
> ++{
> ++	return 1;
> ++}
> ++
> ++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
> ++{
> ++	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
> ++{
> ++	return queue_get(&s2c, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, size_t l)
> ++{
> ++	return queue_put(&s2c, b, l);
> ++}
> ++
> ++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
> ++				  size_t l)
> ++{
> ++	return queue_put(&c2s, b, l);
> ++}
> ++
> ++static void test(gnutls_push_func client_push)
> ++{
> ++	gnutls_session_t client, server;
> ++	gnutls_certificate_credentials_t ccred, scred;
> ++	int cr = 0, sr = 0;
> ++	bool cdone = false, sdone = false;
> ++
> ++	if (debug)
> ++		gnutls_global_set_log_level(4711);
> ++
> ++	gnutls_certificate_allocate_credentials(&scred);
> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
> ++					    GNUTLS_X509_FMT_PEM);
> ++	gnutls_certificate_allocate_credentials(&ccred);
> ++
> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++	gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
> ++
> ++	gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
> ++				   NULL);
> ++	gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
> ++				   NULL);
> ++
> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
> ++
> ++	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++
> ++	gnutls_transport_set_ptr(client, client);
> ++	gnutls_transport_set_push_function(client, client_push);
> ++	gnutls_transport_set_pull_function(client, client_pull);
> ++	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
> ++
> ++	gnutls_transport_set_ptr(server, server);
> ++	gnutls_transport_set_push_function(server, server_push);
> ++	gnutls_transport_set_pull_function(server, server_pull);
> ++	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
> ++
> ++	while (!cdone || !sdone) {
> ++		gnutls_global_set_log_function(client_log_func);
> ++		if (!cdone)
> ++			cr = gnutls_handshake(client);
> ++		if (!cr || gnutls_error_is_fatal(cr))
> ++			cdone = true;
> ++
> ++		gnutls_global_set_log_function(server_log_func);
> ++		if (!sdone)
> ++			sr = gnutls_handshake(server);
> ++		if (!sr || gnutls_error_is_fatal(sr))
> ++			sdone = true;
> ++	}
> ++
> ++	if (cr)
> ++		fail("client: %s\n", gnutls_strerror(cr));
> ++	if (sr)
> ++		fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++	success("OK\n");
> ++
> ++	queue_reset(&c2s);
> ++	queue_reset(&s2c);
> ++
> ++	gnutls_deinit(client);
> ++	gnutls_deinit(server);
> ++	gnutls_certificate_free_credentials(ccred);
> ++	gnutls_certificate_free_credentials(scred);
> ++}
> ++
> ++void doit(void)
> ++{
> ++	global_init();
> ++	test(client_push_normal);
> ++	gnutls_global_deinit();
> ++}
> ++
> ++#endif /* _WIN32 */
> +--
> +2.54.0
> +
> +
> +From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 17:49:31 +0200
> +Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using recv_buf
> +
> +I had vague concerns about thread-safety of this,
> +but then this pattern already exists within the file.
> +
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
> + 1 file changed, 17 insertions(+), 35 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b05..d54c77022 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t session,
> + 	int exists = 0, i, pos = 0;
> + 	int ret;
> +
> ++	handshake_buffer_st *recv_buf =
> ++		session->internals.handshake_recv_buffer;
> ++
> + 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
> +-		if (session->internals.handshake_recv_buffer[i].htype ==
> +-		    hsk->htype) {
> ++		if (recv_buf[i].htype == hsk->htype) {
> + 			exists = 1;
> + 			pos = i;
> + 			break;
> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session_t session,
> + 		_gnutls_write_uint24(0, &hsk->header[6]);
> + 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
> +
> +-		_gnutls_handshake_buffer_move(
> +-			&session->internals.handshake_recv_buffer[pos], hsk);
> ++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +
> + 	} else {
> +-		if (hsk->start_offset <
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset &&
> +-		    hsk->end_offset + 1 >=
> +-			    session->internals.handshake_recv_buffer[pos]
> +-				    .start_offset) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++		if (hsk->start_offset < recv_buf[pos].start_offset &&
> ++		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset = hsk->start_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset = MIN(
> +-				hsk->end_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.end_offset);
> +-		} else if (hsk->end_offset >
> +-				   session->internals.handshake_recv_buffer[pos]
> +-					   .end_offset &&
> +-			   hsk->start_offset <=
> +-				   session->internals.handshake_recv_buffer[pos]
> +-						   .end_offset +
> +-					   1) {
> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
> +-					.data.data[hsk->start_offset],
> ++			recv_buf[pos].start_offset = hsk->start_offset;
> ++			recv_buf[pos].end_offset =
> ++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
> ++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
> ++			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> + 			       hsk->data.data, hsk->data.length);
> +
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.end_offset = hsk->end_offset;
> +-			session->internals.handshake_recv_buffer[pos]
> +-				.start_offset = MIN(
> +-				hsk->start_offset,
> +-				session->internals.handshake_recv_buffer[pos]
> +-					.start_offset);
> ++			recv_buf[pos].end_offset = hsk->end_offset;
> ++			recv_buf[pos].start_offset = MIN(
> ++				hsk->start_offset, recv_buf[pos].start_offset);
> + 		}
> + 		_gnutls_handshake_buffer_clear(hsk);
> + 	}
> +--
> +2.54.0
> +
> +
> +From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 18:21:36 +0200
> +Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly
> +
> +Previously, gnutls didn't check that DTLS fragments claimed
> +a consistent message_length value.
> +Additionally, a crucial array size check was missing,
> +enabling an attacker to cause a heap overwrite.
> +The updated version rejects fragments with mismatching length
> +and adds a missing boundary check.
> +
> +Reported-by: Haruto Kimura (Stella)
> +Reported-by: Oscar Reparaz
> +Reported-by: Zou Dikai
> +Fixes: #1816
> +Fixes: #1838
> +Fixes: #1839
> +Fixes: CVE-2026-33846
> +Fixes: GNUTLS-SA-2026-04-29-1
> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + lib/buffers.c | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index d54c77022..5d4d16276 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_t session,
> + 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +
> + 	} else {
> ++		if (hsk->length != recv_buf[pos].length) {
> ++			/* inconsistent across fragments */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		/* start_offset + data.length <= hsk->length <= max_length */
> ++		if (hsk->length < hsk->start_offset + hsk->data.length) {
> ++			/* impossible claims, overflow requested */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++		if (hsk->length > recv_buf[pos].data.max_length) {
> ++			/* we don't have this much allocated, overflow guard */
> ++			_gnutls_handshake_buffer_clear(hsk);
> ++			return gnutls_assert_val(
> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++		}
> ++
> + 		if (hsk->start_offset < recv_buf[pos].start_offset &&
> + 		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
> + 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +--
> +2.54.0
> +
> +
> +From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Wed, 1 Apr 2026 19:51:45 +0200
> +Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 reproducer
> +
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 120 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index ee75feeb6..8d5a18acd 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
> + 	return 1;
> + }
> +
> ++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms)
> ++{
> ++	return c2s.head != c2s.tail ? 1 : 0;
> ++}
> ++
> + static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
> + {
> + 	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> +@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
> + 	gnutls_certificate_free_credentials(scred);
> + }
> +
> ++static void test_malicious1816(void)
> ++{
> ++	/* dgram1: msg_len=50, frag_offset=25, frag_len=25 */
> ++	static const uint8_t dgram1_hdr[] = {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
> ++		0x00, 0x25, /* record_length: 37 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x00, 0x32, /* msg_length: 50 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x19, /* frag_offset: 25 */
> ++		0x00, 0x00, 0x19, /* frag_length: 25 */
> ++	};
> ++	/* dgram2: msg_len=3000, frag_offset=0, frag_len=48 */
> ++	static const uint8_t dgram2_hdr[] = {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
> ++		0x00, 0x3c, /* record_length: 60 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x00, /* frag_offset: 0 */
> ++		0x00, 0x00, 0x30, /* frag_length: 48 */
> ++	};
> ++	/* dgram3: msg_len=3000, frag_offset=40, frag_len=1475 */
> ++	static const uint8_t dgram3_hdr[] = {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
> ++		0x05, 0xcf, /* record_length: 1487 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x00, 0x28, /* frag_offset: 40 */
> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++	};
> ++	/* dgram4: msg_len=3000, frag_offset=1500, frag_len=1475 */
> ++	static const uint8_t dgram4_hdr[] = {
> ++		0x16, /* type: handshake */
> ++		0xfe, 0xfd, /* version: DTLS 1.2 */
> ++		0x00, 0x00, /* epoch: 0 */
> ++		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
> ++		0x05, 0xcf, /* record_length: 1487 */
> ++		0x01, /* msg_type: ClientHello */
> ++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++		0x00, 0x00, /* msg_seq: 0 */
> ++		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
> ++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++	};
> ++	gnutls_session_t server;
> ++	gnutls_certificate_credentials_t scred;
> ++	uint8_t dgram[1500];
> ++	int sr;
> ++
> ++	if (debug)
> ++		gnutls_global_set_log_level(4711);
> ++
> ++	gnutls_certificate_allocate_credentials(&scred);
> ++	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
> ++					    GNUTLS_X509_FMT_PEM);
> ++
> ++	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++	gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
> ++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++
> ++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++				 get_timeout());
> ++
> ++	gnutls_transport_set_ptr(server, server);
> ++	gnutls_transport_set_push_function(server, server_push);
> ++	gnutls_transport_set_pull_function(server, server_pull);
> ++	gnutls_transport_set_pull_timeout_function(server,
> ++						   c2s_pull_timeout_once);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram1_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 25);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram2_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 48);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram3_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++	memset(dgram, 0, sizeof(dgram));
> ++	memcpy(dgram, dgram4_hdr, 25);
> ++	queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++	gnutls_global_set_log_function(server_log_func);
> ++	do {
> ++		sr = gnutls_handshake(server); /* invalid write if vulnerable */
> ++	} while (c2s.head != c2s.tail && !gnutls_error_is_fatal(sr));
> ++	if (sr != GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
> ++		fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
> ++		     "got: %s\n",
> ++		     gnutls_strerror(sr));
> ++
> ++	success("OK\n");
> ++
> ++	queue_reset(&c2s);
> ++	queue_reset(&s2c);
> ++
> ++	gnutls_deinit(server);
> ++	gnutls_certificate_free_credentials(scred);
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> + 	test(client_push_normal);
> ++	success("malicious reassembly bug exploitation (#1816):\n");
> ++	test_malicious1816();
> + 	gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> +
> +From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:08:11 +0200
> +Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenting
> + ClientHello
> +
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 107 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 8d5a18acd..93490bac2 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
> + 	return queue_put(&c2s, b, l);
> + }
> +
> ++static void write_u16(uint8_t *p, uint16_t val)
> ++{
> ++	p[0] = val >> 8;
> ++	p[1] = val & 0xff;
> ++}
> ++
> ++static void write_u24(uint8_t *p, uint32_t val)
> ++{
> ++	p[0] = (val >> 16) & 0xff;
> ++	p[1] = (val >> 8) & 0xff;
> ++	p[2] = val & 0xff;
> ++}
> ++
> ++static void write_u48(uint8_t *p, uint64_t seq)
> ++{
> ++	int i;
> ++	for (i = 5; i >= 0; i--) {
> ++		p[i] = seq & 0xff;
> ++		seq >>= 8;
> ++	}
> ++}
> ++
> ++static uint64_t read_u48(const uint8_t *p)
> ++{
> ++	uint64_t seq = 0;
> ++	int i;
> ++	for (i = 5; i >= 0; i--) {
> ++		seq <<= 8;
> ++		seq |= p[i];
> ++	}
> ++	return seq;
> ++}
> ++
> + static void test(gnutls_push_func client_push)
> + {
> + 	gnutls_session_t client, server;
> +@@ -316,12 +349,86 @@ static void test_malicious1816(void)
> + 	gnutls_certificate_free_credentials(scred);
> + }
> +
> ++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, size_t l,
> ++				    int delta_n)
> ++{
> ++	if (delta_n == 0 || l < 13 || data[3] != 0 || data[4] != 0)
> ++		return queue_put(&c2s, data, l);
> ++
> ++	uint8_t *p = malloc(l);
> ++	assert(p);
> ++	memcpy(p, data, l);
> ++	write_u48(p + 5, read_u48(p + 5) + delta_n);
> ++	ssize_t ret = queue_put(q, p, l);
> ++	free(p);
> ++	return ret;
> ++}
> ++
> ++static void split_client_hello(const uint8_t *data, size_t len, uint8_t **frag1,
> ++			       size_t *frag1_len, uint8_t **frag2,
> ++			       size_t *frag2_len)
> ++{
> ++	size_t body_size = len - 25;
> ++	*frag1_len = 13 + 12 + 1;
> ++	*frag2_len = 13 + 12 + (body_size - 1);
> ++
> ++	*frag1 = malloc(13 + 12 + 1);
> ++	assert(*frag1);
> ++	*frag2 = malloc(13 + 12 + body_size - 1);
> ++	assert(*frag2);
> ++
> ++	/* first fragment: record header + handshake header + first body byte */
> ++	memcpy(*frag1, data, 13); /* record header */
> ++	write_u16(*frag1 + 11, 12 + 1); /* record length */
> ++	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
> ++	write_u24(*frag1 + 19, 0); /* fragment_offset = 0 */
> ++	write_u24(*frag1 + 22, 1); /* fragment_length = 1 */
> ++	(*frag1)[25] = data[25]; /* first body byte */
> ++
> ++	/* second fragment: record header + handshake header + remaining body */
> ++	memcpy(*frag2, data, 13); /* record header */
> ++	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
> ++	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number */
> ++	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
> ++	write_u24(*frag2 + 19, 1); /* fragment_offset = 1 */
> ++	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length */
> ++	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
> ++}
> ++
> ++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
> ++				       size_t l)
> ++{
> ++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
> ++
> ++	const uint8_t *data = (const uint8_t *)b;
> ++	uint8_t *frag1, *frag2;
> ++	size_t frag1_len, frag2_len;
> ++
> ++	/* Pass through anything that isn't an epoch0 ClientHello with body */
> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++	    data[0] != 22 || /* not a handshake record */
> ++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
> ++	    data[13] != 1) /* not ClientHello */
> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++	/* epoch0 Client Hello: special treatment of splitting into fragments */
> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
> ++	queue_put(&c2s, frag1, frag1_len);
> ++	queue_put(&c2s, frag2, frag2_len);
> ++	free(frag1);
> ++	free(frag2);
> ++	seq_offset++;
> ++	return l;
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> + 	test(client_push_normal);
> + 	success("malicious reassembly bug exploitation (#1816):\n");
> + 	test_malicious1816();
> ++	success("split client hello smoke-test\n");
> ++	test(client_push_split_hello);
> + 	gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> +
> +From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:32:02 +0200
> +Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number
> +
> +DTLS handshake fragment reassembly previously matched incoming fragments
> +by handshake type only, without checking the sequence number.
> +This allowed fragments from different handshake messages
> +to be merged into the same reassembly buffer.
> +
> +Now sequence number is accounted for during reassembly,
> +ensuring fragments are only merged when they belong
> +to the same handshake message.
> +
> +Reported-by: Zou Dikai
> +Fixes: #1839
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + lib/buffers.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 5d4d16276..62f140ed3 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t session,
> + 		session->internals.handshake_recv_buffer;
> +
> + 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
> +-		if (recv_buf[i].htype == hsk->htype) {
> ++		if (recv_buf[i].htype == hsk->htype &&
> ++		    recv_buf[i].sequence == hsk->sequence) {
> + 			exists = 1;
> + 			pos = i;
> + 			break;
> +--
> +2.54.0
> +
> +
> +From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin<asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:36:08 +0200
> +Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching message_seq
> +
> +Signed-off-by: Alexander Sosedkin<asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
> + 1 file changed, 47 insertions(+), 7 deletions(-)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 93490bac2..499a92a92 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
> + 	return seq;
> + }
> +
> +-static void test(gnutls_push_func client_push)
> ++static void test(gnutls_push_func client_push, bool expect_success)
> + {
> + 	gnutls_session_t client, server;
> + 	gnutls_certificate_credentials_t ccred, scred;
> +@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
> + 			sr = gnutls_handshake(server);
> + 		if (!sr || gnutls_error_is_fatal(sr))
> + 			sdone = true;
> ++
> ++		if (c2s.head == c2s.tail && s2c.head == s2c.tail)
> ++			break; /* speed the test up */
> + 	}
> +
> +-	if (cr)
> +-		fail("client: %s\n", gnutls_strerror(cr));
> +-	if (sr)
> +-		fail("server: %s\n", gnutls_strerror(sr));
> ++	if (expect_success) {
> ++		if (cr)
> ++			fail("client: %s\n", gnutls_strerror(cr));
> ++		if (sr)
> ++			fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++	} else {
> ++		if (cr == 0 && sr == 0)
> ++			fail("handshake unexpectedly succeeded: %s / %s\n",
> ++			     gnutls_strerror(cr), gnutls_strerror(sr));
> ++	}
> +
> + 	success("OK\n");
> +
> +@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
> + 	return l;
> + }
> +
> ++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t tr,
> ++					       const void *b, size_t l)
> ++{
> ++	/* gnutls wasn't matching on message_seq on merging, see #1839 */
> ++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
> ++
> ++	const uint8_t *data = (const uint8_t *)b;
> ++	uint8_t *frag1, *frag2;
> ++	size_t frag1_len, frag2_len;
> ++
> ++	/* Pass through anything that isn't an epoch0 ClientHello with body */
> ++	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++	    data[0] != 22 || /* not a handshake record */
> ++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
> ++	    data[13] != 1) /* not ClientHello */
> ++		return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++	/* epoch0 Client Hello: special treatment of splitting into fragments */
> ++	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
> ++	queue_put(&c2s, frag1, frag1_len);
> ++	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 */
> ++	queue_put(&c2s, frag2, frag2_len);
> ++	free(frag1);
> ++	free(frag2);
> ++	seq_offset++;
> ++	return l;
> ++}
> ++
> + void doit(void)
> + {
> + 	global_init();
> +-	test(client_push_normal);
> ++	test(client_push_normal, true);
> + 	success("malicious reassembly bug exploitation (#1816):\n");
> + 	test_malicious1816();
> + 	success("split client hello smoke-test\n");
> +-	test(client_push_split_hello);
> ++	test(client_push_split_hello, true);
> ++	success("split client hello smoke-test and mangle sequence number\n");
> ++	test(client_push_split_hello_bad_seq, false);
> + 	gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> index 8554ab943d..3ae7a2eb78 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> @@ -24,6 +24,7 @@ SRC_URI ="https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar 
> file://run-ptest \ file://Add-ptest-support.patch \ file://c99.patch \ 
> + file://CVE-2026-33846.patch \ "
>   
>   SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"


-- 
# Randy MacLeod
# Wind River Linux

--------------OMcy6SNKz0rewcGUJzcMTLln
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Yoann,<br>
      <br>
      This is for wrynose.<br>
      <br>
      Pritam, next time use the --subject-prefix option as shown:<br>
      <br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/README.OE-Core.md?h=wrynose#n29">https://git.openembedded.org/openembedded-core/tree/README.OE-Core.md?h=wrynose#n29</a></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-06-29 01:02, Pritam Srichandan
      Sahoo wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com">
      <pre wrap="" class="moz-quote-pre">Backport upstream fixes for DTLS handshake fragment reassembly
vulnerability (CVE-2026-33846).

Includes:
- 4f94e5cfe1f2: add basic DTLS fragment reassembly test
- 9deffca528c2: shorten merge_handshake_packet using recv_buf
- 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
- cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
- bb427ff74dba: add fragmented ClientHello test coverage
- 092c65d004e2: match DTLS datagrams by handshake sequence number
- a2b41be83a1a: add test for mismatched message_seq handling (#1839)

These commits are included in gnutls 3.8.13 and are backported by
both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
(gnutls-3.8.10-4.el10) using identical commit selection.

Signed-off-by: Pritam Srichandan Sahoo <a class="moz-txt-link-rfc2396E" href="mailto:PritamSrichandan.Sahoo@windriver.com">&lt;PritamSrichandan.Sahoo@windriver.com&gt;</a>&quot;
---
 .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 863 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
new file mode 100644
index 0000000000..5c85a531b3
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
@@ -0,0 +1,862 @@
+From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Fri, 20 Mar 2026 16:09:40 +0100
+Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTLS test
+
+Upstream-Status: Backport
+[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0daf43b9">https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0daf43b9</a>
+[2] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0">https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0</a>
+[3] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78">https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78</a>
+[4] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb058565d87">https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb058565d87</a>
+[5] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873f762743">https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873f762743</a>
+[6] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac49a09f78">https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac49a09f78</a>
+[7] <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a656550e">https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a656550e</a>
+
+CVE: CVE-2026-33846
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Signed-off-by: Pritam Srichandan Sahoo <a class="moz-txt-link-rfc2396E" href="mailto:PritamSrichandan.Sahoo@windriver.com">&lt;PritamSrichandan.Sahoo@windriver.com&gt;</a>
+---
+ tests/Makefile.am           |   7 +-
+ tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 214 insertions(+), 1 deletion(-)
+ create mode 100644 tests/mini-dtls-fragments.c
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index aeeaaf79d..586f1952d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -241,7 +241,8 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
+ 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
+ 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
+ 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
+-	 psk-importer privkey-derive dh-compute2 ecdh-compute2
++	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
++	 mini-dtls-fragments
+ 
+ ctests += tls-channel-binding
+ 
+@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+ 	-I$(top_srcdir)/gl	\
+ 	-I$(top_builddir)/gl
+ 
++mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
++	-I$(top_srcdir)/gl	\
++	-I$(top_builddir)/gl
++
+ if ENABLE_PKCS11
+ if !WINDOWS
+ ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+new file mode 100644
+index 000000000..ee75feeb6
+--- /dev/null
++++ b/tests/mini-dtls-fragments.c
+@@ -0,0 +1,208 @@
++/*
++ * Copyright (C) 2026 Red Hat, Inc.
++ *
++ * Author: Alexander Sosedkin
++ *
++ * This file is part of GnuTLS.
++ *
++ * GnuTLS is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 3 of the License, or
++ * (at your option) any later version.
++ *
++ * GnuTLS is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <a class="moz-txt-link-rfc2396E" href="https://www.gnu.org/licenses/">&lt;https://www.gnu.org/licenses/&gt;</a>
++ */
++
++#ifdef HAVE_CONFIG_H
++#include &quot;config.h&quot;
++#endif
++
++#include &lt;stdio.h&gt;
++#include &lt;stdlib.h&gt;
++
++#if defined(_WIN32)
++
++int main(void)
++{
++	exit(77);
++}
++
++#else
++
++#include &lt;assert.h&gt;
++#include &lt;errno.h&gt;
++#include &lt;stdbool.h&gt;
++#include &lt;stdint.h&gt;
++#include &lt;string.h&gt;
++#include &lt;gnutls/gnutls.h&gt;
++#include &lt;gnutls/dtls.h&gt;
++#include &quot;cert-common.h&quot;
++#include &quot;utils.h&quot;
++
++#include &quot;attribute.h&quot;
++
++static void server_log_func(int level, const char *str)
++{
++	fprintf(stderr, &quot;server|&lt;%d&gt;| %s&quot;, level, str);
++}
++
++static void client_log_func(int level, const char *str)
++{
++	fprintf(stderr, &quot;client|&lt;%d&gt;| %s&quot;, level, str);
++}
++
++#define QUEUE_SIZE 1024
++#define PACKET_SIZE 2048
++
++typedef struct {
++	uint8_t buf[PACKET_SIZE];
++	size_t len;
++} packet_t;
++typedef struct {
++	packet_t packets[QUEUE_SIZE];
++	size_t head;
++	size_t tail;
++} queue_t;
++
++static queue_t c2s, s2c;
++
++static int queue_put(queue_t *q, const void *buf, size_t len)
++{
++	assert(len &lt;= PACKET_SIZE);
++	memcpy(q-&gt;packets[q-&gt;tail].buf, buf, len);
++	q-&gt;packets[q-&gt;tail].len = len;
++	q-&gt;tail++;
++	q-&gt;tail %= QUEUE_SIZE;
++	assert(q-&gt;tail != q-&gt;head);
++	return len;
++}
++
++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, size_t len)
++{
++	if (q-&gt;head == q-&gt;tail) {
++		gnutls_transport_set_errno(s, EAGAIN);
++		return -1;
++	}
++	size_t n = q-&gt;packets[q-&gt;head].len;
++	memcpy(buf, q-&gt;packets[q-&gt;head].buf, n);
++	q-&gt;head++;
++	q-&gt;head %= QUEUE_SIZE;
++	return n;
++}
++
++static void queue_reset(queue_t *q)
++{
++	q-&gt;head = q-&gt;tail = 0;
++}
++
++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
++{
++	return 1;
++}
++
++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
++{
++	return queue_get(&amp;c2s, (gnutls_session_t)tr, b, l);
++}
++
++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
++{
++	return queue_get(&amp;s2c, (gnutls_session_t)tr, b, l);
++}
++
++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, size_t l)
++{
++	return queue_put(&amp;s2c, b, l);
++}
++
++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
++				  size_t l)
++{
++	return queue_put(&amp;c2s, b, l);
++}
++
++static void test(gnutls_push_func client_push)
++{
++	gnutls_session_t client, server;
++	gnutls_certificate_credentials_t ccred, scred;
++	int cr = 0, sr = 0;
++	bool cdone = false, sdone = false;
++
++	if (debug)
++		gnutls_global_set_log_level(4711);
++
++	gnutls_certificate_allocate_credentials(&amp;scred);
++	gnutls_certificate_set_x509_key_mem(scred, &amp;server_cert, &amp;server_key,
++					    GNUTLS_X509_FMT_PEM);
++	gnutls_certificate_allocate_credentials(&amp;ccred);
++
++	gnutls_init(&amp;server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
++	gnutls_init(&amp;client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
++
++	gnutls_priority_set_direct(server, &quot;NORMAL:-VERS-ALL:+VERS-DTLS1.2&quot;,
++				   NULL);
++	gnutls_priority_set_direct(client, &quot;NORMAL:-VERS-ALL:+VERS-DTLS1.2&quot;,
++				   NULL);
++
++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
++	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
++
++	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
++				 get_timeout());
++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
++				 get_timeout());
++
++	gnutls_transport_set_ptr(client, client);
++	gnutls_transport_set_push_function(client, client_push);
++	gnutls_transport_set_pull_function(client, client_pull);
++	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
++
++	gnutls_transport_set_ptr(server, server);
++	gnutls_transport_set_push_function(server, server_push);
++	gnutls_transport_set_pull_function(server, server_pull);
++	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
++
++	while (!cdone || !sdone) {
++		gnutls_global_set_log_function(client_log_func);
++		if (!cdone)
++			cr = gnutls_handshake(client);
++		if (!cr || gnutls_error_is_fatal(cr))
++			cdone = true;
++
++		gnutls_global_set_log_function(server_log_func);
++		if (!sdone)
++			sr = gnutls_handshake(server);
++		if (!sr || gnutls_error_is_fatal(sr))
++			sdone = true;
++	}
++
++	if (cr)
++		fail(&quot;client: %s\n&quot;, gnutls_strerror(cr));
++	if (sr)
++		fail(&quot;server: %s\n&quot;, gnutls_strerror(sr));
++
++	success(&quot;OK\n&quot;);
++
++	queue_reset(&amp;c2s);
++	queue_reset(&amp;s2c);
++
++	gnutls_deinit(client);
++	gnutls_deinit(server);
++	gnutls_certificate_free_credentials(ccred);
++	gnutls_certificate_free_credentials(scred);
++}
++
++void doit(void)
++{
++	global_init();
++	test(client_push_normal);
++	gnutls_global_deinit();
++}
++
++#endif /* _WIN32 */
+-- 
+2.54.0
+
+
+From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Fri, 17 Apr 2026 17:49:31 +0200
+Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using recv_buf
+
+I had vague concerns about thread-safety of this,
+but then this pattern already exists within the file.
+
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ lib/buffers.c | 52 +++++++++++++++++----------------------------------
+ 1 file changed, 17 insertions(+), 35 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..d54c77022 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 	int exists = 0, i, pos = 0;
+ 	int ret;
+ 
++	handshake_buffer_st *recv_buf =
++		session-&gt;internals.handshake_recv_buffer;
++
+ 	for (i = 0; i &lt; session-&gt;internals.handshake_recv_buffer_size; i++) {
+-		if (session-&gt;internals.handshake_recv_buffer[i].htype ==
+-		    hsk-&gt;htype) {
++		if (recv_buf[i].htype == hsk-&gt;htype) {
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_write_uint24(0, &amp;hsk-&gt;header[6]);
+ 		_gnutls_write_uint24(hsk-&gt;length, &amp;hsk-&gt;header[9]);
+ 
+-		_gnutls_handshake_buffer_move(
+-			&amp;session-&gt;internals.handshake_recv_buffer[pos], hsk);
++		_gnutls_handshake_buffer_move(&amp;recv_buf[pos], hsk);
+ 
+ 	} else {
+-		if (hsk-&gt;start_offset &lt;
+-			    session-&gt;internals.handshake_recv_buffer[pos]
+-				    .start_offset &amp;&amp;
+-		    hsk-&gt;end_offset + 1 &gt;=
+-			    session-&gt;internals.handshake_recv_buffer[pos]
+-				    .start_offset) {
+-			memcpy(&amp;session-&gt;internals.handshake_recv_buffer[pos]
+-					.data.data[hsk-&gt;start_offset],
++		if (hsk-&gt;start_offset &lt; recv_buf[pos].start_offset &amp;&amp;
++		    hsk-&gt;end_offset + 1 &gt;= recv_buf[pos].start_offset) {
++			memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],
+ 			       hsk-&gt;data.data, hsk-&gt;data.length);
+-			session-&gt;internals.handshake_recv_buffer[pos]
+-				.start_offset = hsk-&gt;start_offset;
+-			session-&gt;internals.handshake_recv_buffer[pos]
+-				.end_offset = MIN(
+-				hsk-&gt;end_offset,
+-				session-&gt;internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk-&gt;end_offset &gt;
+-				   session-&gt;internals.handshake_recv_buffer[pos]
+-					   .end_offset &amp;&amp;
+-			   hsk-&gt;start_offset &lt;=
+-				   session-&gt;internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
+-			memcpy(&amp;session-&gt;internals.handshake_recv_buffer[pos]
+-					.data.data[hsk-&gt;start_offset],
++			recv_buf[pos].start_offset = hsk-&gt;start_offset;
++			recv_buf[pos].end_offset =
++				MIN(hsk-&gt;end_offset, recv_buf[pos].end_offset);
++		} else if (hsk-&gt;end_offset &gt; recv_buf[pos].end_offset &amp;&amp;
++			   hsk-&gt;start_offset &lt;= recv_buf[pos].end_offset + 1) {
++			memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],
+ 			       hsk-&gt;data.data, hsk-&gt;data.length);
+ 
+-			session-&gt;internals.handshake_recv_buffer[pos]
+-				.end_offset = hsk-&gt;end_offset;
+-			session-&gt;internals.handshake_recv_buffer[pos]
+-				.start_offset = MIN(
+-				hsk-&gt;start_offset,
+-				session-&gt;internals.handshake_recv_buffer[pos]
+-					.start_offset);
++			recv_buf[pos].end_offset = hsk-&gt;end_offset;
++			recv_buf[pos].start_offset = MIN(
++				hsk-&gt;start_offset, recv_buf[pos].start_offset);
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+-- 
+2.54.0
+
+
+From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ lib/buffers.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index d54c77022..5d4d16276 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		_gnutls_handshake_buffer_move(&amp;recv_buf[pos], hsk);
+ 
+ 	} else {
++		if (hsk-&gt;length != recv_buf[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length &lt;= hsk-&gt;length &lt;= max_length */
++		if (hsk-&gt;length &lt; hsk-&gt;start_offset + hsk-&gt;data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk-&gt;length &gt; recv_buf[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++
+ 		if (hsk-&gt;start_offset &lt; recv_buf[pos].start_offset &amp;&amp;
+ 		    hsk-&gt;end_offset + 1 &gt;= recv_buf[pos].start_offset) {
+ 			memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],
+-- 
+2.54.0
+
+
+From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Wed, 1 Apr 2026 19:51:45 +0200
+Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 reproducer
+
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 120 insertions(+)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index ee75feeb6..8d5a18acd 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
+ 	return 1;
+ }
+ 
++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms)
++{
++	return c2s.head != c2s.tail ? 1 : 0;
++}
++
+ static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
+ {
+ 	return queue_get(&amp;c2s, (gnutls_session_t)tr, b, l);
+@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
+ 	gnutls_certificate_free_credentials(scred);
+ }
+ 
++static void test_malicious1816(void)
++{
++	/* dgram1: msg_len=50, frag_offset=25, frag_len=25 */
++	static const uint8_t dgram1_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
++		0x00, 0x25, /* record_length: 37 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x00, 0x32, /* msg_length: 50 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x19, /* frag_offset: 25 */
++		0x00, 0x00, 0x19, /* frag_length: 25 */
++	};
++	/* dgram2: msg_len=3000, frag_offset=0, frag_len=48 */
++	static const uint8_t dgram2_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
++		0x00, 0x3c, /* record_length: 60 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x00, /* frag_offset: 0 */
++		0x00, 0x00, 0x30, /* frag_length: 48 */
++	};
++	/* dgram3: msg_len=3000, frag_offset=40, frag_len=1475 */
++	static const uint8_t dgram3_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
++		0x05, 0xcf, /* record_length: 1487 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x00, 0x28, /* frag_offset: 40 */
++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
++	};
++	/* dgram4: msg_len=3000, frag_offset=1500, frag_len=1475 */
++	static const uint8_t dgram4_hdr[] = {
++		0x16, /* type: handshake */
++		0xfe, 0xfd, /* version: DTLS 1.2 */
++		0x00, 0x00, /* epoch: 0 */
++		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
++		0x05, 0xcf, /* record_length: 1487 */
++		0x01, /* msg_type: ClientHello */
++		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
++		0x00, 0x00, /* msg_seq: 0 */
++		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
++		0x00, 0x05, 0xc3, /* frag_length: 1475 */
++	};
++	gnutls_session_t server;
++	gnutls_certificate_credentials_t scred;
++	uint8_t dgram[1500];
++	int sr;
++
++	if (debug)
++		gnutls_global_set_log_level(4711);
++
++	gnutls_certificate_allocate_credentials(&amp;scred);
++	gnutls_certificate_set_x509_key_mem(scred, &amp;server_cert, &amp;server_key,
++					    GNUTLS_X509_FMT_PEM);
++
++	gnutls_init(&amp;server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
++	gnutls_priority_set_direct(server, &quot;NORMAL:+VERS-DTLS1.2&quot;, NULL);
++	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
++
++	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
++				 get_timeout());
++
++	gnutls_transport_set_ptr(server, server);
++	gnutls_transport_set_push_function(server, server_push);
++	gnutls_transport_set_pull_function(server, server_pull);
++	gnutls_transport_set_pull_timeout_function(server,
++						   c2s_pull_timeout_once);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram1_hdr, 25);
++	queue_put(&amp;c2s, dgram, 25 + 25);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram2_hdr, 25);
++	queue_put(&amp;c2s, dgram, 25 + 48);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram3_hdr, 25);
++	queue_put(&amp;c2s, dgram, 25 + 1475);
++
++	memset(dgram, 0, sizeof(dgram));
++	memcpy(dgram, dgram4_hdr, 25);
++	queue_put(&amp;c2s, dgram, 25 + 1475);
++
++	gnutls_global_set_log_function(server_log_func);
++	do {
++		sr = gnutls_handshake(server); /* invalid write if vulnerable */
++	} while (c2s.head != c2s.tail &amp;&amp; !gnutls_error_is_fatal(sr));
++	if (sr != GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
++		fail(&quot;server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, &quot;
++		     &quot;got: %s\n&quot;,
++		     gnutls_strerror(sr));
++
++	success(&quot;OK\n&quot;);
++
++	queue_reset(&amp;c2s);
++	queue_reset(&amp;s2c);
++
++	gnutls_deinit(server);
++	gnutls_certificate_free_credentials(scred);
++}
++
+ void doit(void)
+ {
+ 	global_init();
+ 	test(client_push_normal);
++	success(&quot;malicious reassembly bug exploitation (#1816):\n&quot;);
++	test_malicious1816();
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.54.0
+
+
+From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Mon, 20 Apr 2026 16:08:11 +0200
+Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenting
+ ClientHello
+
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 107 insertions(+)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index 8d5a18acd..93490bac2 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
+ 	return queue_put(&amp;c2s, b, l);
+ }
+ 
++static void write_u16(uint8_t *p, uint16_t val)
++{
++	p[0] = val &gt;&gt; 8;
++	p[1] = val &amp; 0xff;
++}
++
++static void write_u24(uint8_t *p, uint32_t val)
++{
++	p[0] = (val &gt;&gt; 16) &amp; 0xff;
++	p[1] = (val &gt;&gt; 8) &amp; 0xff;
++	p[2] = val &amp; 0xff;
++}
++
++static void write_u48(uint8_t *p, uint64_t seq)
++{
++	int i;
++	for (i = 5; i &gt;= 0; i--) {
++		p[i] = seq &amp; 0xff;
++		seq &gt;&gt;= 8;
++	}
++}
++
++static uint64_t read_u48(const uint8_t *p)
++{
++	uint64_t seq = 0;
++	int i;
++	for (i = 5; i &gt;= 0; i--) {
++		seq &lt;&lt;= 8;
++		seq |= p[i];
++	}
++	return seq;
++}
++
+ static void test(gnutls_push_func client_push)
+ {
+ 	gnutls_session_t client, server;
+@@ -316,12 +349,86 @@ static void test_malicious1816(void)
+ 	gnutls_certificate_free_credentials(scred);
+ }
+ 
++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, size_t l,
++				    int delta_n)
++{
++	if (delta_n == 0 || l &lt; 13 || data[3] != 0 || data[4] != 0)
++		return queue_put(&amp;c2s, data, l);
++
++	uint8_t *p = malloc(l);
++	assert(p);
++	memcpy(p, data, l);
++	write_u48(p + 5, read_u48(p + 5) + delta_n);
++	ssize_t ret = queue_put(q, p, l);
++	free(p);
++	return ret;
++}
++
++static void split_client_hello(const uint8_t *data, size_t len, uint8_t **frag1,
++			       size_t *frag1_len, uint8_t **frag2,
++			       size_t *frag2_len)
++{
++	size_t body_size = len - 25;
++	*frag1_len = 13 + 12 + 1;
++	*frag2_len = 13 + 12 + (body_size - 1);
++
++	*frag1 = malloc(13 + 12 + 1);
++	assert(*frag1);
++	*frag2 = malloc(13 + 12 + body_size - 1);
++	assert(*frag2);
++
++	/* first fragment: record header + handshake header + first body byte */
++	memcpy(*frag1, data, 13); /* record header */
++	write_u16(*frag1 + 11, 12 + 1); /* record length */
++	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
++	write_u24(*frag1 + 19, 0); /* fragment_offset = 0 */
++	write_u24(*frag1 + 22, 1); /* fragment_length = 1 */
++	(*frag1)[25] = data[25]; /* first body byte */
++
++	/* second fragment: record header + handshake header + remaining body */
++	memcpy(*frag2, data, 13); /* record header */
++	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
++	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number */
++	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
++	write_u24(*frag2 + 19, 1); /* fragment_offset = 1 */
++	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length */
++	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
++}
++
++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
++				       size_t l)
++{
++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
++
++	const uint8_t *data = (const uint8_t *)b;
++	uint8_t *frag1, *frag2;
++	size_t frag1_len, frag2_len;
++
++	/* Pass through anything that isn't an epoch0 ClientHello with body */
++	if (l &lt; 13 + 12 + 1 || /* too short for DTLS record header */
++	    data[0] != 22 || /* not a handshake record */
++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
++	    data[13] != 1) /* not ClientHello */
++		return queue_put_renumbered(&amp;c2s, b, l, seq_offset);
++
++	/* epoch0 Client Hello: special treatment of splitting into fragments */
++	split_client_hello(data, l, &amp;frag1, &amp;frag1_len, &amp;frag2, &amp;frag2_len);
++	queue_put(&amp;c2s, frag1, frag1_len);
++	queue_put(&amp;c2s, frag2, frag2_len);
++	free(frag1);
++	free(frag2);
++	seq_offset++;
++	return l;
++}
++
+ void doit(void)
+ {
+ 	global_init();
+ 	test(client_push_normal);
+ 	success(&quot;malicious reassembly bug exploitation (#1816):\n&quot;);
+ 	test_malicious1816();
++	success(&quot;split client hello smoke-test\n&quot;);
++	test(client_push_split_hello);
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.54.0
+
+
+From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Mon, 20 Apr 2026 16:32:02 +0200
+Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number
+
+DTLS handshake fragment reassembly previously matched incoming fragments
+by handshake type only, without checking the sequence number.
+This allowed fragments from different handshake messages
+to be merged into the same reassembly buffer.
+
+Now sequence number is accounted for during reassembly,
+ensuring fragments are only merged when they belong
+to the same handshake message.
+
+Reported-by: Zou Dikai
+Fixes: #1839
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ lib/buffers.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 5d4d16276..62f140ed3 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		session-&gt;internals.handshake_recv_buffer;
+ 
+ 	for (i = 0; i &lt; session-&gt;internals.handshake_recv_buffer_size; i++) {
+-		if (recv_buf[i].htype == hsk-&gt;htype) {
++		if (recv_buf[i].htype == hsk-&gt;htype &amp;&amp;
++		    recv_buf[i].sequence == hsk-&gt;sequence) {
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+-- 
+2.54.0
+
+
+From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+Date: Mon, 20 Apr 2026 16:36:08 +0200
+Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching message_seq
+
+Signed-off-by: Alexander Sosedkin <a class="moz-txt-link-rfc2396E" href="mailto:asosedkin@redhat.com">&lt;asosedkin@redhat.com&gt;</a>
+---
+ tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
+ 1 file changed, 47 insertions(+), 7 deletions(-)
+
+diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
+index 93490bac2..499a92a92 100644
+--- a/tests/mini-dtls-fragments.c
++++ b/tests/mini-dtls-fragments.c
+@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
+ 	return seq;
+ }
+ 
+-static void test(gnutls_push_func client_push)
++static void test(gnutls_push_func client_push, bool expect_success)
+ {
+ 	gnutls_session_t client, server;
+ 	gnutls_certificate_credentials_t ccred, scred;
+@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
+ 			sr = gnutls_handshake(server);
+ 		if (!sr || gnutls_error_is_fatal(sr))
+ 			sdone = true;
++
++		if (c2s.head == c2s.tail &amp;&amp; s2c.head == s2c.tail)
++			break; /* speed the test up */
+ 	}
+ 
+-	if (cr)
+-		fail(&quot;client: %s\n&quot;, gnutls_strerror(cr));
+-	if (sr)
+-		fail(&quot;server: %s\n&quot;, gnutls_strerror(sr));
++	if (expect_success) {
++		if (cr)
++			fail(&quot;client: %s\n&quot;, gnutls_strerror(cr));
++		if (sr)
++			fail(&quot;server: %s\n&quot;, gnutls_strerror(sr));
++
++	} else {
++		if (cr == 0 &amp;&amp; sr == 0)
++			fail(&quot;handshake unexpectedly succeeded: %s / %s\n&quot;,
++			     gnutls_strerror(cr), gnutls_strerror(sr));
++	}
+ 
+ 	success(&quot;OK\n&quot;);
+ 
+@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
+ 	return l;
+ }
+ 
++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t tr,
++					       const void *b, size_t l)
++{
++	/* gnutls wasn't matching on message_seq on merging, see #1839 */
++	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
++
++	const uint8_t *data = (const uint8_t *)b;
++	uint8_t *frag1, *frag2;
++	size_t frag1_len, frag2_len;
++
++	/* Pass through anything that isn't an epoch0 ClientHello with body */
++	if (l &lt; 13 + 12 + 1 || /* too short for DTLS record header */
++	    data[0] != 22 || /* not a handshake record */
++	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
++	    data[13] != 1) /* not ClientHello */
++		return queue_put_renumbered(&amp;c2s, b, l, seq_offset);
++
++	/* epoch0 Client Hello: special treatment of splitting into fragments */
++	split_client_hello(data, l, &amp;frag1, &amp;frag1_len, &amp;frag2, &amp;frag2_len);
++	queue_put(&amp;c2s, frag1, frag1_len);
++	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 */
++	queue_put(&amp;c2s, frag2, frag2_len);
++	free(frag1);
++	free(frag2);
++	seq_offset++;
++	return l;
++}
++
+ void doit(void)
+ {
+ 	global_init();
+-	test(client_push_normal);
++	test(client_push_normal, true);
+ 	success(&quot;malicious reassembly bug exploitation (#1816):\n&quot;);
+ 	test_malicious1816();
+ 	success(&quot;split client hello smoke-test\n&quot;);
+-	test(client_push_split_hello);
++	test(client_push_split_hello, true);
++	success(&quot;split client hello smoke-test and mangle sequence number\n&quot;);
++	test(client_push_split_hello_bad_seq, false);
+ 	gnutls_global_deinit();
+ }
+ 
+-- 
+2.54.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 8554ab943d..3ae7a2eb78 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -24,6 +24,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tarfile://run-ptest\file://Add-ptest-support.patch\file://c99.patch\+file://CVE-2026-33846.patch\">&quot;https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://c99.patch \
+           file://CVE-2026-33846.patch \
            &quot;</a>
 
 SRC_URI[sha256sum] = &quot;a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------OMcy6SNKz0rewcGUJzcMTLln--

