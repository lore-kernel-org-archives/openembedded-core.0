Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3F4C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:52:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2715.1655286751781952767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PxbVdAlR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3165e32012=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25F9nWOQ007074
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:52:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=e4FnimcJ3CIc7CfGawrfhAJituybmrjWHpfBSKpXNUA=;
 b=PxbVdAlR1u0uc5D6ady8BSqvasA9egraumr9XuBJ0MJ8Hu+8arSO5F3Dqx8Wl/LFlkp+
 l4P/XRvx2c5eY1A0qXpN6lKVb4VbkJfr5+Wn+331QEVmUd+TnXEh5KHux1RcW34uQyl0
 D75HUu8IdyLbz+Pz5T0LgUrRn59wCuTs4WqNqIPDlyP3L8U9uZFmkfLJItsxbgwRTZ+4
 qcxwE4QHE8Ngo53FbBtstvkdi9pUYNzJmLVcMP0FkCqA0Tkc/x5wRKKO7dhtloesAPUo
 yOllQ/SLX0WzajuTsZecXfBplNVoMReNg5LgguFokMdqQDCuDcUxBn+MawNrXyNaiR/h rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkjxdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:52:30 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25F9qT1D013560
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:52:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkjxdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 02:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXGX+A5hxS78wZizRMO4VFohQyh9DE2YZUj7BVEF6gvBAxsb49IYwqOh5UR82bVo6AwTbjW30R326wDSAku/W4XlQvfy86Xvj9/RTmYfcm2YDUKY30jsqvNhXLQoDINpIcf7xRqjaDkVMo3n+ogThR2upAR/vp4JCWCAPaqw7eF9vf4IkXJKzdZBudJWKHmx32g2jGWuW4D7JazMqOkONuItV64ozShOTPq4zDEMy0K88a/AATlZ220M7nqKt90jNaxUXnAIsAHNR5/AEoWpn7m2opvUylRsfudZg0YLVYTld/hLWXvhgQw5B0txdlHw2pLajuZvh6j6C65b8ND4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4FnimcJ3CIc7CfGawrfhAJituybmrjWHpfBSKpXNUA=;
 b=cqoQOt+fx5Od9V/ugAodsykhtUDQwsTJWvsSL7KnbkPtKUZMnJqTyFsku3URDlVj92hBM4jort1MNPe/zbdEnanjvpVh1ddW8wNz4MvsCMRgK3Srx/ISarF5ceolbeRgW/YuYRG5F51cYuWnfXU5OyanQ7XUajHhLr7xrS5HnrOVmq+t9tdCnCSzEdmxkurGAQMH10L7mkTyi1jeWVw5WNcZ76OvtKxaupcz5NFwTX3GPEfyMH08mA65okh4hWQxiGqcyrAuO8OPwvIhRSaEfs7icLgOSSv15SVqdrfCtR3SVJfNY+pURnBcjR6eeZdSiWEXjX1aDczQgOB+buPhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by DM6PR11MB2651.namprd11.prod.outlook.com (2603:10b6:5:c6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 09:52:25 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5546:4a07:9377:35b4]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5546:4a07:9377:35b4%4]) with mapi id 15.20.5332.021; Wed, 15 Jun 2022
 09:52:25 +0000
Message-ID: <eed5a04c-b817-b35f-aff9-0580a21733c6@windriver.com>
Date: Wed, 15 Jun 2022 17:52:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH 1/1] wic: Use ROOTFS_DIR to locate pseudo_dir
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1655274860.git.liezhi.yang@windriver.com>
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
 <YqmJk1TfiiQwvKWl@mail.local>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <YqmJk1TfiiQwvKWl@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0111.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::15) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dbce1f4-7c57-4ca1-0d2c-08da4eb4c055
X-MS-TrafficTypeDiagnostic: DM6PR11MB2651:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB265105907ECDAD9FF791CB06FFAD9@DM6PR11MB2651.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmsUY2y4aHNGv37nPOBbk8yHVT695E3NGGUOLagc35TB04vZdoYrKZrSa3bSZr2g+bqbZuOvKfdORBO5B1+BV/jzQdtmJJVnhqwIE7fqu5C2nr4d5wrEipbUXqpJF8jkGUYdIPMHW1IjaE2JnZ6/Sq/g6A/9S9BdTPgOzW5wmM6PZjNDYW5Yvm0flmIsf0ksx2oHm/VLr7r9IsbZY9XWddl2v2+Ms+AKQ0uisy1TdDArGM/MhN7IjxllB85ov56BoCnRg4khoMkCVG1bEebCj1xcFGQfGF3fqtyR1laBzbF8FE8o2U/1jJmX0FXPxUcfyoCC++pQdm7PFNov64oAeQC7Z7oM4orjrCjFdpeNcYNe9WYPDO9i+2QhxWsbuht3CsztXjnKPd7UsPh3lBHi1Jl6sCF9vjN5Mk+2IGYGOn/12Vk48hPzI63TLMtVJEhSb+Sa28R0ujVHaIIyX5uR0KaoHVt7qWJ8wYohIhmECwSW+3pMplqmnl0s6lfM7UpNQ4WSQz2dQQdKc26nvyUsSC1dN3VPYovw3Lrn6lsUFyC0GVzk8zh+5miZCD0Gf5GjGftR9COYXpaVKa+dzb5yyJeVyv4AiSJuTRAOgyezHhA8jJxIe5B1BzOHgRTZ9WPbHTeLWNV6oF8UgxPnETLg8DInVW/faBxGIFZTmAmQ/YVv6tuavLh+3iRl3HGPjTaHrrYR1VRX4Q7jYCvGdSGlfSfIQZM0axVv2goJgq3DqOqiaAkWdKLo7IihrEjPBHO8B8DM2sW+Hbu3JZAavy+hWXyKzmTEqcCRKq3e89B0OZhp0wQ14XbE+vnNGjcUIPxm/89HvxF5x9YFD12lO1PHI7LjAWHPaX2pApkNOuqgDD9NKmsjnmuBy8dZnJCWwy9qVULSBTxgwnwzHqaFaF316Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(38100700002)(86362001)(2616005)(38350700002)(31696002)(66556008)(66476007)(66946007)(4326008)(31686004)(36756003)(316002)(6916009)(8676002)(2906002)(6666004)(508600001)(53546011)(6486002)(966005)(52116002)(5660300002)(26005)(8936002)(6512007)(83380400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1AzQm1yOEVHTnUxSkIwM0RQRzVYWE5HM2taZkhQV1VKbE9FNURjdlhWTElP?=
 =?utf-8?B?OWpOemFiajA3YzUyUFpCMVRlOVhWb1VhSE5CanNQTFZOcUtjbUZoM0g1TXNB?=
 =?utf-8?B?eFM3STQxZVBDUmhNd2Zvblcra0QxeHlvaWV4VTY4SXFhTEQ2M3R0R1QrY1Bl?=
 =?utf-8?B?a2UxalFzakxDdjBjeUR1VjJXbS9xcWd1TlFuaDZmS2hBZ21SQXRoZjJxU2cy?=
 =?utf-8?B?amlrK0phenRXTGVqUGYyS1Q3c3pPNVJCMnR3aWYrYlhSK0N5YWxBeFNKVUFl?=
 =?utf-8?B?ZTVYR0tYbkkxem1JQm0wOFJmT0Z5eG1PcFRCU1dyVW9sRTl1VkRqbkJTVis3?=
 =?utf-8?B?SVdkeDBjOE5RbEFpZlRBekNhc3Nld2QzemROZFF3dllXRi9wd2p3dmVPYUF2?=
 =?utf-8?B?UXcvTVZ4Q24zMm5UR01DTG9ZbHFldHd1cllyazdUUDFHTFBsTC92bW4yR0Y0?=
 =?utf-8?B?YkV6WUNtQXpJR0s5QzNRcjVXWUcvdDFpMTJ0b1dGL05Lc0lqNXhnNjVHNUpz?=
 =?utf-8?B?cmlPYmpDV3pwcW9zaGlvYVVtYitiVmZOSUZvRjlPMVU5cFV0dkh5djhVWmxq?=
 =?utf-8?B?Uklyd2hLYlVpVDQ2cFlBS21ScE5rVzJ4UnRGRncvTTFNaitYZU5QazZSS0pl?=
 =?utf-8?B?Yy8zdjYzSEhRODdDUzFtVkFsdkthZ3hva0sxbGF4dEhwRUNaSXhnWWxsbjQr?=
 =?utf-8?B?SXVueGVYRTFvUVJwWG83SFFYVDZSSzZ2ZTRkcnJ0UW1aeW5xUXAyeVFKRFU4?=
 =?utf-8?B?YW5XMTJ0cDYrQ0VmVE5XVnJuS1BHTlFON1p2d25tcGRWdzVya3VITFR6bmhQ?=
 =?utf-8?B?NUlCd2Z5TndMcjdZYjBPMEhja1IyaUFQNHVyQjltQXFWOGF2ejhtMkNid2gy?=
 =?utf-8?B?c3FuSzQ2U0Zta2g2bG83YWttKzVySjU2aFZ3YktSMmZPdXM1cHViZmVReHh6?=
 =?utf-8?B?c2dZaEdSSDlEell6aEx2VGMxUGNOWTJrY09HUlBWaU9UZGxaN2x0SkhlTDda?=
 =?utf-8?B?ZzNFN1VHZ3JRVEVVbU5xaG5zYUorT2Y4a1gvaTZPUzZHbTNXaXE0eTR0andm?=
 =?utf-8?B?cHJMVlhZWFU2aUd1U2Q5RU5MZXpMWFhNWnJwMXA5MUVEQXF3VWswdzNSQjAr?=
 =?utf-8?B?OCtYQlVlRlBWVUNiUHpueW9vTW9Pb3BiaEtVR2ROSGlhTmtVaGliaWxXSGda?=
 =?utf-8?B?d0k2WHY5alZRVjJpbmhaOVdEbHhTWWs2MGQ1Q0diQ3p1NWZNVm8zSmRaRjhT?=
 =?utf-8?B?VW03R3VmQjgyRHQyK1paSU5pYmNSaWFkUXJacG54ZE9QOVZYSWczK0pKb0dv?=
 =?utf-8?B?cUNKRjBwdEU4YTFnQ0NvK3JVR2RncWlkelFDbnRneVZiVERMelppZi9MdlBF?=
 =?utf-8?B?TFhQT085QW5Ld0lHaGVuVnMvTUFQdXlJVnhLSm92eXdxNFpsNkhmM3ZXSVVK?=
 =?utf-8?B?RHB3TFpsbHBaSUxPN2xLdXpqTldxTllYUE1wRmc0SVlyWllZSTRhY2NGL3ZC?=
 =?utf-8?B?VEVRRStYd1FCbXA5aUdWd3UvQ2ROVUZaUXR6b0FPWGNVbEZ6Q3FpNS82YSt4?=
 =?utf-8?B?TUhCL0l6YlhxcUR2ZFdqU0svZGtBeUI1Q2NaUVBubHZtVytqUitFOWhJYnlx?=
 =?utf-8?B?SncxalVkaERhTHowRFNCQjdZQW9veVhieGFwVVJSODltekpxN1VuczdjWHRF?=
 =?utf-8?B?ZzBqTmVpTytQTDlxck9rVUFyNlNGcEFKaTRaZnVWMjVLTUVUVm5mY2h6NWtT?=
 =?utf-8?B?RjNDekpPcTZTZ1ExQ1JxVUk0R3YzaSs3Uk9Na3R3RXNiQnNPbUd0MEZGZTNJ?=
 =?utf-8?B?My9zK0VvSEpSd1FHaGF6c2pWVEhCTUlGQnZTbk84eUsvTldObE84bTRsSExs?=
 =?utf-8?B?WktqWHNsZ2FSd0tjSng5cG9xRmNuY3dXcUJtMDI1aHBkVldOa2E4TWxKRlVY?=
 =?utf-8?B?bG9naVZLV0dockU3YjJBdHJaanBiS1lseXBwS09MRkQ5RHM5RDBDYTNIb2Rw?=
 =?utf-8?B?YS8xclZTNURNMG5YQXo5SkdWWDBSUlBuVWt1M2J4STFobThKMHI0b0Q2MWxE?=
 =?utf-8?B?MFF3MUo5cFlOSnh0VVlhamNtT3V6VGUrV3JNWEVHMmhreHhZazVFQzYwUUFm?=
 =?utf-8?B?MnhZaVpTTUFHbTVkSFYrRWx1VktITUxXM1BpTWZrN3A3MStyOEFjUnllN2Fj?=
 =?utf-8?B?SXM3UWlKd2dTQkErZDR0SzVNdFBza1Noc1NPaTRiVHVZeThCMWZFSWowcExN?=
 =?utf-8?B?bDRHSnlXQjlQN0xzYUtBbU9aV0gyN005ZU94ckFhZWVDKzZyR1RWSS8yNFBS?=
 =?utf-8?B?TnJ3OGVxZkdPWW9IZmZQaCtDd0VUQnhmdHBMWFdHSWI4dEhVRkYvN0xDY2o5?=
 =?utf-8?Q?QQlQ5Td6NqGHcwdU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4dbce1f4-7c57-4ca1-0d2c-08da4eb4c055
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:52:25.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GJFBSftdkk0pVRuNK5AASLmxjjfgxd97qseOWKI+JhYWXaQU12dsZgCOfS9TfeRH4q+t1qI1nd/mnuVM+/cOMWeaNNdu1rAyuILp6jL62n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2651
X-Proofpoint-GUID: g-TTRPEgdyR3rkWOjI1uKJooTHBOEQzA
X-Proofpoint-ORIG-GUID: AmD1mDrRvR9ibbAidxbpu26MJ6TyQWro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_03,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206150038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 09:52:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166925



On 6/15/22 3:26 PM, Alexandre Belloni wrote:
> Hello,
> 
> On 14/06/2022 23:35:29-0700, Robert Yang wrote:
>> Fixed when wks is:
>> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4096 --fixed-size 256M
>> part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 --label root --align 4096
>> part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M --fsoptions=ro,relatime,sync
>>
>> $ bitbake <image>
>> $ wic create <wks> -e <image>
>> WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and permissions will be invalid
>>
>> The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
>> ROOTFS_DIR to fix the problem.
>>
>> The patch is from "Rath Anil Kumar <AnilKumar.Rath@windriver.com>"
> 
> We need a proper Signed-off-by and From: to reflect that.

I got the raw patch from a website and added the commit messages, so I didn't
add a formal 'From:', and yes, add it would be better, but I can't add the SOB
for others. I've added the 'From:' in the PULL:

   git://git.openembedded.org/openembedded-core-contrib rbt/wic

     wic: Use ROOTFS_DIR to locate pseudo_dir

     Fixed when wks is:
     part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat 
--label boot --active --align 4096 --fixed-size 256M
     part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 
--label root --align 4096
     part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive 
mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M -
-fsoptions=ro,relatime,sync

     $ bitbake <image>
     $ wic create <wks> -e <image>
     WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and 
permissions will be invalid

     The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
     ROOTFS_DIR to fix the problem.

     From: Rath Anil Kumar <AnilKumar.Rath@windriver.com>
     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


// Robert


> 
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
>> index 25bb41dd702..11b09c1e80e 100644
>> --- a/scripts/lib/wic/plugins/source/rootfs.py
>> +++ b/scripts/lib/wic/plugins/source/rootfs.py
>> @@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
>>   
>>           part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
>>           part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
>> -        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
>> +        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
>>           if not os.path.lexists(pseudo_dir):
>>               pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
>>   
>> -- 
>> 2.33.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166909): https://lists.openembedded.org/g/openembedded-core/message/166909
>> Mute This Topic: https://lists.openembedded.org/mt/91771589/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

