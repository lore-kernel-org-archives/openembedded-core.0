Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E9CC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 03:05:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9314.1677207916142492757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 19:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F3Ut/Ol2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1419ccb9dd=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O2d2la012811
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:05:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=PsP/OF2oG7AAU+rDqxBdbSrFK0pKNbLknrUWq3uSLCk=;
 b=F3Ut/Ol2+FzcR3bNEp1v7BejHYvRX1rmTF4l44P54FKaeAw3yEfmjqjAIkJwvL6YvN2E
 Bfv5u0byo+cWWaIawL5XHesqVy2z0HcHJMjM7y/mHusCGnyx0uFSvWXasaRbuhiLbQhL
 8n8vEk83qkTs3Jiqr8ICHaTZKR3RBVjkSmnA+97yW7GYCx5nzSPLLGz1jAr13d37mAsM
 3V6F4ZLQ2Ang5zuoyWDQU+lyPXG53pZZ5G3jEnSZAz+nxqxDE6ALgItFWWeF+dPajhL1
 PoB4HfFbqxgsTAVueGF9KyItmBzM6RzAs/muac2/SSawrsfoODoOvTQ9Yzoz26OcAP7U +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pw5vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:05:15 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31O35FZH001872
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:05:15 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pw5vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 19:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJeamKb/jMbgpq+fxOP+E4oaRR2rCt+ZhqgjcF94sm8ckdLLI07paV19XhbGOBMWJ3l/gsw+Aii2FmlCoZQVvpudLbvCPejW2kCbkCLKVsxok4KXWQwNxZkPZZW2jslu51DIHhfl4Ve8KG8sa5QIFfTC32Sfs1+hQpeY8gE+I42xLStW0t83yWeBixrSlOOzuuIwxmMUY0rRZ4iiKWE7GinZPasqC0KUO5AqoY4EKPCLFM279qpAiyMP7cI4FWo+8NWs8PbeSIQbLHzSFC2CtI6J0yRvAu8g8fmmu09WoysE47rC7NebS9LR/Jm0ulHLJ7DX8iScNs6LVlzSOL6KxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsP/OF2oG7AAU+rDqxBdbSrFK0pKNbLknrUWq3uSLCk=;
 b=HPKwku6/8ZTCvdEo9OPpdsnC8SyavoNkBlxFTtZyfDnFYdyjxLBdGGA7XGvQUVdlkZhQFOhkFey76x04PvL7guQwBcsgOTpCdNRXtcxiK6KGQ9aDEdn+YNvmV6iT0XJXSUk9g+rfnJ5Szh76kEOJgjq2q/ccOJVIBrtlP1rmYeBTFdHVTiP3EwPXTpO2Jv40mSU84zOJxyZ77jr0u+wNgV9TfnZxHU71Qua5W3jY4DkVMxmYm53StWvkd2wFfboMZFx0LcVgiCPG8zq+cndClXWX0Apxx6N7JgCTVEhtH8BY6zSGw3NglAiDMQGiM6bpC660UXPlGML/Ij0qoXq/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Fri, 24 Feb
 2023 03:05:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 03:05:10 +0000
Message-ID: <b0d183bd-d99c-8815-f6e2-e26ac0c292d5@windriver.com>
Date: Fri, 24 Feb 2023 11:05:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [RFC PATCH 0/2] Handling of ${PN}-dev RRECOMMENDS
 non-existent ${PN}
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, Fawzi KHABER <fawzi.khaber@smile.fr>
References: <20230223232939.3932270-1-yoann.congal@smile.fr>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20230223232939.3932270-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: b672ce1b-93fb-4845-1fb9-08db1613f0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vn/Dq4HyjHCcsDEGrGfF4pRBrWxw/JoROCIewCXawXwfVKFFbD4RZ7OrfHV0utuKqRfM32wi5qyrqrBqWsnTr00G6JWsFS9vH25Nqil+SlkM1Qfh7gfKmqMUDkDQNxf25Uu9Qq3DhY+i5MJOB/QodF3hmAmo6SmB2sLIxOPM1Glu+wHwUk/durnTHUXUi8/yMW0dTd0SGybuuvb0FFdo1Z4Tz9kE9pB8I/SrUoEnBsfzcOVJ5iqj29bvokV5vWxx/IeQdSU9aWWrMTUqL1ARdv1ntXTtJtsBECFnWzvXG/AW21TBo52CzfotM2zqGGd7WD0FPqIivTRGneprkdBVJaLAVsjoPgnQgmSiZgSEUkCy6CT8N41DqXqaKmxrqgmwTfXMcFO5awBf1QP2qTCtuomfgRBa1+gVkIDuC2rxwqgbX8Z8rIjWSNqW9AiXGVByfxfpz1P3QBBN87wDHozfpAzr4suAbXLu36GGzCV6Web1IY2MAwYgPKw4eD5QGt5e9mYxkZHGI8I9ynDysuyBpxZS5ke4Y/UH7UargpaFsP2yGTUCb8EBxLL1FP45qbBQbYgU9w5eLD5sLqMkCkutjQ/NLP6k93gxxv+708rdx1QtSZWLc7OrpgnQAIJNbcl1TQR7ykxZjLzU7gPy4Wg3id9IrfACzxqE2iYv7ywiXSaIKThhDn7UzHN9yP2aDkIU18K/cwBAT0RUfHB679qtt/BbgCw3LkhTvc26KRcbCn4+Mto8PIk6eS78kG+JwZ2X6KtknAMMrpBi6dKjXsd0LnBKdfNmXfHd933U+10BAqs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(451199018)(31696002)(86362001)(4326008)(316002)(36756003)(186003)(66476007)(8676002)(66556008)(26005)(8936002)(53546011)(2616005)(41300700001)(6512007)(5660300002)(66946007)(6506007)(478600001)(6666004)(38100700002)(2906002)(83380400001)(966005)(6486002)(66899018)(31686004)(228453006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVhNSFQraGNwVDB5YTdZSUFoQ20vQmFrRVlRbVNOT016cFFCc2NzblEvaUFF?=
 =?utf-8?B?bEM3UG4yS3F1SnpHekxZcjhKMlRlekcwaDhucnJLaFRhNUZBaEtFaFl1bGxz?=
 =?utf-8?B?dHNKT0l5MEJVS2IycSt0L05CNCtVU1RpV0orbjhJWFNXZE9PTHg1MVVzclJD?=
 =?utf-8?B?cWNZbURJalNVa1RVRG1Idk13ZUh4eG50QXMyaFhEWEY5TmxHSC9NdDl5allC?=
 =?utf-8?B?b1JrL0NmUzJ0MmxDbkFsVGg5TmxSVlRNMFpqakRuT3BvNFJ1Tk9rdXlDZndY?=
 =?utf-8?B?MkhKd3dRYkpab0p3QXQ0b3FEQ2NQVnRqQ1RyenAzd0kwaXluZFUrR3BhQlRy?=
 =?utf-8?B?bkhRNllDWTh3dWR5elJxODFaYm5EZTNjbHlWNGtZK2NqTVRjdHE3WEdTV0l4?=
 =?utf-8?B?bW5OVU04L2Y0YWVlQlJNZWJKcnZUMWJaLzBQNVZjOTRFeVE1aU8wRVdvTFRo?=
 =?utf-8?B?TXhzMmRwcmlUbXd0Tkh6dFdnNFlXR3IwNTJMSW5tdDhjLy94SGRsMm1vTlVT?=
 =?utf-8?B?OVRrN3o4T0JzbVlIQUNDKzNaYjVzUWk0anBHTHVNNWlIamZuclUyZndRbVBa?=
 =?utf-8?B?OHlxR1NVWUxGWmh5bFFSeHN4UGFUajg4dzlGR1IvMXVneWRjcnlUQ0JCN0ps?=
 =?utf-8?B?SVE1bUFlUk9idVM5cEhnNUI1QTE4RnN2RW1CZnQ4RVlOZEVhSWZ2eTY5WlB1?=
 =?utf-8?B?cWl0cDlzQWlFSHpkcm8wZ2cxMzRudE9QaXJtd2NYQnNDRGhsVmNNb2JZOE9Y?=
 =?utf-8?B?S3lGRi8wZFFtY3ljZnBkNEVnMWNkRzVUNCsyNnF1YmJZb1dsbGFiMExzbGEw?=
 =?utf-8?B?UkpXN2g1dTMzN1h2UXIyYkJGdTc1VVVUemVNRUwvdk54UDU1QXQrbUtGcU94?=
 =?utf-8?B?UXA4Q1BhOEs1RTZRZW0wRURKcTVNSUFuNUJyRnh2QVNlRERTMklSZU5Nb3lx?=
 =?utf-8?B?dlgrZE1OTURNM29sMG02b0ZGcEdqTVNvZk4zUWZ0bUJWeXJZUUlmYXBnQzJr?=
 =?utf-8?B?a3VpWENtZHFTSVlIQ3FGNnp2KytjeWdhRE91YlJKMVMwbUsyVW4yOUx3b1Jy?=
 =?utf-8?B?UTkyYUV0dTltNzFKZFI4N0EwdUg2a3hoUW5lSHBEYjBXS0JzaUlLeXlUNi9y?=
 =?utf-8?B?aGRkUlRXWStRTFpnNjgyR0RIOS9GaGlmZUxvQVU3S0czK0cwRGp2b2gxekdP?=
 =?utf-8?B?enZndWxmNklyY2pwdE90SzZlOFN0TCticzQ0ZWFIYkFtV255eDNVTFFpam56?=
 =?utf-8?B?ajZGaEpoVTRWV0NaSnRtTTZTUEVlNThMVWw0N2ZiNnhNLzNxK3lEajRxRkJO?=
 =?utf-8?B?Rk5PMFhBM050b0hJd0xqbVRWZjI0S2VueFY2T2dBc2R2TUhXcjBSbDZqV1VZ?=
 =?utf-8?B?eHMyc25PR29IWUtzQmlDeWxnYTl3UWk0Zzc1UmJCcHdxM3hId3VwYktFYlFT?=
 =?utf-8?B?Mk5TWkRjS0JFZm5DVUt1VkpGcCt4clNybG01bHhJdkVXa2ovODh5Z3dDbFRr?=
 =?utf-8?B?Tzh6MXVIUDI4NHdXWjF0c3J3cVEyZVRQQzNySDZmVk5TVXNLQ1JkK0pZWlVO?=
 =?utf-8?B?U2UyRDdXK2wySjF6NitZek1TbStBQVdOSXRKS25NTUNSMTA0Wmp5bVZqNmZL?=
 =?utf-8?B?SGZxcG9ibzlkalc5RVZlVWNlQ0FjL3Ztam5ZQ3BOQnZ6SDZFSkwwSEtMR0t5?=
 =?utf-8?B?eTgyU0VNRTlEcEF3WVFMNU44TysvMUpibkZSQ2dRWmszbDQ2VTlXTWhyc09r?=
 =?utf-8?B?MDZmcFZzanp0bFB4aEFQQzc4V2YxSkhpV1B0cTB5emJySi9DbnEwU3Z4dXFW?=
 =?utf-8?B?K1pKTE1WdkRCUG9mYkRVSERySmRONE56ZHRsbXo0cHF3YnV6WkhYdUZKSWRI?=
 =?utf-8?B?bnVuUTdkNVB2USs5amNucVI2eCt2bmtkYzFJSzlNczlORG4vT2syeVNvSkQ3?=
 =?utf-8?B?OXdzQXlMQUdoT3o2Q2orWXBpUDd5MFkyWm9FdnBnUXBlc2dDRTVVYUk2Nlpv?=
 =?utf-8?B?andNZUZ1RmxsSEpGTGxERHlvOUIwenVuSlF3MnRod0N6WE5tbWZvb243TENi?=
 =?utf-8?B?OFlYZlgrdVJ4dXBpV1l4ZEtnVU5YQnd4dUNmWXBmRnNGWU45NXBrNDBwY3Jt?=
 =?utf-8?Q?/qilPwCn6t7auADQTux9/CCeP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b672ce1b-93fb-4845-1fb9-08db1613f0cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 03:05:10.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjkhF1KLTsNYjc1ozjTVTElfjBrxArn/8pG9cgEAdCHt22fYRRVPfq7wBKhbI90tuh7Z93L/3WeNqk3ESD33ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
X-Proofpoint-ORIG-GUID: 60Q9LK6p3WRhSg0E7rPQnP1WTKla47dj
X-Proofpoint-GUID: XhGyIRRG6caS0c5iG_NqmC51C7FunCww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_15,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=702 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177654

I have some concerns about this series of patches.
1. The QA check is not checking for RRECOMMENDS on non-existentent 
packages, it's only checking for non-existent in-recipe packages. That 
is, it's not checking packages from other recipes.
2. If patch 2 is sent, then the patch for 'a general way to fix the 
case' should also be sent, otherwise, we'll be in a situation that a 
bunch of warnings are there but there's no suggested fix and current 
workarounds have been explicitly removed.
3. There are some typos. s/existant/existent.

Looking at the original two issues, Yocto#6839 & Yocto#8222, I agree 
that the appropriate approach is to first create a QA check. However, I 
think this QA check should either:
1. only check for non-existent main package for the dev package (as the 
default value of -dev package is the main package)
or
2. thoroughly check for non-existent packages across recipes (maybe by 
using pkgdata)

Regards,
Qi



On 2/24/23 07:29, Yoann Congal via lists.openembedded.org wrote:
> This series is a work in progress on 2 related bugs :
> * [YOCTO #6839] Handle dev package with no main package more gracefully
> * [YOCTO #8222] Elide dependency from -dev package on main package if
>    there are no shared libraries in it
>
> An empty package ${PN} is not generated by default. This has been a
> problem most frequently seen because ${PN}-dev depends on it. This case
> has been handled by :
> * Using ALLOW_EMPTY:${PN} = "1" : forcing ${PN} to be created even
>    empty.
> * DEV_PKG_DEPENDENCY = "" : Implicitly removing the dependency on ${PN}
> * And finally and globally making the ${PN}-dev -> ${PN} relation a
>    RRECOMMENDS.
>
> 2 patches :
> * insane: Add QA check for RRECOMMENDS on non-existent packages
> * meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workaround
>
> First one create a QA check to try to detect the problematic situation.
> The second removes workarounds setup to hide to problematic case.
>
> Together they will prominently show where the problematic cases are.
> Next step will be to find a generic way to fix the case.
>
> Fawzi KHABER (2):
>    insane: Add QA check for RRECOMMENDS on non-existent packages
>    meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workarounds
>
>   meta/classes-global/insane.bbclass                    | 11 +++++++++++
>   meta/recipes-connectivity/bind/bind_9.18.11.bb        |  1 -
>   meta/recipes-core/musl/bsd-headers.bb                 |  1 -
>   meta/recipes-core/musl/libssp-nonshared.bb            |  1 -
>   meta/recipes-core/newlib/newlib_git.bb                |  3 ---
>   meta/recipes-devtools/gcc/libgcc-common.inc           |  4 ----
>   meta/recipes-devtools/python/python3_3.11.2.bb        |  1 -
>   meta/recipes-graphics/mesa/libglu_9.0.2.bb            |  3 ---
>   meta/recipes-graphics/mesa/mesa.inc                   |  3 ---
>   .../recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb |  1 -
>   meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb        |  1 -
>   meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb  |  1 -
>   meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb  |  3 +--
>   meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb |  3 +--
>   .../linux-libc-headers/linux-libc-headers.inc         |  1 -
>   .../make-mod-scripts/make-mod-scripts_1.0.bb          |  1 -
>   .../argp-standalone/argp-standalone_1.4.1.bb          |  1 -
>   17 files changed, 13 insertions(+), 27 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177640): https://lists.openembedded.org/g/openembedded-core/message/177640
> Mute This Topic: https://lists.openembedded.org/mt/97195657/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


