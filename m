Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E726C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:57:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6798.1683835061636555595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 12:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ho3WU44w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4495d4136c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BJBNkT002340
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Bn32bsluLkLRcsfezTi/n/2RRQ7G1jaaGPcR11vbrtA=;
 b=ho3WU44w8UiP2D5BUPLrOOogqYZysngNbp5g0uHfBjHnKOQM0NQIVnyxWETL2IdUboMH
 tWvHnp3dL+9wIgkmPTIfPcIWlCzL8nyq186bgbCOU+Q9ggxQIJqHBdzj5c1BYE8rUsyq
 nB51q/BtYOxBAShVTJBhn4BjLQqTNcwulZca1H1h1OBDUczJtEibnXKQQOA0hBpByddh
 JG5C4wctoqprOb4kFHcH6ATLa4CfgHZCYsXLytFx464PWBb8H1+Ov4jBNEE/H+YL4zNT
 knxyid0wTnpJBtOCtOFImd0OUXjdk3tavEkQGluOpxnxSan+H76FiLzW02TC3NqXL2Ey LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf82x3327-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:57:40 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BJveF9026876
	for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:57:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf82x3325-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 19:57:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYBOiZbihIgb+GRWzOPfcPgZnYDpKWsP+H2gMXd08HT6d2Fr/dIM3gZi+pWowXgjDpsxiE4yTxfW2C/I9HA1b+MU5KTllKFPKTbvDsVqfu/p1mRdUyHO6OIqvnxXVlRPeEb78P5y/1sTJgtKpuqKgwPYf2uzGHIRCmQkIRXD+XiNhL+e2dPBFk3rFjeybAvO+Dx2zQ3ypl0DOK7eJ4te3L1mQtO1WOBNcgpfiWzywUNlnCwF0/Nkla/2pgfNPVTqmUiOL1GBP3KJrNpHkJfNWz/LaIZp9LmW6de89EbGRhMQqP+bqPTOigqC3q2MP6RJi2Wa9C2/k3wETLUfQUcYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn32bsluLkLRcsfezTi/n/2RRQ7G1jaaGPcR11vbrtA=;
 b=DiDXs7StoXIw0a9P7RjCIMF5Bc6zeO0zmntLU1D2B3dcTpTVbQ/mRsz7UhV7faRjMsf3V+VtlPo6xNIzWLxm+4pSMcrGeX85dZfbTditMTyOmghfPC31AjJnyNA2WHVvRb1hiEcdWrm5V//IrXkBRhyhR63TYJKeoHqXCGt5ih0H3zmoUfEQvVqEC3/rjHJmZ0v6HnDFwHm7IgVhZgiWNmmU268hI/xMR5HwD8E22SKEAL/CqI4ZkGgSz5d3t1Qb6KmmeeELa6ZTXp+gWZpRPFbdiAUTcwOQUNSE5EiVL7B9U19GL+kFXng/UOeklbJDkfJfOoosFjdIgD9DXnuELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 19:57:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb%5]) with mapi id 15.20.6363.032; Thu, 11 May 2023
 19:57:36 +0000
Content-Type: multipart/alternative;
 boundary="------------Uc0qvgGS8600sDrhZVs0ZFCe"
Message-ID: <0b43f2f0-9c17-0922-face-4821511cf36f@windriver.com>
Date: Thu, 11 May 2023 15:57:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.1429 -> 9.0.1527
Content-Language: en-CA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230511145915.2513006-1-Randy.MacLeod@windriver.com>
 <2023051118545060b3a027@mail.local>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2023051118545060b3a027@mail.local>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f6fa52-4e37-4b29-1aa9-08db5259f769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DTxVJXctGGoTKqKrMcGjVqPNQEXThm2MxvH4jCozcAvl5UBtFETYVAVY7uV95LnPQOBUA7v4PioiXpaAi2f88tq8OlCi4y5uYPSjxd0qKHNWPx+7QqRvMZpv0oH4m9qn9RUW0IWfyBqqAmpYqiwuyb5/cZSZBrHkIUaSmxClF1YyOGmtS7M1mc3C9D1bCeWlEvcUiSBqoSPLQ5FTEypBK5BfiChP42uZ+cz0QI2KVLaj8A0qnvH+W1vt0J1dw+zWi0S/yAlQlBOSoesnv9wB/7O2wfhNISv86fNKk4nNvQm/oHgO3dyz7uvJSfZ1fqzB744b1O+2qqxJb7Irm8SOuDx/1WM4jtN7Cducv8aaZmtaxnB9SXqKUlN2GhJALYxtS06Lt5WFXJpjoq3TFhOn+mJcLcTWLmIJZto8YoTBoFNYIY14juWf0jEL6s6KxXevzPfGYS/2H1dmnDHRU0di2EIkL0MOEPFmBN2KJr1LGCZgX4knokYMAv0Bx7JGqGxWVx0LgSZ1tKj1JUMT5Cs07T2Hq4vTijFaWOcazPJgVUhdu5DkRGoI3bzdu6KyBF5gDE67cm+CDjzymxkLERqy7S6OTJ3I5KeYTsehUmTJW+T44SxaiwDZ6XjEcNJosKbmJmrvRUFBRoisFC49KP9WZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(136003)(346002)(396003)(451199021)(6486002)(33964004)(41300700001)(6666004)(38100700002)(36756003)(53546011)(6512007)(26005)(6506007)(2906002)(5660300002)(31696002)(2616005)(83380400001)(86362001)(186003)(166002)(8676002)(966005)(66476007)(66946007)(66556008)(4326008)(6916009)(31686004)(478600001)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEtrSDU2elNSalhGRlppeTcvRVVJaG9tRFg1ejdEQWVUWUdCcUMwYnVYeE1v?=
 =?utf-8?B?YUhITzdLVmtweldoang4dmJtZk9GMnZjdThSY0k1cURUdFE0Y3NRR3ZvM0Vz?=
 =?utf-8?B?RFJ5My9NTjI3Nmlyd3JTK2oyR3BPcHl2V1JwOU9zVXIrRkZralVqa1F1U0s2?=
 =?utf-8?B?d2NXeHh5WmVKYUFhRFlMM3JsMDZlRkRrREVVU1B2eXRQc243a0J1S1NFWHNu?=
 =?utf-8?B?RHppR3g5aGZTQXdhYnRjSFBveWNzaDlZaGYzUHBpb1hLa1VRWG9rcGpINkkx?=
 =?utf-8?B?SjVjanY5ODdRbWZON0w5RE81M2RXRjdBekR5a3JkRjlGRzA3d3NVY0lHN0dP?=
 =?utf-8?B?VzhDRUhmWDV0UlRrQTFpME5lV21GZ0hxd0o3VENQeFduemVvcy8vUjZiclU2?=
 =?utf-8?B?blB2QmRFT3Z5eXJpSGtMb084UUtOR2x2UjhJSHFrQm85eG42eEs4WGRlK2Vi?=
 =?utf-8?B?U3NkVEhrZWFtQVFRWlFiQlpyL21jVEIwY3RXM0duYVdJMXFaUzNSU3Y5R2Yr?=
 =?utf-8?B?RHN1NG1SMklCZ05PUUxKZWcrYmgzMnRocTVaZ0ExNkNPL2lsZXF6ZnFiWG9m?=
 =?utf-8?B?S0RyL1hQT3h6Q2txVVRpTWRwQjhxdmpFNER1dmhQLzN6ZjJJWXExbDdPek0z?=
 =?utf-8?B?VUNmR3JXUkovNHQ1U2I5eW1vb0JmOCtIZTEwcjl0QnBLZi9yMncrUjJZbHVo?=
 =?utf-8?B?RmxJK1N4WG0rTWdLcFRWR3VRUTVwYXdiSkxmVUt6UTVQa1FOd2dnZE9mKzF6?=
 =?utf-8?B?b2c4Q3hHTVdvY2s4d05xOWdEMWs0b1ZUNnM5V1Y2Z0VyemJXMFgrdEtrSFB6?=
 =?utf-8?B?akdoWmJpK2hUblZOejFLUzhBOUtoMUZGQkpUcnUwdUFMY3pIcmoyOEJabHdq?=
 =?utf-8?B?Y0JVc2lYaFltZ0lJZkpsSXZza0hpZGxsSjg4Mng4RGRVdkZMU0NBVEl4UjY0?=
 =?utf-8?B?bHNUTHFaaTJoV2VvZDlyd2VoQ0xRUExkdWx6dVN0MEtjSHZsY1FGUkdCekJW?=
 =?utf-8?B?ZnJoSGZUWURHNWFFZGtJSzFrMEZMazlpdStpQ3Vsc1dnOU1UeExyendyWlh5?=
 =?utf-8?B?Q1p3RS9CSFhGeWNPTUo1RGZSTkM1VktNNnJ1VlBVV0xzaFl4dHl3OGFzTVkv?=
 =?utf-8?B?TExObTA2UXh3VVBvMW1CSjNyd2Nhd1BSU01ac3pFQ29nNmg4MStYQjhMZUdS?=
 =?utf-8?B?dURvd2xzOVQwUTJJS3VCNlZHMThZemJaYlppWC8yY3JaRGlBaTAyb2YxZUhV?=
 =?utf-8?B?VC9xTHF6Q3pJbnBYQXNrZmZodk9ZaTJSeW0rajZLWko4VUQvMDczVVNvb0Jq?=
 =?utf-8?B?N0hsUXBTMDY5cGVVL0FIaC9hNUFUcnMrSmhCdEhCL1VtNDdzQmZrYS9YcG9h?=
 =?utf-8?B?SFo4T1Zmb1MyeTk4T2pUc2RnK1VabjNudGRZazREdWI0QTdUUmg3anVoL2h5?=
 =?utf-8?B?NE4xc1ZiR2xXS0ttLzlPTFhoUWhBZ2dqWlpmQnBreXFWR3hNNG9oZnNoRC9Z?=
 =?utf-8?B?N3VHTGNKMU16MDk2RkkyS2ZoL1dsNjl2YmE4ZE5nTDEvWTNIdVFVQzVvTE1a?=
 =?utf-8?B?VUNDZUJWQSt5Wk9nb3JoN01mcUU3RlE5VmVoTXlsTjhKRW43S2pYWjdsOWFS?=
 =?utf-8?B?ZEJFSFQ2bE9WSzFDZ2ZBNHRsNGtOZVVMdytLRjZGUXBkRUM0b1UwbzY4dEQ2?=
 =?utf-8?B?Slk3YzJXZG5WOEhxeVFRbmtxamxaS3ZhNG13TCtJZlNYZGF0YmI3OGVDZjBO?=
 =?utf-8?B?VlRiSzhuNzVORHhReWcvYW5FVUd0SjdKdnBVTDQyeTUxa1h6d0dTdHNlSHF2?=
 =?utf-8?B?VGpNS3R3T2JBZzNKZW5kemcwc0pmM0czTm02SlI0dXduL0o0Z0ZWZzY4R0RK?=
 =?utf-8?B?aDRyc2JoOCtzeTVmOU9zTjJzdm8zS1JjcERGRHIyVDR6ZVdFd2dMYWtDOXR0?=
 =?utf-8?B?RnN6cG9lWGtaN0lCV095eUFtN1pFalM0bGRGNXNZME5CTmZCbDg5OXFBUXFG?=
 =?utf-8?B?UXoyQ3g5U25heFVpZnRxdjlkNGJYR3dDUlRRU0IyN1d2K01RSDlVVC92bklq?=
 =?utf-8?B?UnN3T2Z1Z2ptdWlYWUtJZ0Y2dVkxWVE1NEFRdnBjN1U5YkcwOFc5clhDWE4y?=
 =?utf-8?B?bVc4NXNSenhCVDM4ZlNpY1U3NFNGNHkyUUZYYVpTeWFSTk9aQng2Yzd6dFZy?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f6fa52-4e37-4b29-1aa9-08db5259f769
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:57:36.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRcKIGXOGZxadyTgrWB0nJNHCLc9JYic68wtmgZCIpGAB0XLIu+z1UYn5SSkilqfssp8WDpVwauRZUJgIZD5WEuGKrOARfb9y57Db8HnF3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
X-Proofpoint-ORIG-GUID: GlbUBeKFpB9jV5P64NZvJ-K6BcJ_6Ojy
X-Proofpoint-GUID: 9cMTWv0hujiwadHOjXnpgIKkMFquHloC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=794 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 19:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181143

--------------Uc0qvgGS8600sDrhZVs0ZFCe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-11 14:54, Alexandre Belloni wrote:
> Hello Randy,
>
> This patch is missing your From: ;)
> See "Fixing your From identity" here:
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Fixed, sent v2,

https://lists.openembedded.org/g/openembedded-core/message/181142


The from on the first line looks ugly but I guess we'll have to get used 
to it.

../Randy

--------------Uc0qvgGS8600sDrhZVs0ZFCe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-11 14:54, Alexandre Belloni
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2023051118545060b3a027@mail.local">
      <pre class="moz-quote-pre" wrap="">Hello Randy,

This patch is missing your From: ;)
See &quot;Fixing your From identity&quot; here:
<a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></pre>
    </blockquote>
    <p>Fixed, sent v2,<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/181142">https://lists.openembedded.org/g/openembedded-core/message/181142</a></p>
    <p><br>
    </p>
    <p>The from on the first line looks ugly but I guess we'll have to
      get used to it.</p>
    <p>../Randy</p>
  </body>
</html>

--------------Uc0qvgGS8600sDrhZVs0ZFCe--

