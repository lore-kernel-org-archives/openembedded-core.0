Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937BDE9B364
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:53:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157807.1772448786550942864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=guJkNfVn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226KBlL1556246
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 02:53:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MI1c1bnJOrwEUT8MPWaCoU6TFEX9lIt1L2NRnlDe/Eo=; b=
	guJkNfVnvdV/uzO/7V5205P2tXf5ja8fXkcgMihUahdQ4oodQGMwMnDKFM56q8kM
	qnFvhwWueQARogZlcbZ5bqoS9a1hEA4O/OJ4/tKhMUz4avTxZllu5v0/WRdKDgJs
	jffsJH9xmbIwFEbcT8T3HURiPW9+W1JsTtQmUhjOBx/lQD+IWpjc6i+GKHfrFgXa
	+hyuUMIW78IxQEwP2ReooqjSG+s7/mgbw6dtlrxjvn4wmelWcNBeNaEbUVu/0uUK
	f39F3c4MOoyjdoCRMYg/Y90jYNI+cbn/Lha2NmLqZAlC/N9nLt/t3tcMo9Hu4QYT
	2Y53rnJOY5q6bPUvN2vgig==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41vw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 02:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q13AmeYtHQ+vizsnV+7GTgU4xzY9xL6V3HlXHJy1dr4sp7iKYW7ph4zNikYfZ9TRyyFZF4lYHRGr4Dm/ZjuLJ2krIXvj8kdtKFR1LnmJmG47iR52BvC6o6yiqxAKmMoHXV3OvBK/5x8fGHhS9l69OdX3+qo3HxFwsQWrT5yUtdvlpTL7WeKlIEFYkPkON5Ze78moapUutxa5YIA948drnA/nOPO7Pr+4u48EJE6Vcvt4J1QtFExa9P2PAleR7f18LQluJ3Yi/6MJkD0SXJXRvbDQp2EqDqpH0ey8bkqwj5k/GrXCwQsccDgF6d2GgXO7n+kAr+3zbgf4aSh4+7u1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MI1c1bnJOrwEUT8MPWaCoU6TFEX9lIt1L2NRnlDe/Eo=;
 b=hMlNUOAC+2G0tp6cNsPoFpfIovJMKexbME/S/e7XGV/qllolQfI5+FNgHI2nqI8Ovjq92NS9AzK4ZoP6X6toMvy59wiLF6rmUMreM+QGb4FpquF5IIt99tXqEeMb4K1j6oEmeuwoLtHefFJ/3OP2wOEuCsKz7tTfomRJV2A/xlIl2+To5fvdQQWJpnZt6wpE58gDf78ttrg5gqwcS6mLTvWxiv1gGmhjQQiF9mhXwKoTBNdQhTL70xO7v+HmY8Vs4uVy/qW0ySdEzbUMHOTE2kX6+60dsLIZ2cDMMPgTVXP2nsMvtiBzq6NQCAGxr4ITpBoAOeozZ0Y+1EzWlcYSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:53:04 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:53:04 +0000
Message-ID: <6ce93caf-d418-49ca-b55d-087c3b6ec07d@windriver.com>
Date: Mon, 2 Mar 2026 16:22:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/4 V2] Oe-selftest for Clang, LLVM, LLD
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
 <DGS8JWNFLTW8.3E7NT6B8E8GNP@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DGS8JWNFLTW8.3E7NT6B8E8GNP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: LO4P123CA0163.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::6) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: e45b44ac-5366-454b-be18-08de7849e0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	ejoydHpjydV21ybYsrwxkrXbLrNsFWegYnFBB4pMGtU9sGU8cgMDlCengzUkRBTV8KaA51sl9TCh4Q7rmHWVnDmO8uGfiz/HS2Dwfix4gvBHaFoui5/1itrl6g8tyzgDgZdjZkxOJdDirgWJlSKzIohNPR2hLX7CfknIjwBqyxAngxTCiIPcFDvwO77vA0ruH2d5eI1h5n3XYd/DAdVrxVfdbjEeIAbUBjZCBnfcjB5EtGAIu4QFobtJWmorjuejIkK2YW4ql086KROGky+/2fC+xY7IhKIO7J4Cqe4fxyiv+TCslqaF3RRhNSUgq1/x48iVlEJk/+hABa3p15JnMeHRME+h+nUrr8pmgEd3+iNtDlJdzWZfZKjva7zsD8/cWpLYDvQJYHz83SKKozDwg8SBe+pM55tBfArLgjskEuRrfSSPDQRp/gIF//5NkpyxHwaiM4fO/NxBPr0GYo1luRqFRvjuArKd0IZbX2Tkosax6PpecMXI4k5jkYASA9Tg/5kfH0TJRYDEwABycZa1qBKEU6Ud78XOkFk66vY+67pv9Y7t1fbYsOJ+k3TAewId/WyG9Nqia0retKQZeExo93wwGb+qdBbhwGrxsieFZAWZ5DOn593+otPmdS+qppVouM3w1W9IVotxPSMcJyH7eakfdce1f41cyzyIW/tXcnk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0lXSGZHRzIrbngrc1NMdDI4aDhPTTlhZlhjc1dsT29BMmtRMmpWQ3lLNUZE?=
 =?utf-8?B?SmJCaFJVNFppbnBRZ0luNWxwY0NON0c1eDBldCtFTU9pNTY0TEM2QmxZcUxx?=
 =?utf-8?B?d0dLMWxGUjd4NThTNFlNMHk5MXVwMUtVbVMvL281b1VlNzZVVXlqeTZ4TU1L?=
 =?utf-8?B?aEw0eDdQeGJRRklKOXBjUXFCcER5QmEweDFYQkFranNRbEZHMWY3M2JqT205?=
 =?utf-8?B?eG1DTjVoTjhhVWxRdmVMYnMvUXBPWUlmRFBwNnpoMGhQaUNsWjB0UkZOZmhH?=
 =?utf-8?B?TThLUEliNXREK0wwUUJIOERnM0ZVSm9HSk93SUc4MWE0UmVVVkNXMkRHaS9p?=
 =?utf-8?B?bzdSM3VpL1JQN3Z5Mnp6UFNBNExJNjMybU5URXhDa0FUZ0o3cU5BV2diS0xT?=
 =?utf-8?B?VE9MWnJTS2F3YlJuakZIQ3FPbnhrQ3UvK1ozbXVwS0ZiaG9DK2xIV2FLVjNa?=
 =?utf-8?B?TW5DVThBZEJHRUd2dTlqamJLNEJhVVdXUVdnSDNIdk9mRHF6V0Jzc1hFRFlR?=
 =?utf-8?B?aXVzUnFQVGJNRHNiM3YvRWtLbDlGQys1WG1DWlJ0WjlTNWxUYU9qcTBZVlpN?=
 =?utf-8?B?TmhGK0V3SEk0U3h6RUE5cHRhbU5FVGJvWXQ4L0gwaDVYVGtHQ2NOVnFDYTRC?=
 =?utf-8?B?a2Y0bnYxYUY3ZlVmb2w4TDRZOHVjQlR1K1VkRXNrMGhiNUJDeW9BRWM5VC9I?=
 =?utf-8?B?MnZrc2tXaVVKM3B0TUlxVHBpeDFaeExpd09pSDlJaDRYVWRLN0xqMVFtb2Vr?=
 =?utf-8?B?RVpnWlVXN3U5cmhaZFpLVGJQR3RvSzJ5c1hNQTRSZWcrZXFLSzBvZ0VhLzNo?=
 =?utf-8?B?OTdCcGl5ditvQjRhNkNWQ0h0Smp3bjVWZHJiTEVYck5yZGpNQUp3RmMxT3RR?=
 =?utf-8?B?ZGJucUNLTUk2ZEc2eUZsVng5QmpvTitrMUh3akhVYk9RcU5JWDRTYVBMb0VU?=
 =?utf-8?B?VDZlQlRtYlkyeElHcm5EeHhCKzNCeFl0dFJGRFJWUU5FRzA3NzhucjZjZ2Mx?=
 =?utf-8?B?VWlETGk2TzZScms2T0Z6d3c2bUJVSGZDUjgySUc5bm1kUTg5cEpHd29QaWcx?=
 =?utf-8?B?SnFya3IwT0wwN0N0bkcwcTFyZ2h0eGpOTnI2UUptbXdleVFTdU0vKzk1QzlN?=
 =?utf-8?B?TzNOUmVEalFxV1licVZWZ0JFMW1iaEozVi8yTUF2eUFJdjJTNi9DMnNnRExP?=
 =?utf-8?B?M0JVZXh2RUZENGRsdFBrMmZ0R0xscTZpcXB6a2tjWHVIT25SSVNMU1hrclJO?=
 =?utf-8?B?eHdKREUwb09FbnhhWGI0TDBGQkptNWlLYnlEcVVPOGk5eTBmbmhWbVdmV2Fi?=
 =?utf-8?B?NFZJbEJNY2RGa3ZSWW9qaGVSbDRpL3dDdE9NRm9vWTlvWERneW9zYWlmZ0wz?=
 =?utf-8?B?aGt4TTdZZVdCaUczZjhZTmZ0WGhGTDhZaFJMZ1RoTVhnZTFVem11NjBreTY3?=
 =?utf-8?B?Um51ZlRpd3lkOWJyWGgvYWtWa1cxZkEyTjRLS3ZEMVd3bHpFVlFTMGg0WDJY?=
 =?utf-8?B?WDMwVW1DNkNSQldVcVRyN29hM3VjdEdTMEQwdWpWMzdvSENpb3J5a3doOVVQ?=
 =?utf-8?B?SkxwRWtFRGVRUVF1T1R2UUVYNCtFSDVtZlpYZGVlNXlMRW5oajV3dkcwSXVB?=
 =?utf-8?B?ZWswRkFTb1ovajBENjZpQ3JQcUU2UHk0MXJiR0diNHRiWHNqZ1Q3SDFyUEU2?=
 =?utf-8?B?V2RTc3BlbEJYT0xOcVFGVFJlY3plTTZYdlh6dm1aQk5LUkdwMW5Lbkl2ZDBH?=
 =?utf-8?B?QUk3V0VYdlNleGcyYWFMNy82Ty9LZnJyL0p5a3drUlI5SzRDT3BaWlkxVzY0?=
 =?utf-8?B?N0VrdXlVUFVvRzRhb3F5RksyU1ZwVHBBaWlZVytTVFB1SkhYeDAzV2hscGdV?=
 =?utf-8?B?dXpKNERZbGIvaFBscHZGdUF2cXd6RDhwQ0h5ZXpXazFJdWwvSi9YcFFaWjZq?=
 =?utf-8?B?MzY1T2J4TFVHUVJJUE45UjA3ZFFVQmUzcEZXeHZUbXc0aUlBVFNWazNUTVVo?=
 =?utf-8?B?cUVraUdmZWtxUXpuTk5tZm93L2dJWmRGQTZzd2I2dzJoT2lNNkFrVTVoZWY0?=
 =?utf-8?B?R0E4NDJtL1BNMFZaY0pLV3lrWDlmNzh0YnNHNGorQmRZd0hLZHpBNkRXcTA3?=
 =?utf-8?B?eWlMcmhqRlJIOXJVK0VXRFdQS2FiNGFubkdKYWxGWUhUZUdCQnNhbUdMbkth?=
 =?utf-8?B?LzFEMnlnVUN3REJhc0xlbWE3TkpTYiszSUUvdTFkemhxTW1wSEo4VENaMW95?=
 =?utf-8?B?NVNWdS8xYmR2a1N3WUY5MlMwLzI1UkpzcVExM3pybEQ3em5Nb0I4NGFic2hw?=
 =?utf-8?B?VTNIM0hyclVNcFkycGt4dExvYlRreDdpUDZkclEvQURuVUE3VHNhczZhZFhL?=
 =?utf-8?Q?vykvCAGSaLYL/6LPbylELMiQMWQnYRRvb65KV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45b44ac-5366-454b-be18-08de7849e0d9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:53:03.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtqr7wPFoVZIlXRBBbBaMYzSr44No8/iMtRxLDae1tcQ8oy6Vmgwy8MwP5Z6QloB53lGe6WNNJexd9k2p4i5Ou/KDYni/YyretS/EM7ZlvfgUCv0zJBhzP1krKDWPors
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: fpMa0U4bvX5V__jklEXbDdtZVLj6a0zM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MCBTYWx0ZWRfX5YjTiz0FRraU
 9hP4u/PbWa+Qw/t2Xoj/L61B/6yT3OGerXlxAF53uR/QXkuFpaY+WltpWubR6tZithhBQtcw1WO
 Fon/fNUhH70G1i7IVyierotOQJRTB/5umSOUfnGubA1deDpG+4pSgSvR3h676/QYdZEWzMQu0kN
 F7ZOlSbKaBPf+m15BbVulxfYvgynCcTKKjwCyLOeXrPFMMklxt07KyE7hM9aiSODKEzmfpc8bV4
 uvo7APinzx+gJn1EaFKA9eMQTtnocUA5zRT8Q7B2OEDpaQrByBAVcTtO07lDWIuLJ7zexWiXPoo
 xdnuqqBc95m7Vxs88hc++3m4o71JRi/jySgguVjG+eIyHyMUY7L6S5sVsCldGUNCSBTHffUFOdY
 ox6mHODw9LwiuZ71RZDujsSNag7LsE+ADfMcezW3L2PtZMOu4Id9Nq2EvuC3mHIbB7bK3Kf72WL
 ndH8WbjvSeJw8t9fd/A==
X-Proofpoint-GUID: 1YHFsQQZ9FntaesDYMsnEt2TdjexOwIH
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a56c11 cx=c_pps
 a=cN7CqoUBHbDFA2NMQtMNyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=ZixdHqEjsvqxdBuw3AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6226KBlL1556246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232195


On 02-03-2026 16:18, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon Mar 2, 2026 at 7:49 AM CET, Deepesh via lists.openembedded.org V=
aratharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This patch series introduces a test framework to run selftests for
>> target builds of Clang, LLVM, and LLD.
>>
>> v2 changes:
>> - Enable required CMake flags only when running the testsuite.
>> - Ensure default build time and package sizes remain unaffected.
>>
>> Summary of changes:
>> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>>            detect the llvm-bcanalyzer target.
>> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld test=
s
>>            when CLANG_ENABLE_TESTSUITE is set to "1".
>> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude l=
ist
>> -Patch 4: Fix rust build failure by replacing target llvm-config with =
native
>>
> Hi Deepesh,
>
> Thanks for the new version, but it looks like we now have some failing
> tests:
>
> 2026-03-02 09:52:32,943 - oe-selftest - INFO - clang.ClangSelfTestSyste=
mEmulated.test_clang (subunit.RemotedTestCase)
> 2026-03-02 09:52:32,943 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError: llvm-lit failed for Clang: llvm-lit: /srv/pokybuild/yoc=
to-worker/qemuarm-tc/build/build-st-3082983/tmp/work-shared/llvm-project-=
source-21.1.8-r1/sources/llvm-project-21.1.8.src/llvm/utils/lit/lit/llvm/=
subst.py:133: fatal: Did not find FileCheck in /srv/pokybuild/yocto-worke=
r/qemuarm-tc/build/build-st-3082983/tmp/work/cortexa15t2hf-neon-poky-linu=
x-gnueabi/clang/21.1.8/recipe-sysroot/usr/bin
> ...
> 2026-03-02 09:54:51,485 - oe-selftest - INFO - clang.LLVMSelfTestSystem=
Emulated.test_llvm (subunit.RemotedTestCase)
> 2026-03-02 09:54:51,485 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-02 09:55:49,997 - oe-selftest - INFO - clang.LLDSelfTestSystemE=
mulated.test_lld (subunit.RemotedTestCase)
> 2026-03-02 09:55:49,997 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3224
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3222
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1118
>
> Can you have a look at these?
Hi Mathieu,

Thanks for pointing this out. I=E2=80=99ve already sent a V3 of this patc=
h that=20
addresses this issue.

Regards,
Deepesh
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

