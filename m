Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A417EB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 02:01:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.381.1688004082049637263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 19:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rmP4vCh1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6544e6c4c4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T1vcFc009598
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ky2bWdFZBqElTdO2hnlUDbTzDQ9kJlX5OsxkI7DYJrU=; b=
	rmP4vCh1LDeddqyBAjP+2qIhcaZEvPCAnU3aD9d3PZ1jTBvLN4H8oHvysaCGGAc5
	SaELt6b/vmNShr5T65p+kI+q2yzoPin5eJWzdyCeC97VuYOW4wtIKf9sy/KScB/a
	DAne4lLuw1bIzruEtSPD1sSoeaz5TI0XDBcjsSqwg4sj+0SkXoBY3p6DN3tXRoaP
	2dFKh1zVLsk2Ev7nH+13zMT9hXeTUV2BjZK0+rVWxuMP+KSvlVxtSYWPQb1pRnAq
	KKukz/3v0m/I9jZxZLszLtBSvHQLyPFmnZH9x0/4Lx9nif0VqeWt/MohO2LksY2x
	1pvbyrFpVyeQ4AXpkvmzVA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4ce1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:01:21 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35T21KVu013542
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:01:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4ce1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 02:01:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOWp9AovLJz1sqndpPkaAJZ4+L/TQUHdjmsScfbPic5MYW46Ewy2aXfULCJN2tt2X/+rRxeebKtTrL+OByoPtqAtdmE6HIOIZWkDv5BSBmerYN3kiEkxP+3rR4nv6oiGQz/PevBoG1Q8gHCgo49+AvfL9N5DWAGNNqbK7jfQhA2n2A6QdebKgEo3lnkOnFKvpKf0jcdhHfXSWFtIROoZk+3xzX5rn5TslPPpywIwz+5+8QbzS85wS433cmDt8AzZS6gfeTShmy69uU74Rb/4YGToQYxUlhnG+PpZaeCLn8e2nF2SL3Ky6HYfiwgOim9HQA6mHXuLNYgCuu0zW7kD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky2bWdFZBqElTdO2hnlUDbTzDQ9kJlX5OsxkI7DYJrU=;
 b=QmBIBsgA8yi9ODaGMzRemf71N7skZuX4pREMgTwPNZZNE/iOx+GCf7mQ6pFQTqAVcBN8OuxVHmOnnW+WuoeGM7Fs3FYMma07XlUlUB0o97ny067X/g9JAgx7m7xLEqLQXNJXsHTQfcQ+pR97SnuT3/p/lfW2SktGSbTrXE+M3VD6vu/+dR6CD15M6x5Fi32q02sU/rtCVSuNA5nlPWwDnihyoPxYM5ndV/X5KgX5ePUvCWtUIrgvKPKtX3ffEtyYeUwtvBG8flUvoSgTuGUjo+1VK7hydiny3W8E+KBx4Jz5cjBlog3O5hcCemerZKJM74ROt+ZlfPlfA3OTUkNOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 02:01:15 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::5896:32db:f6ae:c431%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 02:01:15 +0000
Message-ID: <cb52a3c5-4153-3f77-5307-95229f69650b@windriver.com>
Date: Thu, 29 Jun 2023 10:01:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] qemu: Install the default qemu emulation rpm
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        alexandre.belloni@bootlin.com
References: <1768C72652DD9852.10197@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <1768C72652DD9852.10197@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 40753756-3760-46c1-71c4-08db7844b876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J2A7Gq9Q0zvxFE2onHX6D0EykVmgACgZY5OM7mo+IAwX8kJmQXzK2+tcM7bsn9AmuK9agQr4e8YXUNG9OwF/+6rXpxx/PVpgKGulxHQ3lAEsWqqWdB6b0DtBJ+GH36MZX/3gp/YB5zEyuSmEQB0oVeT3t8E0MGg5wdiNUZm1I9fZno57bimmSH4FexCyMjsEhSIFwM22LwSVvXNq3pxZfRToNNibLISjOnenRs+FrRYUqasNDncnHdo3sajGrTIvj/9w/z3wQNMNd09Ag4F0XM7vGojt7lSo4VoIcRSEANzqduKnbxjmiyRMVLvpa3XPKSDPIaN3bAlNkSmlvncyfYEWPUKhrOFErT9sYaq1TJ9VQuzv3/xu4ybh0whV9NWygRrGFz5oQIqEC0pt3+QWmPy8grGGQGwtYpegi5FsxqW8o0U+6Y3Rr+mfx1IfwOUV0yAf9VzGWEp1nyKdty1MMHmWxskm9X51r41f8F77kRUvHpo88ytm83J/4McOJiQAxvnLgRLNpjp+Hrg3B1WXSRgR/JyKvepUp0VNPah+CMKz03ii4Jvb0vo5+3FyTzCo0D1NLxUN9xrH8VDvBjavzIiBMSu7bkwugSqi6E12yslCD6/h2Mu0Kgwc1yUsHlw8a+GJkcNEIVgawKbLBnbHNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(451199021)(6512007)(26005)(2906002)(86362001)(6486002)(6666004)(53546011)(38100700002)(83380400001)(2616005)(186003)(966005)(31696002)(41300700001)(478600001)(36756003)(66946007)(66556008)(316002)(66476007)(31686004)(6506007)(5660300002)(8676002)(8936002)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWR0NGdlTXRwVGtBcmJYVWp5Ykg2bXd5aHphOVAyUi9wbVFBYW0yc0NQeWJj?=
 =?utf-8?B?KzJqZlFqZ1lUbWdMTWRBcDFka1VhbkxaRGw5a1ZpRjFhblZqSWtLU0ZSbFRu?=
 =?utf-8?B?NWxsUHc0d2w1UG5oRm1Cc25oTTlLK2pLUVBkaGlhRWl4T3ZRdTA0NWFHL3JR?=
 =?utf-8?B?Ly83Q3JVNmJONXVRcWt6Y1ptU2Y2OXpLTmlCN0I1RHBSOGZneXd2K09GQjVK?=
 =?utf-8?B?YnE5dHl1NkxTKzhhZkhMOGs0RXJ5VUdqcHZTMFcwaC95cUx5KzQrUVViU3pa?=
 =?utf-8?B?L1dCaytrUjRWVjVBRXN6bFIzUkVYQWxBeWd4Z1g0U0J2Z3k3b0hPeGgwWUR2?=
 =?utf-8?B?NFhIektnQVBxL1l2SU5nQmdSU1JSWjl0MjVrK2E5SktRYkw0L0kyUGFjbStR?=
 =?utf-8?B?d1BGcG11NHZ2amhWUG5uRTlYNEdaOHV1bmdwRFQ0bGIxQUwzSUVONWs2Nng0?=
 =?utf-8?B?NDB2Y3JpVmpUN3hxN2hScTh3Sm1zR2xaaFRWZHNOaUljWHRFV1psWkF5a3dk?=
 =?utf-8?B?cXlMdXZGNmtNRjVJSGlxVGJYS3phNkZFaUVXQ1dXZ1luSmhxU3UvbmViVkhF?=
 =?utf-8?B?RlFneE5idGFqdTQrc2RhZ3hjWXg3R3hQRHpQYUo4RURLN0xxSUxja2JuTEhI?=
 =?utf-8?B?a1NDSHVSVzJVeUxqSGUwMUtQRXoxZk1zQ2hIaE9kb3I4ayswLzlEOGtCTDh0?=
 =?utf-8?B?SkhUQWlxOFRMTmhSV2pxQXNRMVcva2pkM1pMNkpvS2J6NjFUSm95bVFmd1R4?=
 =?utf-8?B?NlZldHZKRG5TbjE2d3cxUHVwWlJuRmt3WjNpV1QzR0R2djJVY1dXZ2JqTHFM?=
 =?utf-8?B?NU5zUXBzV25iUlRJc1ljRUhmTFNvVzEyQkJ0V0hXakRWZzZkMFB5dlQ3bVpv?=
 =?utf-8?B?QzVpRWIvZlo1WmllOHozYnJTeFJjM0FZSVZvMno3LzB1Q1RJQXFJbWlWQ0N5?=
 =?utf-8?B?MGgvTko0c0RkZTZzdnNFYWtNTm4wdjZBUmUwdHhYbzY4OWpZY3E1d2NUelZq?=
 =?utf-8?B?VjNQSDlCYkRDM0k0Q2NmTE9xeDdHR0Q5LzFTSDBwS0FyTHJZVFdFQUk0c2Qv?=
 =?utf-8?B?K0dRYzk5a1libjlYYUtqalhGdE5QTSs0TXlGV2l2VTJKaWxOR1U5TVZieWVk?=
 =?utf-8?B?YkVKR2ZEa0kzVmJ1UHhqYjZnaysxN0ZUbHg1UTlzS252ZVh6NjU1OXZORUNh?=
 =?utf-8?B?aDRDanRYYzdHVmN5RnNiU2cyZDZKQld0ZXlIS3RKVUF5L2VTMUJRajFWUHZV?=
 =?utf-8?B?aTF5TXB0YitTSkFwcGVzMmZrRzdUbitnUkFjV0JSd3JnRWxFTDd4R01YcDNp?=
 =?utf-8?B?L1Rzek0xUHZzNjBJZjJlZ3kzQllObFBKSmMzLzFmK09CaHpCUXpZUWFLc0Ro?=
 =?utf-8?B?dlhxZERxS2FGdHhuS0hQeUtFdm13QXNPNHZVM0Y3K1d0Zmk5M0lER1dodFcz?=
 =?utf-8?B?ZXFzSTJLb2o3N0p5cHRVbFhoR1EwVXh2QjZFTVYyNUhxQ1JaaEFaZ1Y4eHFh?=
 =?utf-8?B?eTVLTEEvbVpjVFA1cTNxeDZXSGtreHJqN0hsNE9kUzY1RWV5aE5Zd0FmOHp2?=
 =?utf-8?B?L2lqMmJwbDZHZUtXQU5NQWpybmtGTjVHUllsMXYxU1Arb2FJZ1dySW01UHNi?=
 =?utf-8?B?QS9Hc3lSck9BNERnZHFxelpra20xV0JTb3h3UU9nL0tjVUVLSi9FM0R3L09G?=
 =?utf-8?B?U0ExVkdvYXVscVE3RmRwNUlsQ1NCa0JyekdRQ3dSZ3UzYUhjaHE1cVRoN3Ey?=
 =?utf-8?B?QkdscG9vTzdiTktGQU9nZ2JnQ0VHOTA3TWJNZC9DOS9PNE55ZmpBTXFZU01B?=
 =?utf-8?B?dmkzTWI5V0NpcENPam9WMHBVTmRrNmVXaEtRbWY2bEswUWYzTUp5bUhnQ2VN?=
 =?utf-8?B?TUVuNW5Nd3d0Vi81NXM0TFZVUXY5WTNnMzBkQnllNEtWTG5peTIySTN6aHNW?=
 =?utf-8?B?UndoOVJVRk1nTWErQUF1Yi9PQXNHdUJiTkd2NjU5WUpPbzlabURYVG14N1ly?=
 =?utf-8?B?QmJxOUxqaGVMMzU4ZC9tQTMzZzl3V2FFclZOaVdGdDlYV3kyM0FZVkNoSFND?=
 =?utf-8?B?WDVxcmIyWTNzSUcrVWliYlBLSUE5dXBmYkF6YnNZWGJyOE9wSWdVZE1qYXk4?=
 =?utf-8?Q?HjPjZjuoSZLur7oKBuJ3KFCX4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40753756-3760-46c1-71c4-08db7844b876
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 02:01:15.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hOmBDdhGkFYBDHxFOuhTIcwYa5DrCImCeHFiXyYK8YNME3FW1My5HHJZor1XBviAq60Ogkm+MFA0wgFKdSOuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-Proofpoint-ORIG-GUID: ivkioJNXnHVJPr6bbAw-NL3eCPI1iLdN
X-Proofpoint-GUID: nRNk1XAbVvDzUY5f4VCVKfdYav1meJZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=933 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183604

Please ignore this patch and use the patch "qemu: Add qemu-common 
package" instead.

And the patch "qemu: Add qemu-common package" fix the backward 
compatibility as 
https://patchwork.yoctoproject.org/project/oe-core/patch/20230627105627.2583973-1-mingli.yu@eng.windriver.com/.

Thanks,

On 6/15/23 16:17, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The qemu rpm can be split or not via customize PACKAGESPLITFUNCS and
> there is no specific qemu emulation rpm installed when we choose split
> the qemu rpms now.
> 
> To gurantee the basic usage, install the qemu emulation rpm which
> corresponding to the target arch by default when split the qemu rpm.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7d39f0a25d..c9df43a5a2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -248,6 +248,9 @@ python split_qemu_packages () {
>       mipspackage = d.getVar('PN') + "-user-mips"
>       if mipspackage in ' '.join(userpackages):
>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
> +
> +    targetarch = "${@'i386' if d.getVar('TARGET_ARCH') in ['x86', 'i486', 'i586', 'i686'] else d.getVar('TARGET_ARCH').replace('_', '-')}"
> +    d.appendVar('RRECOMMENDS:' + d.getVar('PN'), ' ' + d.getVar('PN') + '-user-' + targetarch + ' ' + d.getVar('PN') + '-system-' + targetarch)
>   }
>   
>   # Put the guest agent in a separate package
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182837): https://lists.openembedded.org/g/openembedded-core/message/182837
> Mute This Topic: https://lists.openembedded.org/mt/99544571/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

