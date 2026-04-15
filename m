Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D12F9D0FF
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 02:14:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10137.1776219243701022038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 19:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TdqGePhJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8565aba85a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F1ETqL3895380
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 02:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tIR785fFgCXHwjyeu4ynB/9wryNE1jksrjxx4ill5zA=; b=TdqGePhJCnn/
	dHRvqMOxpeiLkxEzZ2wSxCo3RhoXP23zhTVOKtxLJzWnuJn/rJ1y4ViTBnR0n7qQ
	GL260FkBXHPoZnD6t9KMf/yEuC/qQ6LrHeyCIgZv3MVIg8sP8m74VTRlBJ8jpK8y
	2LI6uG6EYGUEyDMctYCFLnlKR3YFEXf6TI603WP4vAB421/kdoOpJZaw1sFeQO3a
	J3MvT6c0q1CWlYPdUUhjcMwa3JKc2Ppb6jUFoFRU5rP6hIby+46sCktyAJAvwdc3
	f++yyv41MFwKQKyyhnbEmB57VbToYQz68S+9hw07Iaxf8xkUATXOzkTRydlKYDk1
	E7Lij5jBMg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877hhaw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 02:14:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8VCSiE1kjvdY4xRbh0jygkEqQSWP7OkdnfcBv2AidzlWtjpl7BdFe7QRFY1OT2daCWJZP/BYIbm/qzm803q/1pbJK3EXNL/g0+tXJ3HHk7kBVR7MOyP8Tl6v4DGoloQkM+t8RytWDAz5VSV2ykLKQG8oV+t7HeOJMJD1SXDTT/XX/kKxhGw4SpfhKl/A3HW8/LyRYkQbsqTq/lk+Q7PfQKVUTZGOmf9SiRLU1C0GUpLaKnzNlaEJmyUmZmRvPLXl653uMIg9Oqr0MT+/CW66i/pougGVsPhloz2DH5U8etvG01K3rSJ7OJSWTJRvEgyAczohX10sPu0T+uzC7wcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIR785fFgCXHwjyeu4ynB/9wryNE1jksrjxx4ill5zA=;
 b=cEqMrfAU930C/t7zIXpT198YYqsxmvWr0O3Bmx51wM2f6RMprjZnLylXkdnBGHR4+7X3LuLaEU6wsPZOV2nn7yAxGF5r5HDTUqmc9k3lH6f1AaQdqqGepp1k4QaKLe1W7b1eb/vxq2n35mj+ZkNzZWY+RUee4kfu+K7Grd7MGeKic82KglCyeuOszdvgpuh0085BxkwipFSMcUkp3z+UpOig77LPWzmnnLVI3vv13qbUdwqEAksENoa2kGzLsYCBQSFnlS+q2t3lsygNJFN3it75jbOc42QLaR0/V2DyK/EwM37E1i3zW96shWFj8WIOXPKpo01e0/of6CIVOXGaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 02:13:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 02:13:59 +0000
Message-ID: <bf4a9ad2-8764-45d3-b356-04f329c22d28@windriver.com>
Date: Wed, 15 Apr 2026 10:13:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
 <20260414032831.1323996-1-changqing.li@windriver.com>
 <DB5PR02MB1021391A80E4D9F14D29DEA84EF252@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB1021391A80E4D9F14D29DEA84EF252@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb69723-4549-476c-c0c4-08de9a94a750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JG/9rtNPqXE2IkOsoOtj1cRQSFSh0peiAkRUCMJ8wlnaWejQdlkWtfBeATQp6n9RnKmrEtbB4/lsAj+GjZyX2dpk4dm4cAjdPBee6mp2uNWnvB3qVvnIHlBrQLDU9CdFbHIbuTXcsHvEgWwIaDzhE2mUa9LvKeoZc97UB7Sh1jf0iIyTAiFr+h0wh6yYE4SQr2f42PngvtFMwaiSEZLRWFfMK7atxuaFC+loe5ddIc5NEWR2hYdQNgc8xPOBZC0r0KF4rLOLkXzsMqW6CT8Cv5y2AbeOu7H2ERq79fqA5m9D4pkOHGAQADu6DL9A6ALsEr9U02JyTJDajtUlZIOouOjmbsZsKoeuREpaoCfkZQheJDvnjPdha8XsSdMySx+K2K9FsrI6erP8dQc6Xzm/AcVWHp+eXfXR1L7vfr6S1bGLXEz9gfAM9zBuF2XLkdcgBFYa446tynbkDB8AtvT8vjzcKA7FxseYiUoADQsTTSnbLFhwSvgEdz3euSL6QpYHdhRT+N4K3KtcfnpOVlYD2Rl1uou5lF7jslrAjW0S56ur8U5AoETHLELeH1ulhQyLiALAT6SsR/I1mfKdA5g14gi8HHltlLkwLm7hULuP2UYYSJPEE9CHOczVrnsu2LOBrvcmSy9IPbjq+g9sF37jBZ0U5hY1u1IgYdjgRgBjgsnzMeBmGveIFx0RnMjFbw82EqacBbzHWcN9FQKPdAtl0vqWll+KZRKER4SfykGAPkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnVhdWlTcXZaSXg0NFVUU1hoV0RmZjVPcHFMUEhPTHdacGJNenZHcnFIQVp5?=
 =?utf-8?B?T2JUbGVvRHJadVMzY29YUzNyNWRNQnZzbEJaQnVRY0JpejZuUlZCWU1OTDRR?=
 =?utf-8?B?RCtUd1g3d3VxL201L3Nwbm5uWFpsSldUL3J6Zllxc1g2Qmh6eGg1eWREa2Jq?=
 =?utf-8?B?OWtxVHR0aWF1dklLcERqSVBJK2xLTW5oWDA4VHhtQXViSm10QlhtVmJUQ21i?=
 =?utf-8?B?UTI5R0lRR2U5TWxPcWVBdTRJdm0rZ3lXTk9IV0lmcWpDVVJrWDVOVGFWRW1t?=
 =?utf-8?B?c1h0OGlaamw4Uzk4V1VXcUY5TDVmUUNKYTNSL0RhcVhiUnljOWtReUc0RnJt?=
 =?utf-8?B?NjErWUNhUlBVRVdZaWNFd0J0S29pTWN4T005NldFelNTS2ZYNzFmK2QzNUVC?=
 =?utf-8?B?bDNMUGEwVHl5dDh2Q3loTE1MRldkeFFMNlkyWEl4QWI4Wk9GZHUxWFgwbTRm?=
 =?utf-8?B?VjIvdDVKZkNnK0VDamxreU9yRGw4RVZUTU82dlJOK3U0N1RGSVAzUDZRTGR2?=
 =?utf-8?B?a29Fb282Y3BwbXhpYTJiT2xKREY3c3hzVDNrUythdFo2dzhtbGNMTVhSaUk0?=
 =?utf-8?B?Vncwd0JGVE1pdlZsYmRhUHFiblh3SVgyWVNBbHkyemNFbnZ2QXRIT0R4NURP?=
 =?utf-8?B?ODduVTRPMEwvdElZLy9HS0NCVTdOVG1oV0dlRitWNVBSNklrdEJBQmxwTDV1?=
 =?utf-8?B?U2I1ak5aUDFKSEEvT1RsWEhFTFQ5a1NpMlpLbnRteGJhYkNUWTk1VWJVVlNG?=
 =?utf-8?B?bURwWGw1SDh4TnJoU1pGMERia0lZQ2hud051Z3djVi9LNG84Q1BxMTg0dzcw?=
 =?utf-8?B?ZzczWHlxOFVwTkdvck1GTUc2bnZGR2RrK29nVldVYzhkNHY3TkZKRWZCOGhz?=
 =?utf-8?B?WkhsUFo0b1VDWEtab3p3NHN0MlF3ZmFaMVo1azBqck9PK0RPWEQzYVpsZGJ0?=
 =?utf-8?B?RmJGYWc5dXQxeGZWRE05c0w2UUdWOHdMdjNpUXRhNUtPemg3ZGlLQXMyVXJW?=
 =?utf-8?B?RERzWVY0RVNzWG9vT0RkWUQ2cVZDQms5MVJ6WEJxNnpBSERLNEVmR1N1S2Qx?=
 =?utf-8?B?WDFYY0FCY3MvMkFBTUlMdFN6ZUpIUFZMNDRXbmVYRWdocFpEUVJQbnhOcTJW?=
 =?utf-8?B?VVpzR21NZjAxd2ZQYk5DWUh4RGhsaTM5a0pTQ0lwWVhocGg3eDlJOFdwUG80?=
 =?utf-8?B?Sm1aL0Jtb1B5ZkpMNUhGSkwvKzJnS1gwZ3REUUN1TlN6eWZvdXdQUDdLcEhs?=
 =?utf-8?B?V25Mbi9HQlBpM0J5OHZuZ2JLaDh2ZXlmSWpJRU0vRjdBU2RMZm01dTN4cm56?=
 =?utf-8?B?UktOQzZVQzFEZDU1NFVMNk14dnZUL3h5YUZXL2JEYkNDVisxczlUV0tHNTFx?=
 =?utf-8?B?L1JiandLcnl3cmhWMEEzRmJkaW9GZ3ZVOEFZSG5OVi9XTXppVWVVeDEyNjk0?=
 =?utf-8?B?VWZlWXdxSnFBWCs4QUhFdEFqTXhrWGlOZEhXTWJLc2c2QmU2KzkxNXVBRm5Y?=
 =?utf-8?B?c2s4UnI2RVozeHFGNXUzUGluN2FGVFdKcE1ZOW1rL2hVeGxoTmVtTzIwVHNP?=
 =?utf-8?B?VXFac2hjS2RFRkt2UWN0VGRjbzhzeWZTc2JZa0VESkdLVzZkeUdTOHFIajBx?=
 =?utf-8?B?VUFoTyt3U0xmeSs3ZHpIb1dqNUY2dUd1ck53dlpmQ2lLYlZPQ0ZhTFBjQmFS?=
 =?utf-8?B?eUpSYS90Y2pGRmlwRjJ4Q1h3bXlOOGc4QUZCVUxTMUFEaFlyOGx0cTN5S1dV?=
 =?utf-8?B?TUN0eG9neFZIdVh1VW1ZYUxnNlRzYWVCTU9yR1pFdGhoZEJ6VlBWaE1STnRi?=
 =?utf-8?B?MzBseWhjaTN3V3NrVUsyOVJnK2tobEFTVXFCeWhLbFg4di9JbkZhTThnSVBD?=
 =?utf-8?B?ZmNKT1VqQzZFOU5EVFNhL0tyaWIzTEQ1Y3pNOFZWaTNDYlAvMlpSU0Y0TG1Y?=
 =?utf-8?B?bXowbEZVTnRSSkZiZnRibVIzN1lUMEdla21hcTNzK2V0WGtITEdJNVB1WWxU?=
 =?utf-8?B?eWFqcTNTeWpGOVJyNzNiaDhGdHhMUkpqK0dvWnZPdnNxVFlxT3E4QTI3NHk5?=
 =?utf-8?B?VllESHVIZkIrV0J3ZGNrMzYrdDdzaGZGUWNQcStYQmFDWUliSGpjajJvbGMz?=
 =?utf-8?B?STIyTEFJS0JwU3p3UWp0WUd2N0daY0gvR2d6WnRVc0JCN1lnWHpQTENmREtj?=
 =?utf-8?B?VzZkZDJsRnlMcjlJTDgwVkMwVDZqMXhNVmpjQjA2ajhCU0o0bE90N2F2Tm9J?=
 =?utf-8?B?R29XZ0VwNVc1bWRwTmp6b0Z3TWV1N2JnSlFsQmMwRjJ1eE5rYUM5NVBRYjM5?=
 =?utf-8?B?aHZFTU5TMG04WHlJZHlaTm9YV1Jvbnp0L1RIUDZLcTBUMVZTelFUQUNCNEpP?=
 =?utf-8?Q?NKSbPPf8Y+ahUVD0=3D?=
X-Exchange-RoutingPolicyChecked: 
	g9XdXo+6alhjUgdqup7hlODwkDMONbJa33oJR2KvbXnpCBpfGgDOQtu/cOeHnaWa+2C55fO/nTpKgDYXRTmG5MAPOpCv7o7gb1anXyvY6xV6V47084wtJ6vDI/78qhONiltQMuax9BBaLly8Ts5MosKBUSj0EhP954T2VFFehfHeOm+DK2H7PIvhU/XHYpYTqYdgeyC/VHd3Tx/QKI//+s+OuJLfblEU13qeKufRosD4/fG8IDKOchLJTf9NpCG1QdzwuXrHvxfVV/ACwevGdfUuSCIb+Qq5MUQPxUMDatFJQYlJNDcnRcYuXXI7ytCc+t4DgX8QlCic7vxtp8pgRw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb69723-4549-476c-c0c4-08de9a94a750
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 02:13:58.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xY+3ZtEAKagAUwvpXKpeCxL0S+WmeHRTDt9sv7vrPQ3mT10XUu2WXZ2GrRy5/mNFiESgVSJtqUKGX+fCijba/yj1e9UMmnVD3kBcyiO2xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: HjLOZREbY1NNy11lQb5K09wNIpGuYmkZ
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69def46a cx=c_pps
 a=vzG6OqJaKuDO37FI3iuMvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3gr3IMSPEHInZEyokrMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XZn9HhRNBnnT9qGm-2zLnfecCuvnC1rL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAxOSBTYWx0ZWRfXwVWSCFaUIsDQ
 Ay/MSGeHyHZf9Pknc5y4NId0FJ5RGOj7FH7NoCTq90eQvfYg3Axk68p52IGvH5nFx/z0K1SC2OD
 7daz+pPWLorsgKWLS2A+OeXOVwHbA7FN//rOQD/QGHfnm58qN+spjVApJr0oBOThEXtrTU34yLL
 3v+D9SiRHsU6LiI3gvZMGsymLYroBjsqjImHTWAHfOYlfFpRJYwRnSS/RwmXJmeNxLWbmTXT0we
 zpvSeA3SR8N6nS59zMGKIeqrnAUCJaauZ2Z+qS2+8jRbtf7bFXBD/yDPz+sF1+a4TpOeg6KPD0U
 DV6NAl13h2GYZCW/kpYvj7e/4RrvuQBYHKRkL2O1yxghIl/jf7/MvxsM9FUPzUXSSmQMLgoNDLd
 fX1pkJ9Kq120/PS3XwzSp37ldSkKVuv3aYSHicVV/U9oCLIhdhwDQrzw7YqXuWhQa/3wzNrzKSH
 iUfo24djPJ752X0SKAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63F1ETqL3895380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 02:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235175


On 4/14/26 18:27, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
>> Sent: den 14 april 2026 05:29
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH V2] gstreamer1.0-plugins-bad: add ANY_OF_DIS=
TRO_FEATURES
>>
>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>> do_configure will failed with error:
>> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No =
Windowing system found. vulkansink will not work
>>
>> when vulkan is enabled in DISTRO_FEATURES, set ANY_OF_DISTRO_FEATURES =
to
>> x11 or wayland to skip building of gstreamer1.0-plugins-bad
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 +++=
+-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_=
1.28.2.bb
>> index cdf3a20dff..61a6d3dd2f 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.=
2.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.=
2.bb
>> @@ -19,7 +19,10 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
>>
>>   DEPENDS +=3D "gstreamer1.0-plugins-base"
>>
>> -inherit gobject-introspection
>> +inherit gobject-introspection features_check
>> +
>> +# When vulkan is enabled, at lease one of x11 or wayland is needed
> lease -> least

Thanks.=C2=A0 A V3 patch is send to fix this typo error.

//Changqing

>
>> +ANY_OF_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
vulkan', 'x11 wayland', '', d)}"
>>
>>   PACKAGECONFIG ??=3D " \
>>       ${GSTREAMER_ORC} \
>> --
>> 2.34.1
> //Peter
>

