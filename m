Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE8CC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 10:06:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1273.1660903602892232930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 03:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mKzsYgkd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5230971fa8=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27J9qXix014632
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=27ptk1CCS9ftzPEPYx/4q/lfa0xpOF+RqyZUV3HZe5Y=;
 b=mKzsYgkdy2Cep3pzjpoFXlP2OVzQINmyRv8rRRKUSIBFagk48IQ29IkK/ypO4aqh1E96
 t5D45+bhSeYUsxpMf/nCtNJzepB5gxNld7NLGwsn84LNIG7vRae3tpvE4SEobaL21FJz
 DKgXiPWP+o8+KFz9XxCP3xAdUirdbWWOuqjtmkxoRbUDUUd6eHDN9s55t5ey+aHOrCMZ
 o5piCog1VQxi3pW99t1pN7e5iH7eWCa7Wp3F050uldsVuOr6EOg26HwhWqAXn5plkugP
 Xb8OIKG3vaaVYpFaZCIwDaEsGqBybHZGhVbWX5oaXvLrEUkja0JXdX0MnfPKdnqidRTe Wg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160w96j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 10:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOq1u47ttHz21xMCpYrHabyO9493oHIzh5ub8Ynxfm+rE3NqaQPUSehzPP393j/1wpRAiUCyhHwt1aeG3J0kQPag9/PrwF6xcOTQqbWAtc/ZcrMwgl3RqBwXAUWUijXFEUOZZad09PsIv74kTY333G8Yw3pXxFqc5RkWvI7BtLtjUR4Ouv0eXQUm0jwk8w0DDOoBVrdM8i/pP+YpXPz0EOoNMhG76F8ZIwRWSn0S4ja8sWdOYfr/bZW7UWv3saUVHeYOYTfVmFkpLHsWwGTejTdnoznyeB0A5nrvfKg6Xj1k9BnTfzJg4JYTtuMIHsa4hdFtS7jN1tUfS5k/53COfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27ptk1CCS9ftzPEPYx/4q/lfa0xpOF+RqyZUV3HZe5Y=;
 b=buDW8ZGs53qpaYch/IA1sWtcrqGfep/3VTI3961hTp1D0xN53i+Kg0HL1qEwzKPzLwnyNTIzTBlr/Ee0AzjlcGGvOrgNmoUD07nUprzQ7q+PkYN1KGy4rgl7cR+lfAUrCsLpNTyJZJ5ATl0MO2jTBSoamHNe1o1kNeNpMIUNXoHZaBTFZkNtWp7hZmbVYwxV6C82540fqxrYO9B4OuvN+8yjKwe6hExPmjfK41UNDcnzTvrKbVl1WrrdivUxn00Xl1oyAM/3sowuZ9cDleAgP6gyxHi8TLohvuhYKNfKub6KtJCcnGkMfDj3PQ1dytaa1OD14O4OY09/xhI/hbAURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BN6PR11MB1650.namprd11.prod.outlook.com (2603:10b6:405:11::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 19 Aug
 2022 10:06:38 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ac93:7dfb:f5af:dc5a]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ac93:7dfb:f5af:dc5a%7]) with mapi id 15.20.5504.026; Fri, 19 Aug 2022
 10:06:38 +0000
Message-ID: <386719de-f785-e1d3-a979-f58df1012716@windriver.com>
Date: Fri, 19 Aug 2022 18:06:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone][master][PATCH V2] apt: fix do_package_qa
 failure
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <17071B2BCB39B264.608@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17071B2BCB39B264.608@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed84d12-318b-43f9-b944-08da81ca8146
X-MS-TrafficTypeDiagnostic: BN6PR11MB1650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tZrFuF2UkMEPrOLTlMrRhnY64MtoWM3cfbwbSXnl6kB/th0+a5jcuS5CP4zg1iXvj/Sd6mUeSgFzDQ9daaYTSRnfq3pDA21OYI4KAxWfIGMFwnvqL8bgIDkahHpWuPfXgEMh8ut2Bgcl0TqomH8jHqczGstgWplES6ts42Qujt3RFbLwDaFaXPD6E24XzWK1nJHQJSDyX1h1ylawuNnXi5C2EGHghvCOYtDElhwQPJyHBXekBQ5KeBUUn7A1lwILpWFDdSvMgmdpvjeFufXXP+GIQinZ+vDBGvRqBjtDWg1iplETE4yfpFqXIS57Wq394bzL4HivPWrn0N97nYyFWxMz084EtRAD8sxbFcW477J+1m3XW3CZzdRmRW6fo4HDfYF6r69qnsEjLN8cUpqnJOzEyp/ZCwxfs4WOxMoDPUAKfi1dt56UQBUokLlyTX7Xt9vqO2zMsS0B+kCmP8t6uAS1D9Uwgir8QpqJ/zMkp3LgS5oOJAmKLPcmN4goSzUhlAVMhfUCFZ/AXl5O+674D/mBDJjTkgiF2c29ZULJnwEJknQs85A0SPfu808GZDX+iMpbAYKQw3EBkFG/6TfuBW6kXVNBwXukpjgQHrdvWL0wlZzjTcsCi/KjUplbzmRQHJRD2M2cO2CY6ON5bx+GvggKDQUXMFXhOmSCmBWCsmnMP1obsWlfLiCnNnoGU6rL/ENF3olaViplDbxcWte3ZIJ7CbkR+7AQRw/4azNcvnIIm6opidzM6+/0SOx9syFSav3No3msfw93qwXnh3TCMtP0BaKraXIOBHe2LZsYwlnU3QwOQNFmQ5sDuKmWvupGewUSP8eMpDzKQuRrPq9neHKkRHR3hZJD/z1B6hQC42w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39850400004)(376002)(396003)(366004)(6916009)(86362001)(31696002)(83380400001)(186003)(6486002)(966005)(8676002)(36756003)(31686004)(38100700002)(66946007)(66476007)(66556008)(316002)(44832011)(8936002)(5660300002)(6506007)(2906002)(2616005)(6512007)(53546011)(26005)(478600001)(6666004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MExNSjNnRHRUMnpQcmlZUGdmd2tkTFhGMjRjTTRVV29jYW5VbjJZcjIxUWJj?=
 =?utf-8?B?NEdLbStMajl3VnlBVkFZTXJnVlJTUzBXM09jM1FsMkhHUXJEdUw2ZUMvYnZ0?=
 =?utf-8?B?d0NnRFVOOWxLOXJsWXRlaytvdlpYMElaU0IvcjY2SGNXbk5jblRTdS9iL1Zs?=
 =?utf-8?B?dTZ1NHFFVFhIc1k0Wk1XOXZWUTMyWDB3SnZVeDZra25DS3pIcnVwNUhBeUJ1?=
 =?utf-8?B?b2V1NnhIcEZhUkRueS9OQmhDUm41TE5pbmFkVGhia2lYSjZ3c21vOEdESTQy?=
 =?utf-8?B?YnJkRVBZUnBlM2VVREY4WG5DT0ttdjZYeXlUVHljak9HTEpmRnl0YVUwQVJ4?=
 =?utf-8?B?aGMvNElMN3pLaVpBN21PejFna2p4THV6aVZFaU9FUGF5NW1na1Z1cmVacTkr?=
 =?utf-8?B?a3pKc25SL0VRQy9vZm1Hb3BDbkFETmxoMG9YV3J4R2ZxM2Y2RFhSMlhtSXZH?=
 =?utf-8?B?RTlsUktXcjlNNmN4WTU3azlTQlR4M2FZanZBMkh0d1lpdkFyaEhLWUptSnBw?=
 =?utf-8?B?eW1TSGlyOW5TeWh4ZWdzeU9qSmtJWGVlUVJnbVdCbWV2UnRHUDYvRGQ1SWNB?=
 =?utf-8?B?TDgxalVtSXZ6REVKT0wvZXdsWmtzaFBKNTJKRGRLOWtUOUt1ZWFxZlUvT2pV?=
 =?utf-8?B?Z0dOV3oyU3VNcGNTTjdOeEhNY0VIV2tZVzUzVmFLTlBnNXlsV3VvblVXSkNJ?=
 =?utf-8?B?dWphMWtsWGRJanNzSGloTkF1cXVvVFI5eCtqWHBEU05RQUNRL0p1NUxveXEr?=
 =?utf-8?B?Q1pvRExBeENTcTdFdjMvR2w3ZURueG5GTmRTT05Zdi9iVk9yQWQrUGs0bjhl?=
 =?utf-8?B?a2NpdWtzdlFRK2IwYTdjK3F6ck1lZCtiZDV0NUFpek5kVXc3UHVybWE0eU9s?=
 =?utf-8?B?d0Jhc1JuRzhja3JiY3dVQ3RXYSt4bWhFYmtiaUlTcHFaTEpubCsvb29hZ3du?=
 =?utf-8?B?bXNnb0FyNkQ2dDJ3TGgxU3ZHdDNmTlpCZUJtcGVTSjNQR0Fad3JOTkJ0YWY2?=
 =?utf-8?B?RDJmWS9LUjRGeFVSMFY1T1VJVmZCTXZURGsxaDd6V3hXV3RUQ2Z1RmdOckkx?=
 =?utf-8?B?Nng1SUxxb1lPUUNvRWR4VlJDMlZsSENpT1JoYk9UTDdVUVYvVkdMZXUxMjB6?=
 =?utf-8?B?L1VBSXdVMXpOSkVmaDVoL0xreCtnb1l2ZlhqcmJaamN5OFF2cG1IYmx2OUs2?=
 =?utf-8?B?dnpUbnAyL0s0RVVqc2xnUkkwSG9USFdUTGRodnd5dG03QzdEdzBQYXl3eVM4?=
 =?utf-8?B?WUZVenVidTloKzVUSWtJRzkyYXdEalVDaEVtSE1iVzEvM29OeVozSGpET3F1?=
 =?utf-8?B?UzJOcXNoUldhc1RVaW1QVUxJQUM4Ni81RGsrWElVOGhwTldDYjJnRUVoakFo?=
 =?utf-8?B?YTdiM045b0FRcWlzVE1zTmw1eXRCOU5CeXdwWUJzVHNEMjEwNG1xT2I5WmdP?=
 =?utf-8?B?cXZaUkZuWUVOU2NtN3ZpVzhWZGZ1MW01R0J0Y0cxY1kycmRzMm42SkMyd2Mv?=
 =?utf-8?B?OFdIRUZBbzlDcE4rWG1Uc0NMckp4WTh1N1pnRU9oaWZ6VTF0TXc3TXVsMDNU?=
 =?utf-8?B?bXd4NnhuUmV4YzRwV3poMmJaRGN1ckVCa2xuWDVJNnNyY1duelN3cFZYVncr?=
 =?utf-8?B?dDlXUDl4bis5QXBkS1Q4VVRwK3dxUXhFWkFhcS9wNVBKcG9qdlNIZ0VtbTJ0?=
 =?utf-8?B?WWJYS2dyOVM3bWhwbjJmN0x1dHFOR3BWVXN0R0pPWDNab2I3RE5KanJxOG1T?=
 =?utf-8?B?VFJXVEVSUlJWYUZ0NHlEWHA3Z2EzK1p5SnoxNUhrSVp3TktaU2JFa25VaWVa?=
 =?utf-8?B?QUJlNVoxbktvK1RYL2Q5NnZCVEtyNDNMamVFVVIvZUoxamlGK2d4VEpJMDFL?=
 =?utf-8?B?SldwV1JFS2JPVXBVTFFsWk5GTy95V1Q5NTlOUVFIbVZaT28zSGdYaTVGbUVD?=
 =?utf-8?B?TG1iNU5HTitHNms0dzJMTTZnSnEvbTVVVWxGQmZpbnQxUlZoY01LWlZicVlL?=
 =?utf-8?B?OTlBbFc5Qm5hcEdxV3hCT1g2eWVLNElqYUdINE04YitSMEpPcWtyZjJYcnRr?=
 =?utf-8?B?Z1Y1U2c1dmxWVHYrSytaUFhrTzN3cXpIUTN1bGJWV3VsQ1NGZHdhTnFQcFI1?=
 =?utf-8?B?U0JXNHBpSzZKUnZCRlBnWjhBOG1wR1BVWnkrcHBUVi9IbGFUVmxaTXdBQ0JT?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ed84d12-318b-43f9-b944-08da81ca8146
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 10:06:38.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3sz5dBRY5bg7AoN6nXCymh8mI93lxoOQm1oWE+cGw8VF5zHuSroxsZsESvggFZTs3jx/70Hdjj4DBwewZ8OutrwWHnZ5GyFgOpTzJu0wKbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1650
X-Proofpoint-ORIG-GUID: YgiGQKr5XpKTOTix85tncaM15aMqN94K
X-Proofpoint-GUID: YgiGQKr5XpKTOTix85tncaM15aMqN94K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_05,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=984 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 10:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169622

ping

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

