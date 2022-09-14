Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD0CC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:08:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6811.1663164496575542199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=skrLVITW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6256789b3d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28ECX0Nk027111
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 14:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=5SpDJOu6/K48lnAUM55yFhHe1faZiHJHWzK0TWSHxTE=;
 b=skrLVITWvLOPDmNYrVtz4Qy9iiKLX3v/N75Ec6nAgOOHk5kTEUGl4Lk6xDLK9u/LT5k0
 uIV11ARinYxqjiKlSWJzzqMxJtgaAXE+3M3pz9ajazBPctYbM/bJeaHte600004Fidgx
 HV2AOToe4QyYtJ1emS1IO+tOgxRNhual1fZkWi2nAdn1bdoYdvW+DTenZpG+Q+ip5Sit
 JBjzos5IaJ24cpM0tLjZpyU9N/f0urqdIaUUM+EAJYEo3awSumE0Ic9ZOMIosSwQgHYr
 vTMP7qv4Ayv0GCB1MCi818iF65NR5zgYAjHzLlf52YorovI5CLr8C4jQQHdCKNOwtMsV JA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4v78g3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 14:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aA8s+8zBwL7u/n3EFIOZuXvPCOtmtbXTFywy3JfHsZmPUFvC3thZtSWS1BLZu8T9SwWSIXmQOVNxw/oIXrpK+ZputVofKw+NUqOJrQgfypRrD+awi5+CbupbM4pePgFPhyglrG4j6Ue9M+f/MOYku5y5EirE9QpaIfYG/dgM6hFD2wF1tZWKhn1fuqIto30aojsLw3WicZj5AmJiOUaLS+o8786Wv4Iy2tcIShl2AJDIpaz+ZbHcTBQvJGydQlrknnFIKr+kJKW0pFhQQ/U8kWZdCRhaID+vBAKDtzNq5ONaondXAkUVyGXz0fIeFmgqTkurWHtBRauwLl4yTQgGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SpDJOu6/K48lnAUM55yFhHe1faZiHJHWzK0TWSHxTE=;
 b=Qi5ORllChx3X2kDe3M6R+bYemkU0r03gGFt9pX8+WNHbkk2NW6jEHD6B20XB6NIMKBFYsc2dBt4afSwvQ7B7SPEAXO1lex8JU70Nj9o/s5yU3twJA8gsA3349r68HualHnJl53tp6DUnB0oEQrRUiZtgCLdt3ZWGZpicp52PC1Fo4xbWm2keOn5Kk2zvjgk6pV5bm5I5NnIQAJ6IUYaWhs5XQoUCAPZc6i0/G1uQ7Se3g6vOb3Ug1uVhXBz+5g4LCwGb5h/bxmFyAUyToyqWSwBW0/YxQPw3viw5dF5JMuuKBjZ3Vj+mEswGzVh4hnIu/atjaAC9jHcWBjXJi5WF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH8PR11MB6611.namprd11.prod.outlook.com (2603:10b6:510:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 14:08:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 14:08:11 +0000
Content-Type: multipart/alternative;
 boundary="------------xsPKk4L0D03brCYyihPkAGc3"
Message-ID: <29755fd3-a605-6c2a-a703-a68a7b928d86@windriver.com>
Date: Wed, 14 Sep 2022 10:08:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [kirkstone][PATCH v2] busybox: add devmem 128-bit
 support
Content-Language: en-CA
To: "Yu, Mingli" <mingli.yu@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <17149C4A25D72AE1.21543@lists.openembedded.org>
 <20220914072059.3509603-1-mingli.yu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220914072059.3509603-1-mingli.yu@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH8PR11MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 3568dcdb-09a9-4663-5f80-08da965a8eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d3Likdi5jiza0ad7ojR50Vq+w6iWZhl53jiuJnlKQ+YhnIzIVDYjxETseSoKMJCOEeYK9tAPEQapMHRttE+CR5/iRHGUQQxIKnOTrrqMzBeRWVa6lbvjWFn8jO2Des1EmCNdK4DGv2SRsH8cQsmEL/gDKRLLLXSy/i16HFrgEN8wE8BYoNgS6007qT1GkbqNNVHs8Lp9XE7VS4tCRHboDtsgmfcALQeeLGTHFP6D2qrzyk30+12bmFkPH1sTe4A0uqatWh/rLZ5mzreztQZU3W8XzhiTqDC2Ju00t9oQRDbsiOeCwsjBPP/3LU5f6mQk5nQjZM6ADDYOMId583/Oxj0UWIeaPabVXIl2w6eQrJAiRt6sHgpG3jTQFGi5FCFTedUOgMiOOtllIQCgLFXHuIvJNXGRCqJwbcpQ+ee+urfmIsEM6hYNR0bUmZ6uxVWXgGs8Nd/f/CCaGJ++X+pXdjYbFHNhy1eeGEFpDPXYyp7zbZgrbn7973n7dJ91PAI0DnJ7yp+Quo1TPNCceleEH+uaWOm77YynSiFsxXckplD14JyDdUO7qQbnmjCrMUxDG1KcY8p5Cvyp6Nwo5IXki/Y1oU1Si5mWJ+SLhoiTJp7LqrOnC3TTqfBqlaz5LFrQp//1ZoC/mPr5UryAwvyfD4gqwKs87nPWAR5VTZIWiOkUKCDTxisXUPeuGo1NUvHdO7PaaDjXVzRv5nHw6oyl2P0Wk6WPYmMqY5BOZq/V8U4o/I+0AuhH34SBBcMg+DUbY4qXDYv0YJRZj9d/1MAZJpj/BnlO4lHdEs1ojpMLFE+vhcc+tkRApRlVxm1Omx5Rhr3bCWzZQPkWH18xH1WE2RCYYcSy0R8pwA19oNZmsm4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199015)(31696002)(36756003)(86362001)(2906002)(83380400001)(5660300002)(30864003)(8936002)(316002)(8676002)(31686004)(66556008)(66476007)(66946007)(166002)(38100700002)(6486002)(478600001)(41300700001)(966005)(6512007)(26005)(53546011)(186003)(33964004)(2616005)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDZNbXhBaWhScXhRNjJJMXhNeHNlY2tPdExDRmJCNWNrMklTdzRQZ242Yncx?=
 =?utf-8?B?cG9WMXh5MzRIOC9XbENWRmxCOTNrY1RpU1ZTQlFLUXdDdE9ITE5OM3VPUjNi?=
 =?utf-8?B?WVZ0RTFIVHlaeHdUZDg3dzBGdlBsd1E0Mlo5ZUNPeEorSUxCQWw0SlIxeEMv?=
 =?utf-8?B?bWJlelliR0hla3dUZDFqa1pDNWR5aTVHakFTSENNTEJQOFpncG9MN2lFZ2Nz?=
 =?utf-8?B?MWphR1BuaGxkUUZuZnV5OUt2UGl0amRRcTVPSTBUZEJnZjZEVTh1blRpd0dL?=
 =?utf-8?B?Ni9RZVRaYk1ub29TVGNyQVl2VmZzQS94L0wvbzRlVThHYTV2U2RUN3lSd2Yr?=
 =?utf-8?B?aG96R3VIeTd4UzdXL0dRRG4yb29WbVB5b2ZsRkY0N0pMUU5CSVJ6ZGE4TzRK?=
 =?utf-8?B?emV3dWlzeXJpWTZEbElpM2p0VUprQlp4Ky95bFBUaElnaWZsMXVzK01zVml4?=
 =?utf-8?B?ZFl2dUNSSHpzSlVpdm5LbEI5Q1NKNWZkY3dvZmFmU2FBSU5YdHVDN2lOa2pY?=
 =?utf-8?B?ZG9WOVZoK3lNSnEraVU0V3pzdWkrZDFKeHRwMGttaDQyam1tY2ZFN1hPU2Nu?=
 =?utf-8?B?TWJMTkZBNzBtUW96YkQrQ3llQ3dOdHhDQUZLVHZSVGVMbnZMRWNkZ2p4TTVL?=
 =?utf-8?B?SklKU3JjeGlMbXM5akpWNlBNckl6TFZSZ09abE9pNmZScWtSVDExNEVLSlVS?=
 =?utf-8?B?c1dFOGpxd1NicXQ5UjMxSys3RFJtY1ZYR0ZDQVBWYzI5bDlnc2xtTGUzWW5U?=
 =?utf-8?B?WGZnUWs3Zmo3amJNWXljUTdCTXVJWjE5bXAzcGxnZWk5TjJmS3I2elZYZ2FH?=
 =?utf-8?B?WWtLenc4RjFuUm4wRlB5S3FJRmxkUkYxYm1XME9wU3g2OWxaUVhEaWhpc3NO?=
 =?utf-8?B?YlhNejEwY1UrdE9BdVd0dlB2aUJ4VXNhMUZXdjFOdnhWNmo1VEc4QVFCSTRS?=
 =?utf-8?B?emxjM09PYVBPUnMzeUJDSE1nVy9sNUVJYlR5NTVhWDQwZjdFaml2ZTkybkdV?=
 =?utf-8?B?RVNBamtuRmZmbm1RTithK3pVTzVXOG9UWFRLQ05uOWtRQ0xyVzB5aXkyM1Bs?=
 =?utf-8?B?ZjFLb3J1MTYva1IwV2Rma29OUXF3UlRtYkFzQUczWDY0bWpvWUw2UFZqYVh4?=
 =?utf-8?B?VzNQZFVQU1dwWERtS2YzWUY5eHowaU9nN2RSaGVGVktnd2JydVdUeXdlR1E3?=
 =?utf-8?B?SGV3NFFCVUVkdWVjWGMrOXhaL2FxUEtqK0VYc1c4SWVHY2UxWGM1U1BiMGNJ?=
 =?utf-8?B?ZzlXc2tFMWh6eFBqTVZXT0t3ZTA1eHhhSFByQ2xKaENsUXNsSUN1VURvRkI0?=
 =?utf-8?B?UEZKTGEvcmI5ZGc3U0l3U2xZM2hCTHRneHZQSzg0QmJ1TWdlQkRYME81V0hV?=
 =?utf-8?B?Y1VvaTh6bFg1VHdTV0ROVTRKeit4cGJnZjErMmVGbXcyeDgxUFZraXpsZFZ5?=
 =?utf-8?B?OS80Z2l5SGgwWXJUZjFBT2hvOGgxdEpFQmZncldpSE05bG5JRVhMVWJDYkxv?=
 =?utf-8?B?dCtHRm9MZHBjU1BZQ09iMERxNzBSUUdWakYya3cxUjNKMEpSeFpDUm1MRENJ?=
 =?utf-8?B?QjRlSXdac01hOHVWRldEOWZsekNlUWpsdGZMM1BmSURtRXAzOWRzZ3JQdjQv?=
 =?utf-8?B?Z2FtZWdJZFZ3TkVhZ3lIV2hwYUdQTDVNWURLY2xUVnhZRW0vSWVxQ21iK2JB?=
 =?utf-8?B?TDNGdjZ0OEdjQ2tkcm1uSUd6eWpWT1daamxObWx1SHZRUzZ0U3ZJOTlaL0V6?=
 =?utf-8?B?RmlKY1drQ09TeGp4d2FyMDZuK2x3RU1wNkRxbjllRlpyUHRBT0pwN1hDT0Iy?=
 =?utf-8?B?R0hUNXNneGZkT0szSjdHcVpFS3hGZ1RSeVZaL0xnRHVpNlJHOXdndE9QVkl4?=
 =?utf-8?B?MmdGR2RNOUw0ZzQ5UDFoTHdSS1BMWkh5ZS9BYkpFbDR5OXg0QXZKT3ZNcnkw?=
 =?utf-8?B?WFhNNG5hcWJQYjVyRkNRK1NQaHcwaUtTT3BEelA3V01BVG9wSmlHS3VyRTVj?=
 =?utf-8?B?WDlhSWd6MTV0RFladjhHbmJoKzY5WmllRWEvdVk0ckFvU0FFNU13ckR2VXha?=
 =?utf-8?B?bjYzSWdkc05qcUNWV1NyaG5sSGJ5cnhVb21vbFJybGxPbGx4dUJjS1psTGhy?=
 =?utf-8?B?c0VDaUtOZlZOOXFnU2lwd25DdUtPQzRUcG5sTWdEM3JjZmtBU0I3NWJya1ky?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3568dcdb-09a9-4663-5f80-08da965a8eab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 14:08:11.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0wteOaKHsv8ddIIAUallW+x1ts8H47PEW4jHkhZPFxtfPbfUXoAB0k9k6mKfOhH+EZGU4bBMXXprQT6+tVyZZtiDqGnH4jYcouh9sZbRkJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6611
X-Proofpoint-GUID: ttaGesu4Difya6Q9ViwUDR26x3BNrxtR
X-Proofpoint-ORIG-GUID: ttaGesu4Difya6Q9ViwUDR26x3BNrxtR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 14:08:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170658

--------------xsPKk4L0D03brCYyihPkAGc3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28ECX0Nk027111

On 2022-09-14 03:20, Yu, Mingli wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
>
> Add devmem 128-bit support [1].

We should merge to master as well but I don't think we need to enable=20
devmem, especially in kirkstone.
If a user wants to do that, that's fine.

My notes:

I think that back-porting this commit is low risk since it only adds a=20
new, non-default ability in a compatible manner and
more importantly 'devmem' is NOT built by default. Therefore, other=20
users are not affected by including this patch.

devmem is a small program that reads and writes from physical memory=20
using /dev/mem.

Usage is:

$ busybox devmem --help
...
Usage: devmem ADDRESS [WIDTH [VALUE]]
Read/write from physical address
 =C2=A0 =C2=A0 ADDRESS =C2=A0 =C2=A0Address to act upon
 =C2=A0 =C2=A0 WIDTH =C2=A0 =C2=A0Width (8/16/...)
 =C2=A0 =C2=A0 VALUE =C2=A0 =C2=A0Data to be written

This commit adds 128 bit as a supported WIDTH.

The patch cherry-picks back to 1.35.0 *cleanly* and doesn't require=20
pulling in any other commits.
It *does add new functionality* but the patch is written such that if=20
_/SIZEOF_INT128/_ isn't define, the code is practically unchanged.

There hasn't been a release of busybox since Dec 2021 so we should=20
backport this patch to oe-core/master and oe-core/kirkstone.


>
> [1]https://git.busybox.net/busybox/commit/?id=3Dd432049f288c9acdc4a7caa=
729c68ceba3c5dca1
>
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> ---
>   .../0001-devmem-add-128-bit-width.patch       | 128 +++++++++++++++++=
+
>   meta/recipes-core/busybox/busybox/defconfig   |   2 +-
>   meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
>   3 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-=
128-bit-width.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-=
width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-w=
idth.patch
> new file mode 100644
> index 0000000000..985e2bf1d9
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.p=
atch
> @@ -0,0 +1,128 @@
> +From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
> +From: Aaro Koskinen<aaro.koskinen@nokia.com>
> +Date: Thu, 25 Aug 2022 18:47:02 +0300
> +Subject: [PATCH] devmem: add 128-bit width
> +
> +Add 128-bit width if the compiler provides the needed type.
> +
> +function                                             old     new   del=
ta
> +devmem_main                                          405     464     +=
59
> +.rodata                                           109025  109043     +=
18
> +----------------------------------------------------------------------=
--------
> +(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: =
77 bytes
> +
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
d432049f288c9acdc4a7caa729c68ceba3c5dca1]
> +
> +Signed-off-by: Aaro Koskinen<aaro.koskinen@nokia.com>
> +Signed-off-by: Aaro Koskinen<aaro.koskinen@iki.fi>
> +Signed-off-by: Denys Vlasenko<vda.linux@googlemail.com>
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++---------------=
-
> + 1 file changed, 44 insertions(+), 24 deletions(-)
> +
> +diff --git a/miscutils/devmem.c b/miscutils/devmem.c
> +index f9f0276bc..f21621bd6 100644
> +--- a/miscutils/devmem.c
> ++++ b/miscutils/devmem.c
> +@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + {
> + 	void *map_base, *virt_addr;
> + 	uint64_t read_result;
> +-	uint64_t writeval =3D writeval; /* for compiler */
> + 	off_t target;
> + 	unsigned page_size, mapped_size, offset_in_page;
> + 	int fd;
> +@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
> + 			width =3D strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
> + 			width =3D sizes[width];
> + 		}
> +-		/* VALUE */
> +-		if (argv[3])
> +-			writeval =3D bb_strtoull(argv[3], NULL, 0);
> + 	} else { /* argv[2] =3D=3D NULL */
> + 		/* make argv[3] to be a valid thing to fetch */
> + 		argv--;
> +@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv=
)
> + 	virt_addr =3D (char*)map_base + offset_in_page;
> +
> + 	if (!argv[3]) {
> +-		switch (width) {
> +-		case 8:
> +-			read_result =3D *(volatile uint8_t*)virt_addr;
> +-			break;
> +-		case 16:
> +-			read_result =3D *(volatile uint16_t*)virt_addr;
> +-			break;
> +-		case 32:
> +-			read_result =3D *(volatile uint32_t*)virt_addr;
> +-			break;
> +-		case 64:
> +-			read_result =3D *(volatile uint64_t*)virt_addr;
> +-			break;
> +-		default:
> +-			bb_simple_error_msg_and_die("bad width");
> ++#ifdef __SIZEOF_INT128__
> ++		if (width =3D=3D 128) {
> ++			unsigned __int128 rd =3D
> ++				*(volatile unsigned __int128 *)virt_addr;
> ++			printf("0x%016llX%016llX\n",
> ++				(unsigned long long)(uint64_t)(rd >> 64),
> ++				(unsigned long long)(uint64_t)rd
> ++			);
> ++		} else
> ++#endif
> ++		{
> ++			switch (width) {
> ++			case 8:
> ++				read_result =3D *(volatile uint8_t*)virt_addr;
> ++				break;
> ++			case 16:
> ++				read_result =3D *(volatile uint16_t*)virt_addr;
> ++				break;
> ++			case 32:
> ++				read_result =3D *(volatile uint32_t*)virt_addr;
> ++				break;
> ++			case 64:
> ++				read_result =3D *(volatile uint64_t*)virt_addr;
> ++				break;
> ++			default:
> ++				bb_simple_error_msg_and_die("bad width");
> ++			}
> ++//			printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> ++//				target, virt_addr,
> ++//				(unsigned long long)read_result);
> ++			/* Zero-padded output shows the width of access just done */
> ++			printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result=
);
> + 		}
> +-//		printf("Value at address 0x%"OFF_FMT"X (%p): 0x%llX\n",
> +-//			target, virt_addr,
> +-//			(unsigned long long)read_result);
> +-		/* Zero-padded output shows the width of access just done */
> +-		printf("0x%0*llX\n", (width >> 2), (unsigned long long)read_result)=
;
> + 	} else {
> ++		/* parse VALUE */
> ++#ifdef __SIZEOF_INT128__
> ++		unsigned __int128 writeval =3D strtoumax(argv[3], NULL, 0);
> ++#else
> ++		uint64_t writeval =3D bb_strtoull(argv[3], NULL, 0);
> ++#endif
> + 		switch (width) {
> + 		case 8:
> + 			*(volatile uint8_t*)virt_addr =3D writeval;
> +@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **arg=
v)
> + 			*(volatile uint64_t*)virt_addr =3D writeval;
> + //			read_result =3D *(volatile uint64_t*)virt_addr;
> + 			break;
> ++#ifdef __SIZEOF_INT128__
> ++		case 128:
> ++			*(volatile unsigned __int128 *)virt_addr =3D writeval;
> ++//			read_result =3D *(volatile uint64_t*)virt_addr;
> ++			break;
> ++#endif
> + 		default:
> + 			bb_simple_error_msg_and_die("bad width");
> + 		}
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes=
-core/busybox/busybox/defconfig
> index 5e1e1f5638..58d393ad87 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -782,7 +782,7 @@ CONFIG_FEATURE_CROND_DIR=3D""
>   # CONFIG_DEVFSD_FG_NP is not set
>   # CONFIG_DEVFSD_VERBOSE is not set
>   # CONFIG_FEATURE_DEVFS is not set
> -# CONFIG_DEVMEM is not set
> +CONFIG_DEVMEM=3Dy
As mentioned above, I don't think we need to enable DEVMEM but only

carry this small patch.

Thanks,

../Randy


>   # CONFIG_FBSPLASH is not set
>   # CONFIG_FLASH_ERASEALL is not set
>   # CONFIG_FLASH_LOCK is not set
> diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes=
-core/busybox/busybox_1.35.0.bb
> index edf896485e..e9ca6fdb1a 100644
> --- a/meta/recipes-core/busybox/busybox_1.35.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -50,6 +50,7 @@ SRC_URI =3D"https://busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \=20
> file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch=20
> \=20
> file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch=20
> \ file://CVE-2022-30065.patch \ +=20
> file://0001-devmem-add-128-bit-width.patch \ "
>   SRC_URI:append:libc-musl =3D" file://musl.cfg "
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170637):https://lists.openembedded.org/g/openembedd=
ed-core/message/170637
> Mute This Topic:https://lists.openembedded.org/mt/93673250/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------xsPKk4L0D03brCYyihPkAGc3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-09-14 03:20, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220914072059.3509603-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Add devmem 128-bit support [1].</pre>
    </blockquote>
    <p>We should merge to master as well but I don't think we need to
      enable devmem, especially in kirkstone.<br>
      If a user wants to do that, that's fine.</p>
    <p>My notes:<br>
    </p>
    <p>I think that back-porting this commit is low risk since it only
      adds a new, non-default ability in a compatible manner and<br>
      more importantly 'devmem' is NOT built by default. Therefore,
      other users are not affected by including this patch.<br>
    </p>
    devmem is a small program that reads and writes from physical memory
    using /dev/mem.<br>
    <p>
      Usage is:</p>
    <div class="preformatted panel" style="border-width: 1px;">
      <div class="preformattedContent panelContent">
        <pre>$ busybox devmem --help
...
Usage: devmem ADDRESS [WIDTH [VALUE]]
Read/write from physical address
&nbsp; &nbsp; ADDRESS &nbsp; &nbsp;Address to act upon
&nbsp; &nbsp; WIDTH &nbsp; &nbsp;Width (8/16/...)
&nbsp; &nbsp; VALUE &nbsp; &nbsp;Data to be written
</pre>
      </div>
    </div>
    <p>&nbsp;</p>
    <p>This commit adds 128 bit as a supported WIDTH.</p>
    <p>The patch cherry-picks back to 1.35.0 <b>cleanly</b> and doesn't
      require pulling in any other commits.<br>
      It <b>does add new functionality</b> but the patch is written
      such that if _<em>SIZEOF_INT128</em>_ isn't define, the code is
      practically unchanged. <br>
      &nbsp;</p>
    <p>There hasn't been a release of busybox since Dec 2021 so we
      should backport this patch to oe-core/master and
      oe-core/kirkstone.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20220914072059.3509603-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">

[1] <a class="moz-txt-link-freetext" href="https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1">https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1</a>

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++++++++++++
 meta/recipes-core/busybox/busybox/defconfig   |   2 +-
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 3 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
new file mode 100644
index 0000000000..985e2bf1d9
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
@@ -0,0 +1,128 @@
+From d432049f288c9acdc4a7caa729c68ceba3c5dca1 Mon Sep 17 00:00:00 2001
+From: Aaro Koskinen <a class="moz-txt-link-rfc2396E" href="mailto:aaro.koskinen@nokia.com">&lt;aaro.koskinen@nokia.com&gt;</a>
+Date: Thu, 25 Aug 2022 18:47:02 +0300
+Subject: [PATCH] devmem: add 128-bit width
+
+Add 128-bit width if the compiler provides the needed type.
+
+function                                             old     new   delta
+devmem_main                                          405     464     +59
+.rodata                                           109025  109043     +18
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 77/0)               Total: 77 bytes
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1">https://git.busybox.net/busybox/commit/?id=d432049f288c9acdc4a7caa729c68ceba3c5dca1</a>]
+
+Signed-off-by: Aaro Koskinen <a class="moz-txt-link-rfc2396E" href="mailto:aaro.koskinen@nokia.com">&lt;aaro.koskinen@nokia.com&gt;</a>
+Signed-off-by: Aaro Koskinen <a class="moz-txt-link-rfc2396E" href="mailto:aaro.koskinen@iki.fi">&lt;aaro.koskinen@iki.fi&gt;</a>
+Signed-off-by: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ miscutils/devmem.c | 68 ++++++++++++++++++++++++++++++----------------
+ 1 file changed, 44 insertions(+), 24 deletions(-)
+
+diff --git a/miscutils/devmem.c b/miscutils/devmem.c
+index f9f0276bc..f21621bd6 100644
+--- a/miscutils/devmem.c
++++ b/miscutils/devmem.c
+@@ -29,7 +29,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ {
+ 	void *map_base, *virt_addr;
+ 	uint64_t read_result;
+-	uint64_t writeval = writeval; /* for compiler */
+ 	off_t target;
+ 	unsigned page_size, mapped_size, offset_in_page;
+ 	int fd;
+@@ -64,9 +63,6 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			width = strchrnul(bhwl, (argv[2][0] | 0x20)) - bhwl;
+ 			width = sizes[width];
+ 		}
+-		/* VALUE */
+-		if (argv[3])
+-			writeval = bb_strtoull(argv[3], NULL, 0);
+ 	} else { /* argv[2] == NULL */
+ 		/* make argv[3] to be a valid thing to fetch */
+ 		argv--;
+@@ -96,28 +92,46 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 	virt_addr = (char*)map_base + offset_in_page;
+ 
+ 	if (!argv[3]) {
+-		switch (width) {
+-		case 8:
+-			read_result = *(volatile uint8_t*)virt_addr;
+-			break;
+-		case 16:
+-			read_result = *(volatile uint16_t*)virt_addr;
+-			break;
+-		case 32:
+-			read_result = *(volatile uint32_t*)virt_addr;
+-			break;
+-		case 64:
+-			read_result = *(volatile uint64_t*)virt_addr;
+-			break;
+-		default:
+-			bb_simple_error_msg_and_die(&quot;bad width&quot;);
++#ifdef __SIZEOF_INT128__
++		if (width == 128) {
++			unsigned __int128 rd =
++				*(volatile unsigned __int128 *)virt_addr;
++			printf(&quot;0x%016llX%016llX\n&quot;,
++				(unsigned long long)(uint64_t)(rd &gt;&gt; 64),
++				(unsigned long long)(uint64_t)rd
++			);
++		} else
++#endif
++		{
++			switch (width) {
++			case 8:
++				read_result = *(volatile uint8_t*)virt_addr;
++				break;
++			case 16:
++				read_result = *(volatile uint16_t*)virt_addr;
++				break;
++			case 32:
++				read_result = *(volatile uint32_t*)virt_addr;
++				break;
++			case 64:
++				read_result = *(volatile uint64_t*)virt_addr;
++				break;
++			default:
++				bb_simple_error_msg_and_die(&quot;bad width&quot;);
++			}
++//			printf(&quot;Value at address 0x%&quot;OFF_FMT&quot;X (%p): 0x%llX\n&quot;,
++//				target, virt_addr,
++//				(unsigned long long)read_result);
++			/* Zero-padded output shows the width of access just done */
++			printf(&quot;0x%0*llX\n&quot;, (width &gt;&gt; 2), (unsigned long long)read_result);
+ 		}
+-//		printf(&quot;Value at address 0x%&quot;OFF_FMT&quot;X (%p): 0x%llX\n&quot;,
+-//			target, virt_addr,
+-//			(unsigned long long)read_result);
+-		/* Zero-padded output shows the width of access just done */
+-		printf(&quot;0x%0*llX\n&quot;, (width &gt;&gt; 2), (unsigned long long)read_result);
+ 	} else {
++		/* parse VALUE */
++#ifdef __SIZEOF_INT128__
++		unsigned __int128 writeval = strtoumax(argv[3], NULL, 0);
++#else
++		uint64_t writeval = bb_strtoull(argv[3], NULL, 0);
++#endif
+ 		switch (width) {
+ 		case 8:
+ 			*(volatile uint8_t*)virt_addr = writeval;
+@@ -135,6 +149,12 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
+ 			*(volatile uint64_t*)virt_addr = writeval;
+ //			read_result = *(volatile uint64_t*)virt_addr;
+ 			break;
++#ifdef __SIZEOF_INT128__
++		case 128:
++			*(volatile unsigned __int128 *)virt_addr = writeval;
++//			read_result = *(volatile uint64_t*)virt_addr;
++			break;
++#endif
+ 		default:
+ 			bb_simple_error_msg_and_die(&quot;bad width&quot;);
+ 		}
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 5e1e1f5638..58d393ad87 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -782,7 +782,7 @@ CONFIG_FEATURE_CROND_DIR=&quot;&quot;
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_DEVMEM=y</pre>
    </blockquote>
    As mentioned above, I don't think we need to enable DEVMEM but only
    <br>
    <p>carry this small patch.</p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20220914072059.3509603-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 # CONFIG_FBSPLASH is not set
 # CONFIG_FLASH_ERASEALL is not set
 # CONFIG_FLASH_LOCK is not set
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index edf896485e..e9ca6fdb1a 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -50,6 +50,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch\file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch\file://CVE-2022-30065.patch\+file://0001-devmem-add-128-bit-width.patch\">&quot;https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
+           file://0001-devmem-add-128-bit-width.patch \
            &quot;</a>
 SRC_URI:append:libc-musl = <a class="moz-txt-link-rfc2396E" href="file://musl.cfg">&quot; file://musl.cfg &quot;</a>
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#170637): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/170637">https://lists.openembedded.org/g/openembedded-core/message/170637</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/93673250/3616765">https://lists.openembedded.org/mt/93673250/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------xsPKk4L0D03brCYyihPkAGc3--

