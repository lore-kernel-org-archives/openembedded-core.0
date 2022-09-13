Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D321C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 21:57:39 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.1187.1663106250053614546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 14:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com
 header.s=pps11062020 header.b=svcKDBPj;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=6255e05756=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28DIbMva012751;
	Tue, 13 Sep 2022 16:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=rxl4XrQJR1SakWy53BXEc9S1JraAgvgKD2GCC2kXQ4A=;
 b=svcKDBPjYnrCI3eqe7l6ejcIHx+cpv1+L1wqObpf0iKBpaPyI1/ydcim8GvR86eRSK1U
 VhDzzGOLH9w9BGF2CvWkqyKZXKBDdjYNVAsNkciIVU+YghHHQ7aoJ0ec/Kd1aebRVSWe
 /RoglvVwmpci1h0jBRTHi9qv7dECiGBgllPRmIqafuNzQg60SH+SfoDntfQxx958vgv6
 e7+P7Y72m1CcbbXrIlcFyqrc8xtspNxOTPcnJ9NV99SqKI+rYJAmpu8tEJSlSx50eGEQ
 KRPGLXvbtAOMqxINz5xtAu+Xc5GLTNqe8+AThWRK4aCnUH4LJyMms/PWB4oNf02bYKY9 Ag==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3jjya70bwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 16:57:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQPdWirnsAmYYHqHiSCglwmK65sNUBGuOsUsuuJLBstVMn+613a2DdhrxSrfdBUJ3o9JWOGNm3ckQLSCvhmpOGRJZbuEo2ShdzfWkX+U/pqUeCkjfJJLM5D9tK26zRdF/HRyg8WxK1fbZJe56NwdExFdjYqL1r5A7wdfTY2ZZfbxvCByUXCl/Q14/G3C4LVcGaVy0s+TsShVXEt7FnJDikMaoj79yxWeuwWjbXT8eUPIUEgUA8AhBId3HXYMGyAXtlrgPMRJYSJqLkfRHdpYZuhXOmPGg+46BcdAAoxLA8R3pDkFlC2e9PdCmEVgNuP4I3Yl2JWu7Ab40cq8zY5CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxl4XrQJR1SakWy53BXEc9S1JraAgvgKD2GCC2kXQ4A=;
 b=QysVcp2tJoQKRHUaytS1HSrmRveDY0Wu+/KtI3WydJ/LYQLWzU+CVMOdTc24OVDbCIbANS/DSBxM/SDnK9ZN8mfoS7f2UPnMa5//d+uPJ5mAkrp4RKz+G+C3Ez+FJ9OPX4+TRJNmywHrBlqK9a2hANhCL+OEYZWHzC/+LB2KpF3IZU01BtnapmD9TqP0sGa+kgeznPq/4kQ7JIqPIrLLnMjweanEAPQkBljjPv8f4JYKJ5BH1X2w75kEVHR/VE1/ERhxwbFmOvZCkY8wh2Wst9nEkzWiy3hfD8mkpuGi98a0kgLiOMtScjbN5FVpOUm6FVCpMvrpzb6x1ymO6i2eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxl4XrQJR1SakWy53BXEc9S1JraAgvgKD2GCC2kXQ4A=;
 b=nvuSNDRX/GCnbJeomysBLnMw9WIE9/EU9uaqSKwwpYysb1nPzO3O+jrci7IAM5yf8x6KT/Es4bmR0SOOKy8qHJtuD3RYWjDpEZqzY36c3/6n5Ag8/TKKQ1+JT3Dp4a8yPcO266tEzTQo9cHMwftzggenIWE/tFSWa8YvIFwtWd4=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BYAPR04MB4376.namprd04.prod.outlook.com (2603:10b6:a02:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 21:57:24 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 21:57:24 +0000
Message-ID: <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
Date: Tue, 13 Sep 2022 16:57:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Alex Feinman <afeinman@snap.com>, Khem Raj <raj.khem@gmail.com>
Cc: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org,
        Etienne Cordonnier <ecordonnier@snap.com>
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SA9PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:806:22::35) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BYAPR04MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb65ae7-22de-4771-72d2-08da95d2f0ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LZ7y+H2ZXzVaHCnlvc8CRUqX2Csd2zAxAiP+NwFtQNHMpGdcNh0gx/CTnAjfBndHagUCEOewr6rTGA8dFGbjUg1kzvcCpPVkeaPxDvpTCfK2iMbEGN9uxSIqyKlVJ1BfHGotqE/6V9w88U8iloFgI3JpFHyiGzUv4UgHSHG66JydpgIni9PVctO76ofnEA/8jcOSA4SLQD5LvlWiYSnHMFKp/T6sKZWLe+J+2f6IG3ZmqV/3NqhMnM3ID0PZcDz3R8zMbCSD084mh7dEpncIRr1VNF4mxJEunJNGF3hJ4UKUDWx6+wZecmHbRdZxk12lVHcHO2rQBtudqnd4dTGg6lIxw4ZoZLHAIv6PU3PekSGZj+0xN7QuR1y/6vVe54cbmaQWIy+Q7c2rg8LCH41ft2kcya3ETnZxgxfItaO+7KJoeS2Nyo7Pm5majCKUQDe+CuNN0ezaqaOHBHI5kEOESuwVfo4bR0B6CnNMdjtC07IktypL3OqWubqqXR1OUAa18f+CiYyWv+0vouetV0DAFWM1VaVK5sHD7WNc8KkldLEgLmdDt11OW4BVDx6KO1k4y0P6oDVS0olbzqMiWH3zxhdWyG/5Tfnc0W7UM+jsvkk4o6IJcis8GFW9nin9rniCHuYX3nDPYoOyRn//KfEedBmWnsWFBRZnBb5Nlmr2PFUKxi2Gw6TCmTMDkskiLW9a0JaTHbkubbcuIquzk0Uga67Q8/kgqjnTkRiEzowUkDCnUXCl1QPujY121rivnjUKND9KXX4sbenjcLFWuio9ClpumRZO7xfq63KBRCv5vyQ72g4M2yHLyRmLnR2MscgZBw3bmWhZaxbU1Lti3b5Hlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199015)(6506007)(8676002)(186003)(66476007)(4326008)(66556008)(86362001)(31696002)(966005)(26005)(66946007)(36756003)(31686004)(2906002)(478600001)(41300700001)(316002)(5660300002)(6486002)(53546011)(2616005)(110136005)(44832011)(8936002)(36916002)(83380400001)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTMrazdqclVQdzlINVF4RWgvTFVVSVlJRjEvMVFaQnZXa08vYmRkWFhNb3dN?=
 =?utf-8?B?Mm4xVElFR3crQ0p2cTAxbmp6bnBuazl2dWhIVzQwV3AwOGRqNFhuMGlMRkRs?=
 =?utf-8?B?YzNiejcxNjFtc2dsM3ZpNlRJaERTeTZrZmNOaFp5NWRPK3pRMURKVXFYY0du?=
 =?utf-8?B?MEFYdUNVRFc5K3UzV25VRFVFNnFHY0VMV0EycEdVMmhnUjROMkxOMlBaZkll?=
 =?utf-8?B?L0RsYktTaXNIcjdpaDdnekJMMS9zVi9wMStKaU1pSXcyWXo4N0o3K1pnMldO?=
 =?utf-8?B?V2dITGV2U3lqaFBHM3I4TzJrczMxMDNTM2UwZDhwSTl3OTRIT0xuR04xblhY?=
 =?utf-8?B?dHl1dGNBcmJDanh3UExIMmxyNTI0M2xweklRNkRoSHNXSWhuTi9ZOFhkNHFv?=
 =?utf-8?B?ekhsYVhQdFVES0haNlF1Q3J4MVNCQzZ3SS9PS1ZsMlNlSCtKR05lZ29FZWY2?=
 =?utf-8?B?QlEvNXlRaFk4emQ4UTBldWZTUTZyZ2c2bVoxTjNnVHZ5THd4d2xJM3FOWHMw?=
 =?utf-8?B?aUw5RGF0YStGL2Z5d1FlbUVTK2hqZHQwK3J2cDVDVHFhK29KNzFNTkpTcjQr?=
 =?utf-8?B?OXRHMXpVVGdLSXlsSVN2clBHZGdVbjlXYkIvaTVjbER2MzNNQWtvODFrN2I0?=
 =?utf-8?B?VCtUM0dSZDJOaFdJdGt2NVhjRUlzaEczWjV3TnM3YkNpKzQ3OHZ0dVA1QnVM?=
 =?utf-8?B?QWdLNnRpZW9GZ2hKNEtNTjEyMlhHRTltb3gvYmJyTE5XMm5NblRwZitYOXFl?=
 =?utf-8?B?MnJDK0l2dklHak1CYWFjVHRkcEh4WGw0eHdZejNvQXpRbGVvR3V5bitKRmhM?=
 =?utf-8?B?UVEyV1ZnWUJXNlJKNldXMzUwbjE2MmJ0RjRTem55QVQ2YU1aeU1HZ0w3Y1Z6?=
 =?utf-8?B?NUs3eEtpMG5jTmFMR3VsOXFySHZmOHdTMUhXUHJZanYzR2srOU1neE5XQnd3?=
 =?utf-8?B?UkV2VDZadGFGb2tVWTZFOEx6TkltZFBKQ2VsRDM2VlpROHBGQjVWenNKUXY0?=
 =?utf-8?B?YWh0ZmZkRW9zb3dIUzRUUGdJU1BpeEZySURNK3MwdDkzLzcxUFU5ZS9qTGcz?=
 =?utf-8?B?VXgxSEswSEQ4MzRjYmx6cWVxN2xwZ0IxMXlkU2xKL1pRZWFCL2d3eHpuL25K?=
 =?utf-8?B?L3FKbk43MmNzYlJKSEtTWnRyTUJPcyttWTVUMjAyZWZEWmExUGRqZ29OUitN?=
 =?utf-8?B?Ujk3NnhNMXl3dlFGSVpaaTVMNjVzblBFOWc2SFh0RjFmMFBwZWxwNjBUNjdB?=
 =?utf-8?B?alpvVll5QTFNY2xoekFtUzczZmVvZExpaU1PVWFiZVVpZFFjRTBXNzBweFZU?=
 =?utf-8?B?d3E3RmZOMFFOQVBrZnlpUnRKeDVqcUdSYy82RmFFSUpiR2xHWklhUENVQ21m?=
 =?utf-8?B?aS8yeUxiV1REYmlLOWRNZzdlSTFBVW1BNTV0UHNvbElvWkZaa1J4VlVselZP?=
 =?utf-8?B?R2twTlV2WjZxQVB0V1dUcUVEcTRPL0ljV2JPMWVVQTNod1pnOWVzUkhWd2dX?=
 =?utf-8?B?YXlUL0htcXU1TFBYNHFWUHRySzhuaTVpdy8xUU5nbVluMWxUMWttWmRKNDZG?=
 =?utf-8?B?a2dCYWZFRmd4ZEcrQnlxeW9Hd0FKTXF2UHBtelJVQUVDTlQ2TDBrb25sLzlx?=
 =?utf-8?B?a010ZEdOMXBqc3pFSm02b0kvZTN6YlZaMFpFL3k5OW8xdHRpeXFNRk1jY2k4?=
 =?utf-8?B?SWFrZGhPa1kwQ0huQy9uTSt5czdXbC84U044bWUyWUZlbmhDRWdHbFQyMW12?=
 =?utf-8?B?cGtSeThPN005aU10UDd3aHpMVDZGOGxNMlFJR3l1eTJxMnN3RkZkMTNYb3R3?=
 =?utf-8?B?YUdNZ05aa0k4Uk9YUzhEQzBhT05oNWFYSHQ5VkpKSUpNRTltUStEYWpDY0Ix?=
 =?utf-8?B?dHJGNkhrUnVLVXVXZDJDTjVyUC8veHBZVnI5dkhPc3BJTW9QYlN5TVh4dXJJ?=
 =?utf-8?B?Y1N4VXRBd0oxbGtaQmMrM2psYUErL3hZd1NNcUtibzRHTE8yK1Q2TWp0bm9H?=
 =?utf-8?B?WDkvM1psYmUwQ2E3Q0laK1dIQmt4WWJPNnBmOWJVZWd6L2tCb2xMWE1zSjEv?=
 =?utf-8?B?WnZMRmd6cytSNjE4S2NNTkRoU0c2QjZvZUN3dFUzRkNPazBucVo1ZTE3dVZ1?=
 =?utf-8?Q?kv5TH7Y/XhrQtuPqoqlf8hBM8?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fb65ae7-22de-4771-72d2-08da95d2f0ca
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 21:57:24.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u83XTp5li4YXz+tecpT1NBal4+jJbpkRyrnjUgYCuMEeU0Hrrm6hDVeOJBq5TB1uYuCOBPEn8BvZiFNuqRYFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4376
X-Proofpoint-ORIG-GUID: lCbIiO46XbXQMf8bnU5lIdd32lpAWhOb
X-Proofpoint-GUID: lCbIiO46XbXQMf8bnU5lIdd32lpAWhOb
Subject: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_10,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 clxscore=1011
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209130101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-00010702.pphosted.com id 28DIbMva012751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 21:57:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170613



On 9/13/22 15:20, Alex Feinman wrote:
> I do have some numbers. When I was selling this change internally, I=20
> did a comparison on our internal build.
>            Combined write IPK times (=CE=A3 t do_package_write_ipk)
> xz         162m 35s
> gz         52m 13s
> zstd       33m 49s
> Compression rate for zstd was closer to xz than to gz but not as good=20
> as xz. For systems that have to cache packages=C2=A0on the device with=20
> limited storage xz might be a better=C2=A0option, but for the bulk of=20
> projects zstd is the best choice
> Additionally, zstd offers much faster decompression than xz so the=20
> rootfs build step that includes unpacking all of the ipks, takes 3m=20
> 58s with xz and 2m 44s with zstd.
> One other thing of note - if your build includes debug packages, some=20
> may be quite large. E.g. one of our components produces a 2.2 GB debug=20
> package (uncompressed). On large files xz requires a disproportionally=20
> large amount of time resulting in 15 minutes needed to simply write=20
> ipk for the abovementioned packages, whereas zstd took about 45 sec.=20
> For frequent tasks like bitbaking a single package this translates in=20
> a lot of saved time.

Those are certainly compelling performance improvements. Assuming that=20
the final data-segment size is within 5%-ish of xz, then I would agree=20
with the rest of the thread that it should probably be the contemporary=20
default.

And if we make it the default compressor for OE IPKs, then obviously my=20
criticism in the original PR is satisfied.

> Bottom line - I think making xz a default package compressor was not=20
> entirely thought through. gzip or zstd is what the default should be.

ZStandard support was only added to opkg last September [1]. Before=20
that, xz was the new hotness that replaced gzip. :)

[1]=20
https://git.yoctoproject.org/opkg/commit/?id=3D5dead419e94bce2e6b743ad786=
c1daec0e1aa294

> One final note: I could not find a reasonable explanation for why=20
> opkg-tools require code changes to support a different compressor. BSD=20
> tar and GNU tar both can easily accept compressors that they have no=20
> idea about (via -I option) because all of them provide a unified=20
> command line interface for use in pipes. If this were done similar to=20
> tar, we could have used any compressor we wanted, including the=20
> multithreaded versions (zstdmt)

Well, presumably IPK creation tools can only support the matrix of=20
compression algorithms which your opkg binary can decompress. I suppose=20
someone could try to implement a plugable compression module system for=20
opkg. But given that nearly everyone uses opkg in an embedded context,=20
I'm not sure it would get much use.

>
> On Tue, Sep 13, 2022 at 12:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>     On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart
>     <alex.stewart@ni.com> wrote:
>     >
>     > ACK from me - apart from enabling zstd by default.
>     >
>     > On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!FbZ0=
ZwI3Qg!u0KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ=
2LdFx_bxrNjvo$>
>     wrote:
>     > > This allows the use of zstd for opkg packages by using
>     OPKGBUILDCMD:
>     > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
>     > >
>     > > Signed-off-by: Alex Feinman <afeinman@snap.com>
>     > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>     > > ---
>     > >=C2=A0 =C2=A0meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0=
KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65=
pBFo$>
>     | 3 ++-
>     > >=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>     > >
>     > > diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0=
KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65=
pBFo$>
>     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0=
KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65=
pBFo$>
>     > > index 7b351e8123..e38d9d6f3f 100644
>     > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0=
KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65=
pBFo$>
>     > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!u0=
KgIth5yNSO1tok49C5_xo0QPHIFLa4kZBl3vVZwB-2Ui1uYBW7nt85fKXXM_VAHZ2LdFx_-65=
pBFo$>
>     > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
>     > >=C2=A0 =C2=A0target_localstatedir :=3D "${localstatedir}"
>     > >=C2=A0 =C2=A0OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>     > >
>     > > -PACKAGECONFIG ??=3D "libsolv"
>     > > +PACKAGECONFIG ??=3D "libsolv zstd"
>     >
>     > Building in zstd support by default is a little suspect to me.
>     >
>     > Unless I'm mistaken, OE-core will only build xz-compressed IPKs b=
y
>     > default. So zstd support would be unnecessary for a distro
>     integrator
>     > who just uses upstream OE-core.
>     >
>     > For distros which use zstd compression in their packages, I think=
 it
>     > would be more appropriate to overwrite the opkg PACKAGECONFIG in =
a
>     > .bbappend.
>     >
>
>     This is perhaps fine. I do wonder if there is some performance
>     comparison data between xz and zstd compressed ipks
>     with opkg, it might help users on making this choice and also if we
>     should consider using
>     zstd by default at some point or not.
>
>     > Is there something I'm not considering here?
>     >
>     > >
>     > >=C2=A0 =C2=A0PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,=
\
>     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\
>     > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D
>     "--enable-gpg,--disable-gpg,\
>     > >=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D "--enable-curl,--disable-cu=
rl,curl"
>     > >=C2=A0 =C2=A0PACKAGECONFIG[ssl-curl] =3D
>     "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>     > >=C2=A0 =C2=A0PACKAGECONFIG[sha256] =3D "--enable-sha256,--disabl=
e-sha256"
>     > > +PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
>     > >=C2=A0 =C2=A0PACKAGECONFIG[libsolv] =3D
>     "--with-libsolv,--without-libsolv,libsolv"
>     > >
>     > >=C2=A0 =C2=A0EXTRA_OECONF:class-native =3D
>     "--localstatedir=3D/${@os.path.relpath('${localstatedir}',
>     '${STAGING_DIR_NATIVE}')}
>     --sysconfdir=3D/${@os.path.relpath('${sysconfdir}',
>     '${STAGING_DIR_NATIVE}')}"
>     > >
>     > >
>     > >
>     >
>     > --
>     > Alex Stewart
>     > Software Engineer - NI Real-Time OS
>     > NI (National Instruments)
>     >
>     > alex.stewart@ni.com
>     >
>     >
>     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#170608):
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openem=
bedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJT=
vjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESW=
Nj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25=
Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.opene=
mbedded.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbES=
WNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY2=
5Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D>
>
>     > Mute This Topic:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openem=
bedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCR=
yrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_=
pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.opene=
mbedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvC=
RyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I=
_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D>
>
>     > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openem=
bedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hp=
F_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D=
PxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>     <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.opene=
mbedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0=
&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D=
PxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D>
>     =C2=A0[raj.khem@gmail.com]
>     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     >
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


