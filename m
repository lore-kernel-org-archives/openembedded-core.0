Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5ECC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 21:29:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3414.1664832540593058650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FP6f61vO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7275dfec70=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 293JMcAG016145
	for <openembedded-core@lists.openembedded.org>;
 Mon, 3 Oct 2022 14:29:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/0EwzI/nkToyd5LGVX1n9yHwxcmrr9Y6dh1NdoiDZz8=;
 b=FP6f61vOSmcU7DEhKtMKfVbqZoJvNpr278nhpLc38xRPQWvnklmTT7HFTjBh92knmvCN
 jcYN1Ke+orAGK6k/KipCk9oX2jJnFCO4+ElD/V+GO7a35xDVZSD+CiUDUHM2AGczS4yp
 EBoODYy93hIOPnvevYTMfONqC9XgCr+IbbAbp66yjdg5ScYFzx9+pmcVNIM775NijtIS
 Css1mZkuw+JqzRWvaZUlmuMSZ7iuk44FHU2WyuhLJ002NJkVkks/VVqli2qztgchIDbI
 m83qjhoQalBYRNu6kmm3CKKukQWRc5HYmh+z4FBtUZFuo5iiNU4cRsN+U13rUbOztXh/ rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxgu4sxc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:28:59 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293LS0ur006466
	for <openembedded-core@lists.openembedded.org>;
 Mon, 3 Oct 2022 14:28:59 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxgu4sxby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 14:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gyt77fzU2ilm2cYPFU2IQT0wDhVDwHBc3zWgUHriN1w4a3MFjguaNDpFcTd4fana7QAbp+nXCPTZ7fOuj8gBihOzdJyp8+/Vmu7UI/djUUZB0r1NJ65HomdwbZE2+VVrdMF0GuXVxaTBH5LGIiJhfcglQEL8i//mlOzlGoMpr9bsWkdnxBnj/9gUHfvmB7q+HwgIHi6ntkcw55s9PHnAHsWnE9KeRuk8tAED3MB4mk+3+ZhXY6bA6JJ0lSdQS/BmZLPYPm74DR3wLRngpB7M6yaLs4yEjsf03I6T3puFUerVrXD+ZQEjj/jC0hqmx2h1lHUQ72dNBzDe7rqc52K3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0EwzI/nkToyd5LGVX1n9yHwxcmrr9Y6dh1NdoiDZz8=;
 b=GmjtN4Gkihq9RsThIJQUs4w9xQZnxTCzkcXQeHFy0aECNKM7k5z144C7hCSkrl94nax9n9m6l3mf7PhSs1VP87lfH4xiNzdG8xmi59FOKgvANTolUMzOhfVUFnt5j/AwJ+yxOz7jFG7UYkBu6uJCtnWzc/RS8T6oMZ4ozzh2EZouViR6ELlIVlQLMLKvBicCQDhA05QTFdMzRowmwHvLGkZDp0ybmggGpRUzHDQlQAWWTBavXwpqHCXBYlSBMxvF+bygfOpxqrXdbI2IgWnv/oHI8zvMKioQfRB74wlqbtxAX5uDciGMV/7XhY4k8ux8u49GpDv8g8KrCZ48BPcwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 21:28:56 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 21:28:55 +0000
Message-ID: <8a378920-9eb2-54c2-7c65-0938b2aa07db@windriver.com>
Date: Mon, 3 Oct 2022 17:28:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][kirkstone][PATCH 1/2] tiff: update 4.3.0 -> 4.4.0
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        openembedded-core@lists.openembedded.org
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, zheng.qiu@windriver.com
References: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
 <CAOSpxdYt8eAzcQH+HURXhf8PKJxEsmTMXwqvDQp6Sw3KXV+chA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAOSpxdYt8eAzcQH+HURXhf8PKJxEsmTMXwqvDQp6Sw3KXV+chA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4201f41c-720f-42b0-3909-08daa586466b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JxHsnYnpbdvZ0yVuK8+SNtHiq23bUiv4/bjkzu7WzMmFNxxmp1iDUwB8OMWsLXQ9d87cKwn74FW0V+2mkoAMbpvazNi6yJyobYHTm0bdiafmhcfhqrLndlUPWDtdvccTOt+9pK3SqEHsxAp934hy24F7FgQ1f02aRwBZPjNbra3x73xn7AL4TBWXGu894t5vpnCZEOcVc3aPlNsyq2AyEaNonOiDdJfz8fWIFUn6ayocqn1A9SQLIIOAHJNkVb5HrCm3fHH3cgg4l9aLaFwLhWMtmh5EnC5ncqqS+0P7IlUWj11PkQ6wyBNYZQ52fiw/diy2hXFSCP0r85ULGEqwOQ2fPVeiMjsgW/rS4kuuOaHA//BE+igQM2S55SXlI0rctM9w+LyH/8Zg5k3A7FXNV3T7lNFi3IjuSoQeKf8dPie1t1LxKz0jHyRvaD0GEaAQzilTWYWwE0r4in0CNCwDevy+fhM3WjN4tbzAsWYI4UVAI4gWY7ATlkcRYqgEGY6DqjK9sQKrl1FyvKuhOTSHpkhEJfW5KJVwOEChMW2uFPQ8/KWZpPcQ3ntWLllzHREiBzThtvdZvW8bnlPyh9JpR/mvxaND9RZPdiO8cUz498GQ1LTTA89SDRr9dEYPe8NKwlXCPcxYS/tmJke1m9kmaC8vww5jj76ngvAkLJcuRHT0fOjsSyJsakJ22ainmg5qkqG3XVy00kTA3NDO8a1yja/9vvtdaznqBU41E6f4LYK6wuxEhnv8LxlYZhoOgleYAXQhP7F/PTSfhrfleBuquXEiwyUxetszarI+DeswhC49fvkcjxKyHe7IFzJCU/87MLhDTTDbS7KqH60dL4kiDitoXj6/wJe0U6rLHusgdnOV0rI9tD3RhDaLvyZvDTbIQAIlv2jUQFpCR9YCdp7Yig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(451199015)(2616005)(107886003)(26005)(6512007)(6666004)(6506007)(53546011)(66946007)(4326008)(316002)(8676002)(966005)(36756003)(66476007)(66556008)(478600001)(38100700002)(31696002)(86362001)(6486002)(83380400001)(186003)(66899015)(31686004)(5660300002)(8936002)(15650500001)(30864003)(41300700001)(2906002)(21314003)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEdCNzZ2UDQ2anRLbDVDRDlqOEdYOUwvV2tOckcwUE94cUxPaXNOeE5JdmtH?=
 =?utf-8?B?RFk1MGVHV2pIVjFMQTA1UzNHZlVlY0pDNnZ4NWdGZC9VQm9FblZWTGpmTTd2?=
 =?utf-8?B?bjRjK0VRbmNPUGRtWHY3RGZteUJNcjFmZGx6Wng3NW9SdGg0c2xEem0vZ3Er?=
 =?utf-8?B?cGsrOTZ2MUsrUk5sQVBTSVpjZkNUKzZSUXJnVGVpNmZQaVFQMjZ6NVZqcDRi?=
 =?utf-8?B?aXV5OS9sWklobWdJMzRyYlFnRm9PSHgySzZFQ0h3ODNJUGorczRaTk44MkNX?=
 =?utf-8?B?OFFESTVRMUdsbmNxZW45SUhwbWwzTCtVdC9HVXp1QlVISVZqUWJtaUlaNHlZ?=
 =?utf-8?B?NVNKcXByVlp1N0RqYnhHSnVGSzI2OUJ2RzQ4aW03NmQ4ODJNeDNzWS9SOEYz?=
 =?utf-8?B?aUpwbUZGOXYySXRJd21jT3R3OWs0ZzNnSG5rMXBzY0I2NlNVdnpCRzAvaVpU?=
 =?utf-8?B?TmFDcnlpRkpZZDFNb0lUTjdtQVZSZkVTbzEwaGxWZVkxV1Y3SFJ0dC9zcDU3?=
 =?utf-8?B?RGlvV1ordUQwaFc0NmRyd3EwZ3BRdzZ1cGpQT3kwN012UFl1N1R1VjJqOGNs?=
 =?utf-8?B?ZFVlY1d2NW5oZTBSdnUyTDZPd3QzTzRLUC9kOWI0Y1lyK29CNHhqU2RSWmV1?=
 =?utf-8?B?WVdnMUFwRmtWUVN5OCs2Rk40bVhTSUhMV0N1K25PK2pnTWNiV0ZsNDMxbGkw?=
 =?utf-8?B?TkxsbUNzRytEV3FjeVd1S0FHUmxreVF1OXY3dGh1a251V3ArTUJwVVBud0VT?=
 =?utf-8?B?UzBWWi9BWUVkTVBFWmovVmUvUCt3Znd2S2hkdERxc2xPZFpmRG1LQXo2RDdZ?=
 =?utf-8?B?OEJXTkRSWkZsYmhzUFdkRmwra1VITVliZzFPek5FM0VPejNWb0F6dlJPRWgy?=
 =?utf-8?B?QlJBRmlGb1VXeWxDWVRMK1dxbGg0NDdKbDU1KzZZRjF3a3lSMnIrN2NaOWdK?=
 =?utf-8?B?ODlTYTdzL2RsbXlydHY0K3ZUemJGTG4xYjl6TjlScThHUUtNdXVOSkVtVkpk?=
 =?utf-8?B?NlQyTStnR05JUWlsRmM4V2J5bVBOdkVuN0JZSktVNmIraE9jMnZ5NWdLUGxp?=
 =?utf-8?B?MnltdFVIMHBTWFhSRHI4ajk5NTJFR3pGT0RxUG9qZEV4cmRCMGY2bXg5dHdi?=
 =?utf-8?B?RE9hNzM4amhDbm0zRlZKcURwVkpxT2JBRDBEQk1MUk9lQmNPMVc2YXNFL3B1?=
 =?utf-8?B?TkU1T05DM1ZybXdXWk5mN2RUY05KNDJEdG1acW5GQlVvVXdRNTJoWDNzd2RE?=
 =?utf-8?B?Z3BFVUpiOEhTckxwd1Q1RU9xcVZQTzlVZHNJQlZIY2xFU3g5ZWZmZTBUdGt5?=
 =?utf-8?B?emxWaG1udUw4dzg2Y09jMWlXWVRTL3VxOU9aVmNrcnp4cUFUZlA2SlY5RXVZ?=
 =?utf-8?B?UTVUK3dJemh0aXB5N0E0WDIrcUp1YTVrL1dpY20vUm9zblFGeFJyb01LdExK?=
 =?utf-8?B?M0hSK0tVenUzSTdjeVp4QXFLYmtSelA2UVlMQ2xxdnBGaC9lYzBDZDZ0QWpG?=
 =?utf-8?B?KzllUXp3ajM3TmpTNUU3aFJ2bHhTY1FQUWlBeUZMWm1BOGxhbDVZcWxEcDNp?=
 =?utf-8?B?K05SRk9jYk1PTzk4VlpCOFNYbWRrUjBQcXNDV0t1L3lRaDA3T1dIOUFBamNG?=
 =?utf-8?B?TlkwN0YrMnZhelhNamozV1VCN0Y2QUxEdldwbTVieDdFRllONHh3ZmhKMWRI?=
 =?utf-8?B?d0VtNXVxSmZrQVBvUG1USTZnSkpDbXI0R3hXQXcvanVleXpneUluWWFERW92?=
 =?utf-8?B?TGVRbDFhbXlHcURkQ09oT1FEeTFDZ3BwRUVETEYwV2xhTEVHOHVtdXhXRW53?=
 =?utf-8?B?a2NPOVBGU3pJdzEzT214UnNXcXNCTjJnd3RKWWIwdTJVcDZISzBVQVdpYmFi?=
 =?utf-8?B?RG9ydm9QSmpvZnlEM0c4Z3ROVmhabjE2dS9EQ1RtU29LbDBUVmY2MkNKN2ds?=
 =?utf-8?B?S0w3ZWNiWnMyUW9vU3BCSk53TkxRa1p4bXI4YXcrQ1NBeXcyRVdnZTljNDJH?=
 =?utf-8?B?aG9IM3ZqT2JBVTRBb0NMdUtTT1FIaHBUMytYeStlcGRtUEswVk9pOGlQR0pv?=
 =?utf-8?B?MndEUTFzSU94VkRocVhDcWlWZmVXS0tnOWkyZzhzR094Z0FRclNZcktMcWp2?=
 =?utf-8?B?UmVVaDVUeDdGckZnY0JjZk5uNEtIbDVxZzlod1VXeHZKTlkrbyt3TXVxd0U3?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4201f41c-720f-42b0-3909-08daa586466b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 21:28:55.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eiTn5a99oJqMxCm4wgDTfc6fNXArzKROTAaA6UU5mLb3Ukjk1DV+G28A5Ih7yhE11U5y/5M2bGQIhKAZ8vk9z2dcRsr2o7MhJFu5FEs7rNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-GUID: PnaOKOzVNYwVpk3q2Fu7RZrnv4rq9ITl
X-Proofpoint-ORIG-GUID: aAEn8QNrCyhZLFLXixYmPX9vHKgqqpAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 21:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171366


 From a quick look, this update seems like it extends existing APIs
to support 64 bit tiff files by adding new functions rather
than changing the existing ABI.

I won't be able to do a detailed analysis until later this week.

It would be nice if we had an easy way to run:
    https://lvc.github.io/abi-compliance-checker/
I may check that out.

All for now,

../Randy

On 2022-09-30 11:58, Steve Sakoman wrote:
> This is a version update with some API changes, so further review
> would  be appreciated before I can take this.
> 
> To help with review, here are the changes in this release:
> 
> Software configuration changes
> 
> Handle absolute paths in pkg-config file (issue #333)
> Correct fix for the pkgconf file relative paths.
> cmake: allow running the tests with a read-only source directory.
> cmake: Fix STRIPCHOP_DEFAULT value in CMake builds.
> build: Fix static library imports in mingw related to LERC
> Fix version in libtiff-4.pc.in, and CMake build: Add requirements to pc file
> cmake: Fix build with CMake 3.10.
> cmake: Export tiff targets.
> Make LERC_SUPPORT conditional on ZLIB_SUPPORT
> 
> Library changes
> 
> New/improved functionalities:
> 
> TIFFIsBigTiff() function added.
> Functions TIFFFieldSetGetSize() and TIFFieldSetGetCountSize() added.
> LZWDecode(): major speed improvements (~30% faster)
> Predictor 2 (horizontal differenciation): support 64-bit
> Support libjpeg 9d
> 
> Bug fixes:
> 
> Remove incorrect assert (issue #329)
> avoid hang in TIFFRewriteDirectory() if a classic file > 4 GB is
> attempted to be created
> tif_jbig.c: fix crash when reading a file with multiple IFD in
> memory-mapped mode and when bit reversal is needed (fixes issue #385)
> TIFFFetchNormalTag(): avoid calling memcpy() with a null source
> pointer and size of zero (fixes issue #383)
> TIFFWriteDirectoryTagData(): turn assertion on data length into a runtime check
> TIFFFetchStripThing(): avoid calling memcpy() with a null source
> pointer and size of zero (fixes issue #362)
> TIFFReadDirectory(): avoid calling memcpy() with a null source pointer
> and size of zero (fixes issue #362)
> TIFFYCbCrToRGBInit(): avoid Integer-overflow
> TIFFGetField(TIFFTAG_STRIPBYTECOUNTS/TIFFTAG_STRIPOFFSETS): return
> error if returned pointer is NULL (fixes issue #342)
> OJPEG: avoid assertion when using TIFFReadScanline() (fixes issue #337)
> TIFFReadDirectory(): fix OJPEG hack (fixes issue #319)
> LZW codec: fix support for strips/tiles > 2 GB on Windows
> TIFFAppendToStrip(): fix rewrite-in-place logic (fixes issue #309)
> Fix TIFFRewriteDirectory() discarding directories.
> TIFFReadCustomDirectory(): avoid crash when reading SubjectDistance
> tag on a non EXIF directory (issue #316)
> Fix Segmentation fault printing GPS directory if Altitude tag is present
> tif_jpeg.c: do not emit progressive scans with mozjpeg. (issue #266)
> _TIFFRewriteField(): fix when writing a IFD with a single tile that is
> a sparse one, on big endian hosts
> Fix all remaining uses of legacy Deflate compression id and warn on use.
> 
> Tools changes
> 
> Bug fixes:
> 
> tiffcrop: Fix issue issue #330 and some more from 320 to 349.
> tiffcrop: fix issue issue #395: generation of strange section images.
> tiffcrop: fix issue issue #380 and issue #382 heap buffer overflow in
> extractImageSection
> tiffcrop: fix FPE (issue #393)
> tiffcrop: buffsize check formula in loadImage() amended (fixes issue
> #273, issue #275)
> tiffcrop.c: Fix issue issue #352 heap-buffer-overflow by correcting
> uint32_t underflow.
> tiff2pdf: handle 8-bit palette colormap.
> tiffcp: avoid buffer overflow in "mode" string (fixes issue #400)
> tiffcp: Fix incomprehensible setting of orientation tag (fixes issue #29)
> tiffcp: do not try to fetch compressor-specific tags when not
> appropriate (fixes issue #396)
> tiffcp: fix heap buffer overflow (issue #278)
> tiff2ps: In limitMalloc() check for negative size (fixes issue #284)
> tiffinfo: add a -M switch to define the maximum heap allocation, and
> default it to 256 MiB (fixes issue #287, issue #290)
> tiffinfo: limit more memory allocations using -M switch (fixes issue #288)
> tiffset: fix global-buffer-overflow for ASCII tags where count is
> required (fixes issue #355)
> raw2tiff: check that band number if not zero to avoid floating point
> exception(fixes issue #338)
> tiffinfo/tiffdump: improve output for GDAL tags.
> 
> On Wed, Sep 28, 2022 at 10:33 PM Teoh, Jay Shen <jay.shen.teoh@intel.com> wrote:
>>
>> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>>
>> -Drop all CVE backports for tiff_4.3.0
>> -Update include fixes for:
>>   CVE-2022-2867 [https://bugzilla.redhat.com/show_bug.cgi?id=2118847],
>>   CVE-2022-2868 [https://bugzilla.redhat.com/show_bug.cgi?id=2118863],
>>   CVE-2022-2869 [https://bugzilla.redhat.com/show_bug.cgi?id=2118869]
>>
>> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>> ---
>>   ...rash-when-reading-a-file-with-multip.patch |  38 ---
>>   ...al-buffer-overflow-for-ASCII-tags-wh.patch |  43 ----
>>   ...ue-380-and-382-heap-buffer-overflow-.patch | 219 ------------------
>>   ...-for-return-value-of-limitMalloc-392.patch |  93 --------
>>   ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 ---
>>   .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 ---
>>   ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 -----
>>   ...99c99f987dc32ae110370cfdd7df7975586b.patch |  30 ---
>>   .../libtiff/tiff/CVE-2022-1354.patch          | 212 -----------------
>>   .../libtiff/tiff/CVE-2022-1355.patch          |  62 -----
>>   ...0712f4c3a5b449f70c57988260a667ddbdef.patch |  32 ---
>>   .../libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb}  |  13 +-
>>   12 files changed, 1 insertion(+), 867 deletions(-)
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
>>   delete mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
>>   rename meta/recipes-multimedia/libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb} (75%)
>>
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
>> deleted file mode 100644
>> index f1a4ab4251..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -CVE: CVE-2022-0865
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Thu, 24 Feb 2022 22:26:02 +0100
>> -Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
>> - IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
>> -
>> ----
>> - libtiff/tif_jbig.c | 10 ++++++++++
>> - 1 file changed, 10 insertions(+)
>> -
>> -diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
>> -index 74086338..8bfa4cef 100644
>> ---- a/libtiff/tif_jbig.c
>> -+++ b/libtiff/tif_jbig.c
>> -@@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
>> -        */
>> -       tif->tif_flags |= TIFF_NOBITREV;
>> -       tif->tif_flags &= ~TIFF_MAPPED;
>> -+      /* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP and
>> -+       * cleared TIFF_MYBUFFER. It is necessary to restore them to their initial
>> -+       * value to be consistent with the state of a non-memory mapped file.
>> -+       */
>> -+      if (tif->tif_flags&TIFF_BUFFERMMAP) {
>> -+              tif->tif_rawdata = NULL;
>> -+              tif->tif_rawdatasize = 0;
>> -+              tif->tif_flags &= ~TIFF_BUFFERMMAP;
>> -+              tif->tif_flags |= TIFF_MYBUFFER;
>> -+      }
>> -
>> -       /* Setup the function pointers for encode, decode, and cleanup. */
>> -       tif->tif_setupdecode = JBIGSetupDecode;
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
>> deleted file mode 100644
>> index 72776f09ba..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -CVE: CVE-2022-22844
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
>> -From: 4ugustus <wangdw.augustus@qq.com>
>> -Date: Tue, 25 Jan 2022 16:25:28 +0000
>> -Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
>> - count is required (fixes #355)
>> -
>> ----
>> - tools/tiffset.c | 16 +++++++++++++---
>> - 1 file changed, 13 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/tools/tiffset.c b/tools/tiffset.c
>> -index 8c9e23c5..e7a88c09 100644
>> ---- a/tools/tiffset.c
>> -+++ b/tools/tiffset.c
>> -@@ -146,9 +146,19 @@ main(int argc, char* argv[])
>> -
>> -             arg_index++;
>> -             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
>> --                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
>> --                    fprintf( stderr, "Failed to set %s=%s\n",
>> --                             TIFFFieldName(fip), argv[arg_index] );
>> -+                if(TIFFFieldPassCount( fip )) {
>> -+                    size_t len;
>> -+                    len = strlen(argv[arg_index]) + 1;
>> -+                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
>> -+                            (uint16_t)len, argv[arg_index]) != 1)
>> -+                        fprintf( stderr, "Failed to set %s=%s\n",
>> -+                            TIFFFieldName(fip), argv[arg_index] );
>> -+                } else {
>> -+                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
>> -+                            argv[arg_index]) != 1)
>> -+                        fprintf( stderr, "Failed to set %s=%s\n",
>> -+                            TIFFFieldName(fip), argv[arg_index] );
>> -+                }
>> -             } else if (TIFFFieldWriteCount(fip) > 0
>> -                      || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
>> -                 int     ret = 1;
>> ---
>> -2.25.1
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
>> deleted file mode 100644
>> index 812ffb232d..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
>> +++ /dev/null
>> @@ -1,219 +0,0 @@
>> -CVE: CVE-2022-0891
>> -CVE: CVE-2022-1056
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
>> -From: Su Laus <sulau@freenet.de>
>> -Date: Tue, 8 Mar 2022 17:02:44 +0000
>> -Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
>> - extractImageSection
>> -
>> ----
>> - tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
>> - 1 file changed, 36 insertions(+), 56 deletions(-)
>> -
>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> -index b85c2ce7..302a7e91 100644
>> ---- a/tools/tiffcrop.c
>> -+++ b/tools/tiffcrop.c
>> -@@ -105,8 +105,8 @@
>> -  *                of messages to monitor progress without enabling dump logs.
>> -  */
>> -
>> --static   char tiffcrop_version_id[] = "2.4";
>> --static   char tiffcrop_rev_date[] = "12-13-2010";
>> -+static   char tiffcrop_version_id[] = "2.4.1";
>> -+static   char tiffcrop_rev_date[] = "03-03-2010";
>> -
>> - #include "tif_config.h"
>> - #include "libport.h"
>> -@@ -6710,10 +6710,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> - #ifdef DEVELMODE
>> -   uint32_t    img_length;
>> - #endif
>> --  uint32_t    j, shift1, shift2, trailing_bits;
>> -+  uint32_t    j, shift1, trailing_bits;
>> -   uint32_t    row, first_row, last_row, first_col, last_col;
>> -   uint32_t    src_offset, dst_offset, row_offset, col_offset;
>> --  uint32_t    offset1, offset2, full_bytes;
>> -+  uint32_t    offset1, full_bytes;
>> -   uint32_t    sect_width;
>> - #ifdef DEVELMODE
>> -   uint32_t    sect_length;
>> -@@ -6723,7 +6723,6 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> - #ifdef DEVELMODE
>> -   int      k;
>> -   unsigned char bitset;
>> --  static char *bitarray = NULL;
>> - #endif
>> -
>> -   img_width = image->width;
>> -@@ -6741,17 +6740,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> -   dst_offset = 0;
>> -
>> - #ifdef DEVELMODE
>> --  if (bitarray == NULL)
>> --    {
>> --    if ((bitarray = (char *)malloc(img_width)) == NULL)
>> --      {
>> --      TIFFError ("", "DEBUG: Unable to allocate debugging bitarray");
>> --      return (-1);
>> --      }
>> --    }
>> -+  char bitarray[39];
>> - #endif
>> -
>> --  /* rows, columns, width, length are expressed in pixels */
>> -+  /* rows, columns, width, length are expressed in pixels
>> -+   * first_row, last_row, .. are index into image array starting at 0 to width-1,
>> -+   * last_col shall be also extracted.  */
>> -   first_row = section->y1;
>> -   last_row  = section->y2;
>> -   first_col = section->x1;
>> -@@ -6761,9 +6755,14 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> - #ifdef DEVELMODE
>> -   sect_length = last_row - first_row + 1;
>> - #endif
>> --  img_rowsize = ((img_width * bps + 7) / 8) * spp;
>> --  full_bytes = (sect_width * spp * bps) / 8;   /* number of COMPLETE bytes per row in section */
>> --  trailing_bits = (sect_width * bps) % 8;
>> -+    /* The read function loadImage() used copy separate plane data into a buffer as interleaved
>> -+     * samples rather than separate planes so the same logic works to extract regions
>> -+     * regardless of the way the data are organized in the input file.
>> -+     * Furthermore, bytes and bits are arranged in buffer according to COMPRESSION=1 and FILLORDER=1
>> -+     */
>> -+    img_rowsize = (((img_width * spp * bps) + 7) / 8);    /* row size in full bytes of source image */
>> -+    full_bytes = (sect_width * spp * bps) / 8;            /* number of COMPLETE bytes per row in section */
>> -+    trailing_bits = (sect_width * spp * bps) % 8;         /* trailing bits within the last byte of destination buffer */
>> -
>> - #ifdef DEVELMODE
>> -     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First col: %"PRIu32", last col: %"PRIu32"\n",
>> -@@ -6776,10 +6775,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> -
>> -   if ((bps % 8) == 0)
>> -     {
>> --    col_offset = first_col * spp * bps / 8;
>> -+    col_offset = (first_col * spp * bps) / 8;
>> -     for (row = first_row; row <= last_row; row++)
>> -       {
>> --      /* row_offset = row * img_width * spp * bps / 8; */
>> -       row_offset = row * img_rowsize;
>> -       src_offset = row_offset + col_offset;
>> -
>> -@@ -6792,14 +6790,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> -     }
>> -   else
>> -     { /* bps != 8 */
>> --    shift1  = spp * ((first_col * bps) % 8);
>> --    shift2  = spp * ((last_col * bps) % 8);
>> -+    shift1 = ((first_col * spp * bps) % 8);           /* shift1 = bits to skip in the first byte of source buffer*/
>> -     for (row = first_row; row <= last_row; row++)
>> -       {
>> -       /* pull out the first byte */
>> -       row_offset = row * img_rowsize;
>> --      offset1 = row_offset + (first_col * bps / 8);
>> --      offset2 = row_offset + (last_col * bps / 8);
>> -+      offset1 = row_offset + ((first_col * spp * bps) / 8);   /* offset1 = offset into source of byte with first bits to be extracted */
>> -
>> - #ifdef DEVELMODE
>> -       for (j = 0, k = 7; j < 8; j++, k--)
>> -@@ -6811,12 +6807,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> -       sprintf(&bitarray[9], " ");
>> -       for (j = 10, k = 7; j < 18; j++, k--)
>> -         {
>> --        bitset = *(src_buff + offset2) & (((unsigned char)1 << k)) ? 1 : 0;
>> -+        bitset = *(src_buff + offset1 + full_bytes) & (((unsigned char)1 << k)) ? 1 : 0;
>> -         sprintf(&bitarray[j], (bitset) ? "1" : "0");
>> -         }
>> -       bitarray[18] = '\0';
>> --      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Shift2:  %"PRIu32"\n",
>> --                 row, offset1, shift1, offset2, shift2);
>> -+      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n",
>> -+                 row, offset1, shift1, offset1+full_bytes, trailing_bits);
>> - #endif
>> -
>> -       bytebuff1 = bytebuff2 = 0;
>> -@@ -6840,11 +6836,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> -
>> -         if (trailing_bits != 0)
>> -           {
>> --        bytebuff2 = src_buff[offset2] & ((unsigned char)255 << (7 - shift2));
>> -+      /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
>> -+        bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
>> -           sect_buff[dst_offset] = bytebuff2;
>> - #ifdef DEVELMODE
>> -         TIFFError ("", "        Trailing bits src offset:  %8"PRIu32", Dst offset: %8"PRIu32"\n",
>> --                              offset2, dst_offset);
>> -+          offset1 + full_bytes, dst_offset);
>> -           for (j = 30, k = 7; j < 38; j++, k--)
>> -             {
>> -             bitset = *(sect_buff + dst_offset) & (((unsigned char)1 << k)) ? 1 : 0;
>> -@@ -6863,8 +6860,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> - #endif
>> -         for (j = 0; j <= full_bytes; j++)
>> -           {
>> --        bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
>> --        bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (7 - shift1));
>> -+          /* Skip the first shift1 bits and shift the source up by shift1 bits before save to destination.*/
>> -+          /* Attention: src_buff size needs to be some bytes larger than image size, because could read behind image here. */
>> -+          bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
>> -+          bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (8 - shift1));
>> -           sect_buff[dst_offset + j] = (bytebuff1 << shift1) | (bytebuff2 >> (8 - shift1));
>> -           }
>> - #ifdef DEVELMODE
>> -@@ -6880,36 +6879,17 @@ extractImageSection(struct image_data *image, struct pageseg *section,
>> - #endif
>> -         dst_offset += full_bytes;
>> -
>> -+        /* Copy the trailing_bits for the last byte in the destination buffer.
>> -+           Could come from one ore two bytes of the source buffer. */
>> -         if (trailing_bits != 0)
>> -           {
>> - #ifdef DEVELMODE
>> --          TIFFError ("", "        Trailing bits   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", offset1 + full_bytes, dst_offset);
>> --#endif
>> --        if (shift2 > shift1)
>> --            {
>> --          bytebuff1 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (7 - shift2));
>> --            bytebuff2 = bytebuff1 & ((unsigned char)255 << shift1);
>> --            sect_buff[dst_offset] = bytebuff2;
>> --#ifdef DEVELMODE
>> --          TIFFError ("", "        Shift2 > Shift1\n");
>> -+          TIFFError("", "        Trailing bits %4"PRIu32"   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", trailing_bits, offset1 + full_bytes, dst_offset);
>> - #endif
>> -+          /* More than necessary bits are already copied into last destination buffer,
>> -+           * only masking of last byte in destination buffer is necessary.*/
>> -+          sect_buff[dst_offset] &= ((uint8_t)0xFF << (8 - trailing_bits));
>> -             }
>> --          else
>> --            {
>> --          if (shift2 < shift1)
>> --              {
>> --              bytebuff2 = ((unsigned char)255 << (shift1 - shift2 - 1));
>> --            sect_buff[dst_offset] &= bytebuff2;
>> --#ifdef DEVELMODE
>> --            TIFFError ("", "        Shift2 < Shift1\n");
>> --#endif
>> --              }
>> --#ifdef DEVELMODE
>> --            else
>> --            TIFFError ("", "        Shift2 == Shift1\n");
>> --#endif
>> --            }
>> --        }
>> - #ifdef DEVELMODE
>> -         sprintf(&bitarray[28], " ");
>> -         sprintf(&bitarray[29], " ");
>> -@@ -7062,7 +7042,7 @@ writeImageSections(TIFF *in, TIFF *out, struct image_data *image,
>> -     width  = sections[i].x2 - sections[i].x1 + 1;
>> -     length = sections[i].y2 - sections[i].y1 + 1;
>> -     sectsize = (uint32_t)
>> --          ceil((width * image->bps + 7) / (double)8) * image->spp * length;
>> -+          ceil((width * image->bps * image->spp + 7) / (double)8) * length;
>> -     /* allocate a buffer if we don't have one already */
>> -     if (createImageSection(sectsize, sect_buff_ptr))
>> -       {
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
>> deleted file mode 100644
>> index a0b856b9e1..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
>> +++ /dev/null
>> @@ -1,93 +0,0 @@
>> -CVE: CVE-2022-0907
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
>> -From: Augustus <wangdw.augustus@qq.com>
>> -Date: Mon, 7 Mar 2022 18:21:49 +0800
>> -Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
>> -
>> ----
>> - tools/tiffcrop.c | 33 +++++++++++++++++++++------------
>> - 1 file changed, 21 insertions(+), 12 deletions(-)
>> -
>> -diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> -index 302a7e91..e407bf51 100644
>> ---- a/tools/tiffcrop.c
>> -+++ b/tools/tiffcrop.c
>> -@@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
>> -   if (!sect_buff)
>> -     {
>> -     sect_buff = (unsigned char *)limitMalloc(sectsize);
>> --    *sect_buff_ptr = sect_buff;
>> -+    if (!sect_buff)
>> -+    {
>> -+        TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
>> -+        return (-1);
>> -+    }
>> -     _TIFFmemset(sect_buff, 0, sectsize);
>> -     }
>> -   else
>> -@@ -7373,15 +7377,15 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
>> -       else
>> -         sect_buff = new_buff;
>> -
>> -+      if (!sect_buff)
>> -+      {
>> -+          TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
>> -+          return (-1);
>> -+      }
>> -       _TIFFmemset(sect_buff, 0, sectsize);
>> -       }
>> -     }
>> -
>> --  if (!sect_buff)
>> --    {
>> --    TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
>> --    return (-1);
>> --    }
>> -   prev_sectsize = sectsize;
>> -   *sect_buff_ptr = sect_buff;
>> -
>> -@@ -7648,7 +7652,11 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
>> -   if (!crop_buff)
>> -     {
>> -     crop_buff = (unsigned char *)limitMalloc(cropsize);
>> --    *crop_buff_ptr = crop_buff;
>> -+    if (!crop_buff)
>> -+    {
>> -+        TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
>> -+        return (-1);
>> -+    }
>> -     _TIFFmemset(crop_buff, 0, cropsize);
>> -     prev_cropsize = cropsize;
>> -     }
>> -@@ -7664,15 +7672,15 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
>> -         }
>> -       else
>> -         crop_buff = new_buff;
>> -+      if (!crop_buff)
>> -+      {
>> -+          TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
>> -+          return (-1);
>> -+      }
>> -       _TIFFmemset(crop_buff, 0, cropsize);
>> -       }
>> -     }
>> -
>> --  if (!crop_buff)
>> --    {
>> --    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
>> --    return (-1);
>> --    }
>> -   *crop_buff_ptr = crop_buff;
>> -
>> -   if (crop->crop_mode & CROP_INVERT)
>> -@@ -9231,3 +9239,4 @@ invertImage(uint16_t photometric, uint16_t spp, uint16_t bps, uint32_t width, ui
>> -  * fill-column: 78
>> -  * End:
>> -  */
>> -+
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
>> deleted file mode 100644
>> index 719dabaecc..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -CVE: CVE-2022-0908
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Thu, 17 Feb 2022 15:28:43 +0100
>> -Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
>> - source pointer and size of zero (fixes #383)
>> -
>> ----
>> - libtiff/tif_dirread.c | 5 ++++-
>> - 1 file changed, 4 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
>> -index d84147a0..4e8ce729 100644
>> ---- a/libtiff/tif_dirread.c
>> -+++ b/libtiff/tif_dirread.c
>> -@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
>> -                                                               _TIFFfree(data);
>> -                                                       return(0);
>> -                                               }
>> --                                              _TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
>> -+                                              if (dp->tdir_count > 0 )
>> -+                                              {
>> -+                                                      _TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
>> -+                                              }
>> -                                               o[(uint32_t)dp->tdir_count]=0;
>> -                                               if (data!=0)
>> -                                                       _TIFFfree(data);
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
>> deleted file mode 100644
>> index 64dbe9ef92..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -CVE: CVE-2022-0909
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
>> -From: 4ugustus <wangdw.augustus@qq.com>
>> -Date: Tue, 8 Mar 2022 16:22:04 +0000
>> -Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
>> -
>> ----
>> - libtiff/tif_dir.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
>> -index a6c254fc..77da6ea4 100644
>> ---- a/libtiff/tif_dir.c
>> -+++ b/libtiff/tif_dir.c
>> -@@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
>> -               break;
>> -       case TIFFTAG_XRESOLUTION:
>> -         dblval = va_arg(ap, double);
>> --        if( dblval < 0 )
>> -+        if( dblval != dblval || dblval < 0 )
>> -             goto badvaluedouble;
>> -               td->td_xresolution = _TIFFClampDoubleToFloat( dblval );
>> -               break;
>> -       case TIFFTAG_YRESOLUTION:
>> -         dblval = va_arg(ap, double);
>> --        if( dblval < 0 )
>> -+        if( dblval != dblval || dblval < 0 )
>> -             goto badvaluedouble;
>> -               td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
>> -               break;
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
>> deleted file mode 100644
>> index afd5e59960..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
>> +++ /dev/null
>> @@ -1,57 +0,0 @@
>> -CVE: CVE-2022-0924
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> -
>> -From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
>> -From: 4ugustus <wangdw.augustus@qq.com>
>> -Date: Thu, 10 Mar 2022 08:48:00 +0000
>> -Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
>> -
>> ----
>> - tools/tiffcp.c | 17 ++++++++++++++++-
>> - 1 file changed, 16 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/tools/tiffcp.c b/tools/tiffcp.c
>> -index 1f889516..552d8fad 100644
>> ---- a/tools/tiffcp.c
>> -+++ b/tools/tiffcp.c
>> -@@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
>> -       tdata_t obuf;
>> -       tstrip_t strip = 0;
>> -       tsample_t s;
>> -+      uint16_t bps = 0, bytes_per_sample;
>> -
>> -       obuf = limitMalloc(stripsize);
>> -       if (obuf == NULL)
>> -               return (0);
>> -       _TIFFmemset(obuf, 0, stripsize);
>> -       (void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
>> -+      (void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
>> -+      if( bps == 0 )
>> -+        {
>> -+            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSample");
>> -+            _TIFFfree(obuf);
>> -+            return 0;
>> -+        }
>> -+        if( (bps % 8) != 0 )
>> -+        {
>> -+            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerSample that is not a multiple of 8");
>> -+            _TIFFfree(obuf);
>> -+            return 0;
>> -+        }
>> -+      bytes_per_sample = bps/8;
>> -       for (s = 0; s < spp; s++) {
>> -               uint32_t row;
>> -               for (row = 0; row < imagelength; row += rowsperstrip) {
>> -@@ -1676,7 +1691,7 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
>> -
>> -                       cpContigBufToSeparateBuf(
>> -                           obuf, (uint8_t*) buf + row * rowsize + s,
>> --                          nrows, imagewidth, 0, 0, spp, 1);
>> -+                          nrows, imagewidth, 0, 0, spp, bytes_per_sample);
>> -                       if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
>> -                               TIFFError(TIFFFileName(out),
>> -                                   "Error, can't write strip %"PRIu32,
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
>> deleted file mode 100644
>> index 0b41dde606..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Sat, 5 Feb 2022 20:36:41 +0100
>> -Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
>> - source pointer and size of zero (fixes #362)
>> -
>> -Upstream-Status: Backport
>> -CVE: CVE-2022-0562
>> -
>> ----
>> - libtiff/tif_dirread.c | 3 ++-
>> - 1 file changed, 2 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
>> -index 2bbc4585..23194ced 100644
>> ---- a/libtiff/tif_dirread.c
>> -+++ b/libtiff/tif_dirread.c
>> -@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
>> -                     goto bad;
>> -                 }
>> -
>> --                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
>> -+                if (old_extrasamples > 0)
>> -+                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
>> -                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
>> -                 _TIFFfree(new_sampleinfo);
>> -         }
>> ---
>> -GitLab
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
>> deleted file mode 100644
>> index 71b85cac10..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
>> +++ /dev/null
>> @@ -1,212 +0,0 @@
>> -From 87881e093691a35c60b91cafed058ba2dd5d9807 Mon Sep 17 00:00:00 2001
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Sun, 5 Dec 2021 14:37:46 +0100
>> -Subject: [PATCH] TIFFReadDirectory: fix OJPEG hack (fixes #319)
>> -
>> -to avoid having the size of the strip arrays inconsistent with the
>> -number of strips returned by TIFFNumberOfStrips(), which may cause
>> -out-ouf-bounds array read afterwards.
>> -
>> -One of the OJPEG hack that alters SamplesPerPixel may influence the
>> -number of strips. Hence compute tif_dir.td_nstrips only afterwards.
>> -
>> -CVE: CVE-2022-1354
>> -
>> -Upstream-Status: Backport
>> -[https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798]
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ----
>> - libtiff/tif_dirread.c | 162 ++++++++++++++++++++++--------------------
>> - 1 file changed, 83 insertions(+), 79 deletions(-)
>> -
>> -diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
>> -index 8f434ef5..14c031d1 100644
>> ---- a/libtiff/tif_dirread.c
>> -+++ b/libtiff/tif_dirread.c
>> -@@ -3794,50 +3794,7 @@ TIFFReadDirectory(TIFF* tif)
>> -               MissingRequired(tif,"ImageLength");
>> -               goto bad;
>> -       }
>> --      /*
>> --       * Setup appropriate structures (by strip or by tile)
>> --       */
>> --      if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
>> --              tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);
>> --              tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
>> --              tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
>> --              tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
>> --              tif->tif_flags &= ~TIFF_ISTILED;
>> --      } else {
>> --              tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
>> --              tif->tif_flags |= TIFF_ISTILED;
>> --      }
>> --      if (!tif->tif_dir.td_nstrips) {
>> --              TIFFErrorExt(tif->tif_clientdata, module,
>> --                  "Cannot handle zero number of %s",
>> --                  isTiled(tif) ? "tiles" : "strips");
>> --              goto bad;
>> --      }
>> --      tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
>> --      if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
>> --              tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
>> --      if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
>> --#ifdef OJPEG_SUPPORT
>> --              if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
>> --                  (isTiled(tif)==0) &&
>> --                  (tif->tif_dir.td_nstrips==1)) {
>> --                      /*
>> --                       * XXX: OJPEG hack.
>> --                       * If a) compression is OJPEG, b) it's not a tiled TIFF,
>> --                       * and c) the number of strips is 1,
>> --                       * then we tolerate the absence of stripoffsets tag,
>> --                       * because, presumably, all required data is in the
>> --                       * JpegInterchangeFormat stream.
>> --                       */
>> --                      TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
>> --              } else
>> --#endif
>> --        {
>> --                      MissingRequired(tif,
>> --                              isTiled(tif) ? "TileOffsets" : "StripOffsets");
>> --                      goto bad;
>> --              }
>> --      }
>> -+
>> -       /*
>> -        * Second pass: extract other information.
>> -        */
>> -@@ -4042,41 +3999,6 @@ TIFFReadDirectory(TIFF* tif)
>> -                       } /* -- if (!dp->tdir_ignore) */
>> -               } /* -- for-loop -- */
>> -
>> --        if( tif->tif_mode == O_RDWR &&
>> --            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
>> --            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
>> --            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
>> --            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
>> --            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
>> --            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
>> --            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
>> --            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
>> --        {
>> --            /* Directory typically created with TIFFDeferStrileArrayWriting() */
>> --            TIFFSetupStrips(tif);
>> --        }
>> --        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
>> --        {
>> --            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
>> --            {
>> --                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
>> --                                         tif->tif_dir.td_nstrips,
>> --                                         &tif->tif_dir.td_stripoffset_p))
>> --                {
>> --                    goto bad;
>> --                }
>> --            }
>> --            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
>> --            {
>> --                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
>> --                                         tif->tif_dir.td_nstrips,
>> --                                         &tif->tif_dir.td_stripbytecount_p))
>> --                {
>> --                    goto bad;
>> --                }
>> --            }
>> --        }
>> --
>> -       /*
>> -        * OJPEG hack:
>> -        * - If a) compression is OJPEG, and b) photometric tag is missing,
>> -@@ -4147,6 +4069,88 @@ TIFFReadDirectory(TIFF* tif)
>> -               }
>> -       }
>> -
>> -+      /*
>> -+       * Setup appropriate structures (by strip or by tile)
>> -+       * We do that only after the above OJPEG hack which alters SamplesPerPixel
>> -+       * and thus influences the number of strips in the separate planarconfig.
>> -+       */
>> -+      if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
>> -+              tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);
>> -+              tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
>> -+              tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
>> -+              tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
>> -+              tif->tif_flags &= ~TIFF_ISTILED;
>> -+      } else {
>> -+              tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
>> -+              tif->tif_flags |= TIFF_ISTILED;
>> -+      }
>> -+      if (!tif->tif_dir.td_nstrips) {
>> -+              TIFFErrorExt(tif->tif_clientdata, module,
>> -+                  "Cannot handle zero number of %s",
>> -+                  isTiled(tif) ? "tiles" : "strips");
>> -+              goto bad;
>> -+      }
>> -+      tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
>> -+      if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
>> -+              tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
>> -+      if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
>> -+#ifdef OJPEG_SUPPORT
>> -+              if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
>> -+                  (isTiled(tif)==0) &&
>> -+                  (tif->tif_dir.td_nstrips==1)) {
>> -+                      /*
>> -+                       * XXX: OJPEG hack.
>> -+                       * If a) compression is OJPEG, b) it's not a tiled TIFF,
>> -+                       * and c) the number of strips is 1,
>> -+                       * then we tolerate the absence of stripoffsets tag,
>> -+                       * because, presumably, all required data is in the
>> -+                       * JpegInterchangeFormat stream.
>> -+                       */
>> -+                      TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
>> -+              } else
>> -+#endif
>> -+        {
>> -+                      MissingRequired(tif,
>> -+                              isTiled(tif) ? "TileOffsets" : "StripOffsets");
>> -+                      goto bad;
>> -+              }
>> -+      }
>> -+
>> -+        if( tif->tif_mode == O_RDWR &&
>> -+            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
>> -+            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
>> -+            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
>> -+            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
>> -+            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
>> -+            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
>> -+            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
>> -+            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
>> -+        {
>> -+            /* Directory typically created with TIFFDeferStrileArrayWriting() */
>> -+            TIFFSetupStrips(tif);
>> -+        }
>> -+        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
>> -+        {
>> -+            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
>> -+            {
>> -+                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
>> -+                                         tif->tif_dir.td_nstrips,
>> -+                                         &tif->tif_dir.td_stripoffset_p))
>> -+                {
>> -+                    goto bad;
>> -+                }
>> -+            }
>> -+            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
>> -+            {
>> -+                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
>> -+                                         tif->tif_dir.td_nstrips,
>> -+                                         &tif->tif_dir.td_stripbytecount_p))
>> -+                {
>> -+                    goto bad;
>> -+                }
>> -+            }
>> -+        }
>> -+
>> -       /*
>> -        * Make sure all non-color channels are extrasamples.
>> -        * If it's not the case, define them as such.
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
>> deleted file mode 100644
>> index e59f5aad55..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
>> +++ /dev/null
>> @@ -1,62 +0,0 @@
>> -From fb1db384959698edd6caeea84e28253d272a0f96 Mon Sep 17 00:00:00 2001
>> -From: Su_Laus <sulau@freenet.de>
>> -Date: Sat, 2 Apr 2022 22:33:31 +0200
>> -Subject: [PATCH] tiffcp: avoid buffer overflow in "mode" string (fixes #400)
>> -
>> -CVE: CVE-2022-1355
>> -
>> -Upstream-Status: Backport
>> -[https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2]
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ----
>> - tools/tiffcp.c | 25 ++++++++++++++++++++-----
>> - 1 file changed, 20 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/tools/tiffcp.c b/tools/tiffcp.c
>> -index fd129bb7..8d944ff6 100644
>> ---- a/tools/tiffcp.c
>> -+++ b/tools/tiffcp.c
>> -@@ -274,19 +274,34 @@ main(int argc, char* argv[])
>> -                       deftilewidth = atoi(optarg);
>> -                       break;
>> -               case 'B':
>> --                      *mp++ = 'b'; *mp = '\0';
>> -+                      if (strlen(mode) < (sizeof(mode) - 1))
>> -+                      {
>> -+                              *mp++ = 'b'; *mp = '\0';
>> -+                      }
>> -                       break;
>> -               case 'L':
>> --                      *mp++ = 'l'; *mp = '\0';
>> -+                      if (strlen(mode) < (sizeof(mode) - 1))
>> -+                      {
>> -+                              *mp++ = 'l'; *mp = '\0';
>> -+                      }
>> -                       break;
>> -               case 'M':
>> --                      *mp++ = 'm'; *mp = '\0';
>> -+                      if (strlen(mode) < (sizeof(mode) - 1))
>> -+                      {
>> -+                              *mp++ = 'm'; *mp = '\0';
>> -+                      }
>> -                       break;
>> -               case 'C':
>> --                      *mp++ = 'c'; *mp = '\0';
>> -+                      if (strlen(mode) < (sizeof(mode) - 1))
>> -+                      {
>> -+                              *mp++ = 'c'; *mp = '\0';
>> -+                      }
>> -                       break;
>> -               case '8':
>> --                      *mp++ = '8'; *mp = '\0';
>> -+                      if (strlen(mode) < (sizeof(mode)-1))
>> -+                      {
>> -+                              *mp++ = '8'; *mp = '\0';
>> -+                      }
>> -                       break;
>> -               case 'x':
>> -                       pageInSeq = 1;
>> ---
>> -2.25.1
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
>> deleted file mode 100644
>> index 74f9649fdf..0000000000
>> --- a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
>> -From: Even Rouault <even.rouault@spatialys.com>
>> -Date: Sun, 6 Feb 2022 13:08:38 +0100
>> -Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
>> - source pointer and size of zero (fixes #362)
>> -
>> -Upstream-Status: Backport
>> -CVE: CVE-2022-0561
>> -
>> ----
>> - libtiff/tif_dirread.c | 5 +++--
>> - 1 file changed, 3 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
>> -index 23194ced..50ebf8ac 100644
>> ---- a/libtiff/tif_dirread.c
>> -+++ b/libtiff/tif_dirread.c
>> -@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
>> -                       _TIFFfree(data);
>> -                       return(0);
>> -               }
>> --                _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
>> --                _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
>> -+              if( dir->tdir_count )
>> -+                      _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
>> -+              _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
>> -               _TIFFfree(data);
>> -               data=resizeddata;
>> -       }
>> ---
>> -GitLab
>> -
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>> similarity index 75%
>> rename from meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> rename to meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>> index b5ccd859f3..e30df0b3e9 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>> @@ -9,22 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
>>   CVE_PRODUCT = "libtiff"
>>
>>   SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>> -           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
>> -           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
>> -           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
>> -           file://0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch \
>> -           file://0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch \
>> -           file://0003-add-checks-for-return-value-of-limitMalloc-392.patch \
>> -           file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch \
>> -           file://0005-fix-the-FPE-in-tiffcrop-393.patch \
>> -           file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
>>              file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
>> -           file://CVE-2022-1354.patch \
>> -           file://CVE-2022-1355.patch \
>>              file://CVE-2022-34526.patch \
>>              "
>>
>> -SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
>> +SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
>>
>>   # exclude betas
>>   UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
>> --
>> 2.37.3
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171225): https://lists.openembedded.org/g/openembedded-core/message/171225
>> Mute This Topic: https://lists.openembedded.org/mt/93990329/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
# Randy MacLeod
# Wind River Linux


