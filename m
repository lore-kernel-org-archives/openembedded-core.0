Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8513CEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:47:53 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.3634.1687366064908830333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=32/aRVBV;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=55365019b9=charlie.johnston@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LFeFeK002210
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 11:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : from : subject : content-type : content-transfer-encoding :
 mime-version; s=PPS11062020;
 bh=RlKaoitM885octglmPr+pHNOhp3XWB1UFajvaKXHPZ8=;
 b=32/aRVBVqOXN6mBE5ajMfKbCFbV2i5ibZxNsLT9y2xe8fNYn7sxFpwq2PASzmTdlY//R
 FyZuR6IJFQlFIG00cRn1sjvL3WsHNhOV6PTfcbdDoEtWxO8gtfhUYPVc+5t1S0hUjw6x
 HKhQm7M27o/+OZISRy0OaOdevjFAGIIt0MWRSpxIb5GTPf5p5a0onSqcJ1/uoXmy+Rma
 6b7WDFZ91lOqj/SItzbwdDJ1XVPT1DpKjWssRHGfh1sIWn5KEUXO+K/1MBABkOJeotIB
 wpyKrCMQZh4+jmgTpjeyLyV60JneVngaVbBsUtIBpQryw7+xmO+t1Ndo/qSEFBEz7lQV Mg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3r98wd6gj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 11:47:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7I0+fPWN6h+/VplwDpDC5nEbZw99i1UvUW7BisEUkg0MpmQjdwC4VpdngTAkN8HUZ1/49Jl3FhB/NklJ693+FdBn+AsyXo7nVOmFSTbqnHkSV4B+10u2StRFrLCCgALY/zGmpuYzzNn6gagg/UgxSw4F6WhcC8iUbEx0bYb1Lp+zrNkX374jmZXS8ULk1WgArkTaC/XhRvYGoa9OdoLMjLe5sgaMsxki/j0vNlUx8picvSMOT8KJW9jcAnKiPQDbmF9iCuyI05Ly2VidlUJZmORD6KPo9kpTJP88Of/Xj5JmAW+C2BiHmnVmxQnz873VfeMFWDuL1MBPjNloJoh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlKaoitM885octglmPr+pHNOhp3XWB1UFajvaKXHPZ8=;
 b=Fw6WPyf6wvELdAMBIxCNpIbLoe8TYRY82xs0MZ3XfgXV7OxjWzCjxZNH76bK61vxhR1Y+D2UZpnlAiTqA9QsfeoUIFUeD+C22cZv2J6wn6zsmx8Xb+djmq8BKLwO1/sVbJRjjmT1WYXi3N5ykRxBBYgBFKraO/fbJEBCrpXAq0JTbne911jTA4L90H4YBsZ+EDsRAbz2pajx7tecSYOqbsu77ht9GUqqcjC6Fs9QsvQxU8H5rRq0EE1fpfRLc4vtMdmgkiDePfC8drKSrujZbWLIwGV7v6AB/oVjIeUsz8UkDSlRw9Rqp8Z6iVPNrLV0KfeDqBJxzid25VmWt45mPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlKaoitM885octglmPr+pHNOhp3XWB1UFajvaKXHPZ8=;
 b=rBl69NoE246t2Apx1VxGypg6qvAfeh6cdyER+E4ykKynmg2Q8ozMwiRrP6lwPJpIGJWDoCFYT28sVaXJ2Fs9Zt5epGdlgZAi6oPdMoulJwJ87OdF1YJWSNhdw7Msje1TRSBhBaIo75cAK3OBTyjhl91CD4IGq7yw/kM600cF5yM=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by DM6PR04MB6443.namprd04.prod.outlook.com (2603:10b6:5:1ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 16:47:41 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::f64d:f407:7c9c:4af0%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 16:47:40 +0000
Message-ID: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com>
Date: Wed, 21 Jun 2023 11:47:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: alex.stewart@ni.com
From: Charlie Johnston <charlie.johnston@ni.com>
Subject: Building SDK from Feeds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR01CA0030.prod.exchangelabs.com (2603:10b6:5:296::35)
 To SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|DM6PR04MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: b76fed2b-73b3-407a-7376-08db72773a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BIBTM61xsTFVh2AQBZQxlJBF1O7R2lXA1Wd6YTALhvG0tGpxXBRfi/nGF5m03dsRFxKgxls5cZ3Q3n9/k3+NPAQ0mTlSDExp+s3TNV/WJktNgurdXDW12Ero6s2yfWCwY0GinoJFu7xtEf8SOXS9ZnyfFvw+7T0qNCsSA7pjNmHkhqPmkoenAij9gV2XFSpPBES2Q3lknC/dmCr56pRfiZpllA5YC5aX8jsrJOjQYOpbsECfR8xjl91xzpRE8VZZ9ZDIx4uvhf/Ixhu2rBs5/tqF5CH5lCA11iOsAQTfUdyBoRMtSICBGa+/SlYYBveLTiz2WwmKVbn4rLakN/nvD1E01w17JHX0vARmuzQ3clSolU+8j6E/ackbMgs8k6t1rns1gOidrxwu4XDznDAaVFJWT8VaHfT0eBU3vtzloNuVf1wfLk3i/cEJWY5I6tG+LSFfKBcEtTZ4Vaq/bR+Zta6u5b75xkD65E8O35hVjk5DoUH76Ow3niQWxbRHv4UOYpaCJpwUlWbvjgTTDPzZRZgyjVM1ZNM8UbffnieWKhUh6n6ant0Ac7C80nrkK6iQqtxIDWEIvFoD0hJ6PWV1Br9zaLZ7QkRyRW/yoA41pwGliqXCIPoO+Kr9y0+owtCKZmThN96qEiWiLoQB79a20A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(38100700002)(4744005)(2906002)(44832011)(3480700007)(31696002)(36756003)(31686004)(86362001)(2616005)(6506007)(6512007)(26005)(186003)(6486002)(478600001)(66946007)(66556008)(66476007)(41300700001)(8676002)(316002)(8936002)(5660300002)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmxDbjdUZnFSNjkzMlhIOHF6eHdkUy84OFBlaTRsR1U4SjBuQzVzUlkxa2hJ?=
 =?utf-8?B?Ump1RWtIREZBNkJ6SkVCdmNYdjlnNGZHaEVJWE5jSHZ4RmhyMk5uWlJyOUU0?=
 =?utf-8?B?S0JQdFNOSDIzVlNIZkRsUkpXRkdpNkx4Q1krRmd0K3ZtZ1lVWGY4NEZlS3pN?=
 =?utf-8?B?eWVscDhyb2JBdXJmc09kS3Z6eTJjaXJRbmVoRXpxZU56NisxZ2ZaRlZQRnpB?=
 =?utf-8?B?bTJYSTRObi9aRnNjWm03blRuamZIYnlCV0N5QjcyM2ZzZCtJVXlhakJ0dENh?=
 =?utf-8?B?dklwZm5iSTZleXVkWXZvVjcrVjBhcEZUS3h5bHlUUjNCbEdoQ0VMOGhWeko4?=
 =?utf-8?B?MUl3aXNnRDc1eHVHOFVSOFd1Y0ZjRTdvNGFsOEh3eGdrV1ZwMDBjc2lVTTVO?=
 =?utf-8?B?dzlIK1k4Wi9BUWZGWjVOaklEdU80TElxRi9acEJVWG0rMUJyUHZYTk0xQThz?=
 =?utf-8?B?cDBWcVNpam1IS3REVkh0bzk4dENRbkNOMDlsMkJtVk1HUEZ2RXFDSm80YUFq?=
 =?utf-8?B?eXZxR3FyOWNGOFU4MUg0ZHo4SnY1TlZydFp4QkVMZHZ5K3NSdk5VYmNaUUVx?=
 =?utf-8?B?bTJvdDQxS2Yxb2owS2w5YXVxb2lROXRxajdIbFFkUHFlZithY0VDQU1ybkVC?=
 =?utf-8?B?Q2hmUXZMbW83RzFuYmo5RnozQ3loR2FibkZPY2tIc2pRdUdOckxGY2FnRm94?=
 =?utf-8?B?akNDalNOb202cVU5bGFKOFpXM25sQjNjTHJMQ2dyY09ObHNjY1M3Ti9wYzRT?=
 =?utf-8?B?NVRpNTFKci9WcTZvTkRDWStYTkVIcnNlUWN1QTVVbzNlVVRLNnJCSTIxT3hh?=
 =?utf-8?B?SHI2eTlVa2Y4NkMwdEZOdkxuakpTZ2NwdU5mQXdxTXQyaWR1SVZxTjBLWXpU?=
 =?utf-8?B?WXZqWk9UM3lleWpPVUZBNWh4bkVoR2Qwb1FCK1kwR0NyaFMxclZqajNXMGFE?=
 =?utf-8?B?SVA5aHIrSzBjcTU4SHdOb1NNMDVTNDhMQVlzSkR2a3lib2VxcWtyWEI0S0FE?=
 =?utf-8?B?YXdmdG1ZMnY2clkrUm1RVmQ1VGRNZ29RKzZ2c2RBQnptcm9SYmt2VlBOKzU4?=
 =?utf-8?B?SkVnVG41ZmlxemM5K01HSWtmR0VxRWQ4Wll4ck44TzhiREZjVk1XQlZWYWh1?=
 =?utf-8?B?YjJYek1xdm8raUVMRGtzTVdJZjJzeXNmMnpvMmJ2eUd3V2FHNDlhWmVOb2ht?=
 =?utf-8?B?NkgxOFZLNmt2YzlQblNjcXpDc1hCcTcrem80SllUVWR6ZjBJQUI2dXN5MVlm?=
 =?utf-8?B?WEdsRWVkVkxwTUw3Vkp3dGlSNVNKazNTWVRoTGh1Q0daMjFwb01CRjRQQ1Yr?=
 =?utf-8?B?TDZsS0xpbjB2MXZqd2JMZTdYc09pR0l3dkNDNk1IbUljSWx2M3pQVzF0MXF2?=
 =?utf-8?B?NW1kK3pnMUhiWHJCZVpqWnlWVWRubENjOWhZSXFHdzViRWNvVUtBNFF0VmdF?=
 =?utf-8?B?YWJzRmhJN2ZIc08vSmlZZ0pwN1RRT1pERHh0M0xGdWk0d0Nlc1BUNlpkN3Fu?=
 =?utf-8?B?MHlFbmx4SmZuR1QyRTEwWWk3LzFnc2pwL3pvaWNGTG0vMG42MHRBL3QyOGRF?=
 =?utf-8?B?YytlRkNRWjNOTkFqWVdjN1hCa1pselJRb2xtSzhidXVXYzRGWEtVaEZHMENo?=
 =?utf-8?B?TzUvQ2wwSVh3WlZiWFZwZWwxQnYxUmZTQUVyaHZ1bjhSeTNma3M3emRQNGdR?=
 =?utf-8?B?NWgrTlBIRlAxUWgxd1RPRnFoL1BkbDlWbEplbmZMU1N0b1JETDVJeDRPdlNi?=
 =?utf-8?B?N1FKcm9nclNvQ0JNSUt4SXFOUDUrZm94R1FxVWxYQWJ2M2lhQ2JCZUllSUlS?=
 =?utf-8?B?UitZQUIrRmlmZzV5OUIrRFVucjRuSkJBRHJHNFFGU1AxcE9HTC9QNVNVN0tP?=
 =?utf-8?B?UEhvUnRlK1Y3R2VMSi9WcWhyRzd1V1dZdGRYckpKUUFNNjlIVHJOcGVSYWZU?=
 =?utf-8?B?dUdadkltVDV1UUVLV3pLZ2dxcko5N0paNVpYTDZYNTZueUpqeUJNSCtkNkww?=
 =?utf-8?B?QmtWUUc1VWdaSzdMTjdHWDBVNzdCaFAvdHhMK0Zpb2JnOUFWZ0xpd3dkYVVv?=
 =?utf-8?B?bkRRUXZNMWdCMm0yN2tMaHh0c2QvNldrTHBnUGNrYjEwRTE3SUFSd3lTQ0tx?=
 =?utf-8?B?a1kzNXhNOVZhS296aFVWSk9keFFhUEowMW54eGFsWk5RV3dzWkd3M2pqN3hz?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76fed2b-73b3-407a-7376-08db72773a34
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:47:40.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVYLIZmrHa3jBtdiu5HlBnPJYmztVFnXjzJ+jz/G0hRAlefgao84esD2WglMQmJocYGZd3HCFfBs5O2FqFw7lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6443
X-Proofpoint-ORIG-GUID: 675HkNqwjDdktDWF_OLTEpNr2Di9WKdB
X-Proofpoint-GUID: 675HkNqwjDdktDWF_OLTEpNr2Di9WKdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1011
 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=384
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183189

Hello,

I'm trying to build an SDK (or even just meta-toolchain) from feeds. For context, there are some dev packages in our feeds that aren't in our OpenEmbedded build that I'd like to include in the SDK. The normal process I use for building an image from feeds is to build the packages from OE locally, build a package index, and then build the image using those feeds and our internal feed server. I'm having trouble figuring out all the architectures and packages that need built to do the same for the SDK.

Trial and error got me to a few of the dummysdk architectures and packages, but is there any documentation on the required packages to build the SDK that I would need to include in a feed? Has anyone tried to do this before?

Thanks,
Charlie Johnston
e. charlie.johnston@ni.com

