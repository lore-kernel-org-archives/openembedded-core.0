Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF6EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 05:26:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1226.1690435594958962644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 22:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dhJzwjOy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6572d124a4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36R5N8CO030291
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=WTMi1/xQX39XaxgWY/78/NNTiKvO/AhRvjMnIWF/4Xw=; b=
	dhJzwjOy+lgRnxZJ7htRcqejljG18sRygd375faPajI6XltNUbAvZ39ifi2HJoFB
	Doyor1JZsYi6w5F60cEeomeb7KWijPW2wq//Lcs5qZoYyV2Cn3ejc5hfvci/7+MP
	tu+97yUqJlcboaZjeJKnufOz4ZuVbr1kSmZvJMNz1AhcF8MqrSAK/jFHfmCUP/bt
	s9pCllVp2Of6ofmYsE10oX0lbff2FgtK0dkqYhJ490VJek0isNiQbGktzf7HaDt2
	2fF1ww5qD7XyYOqVI34hcpazggDEPhfCOB9GoWxmVqL+HMuv86fQUogZNOiomEHJ
	QlreU1CsNXPyp2WiHHu75g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636c71w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:26:33 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36R5QX4q001583
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:26:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636c71u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:26:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cK2sTbBPF0teVSz35GFOknCo4Mh94ZuTLVUwEqOJ/9GnftWjpiFCyAC+AhGQsU1l0O2Mu5V4i+7KArDG+KqUMa8PpU1780LYRDitQ/GEmRuz52cE06M9gFgT3Q674nm2Iw8frR5CicyMATUF1hpXPg7C7bq9jIqbfRQDPOe7imLFR5Cf3m9gjSNDqD7H9zaE5p6hdmSFeWfj2UUVqio/KjkM8ZfKHRvketwoNYDgZnDvPpFWy3F4ybWWoC4ExdsRGFwv5Cci07dX+5NYXSGrKbNpnvoc0kIR5SNpzAYpBBET4cNmLPOUgcF0CURFd1kzgk9QDMG+JZ2VUDHR4Sl6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTMi1/xQX39XaxgWY/78/NNTiKvO/AhRvjMnIWF/4Xw=;
 b=knOE4SsY2nwV30D02yb1qcdgRSPxxbZKrYc8MpbFjRTIQBSQmVxn23TADR9WWXzoUb6OxS8o5hzyAkO7j9rfHNStOYx5bnt0ZdkwbchSiZs6NVrEac6oWl29BZx59c/H7nH79iUS4fbbBZ1nskLw8N9dqY3kNYPftg7MJZMjV3KfMC4rsuZ40t63sNKBF//jKd2L4MyICBQwbtG8lOnNuhHAZLekOIZuR+2rp1q0mi+i4m7WzLhKa5MGrlNS+gTOJGyU3yDqvI2PIyfLJF9T2t16OUODAeKW5QCLyGUPrEEslJYTC/iJHbX41FVtjzSxb1aiHT2B3SQZ9oW3mlMWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 05:26:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::6f07:4dd9:ce8b:bcbf]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::6f07:4dd9:ce8b:bcbf%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:26:28 +0000
Message-ID: <a280d66e-e58c-e650-4900-b76cbfb02c96@windriver.com>
Date: Thu, 27 Jul 2023 13:26:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v4] qemu: Add qemu-common package
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        alexandre.belloni@bootlin.com
References: <177296216FD9611D.22245@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <177296216FD9611D.22245@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7c30db-bacf-41df-c7c5-08db8e6206ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U3F5E2deu8MxJZDrYRg1pSneCK/ohTEmbg17e7asY8l4AiEhcFFglyGhwGkPKFxX/c88sjolasKqYYtBPwSygUaz1w4z3wkpOtcQ+URxayx7xuyNeLRBwLVBBfkI40nEjk/mPmmD2vhSKagZqI9bowyPiHbISAFFt27orldGuOuR5HjMuZj2MlKXe6pqKTddOmmJjSUSkTbDsU9xd+RCWZ4sGdAIK5XwRJC4HpWi0Db7mA8hH9TzNx7lW0RJwIGF1kYrSX+4hzPyZ3rwPXjFD9c79rsHFI/6dAUFogkL+iIzss02MaFnoo12qUlOktCSHD1OlFhZ2747OIyOJmfNruceayknIGLaQmm0Sak0DyDNRNmKBASJWJSnKafabVwEpiaf7xnCBV8+dSefGjFCDYTuBRNXIAtrF4ySaTk2pAV64fAx5MbFwKTBlFCCXVi82Esqax+YYM933RlL0kxUJS55OXbXkFi1KkZrLWa/7+zj27woLpTIsaXfV2F36bqQXi7qDJjkjcRjch+8eNFdAZwBUfy2UT23sKW2VRVCvDhjntaSF1e6GVM1KkZ79RCj2PcB16Ro9icg/9k0Q35nPtTfERW5xplh1vFtENr4hD8cZjq02xGaHMPg0YUwsjnX2O1yT+83xqIp/XQWhLWRmdWMzRCxX9abHXgWfD8hxAAuVw1osQoqE+b7EgeAi9ye
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(346002)(39850400004)(451199021)(2906002)(66899021)(316002)(8936002)(8676002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(6486002)(6666004)(478600001)(26005)(6506007)(53546011)(186003)(6512007)(966005)(31686004)(2616005)(83380400001)(66946007)(38100700002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1dadi9uTzQwWGoyODZlQTlvZWltOXovNEVFL2pIekROc084Mkh1MmgrdkJJ?=
 =?utf-8?B?dGE0SXFqQkNZSjhrbEl6cHppaUpPSG9lcG9VS2ZDOFRUSGJnYnJ4amZDd3E3?=
 =?utf-8?B?U1NZazh5NjJjd3RaN1FiMTg3S3pLR1p0TWJPeVdxL0pMZmZDNzl6OUU0alJr?=
 =?utf-8?B?Z0VpNVBSdDNXVG4vWjduMTlBRkVVS0owZE9lcW9FVDBmcTdzMFNsV0tsY0N3?=
 =?utf-8?B?aFNZdUI0Q0RmejFlellDRzN0eFk0WS9ZdC9ndnNKTTM3OThnd3ZrdnJFOUdR?=
 =?utf-8?B?S05ubS9sVFJKQ0UvNy9Icy9NR0UxM21CQXJCOGlmUXpwWkh4b1JqQUQ3VU5Q?=
 =?utf-8?B?YStmTnJOeGwvK20ybC8weVhxOEpCQ3haRzk0dEo1WXRhdDQ5OHZKb0R0TDFV?=
 =?utf-8?B?SDE2UlAzaVNzbmdmWjJndXQ3NWJkUmZ1ZzU4SjRDQXJIM1I1azJHUk9CNVJs?=
 =?utf-8?B?SXpLTUc0a2pnZ1pLWnV6OGMyTFJ4L2xZWDRVZU5ibnU2bkwwemUxdWJXenZY?=
 =?utf-8?B?b21qMVhQLzU3V3preTNaclZMY0ZPNHA3dzZ6QytnbThQVG1wSHRlanErL0N0?=
 =?utf-8?B?UXJYZlRFSXFWZ3NDeEpEekdaOFlVRTlLSTY4L2J5N2tSR3FIMnF1SGYvajli?=
 =?utf-8?B?ZnduMVpFbkNzVTRNSk43bk50MVNJblZYSmhDY2pubzQ2cGUwOWNySDRwdmVh?=
 =?utf-8?B?TzNSWFlkbW9vUXR2TkhsTnBBd3dhcmYyay9ldWZjZHhYN3NCVS9QN2hScEFs?=
 =?utf-8?B?dWMyV24xZE9aZ3kxM0NrZXhlSmdheDdpNnl0azd1WE1yQnBRbURZVjE4a3E3?=
 =?utf-8?B?c1FKa21xZ0JmT21Lc05qeGE0dFJ6TFJ3M0w2WVJiWElGdytHUkoycjcxNHIy?=
 =?utf-8?B?cjdFVHhXdkFKY3QyNU5WajhZNHk2bmlxdkdDWEVDbUZ0N3d6UHEza25idXNE?=
 =?utf-8?B?YytDQS9kYnViVk1XRWFxM29Ea2VtKzNLUExFUjBJakV2VXdmVzRKTGhvK3Q5?=
 =?utf-8?B?Y00yRXMrYVV6OHdKK2pobjY3R1EwamRSZ2NaRTQvM1NvNk5WTldlcC8xVjhJ?=
 =?utf-8?B?bTdSKzJjRG9XbUxNYk9PeWxGKzZGaVIxU3ZqT2hvNndwaWp4MklhR3NnRzgy?=
 =?utf-8?B?TlM4STlpKzJCbExnR2Y0Y2RBUWJhbHp3RTRoaVBONDJORXpsNHVqZjhGWWZQ?=
 =?utf-8?B?R2J3RUFRV2JkMEN4MUg1V3owbk10N1Njdzl5MlBhcmhRMktLbGY5ZUc5MWlI?=
 =?utf-8?B?VThVNWUyQ1ZLSkxmU00ySmpxZWk2UmRDTTdkQjVMaFNHRDR2L3d6anJEdHgv?=
 =?utf-8?B?cWZPWkp6S3lkTmdzMVFzT0lmdys0RE9aOHp3NHhCOU00bG9jR0d2Y05nN1Rq?=
 =?utf-8?B?L2g2VmkreHVpYUY4ejlmYUNDQWpnWVlkV2ZoZzBhSktFZ3dkTHNRVmNITFNj?=
 =?utf-8?B?WTFkZCt4UTV0ZW9CcDJVcWU2Qy9FWi9NVTNqdENHYUNRTk5lN0k4Z29iSk90?=
 =?utf-8?B?ZjlsSndnNVM0MkpjRUxCUnJXUWFZZVVRdjhJUmxrbVViWUNPSTRnTVFUNk9L?=
 =?utf-8?B?bUJVNFRxVzZ4UkRQZzB4Wk11dmxzby9BK0FtOFplN0J4TlVjYndmZ0xqdWh4?=
 =?utf-8?B?RFJESXNwZ2tjVzByQkxtODJFZkpaOU5WNlRrMlFHMUpYbEk3ZzdMMSt0Nmhq?=
 =?utf-8?B?UGtOamIwUzVmaHVSWTJjc2FwaEg3RkJwYTJaTVhnVDkwOGxpMVAwQnNnRmdZ?=
 =?utf-8?B?QWIwRmlxSHhESTRIZTF6dVRCRGlUc3dneXNFVkxQaEY1M1NjTzBNaTkxWWda?=
 =?utf-8?B?d0RhaVl0VXpCSWNFUWNxOTZTRW9tZTZEZkx4d2tKeVJub3lpTnJHa3czejhY?=
 =?utf-8?B?WU13dktDRHVETG1MUTBDWlNuMEt5T2FqZW9pZ3pYRCs0QzMzRW9rMDhYNkNU?=
 =?utf-8?B?UGpPZUhNWGFXUURiSVZ2ckh6RnBLSDNqMkE4Y0FuWE8yUU9hTkV0VUlTTFY1?=
 =?utf-8?B?ZUt0azFMdGtoN0syNnJrelBLWXF0aFQyQldJeUw1QkplUkJVMmFWekNNdWNs?=
 =?utf-8?B?UEozYUZ5amdmUFBFVVR0WDNGOGR1Y2drTzJWOC82OWJlczd6bkZ2ZWNONGdn?=
 =?utf-8?Q?U4MawxoNPhWc05nUrogFQ2weE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7c30db-bacf-41df-c7c5-08db8e6206ff
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 05:26:28.1624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUbkdFtMFx/eeRsz4wX9l+L44b7nGUarSPA1m8h4Rd7qVpIRWAEy3TBjQ2B/VxcnxrHbT2wE0szbM73i8BZpnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
X-Proofpoint-GUID: hQYzB6nXaL40Ax9AqI0yqRU23hb2_XK0
X-Proofpoint-ORIG-GUID: DMFJAJfWVLndND0uPaSWKxazALenZGyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=454 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307270049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184908

Ping.

Thanks,

On 7/17/23 15:11, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> We split the qemu package [1] to add support to make user can install
> one qemu arch emulation rpm to ease the concerns who care much about
> the rpm size in embedded device.
> 
> But for the user who only install the qemu-*.rpm can't do anything
> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
> explicitly.
> 
> So add qemu-common package to package all thing into qemu-common when
> not split the package, and package only the basic into qemu-common and
> other arch related to each qemu arch emulation rpm when split the package
> to fix the backward compatibility.
> 
> qenu-*.rpm which is meta package rdepends on qemu-common and the available
> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> 
> v3->v4: remove the added native-sdk dependency.
> 
>   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>   meta/recipes-devtools/qemu/qemu_8.0.3.bb |  2 +-
>   2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 16581db69d..76560f454d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -225,15 +225,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>   PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>   
> -INSANE_SKIP:${PN} = "arch"
> +INSANE_SKIP:${PN}-common = "arch"
>   
>   FILES:${PN} += "${datadir}/icons"
>   
>   # For user who want to install all arch packages
> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
> +PACKAGES =+ "${PN}-common"
> +RDEPENDS:${PN} += "${PN}-common"
>   
> -ALLOW_EMPTY:${PN}-system-all = "1"
> -ALLOW_EMPTY:${PN}-user-all = "1"
> +ALLOW_EMPTY:${PN} = "1"
> +FILES:${PN} = ""
> +
> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>   
>   PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>   
> @@ -241,15 +244,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>   
>   python split_qemu_packages () {
>       archdir = d.expand('${bindir}/')
> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
> -    if syspackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>   
> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
> -    if userpackages:
> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
> +    if subpackages:
> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>       mipspackage = d.getVar('PN') + "-user-mips"
> -    if mipspackage in ' '.join(userpackages):
> +    if mipspackage in ' '.join(subpackages):
>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>   }
>   
> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> index 42e133967e..5d3c47c3b0 100644
> --- a/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> +++ b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
> @@ -8,7 +8,7 @@ DEPENDS:append:libc-musl = " libucontext"
>   
>   CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>   
> -RDEPENDS:${PN}:class-target += "bash"
> +RDEPENDS:${PN}-common:class-target += "bash"
>   
>   EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>   EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184432): https://lists.openembedded.org/g/openembedded-core/message/184432
> Mute This Topic: https://lists.openembedded.org/mt/100190357/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

