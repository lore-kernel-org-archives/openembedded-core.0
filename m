Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EEBC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 07:47:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38221.1665992865809663570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 00:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nmzEEvo0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7289ae5d0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29H5lv00031180
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 00:47:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=tfC7tHMi5TMS3I2YB6vzSKwrZ/+dULgVHfGat1SnmYg=;
 b=nmzEEvo0dyRr40+Aze9LVEl8S3mcN/0OVmSUtUyFd70rRbbHFMopxiBU5chbGbBQ0OrV
 cl63yP9NwCPodRSq5TrrfJOFtftcv+AqDgeqvfquEmLcqdKjhBX3rDQ66ITy/K+QSIit
 O8vX+s0NwPyE7KdUlNaGlqq2+LzK36wNVpEpTnojT+4vrUTxvnXGdgfVOrvCg9Q1BBmS
 R7EroGzUavEqLujQzoEZ7bA8lhSRTtnKsP1epGP//pYhQ1IonSEWHmDo0Ivs0956aR9S
 sSj8sYowhO/S5PNFvDrbR/zLyub/myv3z1eDNxWAN7aHWDEU5yxFwgKRfgJcX8O5d/Jg 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7r549hmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 00:47:45 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H7liRA020143
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 00:47:44 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7r549hms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 00:47:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In4idXkIx+W+lGSlPH2bMaQ8myX2XQNVVQMsN0nUPprM9g0/zPwni8UNtLX5m9i8lrSVe5VDm9TQU9/X2bHdutI2SSg8n1OPq65WpwHZuX0MEgZFFKuqFVDGNenBw3xIw2+FXPhX/dRMIy5MxzDoe4eL22aJnoW3xxpJPbzKN35Ome+SRrEdkwD5pfTVMP0k7ZCUJcYO5y1t/b3BdSedYB6I/gM6we5t09GeQPhXy4TOKEQI2qRXivJoFeAqC56Bcx+f84DNmxbl34T6ncF5mUhLGIqaRcnaq6xLbaei+kpesDcRxJpHVDM6h6KEW06Qt5gt61SamQb8FTFOb+pLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfC7tHMi5TMS3I2YB6vzSKwrZ/+dULgVHfGat1SnmYg=;
 b=U8QxF6ajt2n5o6eSZf8b6xvFxrp+fTVnpmo3QmDqfws5++CznNnV+XnIQnGFhV8P7SOi+eAtRxTZxXQ/Ebb1hCTqsdiCjOo1oherwc/kmXKVPYJLZeIOutF8z/hgrGnKQ8vn+qI3N0hkTgricQLXiYXFgWXtPA51BjJFj78ZVHx54KfVYiQKaqKORfK2w8qYwYm3yESZ8gn5+8BIf/2GUMhbNkwzufMDF8TDBRaF5m3K53YtymhsEbMmJp4H8x1KKCRLQZR1PKr78eCIZOSm3XPYdFAc/ASWaWdYb6Tvd6/BidHc2wzD7EamuJiZSh9HJDXJgjNkVg2IDtNqVr3Epw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 07:47:42 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::df2c:f6f9:cbe9:a56c]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::df2c:f6f9:cbe9:a56c%4]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 07:47:42 +0000
Message-ID: <95922b63-8378-bece-9bf9-4161fd1742cc@windriver.com>
Date: Mon, 17 Oct 2022 15:47:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] grub: Allow build on armv7ve/a with softfp
Content-Language: en-US
To: Andrei Gherzan <andrei@gherzan.com>,
        openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20220915125922.1666515-1-andrei@gherzan.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20220915125922.1666515-1-andrei@gherzan.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0229.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c89ca4e-b2ff-4044-44f7-08dab013deec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s4iic8uxD/q6UcgcT+6DkIlEazpK5o1+oe/1PrQopH2yNmRmwO71om3Xjw67lWSakGc0nXABrnL7wlz0RTZO+vKnvyWRV4KyHnevcMdcWUG6LGmtNiSvUXqiUFlXh/rVIW/9NcrjK/JmsNRABDrZ2ik3EQVlLMdy95l3/X5Yabf77lTsKVXT4Ej6ANLv/YpMV3LPztRw/Y5rm9LVwWbmQsL1lKmPJGejYw1+ay7UQF0i2XB8nzkBHoOTjG9XlS4THLwr7Wcrprtvf8IMDYah533t2vf1m6mwsiUHxFKzsFyQ9UJMQPBzkZDwz4mtpVgUaOt4RFkwY8kLrwjXMlmVIlXtRC4J3JY8J8Wy0kAvxljZVEsFokSxVIGbb1UjxlWAO6Fs7jztVLrbozNJCHR6sim0KRYsjVUdtmxXyTAHPGyaPAN1/58iCsF/jFqUlNLqbUPazQsgSQL957Pivez84twf7GuqndgBGhKtMtR2GThnyLjVGObs8kkmoTPoAE6Yvp62+INA9g5ep6M66OkeyRiyF5y00RzrYz4+e7Cb97mcAyfLqVNu8uFt6xgeOXFYqPeEbZhrC/JYVUGSw7DiNgSNI+L3A+pzFiKgesNOAFU9L15mMjTIQCZ2JJ+pSHi2v015MLQqikeg4407tNaTMGtTeqrpqPb4qt7QXDaOrZhYv6/LWsV7WI+9oPCX/qCjjNuSmUCTi7G7Vd4kmYw45XUf7G6Sf0NI0azSKdsm7DhK/i2KUaYAjXWHG+7ZjZ4SCKJFUHMGKZAID6v70wcx7Vc+kEeauBgS221wP/YOyV8Vg6Q5H/5YJ9pJcpMEgOrl2+ygq6itxskDmU0rMu4HxQuIlm2vhj1D4H9wfbh6dQJBA5uDKYTS6t68UgpAP2CL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(451199015)(38100700002)(6486002)(966005)(31686004)(478600001)(66899015)(2616005)(186003)(316002)(8676002)(4326008)(66946007)(66556008)(66476007)(6666004)(6506007)(5660300002)(36756003)(26005)(53546011)(41300700001)(6512007)(8936002)(86362001)(31696002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWh2akU4aGt1WVl5dEdiZk5XL2lzMXJnSGU4ODk3SHFNWExhQ3ROWHFvT3No?=
 =?utf-8?B?NzVEbkEzMFRoU3B0QklkTGhXSTZXdXh2Nm5Rd09Zdzl3YUptQU5tUFhjMm9F?=
 =?utf-8?B?dDVZdWp5aE5QY2p3YVFVMXRYM3Y4dW5zTFl6ODNRUVNLZWtIdE82RzdRQ1dM?=
 =?utf-8?B?U0J3Wnh6ZW0yOHZVQis1R1p3SmluQWR3NkRyUmY2MXpmZklqSUZRcGJUNHVP?=
 =?utf-8?B?NzRTRmZUWW4vRnAzQXc1RHY4Zlg4MitHZk5PaVF1dXM5QVBmQXR0SUY0dEJI?=
 =?utf-8?B?TlRqVVBZeWphQ0NMRjFhYVM5VnZtdnFOU3RTam5QdnpSSHZiMzlNVzRMVk82?=
 =?utf-8?B?NC9KRHVWb21BU0NWRTJaY2tVVWU5MWthSHgxckFxUHZNbXhuczNmbzNoRW5o?=
 =?utf-8?B?NzQxakZEeFJOR1pCZ1ZMRVZ4Ukp5bUEwdFdKd0F0M0thdnhsYnZBY3Nldit5?=
 =?utf-8?B?RDhLYjFyMTVaQ1dOT3NtU09GNk5ZNnZSVmNtSDcyVFdOSnd3bHBQZWNoNXNa?=
 =?utf-8?B?YXZRbUM4ZFBBV20vWWhJNUU3RFVKVG9WajN2OGNEVmk3eHZ1NGV6U0VMbDAx?=
 =?utf-8?B?bjF5dm1RVVZUd1k5TTFuMG5TcXhteXYvWDdqdWwvNThpSzBTZ0M2T00ra0gy?=
 =?utf-8?B?SVRRcVd6WDZvK0Uzd2M5cmNtZzZXTDZrV0hqWTFBeUxtTnd6bnk1ZnBZTSts?=
 =?utf-8?B?bkE1M1dDanZBWWNUa1RGbDhxZ3hwUnFxOVczVHIxR0dwOUNXR3ZsU3VBR0NU?=
 =?utf-8?B?eE44dnVoR1ljc0JtbmlyVDduYmMyc21SMWpPOTJpcEVpMDZRUWFaV2RCVWNw?=
 =?utf-8?B?dXhTVzZUUG9BMmtxOEl1Z0FoOHg0Ykkyak1tTmpmY29OMkVnaUY4VGlORWtN?=
 =?utf-8?B?MGYrNVpObnJPVVpjRmcvRFhFMENHZm8xUXdQNGdrLzBtY0pOSTVHSG1ZQkpN?=
 =?utf-8?B?SjRENXUzaWwvSEttNXNBdmxDY2pjUWhHWmdZUjhVTGorWTBJUlpad1VjNG54?=
 =?utf-8?B?bytPWEJVenF6NzdCWXRPT1JDM3VSMENJelRTeUhmZHlJdFpQcDEvMHFrR3Va?=
 =?utf-8?B?U3R4VUh5WGtkTW5wQWNNOENENWRBaWtoUmQvUGFVNlBIdkpIVk1JanVtaEZz?=
 =?utf-8?B?NS9HcllzWUZHc0dQN2p4UkJ3amx0MnZFOThXU2l3aXFuRGlCNmZxWUFTQkta?=
 =?utf-8?B?NjcxYVJFMVpoL0E1c1ZkWWh5ZUEvVWdRYzlxTVpOV0VXbWdubEhoNGZwc3FZ?=
 =?utf-8?B?ZWVMK3hzWEhKSUtNYVRwdkhITFVibDlybHZ2ZVlmenVyMzIyS2h6TUo3YmV6?=
 =?utf-8?B?K1h5VUY3OXEvL3NCNUlvcDFTbjNRVkFkRWdReVJQZnlpeFBIUVYrcFpUWTdP?=
 =?utf-8?B?YWN5eitobUY5VDZUWmlEYVltY3VoQmlBclY2YjZBQUFLUUhWZGpBRVdXaTQy?=
 =?utf-8?B?NTBrODhHSElxVS93c09ETFg3UjJ2UGRuT1kzSjFkdFZiMWhvL2NRWXdwNlkv?=
 =?utf-8?B?NUFhSnRqSjVrRXJNbGlUc3kvblN6UTVIcU5DUHVtWERtQ1pyMTZwd0sxWVZl?=
 =?utf-8?B?VUQ1OHlvZ2FZaEFWU0FhRldZTXBzZmlKbU15M2tYQWlDWnhhM0FOaVFOK0tX?=
 =?utf-8?B?dE9Yd20xRnVEcGlpdmt1OWxOSGp1R3B6U1RWWHROWHQ5ZkZiOXlTUlRSRkxt?=
 =?utf-8?B?c2o2Y052QlJyWnhPVFdDZk55QnVVWGlRZ3ljZUY0bmxzMklMeUg3VnlRSzBl?=
 =?utf-8?B?bEpyL3FxSWFvNDkvOXhhbkN6eVE4WjFKT04zMUZkVGdzTmJ6aC93RktvTE53?=
 =?utf-8?B?cXFCd3hIVkNpM3J6aHh2L1BUcEtjcWVqa1dGZTJFNTFJQVNlMGFpSVBPWkZ5?=
 =?utf-8?B?OHBzSVVMMnBObmI1K0VYZ0IzL0kySUNHVjlzaWxIMEFCMmlhUGovaGJYaHlo?=
 =?utf-8?B?YVA1YmRlRVlCdS9JRmF2SmRONU5mcm5wRHd4blNBeUg2NDdydmN6UUxMcWdH?=
 =?utf-8?B?K2J5WU5WaDREaUJCSU1BWGxFRHVGdDFrZjZvckFXaEZYS3A0YkV3Zm1mZkdP?=
 =?utf-8?B?bm9TWGJxaW02UTBWc0dNa2hibjErK2pXWC84eTFCdm9oZlFCQVA2a1FMR01a?=
 =?utf-8?Q?Pk4fgjoSagP3JIVyBEWP0HpEd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c89ca4e-b2ff-4044-44f7-08dab013deec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:47:41.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VEi6lE78rHSN0Q/6YFvZwRzYc4qX6LvXu6NgULrFSYB0tYOBm7+qMzopF2QyZdaLmuA7BmntL/t2oKVE/A2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-Proofpoint-GUID: oE4SCuAjRwhZEIquzjgF7_Cqqj54TM1N
X-Proofpoint-ORIG-GUID: isAChyXsiSFhdmvXLvKc0gfuFwLlq-GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 07:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171903

It fails on qemuarm during do_configure.

| checking for compile options to get strict alignment... 
-mno-unaligned-access
| checking if compiler generates unaligned accesses... no
| checking if C symbols get an underscore after compilation... no
| checking whether target compiler is working... no
| configure: error: cannot compile for the target

Thanks,

On 9/15/22 20:59, Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Grub tries to force the compilation in softfp mode for some known target
> CPU. That is because it doesn't use floats or doubles and there are
> known limitations of using a configuration with hardfp. There are though
> target CPUs that grub won't know how to configure failing with something
> similar to:
> 
> | checking for options to get soft-float... no
> | configure: error: could not force soft-float
> 
> This change relaxes a bit the COMPATIBLE_HOST restriction to only apply
> for hardfp configuration even for arm7ve/a.
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>   meta/recipes-bsp/grub/grub2.inc | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 47ea561002..e257c31235 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -43,9 +43,13 @@ CVE_CHECK_IGNORE += "CVE-2021-46705"
> 
>   DEPENDS = "flex-native bison-native gettext-native"
> 
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
> -COMPATIBLE_HOST:armv7a = 'null'
> -COMPATIBLE_HOST:armv7ve = 'null'
> +GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
> +# Grub doesn't support hard float toolchain and won't be able to forcefully
> +# disable it on some of the target CPUs. See 'configure.ac' for
> +# supported/unsupported CPUs in hardfp.
> +COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> +COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> 
>   # configure.ac has code to set this automagically from the target tuple
>   # but the OE freeform one (core2-foo-bar-linux) don't work with that.
> --
> 2.25.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170695): https://lists.openembedded.org/g/openembedded-core/message/170695
> Mute This Topic: https://lists.openembedded.org/mt/93699232/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

