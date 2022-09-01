Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41945ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 02:40:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7749.1662000009363439914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 19:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hpubq6Ge;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62433dd12d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2812BVl1023679
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Sep 2022 02:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=80D5I9Rdk7lth0RYgyxYH0GOw1TVRY20oSA8ivyMT7k=;
 b=hpubq6GeD949O+VBUA8zTrGocHztvDXm/Uu9Y/kkDOxOCjwpABHI1Rj3PdFxWn9gi0to
 vaGw88p0gMwrplzrIiWs4kmPhHicqjI8di0UUNo+TLJcGBR9vL0ZHsTSIWewVTSC57SU
 hsfQmWaiTeZvlsoHYIu+2gyd/udg6ngSGarlxbvVYtJhchfgQBnisIV0XYIFp8DEssPu
 twZOm/5sxCGmSa4AGmU6+0VZ/1TwolWAo4/tART/Pfr/OM9CadkbSdoR4O2X2DLlHNLB
 /1rpJfbPj2w2C+eKRwWOujq1+D/6dK3/q0/Z9KTZnPiFE4n1aG2SOjwLAAWXtCbhlMXu 8Q==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2mbjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 02:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNe0BXqthJIIaCs0BrA5T5KvR8qc3SbUhcSXbnDFhjKA3vO51y5cAjHOyoFLBu4gp0OGKL+KWnnBGrNUT66wGUVntuUQ6vCe/H0WMAlp395t3nTZCsKFPY/SGC0+c0LIGhw1mQU23gGQ0Lj2JpwJmwLDZC69vkEWh2MlzoKhPtvpZgqNYddRs2BQyNhn6dgssvEybwslniSY9UdlKCphA/715uZgDauhJpMLQOHZoODjApjLeoGU7olIcIlYMGBNYkKp7ANpeQexrAtGdvojMD3BDMPo6bl12v3wK/DXwn+RMIUwnhtcWSgWwURF3BopfzAMqr91jWG0S1iEtc1W5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80D5I9Rdk7lth0RYgyxYH0GOw1TVRY20oSA8ivyMT7k=;
 b=FR8C4UAtDNd0TWQ5/DricEQRV3hnCFHYB3sU8g5zheuuCxwiqKF0s7EEsdSCXIeEhkhDf1d7LoD2u0m28kz6KT3nd3ot03XoXNX/MpsjikUxUgzNVJYPhMNoX2xHtokLzYc8qc0mcWfNmKNiezVcF4RrFB5nIQY98omlS3KBHRN9Ozt6eoWNgZlo6LmhG6rHy0HcAAlKJx0bjDf30B/XsAz1pCJSJhH+6dX1jN6obzY6Imtk44iYc/ZgVHCohYQhxqResCriAB52cvJVWO1n2dgWCVmyc+jyclJo37+Q6nzCN9pOrYdi/eb9nBnMD01M74npKFm1QtPTVkjZWrwtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BYAPR11MB3160.namprd11.prod.outlook.com (2603:10b6:a03:1b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 02:40:05 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::404f:607:f5c:727f]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::404f:607:f5c:727f%5]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 02:40:05 +0000
Message-ID: <3870fec9-9854-bfb8-7aaf-d1340ce9b390@windriver.com>
Date: Thu, 1 Sep 2022 10:39:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone][master][PATCH] parselogs.py: ignore
 systemd-logind warning message
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <170CB65E0E9FF256.16931@lists.openembedded.org>
In-Reply-To: <170CB65E0E9FF256.16931@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0216.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::11) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7700641c-f835-414e-f941-08da8bc3471b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3160:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f+fMQRlKud3mTwPupVFAyIxPesMDT0+I5E2ldtFtVK6bMVYnfvGeZ2CfMC6Kw+avKwOwYBPHAHIsH2mM0Ma/lKnvfRlp+1IQKDrf4oiF93Lu5drQumQ5HEVB2F/4AeyEvNMxYbteTICX0U9POcks8GBOGH7Ju/h9IgpHPm2Xt99PXPHlnlj8/eSrAHSOrfFKNw7XpTEXCd2zrzM+U/dYgnc8ILgWz2cZioSkR+uVO60CfHOBfAIj7g8YSxx8M/0lf8XM6OoTQXx4xoUnD/oLD+JOxFq3e7ysz6XUVTJmv5QJjz2Vysy037BVn251TI2fd560DQW08ibhZm44+FB37B5+zrM5+ti62WY2AePLtAKmxV09omwf/rNVTFJk6gP7LoJb96By5QvEhviY739EDXbL76KVSCO7gikl4L8ZAySpLRTzadackrMYu/jcFgeK4IzSOje5HXQRbSlcE35I+/J5qnosTPRqf80MpqmbynRlg/R2v52lHa52n/fMGOsLxDfrgyexRzZoSbjs0332WcZy6LV49liDsKZ++TGsYedNW3u9Q3D2iUXyEsncwfzm51HeQuAj7V+ZDR//F1OzXlrqa7O4/+htAHaasM+x3FAQKQzZEmU+EJTySX7+wd3CVnTkt2RGhykC+CvEVkqwFK5Uo9RQA09WVl3iFpgbSfgAcqVWHAY2zf517SyNDWBO7bvQ0lkm5FPIsmrTyaVE6GLAQ1SgG9DDmjFG67asKGlGWxq/OFDq6t3xPXSgqXJSZ3mJDwxnzy/yhNELtDf12jostK+Bgxkl2sK6t2pQ28Tq16TWmPFjzUQrSqPyyo9II38/gtsdR2UGJRJ/DS0vkEaeXhwoJbdbL9GwGOs8my8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(6486002)(8676002)(41300700001)(966005)(5660300002)(2906002)(53546011)(478600001)(66476007)(66946007)(8936002)(86362001)(31696002)(2616005)(186003)(6666004)(44832011)(66556008)(6506007)(83380400001)(26005)(15650500001)(6512007)(38100700002)(6916009)(31686004)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWZwM3BsNHZDK1QwZENTdVVPMlBSQ2RZTktQWS9PMU5kWVNTZXRvbGcrazE3?=
 =?utf-8?B?cHZPRGNpUzU0VGtWNHBUNDlHbXBsTUw3dG9vTUNVb2NoOEZDNk1OTEVQdW5V?=
 =?utf-8?B?R2VrY0FSdytlb09TQUx6RGtPT0tOc3JSZU14THdEZDArd2dCaEx2Yy9DUjZV?=
 =?utf-8?B?SjFjQ0ZwRXAwQXkzUFhBQ01GbUlybXlIZUxHbXFLY2hibXRNbGdXcEJOL0F2?=
 =?utf-8?B?SzBrcUM5NHZNQWhHMnlISVZlU20rQ0d0aE5ZRXlVKzMzT21PWDJLK2g4ZWRD?=
 =?utf-8?B?RVJtUXZJWHBZWXE4dG9hRjlOVFBkbDZWTFZSU2F5dmxhZkhiVWdrTnVHNGl3?=
 =?utf-8?B?TG8yZi9iNUlDRlp3cVlyMVN3d2x5eFZadUk2Qy9VQXd0VTFIRTNPTDJoWWVs?=
 =?utf-8?B?TURLSDUyY2NCSEpnYjlrVGMwWEh1Zis1SzI5cWlQM0s4UHo1MXlpQ3hPVmlZ?=
 =?utf-8?B?OTBOWDhZNC9YQzkza2RsRmJHTGRCSWlvbTJIZnpPaXB4WUUyRXZGd3g4WHc2?=
 =?utf-8?B?eHRkWFg4bHRId2t6aGx5Mkp4VjdVVDV1RklKejJTbVdoYVBSZkMxNC80aG9t?=
 =?utf-8?B?eW9xVndCM09GV0c2Nis5bzdodEtFSXRKTngvZ0NYbytkdnVmVFZFall4d3lV?=
 =?utf-8?B?eWFZY2srZnlTUzNBNjlhTllkNDh6V0xUQ3NzUHhqSzdLdDNHTFpiZVlqKzU1?=
 =?utf-8?B?eXdKUTllUW1taTliZHNEUUUrenlhUXZrRDZsVmdvYTBScy9kcksyamZHTHRa?=
 =?utf-8?B?RUZNd3B4b0NMV1B6VE5WMWI1WXpoQ3U4MElSVHAwaERxR1VCQ0NIUzhjRHJ2?=
 =?utf-8?B?U3YzdWdIWFZKczJkNWo3ZUJ5RXpxVkY3Nk1LL0dXKytGSWdVajljY3UvcjRo?=
 =?utf-8?B?MEtuUEZySkRSL0M0Mys5UFIzRDBRTWg0OXJITDFHSjhDbUV2b0tIb3ZSMXVK?=
 =?utf-8?B?T3NtWkV5cFRqbm1Zdnhmeno4SXNHdEYrTXhuSFJkNGxib0t1cXc4c2dDRkQ4?=
 =?utf-8?B?UFRwWWVsZ24rbHJlMEJ0UmN1aDRMWjh5ZkxEV21iVTF0ck5iTWxtcUN3SkF5?=
 =?utf-8?B?MWg1Mk1sZmk2Y3RQczExU1pwM0JmTWhSa3hNT3MvL05xSTZWcWZnRW9QZ1M4?=
 =?utf-8?B?UWtuYURzanE5TGJaNWxZaFM0OWJXUGZRV1pkd0tIdTZ6K3pYWTNmOE8yMytS?=
 =?utf-8?B?U3kwaVc4YUNVYlJ3R2ZzV05UeFQ3MFJIVUpsVTF1N2RkVW9KZnY0Y3BVZlJr?=
 =?utf-8?B?dXo2bllCKzM0KzAza0NIVkJ0T3pEcVNMMk1FM0g4alM2ZnFPMVptaDdZb0pC?=
 =?utf-8?B?enp6RVFjakhHSXRicFRNUkI1eGtUWWtBeDI1TEdxdVlGdVE3cldUK05KdkxT?=
 =?utf-8?B?T2lwbXkwOWNxeWsxaml3YnMwM0o5UEsvb1V2cGxZL2VYWlJ4R0kyWmNHc2dh?=
 =?utf-8?B?OUNXcXNScm9LSTZscXd4dkw5OHo5VUZsRm1yYVN2VWpYOGdXVWwxeHdZZWJ0?=
 =?utf-8?B?dzNMdDF4QjZzT2VGVVFoSGxtVkhML1h2TWV6SEkxWXd0UGxFajhvczVXV1pu?=
 =?utf-8?B?SFVCNks5bnFabWpKNXZ6WEYxK3gzVTNyazdXRjlLNGxGRXdlMDFHVGM5bEht?=
 =?utf-8?B?MmNITkQrQ2hLaWdCZ2ZzRmRnOHRESVVwSkduUGRPTUdGVWpPUVJ5UGR6bGJP?=
 =?utf-8?B?U3dYQVNsNWJXd2JtdUhOYUdyQnhWbkV4V1IxRXA1QzJ0dUl0eEMwdnJ6SHZX?=
 =?utf-8?B?eVc3TFByS2Z6RGZ0L2lOMXpIdVVqODRpVHJ0Nm1tQTNseEpKR3Buc0x0ZXpa?=
 =?utf-8?B?TW8rR1I0OGlLM2lLSEtNSC9nSFR2eXNBU2JhNElJWFlaNEphN2lFK2FEcytr?=
 =?utf-8?B?VnUrdDJKcHVYYk9FRmxNTU1aemE4NXN1TllaNmhISmJveWNvK2NUZkxSdEZi?=
 =?utf-8?B?UlpPNDh5bnBVZGF3NkhtRHkwSnV4dEJSejRCd3EyMm5nUmczQnZaRWZrWXhz?=
 =?utf-8?B?ZG54Q1c5OEw1SUxZdDArT3ZWVFVpWUpheXRwWTJvTzVzSFBybTRtdHJMWGdt?=
 =?utf-8?B?SG81NU0yaUQ5ZWFoWGRIQS9Td2hZOGVweEFiVHIvN2p6TmRmS013MUZPNkFW?=
 =?utf-8?B?bjZZVEIzNVpjdWlvRmo0aU9Qdlp0elBuUE11NUJseEpIUTVqVlZ4U1pOMXp3?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7700641c-f835-414e-f941-08da8bc3471b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 02:40:05.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FqQWlljUwasaTSYF9bPQNFYYZJ0TyhYtm4ctKtNB6h8TsALqB4U/XFeU8GoMDytauDPWbukWA64nxVC3kgZUVNkwkX49IoourUZz8j86Li0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3160
X-Proofpoint-ORIG-GUID: oEMXVIUlSrCeXYxMLNcnt3e3QjJiFRss
X-Proofpoint-GUID: oEMXVIUlSrCeXYxMLNcnt3e3QjJiFRss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_16,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=904 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 02:40:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170142

ping

On 8/19/22 17:54, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> During upower.servie startup, it will send message "GetAll
> org.freedesktop.DBus.Properties" to systemd-logind.service. Property
> RebootToBootLoaderMenu and RebootToBootLoaderEntry will return warning
> message when env SYSTEMD_REBOOT_TO_BOOT_LOADER_MENU,
> SYSTEMD_REBOOT_TO_BOOT_LOADER_ENTRY are not set, and also efi boot is
> not used. The message just warning and not harmful.
>
> Since do_testimage run qemu, and use basic bios to boot, test_parselogs
> failed with error:
> -----------------------
> Central error: Aug  8 02:53:59 qemuarm systemd-logind[383]: Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Operation not supported
> ***********************
>
> So just ignore this error message so that parselogs.py test case does not
> fail.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 15dda7947f..1b678f2ff7 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -66,6 +66,8 @@ common_errors = [
>       "[pulseaudio] authkey.c: Failed to load authentication key",
>       "was skipped because of a failed condition check",
>       "was skipped because all trigger condition checks failed",
> +    "Failed to read LoaderConfigTimeoutOneShot variable, ignoring: Operation not supported",
> +    "Failed to read LoaderEntryOneShot variable, ignoring: Operation not supported",
>       ]
>   
>   video_related = [
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169620): https://lists.openembedded.org/g/openembedded-core/message/169620
> Mute This Topic: https://lists.openembedded.org/mt/93121196/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

