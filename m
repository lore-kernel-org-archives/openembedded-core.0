Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFEDC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 03:54:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4876.1635825294268215742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 20:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=OHYnZ3iM;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6940216c12=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A23kxhD018970
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Nov 2021 03:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=u8U0V5C8JvozFbzWvu8Ke9aO91OfKEEp6Azl0bzIiLE=;
 b=OHYnZ3iMT8MKLP4qP6yjLImaimepR1Ou1A5++pHJi0asutI8W9ENq9VrvTRLs+ZUOiQ2
 9pr+AJkJoaqLYt+2t1ZnppB1hx7cLd0+stWsAIVcrv8pKVte88XiavyWryRIE/uUDGk6
 FQjYsyKjOjjoBRX+SZQp3Ls4Lu9X1c/Q+sgoPJeFYYTEaBRIODYoZnUVlcP8TsmOQm+x
 RI0Iq5QMDyDqvUk4TSyP3GJD9EGYNWRfKRpSMpgkl7jNa8y0szn2bPVaF/QWbWzHDd8g
 vSB8CTURX4QEnhSgeT+etPhIP0Uhck3X2gBDNJVI51w8iQl12rzTTPP+fkpL1sF1Q7aV Zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2b7jrt99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 03:54:53 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A23sqwZ031789
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Nov 2021 03:54:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2b7jrt97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Nov 2021 03:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McjRlRfM71SyjpHh7WDHCYnhUpKR3CnzVKuRROhvdAAzdZTMdNlHAIo74Cph68DzFD0AZoS1JC514sWxmXsXXpQmprYvlSk0AQOfOZYvi4cq74TI4Hc/4nurLT9l+6Qr0ec8uFka2wUU/EcPHoJVU43259DC1ISiKJMdoiNaQaaWZsGEuuEHYazDWzowwhOHDtcBBTihQMWv/iUUv0XP7mbSke3TzgZXGyPzjnLvpX2vpzr++ZCJNeiurccoxzabL1znSYRilYeIiDbIuz6eEz+JnllfWOirYWEYBy02vOWzMQml0LhLxhUJ+vUQ9T5t9+GHrcinVlbAloPW2f02/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8U0V5C8JvozFbzWvu8Ke9aO91OfKEEp6Azl0bzIiLE=;
 b=SWLRJ/sJrOWyvsyO0St4YJIKc5ZbwFlNg8br6YBqRBIRIYW+LBlupGsUToGjMC8Y/rdBv5gN3d8hL1PBKTxogQEomEYLcNMTmVuN8L3vEdvM4IeoF69x/krlE8HZQhsqWFSXo+7Pk/e4rWecSxPHDXEn/rGK0S/B6275PihwVtYnjTH3PV5ghJ9/dm7Z1m0d0HwgAVTECLidIOegvJA+/GY26U4tre0hNLJvHGBRIKBn/SykjpG6UZAYd7rvt3C1DXzCDUOLrsPBLHmN8v/f2DtWDOH7eTqD3mQfWQxrRr+AArefosFKODpT8ON2J/u479vxzsw+PsBImgpWrL9hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4009.namprd11.prod.outlook.com (2603:10b6:5:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 03:54:50 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970%7]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 03:54:50 +0000
Subject: Re: [OE-core] [PATCH 1/1] sanity.bbclass: Update required gcc version
 to v7.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1635778787.git.liezhi.yang@windriver.com>
 <9afb661854796b8ec836b94cca1cebf7aa382655.1635778787.git.liezhi.yang@windriver.com>
 <CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f32d710f-b44d-93f5-7e64-446f9b6e824a@windriver.com>
Date: Tue, 2 Nov 2021 11:54:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:202:2e::27) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by
 HK2PR06CA0015.apcprd06.prod.outlook.com (2603:1096:202:2e::27) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 03:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1499a668-6442-4a38-9010-08d99db484f5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4009:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4009C33A3C7968399B6369BDFF8B9@DM6PR11MB4009.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3cQbZ+CoP8MIo6pFN7rz1+i3NxxmM422e3JF5K8XrWBkxiwYTtGH9rXLwLqv8ZXn1z0M8So3g4hAbKkbtIpSguLYuE5PMSeJNukONtlXl53bwHEsdoSXf+0Mi51H5xj7LybZRmywTyAhKk9RcYm8VkMJN8aHoV3/XMdyZiXr/jVBghlJl5EahI5njsv5Mv5o7n3BuSYRrcMDBCrWPo6BqdxIASgK7+vEkobWBFhvcA7wrapLmA8Sx8O/4IEdEvHBE0d27hStSTmEO0qP1JwAMcHAw29qx0HM62624UvKV5N/CAQpHSh4BejSMMLWgUioE+4lrsN5LCponBsKnH925V+Rhk06XRJMrWyEZmFGv9Ptpdjsz7a+I9A9nPNtBxB+5tOvQZoP5/X+3lyzM3Za5AMB3VbjTKiieYy+iVF5KeLakGQRHJw5fv50kg47Vw7ra2j8+ZA1t4xj7pWYPiCtWDPjqOI/9cYM+HQp9eoqoiKw1joyoph6EaHQSujEbiEsiAa4RpPz938OAYP9rUi7IZkXeuDO1Gm9AoCzIHXuknrP+jCb2ZwBoaWWm8NolXyxGwm7MBTox0rF7wEklhellNPmoKy6kVTneCcdNWJOCe/MVMu1GAKz0sDdloYq1521qFlTGYAoMZLgmTtDNxs+QO6EFq49AMmeIBKghNWOa7nEaDTrqs3pgEWUvS50H9a7DrtdF156OhtGod+Znf5lI6u9TrpiDNyn9BAjeoOC+8b5Zbw9pgXue+m4/cdZC3Vt3U2g6acHooiRec0d9umV4unKcTFL5DRSFem9RbqAwtuhiSU9VrkBbsa4dreKazeQ3lkAEAuO0NM+FOxFAPPah2BNd+XLyyLjRg/kcDoZopzS6gvH7M3TnbHbBk5UbqMGHUPxE54dSMPe0li6KE3pW5uDmZFAU6Xml1xorAbNaf0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(15650500001)(26005)(6666004)(2616005)(956004)(83380400001)(31696002)(186003)(508600001)(38350700002)(38100700002)(86362001)(8936002)(66556008)(66946007)(4326008)(5660300002)(16576012)(6706004)(6916009)(316002)(966005)(66476007)(53546011)(2906002)(52116002)(6486002)(8676002)(36756003)(31686004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YkhrMmdFTFp0OXVSTktMemM3NXh5c0I4RmVrWk1Fd1RlTnZkOFpwaW1BLzEx?=
 =?utf-8?B?YXllenYwaW0zOHFlZUY3WXAzbTdKOVR3djJZRVRnKzVKS3lwUE9vZ2JIUXR5?=
 =?utf-8?B?eXZ4WlQ4NFRjTkhabXhxZjNOM1VHV0JjQ2RsL3VKS210aExXajlXUDBndVc0?=
 =?utf-8?B?bTIySTdnZ3NOR01IQlNvRVdML2lzaHVjZWFIYmgxUUtaUFVNK3dyTzFTSmpa?=
 =?utf-8?B?RXpsK0dNSTNGdVJmZTBzcERDbjY2RHlmSWFtVW9KYU0rcFg0ZEQ3eXY0bmtT?=
 =?utf-8?B?dlZVVm9rQnpiN0llVHNHTGRtQm5OK2VYUFdxUkhMQWRvQWRZSmEzTEJTd2th?=
 =?utf-8?B?M1NwY1oyM0hpeHVMSjgvVXd4cFczcWk2eUNheFlyWmVuRjBZazBJWW9TY1ZV?=
 =?utf-8?B?SHhLL0xxQzJ0d2dzd1gzRDZ1KzFKR2JCQzUzRjZsWDJzZWU5Rm5PTldDS3dD?=
 =?utf-8?B?aHN2b01mTzhlZEZDaDBZTkx0Z3grd0FOT2psZWRzLzYrUkdFaW03SStRRDhL?=
 =?utf-8?B?VFMrbkZhNjI1b1FMTnRhRW13OUJVd0dhN2R0aHN2UTRlTThHYzA5aFJpM0pI?=
 =?utf-8?B?WFlldGFGb2pSdytNN0lIdlBQWXZDQTdIVTBucTVSQkpuOGZiU3prOTBWYUZK?=
 =?utf-8?B?VGpLVzdIeS9TOXFNNVkyM1RXSVphWm9DUHVQcWxLczZxZ1ZWdkhIK2FpTTJa?=
 =?utf-8?B?TlkrMFFYYU5nZU1rRy9VNDVyTUNuY2Y2bHhWM21FWU8wZ1pJVWZ1SzcrcS9D?=
 =?utf-8?B?MmNEV3pPdGRqdzJFSXg5b1lKQUNQZ2IwTVdPem1RQlVkNjRFMTc5VGRpaUxS?=
 =?utf-8?B?bHphZ2t5VTZXWkdvQ3BPVGZvS2QvcEZ1OFFyQURaYi9oekkzZE1KeGFIa3Iz?=
 =?utf-8?B?cXJMUTFsV1QzNVdMcU1vRmovOW9YekVoZjFmb0R5WTNmeUh0aWY3dStkNkJo?=
 =?utf-8?B?a3pRUWtOdEFxWFpMMklyUzRERmpHcXczRUJzaXl4bm1tMm1NZVpFMHhLR2k5?=
 =?utf-8?B?QzZkNUNrMysyd1NISGxRUEtqL3pkbFJId2RDcVRJdWZ0ZHZJeWo3OFNkQ2tT?=
 =?utf-8?B?MHU5T0RCR2dLYXd3MVZSOTBiZkxKQmZwVDltSVRtUm0wUGMvTEtpSDZxMkYr?=
 =?utf-8?B?WkxqQkkyZmF6RnliZW90QWZxcnRqV2Rwc0JLS2x1RmYzdE8vanhSRGVwaEJX?=
 =?utf-8?B?aTdhWTdVeFlyMEVBVVpsVnBkTWtDV1lZVGJ3aG9XTkdJbHVzOUd0VDVRUzJ1?=
 =?utf-8?B?aVVvTklxWlBpM2hYUS9sek1aVVh5OThQNzI3WjU2SmxrRE11aEczWUhlZGEv?=
 =?utf-8?B?alRqTnREc29URytJVWxvakNrcUNkZXp1WkFBM1E3RnJpUWxHeG5YZHJFU0tM?=
 =?utf-8?B?c3FtREs0SUozUnFvcUFQQng1Q3AzWHEvekowWWlka2dTZE9wRXE4UGZwSFhN?=
 =?utf-8?B?WjVMekc0RUZuVFh6U2ZpRzV5SUNyL1QwSUFoRzYzbnplNGs5S0lQSmpXbjln?=
 =?utf-8?B?M1dPdUNrenRPenJBU2pNQUFOSGIyc0o0Q2FpWkxQeDd2cHZDM1dHUlN6Qmc3?=
 =?utf-8?B?QitRWTU1S3o1MjNIS2M1MVhOOS9nR2FJZmJ4WWk1NjZBK3Zsem8yY1RXMUQ0?=
 =?utf-8?B?RnVnUGFJazdWUzhRQWtwNFpYV2RKc2UrSnRLamxRQVNZamd5NnJvLzRJd1pt?=
 =?utf-8?B?eHZRVDI1MjdvSWlmTXZKYzhRNlBJbDJJeWxVcjYzUUd4azdlSU5BdkhxSldk?=
 =?utf-8?B?RitsQzZwWUFRbExKNEF6ZEJNMzZlYlN3emkyU1IraG51ZTdJajdhZDNuOGhm?=
 =?utf-8?B?VWZ2bXpveWFWSGlFMjNEWjlCNzVKV0tFV2F4Ylc0Ynd1Y1UvVDRBTkpubFkw?=
 =?utf-8?B?QXRkemlybHBoQ2U4WmVXaTU3UmFPU1hKYklIeUp2OWpra0F2cUVUZk1aZ3F3?=
 =?utf-8?B?ajdhSkdRc2c1VCtTeGlUWVdyNVh4QmNiT0lrWUZHVmZLTDl2ZWVRM2labStO?=
 =?utf-8?B?WnVSaXJjQjh3eVFyRGV1ckRJWmVzbUNHL0VJc3pqcEZ1SHhqWTNaOENGbGIz?=
 =?utf-8?B?UXFEWG9tK0dXb2VuN2MyVld5ZGZjSlhMcVJaMUtVdFZFQ29tUFp4KzVVWkpP?=
 =?utf-8?B?SWd2WkNZWlZJZ0N2bW9JbVlCenl2QW5XWnJRTU90eEJFRnpHSHhuVCtvbitm?=
 =?utf-8?B?ZDM3cnlWc2tscExNS3U0S1lwWUtNOG1qRitCd1VmQWptYTN0Vi94TVllWnpI?=
 =?utf-8?Q?4TB5EilqL1AQMFAhXPBSU/9QrRxwhlgx+cgPUh1GA0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1499a668-6442-4a38-9010-08d99db484f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 03:54:50.3092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZQWZCinrkf5MlEEsq2T9CHwjeZ73DZUIO2uxzJfAfYmxMUekr7RP0daveMi38GncOZ01M/4Z5xVfCAve5HkzKFjbEx2NmL7Kt1iyjRqou88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4009
X-Proofpoint-GUID: Ejnf5Hz6Ndo1xm-7daWAtOYQYOJXNHbx
X-Proofpoint-ORIG-GUID: n7cL7E4iF8kOowvzYK0o4Gziwc1wX8KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_01,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=788
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A23kxhD018970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 03:54:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157734

HI Khem,

On 11/1/21 11:18 PM, Khem Raj wrote:
>=20
>=20
> On Mon, Nov 1, 2021 at 8:05 AM Robert Yang <liezhi.yang@windriver.com=20
> <mailto:liezhi.yang@windriver.com>> wrote:
>=20
>     qemu-native 6.1.0 requires at least gcc v7.5:
>     ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10=
.0)
>=20
>=20
> Which supported distros still ship gcc < 7.5
CentOS-7:

SANITY_TESTED_DISTROS ?=3D " \
[snip]
             centos-7 \n \


Its gcc is 4.8.5

// Robert


>=20
>=20
>=20
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      =C2=A0meta/classes/sanity.bbclass | 6 +++---
>      =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
>     diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbcl=
ass
>     index ddba1e6e1e..9fbc9c18e7 100644
>     --- a/meta/classes/sanity.bbclass
>     +++ b/meta/classes/sanity.bbclass
>     @@ -530,7 +530,7 @@ def check_wsl(d):
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn("You are r=
unning bitbake under WSLv2, this works
>     properly but you should optimize your VHDX file eventually to avoid=
 running
>     out of storage space")
>      =C2=A0 =C2=A0 =C2=A0return None
>=20
>     -# Require at least gcc version 6.0.
>     +# Require at least gcc version 7.5.
>      =C2=A0#
>      =C2=A0# This can be fixed on CentOS-7 with devtoolset-6+
>      =C2=A0# https://www.softwarecollections.org/en/scls/rhscl/devtools=
et-6/
>     <https://urldefense.com/v3/__https://www.softwarecollections.org/en=
/scls/rhscl/devtoolset-6/__;!!AjveYdw8EvQ!Lgf9R1VVp7NnmQ2_34OejSiQF4VTR4F=
FlyIm_7pg5abwOZHY2z7ir1SPnplXDpu3CJJc$>
>     @@ -544,8 +544,8 @@ def check_gcc_version(sanity_data):
>=20
>      =C2=A0 =C2=A0 =C2=A0build_cc, version =3D oe.utils.get_host_compil=
er_version(sanity_data)
>      =C2=A0 =C2=A0 =C2=A0if build_cc.strip() =3D=3D "gcc":
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) < LooseVersio=
n("6.0"):
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return "Your version of =
gcc is older than 6.0 and will break
>     builds. Please install a newer version of gcc (you could use the pr=
oject's
>     buildtools-extended-tarball or use scripts/install-buildtools).\n"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) < LooseVersio=
n("7.5"):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return "Your version of =
gcc is older than 7.5 and will break
>     builds. Please install a newer version of gcc (you could use the pr=
oject's
>     buildtools-extended-tarball or use scripts/install-buildtools).\n"
>      =C2=A0 =C2=A0 =C2=A0return None
>=20
>      =C2=A0# Tar version 1.24 and onwards handle overwriting symlinks c=
orrectly
>     --=20
>     2.31.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#157704):
>     https://lists.openembedded.org/g/openembedded-core/message/157704
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/157704__;!!AjveYdw8EvQ!Lgf9R1VVp7NnmQ2_34OejSiQF4VTR=
4FFlyIm_7pg5abwOZHY2z7ir1SPnplXDvQSm_zn$>
>     Mute This Topic: https://lists.openembedded.org/mt/86742639/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8674=
2639/1997914__;!!AjveYdw8EvQ!Lgf9R1VVp7NnmQ2_34OejSiQF4VTR4FFlyIm_7pg5abw=
OZHY2z7ir1SPnplXDpJZAnsU$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!Lgf9R1VVp7NnmQ2_34OejSiQF4VTR4FFlyIm_7=
pg5abwOZHY2z7ir1SPnplXDqcbcTJc$>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

