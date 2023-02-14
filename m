Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B519EC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:52:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12588.1676393566014845087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KDsC8P/1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1409ec1bab=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EGjLkC011157
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fe6jdQhSQPwyeh/HHyVBKt6Z6OZN2eZHl6dLW+AnnEc=;
 b=KDsC8P/1IGkjNNUjuzrhbLwt6U7I4D6HJ6KDL0UxD9TksBjVZGNO6nsSMOTwWrWRY1H7
 c3XTwhZ8vWfAPtGnd//QWz85HaAQHbRqoeDzl569grodJ2jMr1zOWCkwNxtvs8X03sTw
 rBT4y01RL1vhsZGHbHee4PC7iKI0b02Aw98UjeL3Y/tzl6w2AFeY/Ve78mtrn8W1HTPL
 pO9G0divtS2Tp7l6kbxY3s35s74M0d5l7O7aA5VmlImQcT2p66VaqYyFoyE1nwrWNhMy
 VXG1dmXKg/Tl/g94LZJO6cA7pZ8mBgPe0xEO3Goy23/sMSHu3P/5xKHBqCJ431nHxfPW aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083awea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:52:45 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EGm5Ka016482
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:52:44 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083awe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 16:52:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duOprfg5uUymu1owmkSTKg3S/XVuL1BXkf1v/L+Dks9WOo5Rj4deB2w0ABD5YSCqun1rKsXFZePAEa8vtkrx9zhYuUmnYcqZC2iZmcMJLp8AqYpbYKBT0l0//AQ2wMnaUL+l7XzwtHeWHdHaElD1s5+R/cfX8E9gBAF/KKloLDN7P0dkPFDFeWZvjKS1Ej2hUC55fUdO9afzKRBOx94pS5ok5Zbb6nMnplLv6ln1HHCFBzVKoNc55abxbn1TfSB+8/3M0kaaQ03bIUmO2kj4/pxrRx4Hmz4hrilOBPl1L6gc7J7uQhReuXRirCM6W9XAjowlpRhx6OF5HimjRgAKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe6jdQhSQPwyeh/HHyVBKt6Z6OZN2eZHl6dLW+AnnEc=;
 b=Juz8v9cZuu+KDXZ452oMdDSPphNuFqoJtIMTnEVn7n7DjTtAnKvzHcDfTQ2ARaB6DcrgZTLNo85bJhg6W4pkzGtGkZt0BuwA/9ubaPtv5AMkR0+yjUM7tucGRZiQsH1QEelUyC8kurln54lvfHTstoVG2YLN0Jx7D66GIvunPDtcYlg102T3L/VnLZxyl8K2RWWyp1q4UDu1tctFcGmOvemQTAz1VSr9gBDtglSSeApf7WegiB7615jgK0xFaRbRcnLHVQf2Dud0aKqS4ORMgrXM+/U7KnPnNwX7WP73BZTE0vlJBSSLGX1svag13FM19IqkIODV3EPD3C3SV13bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:52:41 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%3]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 16:52:41 +0000
Message-ID: <0e22fb64-7b85-bc6c-421c-d5789afe9e44@windriver.com>
Date: Tue, 14 Feb 2023 08:52:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] create-spdx-2.2: Add support for custom Annotations
Content-Language: en-US
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230213195413.3535358-1-saul.wold@windriver.com>
 <CAJdd5GZjcOTBy-8LKmqdqzupiCz2mg5_PMtJUtj0juGdbkV1Eg@mail.gmail.com>
From: "Saul Wold (local)" <saul.wold@windriver.com>
In-Reply-To: <CAJdd5GZjcOTBy-8LKmqdqzupiCz2mg5_PMtJUtj0juGdbkV1Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c8c26b-62d4-41c3-2d4c-08db0eabe2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6MLszRSfbyR8FzcBJvsCdkyNSifiew1C1VtihvMBI4olabS72uYS9EA47ZDglbWVc8/lD0yN2B22YuKpRoalytatJe7ZMgwB/i9UAwATYLfxxynv3+C0LSqfnuzRI6wjxJt+k5jCYLcGWKIK1SnjX7x3GB/kdOwHQwDu8eXWpnixa+pmrtjPIu++FYSJSkFOXWg8EhLWO9gsF4s8rUi27AJJA0ovNii/xv84K1RbvrFnesdCKxsPUCiCOv+VDC9ekPWm+XHPpEbEyOIXg14fNLcL+3MRr5mAUXuKnj3xNUoPR2NhxkIyArnLkYKjqi1iqA3tJbd+jJFE/UT4l++Y/nCYWcAZHcFB1T0g0UZZb7DyG+W+0RlD7QR0JbtxP1/QAxEPZc7VNAyXY/sXNzR7OSZS6IJoGfjEsRCByEu9D4NcJ03MiPyms6bkc/n22+xdGhvK+uZT3QahZ21lYA0+8JmLT8tCCjl+h4IqZr2rDpB7jSwhoVRPYMyGZlBaot7E0Eusadu42Dwi6PZ4I/RHK4a9B+lduRoGXUyQNy7NTYDlftlJ+aqR1jaFrKDIpjd06YQtv/mgAsWUPlb3f5ytiD4fm4JgR07mFpVlu8F5pEWwoZJU75w5GNgfvj7Wnjw4KwWLq4Gg/ZBtAopJ0aJrCtB10o6+U3Wtgk51KB3S+dD86gcqQmWWNRIAVbTCzXa5NVlhVj9R/saM+FAxnABcSgZA+hRgniaWmQWJYB0mIyw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199018)(36756003)(4326008)(66946007)(6916009)(8676002)(31686004)(66476007)(66556008)(316002)(41300700001)(38100700002)(83380400001)(5660300002)(53546011)(8936002)(52116002)(478600001)(2616005)(6486002)(6666004)(2906002)(31696002)(86362001)(186003)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SldsaTZmNHlNOGR3WE9wUXE4MlluYlBIUmtoNU8rbVpWKy8zQWVBOTQvMzBW?=
 =?utf-8?B?Y1dwVGFSZU5DaWl4YU1TZSt2ZzJZc2Y2NkNBTG5TK3pnVFc1MGxtR0xVejVS?=
 =?utf-8?B?UUFFeW02SlNIcmRLeUNjTTJGM2w1MklLMTk1MytYbHZrNmxMOGxvc0JyaTR3?=
 =?utf-8?B?Qzdvay9PVE9qdWdpYUZSVTVORmljemhLZDVqMjRsZTFLa2F3TGlXK1RpN2NR?=
 =?utf-8?B?TFpJQm9hYkpYNHEwWkdXQXIxMStxdmJzcE5hWmdWbDgvR2xBVVNVcmxMV0Vs?=
 =?utf-8?B?d2xzK1ppMXRjU2tJZTZKaFpPS1lQYktzVDZuaEtNSUdMMFE1N1ZLSUJhOWZL?=
 =?utf-8?B?OUUzRzlUK0FlUzdqRmFLRHFmT2tkNThWZ0g0OWRQeVcyQjJoOEsyK1VwZ05N?=
 =?utf-8?B?dVNlSExSYlRrKzB0MTRGMUFrYTF2RmJuZTFPVGxSb0ZpMEhPeU5ZZFRrUXpZ?=
 =?utf-8?B?RUJTeEpPTTh6dE9wdjdwVzlLaHAzVFFxQWU2K1BQWFZhTk5KWldNTmpPcHJa?=
 =?utf-8?B?RFZQcEY3YmFERXZOWERxWXU4QTFMSlZxelRqVElOZGgzY1ZOZEoyYndVTFN6?=
 =?utf-8?B?MUxVRG1TMi84QjYwMng4aGRzVE43MGVyL0ttZXMvZkVnckxJVFNUdDZCeisv?=
 =?utf-8?B?N05sSHZ4cFhlN3dSOFVveW1ydVdxcXRtMEExanhoeUhqU1NseU9PdkZQbFpK?=
 =?utf-8?B?dEFVOFJockNpbVR2MFcwS1hPUUtkRTQwTkVsakp1OWdmSmJRc2dsdFhLdXZC?=
 =?utf-8?B?WTVCZXdxOE9VeUlVZ1lBcldVU29OSHczVlAzZE4rTWJPbTVoK2ZOQmEvekEz?=
 =?utf-8?B?QmVYV2hvSG1WRHZIdkdFeVZhQW9sZjBkWWo5RWsxbnlKcWUyS3dRdlBoaml1?=
 =?utf-8?B?QjJ2T1NSb3BkZ0NReDhuallUNWNtajJ4dVFiK3B6d0dxQzMvaDhPMnFLVkZn?=
 =?utf-8?B?WndXd0hGbzVDTE16YUZiOHl0WHFXSXBpUXNkdGt3SVBoejczem1vc1VvanVz?=
 =?utf-8?B?bGlrdm12bVJqSStoTXphOUFwaUhhSUFIMk1RaUhIMTQ0anpNZXVjQlZ5eTFU?=
 =?utf-8?B?c25mK3dBeFRLcDJNSnd6TlNGaVZTdUdpa1dyeVZPSWMvMjNYdFRyN3FzT1Nt?=
 =?utf-8?B?RWhGZnhndHh4bUFKOUxoK2FUeUd5ei9nL1RSaC9EM1RaSTJWZFByalBIZmxW?=
 =?utf-8?B?TVVsNUlxY1BKWGNUS0V2ZDh5VlYxeDlyZWZiMTVmZmttSk82QkNqbXFDbUFm?=
 =?utf-8?B?enIzT0lnUUFKd1ZpWWx4dlNacExBWUV3R0lYaWNGZ1BFWGRlb0wyUFA1MDlG?=
 =?utf-8?B?KzA1aFJLTWdLaTUrREZ0aG5oOSt2Ujgrc3hHRm5rd0J6NUJLM0NDek9rMmJw?=
 =?utf-8?B?YzMrZk5tdnN1VDB5OG9MSjIybFplRWE2cTFsVjBnalQzVllkNXBQcXhrd2pN?=
 =?utf-8?B?aVRLVXB6NmdQNE5WMSsyaHUzL1pTRGdWcHVDRTNNdVlaWkorTEZpOWZuOUd1?=
 =?utf-8?B?NmF5Wm5VMWdlUGVueUFCejlaL1BMdTRKZXJLTUxxdmNKeXUxaFdRbkF2cTVt?=
 =?utf-8?B?eXpEdVBIRWJXREJTSkR2WXF2MkZvdFZCRE1KYmV5SHpIcEoxUGRvT0lUbVJQ?=
 =?utf-8?B?QjFlc3hVeHRLQmZ6RzZ4VzdraEdXR0NxNVFVZWpKQWVHZXJhTlUrOG1hWjFs?=
 =?utf-8?B?NGZMa2NNL3RjbGh0QUFWRm9uRTU1TnhxU0pqdzdEMFJ2SkFRWUxRUVAxdUZt?=
 =?utf-8?B?eVZ0UzdUeWcrTFR5SGQxcHFVL0ZwZWNiS0lIZXdnTGVGZXVtanM1QlFSOWhq?=
 =?utf-8?B?TEtzN0p5eUJXRjhrM2NZVlVJUzloc3BJc0F3a3AxLzg4OUx5RjdSS3ByK2xS?=
 =?utf-8?B?Y2c3QnVPM1FCN1NVOWx1Y0Q3c0c1eDZ1U1ljYzNyeXVVMXJMQ2w0WDJDYlhZ?=
 =?utf-8?B?SVZ1L2grR0VJTXV0Y0dJZzlCQTZFSThuc2RacE1TT2xOelJoR0ZFYTdVVlpF?=
 =?utf-8?B?dUFCaEp4Q2ptSy9YeThVSUNxbjJQRnEvM3lkRnFlSTZqaklhZHVudHJNU0lD?=
 =?utf-8?B?bFA4cnVxTi9UYmJXbXFjb2dHZ3R4MHQ0Smhnd2lyTVc4RTZNSmY3WUl0U3JQ?=
 =?utf-8?B?Y2NGV3NUejloUWdrSnBQZy9zNXMyczhNUVlua2FHbWJkRTRUYzRKUDRybHVE?=
 =?utf-8?B?TEU4UXhERVUwNFo4WVdpZHVoc2NjR2RSVERqckZRQUJoVXk2Uld0MFNrenNk?=
 =?utf-8?B?c1NvQk1RTXI1M3h2U2VURnl3Y05nPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c8c26b-62d4-41c3-2d4c-08db0eabe2bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:52:41.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVsT69JrIBZgu7WW5vwcTMyOaqpn5VJIfjhDXwlDfcYR8kUIIyLMaEkf9ZGaSFBRIKmvKHsRbGMq07agHoejrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
X-Proofpoint-GUID: i3cOACRBxSZoYSS9LxzQgqZWWXVWfbiD
X-Proofpoint-ORIG-GUID: qyFPaiE5PFCaVPW5iGZVyRqIYSo7MHzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_11,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177160



On 2/13/23 12:03, Joshua Watt wrote:
> On Mon, Feb 13, 2023 at 1:54 PM Saul Wold <saul.wold@windriver.com> wrote:
>>
>> This change adds a new variable to track which recipe variables
>> are added as SPDX Annotations.
>>
>> Usage: add SPDX_CUSTOME_ANNOTATION_VARS = <some recipe variable>
> 
> nit: CUSTOM
> 
v2 will come shortly (I will try to address the flags)
>>
>> The recipe spdx json will contain an annotation stanza that looks
>> something like this:
>>
>>       "annotations": [
>>          {
>>            "annotationDate": "2023-02-13T19:44:20Z",
>>            "annotationType": "OTHER",
>>            "annotator": "Tool: oe-spdx-creator - 1.0",
>>            "comment": "CUSTOM_VARIABLE=some value or string"
>>          },
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/classes/create-spdx-2.2.bbclass | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
>> index f0513af083b..e1bbf646ff9 100644
>> --- a/meta/classes/create-spdx-2.2.bbclass
>> +++ b/meta/classes/create-spdx-2.2.bbclass
>> @@ -30,6 +30,8 @@ SPDX_PRETTY ??= "0"
>>
>>   SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>>
>> +SPDX_CUSTOM_ANNOTATION_VARS ??= ""
>> +
>>   SPDX_ORG ??= "OpenEmbedded ()"
>>   SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
>>   SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
>> @@ -402,7 +404,6 @@ def collect_dep_sources(d, dep_recipes):
>>
>>       return sources
>>
>> -
>>   python do_create_spdx() {
>>       from datetime import datetime, timezone
>>       import oe.sbom
>> @@ -479,6 +480,10 @@ python do_create_spdx() {
>>       if description:
>>           recipe.description = description
>>
>> +    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
>> +        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
>> +            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
>> +
> 
> Seems reasonable. If we need more configuration options, I think we
> can add it later with flags, e.g.
> 
>   MY_VAR = "foo"
>   MY_VAR[spdx-annotator] = "Me!"
>   SPDX_CUSTOM_ANNOTATION_VARS = "MY_VAR"
> 
What did you think the output should be here? ie what does the comment 
line contain?
Today the annotation would contain:

"comment": "MY_VAR=foo"

What should the comment line contain if a flag or multiple flags exists? 
Or the CUSTOM_ANNOTATION code only looks for one flag [spdx-annotator]?

"comment": "Me!=foo"

Thoughts?

> Aslo, in the future if users want package annotations, we can probably do:
> 
>   SPDX_CUSTOM_ANNOTATION_VARS:${PN}
> 
Do you really mean SPDX_CUSTOM_ANNOTATIONS_VARS:pn-${PN}

I tested this and it appears to work, along with the :append:pn-${PN} style.

Sau!
> 
>>       # Some CVEs may be patched during the build process without incrementing the version number,
>>       # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
>>       # save the CVEs fixed by patches to source information field in the SPDX.
>> --
>> 2.25.1
>>

