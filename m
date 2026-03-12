Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE81F105A59A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:11:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21108.1773321089729313840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R3T2RQRt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7531c189fc=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C6koPS1844649
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:11:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=KJuTzhy4G3KXkDx+BsjnUC
	OX3l4RQDJah+TyngIlNxQ=; b=R3T2RQRtHYRV5T3WgGq4z+yC0RbmtHEhIzdAtj
	9QJH+K8VQ/d5s/KOmV6zGHBxGOLdV/NC3JNXS9v+YAQNApXWbyumYPPRy8VQX0G+
	IW3yJpdmpp5YdLA/ML9xXEeEiCOX9IgryltkBn0v7hSdBuqfuhLGcECcePSh8WeN
	oVZsXhgbT5K/bFClWMOc+ZIVbZgKXtW2jm4yTGwB3DLE6yVgdx7qwcspUYagFF0M
	l88uM0QMACByaeRmU3z9vlJqvsiDXN5/mDjIcTebxQ8vC8ibI2gd5SyVPi3n0nSR
	h253tliAzNbAyIx3Psr2+QjM+b88mrSwn5aYscXYNaMgahJg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6prq8p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 06:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKB5joFGXsa7+4k0/NpbnY+vdWKaVR4d6mqm/vEwIZshVi1ARlGQgNDEr2CYi5MCtY3v2qE2kJF38bzrIAOBht0BhmlbRP4EQO+z+nMrWr3rjah5PFGw/Vnn9zNtwiAf3+FXbO1t3LfN8BiEAFqZRV6knKLi2tOxE3b25R9KLXsSB6CSOEXFUGQWkJVCK1C8i1i4aLewtL6MZHnMS1m5Mer6ju8yWFPc6C/c+FP5HM2vkSbTL7wDnVpcd6eZdVq1gpbIb8iuFBfIn4AacK0FZ+9a2ZaZbIiaMOzW90n8/IRlKckiG6Uds4qM+sJYX5HkvjDFr1pY15ScTcBj0N2Rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJuTzhy4G3KXkDx+BsjnUCOX3l4RQDJah+TyngIlNxQ=;
 b=MqRsqYVS7BiSfSC9ISR2+rhxToVrbbLpfbv+7e3dYVTFDuM7F9hzjHOK4YX+qhDQ7wnvdgrMEbA0pUD/X8dnafjfCRWCRjazN0qd72zPHVL1dN3YFUSKyPV2myQrXShYBCNJZmwdnR3txBufhpyfYma1FD7tRdwGdmeTqqHA4R58/ASnmNYeVxLg1qf2XCDwd4vj7plEm2nFWtVkgsZC0THF5C0F5F+1j0kyGsmA1F531D4AqHt+SQSilTl5oUaKzfgdDBwnHzbuG/jW8Zz6SpfCmYOp7uN5XBxw5m+QSRkCAYY1LS3tClP+kzOE2I2hpwxhbQGA2/q2jCS+4w2tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 13:11:26 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 13:11:26 +0000
Content-Type: multipart/alternative;
 boundary="------------tTjHmA0PlFY7YuDZF1pZJU6D"
Message-ID: <8a0c93d3-d8ce-4ee0-bb08-fbda7e5f1883@windriver.com>
Date: Thu, 12 Mar 2026 18:41:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Enable parallel-frontend-threads
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
 <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DS0PR11MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: d41318ff-53b7-4f62-f841-08de8038dd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|13003099007|8096899003|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Tmx5JKgo+2dlyiRFgokWCVd95uEgO4mQGn3ya5ZzY6HyK7M82yvFQqH8/X+wHUu9WsJKpTyAqd9KVrqdiKw7yLtK3kWxByXCK6RjruEmdv6XXIQ84R086ci0E3zSw5x8jU5EGeSiztABWaxaBNPatnamFDrQFg6/mYxXFWpmR3J7g8eOykTZYana5B/h6LsEWbnFt8azmRwOsypUsSwQ67k9FimZrfdKj7rFtlaJovG1TvVGjV7E5YgMt0gkvUKZcApYdGBGz1hoaBxlcwobgkr0SWr82bxPicpRbNdlg8sYD2IGwknCiLpwIBOOhaLuyjWqV0EwQbdrB9xE2vY9wsCRXMiEvNxniKJtu9JKbQiMaBj+dduPy2E08Y8cUuH8TnxVF/5bkTcudDB/vmsCx8tFTgGKyF7wfwAcBVb1lVSfQ22I5XfbWY2UfmRIugz/9It35r4P4dnqFKbhSppzoRG50mK5lQYikAmc8bOe6NSkpzXZZRkyIgCv880/nCGjbTipVIYJr+ksSuh33eRQzaWokQpbDGV4ewjaKVKoN2hzjBPpq/m7AXvtda2ciAIpVqeOCcNvZRJAG05dJollissSJxdmZ0q2enCGA8Uml4kFjYBkUfbENxUdQlOb0DuMCpcTdIFm3S0fj5pl85ntiVbmEbag9ZVfLehf6APaILMaKqBOppdRdC1qXD/N2UsVrSxvOlaUFwzK2V3qWgsFckTgRz25eJNdxkrdKaGOWOuyZrse1o1pfTvwdIiz1mW16xM2aKgm29WRQSxbGfAa3jjuZS4t74qNoKyYW4YrvNM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(13003099007)(8096899003)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3FpcFB5MlF1bzkvcUY2WFlSRHNmSzRQN0NTNkVsTHBSZFFpVVlvVGs2eWRX?=
 =?utf-8?B?Tm5pNkpWM0Q2Vk40RUNxNm9QT3B0dXZuZzV3NHVSTnFNZ0RSVVhBYVVqMk9v?=
 =?utf-8?B?VHo2K1AzczhoT0Irckl4bTBsMUxrN0xVWVhWSTRLK2pFSmU0VnhGTlRjczdt?=
 =?utf-8?B?b0NKNlh0YXp5UnAzSXVBMlNDbXZRMVFnaHFyS1U1bVNWRndJMlVXWWVkSWRB?=
 =?utf-8?B?ZENLcmtUd0trcVMvYmVSUEtmQUkxa09HdlZBakNRNmZsL2djdHZBM3hIMHBk?=
 =?utf-8?B?RVA3dDhCUisvaFV1Qk4zMHFwOEY2MVlVTENiakE1SDdEUzE4WjFLMUZmTnBS?=
 =?utf-8?B?UU0rRFQ2ZDhsMlpTRUU1cmNLVjQ0YUR2QlZsQlUySVNZZFBSQ0ovczRYczQ0?=
 =?utf-8?B?d1pCY0p2bkI0eGFvQVQxSFhuVllEYitVWHhrR0d0OGVRZlVVbEFjM05GZk1k?=
 =?utf-8?B?bkZYL3lpV0xCclhZdGNkZThsR1lyMlVsbUEwWWNrdHVEbnRiMTBCYVZrTVF0?=
 =?utf-8?B?QVhqZmlZZUllM0hRWDRzZWZHNDhjbXZhMFdZbUVCcjNrcHQ4dHU0ZEo3ZGRF?=
 =?utf-8?B?Z3FzZTI4aEFqWGZoc1NQZ3U0dlhIeDJkdExTVHVFaTY3cWdxUXRrQWVsQ3cw?=
 =?utf-8?B?MzNMY1dDWTVtVkx4aVJ1UkczTkZQMnZBZlBCMEI3TWp0cEhmdTlNSTVCQXJz?=
 =?utf-8?B?STF5eEtram4vcG5vRHU0bFJSU3hlZVFrUEFHcEgvZ0JlVkoxTWJ6THZlWFBs?=
 =?utf-8?B?TWRVZnQ1dVBHSmJoanhhZnFWbHdRMlR0cUdtb21CN09nNkhzZzgvVUpNbmlz?=
 =?utf-8?B?SDFRSFBDbTJuWWh5V2FjazluNWdpd0lzSS9CVVhjWTNYcUtSTmF3bWVENXU3?=
 =?utf-8?B?MUg2ZlRoZ1hrTU11VmVmanBpNzgzMStOUE9CWXVXcS9GV3JxbkIwY1F1MmZD?=
 =?utf-8?B?aXpVekVtZncrTjdhdzV1cVJtN01nSGswUnlTM0h0V0tnTWVwNjhUVFRmZjNk?=
 =?utf-8?B?R29aRjlTczlIdlZrYnhIL0VPdGdZblN4T0oxT0xHMUJaYjZDN2E2NkRmeGFz?=
 =?utf-8?B?T3VLOVYxaTNIa2M3STJXUVhyL3JjQ2tIU2VZMzFpNnNjelZ2MHVaMlZkRG5N?=
 =?utf-8?B?djNOR3NVRXB0UEdjZHhTOUZLUFBJN2Mwd3ZLQitVVURFamFWZUJmdGFtUkpa?=
 =?utf-8?B?YjFCK25xVGxLb0pXYTk0aitCekJRV1NNSGswSWFMRStqazBnLzVqandTSlFn?=
 =?utf-8?B?OXBOV2d5UW5IRmdVQTgweDA4dENxeDd0MEV6VkVod0VHcWp6VUMrN3lSVFRU?=
 =?utf-8?B?YlFaZGVCUkZaSGFxV0VUU1dOTEZ4Q0lBWHc1SzlQa0lSM3pSU1NoblVLbTd2?=
 =?utf-8?B?b3RTN0cvdlV4cEtxcmFyenJlQ0xjTW5Ra0Vja0xVZ2ZWbHpvVXJvNlJUeTdw?=
 =?utf-8?B?Q1R3NmdjR1M0T3NOTVdFU0pjZENHZGpmRUsrQU54SktSblppclVPQ25zekI4?=
 =?utf-8?B?M2JZRllxVWpTOUJOZEVCU1M4Q3paNEthWlZZMXdLcGQzbEt3YmpUUUhJL2VH?=
 =?utf-8?B?SUNQS05qcFBhKzV3cExMVVRpRHBOajVqYVoxK3JqUzVCRGFzSDNSR2VjeW85?=
 =?utf-8?B?UmJXbGlUcVlwdFcwQlJKelY4R3hDRWlLQ1NIZjVoUzFEOE9yNW5aZXlaOVpy?=
 =?utf-8?B?eG1hK1ZrMUlDdHNFei9PSktWWUhtWGtpSkNiejlUdzlCY2M0M2FEZkZscXVq?=
 =?utf-8?B?T3BPZVlZNms1NWw0eUQxV3JJMUhJeUxTdnk2Y29qbUxTK1NZRXBORXdscm5S?=
 =?utf-8?B?TDNIVElEalMyUGtibUs2LzVJcFRRQU0xb1l4WEhCYTdrK05KR0t0c2tlKzh1?=
 =?utf-8?B?Q1kxUDNuSUlUOUZRMGVnZ3E4LzlRN01xK0RMMTM3bzlyeTFCS1o2ZUJlZWV5?=
 =?utf-8?B?SlEwblFNUXUxYVlvU3MrUzM0WXUvN0I2ZnZGWVRKT0ZHczJ6aGFVdmQ2Zll0?=
 =?utf-8?B?eDFIOE51R3lRbE1ZRnlVdzJFcTBOalVIQUFpT2Q5M2tkdzljb21nSkJ4dnFl?=
 =?utf-8?B?T2JsSVRaU2JtM3VFa1dQU3k5YnFZT2diWVZPejRBcHZnTzhCcW1sR3RmMFBv?=
 =?utf-8?B?d3daN3loSlZjL0Q5dlgrRjUzTDNlYmZyOXVjRExUWkN2SW0vRWdzQldNeURz?=
 =?utf-8?B?aVlZOGVpZ0VET2ZxTXVvWDQ5aVRYcXVGVlo2cVhqZi9KR2VxSTExUFNOMW5X?=
 =?utf-8?B?Rlo4RmdLOGpqTFF0UEw1QnZPZitSaFRZWmtOREM1ajIxaXBTUHhGLzlkZjY4?=
 =?utf-8?B?OUFJQmRtcXo4MDVVWmpPazNmT1MwZSt3cHFHdFErYXcvQmRwNHhucTlFaVdG?=
 =?utf-8?Q?QGLi0O89CKugTc5Y=3D?=
X-Exchange-RoutingPolicyChecked: 
	sKmnwegP2Cqr+wTaaLqtqKcSS/mtw5n6UKOg3a280sM0E+49ImSHHGAapSjgwWxIMp2uuI2noyjq+Z0gTEDRRUe0JS5/Qgaj980xObBNOr1QyVp+PWfbl0E8pnw2SLJEVoAYxQkObTPUMdJsbo/DsiXFWthSlVQ8fXvoEZ9mRRZuYWx2WdtH9LpTDOEPebjqU4CTOY7G/nRzXT+ezHrEOrrrqhNZmbhoAxkc+JMRdT9uNt4Amng3taiK2pggwE4r0A/ZoPVZTh04u0EZyQ1UNy5um8AL0WiUYsHmfw6NqPn+RTMeuTq8wBgq9ZyP9Cpfslq1OtSeMWBtN2qBMdS3ww==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41318ff-53b7-4f62-f841-08de8038dd71
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:11:26.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCB5n7JDRxZhUT9qPofRYiJHZT1ienh5lJufgL1ueNHmBvVecLrvz2GSH1cogY2TPw7u2F8jrP/bUhVqAGxUhx81OlSSJHnsjeIqJ9aqWVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b2bb81 cx=c_pps
 a=k0sZSnccHBAUCD1Alv6C+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=ei4SEBeUAAAA:8
 a=Q4-j1AaZAAAA:8 a=cxoKLFbAI8SR2asCqbcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=Btgz0Oe-78wiJlzm:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: LFg1ty36Xa51fT7naZaTNBOH_EUTwxuh
X-Proofpoint-GUID: Pl3JNLrDLs-QDEMVrB9LvS2d1FWH2k67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNSBTYWx0ZWRfXx5r9o5FdLdBB
 SznVn1SEtqfQFlWBp6c+ZsqyymhIibX0wHa412TZUiZ5de9AFeym6L8MvIiZNpeuZs1CVSBJZWe
 QH6jnxORaBcfV7J/5HQMhP1JFQR/wUNy9+jHhrTMoRYosGFRkGbG5Zh8uUmTnK51d8lpNbU3qYr
 EL/t6wa/qG2JHpkfuOnodUcp+U8dcKtqCqnYxtq4IZ4c16x3cIpJHvABVrOkfQsy4/pREtF5JpA
 93Enx+aOHfASXv3xK7k/tfF+N2LjDL1pDDPbjNuMTk/ZjwD0jOC0DZnEg56wG49MC5Yl/ZK8ipe
 IwY5IatoiNrE5EyDE/vxGuGPbF8crP/PUQvrQmbh+Gc0Hslhv6sXJjl/Z7BAl7IGldGTPHpSlsn
 YeeB8YbbGFjOExsoJMQIl8ukLkR2hJmQI8BRtrt/v3itY5yNmKmBz3u0IgalM6v6jay9F9orG3K
 4vUwF8C8ejeMfbYfHzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232950

--------------tTjHmA0PlFY7YuDZF1pZJU6D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62C6koPS1844649


On 12-Mar-26 14:32, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 12 Mar 2026 at 05:07, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>> Test Results:
>> A few tests ran by, with and without enabling this option.
>> - Avg. default build time (w/o this option) - 56m 50.104s
>> - Avg. build time with this option - 49m 17.224s
>> - Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)
>>
>> Tests were performed by setting thread count as 8 & 16 but no much dif=
ference is seen.
>> So, the parallel-frontend-threads =3D 8 is set.
> It would really help to provide specifics. What tests did you run, and
> how were the numbers obtained? How can these tests be reproduced? What
> CPU was used and how many cores it had?

I tested the rust build time with `time bitbake rust` (I wonder how I=20
missed this to put is commit msg)

Machine Info: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144 CPUs.

>
>> +    config.set("rust", "parallel-frontend-threads", "8")
> I'd suggest we don't hardcode a number, but rather set to oe.utils.cpu_=
count()
> (grep oe-core for examples).

I choose 8 here as there is no noticeable difference between 8/16. Also, =
the rust blog says (https://blog.rust-lang.org/2023/11/09/parallel-rustc/=
) -

/We recommend eight threads because this is the configuration we have=20
tested the most and it is known to give good results. Values lower than=20
eight will see smaller benefits, but are appropriate if your hardware=20
has fewer than eight cores. Values greater than eight will give=20
diminishing returns and may even give worse performance. /
Thanks,
Sundeep K

>
> Alex
--------------tTjHmA0PlFY7YuDZF1pZJU6D
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62C6koPS1844649

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12-Mar-26 14:32, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj_D=3D9z-ZjjP2D+RqVUAF2Kq=
0a8cd62dqE5doHzSYdPQnA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, 12 Mar 2026 at 05:07, Sundeep KOKKONDA via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sundeep.kokkonda=3Dwind=
river.com@lists.openembedded.org">&lt;sundeep.kokkonda=3Dwindriver.com@li=
sts.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Test Results:
A few tests ran by, with and without enabling this option.
- Avg. default build time (w/o this option) - 56m 50.104s
- Avg. build time with this option - 49m 17.224s
- Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)

Tests were performed by setting thread count as 8 &amp; 16 but no much di=
fference is seen.
So, the parallel-frontend-threads =3D 8 is set.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
It would really help to provide specifics. What tests did you run, and
how were the numbers obtained? How can these tests be reproduced? What
CPU was used and how many cores it had?</pre>
    </blockquote>
    <p>I tested the rust build time with `time bitbake rust` (I wonder
      how I missed this to put is commit msg)</p>
    <p>Machine Info: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144
      CPUs.</p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj_D=3D9z-ZjjP2D+RqVUAF2Kq=
0a8cd62dqE5doHzSYdPQnA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+    config.set(&quot;rust=
&quot;, &quot;parallel-frontend-threads&quot;, &quot;8&quot;)
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I'd suggest we don't hardcode a number, but rather set to oe.utils.cpu_co=
unt()
(grep oe-core for examples).</pre>
    </blockquote>
    <pre wrap=3D"" class=3D"moz-quote-pre">I choose 8 here as there is no=
 noticeable difference between 8/16. Also, the rust blog says (<a class=3D=
"moz-txt-link-freetext" href=3D"https://blog.rust-lang.org/2023/11/09/par=
allel-rustc/">https://blog.rust-lang.org/2023/11/09/parallel-rustc/</a>) =
-=20

<i>We recommend eight threads because this is the configuration we have t=
ested the most and it is known to give good results. Values lower than ei=
ght will see smaller benefits, but are appropriate if your hardware has f=
ewer than eight cores. Values greater than eight will give diminishing re=
turns and may even give worse performance.

</i>
Thanks,
Sundeep K</pre>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj_D=3D9z-ZjjP2D+RqVUAF2Kq=
0a8cd62dqE5doHzSYdPQnA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------tTjHmA0PlFY7YuDZF1pZJU6D--

