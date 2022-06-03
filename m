Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866DDCCA473
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:02:05 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.3498.1654290123826038298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 14:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=vIl7mSuW;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=3153a541b2=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 253DWLQr017594;
	Fri, 3 Jun 2022 16:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=dbBrKNc5nLsk6IP12DB5kmD8PACNxrB7gcCb/3NJStA=;
 b=vIl7mSuW3e9R8jPTWMXhQoioElcbvOFnXYlPFrm+k1BtHxrb/WAsEuHxjqx4vW/hLgZC
 tydeOhFLHzbqo+7WTjtHqq8dVmeFIDRqhjPZm82oklnM+PvfHxc3smCZKXe7X4TSHmUQ
 JQwSQi+o7dinKzDJDSgu1A0VO00TkSouH9kOx6eqDiKS/cddSEj3eGcWQiARCQCj93M5
 0XVS+pn9QWqkvZK1iNYDKaKIqNPp/VlupuJs0df/v6n36g4d6aQEIZZkQR8ZpZvjWJ9W
 ALpQjif7+jIZf5azyts0BGhWzqEmzCUGjToGf0WR28ZabFueYojgZNJRrkUwJrdEABZf EA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3gbh8t4mmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 16:02:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yl2ad9fHeb6Ivx96kBRxGNXdu3pnzmWHR7hTFuP+0+kY7GpK5hYhvU8skIRBfcwDsqD1cytIYOE8mUBVpMpE3jIBkr1jwbzKnIIGdPd0pk+blIajRqsIe0xFS2JtqTAWN3dDGvUCb/ns7gnd2PvBGw9NwyyjsuHJ5UZNWc6qOyiU+dk6zBvRZmtvhBqLGr6YW7ru3O5ZAWHiVqffyY12W7Oir3T6Axso7IOw0Gp4L6ZExp7FbBOIrMvY8IAkDqnfrv07LuwMfQVlqMVLMKzKt8Gnk3CLoZGrdf+uK4LJq/UE+bUpBAx5TvkMwVrgqZBfAjlCGnjtaLKk4rNAB3xehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbBrKNc5nLsk6IP12DB5kmD8PACNxrB7gcCb/3NJStA=;
 b=G2Hhtm6tHLebGOTMDZCb0lUO/YUJOdfHfFPG7QUzaN8lYzHUJ+vUZCG25mBCLtwdrcqEqD+fkXPgoEHxHB96yVDOhfJW1wiXDBCIM7qPRYU6nTTLbXsO7eMe700IfvX6disKJjDMyNqk2K6xL6KZ3TIY9Uo5O4N9p4SIhqksqPsLIOH6DpLl0e9ALVe+9rrFuw3ns2imPTk8MSv2VC7MbY5m7hjN8Ydg6xfBZ5aQAPNNEQPnOTS/p9SC8SIiyjiMvLCx6c2QlbwRKsjjgklEUysdJIwhhNEB8Z5t4eVUYEYwgyMBt8WoQBydKVo5pxgdopoEcG8eMYPIbKW/gDX6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbBrKNc5nLsk6IP12DB5kmD8PACNxrB7gcCb/3NJStA=;
 b=BVPmhwbn745rjPyyn6DisobXFRcAujha9jJmcMbKYVmFRwSBGLaXyPP1C8FMCOBHFebQKP0CC78W/ssf+8MAkqxdS3Uyh3/cPiHJ3Ut2gQA2v6PraYXDEQhiYI4xcR7VYX6UrEtWeviM43ZV8nJIIPiQ4nZf+zn7ozJLu9MDKoE=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN0PR04MB8015.namprd04.prod.outlook.com (2603:10b6:408:15a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 21:01:58 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a%5]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 21:01:58 +0000
Message-ID: <22787b9e-188b-32ed-006a-eb1a1153e80e@ni.com>
Date: Fri, 3 Jun 2022 16:01:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] opkg: upgrade to version 0.6.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220603200317.385216-1-alex.stewart@ni.com>
 <CAMKF1srVLKrQ4m2u_yfDRi2vuXcHKVfjt3cvj9mbiu82_8J8JQ@mail.gmail.com>
 <a1dc7d51-e3fd-c70a-6eda-683525dc8104@ni.com>
 <CAMKF1srrGUa_BE7Fp_KBGS8qsVnJCDnttKynqfRY6aW=9nYxnQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CAMKF1srrGUa_BE7Fp_KBGS8qsVnJCDnttKynqfRY6aW=9nYxnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::32) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f5a823-7a1c-4a4a-95f9-08da45a44c52
X-MS-TrafficTypeDiagnostic: BN0PR04MB8015:EE_
X-Microsoft-Antispam-PRVS: 
	<BN0PR04MB801586547DFB642AE3BCC420FEA19@BN0PR04MB8015.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oJXNyWEkR3VX5GLD5tdRJZeIpuR1RyRfzW5tS/avXEgb42fiZ77yxOp6m+O42y8XFIvnVszWyHYerIcERWjAPvdVeQ9Dus6gejiq3GsRo2BCsyOU7OR7oTXwlpCp4lUceVWchL1OqVQTfMYyL1EvZoGAuJ5zhg9a92prxeT205b1oRvnx0bQQMPAWd6whFTH6v8WUk4RdpeLTqV+weB+MjqqzxHTapddvS1x8Ywg2s0LGZkql4e9ev2VGhOT7c3sn7nHlweWVzku0l+Xs9HTS6JL4E5+tqvGhSvoIOYPrWHMpMrhadM23Q6vJMZrIMPiC/aLh4NCjpshPgkMcT++GJYzZKz3TLnPQ0jfa1Ml/9XsWakxS2JcsjVLVUQmMidgbs6QbL3uXMbr270Pm7LDb17z4sHMATPL1gDmK6E0sleIpXfnOX/v1l1UKSMndBLxqEA6V4fIKID0bygDlNQrpeCVZyhhH7R0EH+woSD+tpmQIwIYm+JnuMqOOG1FmgzZBFDzG37XtqT5LOIZrLN99+hVyEJ57cONt55MQxzNSEmZSYKLoWbPa6SuNGYXU3X2IG0tYNrPVY8ZYFmM/SQO7K70hFqR3zInkeKT0ISN0k7VfUm1Vt6gtdqK0DnE2n/HMbXopP2yFnM7Uv09vS4ApPT8GscuRnR9UVO7YZOnCaGMvP9CyWMp2VzEENjwhGAbRX3nzwAIwgAp+rCm21dDfyowRdF6g+fbBk53O/hWgzM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(26005)(86362001)(6512007)(38100700002)(44832011)(8936002)(36756003)(2906002)(31686004)(31696002)(186003)(53546011)(36916002)(2616005)(5660300002)(6506007)(508600001)(316002)(66946007)(8676002)(66476007)(4326008)(66556008)(6916009)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aSs3QmNkeGFEQTFpc1dscUthVVpxdGtjVlorTVpYbjJhQzlEODI2Z0JRS21v?=
 =?utf-8?B?MmV2dnFnKzRDWmNMeTI3L2M5bGgrbHZld3FxcGhqdzU0RCtKUDFHdFpjRGJJ?=
 =?utf-8?B?OUNDVXQ4STc4R0lyL0FncUI1SUNqNllCQWp6SnM3SHl2YUliSnI0cGE0bXIx?=
 =?utf-8?B?TGJwRDRVcmE2TVNBNzlKRmwvOFI5RXRqQXR5VWYwcXhtZituVmdrY3ZjVjEz?=
 =?utf-8?B?VGVjLzFTR2JZRFNZcDBiTnhueDZIaU9HS3BtdEpYQU9tZmMwSXd0a2U1WUxJ?=
 =?utf-8?B?Q2l6M2kzSmhhWlNxM3NMY2RjQkJ0bkEzcVN1Z3JvRk5UdCs3bkFYdUcrVFc5?=
 =?utf-8?B?S2FxVmRnN3lVVk9vMzZGNGtCSkNEL1drY2dNSE5vMWJJRUIxSE54YzJXaU1V?=
 =?utf-8?B?akg4cmI1RnBwRWp4MWY1V285WjNlc2VQWG9Ka0RmNEpwYlFhbVlLVWNsU0w4?=
 =?utf-8?B?TVRMdmZtc05UNjc5NnlKRXFlSVE3MjF0Qmxoa2NxNTFBR2VQTmhUQy9vUS9T?=
 =?utf-8?B?U2Q2Q1NlaEs5YmlQMlBSNnVPeW9LTWNFS05vck82eXFkZ0gvalZvaHZodVNu?=
 =?utf-8?B?eXpuWEpoNnVuMU1ocTNwNmtoOHk4ZmM5dGNCbTlHQzBnUTNFbWJTUWRtV1RB?=
 =?utf-8?B?aFc2TUkvUkVlZHZXTDVkZXlxeFV3MndhNWtGSnNEbmhHOTBleHhycGFQcm1w?=
 =?utf-8?B?cjNjOHZUMVdnM0Q1RWxrd1E3U1Q4MjE3RTA4R21uRGlFbzlPSUk1QUdQVWZK?=
 =?utf-8?B?a3prVGozYmpyRlBuSVFsL2ZGRzFpSzF4Rm91RHI0a2IwSlM5YUtlZGcwa3JT?=
 =?utf-8?B?TVltYUc2bmJGSDJiZjNRc2p5TkpYa0NPbEUrUEVtSGU4WnlIQ3NRTVhYY1Zv?=
 =?utf-8?B?TmlaMVYwYTg5MDVLYTlyWEo3cEsveGkxWWk0N2Fab29JM1EvUVRZMGtQcG9W?=
 =?utf-8?B?RXM4NmtRRmd1SUVMd1gzSTNtbzhRR1JucnhlWksvdG01ZEJ5clFpZFdOK1d3?=
 =?utf-8?B?VWRQTkMzTHRvSlZCRFV0eHl4RzhUSGs0SFZFRE5EQUQveXVlWWhYckJ4aytQ?=
 =?utf-8?B?cU1CM2RLaFZvMjJUWFRRc28rbG8vMkE3eHFFRTczTGY5bk1ZZXRsY004akRk?=
 =?utf-8?B?ZStLU0daUXRnd3FuOWRhYXBFOGQ4N2VjQlRoVEp2MUtqZnUrWllDQ3hLN1Jk?=
 =?utf-8?B?OTdmMGU5cng0aGE1WjVPV2trckJFM0JyV0dSQk4vMDdYRjh4U3greW9xallq?=
 =?utf-8?B?RG9Eb3ZUeDVyYk5wbkVJbTE4RlVkaEZKR3UxWlJIei9yTW1EZFV2UVBQT2NZ?=
 =?utf-8?B?bVZjaUVQSVVhaTJlSGM2NHV2M2hCaUk5WjE1czFTc0tBUU1WRmpCTExEMHp6?=
 =?utf-8?B?M1ZsOWNlWXlhMlNMbnVuM052bVA2VDUrWUpYS3h5ZnpVdldQcUl0NnZyTnRR?=
 =?utf-8?B?YXhKVGFieVZPQmhVUGxNUGNOTDlSWm1OUmhXTDVOUFhiZ0ZMelIra0VjZzdj?=
 =?utf-8?B?bFdMUGhKOHZBODR4TXpUYkhYbmZCcEJKb1BzNEJRKzRGaGdNbUQwM0tETll2?=
 =?utf-8?B?U1hUam1hZ2Rwei83cThWazZONzUzYVpGZVVoUUNxYytyMUlBTmh0WGZ4Vlc4?=
 =?utf-8?B?K3dxaTZjdVZOUEgxMkJCYmFsZ3JnVWZySGx6ZWJCcU1PeVNkM0psY1VKTi9D?=
 =?utf-8?B?NDNqRVBoRUhEWWRwR3RrZ2tBOFZTaEt4ckFCQVdocHNWR3JOMjl2MDZyRXJa?=
 =?utf-8?B?ZVFUeFRGUHBxSkZiTnVHN3pFVTZLTVhXc3FPRVdGamVxdSs0V3M2c0M2SlFE?=
 =?utf-8?B?bTd4TE51dWpSTHA5eUhFaTdnaThUZnBrV25zS1BCNkJUSHVpNm9JczB2UmJN?=
 =?utf-8?B?Mk5HMktpcUpHMmJoMTVEbTlzRGNtNFlvRG00UldGbVBsSVhMN3BFOWFFNTRC?=
 =?utf-8?B?NEhoam9wVmF0eHpXeWdOSkJwMnJwcDJxYmR2S0JnNFE5UHhZMjhhbUd1OXBG?=
 =?utf-8?B?eWU0MkNuMkFYWWViOW5MK29RelNvQ2o1Wi9saTk0UlZML1VPR0RlMjR3RlZr?=
 =?utf-8?B?UVpqSFNUaWZkZzRCZGxzL1U0U1ZENTVlbW5BVGJxOXRhZkpnbWwweVlzRkt0?=
 =?utf-8?B?Nm0va3pZdlR4MWg1RS93S0paR1REYy9ZT0pKeDNoZUVzNFJHMVhsaGx1V0I0?=
 =?utf-8?B?MHBmbEFyM2t0a0hEWVZVTzlqS05pYWphN2lmV2s1TUg5d1kvdG94QTdHYWdi?=
 =?utf-8?B?dEFnZUVLcEwwWkUzaUkrMzl6TmU3MXpiM1RwWXNMU1Z5VUxmWDJzZkdlWXJ2?=
 =?utf-8?B?T3Y3Z0tMZ3NKcGVLcGt6ejIzMXppOU1mTVM0OXFOMDdEdERCVVdiUT09?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43f5a823-7a1c-4a4a-95f9-08da45a44c52
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 21:01:58.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FJn/4RZNKTwjNfMn0FCJuBOeI8oFONN2PBW4RRz3+IT3AZgtuUlrkKEfsVhi9wLqpevcPRJmamgY3owo4ngGeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8015
X-Proofpoint-GUID: d2--IwF6qcpluYDiIL01rZztAD2nnWkE
X-Proofpoint-ORIG-GUID: d2--IwF6qcpluYDiIL01rZztAD2nnWkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=957
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 21:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166527

I'm not sure I'm on-board with embedding markdown into the commit. But I 
can definitely link to the release notes from within the commit body.

Patch V2 incoming.

On 6/3/22 15:52, Khem Raj wrote:
> thanks may be add this info into commit msg too.

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


