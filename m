Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4B8C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 16:21:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.302.1643818905266033506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 08:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qf1OSH2v;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9032a99fb5=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 212GHAr8010698
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 08:21:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=B8bXxZjTkeoEs1n95pl1wN9o+EkxD2BXO4bca9WsA7g=;
 b=qf1OSH2vXAm0GjLdBEWdOwLnpL30CjCd2Zr5qyuebyiZoIYl9LoynTntd9z521qBg+0t
 RkhxyvYabtwF19WFFqqCVHFXcOJSnA8n+monA+gzztj3WXBgTOnCGBqybvCOyfhzaFqd
 RhLgjPaxQXTvZ5Xp6eTo/8AXeZIgXPMDqZXMHy3BV9AQ7CpcrvqSrD0FHYMeAqZwcGtS
 A6agKl104WFgqPWD816yHKzF0U2LAA4FpyIt0ojyNQXgOvjqnJLd9+Xy0XiOizpLLLWs
 jLrC1jHF1V8VRz9MgJn+a7k30n+IgTsH046NNYq2hqgT5rVkU2eER4rwoG+iu3yJAF00 uw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxsf299da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 08:21:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCadUrqvYMx+Z6M3tMXVEmSGZOsl3UgbJ8n2LSqIPjGZWeHWMCWNfuNNWA/PtPyJuyUG8GRiAfL3znHKEAWQGfw9woR4hwSeGmV6448OqAy4xr2CTjrN6+YRg9dhM2+CEJVfe7Amug41uAdh5hnOkM9zVE8UbqoiIK9OMHEIKoReg2xnjZFHPPNMneRzCT2+oOMYET4KLJMEbYsltuf7xOrUnLVJamsM+tQNDyc9ZOB4S6mqm+qLVVrWBTWEXHS6ekD8OPdtr5eLGk9cf+v0d5tCSu1d9L5qVF4WtuFPpFaQduQiRzH5HML4b0nCDtLVvP2UZDMutg6CdQoWyB7aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8bXxZjTkeoEs1n95pl1wN9o+EkxD2BXO4bca9WsA7g=;
 b=nzQIfRvl7h42AZiQCBQyKXUBu9QRbC5bcflUvi5KNln74pAeyrNkHeDRtH9SZY4dhbc9avNt/cw8LgpTdj7Zjg6v+QCzjAjYmHrn2ZG/ZeoxUf4hEI8ewIJSohgPd4UNyymPuQ4WUYNvBtbGFV0CFNttDgmwZSISbTelABcgQDcTe/mae7j+W9hUk4ovbax7SaJYAuCHChqM76jIuifDvohrAfW2OKAdlPEroupyrMTYSxYgqKI81H1LcwEg28L1u+tfXMCtrDPSgxJVUFP+RsIc7svBXKZcYvI10HwSJYi9oTn/rZg72K4vaGRVNXmwQ1ctfwt67YEhWfsODLr4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 2 Feb 2022 16:21:41 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 16:21:40 +0000
Message-ID: <ab18ac9f-7349-386c-86df-7499487af48a@windriver.com>
Date: Wed, 2 Feb 2022 11:21:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [hardknott] qemu CVE backports
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::14) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8a15331-1534-4049-2f9b-08d9e6681802
X-MS-TrafficTypeDiagnostic: PH0PR11MB5045:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB504513855E354F16C2C544A1F2279@PH0PR11MB5045.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XX/fnFdjSfgBVzUqvmzhbs4z5qpv7zhBDt//+UeFeZTV1G8BaAB+c2aXtUM/vFTpspJWZfvURSr0QTc3KzPJuOnno3AkiFJqZaNjbE8PCzAQkPZT/5aqI6Nuj35mnEQH13uAdzxslqI3Iqg5LTQskOaecVkUfwSV/nu71whfzKezdZaVvbFAY5zbIuIFUm2UyBGN2twtNFgqkNQnAYB5nWPytVzQOyculXYaxAbEuL0i3otZ8c6U26izzXnbJmA9z+SterRkeGd6Rkr6GrkL73x950a2wwWw+hUFuPRWn8dsUcvSLulif48spgSUIXunfa2xSrgbEjG3t8syYFYUtHuBVpndVFu8JGKw4AQC1vadnjTpuASYUdvy8KQteoyhax9Rp8GAjFPSNco7RLiJmOqKsdWI8rE8MLOo7tZzbz3QR0M3Fu37NwWc+fnbJNLIxNUCRBRr2hQodcMd2Hm7Je5RyfBKZkxILO6mf1A8ybR5TC+B06m8TwdSJoo8EWt5UVA1cokrBShL4FXIWtKUgsVTsDO9zZhICCH7FrYn+RUVjVfiM5zcZGRoIm1M06DzME5gBONWMsdQbPbhayXtR2/3dBalpABtJQuXbP+umFiTXPpaHo3s/CdW9psJwBPCu9kYc12uGKFMTWuBqLJeEVqHkMIi7m043P7eAxRfqIolwAUGSwWZo0+TT53AK1KoM6QbvPTB8eJ6+TmxwqYVrDmaCAz7n95QE10Obv8KWLM1oTTuNKIw6qvviypWttTWiNo6w4cRgeJVIGxZfdYkpWfeklqewo/oTmSNwUM78/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(86362001)(2906002)(44832011)(38350700002)(38100700002)(5660300002)(26005)(186003)(2616005)(6506007)(52116002)(6666004)(6486002)(6512007)(316002)(8676002)(508600001)(8936002)(66556008)(66946007)(66476007)(6916009)(31686004)(558084003)(36756003)(177753002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFNBUHFkcUpWMldtTTY1WWx2U0VYNjFXQ2pPY0pkci9XZ3pmd3pZemtqQ0hJ?=
 =?utf-8?B?QjBMaERHZjRDazZZelJ4aGF3ZDg5clN1OTRFK3MxUVc2YjM2UUJMMnRVd1d6?=
 =?utf-8?B?TjlNY2RsTjFnQVgrVk53TGtQTGllUmxFcDIrTEhjUHUxOWxJcG5oblZDdyt0?=
 =?utf-8?B?VndPdzFYdHU5WHYyR1JweTVQVFRURDRxR0tGVXY4TVJsd3pQbkF6QnArSEhj?=
 =?utf-8?B?aXM4WnIrWnkxMGI4TjZmMzU4OXRQVVovdHpLR3oxUEZmcCsxU0RxU3FkYldo?=
 =?utf-8?B?aWlUOVUvcXBUZ3E0Tm9sZW10cDNQQ1REcklvNTh2eEpJQ0hWUFpOaTF3aysv?=
 =?utf-8?B?eHRhT29YMnJINmIycC9oOHVlUXRkL3dKbFNXYTVhZ2p0UW8zWE9xeWhJbnpH?=
 =?utf-8?B?bEd1SVZEZ2R2bW0xb0NWL3lwRGoxT0pEZklXMERiVGhVcXVWNGd1TWJaWGtp?=
 =?utf-8?B?dEFORVFBL0I3VGVzdVYrVVBONVE4Zkdkd1J0b2E2OHlEOWplaHFRV0x4NDQy?=
 =?utf-8?B?R1lCSldEMXJFN1ZGQjVaY3E1OVRaUzRRRTJsYzNBZGMwTWpXNUpUdENybGNK?=
 =?utf-8?B?WGEwSGhMdXZhVWdaazFtYk4wNGJpS1FFRlpwaVk4VkRpVEIvYnpxMTEvMVRU?=
 =?utf-8?B?Q0toUTQ3TDZxRXhQcEtJRm5xYVp3YkRPZzBNOUpZVkdNdzBmdjJteHdvcG05?=
 =?utf-8?B?MmZLR0JINUFFVTVPZnpqNWxUeDRyYVBSRlEybGh1MXM1a1NtZGQwM3E1RDly?=
 =?utf-8?B?cDVGZzJuV1VVb2xwNDZrTUkyQi85a0JLTUZUUThhVVpPVitHUUhydGRBazZn?=
 =?utf-8?B?MzNIRnZVVjhEblZTb0NSdDhUQ1U4R3VoUDRVK1RhL1J6elMvckplMU5pc0lX?=
 =?utf-8?B?dTFDaDh4R2RVRkVrYW1LWkxzSElUS2dFSDlzd2xzTmtEOW82ck4xVlpYQzds?=
 =?utf-8?B?Lzd4ajVrc3N2N3BXT1diU0NOdzBYNEFqWSt5bGtrZ0pEZ2NsMVNzWlY0UGdQ?=
 =?utf-8?B?THlZc3VzVmx0VzdMbDNWOXVNMXRVN2hhU3I3V3Z2cTgrMkZtTk9BZ3pFU3o3?=
 =?utf-8?B?YmRCbGNhelVlR054ZnJGcnkzNWQ3eTYvcE9nWm43ZmRjK2F2eU1Zc01UeEU3?=
 =?utf-8?B?eThTTStnTHV3UW40czBIaVhNdHRJNnd0ZTllTXVkb1dsYTZVQU4yZWNxa3dm?=
 =?utf-8?B?K0UrS1QxTHRpaVUySXNiK25GdXFSZXZ0ZCtJa3FPcjR1TFNJWXp4YW02d1Ar?=
 =?utf-8?B?QXI5MVI4OExZK2FMdkRKK3JiWFViVk0vN2cxdVg1Mk51WGxYK3dwR1IwKy9j?=
 =?utf-8?B?L2VLWjk1dmREbU45WlVQeFRFSmFsd2FmbWhORkYyeFdNcEtXdjJSajAyeDdW?=
 =?utf-8?B?ZWxVajIrdkZBYmI3Q1EveDNDZTVzY3pEQWNTbmNhbno2Z3pVWUpGRFVTdnhH?=
 =?utf-8?B?TlgxQVBjTmRoMEk5M2lNVkRYamY2UzNERW10Y3ZWVXE1VVZWVklyQzkvV0M2?=
 =?utf-8?B?RFZlTlBOeW41eXdqMGZudU5jNHE4b2UrakhXQzUyTVYxNWhjOXh1SGxUdElY?=
 =?utf-8?B?Vlp1ZENmQ2JnYlpjVFgyQktzTzMyRWgvakZYN2g4WHcwU242TG56T2M0U1Fm?=
 =?utf-8?B?dDJKOHNXa1p6alUwR1FCWVI5aDFXZHNFbmJsdzRSdnMwN1R6VmpwVk5TQjNP?=
 =?utf-8?B?L0xZM2VsTVA5eXoxZm5yOXo4TWk5UzFoQVdkT2J2U0hiWXp5bW8wa1JyK1N0?=
 =?utf-8?B?a1liNVZoRGVxQkFrRFBOWktveGVJbVlFV01mK1ZBREtVNGl4NnNsbVFtNkVy?=
 =?utf-8?B?Y0tpV2dSOFRnQWozMVRYMUoxRklSRWpvYUZMS2lzcWlKNlIrQzBmQTJISEtF?=
 =?utf-8?B?bEp2NDNqdFJFby91ak9saDk1L0NOT0F5cWNNSmIwQnc0V1pRcml2R2ZSRHUv?=
 =?utf-8?B?WjRXUkg5d0s0bCtUREpDUXpKT09HWCtyRUdyUlhreXNtQ2pHV1JSdE9GUy9Z?=
 =?utf-8?B?THAvY3FMSmJzYmM3ZTRPWXdGejlVMG9VcnIrY01pbm83NExNQno2VzlkR1Vu?=
 =?utf-8?B?Q1NNbHRFTlpYVHUvUHFLOE5UU1hxend6d0ZXcjdIZmZxZTYyTnkvbFVxbnpz?=
 =?utf-8?B?eWF0L2MzWncvQ3pkZUdtNithaUpmaGt2WkVLZURhOTJQMExESG51cGg2VVZi?=
 =?utf-8?B?bmd5NFJVK2s1clliQVB1RlpJRzV2K3V3TjdWdXBEeFFZeEFKdGJqeDhHZHJS?=
 =?utf-8?B?NjFFSVZCZTlQL0dZN1A1K2JjRFZ3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8a15331-1534-4049-2f9b-08d9e6681802
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 16:21:40.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nBbbBOYaWPpAgyo+o4QPjvPVYF1EAqR7/jaiiQUIDW2k69lLk9cGWjSHM4cSxDYUAsre2yY/MoctR/wRIgAxdEpi6wb2/3KQKqulUJzGiCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-Proofpoint-ORIG-GUID: axqzqo50zocFNq4esfkm18yfwvpbQ5HW
X-Proofpoint-GUID: axqzqo50zocFNq4esfkm18yfwvpbQ5HW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 mlxlogscore=468 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 16:21:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161219

Hi,

I am having trouble sending multiple patches at a time. I will 
individually send the patches in reply to this mail.

Sorry for the inconvenience.

Sakib


