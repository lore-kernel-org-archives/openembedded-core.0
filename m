Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2951FC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 01:43:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6066.1635299023882143539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Lwfbw+Yl;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5934bce628=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R1MITx012580
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:43:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=84sT/CKW4TbHnvmJLn5tpmikTNvPMZEUaeI2t/k+EDE=;
 b=Lwfbw+Yldoxup52U5nw8XXypAnInYQ2QapUSHQD6BFnQmcUQVXbq146UbhrNlVLHLvDj
 lhElWFEvdNwMDtHZFRYWYROEv00ariOvwTcmpiNCL35GBau7fznw4MrM5wtKFeEo1FyW
 5GMhAu8wjFTHi3EWpwkPifJNE89e0zs3U5jOFdTUvXhU4c2htM+R9sfLtFX+AYhKzruv
 JeXJwsxm7ADGzkpvZLL+fxCik4tXm2bvLfqHrkQF7NMEZk0gZFa5dOnouK3oE9mmtHWZ
 HqtCPemnx3ICs4buz7dhc6iZ1Krk4HLt8cxxtMoA+SjBjIM2oXwX18JpWX+IkTeoy3Rr Pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx55dh374-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:43:41 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R1hfVh014709
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 18:43:41 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx55dh373-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 18:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FndGUojhPrX3xvaR5Kgz8oLvnvSVp9kvMbBs+1G5GYAcuPgRQMIRz7VbYPY2uoHncJgZGe8UOx1qevY5wvvaInyIk7bEWVpRD0SItbrSMmrqz0ill7+sDEiKJqq1hV0uBlpAjer1ReBzOQA9FRwiyhS0CpEnLg9dF7BhFQznvO7SWTYMTX79gILDGc5gKcVGaWn2p4o4b3qVaWZLXiJcXWdXd2NKE8XDR0Sxil1vDa53j6LL9DFffvDFcWyC2RjH5a13OP+vhvJU+gnu6uBab0xi+vB4VvzdCRR4+CdIISJww1pT2/CUf8FpaWyIwznsgd2WOLqjouEhmJutFiIuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84sT/CKW4TbHnvmJLn5tpmikTNvPMZEUaeI2t/k+EDE=;
 b=nD6VGx8Gma6oKiPPjD2+mTYoL7Ysow0pB9fzZZbim86WNElxjYBsFMAaB6RNLuOwh2179XGf80uwyl3AffMoywUTT8lDrx8OU77RRixOcbJzErm0k1sERiB8MZXLMFj1qzBcU/oNESc4i39xjSPyFIMUo5EYef8Msi0BZC4PT0JeMr/vcF2wl1mm57qTJJEarzny01ncABdz4fLzE5q46zhFDTpXie1QhT+vzX0DAH7LyRMVDjo9JTtS4Uchysc/Y5POodJrMMRxZF/wyddYCccU2IAT/AHojOn/vv3EGfYK80hdVqzDYUzmWzQZnuss6UKUEvof1FwtdoAFu02okg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1306.namprd11.prod.outlook.com (2603:10b6:3:b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Wed, 27 Oct 2021 01:43:37 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5021:c72e:2201:1a62%6]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 01:43:37 +0000
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
From: Randy MacLeod <randy.macleod@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Pgowda <pgowda.cve@gmail.com>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
 <CANNYZj_kzzBM7v96_fkivVgA4ksNBpk00hsCHPmkq4am1EpGXA@mail.gmail.com>
 <CAMKF1soyXWyzFd-FJTPopYt3Sds=4=A6=tVLz+fKrC59VgYKxg@mail.gmail.com>
 <CANNYZj9Q=9hXRziLC6c3_EVRViDfFcTe3-27ifOOnpz94P7_-w@mail.gmail.com>
 <5903b2623057b6861cef3b84562acecddb0adb14.camel@linuxfoundation.org>
 <16AF97EEFE1D519C.12113@lists.openembedded.org>
Message-ID: <4ed3688d-6050-f4c5-846f-b98fced3d6ef@windriver.com>
Date: Tue, 26 Oct 2021 21:43:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <16AF97EEFE1D519C.12113@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 01:43:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a3df1a-e610-446e-04a2-08d998eb31e8
X-MS-TrafficTypeDiagnostic: DM5PR11MB1306:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1306383734D832957F0B0FC7F8859@DM5PR11MB1306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UMSEEYF0o/198RM5rIWSrCn9st7yk1EE0JVMBO6OCXuRlRxSTxxtHMVqT05TWwNMJcVzjORhSMTdLPLbQWYDnRk0pkR0H0Ek7XlCdxCpHMf7k0tlGPS5ghro71Kj0n3Xz6pnf+cU2Nvi178sRKRAWBGxduUDs5zZNAfH4T+yawqBowzqdKOyS7SJwo3AfKnDx1C6mJNd+cPzJwZg09+Xl/PfH6thwB+T/WWM5TNbGPvStw53QoZUxBN+cv0A7oUCxObkVeeNxxe5p3ys73EpZ7SlOe/EChNoasA7248vQRL4bhkPqSo2YSmmd+GVB3Kqd86Kuv21gXhVtZVzsDNFVUnOBBq7GpwdDWqIAAHeGjcWfmfPelyKCps2I5Z8CuMXpjWW87fkntuVgorUTIIbdHkV2Q61YKm6qpQRx/BzfFC/xkFy2Xv4XKzWHtXjFHpxPtoZrA+98bjmRmyNbuhAyKwTARTJFea/bGRXNi3X1+2ch8xBQ8UhLAUbeiw/teUKxrid+fkSkXkY2z9eY6v5zDIbYId1ACzdUUnryZSUMp5TND9XUVlCYquJ1HLQ3pXeVGsKTOUT9yhW1l7Czd9VVRB1fgY88M7mGJ8wKSCgLJWUfXiMqHCsP6yvr/Obpgm76j2UWfhDHyGaS3CEpzVOCqxrGf8iLosZnbBUjG0kIij8VFrKVoFXD9zwWUsiDu7TTJRVKQCy0g9TNiE7lZE6OVMriDTDCTIB7tvg4lp8eqWKmq+08wDLMk3n2jK5pa1cz1jam9wM4AL3VGF2+b7uXO7e/w+5CQWR8LUNIOzXXrscTerltJJ+ZIMfMPP5KzCiMDdzmsnX373StbGdSIw5/yOtqmM8TBaaRyVmRUe0TD3rqgInAK5MbWmsUCsNQKQ/eN7qb2LnuvvwGji3RNfJIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(2616005)(86362001)(4001150100001)(83380400001)(31696002)(316002)(26005)(16576012)(54906003)(6666004)(31686004)(186003)(52116002)(66556008)(66946007)(38100700002)(6486002)(38350700002)(110136005)(508600001)(8676002)(36756003)(2906002)(53546011)(956004)(5660300002)(8936002)(966005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3J4d3VQT04vakVodWlzd2tYcmtxT1pkdkFMazdzQVQrbkhmT2lvMEFnNTBI?=
 =?utf-8?B?RVNOSmpPK0x3NFVFRGwyUnNzZlNvN0t0d3ppNWplZVNDOHA5cy9UK0Z5Tnpy?=
 =?utf-8?B?elNuYkRaY0tueUk4WVUzOFU2WnRTbHJMOGVmVTlJOE5udUk4YTlKaG02TUZr?=
 =?utf-8?B?am1YWU5FU1F0N29jYTBLNHRuT1hsKzV2WTFVaVhPRUl3NjBYdmNNQXorazJC?=
 =?utf-8?B?ZHZOdjVRaFEzRDkxaWN0U0k0WFVOMHZEMURtVzhPSVdvZ0lRZy9mZHhEaEp2?=
 =?utf-8?B?UE1vTHNaVEpKemd6cXBmMGxxWHlwQlJwOEpvQUl6a0pNdm9TclduUEI3VjNq?=
 =?utf-8?B?a2VPdGJhUW9uODBBeEx2RlNMWjZTKzdTazVxQUVWWGcwZ1U0UDJYN1lWTUdy?=
 =?utf-8?B?djJ5RjBTQ1RpOW5QT0NpY3ErNGVCaCtSSGtuOXo5SWJpaWtEbzF3V0Y4UStI?=
 =?utf-8?B?dVVURmk0TVNYY1ZHWUtWV2pvNGxrZ0VXVGJ5Nktzdm80YlEzODZMY201QnNn?=
 =?utf-8?B?MUNIY1VDc0g2c2FKQnZDbmk3bng2VXhGRkZoYUxqc0VYaU9PSm96RnBERlFh?=
 =?utf-8?B?dGVSZTM1MmFuMlhDZThoUFozSmdBaVNML2sxai9YSDJNa1RNMWpkUDU2cVMx?=
 =?utf-8?B?TGM0MkRzZmtqOE9ZbmhaZGRGOHVUNk44NVh6cmozMmxrOEVkZm9Hb1g5VjdX?=
 =?utf-8?B?NzR1WnluTDQ4UFVSNzlsL2svSy9wRHpDZ1BFME5td3YvUjdja0xWc3NJU08y?=
 =?utf-8?B?M0R6dlR2cUxHYStscmFXOWl2eHN0OVI0TzIwS2l5VFlhQmN6eXJ4QTNONmRI?=
 =?utf-8?B?eHRZaUNMODRoTVVETUNxVFZIRmxPVzUvZzVYdG5kM3QvckxvQjJZb3NJUm96?=
 =?utf-8?B?S3JMWUkyQXVPRll1K20vZVM4NmtqR2V6RVlsN1RzSUduc04rQkhrUGh2NDEr?=
 =?utf-8?B?TWoxVmVFV2FqNTNoNDJ1NTlBakhpN0ZPQmtiMkdXa2ROL25Mb1BKOHVpWXJO?=
 =?utf-8?B?eEVYdE4xSGwvSUczbE92dnMwaUtrQ0lzbDhCM0F6eGhUQ3JUWlJvYVVkQm1Y?=
 =?utf-8?B?ajdkdDZqWGlTbll3ZTdPZS9VVGVRNk1VSnNyMFBlOHpPeU1oMzhVOUlvN25s?=
 =?utf-8?B?VjBkMnhvOHV2Tk5mN3VQWWhZVFNWbHBLWEFuQU1Tb2hxanZ1aWtrVXU1MmRT?=
 =?utf-8?B?RDI4YkdJUTdQQUx2OTFLR3JXZCtwSUNKQjNnempxeFRpN2lVdHM2M1dTTGV3?=
 =?utf-8?B?WmdIQ2RzaUtiekdXM1Q0TUFxaXU1d2laSDBpckFyRnJFbTc2S0lTUzY1TnhV?=
 =?utf-8?B?MzVkbndhVzFJdjJDOVBCeVRERklBZnFQQUlXZUt3eHF2Qm9oQkFTY01EVXA2?=
 =?utf-8?B?VW04Rmdlb3RxSVJxUi9lcjMzQ1ZSaEIyc0F5YlFranJBYjRSempRZTd1MUZM?=
 =?utf-8?B?SDdHRElJWElabkRoME9zeGtsSEdEMzBIYi9CSUd5M0t1YVFpS1hEMFBHRFBV?=
 =?utf-8?B?OGZUdStsbW0vbkkvYWhscVhxNGFUUi9iclF2VnBaN25RelFObWVWMVZoaGdC?=
 =?utf-8?B?SGlRL210Q1I4YkVMbVNEeVRPZXVmRlF0bDNybW1xVi8vemVvTURxMkpadlJQ?=
 =?utf-8?B?TWI1Qlo1R3N5YmRITUlrUnJlSTRDZmtmcndCTExhVndFU0dVR0ZnOXNNYWhr?=
 =?utf-8?B?cW1XUDkzTmxpMTVmSEIzeXlYWWZYTG1kM3Z1dno1ZlNpSnNsM3NSZHJWTWpR?=
 =?utf-8?B?NnFJT1Z5TG9VQ1FEd3g4WWh1aDFoL1F1cmFBNUVNRkVMQWNBMjhWcG9mRXdv?=
 =?utf-8?B?Q05mNGJkUUtmMDBiM2dKdUFGTjdMajlLTE5rVFJmOU10Nm5RRWVvZnQvdktj?=
 =?utf-8?B?VHc0WTRPS0JHNHRuVGdtMXZKb2t2S3FUdmNZem0wTzZkSENOMTYxSCtpaDBm?=
 =?utf-8?B?QjhCYTM1SlBPSGFkYUVPOWVqYjd5QzVkblQxSVExRmVXRWxjdlZxZEhYTGh0?=
 =?utf-8?B?WFE4ejQwS2UvcDdpcDFMbElGejBNTzFSNFRETkpQQlprWDVUUmJ0U3YvUFVr?=
 =?utf-8?B?NVVPTVZvbW5PMnRNdmtOL2cxTDdaSWI0WTBQV2swTXpZZDUvRFZId3FUbnVR?=
 =?utf-8?B?blVDcVR6YmQxWDZkdXFwNE1ObWVYdWxIKzcwZFZRYmY4ZDNQaVpucCtFVWdV?=
 =?utf-8?B?K1JWaTk2ZlRvOCtrVFJuWC9NNmVsR2U3Wm51czMrTnpPS1lNR2dINmxGVWxZ?=
 =?utf-8?Q?U7JboaTcJwTvCQjeV88vkVENfU3GaE4Gi8oqAcklFk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34a3df1a-e610-446e-04a2-08d998eb31e8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:43:37.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fz3VTwSanyw8C+kT41nRrQT+CUcG30K1mH+PoZmEBtoceiZr3fgTHwWXjHN9AmwD2f2nv1Qs3Aj6lUSSRKjRIzA7p+y6wjxaa4uoYJ5zU3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1306
X-Proofpoint-ORIG-GUID: EcNyb4pbDeVlpcxp1c9qaB6dCXCsvsBh
X-Proofpoint-GUID: ieMR4sy2x5AuUZ5EOkNZN8P7QIqPSmPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 01:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157471

On 2021-10-19 9:10 p.m., Randy MacLeod wrote:
> On 2021-10-19 3:58 p.m., Richard Purdie wrote:
>> On Tue, 2021-10-19 at 20:37 +0200, Alexander Kanavin wrote:
>>> On Tue, 19 Oct 2021 at 20:31, Khem Raj <raj.khem@gmail.com> wrote:
>>>> It would be wise to hear people who use rust and develop applications
>>>> using rust, meta-rust is being used
>>>> to develop field deployed products. Again I urge you to think with a
>>>> little bit of wider scope.
>>>>
>>> Look, it's just an example of a recipe generated with cargo-bitbake. 
>>> Where is
>>> this
>>> cargo-bitbake in core, so we can test that it works as it should? 
>>> Until it's
>>> available,
>>> there's no point in keeping the recipe.
>> Rust is a story that is more at the start than at the finish and as 
>> such I think
>> it is too premature to be removing this just yet. Having a rust recipe 
>> in core
>> generated by cargo-bitbake does have some value in its own right. I'd 
>> hope over
>> time we find the tool becomming a first class citizen in core but that 
>> will
>> likely take time.
>>
>> I am curious about Randy's views on this.
> 
> I can see both points of view.
> 
> It is nice to have an example cargo bitbake recipe and that's why this 
> one was added to meta-rust and oe-core:
> 
> https://github.com/meta-rust/meta-rust/commit/49d94ef0a74bb3274ffcb3fe25011b64865b80bc 

Ok, I've looked at this for a little while tonight and I've changed my mind.

We should have an example recipe generated using using cargo bitbake.
Maybe the best example is cargo-bitbake itself!? See below.


I see that rustfmt is not exactly an easy package to serve in that role 
so we should
remove it. rustfmt seems to be tightly coupled to rust's internals and I 
wasn't able
to easily compile it even outside of bitbake due to a rustc_ast crate 
fetch error.
rustc_ast seems to be a crate that is internal to the rustc compiler:

    https://github.com/rust-lang/rust/tree/master/compiler/rustc_ast
Have I missed something here?


We could write a cargo-hello-world example or use 'simpler' packages 
such as
ripgrep or fd-find. The latter two packages still have ~95 crates that they
depend on so they are not exactly simple. That's why I looked into using
cargo-bitbake itself as the example.

Does anyone have a better existing package to use as a 'cargo bitbake' 
example
that has say fewer than 10 crates that it depends upon?

> 
> 
> It's also possible that some users would not want to use anything except 
> the version of
> rust and associated tools that are provided by oe-core and that populate 
> an SDK.
> I don't have that requirement yet but I expect it may come given that 
> some organization's
> systems are tightly controlled.


We can consider adding rustfmt back if we find that having it in the SDK
or eventually for self-hosted development is useful.

> 
> I started to update my cargo-bitbake and the rustfmt recipe so let me 
> finish that and we'll see what makes sense.

cargo-bitbake depends on 170 crates so it's not simple but
I did look at using it as an example anyway and so far it's failing to build
with the error:

| error: failed to run custom build command for `openssl-sys v0.9.54` 



I'll fix that bug next, hopefully tomorrow.


I also found a simple overrides change that I'll send upstream (1).

All for tonight,

../Randy



1)
git diff

diff --git a/src/main.rs b/src/main.rs

index b2ed5d0..0fe5159 100644

--- a/src/main.rs

+++ b/src/main.rs

@@ -360,7 +360,7 @@ fn real_main(options: Args, config: &mut Config) -> 
CliResult {

      let git_srcpv = if !project_repo.tag && project_repo.rev.len() > 10 {

          // we should be using ${SRCPV} here but due to a bitbake bug 
we cannot. see:

          // https://github.com/meta-rust/meta-rust/issues/136

-        format!("PV_append = \".AUTOINC+{}\"", &project_repo.rev[..10])

+        format!("PV:append = \".AUTOINC+{}\"", &project_repo.rev[..10])

      } else {

          // its a tag so nothing needed

          "".into()



I should look into that bitbake bug.

> 
> ../Randy
> 
> 
> 
>> Cheers,
>>
>> Richard
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157247): https://lists.openembedded.org/g/openembedded-core/message/157247
> Mute This Topic: https://lists.openembedded.org/mt/86442640/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


