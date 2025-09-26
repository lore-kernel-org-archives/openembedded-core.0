Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC7DCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:04:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12384.1758873840042173282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jlpFxWDI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364bc4f4b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5boOH1836918
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 01:03:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eBGJqcTMV3G5zb/4hZ9xjik4Y/QdqdNaDCWHeFe9jJU=; b=
	jlpFxWDI2miuthlrB8FflKEbfP+WMgKUH89CrAzKYKEfSBDaBB6MNNg1IXNhR3j4
	ppZHiUQDGPZvve9qLIJc8tQ+QyrMgCS7dKhLH28gBpF7rmtkr+zdfaSjF3czv8Bk
	NUrOaX9FmC6yMwnsLSBNLvYVr3BgsNeZFbNjhwQe1nb+ZsVHcw2Z3+QcI7mN53Zi
	sKiU7TAdimARArV7iBEI4o3QmlJu8arIEWFgXcDmSvcuUBobccFQ1u3JlQ5Pe4BY
	inU8C9y36DnW3FPPY9jbLBOzRTiezYZnVdatvylx5diiyAvJ1DelGEQ3fp04TvhR
	+HoOSzo+g42jVVxuAdc3sA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh0hve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 01:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP0NB+/19mrlVmON68VUiiYDxdnGoAwQiFVPF9WDQxIS+peRhN4FwZBsQ3rq2dxog38dIEFHAQTy/X+mzZJdzS9emRfFs7ibRUSclO+FPXNbX51TvD8Z+8Ow/j26vk+wg3xPfbCBC7Tn5XJBEUPCfJt19IMQmO6YVZCjl65qudXwu2g0Rs/Sy2qBCxNdgKjsjImWaQKWe7OqVgOhdPzX3gAliusQSQJEONCzCO8VEDBwfc+8DNEKgq3rI8EKQ2x3UP8NPv+fi+/p0k9so/6HndUfLyHeNUZARTvxX6c9zJcVCb85l2U63D8igZIyCtXcCLhvfMEQGlOwWhqYC700LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBGJqcTMV3G5zb/4hZ9xjik4Y/QdqdNaDCWHeFe9jJU=;
 b=ZRP+2MzAT0uMl3Efo7RQVq+H2SfeJG9NMQ3Jnh8qcdPUDJspnXIETU8oAFvmzIi/IY0Bpkd/oPrL38efBVFC8IyeaBI0PvcPImWu652vuRPVi8gugRn1t+Nb/rxTu/+yB74BYKN0S1nJzkgVJ/k4RBS8xW/GLfUL0f/Ct0iT+IiWemq2Ql7/hosp2lHMzQQsPRmngnfrQ7YhTH8fpE/82o5DtHOlYc38Wb+TS3uopVsKcval5t8H6bV9gYjdgs2SOHDasn/Y01WlFBKm4DyfjwoB4eC84rumhw9+5BqDHNmmDorYSs01cBELBCWOKDiUt64NB/7NBCNlfp6K8htmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 07:58:49 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 07:58:42 +0000
Message-ID: <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
Date: Fri, 26 Sep 2025 15:57:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::8) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 187c7432-dc4e-4104-fe99-08ddfcd282db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEt2QXNpWHZkOXBYdk9qREIxNFIyYmFIenppYlVOK1hScDY3aFlvQ2J4amQv?=
 =?utf-8?B?czYvRGY4SE5jNzd2WWtRRWJscnhjazUwLy8yUGc4VHlib0l1enptMjFWOGJh?=
 =?utf-8?B?MVJZSnZNc2FpTlRSOHFWbllQdnVrcjNlRWJNR1czR1EzQzNJOUNEVXNVR2U5?=
 =?utf-8?B?dDV2azhDL2FXcGdIdnR2UGZpU2Q5K0cybzNHcHVaOGlZMU03MWd3dkVPaXFv?=
 =?utf-8?B?NHdvU2x3TFlabklmSFRob1JIU1UrUlJLM0FacDdieEkrWGhhTFZTaUpTNnJk?=
 =?utf-8?B?Vmk0Mk5vTlMvM25nNm1ENG0zaXpsK3RwMWRvNUkrWjNHdk1VcjcyVGZDcmJS?=
 =?utf-8?B?Tnh3YUpQdlYxN3RwYi93bUMwL2NCVTVDdENYWjVhZm4rcVRDKytIVWRRbWQw?=
 =?utf-8?B?QnlKMHQ3VEVKdS9DVzE0SFNqZUN4clhWcXMraG1wM2xJTTcxQ2NxeERYSEZm?=
 =?utf-8?B?aEQxdHVyaFQzUkFteDhlMkxOeDVtRHYwTmdIdTBNVmJnUmlrNFM1UTlnZVhr?=
 =?utf-8?B?YzFoZHdMTWdRbGRaK1I1dXpTdUduVHhUNnVoYkc5ZWVZKytaN09tcVdlR3I0?=
 =?utf-8?B?bUNJTE1TY3BSZCt6cU91WUVWQkdseHZ3MVRUdWY4MG1zRnZsZTFiUDBUZWFp?=
 =?utf-8?B?WWp0SEc1L0VuZTZRUENPYmk2OWdEOFM4K1ZDK0J0Vk9YN3NVRExaVzlMaDVE?=
 =?utf-8?B?SkVKRjRWcWx1NU9kMkhDTDVyUTdtMG13alh6NFRwOWpTVjJQMUp3Q0RKWHFs?=
 =?utf-8?B?N0dGQkZFVHFNMm9ZUnJ4aTBDcjdaUnNQSXlTalpOeDdNTUtTeE5LeHZzVXhK?=
 =?utf-8?B?TEp3R2tVQm9vcHB2N01kdFNOM3AzMmM5d0VNbTdTUGJ3Q2pWSnNTeWIzYkZt?=
 =?utf-8?B?UnlrT2pLTW41L3cxVDh5OWdKNTlYNDJuSUhQaEd5STNCdnc1YWdGc21ELzh5?=
 =?utf-8?B?bE10VFJ1N21tQ00xeHBFMnp3TGptNjA1L1NlRkIycXB5ZlJ6Zy9UWHlWZHAx?=
 =?utf-8?B?K1l3M3AxdnY4ZUpxOTJxNlFEb1ZZTWFlRTh3aEdhekF0M2YveHZYV0hvbVlG?=
 =?utf-8?B?U0tRMEpOaHNKOU5mc0d4T2NyS29XblRLSGk2N0J6N0w0ZjNnYy9TdXp5TW1I?=
 =?utf-8?B?dGJ6czJ0aGIwRFJwaDdhcm4wcFZJTGYxbHZzQkU0eGYvS0tLeW9xUERTN1N1?=
 =?utf-8?B?eWdzV1ZSOG9FcG8vZVRJTVJGOE9PdDZCZTQ5M1NaOUZQQ2FEcUdqV1RKTVB4?=
 =?utf-8?B?eWFBT3RxclZST2I5QmtkeVdGaEdscndOK2FCMXRDSWxOVVlTRGNyMEw0dkky?=
 =?utf-8?B?OXZjdUIvalhDaC9iQUxGNUVLd0VPZlR4TGV3SVBvdWZDOFcwa1JDTDdWWU9u?=
 =?utf-8?B?RzU4bjVjYlNyNEQ3RDlqNUJzS3lZZlBaaDk1QVFGeXh4TGxyV29yZ2FGU3dP?=
 =?utf-8?B?MTBNK1pDbXp2cDUyQklqTkVsMEh4enFSbTJSV3g1T2x0aWUrR2REOEMrYmFn?=
 =?utf-8?B?REsyVjM5SE02SGhYQkRvNFJLem1nbXBrMlJOWk5kbUJvNE04Y0hNSm1HT0xR?=
 =?utf-8?B?UVBkWlFpRVNZRk9YY2JURlJRU3QzUGRkZEFiOTc4MDUzYjRKMEV0bzg0Z0hN?=
 =?utf-8?B?dWNHc2hyZ2dIOUUxK0tvZG9jZG1TbDQyUkNUSjZxTVN6dVRLOTlmTHM0cFJW?=
 =?utf-8?B?RisvVTFyYlhDWkRKRkh2WDJiRW1VdTdydFZlcmtzV3BkQmlFenk3MjlnRjRV?=
 =?utf-8?B?ZVF6aCt3eEUxdGF1ajRVUUh4djVhTWZHZUJVSEd2Q1BoUWlmaVNOMW1iMUs5?=
 =?utf-8?B?ak4zeGR5SEhFeEppQ3d2dGI1Rmpab1QybzI0b0pUakJHS01vS0hZTWRTcTdJ?=
 =?utf-8?B?V1VuZlhRUnRTVmJSS1FoZld4QXpyNXkyZVV5SGxuVVhBTC9YQVdCOGhpVW9r?=
 =?utf-8?Q?xJDE/j1KVjY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3BtYSsxWThFY2Vyd2NlejZmdkphWDYrQXBOTmtBQy9JdDNvMmIzVHdoNjg2?=
 =?utf-8?B?bU1sZnR4dU4rd3pkT1QwUnJWV2ZYbVN0ODJVSUFESUE4amZkOFlwamd3RzU4?=
 =?utf-8?B?RVBkVkJmSGNSNHdvL2lHdWc1K0I0U1ZhbHdWY0Y0U3RHbCtXQlAwQjd0ZnJK?=
 =?utf-8?B?bVVnOTU1bVYyay9MWTBKbENPWXNNNlJLRlFYZmtSVXU5TGZ0dHhyWFlUQWh6?=
 =?utf-8?B?UGJDWDNnT01idk93VVpKSUxLdDJQU3J0MyszL2MxMjg4c2ZubE8vcXNWZ25r?=
 =?utf-8?B?VDFsZUlWK2QzUTdtaVdSRHMrc3BSbnZzSytSemxyK0FicFcxbmh3NnlwQmJu?=
 =?utf-8?B?b3d5Ri8yTy80VjY2MVlsVGpkZTJtNDN5Rk5mRWNwdmpmalk3S2tGdlQzczlK?=
 =?utf-8?B?N25VZjNsNzN0dW55VzJGN3M5RUc3TS9SVVZJd3Q3b2tiNmJyUVk0YVpCeFli?=
 =?utf-8?B?b0FraWYzZTljb1NmMy9lRjk0SXlXTmVRVUQwOEd6ZUw4cG16anpLUjVpTHl4?=
 =?utf-8?B?WldNL0dnV2F1YTA1UHNXdUp4dEREbXRyK2Ird0Nwa04zTWxqc1JQK2VvUnIw?=
 =?utf-8?B?OGtIQ041U3RmalpOTkNmMHNVVzdpVjlUTnpUbU1YZkJuem9rYmhrZVk1NjJG?=
 =?utf-8?B?TFMzTjYwZU1Pc1lwcnh4V0xDN2NZTzVRMS9VdTZ3MEwzVVdhUGhmRmpERmNj?=
 =?utf-8?B?UVh0WGJlVkFCMFF3aGJoMWI3TXJhTmxyZktiTG1SbG5JUHZ4US9wSTd5VWdH?=
 =?utf-8?B?MTVvYUJoNXI2WEg5RG5XVmVXMVJXRndCUkppaWlkdWUxaDB2RFhxNUpqeFpM?=
 =?utf-8?B?RUs5QmJ5elE2WFdxSzQzS204RUJFeU53NUgrclRmQmdvVE14MFFVeXFnUGNp?=
 =?utf-8?B?amhteE1HS09aK2RaTlpDOVZicUJBSWpVMmZqd3dUQlZzWjVkaTdOQkdQZHNn?=
 =?utf-8?B?dTdKK0taNld4NHNyaUxiazJ5dkFrOWxGdzQ4MTNkclZlVkxaQ1V0eldhWGJK?=
 =?utf-8?B?L3gvYVhhOWdFNlRJRkpVWkYrSnVubWVYMW5GbFZWWk5DdjRjeWVLSUJsVGMz?=
 =?utf-8?B?eUswNTY3NnNCOUw3RVp3MER6UXNRRUtMVDUxYzVyVEgzTjhpek1WR1YxZWFP?=
 =?utf-8?B?YkRVaEp2bWtJTlhrcCtnQzZWM29Nd3h4OFV5Uit2WGpwNmcyaDhHbDd6WmRs?=
 =?utf-8?B?dmhNU0RpaldLWm5GMlRsTkJMdUozUnpkZ1lDaHFybTFpZm9rOG1za2h2eEdk?=
 =?utf-8?B?elIvRGI2VGt4UzZpblVTMnh2MHhmN0EwbjVzOHNaY1ZVVDkrNEI3cU9kbi9n?=
 =?utf-8?B?K3pCTGM4bEtDUVZKUDdNWHpxOUFpQlRzelJUMkEvekRmQ0NXNGh6Zis5d1Nn?=
 =?utf-8?B?T2trMlBIQ1NJZEVJekR6TXlIQUZHN2tWMStYNURaQVF4M0Q5cTlpY3JXVEND?=
 =?utf-8?B?bWVwSFNwSTNUVDdiWnBCOXhSVyswZFRxRGNyZmQxam5XQmh4blcwUFlhcFVm?=
 =?utf-8?B?Y2FQb285a2ZXVlhlQnZKdjVGSG80VmNWS01abm1kNFVoWmpvTkZBU21UdFlT?=
 =?utf-8?B?YlRTbkFTVFZiQmkxdEowdzRyMEx5STl5YlA3b3NNQmxtOHBERXZaMEZ2c1Fm?=
 =?utf-8?B?UXhiQzFHNjVlZE92elNqeHNlL2pGOUNZaUt4d0dMeGhjam92NEVhUlQ1Wkow?=
 =?utf-8?B?Rk5Ud1RFbHdwWFRhaXFRRnhZaFBYeE9mTWRZQmR0ek1BQ2JqNWZ6VjRKbmZZ?=
 =?utf-8?B?a003RTVYRllncFNKUms3Znl6YVk0VkplUFhrSWdCaHg3WWw0U085NmU3R3dF?=
 =?utf-8?B?c3YwamVhN0RkaEhhc3lIV041YXFrdlVxdEJzMTB1VFNEdUFNMjl3Rk5Vai9y?=
 =?utf-8?B?ZGMzVVo4YkxBaWJ0STJzT1RmNm5Rc1kvNjN2b2hwK0hwZ0RjWGx1TmNVTi9h?=
 =?utf-8?B?dEo5TW9qOEZoSGo4KzFRWHc1QVQydWx4SEJ5bXFEai9OZXc1Qzl1SDlDenZU?=
 =?utf-8?B?dVBzSEhTWlBDeUwzNEU4bzVWWFYvNGV5Z0RnUnZTSE1ydms0Tno2L1VneS9Y?=
 =?utf-8?B?NldLdWN4RU9hZ0FkUGhvZWd3LzRXOUEyN3E0Z3VGVi8ranh0dExuVnV5dW9o?=
 =?utf-8?B?V01zdzJyc2J2ZTZ2TXU3dFJLdkdiUjFVTEljelpwZHVuQ05OY01jNkVFdGdI?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c7432-dc4e-4104-fe99-08ddfcd282db
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:58:42.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC1g1rEvccgy85oyhaLwHbfjDBBWJ6HajgcQ8biRd0bnT8zzzosjbyXoWi8cn7b/DmIP76ktTI7ELWPsfkrWHZeh//50MiPFUhRlBVkioIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ebUwvrEH c=1 sm=1 tr=0 ts=68d648ef cx=c_pps
 a=I468VFW1STRMRX/li1H5LA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=DuQ8cl6XG9fBDmxgZVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YmQ_ZW38xaEy1JISbjveFiMY7fliU4u0
X-Proofpoint-GUID: 6GNL4UusJFsDrbijaXj2yzUXfJBBSIMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NCBTYWx0ZWRfXwcemSw/l4Sc4
 mELUaajoAx9ipu3Km8D+NCrxV5gnHdruz49aJimA2FGAqBSaCPRi9s4jBcsT3L+Wj0x7uKEN89N
 6x14KzjtjWYtlXl6w/DcdVS6NRNL4vqb7PdGjdNRkL58M0eI5ff6WybQ5+eitE9azOcRWErRRmc
 N+jFAVM3rgnz6i4mjiZ2blLgPm8XjvZh2OV0muU2rwAN/lOsrbAZQlhsT8gJ5y8vyvirdLIgK/1
 tz+og+O6Ni15hfAFGtRvk99DQO8blq33rR9HyXKXQv4MzWl7Y2MFdtlcAkQA4RVXMxaF3C8g26Q
 pynya/gggYjNKdxyCcjsDU256NzoAj6xPyXfxsZ69ypbCxW9Dvq2DkV5BvmzYR0ifeNKv1NJAr7
 ovvoEDmeuAeXmamD/UzfS2VckR+BoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q5boOH1836918
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224061


On 2025/9/26 15:43, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 26 Sept 2025 at 09:37, Yan, Haixiao (CN) via
> lists.openembedded.org
> <Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>> make[4]: *** No rule to make target
>> '/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recip=
e-sysroot-native/
>> usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include/stdarg.h'=
,
>> needed by 'zlib/adler32.o'.  Stop.
>>
>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> ---
>>   meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/me=
ta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
>> index 449a75ebf8ab..ea4bf6e6a88b 100644
>> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
>> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
>> @@ -107,6 +107,7 @@ do_compile:class-target() {
>>   }
>>
>>   do_install:class-target() {
>> +       oe_runmake firmware=3D"bios" clean
>>          oe_runmake firmware=3D"bios" install INSTALLROOT=3D"${D}"
> I'm not sure I understand what happens here. The issue seem to be that
> Makefile refers to a file that no longer exists in the sysroot. How
> would performing a 'make clean' address that issue?
Building syslinux normally works fine, but after upgrading GCC from=20
12.4.0 to 12.5.0, rebuilding syslinux results in a build failure.
Listing the object and dependency files under=20
syslinux/6.04-pre2-r1/syslinux-6.04-pre2/bios/com32/lib/zlib shows:

./=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 comp=
ress.o=C2=A0=C2=A0=C2=A0=C2=A0 deflate.o=C2=A0=C2=A0=C2=A0=C2=A0 inffast.=
o inftrees.o=C2=A0=C2=A0=C2=A0=C2=A0=20
uncompr.o
../=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .compress=
.o.d=C2=A0 .deflate.o.d=C2=A0 .inffast.o.d .inftrees.o.d=C2=A0=20
.uncompr.o.d
adler32.o=C2=A0=C2=A0=C2=A0=C2=A0 crc32.o=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 infback.o=C2=A0=C2=A0=C2=A0=C2=A0 inflate.o trees.o=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zutil.o
.adler32.o.d=C2=A0 .crc32.o.d=C2=A0=C2=A0=C2=A0=C2=A0 .infback.o.d=C2=A0 =
.inflate.o.d .trees.o.d=C2=A0=C2=A0=C2=A0=C2=A0=20
.zutil.o.d

The dependency file .adler32.o.d references an outdated header:
/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recipe-sy=
sroot-native/usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include=
/stdarg.h

Since stdarg.h cannot be found, the build fails.

Executing `make clean` deletes all existing .o and .d files from the OBJ=20
directories, ensuring that zlib is rebuilt from scratch and preventing=20
stale dependencies from causing build errors.

Thanks,

Haixiao

> Alex

