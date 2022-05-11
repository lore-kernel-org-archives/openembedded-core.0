Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989B2C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 20:42:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2112.1652301743918520430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UOxYnZYl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=213085b3ee=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24BKa5VF022049
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:42:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=FNwuIJcZbqIWYNSTbA9uYNwBet+g97kUSdHu3H6f930=;
 b=UOxYnZYl6/SCjd7xl/RQNyTD+bi69nO6UjVqvUiVLfcUfaBgN4jmAIOSM0pcD3uAwnQd
 U0cl/n6vA9Dig4bRazOjYjxT104A+4ILjj4U5Ko9+/tsf1NEAFSpIh+mjXOuC+KH+KE0
 zHDL9fAgNXSWAbc5xImf3bLRxhrW6knx4LvRJ6nEWIguTBnFvCG40eNRcPwtRL+l/NcA
 UrY9RO6lD9J/k4oOD9YEwaGmzyB38fB9E4GzD3VsuQo+2IYL9Oucwkq1nRSIRSoJjsmN
 q0DKThHHmaCy1O2Uvp2VQbRsil+54vXvtG4WMKfjZf7KZMfota+D/W4u+wD7HRI+mcKz aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwr9k37na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:42:20 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BKgKmt003845
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:42:20 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwr9k37n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 13:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6JHcwMjCi34rvw8Fx8jyJrVT1TgT3fjF/qPtNiRWrz34iL3aQQ3QJxOny+tx0zaqxKTN3GO29nkn9juCtVmBA8QQmPHda83seVnMk7m8PG7kKCPPVA8bbWB8ksuPiRvpEYKELWQoG5T2AjstQs88Y/S9o/0fMScwWNgu7x/Kwjt5ElA6qJjM6G5t18qeZaOWKAybKFuwe/z62X8W9KzAmsDuKsc+DdvUjMg6E5qArH2aaqbeK4eHzoP+zdSieZtP33OPzUpYDy4++9ZtLvG7nNNy0sfmwiAgWHhOYU/jz5qIkJg7AEh2V12njxb+zB1BlpOxmPKMzqVLOofFuHMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNwuIJcZbqIWYNSTbA9uYNwBet+g97kUSdHu3H6f930=;
 b=VOEyTKzrNe16GxJpsZj+tR5efAdpynOi72DLU8uIh7lU+pvkJ1AoWwkLVyob0Kmr/gJDK5PELztVfwooRtNN1GarZMG1nKjeVNxvrlH8YhTy//ypgvvdxKMzI2Ii1kjp1Oq2rl/kjvti51QBL1tX13gz1KAKFmjPjugxXM97/M9moh8ZjPcboavZL0bVqPhj49HPQ7ZCjV0BUWD9Dos46hFfuXL27CgcVEWcbEBfixAqHPF3pDY4KWI6B2IbFB7BY6eftsp8+2jS22h45zOc7mjo5DnGgdTNXg4QSGGIvJAXwMDvwZWt3CiyDg27pBeviqjoZmHIpq0CE1l+oxpaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 20:42:16 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 20:42:16 +0000
Message-ID: <6f487ea7-1ecf-1055-17a9-e8eae4f2d96e@windriver.com>
Date: Wed, 11 May 2022 16:42:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 3/5] poky-meta: add go vendor class for offline
 builds
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
        openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke@weidmueller.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220506065917.1375-3-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
In-Reply-To: 
 <20220506065917.1375-3-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::32) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0fad28-3dde-48f4-b783-08da338ebc0b
X-MS-TrafficTypeDiagnostic: BL1PR11MB5448:EE_
X-Microsoft-Antispam-PRVS: 
	<BL1PR11MB5448911094EE24C7A3B7E46FEDC89@BL1PR11MB5448.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nZVXNmwE1oAbnuJZ7/wDGX4UBcojCsydl4Nc33GsPXcvx5N7WIY/5iF+GtxF7b2t52L4ftvPOgfKpsOGgAmzb5V/Ntw7CeCNGcfwVj5cV/sT3Gu8hYt+/KxeFlot+vuwZBjJ3zZ+0xzMBD9lRVaimE4sYb8Tp9nGZZieQOJ2R2BK2s1MDeWU4zItJSAjMoCDI5cC5kYu71jbUA+j0rz3l3oOWf6brlaGwyFMECe1Xoj3uWTSXxlwP6YH57hZYfM+ZPF1mg/Px/Lnvq7cpost8NlNXX5zgpIKfj3w9c11RDVrV5rnabe+ZnpkhNeyJ8m0dO/d60bFvGgBJWqS3fOO1g29hcRTcAJ3yoN7ySC9Ap7eNM5/3BKmJbblzQMSjPIz3bfEinbE3aP6kmPkk2kgDsfHE+ALgshtniwkB8zGEiKfXCh11vfBuL2aySmL01+W8SuOElQn1Rdkek/hMkZXHQfFLyPWtgturF5EaS5TaPTUqrGgTB4NJouadW5HMNwe9VIbc/60J/SI16IPTwCPxI/vMBxzlDI9qznT09DqLPiP+6ZsLLzC5z11XT29YL1DDmdXWRENS70WPHvYcpnVq1M/9buFvc1gh4Qx+lvWZClgfitjVDiy4wt4nkXJ1AfsvhR4Tv0ML3ewRAzyFaxA/9t6ET3ZaqtqP9MqbYCG8bHCJzXPLzYGi2+2XKMd2zw2Pm84EEV113DFG+P04PdPOctS9ygV5d1yKuxwFtxd+g1+Qby5ePhaWvjczfZW5FwihQ5OwVlzjerGBkcYUuRTyVNTmvmGHWoRfB6Ezw+SwIIOfMdORDwUphaZHVjtdW20RYc20ui213Q+/GExUjubKNFhc/DlBOD7UKBGlTFCTq7X/qsIPFvAwPwjC8BWI/v/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(966005)(508600001)(8676002)(66476007)(66946007)(31696002)(66556008)(4326008)(86362001)(316002)(2616005)(26005)(31686004)(38100700002)(6666004)(54906003)(6512007)(5660300002)(19627235002)(6506007)(53546011)(2906002)(186003)(83380400001)(44832011)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkdhYlE3SFNqMWFSd1BnVXdJWTYzeE82TDBTQkxHT2NmTk95bUpydWNhQ0Vs?=
 =?utf-8?B?aGJsOXdMcVpvWTRNL09VK3A5N1ZJcGVOVm5mSG9CekFhWTFoelAzeXh5VjA5?=
 =?utf-8?B?QWRlTlRZRTR3V1IvZzVmemh5ZmEzaTI3MUJnWmhRamh6Wkd0QXhiSzhpM0VE?=
 =?utf-8?B?Z3d2b2hVR2pDSFJsRjlBcDMxS1FPMU56YmwxUmtwbXdKaUI2L2ZPNGUzby9Y?=
 =?utf-8?B?YStPeUlpbmFMd3U0U1cyTXdXRHJiMlRVSWtLN2g5QmM5UTg1MGRoKytTeUVn?=
 =?utf-8?B?eDgwbHF4bWlFUVphd0dQWENpTDVJUzV4QVVPVmJWYjloNDlWN2kxZzhrRXZZ?=
 =?utf-8?B?NDFtdVVFSWl1MkpVTnRlOTRSWkFPdGxTV29QekhMOFExZ2oyT2V4em9DbjBo?=
 =?utf-8?B?VVU0Q1FwRE4xY0tOUXRxNHM5MGw2MnBTdjdXL0VuZCtHN2p0NVBublFrWVBK?=
 =?utf-8?B?OUFTc3dwcWRSRUR4WFNFVktpL2xYNHUxZ09Cdys0YTFLWnA1aE5nVzRaYXZB?=
 =?utf-8?B?OW9aMXhWZ2JZbnFabEZkZVAwY0xmSExwazdoaXRPL2V0OCtMbzBLRmtvOXJG?=
 =?utf-8?B?b1hyc3UwS0RQQ0c4TTNrZEI3WVJ1QWUvZkVJTFBNQmJpZGdVUlpHTDdUZ0hN?=
 =?utf-8?B?MkFmQVRuZEJEU3I0WWI4SFFXL1BUVGxIano5MGNOOTBuKzRqV2pwa01jeHow?=
 =?utf-8?B?YXRKSlBCbDJHeHJGZng4aE1GdVpOUGdYcGExaWFjRUl2dFBHL0NuRFRBblMx?=
 =?utf-8?B?bkROTVZHdS9MbEV3emdaR1JobFpLZVlNS0xqLzdtZWZSNThHV25YZXlNSFVH?=
 =?utf-8?B?TmdwRzRJaDZ3ZjBuR0RNc0pWb1doOFYwS005WE9pektvS0wvQWVZaDFnZFBJ?=
 =?utf-8?B?MEdLZW9HcVQ3V0RaQ2h5T0ovYmhwa1ZKWDNsaUNlTWovdWdtbXBPS2Q4YTJm?=
 =?utf-8?B?ZW1FY3BYWnBHOFhEeXMvQ2tqZkwrTGdFMGFoa08yN3ZqT1FpQlBIMlZUSVM1?=
 =?utf-8?B?ME9iQytZVnZrMm82VVFYWTlqTk9Pem9vUVJWcnhQdVlTa2R3STlRMTlGcXgv?=
 =?utf-8?B?Y053TnNVdWI4a25RM1V4c2tWRjM4am9uVEtzTHIyTmtFU1N3RElycC9zVndh?=
 =?utf-8?B?SVdUZmU1UWNqR1VSSTYva2Fid3dMMzhZZVVrYnMxVTNSS1czc2ZZU2N0ckYy?=
 =?utf-8?B?OWFhTnBDOVlHdDEydGhDTmdWNnZod0VMc1RoNC9zVU94SFF0SCtjV0dKVzJX?=
 =?utf-8?B?eGNtbnBVaEJYZVhwTzBOU054aXlvTUVvd3VIOHJydTl1cHdzN3d6clhGdm9r?=
 =?utf-8?B?bHY3Rm5XWFUzMVE3OFpZRVptdmVxUi9YZnROclJFejRJUVZ5S0NmaFJoSHZC?=
 =?utf-8?B?WHdaRjhBdUt0SVNSSGpsc3ZyMkRpc3FoQm5rTHltQnFhZFFwb3BMZG9OMmdF?=
 =?utf-8?B?eC9WTWVjKzRMY0JVcFIwSWdkZXYydlpHd2dTTzFxODlkVG1PdHQrRWpjdlJI?=
 =?utf-8?B?RWpTZEpiR1JIN0VoaHNyU2FQMXZwOUIzN3NLNzFrWHluMHdOYU0rc2RMdXZz?=
 =?utf-8?B?MDBOQitNcWtnVE1KandjVmVHQmpZeGVUQmU3YUVqOXJ6NHcyUjV0RmlmN1Bj?=
 =?utf-8?B?d09RbnR0elRRd0N0U0R5WFNqdE1STTY4ZFMzQmNZdmRZeGliMFdFVFJ2bnR5?=
 =?utf-8?B?SXJ0MkhvTlZLVnhxTExxc25meHh4VkNUOXNiV205b3oraXVFOEhiMkN0Tnhs?=
 =?utf-8?B?RWE3Q0Y5MVpKeUhLSjZSa3RKR2Ntd1gwM0NDMjNHSnprRmp5L3VTSmxPZXpu?=
 =?utf-8?B?SGhwdnJIbG5YZ2w1WldXak54Zi9qWVRPOXo3RVZaUHJEUEQ2YkZXNkpJcnJk?=
 =?utf-8?B?WDh1dXBSWFE4MExHVjdHU2lxMHk4TVpFQjNZVDB2RFkwaDFuL1NYTHhIamtq?=
 =?utf-8?B?UFgremx2WEo5MVRHaXVtVHpocWVjMkFIZmRwaFoyanVKaEhCWUtIQ1p4czI1?=
 =?utf-8?B?T08yU2hnbWlJelRUU082V1dXQ3FJRSt0cUJzZTRlZGNsOVFPTFAyVnp6V3hF?=
 =?utf-8?B?MWJZeEVrOEprcnZCVllmVUthQTUrRmpMNnlnL1BIZDBUVUxWZ2hIT3pKNzJz?=
 =?utf-8?B?anc3WlBNb2htZndRNkRNMlowZUlGMEJ4QXZwSkdaeGtpeTlWbDVtWmMrNE5h?=
 =?utf-8?B?NTBlZkdxQjVDWnNGM2orZXJsSUlQVm5ISkEvMk1NTTFBdWp6cWJHd21JQXBF?=
 =?utf-8?B?K2ZGZzhhYlNOUFlxeDE5SEJ0MDk4WTMrUVV4c3hJWExIcG10cW5Bc1p0ZjQ3?=
 =?utf-8?B?Wm5leFlhc3VmVWpMYkVPRTJkWHd3cWVWOWtJZ2FRazFid0hmT0xMRVkrMzlG?=
 =?utf-8?Q?N2hTRSkxO9+DgdW6fPzJI1iNROozPYqQCj+5o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec0fad28-3dde-48f4-b783-08da338ebc0b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 20:42:16.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AjLouttGYOkxpckyCcyh6hcCiWtKzare3cC7V2fqoSE/Tvyifp6QfxcYDJOli4BeP/its0MWaHoRGbfCmfkE0hIw8QdL2OXJANAPVT2Xvh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-Proofpoint-GUID: 2eke0kLWfxeMHVvrzGL6bkI6JhyzctUG
X-Proofpoint-ORIG-GUID: NNgxIJYavGtXqxE2042sKeacJAbhS76h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 20:42:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165529



On 2022-05-06 02:59, Stefan Herbrechtsmeier wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
> 
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>   meta/classes/go-vendor.bbclass | 68 ++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 meta/classes/go-vendor.bbclass
> 
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
> new file mode 100644
> index 0000000000..a1a740a1fc
> --- /dev/null
> +++ b/meta/classes/go-vendor.bbclass
> @@ -0,0 +1,68 @@
> +# Copyright 2022 (C) Weidmueller GmbH & Co KG
> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
> +#
> +# Handle Go vendor support for offline builds
> +#
> +# When importing Go modules, Go downloads the imported module using
> +# a network (proxy) connection ahead of the compile stage. This contradicts
> +# the yocto build concept of fetching every source ahead of build-time
> +# and supporting offline builds.
> +#
> +# To support offline builds, we use Go 'vendoring': module dependencies are
> +# downloaded during the fetch-phase and unpacked into the modules 'vendor'
> +# folder. Additinally a manifest file is generated for the 'vendor' folder
> +#
> +

Several instances of trailing whitespace in the file header.

> +inherit go-mod
> +
> +def go_src_uri(repo, path=None, subdir=None, vcs='git', destsuffix_prefix = 'git/src/import/vendor.fetch'):
> +    module_path = repo if not path else path
> +    src_uri = "{}://{};name={};destsuffix={}/{}".format(vcs, repo, \
> +                                    module_path.replace('/', '.'), \
> +                                    destsuffix_prefix, module_path)
> +
> +    src_uri += ";subdir={}".format(subdir) if subdir else ""
> +    src_uri += ";nobranch=1;protocol=https" if vcs == "git" else ""
> +
> +    return src_uri
> +
> +def go_generate_vendor_manifest(d):
> +
> +    vendor_dir = os.path.join(os.path.basename(d.getVar('S')),
> +                                        'src', d.getVar('GO_IMPORT'), "vendor")
> +    dst = os.path.join(vendor_dir, "modules.txt")
> +
> +    go_modules = d.getVarFlags("GO_MODULE_PATH")
> +    with open(dst, "w") as manifest:
> +        for go_module in go_modules:
> +            module_path = d.getVarFlag("GO_MODULE_PATH", go_module)
> +            module_version = d.getVarFlag("GO_MODULE_VERSION", go_module)
> +            if module_path and module_version:
> +                manifest.write("# %s %s\n" % (module_path, module_version))
> +                manifest.write("## explicit\n")
> +                exclude = set(['vendor'])
> +                for subdir, dirs, files in os.walk(os.path.join(vendor_dir, module_path), topdown=True):
> +                    dirs[:] = [d for d in dirs if d not in exclude]
> +                    for file in files:

I am not sure what other folks think but I tend not to like to see 
python builtins reused as variable names. Too easy to screw up and 
messes with sytax highlighting in editors.

MarkA

> +                        if file.endswith(".go"):
> +                            manifest.write(subdir[len(vendor_dir)+1:] + "\n")
> +                            break
> +
> +python go_do_unpack:append() {
> +    src_uri = (d.getVar('SRC_URI') or "").split()
> +    if len(src_uri) == 0:
> +        return
> +
> +    try:
> +        fetcher = bb.fetch2.Fetch(src_uri, d)
> +        src_folder = os.path.join(os.path.basename(d.getVar('S')),
> +                                        'src', d.getVar('GO_IMPORT'))
> +        vendor_src = os.path.join(src_folder, "vendor")
> +        vendor_dst = os.path.join(d.getVar('S'), "src", "import", "vendor.fetch")
> +
> +        os.symlink(os.path.relpath(vendor_dst, src_folder), vendor_src)
> +        go_generate_vendor_manifest(d)
> +
> +    except bb.fetch2.BBFetchException as e:
> +        raise bb.build.FuncFailed(e)
> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165324): https://lists.openembedded.org/g/openembedded-core/message/165324
> Mute This Topic: https://lists.openembedded.org/mt/90928683/3616946
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.asselstine@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

