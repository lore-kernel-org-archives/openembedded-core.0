Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F49C54E49
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:33:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10859.1709861605298705517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797153437=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427LBqg7030992
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Mar 2024 01:33:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawwykg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 01:33:24 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4281XNWa008114;
	Fri, 8 Mar 2024 01:33:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawwykf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 01:33:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhjCs8HtgF44dhp3uZhaQu9SZhV3BtZfNBmKH788SWFHpAZisKFk0mg2v7QJOMYyZjC8vUshlvUrshIldQYf/VHfhYgP5i4HbUK2OVVWcH9SHUvXw+tX5TLt1ThbibxJhr9fW2bZU2LQskHrxpsPLk/ubV3AXe3WsBVyNVGqzwp1atCGU/s9I9USDeea3v3hIsNRc4Cyj88dMO97Cu9d6JJr3iwHUdZ1QQNtfhV3ClY8Rnkg7s2u6VSxHzPM++GX2BFyovRTtT+Vc2B0C4km4zrDCuCZ8Ly5uTrVnbIBmvIe1GhPBmrjB5ch2mpNAb9rnv+9850FD6gyHglzE6MViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2hSn2tDcWL6cnBFbm/+uroNLmUK7OU7g/NKLbXNkm4=;
 b=jL054+n32iE6m9AVUwYf3m1RvrDG5M2wafyMmiV/hTv8Urj3niHd/bVHh8RY3nrNRiW4G4K3bfBf+ewnshCUMbU13N0luMwteY8uU/b1f2GXunTfM5/zMrhFvv8fyUJ7NsRB0ebxGKwqZ9oCNEns71N55q3wVSEqX+T1qOimjMlikRDoqEnyJcRMo5rE/5sxPV+T70DXFbiyJM49XoHMct+JqdbyJPaTLzWcBeEW63AxqcylNqDKy6jyki1GtEijHYTFxSXRv+9nqKy1JS3Xi+THuEGXM+QhVHuT2eO5CER2Mqu7hj8hR9rAURxbT8Mn0B1f9p0NjMHhH8fQYblRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Fri, 8 Mar
 2024 01:33:21 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 01:33:20 +0000
Message-ID: <7468d1dc-182e-4e49-b462-dcdb7505feea@eng.windriver.com>
Date: Fri, 8 Mar 2024 09:33:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] lttng-tools: skip lttng kernel related test if
 lttng kernel modules not present
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20240131034036.3161817-1-xiangyu.chen@eng.windriver.com>
 <15817651ba1ade33b769061f772cfab961aba996.camel@linuxfoundation.org>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <15817651ba1ade33b769061f772cfab961aba996.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d046c2e-8431-4bae-8ce4-08dc3f0fbcf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M802C5595vh/XUVsiUGAInDCDm2D6w5+TxodA/QeL/Wmy2Gbyq+r9Nvk5mCDpK7AM0FyCXnNB4MEX9KZNPGddmHH333xhS8H21jxUpP/m1lWboLDhQJ07c2p5PYsvTq1PIuUzwiN5Gyn7qPvcJfrhqdDh2ZO8kO/ajlcJ868pdUbcqCNYJ764Pj0CkCd3NggiLU3PwB58FvR+LzPW9vZgePeNIz7kbIt9xNLioRxx9lESguOzc8BxxK5yxKE/nF/pU+PIeZj/5JaO9tjbdKMXVRz8ZM1qyHLr8kvrUo1jAgr3yZzwHTlDXNlj5FZx45F4HmNgr8OgMrmqLSc2q9GtcIci2D+OGwUOCtOluhLBtlynh4/7uzD/jYTmbSvcBzmzRbnSVwd6bCbGmPpwYLboEa34iH7FgtNDbgynteQ+nuIDhrGmnt9cxUtwRdRkIHeUkZ7/Lzq4JJsQm6CzPJFR0bE4BOTOMW++sM3Ld9TrY33QgNdX+2EtyhEFsJPSAE4sY5N1F92a2vmTMBxEnle5uVd0TbtRMT1v+0P+Q8odw81wXGB65wZA/fQnUX8wF7wNYnjAdvgMXsp9ptGzxRJOi4YQcdz+YwwbNORBOdEnnOKmYla4/IfaOCBFmUX9Gs17iessn6wDQAzmGnkw7lb02qXP9IKNpFeEOWccFZd7tg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkFURWs4UVV2b0Z6alhYc2VidmlxODVKTVg3SE5Cc1p1QzYyRDhwT3Y4cmRF?=
 =?utf-8?B?UGpsWi96SzZiTmtpOHU3eU42N3diMzVCekhxT0lobHloaCttdjBBd1AxNkpO?=
 =?utf-8?B?RlVPb0E1SkRSc3hnL1RybXRTSU1kclNwcTZ1bU0vVDlITHFGTGd0UFoySFRz?=
 =?utf-8?B?bWJseWdBdS9tOGJwM1F2aTl2VHM5ZmptbzJKR2RFVHhzQVJiZ20yNk00dHZ2?=
 =?utf-8?B?VlNrd3RVWUV1OFkxKzFnbHN6aElidVRTM2s1WFlveUpQS2tNUXY1cGlpRUlD?=
 =?utf-8?B?aHk4aUl4Uy9YMHB5Z0picThDa0hQemhrMUdKVGovSGZsK1VsdjZXeGVBc3k2?=
 =?utf-8?B?UmpLbUpab0tSU3FqMVN6MWFQUmNZdDR2Mm9TSFNzVFVOdkwyanJVZXpPczNB?=
 =?utf-8?B?RzU2bHhXd1ZLQ0V4TURqN2YyREdCczZNaGNMTURSQVM1ZDVCaUNqVm1NM3dS?=
 =?utf-8?B?THFGV0xkK3lyZkxhNzkvbHl3RWdob2x4QVVjM1FqSUNCV28wMDMwVG5WZU0z?=
 =?utf-8?B?QWt2UFZtTENNV2VZUUlKSURUT29VUCszcnFUajNjTlpsK2NFQkYwTERzS0t3?=
 =?utf-8?B?am5ORUNPVktCVTI5RHVQb3ZURGhTblY2ei80WThaZ3JhVHlKQXo1N1YwYXpD?=
 =?utf-8?B?NHhhdWdpY2tjeDlFNStDL0pTYnc3Wk9UbTMzeVkrNmNWYXB0NkJwcG9vcmRZ?=
 =?utf-8?B?aXVhRFV1MDlrYnhPVzBDbVRaWUF0bUV4TzRYbURVVFdOdFZzeUJMMGl0aGNt?=
 =?utf-8?B?dXplaU5QVGd1cGN5YWE4RktFUzJZRzBialRSRGR3VGdaUjdLNE0zcEMrTFNC?=
 =?utf-8?B?aDk1OVJiRHlHbW9Da3dtdm9DMldOLzd3c0pXMFd3UXp1VUlaeWJGb1FTaHdn?=
 =?utf-8?B?c0FRankxN3RNaHNXRDR5M2ZOak1Rb2NDNVBiTy9XZkdmeC9SSkdCeW1lWHMz?=
 =?utf-8?B?YWY2SUwwbHRDY0NvR05jNkRJYms2ODhxdzc2UXMrRVppc2NnL2Y4RkhZeERL?=
 =?utf-8?B?WEVSMFlsaFhpQUxLSG5kcGpPcVhvL1lObjNjMmdVQTVxbVdnY1dvOE9QSGRH?=
 =?utf-8?B?UHY2dnBEMHhJWFJ0UVBkNDN6czR5SGI2TXFyaVJxRUR2T3JIcmw3eHhxeC9S?=
 =?utf-8?B?VlJLajlGYmlFRXdSNTFGWW0wRTdlR2xjT3Q4MkVTNnBiTFUxaVdMQlRQOWx2?=
 =?utf-8?B?SHJqQkpJSDA1ZXpYeCtMMkxwZ0p2M0JEaWpKS0NGUTFhRU1BcDhEWmVsL0l5?=
 =?utf-8?B?b1NSM2ZyVVRnbnVzL2lSMDNVOGFHVnk5YkV0ZmFlaktnK3VUZnpVMG5nL1Q4?=
 =?utf-8?B?U0FUdU9iTWFiMmEwUExnemtKUTFBa1RwKzI0WUJmSjFteHpGdTRXZ05sR294?=
 =?utf-8?B?VVVNL0gwd2piZWcrZ2RZaEcxYjFjWEVYeVlyR1YrbUtRVHN6WVNQNWRXY0Ir?=
 =?utf-8?B?U21RZCtWRjU2b2ZIbVRsRGNicjViejlGRDhpSzVhaGJMalM2MGcyblpyTGh1?=
 =?utf-8?B?aHJWUVJZYnpleTdrNVlyNk5KY05aVFFOZjlVbFY2UFhsZE13K0NYNXlpWkNw?=
 =?utf-8?B?NExqME5OdWc3UEI0cUlLdkFZRnoxV0VSTVJwUlp4K3h5RFkrRGgyZUVDTzNN?=
 =?utf-8?B?NVN3OTNaM3A3L1JFY2FzQjBZRzNNZVhSMFhDMklWV3pkVFhpdmkyV0IwK211?=
 =?utf-8?B?NWxQdnFzYms3YzM5QUFLTDVRenJiMnpINFc2Q3dFOVh2R3phSWdDREJPYUxi?=
 =?utf-8?B?TG14dVNYVmlEeENNK2VwNm1HUXFBZ29WSUJ3ajNrWE1aVFJsYTJVUWlJQnY1?=
 =?utf-8?B?UmpiMU9uM1FhRnp3TklzaEp5TXp5L0M4VlpHRU8wNkNtM09kTUN5bDgxS0Ni?=
 =?utf-8?B?dmQrbEhjMHRmWEV1VTlxdkNDRmpUVGVNcVEyQjA2cmlvUndwRlVveVRza0k3?=
 =?utf-8?B?NGl3SWxhUHNab1hvZGdmL2pHMVhDWHpxMXBCRzF4RC9nSVVMeDJmYUVyM091?=
 =?utf-8?B?ZTFuTS81UlRQaWt2cHlQNjc5T0Q5UDYxa25QTXBOWDhUNWt5RG9lUTJRcHhP?=
 =?utf-8?B?TUFpN3h4bG9BOEtIRjFLS3RvdE13KzcxWlVYWlRVV0ZEK092clFhays2cW1h?=
 =?utf-8?B?UHI0WG5pU3dqRkJQRit1US9OQ0xDenFENmd3WHFJWEc0NGh0SllCVEsyeXAy?=
 =?utf-8?B?Y3F1dUtuVGlQTUNHL0lCSm10cG9UZ1Noc2txZm9ZK25VanEvSnQraUplSi9w?=
 =?utf-8?B?c1VKbk9vTGNUK2toSHFpN1ZySDdBPT0=?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d046c2e-8431-4bae-8ce4-08dc3f0fbcf3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:33:20.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVZX9WCOj4lvCqJETZBmlfbvJ5eP694EB1vpAZlzXJ/vsfCm7zHFgIWVgB+IGVvE2n8OiPKWirQOVKtcenHGtkPkf6QO3v3+hGbqC2BBips=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-Proofpoint-ORIG-GUID: X0RNHdgjQvtKAvepz7XCD0QLTGoxTBYr
X-Proofpoint-GUID: Z60WLgfR5qVuZeMaAfxg2_4XAi8iuqIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_18,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 01:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196839


On 2/10/24 00:44, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 2024-01-31 at 11:40 +0800, Xiangyu Chen wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> The current tests will run both userspace and kernel testing. Some of use cases only
>> use lttng for one kind of tracing (e.g. userspace). If the lttng modules(.ko files)
>> is not present during the test,it would end up with lots of failing.
>>
>> Add a check in ptest script, if current system doesn't contain lttng kernel modules,
>> passing LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1 to make to skip all lttng kernel related testing.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   ...skip_kernel_test-to-check-root-user-.patch | 1307 +++++++++++++++++
>>   .../lttng/lttng-tools/run-ptest               |   25 +
>>   .../lttng/lttng-tools_2.13.11.bb              |    1 +
>>   3 files changed, 1333 insertions(+)
>>   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
> This is a complex patch and I don't really want to carry this until
> something merges upstream or ideally makes it into a released version.

Hi Richard,


Thanks for your suggestion,

lttng upstream has merged this patch, I'll send a v2 patch to oe-core 
later after a simple testing in my local setup.


Br,

Xiangyu

>
> We simply don't have the maintainer capacity to carry large patches
> like this unfortunately and the number of people who need it isn't
> clear.
>
> Cheers,
>
> Richard

