Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F02C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 01:57:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28691.1668995871887666470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 17:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8324efdcf2=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL1eGMt005942
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 01:57:50 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48h80v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 01:57:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWwl9pRNEc5nSZ3/czCsKRJ/G/9ePRyNUOMYU6HtapQdcRMCOTHwF6hgtcKL9SARbVGqeBQRbC1WLiQsPSAF0Pj7nBQqINBYGCiGqdfY8zRlGme/lySXrJESsLw/i1mEXaoUsXLAIK2GutEJn0F8MLDbjpoWhYSs+KGt6VuRCu3fjLDT9yr6Cln2Q/oNC1jxvYxeBvJZZb4whsDLDWHkvPLuxPKZoQs27T6HisGL4p2VadknEc879lnl9q66/W+UOOIgmNrZ1LrbkS8y4Rfh5jSG/NTtHKRhqtAC5Vv6OErLrwCkdFM5PyBIScYJEOuR7hwD8XCqZxckfX6o2WD4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fQJV0uS4qUK8xC0dfRm5wG4padXjIGjOZ0LO3sk8Yc=;
 b=SlG90v+GdLEmj+agZFkhBB5T2+kAecmlcQX6tB4M32bqqEjZiGOj0Vo0me+8uMMDx1Vfbd0eIr9GFMnSz+pg3dj1MQJacxfKj1bUwZXLzYjAx/pZSo0CpQhTN4t+r9XpTiQWNMpocg7b2L7csnIGvIPFHFPTZMGXHSV4F4bA6+tJjS/tRW27Mxe6WaFPWdX8/sYm7jU3kTw3IZTi6pvNdYpDxzt7mzsntx8dDQ1r2s+Oepjfy3UuFFu2kGXbZMEWU3t4MIf0RIX00y8ufcLQVpkHwFTctSj/et55bSjhIub+lAOgwTjOAtRZj9qUozIZOG+E2tJAZzMHpuNE0MUePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CH0PR11MB5490.namprd11.prod.outlook.com (2603:10b6:610:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 01:57:49 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::accf:48c8:40d3:da7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::accf:48c8:40d3:da7%5]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 01:57:48 +0000
Message-ID: <8ad9e99b-d669-ddf3-f50a-e6183ad6bed5@windriver.com>
Date: Mon, 21 Nov 2022 09:57:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [kirkstone][master][PATCH V2] apt: fix do_package_qa
 failure
To: openembedded-core@lists.openembedded.org
References: <17071B2BCB39B264.608@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@eng.windriver.com>
In-Reply-To: <17071B2BCB39B264.608@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|CH0PR11MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 76157afc-ac5d-416f-7ec5-08dacb63c9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ux3rX7Zy5bfKM2BSRAUzPMmRcf0h9eQcQsfXNMZWb+tRyxuJwyGZ01huqsUJn+ydjSqpHID1WQcJZNrxp9ocLEEt/t4pzeWc8oxZ7OKph2Ed440rs6btwxX5Ead/WuaTzCYfGcHBERIUSxN7N+z/DgOoov4WbaxgOGtt4Xz5pz2I8ZGvgkeNEWdALzG4hGAgbCIqlb4Yr9682hWhcvbdI80E/DWEWTTMSI7tF/hDl/0+XOK75v7L0fJhxvveL5lAonKAu8wJDAHMWjDrqUPmJGgt9TwCDcrAqinzrdPiY8gq3mxrfR/75a7vJHZ4EoyATI3SNa6wxgMiKTwUBS/29v6ux9hAmPgIDvZxJ39/gqm0LwCZSzsqSbQJj0J4AUz6zC0i+JBoM64FgeY0ZpiAwW30bqZeEDakE6oKsIhjWzuysBd6RUYL/Lww92RFp7KzldkasOgqxdhWksyfXm4xd4Ni0uUlR3MzoOuoqcwCskLRJ+4IBqoCxN3+sErI6lGuDo09NbHmS2PFNIdncMCL6cDUafFI+GJ71MnXTLACosuzx1yFATzFOfjq0IQG6JG6iIj/7IyWIN7rvs3nI3I2ffCH4Yx/ejB1FqSk41CmpuUfdV5eKz2HBQ7Tw/OeS4pcc/3jdAAaEbmEh16I0F8rDEZkQUCj/LYGPAt2vk3iNEj4LQZFqzhnXA74Qeo2YpxXljITEmCvmqH2laWWUNmzgJaJbjezK8wzsjsXh+ty4rg5BIkOhKPN73Yr/pVgZoF7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39840400004)(376002)(366004)(396003)(346002)(451199015)(66476007)(8676002)(66946007)(31696002)(5660300002)(44832011)(316002)(36756003)(41300700001)(6512007)(9686003)(8936002)(53546011)(38100700002)(186003)(83170400001)(966005)(6486002)(6506007)(478600001)(6666004)(83380400001)(26005)(66556008)(6916009)(31686004)(66899015)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUw1WXVZSEZ4Zk9iU2JscitXOXNpd2hZRDRNSksvT00yb2RqTHFCYmt3Slgx?=
 =?utf-8?B?TXdDWlZsaHRmOEpkanZGdVJkdHYxV3hteVVNdmdqMjR5WGlHMThzY0NvQTlt?=
 =?utf-8?B?V3JKYVhHV1haTC9SVDJKeVFXVlRVWVJydVBiRWsxSFFTNWs3cjM0bllMOXFw?=
 =?utf-8?B?YXRhOXJ1ZDFPV2V2KzhxbE5zWDFYb2hpSEo3Y25RZnZHMDUzczJIajJhS21W?=
 =?utf-8?B?aXNnVWVrN0xlK0dSWkZIN29vYnZSODZQNUtYZmppUG5rMXFQTzNpbyt1ZFdZ?=
 =?utf-8?B?SDJFdjBCTjB2MVJld0ExUXdYZ2xITmxQcUduZkxURk5qQmo3MlpHb3ZRRGNj?=
 =?utf-8?B?RXlUSTNTV0VjTGZ4VkU0VVRPUGZUMldobHZPbDhkSTNGbGlhSTEvM3EwNm5Q?=
 =?utf-8?B?QXNWT05GVXRjY013UGNPUUcyQjFyRXdWK0oxZWdQSENGWjVEajRPMURJRVBL?=
 =?utf-8?B?bkVxMHVDbHdrZHJtRTV5eUtrblBXWWlac3NjUGJnWmg1dkxibTF0bjBjeStT?=
 =?utf-8?B?QVF6b3kxQlhzSjJxUVdrcjRJYUJ2S0Z3aEhkL1owUmtVclh6WjMxZmZxWHFp?=
 =?utf-8?B?VEdoM0xnellUQ29NU0RjenVKUStpZ1RCSFJVUU0zVHNWejNCbGg4YjY4UXVI?=
 =?utf-8?B?SksrdGN0Rlh4TjlWSURFR0hLcjdOMEp1U0UrWENvZURTeER0aFlWSzNjbXB5?=
 =?utf-8?B?V1V0Rlpjd21iNlE0dkNoai9IcHIydTkvbFZDNkJyelplVGRvaFQ2NlRlK0pk?=
 =?utf-8?B?U2ptckVsTWJxT0RDaWNZM09aWVRadnplOEZyY0srN0VidW5HbEV0NDI3NDRm?=
 =?utf-8?B?em1kZFlmNisvejZJWXg1VytKTE4zeVBzQzJvejV2OFJwVXl5L0ZISVM4a3dn?=
 =?utf-8?B?WE9jb3dDSGJ5QXc1cXpud1lRUS92WTQ3OG5qekdYd3g3NkFwQy80OGhFbDJR?=
 =?utf-8?B?cWZYTzZXTlpUT1BJUlR5bTRnSFNYeTMrK1ZVMUg0emZBcFhBZjBLcTI0QlND?=
 =?utf-8?B?YzZwTHRlc3hQc0xmSU15bWoycjZmYWt1L0dqZkZCR05zK0Z6Qm5JQjZHRVYx?=
 =?utf-8?B?Y0dkdWJsKzdGMllkajlkYjJMVEh0dXVRNExhaUx1QjAvVG9CUkVMeFViZUxH?=
 =?utf-8?B?VVZCdDNkcDh3MXMxUzM2S3pVY2NOdzVkTFFTVW9RQWRORWpjZ3BSZ01kZFdx?=
 =?utf-8?B?MUFLcTFLOStOSzdpS1ZwUmJwNmtyN0VsOTNGWnVEWlNOTUNqUnNqSFBBUVRx?=
 =?utf-8?B?dlRaem1RTXQyam9DOVI0T1p6NGxEODY5ejFHbnhwSmVwdnZRR1ppWkVZVTZr?=
 =?utf-8?B?N21kRzBINWpIN0thZ1lxdGROdG1xU2JXZE1XaDQ3bGhzZ0ZTN2c5MU5DUUxP?=
 =?utf-8?B?STJuQ3BMdU83Q2hVSHRQK1dGSnlubFM4YTFkWFp6NHZuQlljQ0VqRnJOTDd5?=
 =?utf-8?B?Qi9iMDdnU0txNmJVbjZvUEZGZmM4WThXMVJNYWVac0xTVmxkako3SXExU3p0?=
 =?utf-8?B?VnkwOWdlbWpYTHAvNXZtc0diSVpwdlI0dS81VXcyZGFVNlRYVXlNOWFYN2Qw?=
 =?utf-8?B?R2daTko3bkl6dEo2Q2xPTFltS1FVN2tQNjdncUhCbGpma1hMZE5EeUEvRlBH?=
 =?utf-8?B?eGdDODNiTnVieFZGazZTbjg5RHY1MmhiR1NlWnkvbklPR0thSE1HaklaMDhj?=
 =?utf-8?B?ZjZlSzVSOUtHYnhHekdtbEJLQnZKU2ZlcVBoTHhHV2hKMHdxVW1XREhmVFJt?=
 =?utf-8?B?amdIc1hPUVVDN1JHcjRkRnlWcUc5dUZPMThaMjYwdGdySlBLcU9xWmxtTTBt?=
 =?utf-8?B?VUFLOU5lUkpmOWZYNWhEejRSN1o4ekNZWlVXOTZRVGExU3pUb1RqT1ZDclV0?=
 =?utf-8?B?VUVlem83Tm9zdkhQWHZ4SDdkV3R3TUh2eWFpL0Jja3o5Z1VZbmRUZ1VtZE95?=
 =?utf-8?B?R1FSclNSMXQ4eWdHTFN0TWxITlpvS0t0R2JlQTB0M3FTVDBUb2Z4Z1lkbTVh?=
 =?utf-8?B?cDJVb2NXVFcrYlA5eEV1T2NxOXNrWmxWQW1VOUtrMnRTSW83T2lNM3lla0JX?=
 =?utf-8?B?SldpNit0bSthaEdBeWhzRjZHWkhOaEJoWXliVDB5YmNLc1hjc1I3VjZDK0NN?=
 =?utf-8?B?REdOY2ptUklBdDVTNFVHY1NuMXhMcXpLeU4wSmZTWTZwL3ZzSUdJMFovK2Vq?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76157afc-ac5d-416f-7ec5-08dacb63c9f4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 01:57:48.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHdmDlUV2dWhtcd/PX5mGz3qtlpu7LFlbdZWZaIGssEdQr8nou24s7uswixWD0L66MP7Vg0zYTvzFdOBIqqsmkSp1UBihV+v3X7NyauL7X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5490
X-Proofpoint-GUID: rHynS1UvrgWbgziNW_D5pKCVIrlaYfs-
X-Proofpoint-ORIG-GUID: rHynS1UvrgWbgziNW_D5pKCVIrlaYfs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 01:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173645


On 8/1/22 11:34, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> bitbake nativesdk-apt failed with error:
> ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]
>
> an empty dir apt is installed under /var/log/, fix the failure
> by removing the empty dir apt as what we have done for target.
> apt will create it when it does not exist.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
> index 95c25e3036..cb29c41ce0 100644
> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> @@ -117,6 +117,7 @@ do_install:append:class-native() {
>   
>   do_install:append:class-nativesdk() {
>   	customize_apt_conf_sample
> +	rm -rf ${D}${localstatedir}/log
>   }
>   
>   do_install:append:class-target() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168692): https://lists.openembedded.org/g/openembedded-core/message/168692
> Mute This Topic: https://lists.openembedded.org/mt/92740376/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

