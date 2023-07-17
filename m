Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9565FEB64DD
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 01:34:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11222.1689557693521811817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 18:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JSXKpBJW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6562b8c1f1=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36H1GUjt024509
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Iry95brkIoabQALgX1sybDSV8uK/31X/eCEj9of46rI=; b=
	JSXKpBJWKW7PQMmhsI4maXc8QLYeG4dSy8wk3KMCQ5fr7V7kmVfgMl/9GUaA5HAX
	5kCg6ta1B4mxaKvivH1JVYPKwPy0S2Vk3kkW62anFwzOdwSY4LztejX7QXlv2Xo6
	4OFKoDsuRUwSL3p1XQxLI3tPy03YFti3v5N4dC9lAZRwY33RGkp+WcNLnXOwTwwu
	hCXeTuhPaK0hDdRW6dxb+zJMxACpRVnrQI4AwQ+0IhHCe51PAUS7IcFY5mV4PHQk
	WwuxHgs8P2g5Gk0j5SipSgCfQGQ52CnxP0wZjZp5FXw3O6ZTtOu3SyIgG6NlGnG2
	XITRUDNiqqCEikYAGK+UGw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8a95qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:34:52 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36H1YqVr015796
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:34:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8a95qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 01:34:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjAFucPnovF41vzn3yJRV5+Y6dDoFgH6Gd6sWlQ0Bw+MvvtPS582zVBJFmy13VTd8DPEWWXBLc0J7NidZ2adySUEYUOREjQ6VoSEYxwFXSFTQVcPoWt0HT+WJyqRY6iPCQE06b5HmHPuhQm0WAKFv9O4sQHaEgr4cox2QnJohCkM4Khp4RDD+4MLsWi/Z5jgQJj0CYFxYR/J/ulBT/3zEn+hpJXdK6vJabm/qGY3sFgnFq7hC+VInACcGeiCA4Z1D5xmbebwPLnsXIV8+/I/CiuT9km16Na7JZpB2iiE90cBjJrvUJqzXLHn8J5hzvAID2jJ6nCouWUnxszfZmmYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iry95brkIoabQALgX1sybDSV8uK/31X/eCEj9of46rI=;
 b=ZiImByDnWC5KJZtY9FSDobeorEXgZBAwTqek5+egSipNjjk/QA9+O0YKe7d8lb0dX+49SDAQczvpPNqlnmWYCJdIVVZmWMMKNtl5UFetNZEk/IsunGbJGgassLAqusoezWUavzgtzgCta+9LF53QVf5lnYF57zIFQ0Is/Z1NKHSUHjCA/6HOI3jkxcwlBk/A33JISkdTkl9Tznp4t2GIsxIzv+h80RlU6OU9OPaX6010SGPg4utFzkk27dvAQXMh+U0ZQBhalxuk4lu7syatPLkIgIzf8LRvUHLW0KsAl+/LP27dVTFodEk5Jnz/7Rgql7DyyEJ2GK5aiCJQ4Nwmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Mon, 17 Jul
 2023 01:34:50 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::75b9:9bc9:f27f:1eca]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::75b9:9bc9:f27f:1eca%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 01:34:49 +0000
Message-ID: <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com>
Date: Mon, 17 Jul 2023 09:34:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [mickledore][PATCH 0/1] Cherry pick commit from master
 to update webkitgtk to 2.40.2
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>
References: <1771AA996BA380BB.28005@lists.openembedded.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <1771AA996BA380BB.28005@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: be813326-9ba7-43af-be8c-08db86660292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ogTiDsPqJm5fDGUt/Y3WrX4xuveZ7Vk0zia3J9/uStfmjR9Un6uCXn2nM0UfDF3OJxsczCMJ9cZqa6P2gmGQxyz1Wt7cp1lvA5tSQeVp1wTOjLuwS4ATb6qy/BgwgdTnN8oLAby2ok4DEb6xCfm4DarvlTFHrmEYy+N3Pfy8cXxRdgXj76DmGTj8Djc4/OXHxyQok+m/9fH54OUpx8ADe8thCTysdUwGy34eSry964rSWqwue6swQpsVkXHtcPFq2YsuDV5C6/Ypq/1gQkBIp+tk+2nSLgPyQxEeePjv+jsvAtlg+36MsedILR7sfE24BwUL5RiGlHvb0eX+EyTkOmIdEZ/jrrnYj67tIKIUOjMSNkgZvGw/VnpxnPTpRlqKgyWm4bZ/H6QzMJLvVBueymjnMId/nRVJAm9LjpzdxyECynLRHLIffSBy5friUyBk8X/cinCbO+T4nuqVI5hVrF1HbQpAsqfi0U0VlbQwYPiK7Sk5OkwTwJ/yyeLkci6Opkg4InVWhPGZOwj5Yf14lH3FjiBuhdK6eauH2+F4HFSYIkK6zKNgVxP9ex1h4u7fBCwSDkHQOUETUQbjsuZcqNzttHJzKVNhoE/UDMArjjQT/UQdjnhSRTV6zsoAOPzRggbwVrIAeQcNG4t93nHs9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(451199021)(15650500001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(31686004)(66899021)(110136005)(478600001)(2906002)(41300700001)(316002)(6666004)(966005)(6512007)(6486002)(6506007)(26005)(186003)(36756003)(2616005)(83380400001)(53546011)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUxpdWpHMDVKNFE1MnU2ck16Y0RVNjAwTEZUTTMyckxJZ2VKQ25ISjZjdUFG?=
 =?utf-8?B?dW5BRGltQ1ZBbnZnSGYvTnhaZTN5RkdwU1RtNGtRbEkyNGVFUGRMQmZKa0dk?=
 =?utf-8?B?cmZldi82MXBHei9CY2loZnF5SzZOTHQ5dDNUeDdtSWZSdWs2MnN0VGtJSWxz?=
 =?utf-8?B?ZGp3ckNPamtzdmcrWFl4bWhRNWlvdlExUVVsYTJiclhaYzE1aWF6YkhJQ1NO?=
 =?utf-8?B?V1hacGhGTGRPVE9sVHpCUDNYMmFBMGFROHlOcEFmczEycXdqWlZVaUVCR29D?=
 =?utf-8?B?N0g3N3VFOFl0Q1F6Zm44T05BbXdNdTNFelRVSkZ2c2JUcEZqNy94TlhmdzQr?=
 =?utf-8?B?OEgxY3VPaFpKS2ZiQ2RWaWhVY2xoQmZzSDFKUitUZUN6bC9YY20rQWdtcnYv?=
 =?utf-8?B?WWdVb2JDdlA4VER4Y0ZZSkFRdjJvN2c3QWdNMjluVFpmWE5XekFyZ2Q4WTdJ?=
 =?utf-8?B?ajJsZGF1UDM2c082Z0NLQ3Y0dmhiV1AyYmc0RHF6MU51VkRXNFk3YmJIYmRl?=
 =?utf-8?B?aFpTcm1hY1diZ0RXdkJHcU1vOFNNRjRsQkxydXBBeVBEQnY3YXBVVXdQeVNV?=
 =?utf-8?B?QVMySWtGRDZlYmZ2N0pOZm5uckhwc2ZGOXYxamdUUU8rT2pJRUxrL2RDUFdY?=
 =?utf-8?B?UTk3QTN2SklZMUtHWExvaWR5N3V3My9icEZEZjdpVzNBMEorRGZ4bXV1Rm14?=
 =?utf-8?B?WmhhMkdJN1k1ZjVQUzYrZ1VvZ0xHb1lFWE9MYy9OWDQxL3lnV1Q1RGsvRmls?=
 =?utf-8?B?L2xpaFdnUjZvMFIvTDlydEM4OHRJNmw3dEE3Zjd1TkJCUEp6bk9QL3ZpbXJo?=
 =?utf-8?B?ekZtN2h1d3hqdUlleXk2TE1ESkVHM1Uvd1R2bGxNK2Fybm4yc2ZoWmhrUVFU?=
 =?utf-8?B?QUdjVFdSbzFJeGpTeWhhVVBITGs3WVQrRmZrdUlKeDVOWXNiNkNtVVZza0Mr?=
 =?utf-8?B?cVQyQWtQVVRRSktTZHNBZEQxVkFvOWJhN2tsMldqY3ZPNjU0SEN6TU91QjBk?=
 =?utf-8?B?cTRxUEdVMExPSllxNzdvS2JwR1YzMVZKZDBBOVZIdjNuQ3V3Y0U1VmpTUGdI?=
 =?utf-8?B?VE56cUcwV1E0WHpYTGl5T29MZDFRNVBIQXlxR2FSTFBOb0JGcjVtSUpPN1Er?=
 =?utf-8?B?bnFlRXRvU3Znc3BEWDkybnhzMHl0V2VDd20vc3ZBMmNyNFd3bjAwc3crNkkr?=
 =?utf-8?B?T3A4NUh0MmRpRFpYaFhvcWYyWVlodmVhUEVxRHFncllkWkx6V1ZHZzlwcXVC?=
 =?utf-8?B?dzlSVFNGaXV2QUV6UUN1UHY2c3FucFJWSWNJREpxdXh5aERZRkRBU3JzZU0x?=
 =?utf-8?B?dXYwRCt6ejJ0QW9uLytRdTB2OHFzRFFTQWNKTHJQbG5iZzk5SW5ZZG8xcWN3?=
 =?utf-8?B?M0UwWjFXMDlrY2N4bnpVQWh5QkZYTGoxSjBhK3JMcUkrdlFTT2FSS2hSQS9D?=
 =?utf-8?B?S1F4eVZsVHZFZTJBR29OSmZyY3lERzBBSG5vVEFLRTB0T0luWStPZG9jbFcy?=
 =?utf-8?B?Qm5Lczc4b1FMZXpId2hGMExnOWlTNS9NWUhTYXF3d0cvZ09PU2V5ZjFSWGw2?=
 =?utf-8?B?a1JjV0I4NFIyZ0lJWmtuRGNsQnhualpka1lNN2dXUlRnZWxnbzZDRjdFUmQ4?=
 =?utf-8?B?R2lQTUk4OVprLzFLTGhPZ3B5N0ExeDBSQmo1ZmUxNmphTkdnMjhpR28wbHd3?=
 =?utf-8?B?SzlnenJEYXBhZkFKek5PVDZiMXE2Q2xyRng4YzhzY2VHTTloTktuVU9CYlpX?=
 =?utf-8?B?ZTBZTXNLb0E0TUNFb1JVSSsrK1N3ZFNBcFhBdjdkL050a2tDQ0JCN2xUbmR3?=
 =?utf-8?B?RHBTQnFCSkczcVBMZS92UC91bWxFanQvMVpUWSttSUljWmlHeWVJZDIxWFRK?=
 =?utf-8?B?ZlF1Ty9jdXUvUzl3WTRBYWdWV3ZHSmJsKy9ZWHFNZWg2ZS9uZko1NjV3NTFU?=
 =?utf-8?B?VVFvTHlhZEdpUHVFM1lYV2VCZ2hYaGZwM1o5aWlVczBGUjhTbFQ1a1ZHQ1JN?=
 =?utf-8?B?U2xzS2lkOHB2S1VUdUtHdnlYb2trZFpsbTYyYjFldEtqTnMySUdjSExST2J2?=
 =?utf-8?B?T01JOFdVb3Z5M3hZNDRZMDFWeEEvTmptMHk1cEY3TU1PRUYxQjk5R1dhOTU2?=
 =?utf-8?Q?6OYwKYKihugbjW5utFVeXyOTl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be813326-9ba7-43af-be8c-08db86660292
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 01:34:49.4362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VO90W9SK9IPLIOAjoipb+93ZIJyYdMFDwDeX4LojfvC6bpTxLPc27wuCezHwIUUOXCMDP2U/RKOj2WTGf+h9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-Proofpoint-GUID: BpcGqVurRbYl56mbMGuhDkpGwidBODR7
X-Proofpoint-ORIG-GUID: 78ykD16Mr6zSJJapx9SIPV7h0rSbl8gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_01,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=569 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184425

On 7/14/23 15:15, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi,
>
> I've discussed with webkitgtk maintainers about api compatable issues on
>
> https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html
>
>> WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely update
> without needing to change applications. In general, we always keep the API and
> ABI backwards compatible.
>
> Note that the current stable releases (2.40.x) introduce a new API level
> when using GTK4, but I suppose this is not a problem because most likely you
> are still using GTK3
>
>
> I suggest we apply the update in mickledore too which solves lots of
> CVEs.

Hi Steve,

I have no idea why the cover-letter is not in the same thread with the 
patch.

So according to the reply from webkitgtk maintainer, would you like to 
re-consider
to cherry-pick the commit to mickledore, please?

Regards,
Kai


>
> Regards,
> Kai
>
> Alexander Kanavin (1):
>    webkitgtk: update 2.38.5 -> 2.40.2
>
>   meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
>   ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
>   ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
>   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
>   ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
>   ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} | 15 +++++--
>   6 files changed, 111 insertions(+), 48 deletions(-)
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>   rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} (90%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184253): https://lists.openembedded.org/g/openembedded-core/message/184253
> Mute This Topic: https://lists.openembedded.org/mt/100136728/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


