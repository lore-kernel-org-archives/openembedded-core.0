Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FFAC83F09
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 23:17:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3426.1693005472296221895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 16:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dPXukLhZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76013469f9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37PNEig4007661
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 23:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=GWqLYaZILIQ2GXAG+yx
	gK/edhyJ+JC3kgNkNapSK3+k=; b=dPXukLhZgPQZjmFv4uqv4mBnGs/FFjIEesZ
	d/xdsUIxxWUle/elhv6hLWjC1l3phe7hiXzY+0fxA+yiV00v+jK57NSt7LUX7uTM
	Bsp3vw5jkqt8Rf40RD8Mr0hjOghABLADpWZOh9lPW5ULaJVQdcjCHpxxlI7rZrAU
	5OxRdE7hrVc4H9S5DB9ujbJRmcLbcn3CVEl+x9spx+7BSXvjHS7m4OrwEYxiQbFe
	GbwBHKiNiYGVNn9xk1qLBIzXL/YKXCeTmyY+LJi/dJobpaWkZMA2r28LiSL93/dK
	etxdzi+6BcTpRDlPVCTv3RvWQMatfD5x6u1Ww1e8kLo74Zy8f7A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mknja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 23:17:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37PNHoxp012017;
	Fri, 25 Aug 2023 23:17:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mknj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 23:17:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSPcWG1QYlzmHV4uLjfz54U0YQvWU398tBprcxoUdJRF/sVWXr3LwT8/LsUteaNW6ho3WOmmWMAeo7aZU2xydvCPw3qy1HfudVKgNLo5Pn5/Ne08z4alkPIOrWKwYn31LJTLoEIzHDnRjNhA41USyLHn9v+Sg+lGsbjfvmipCme4GVUHo++YH3yVOxpifayAeW+gAmS7G1AlUe+Tl4Y3EcqlIakEMURs7RrBX3AAuk/MN8aW9tuWSovUl3lWvXoUYFZNI8lSgRlNrWkVHL9GmHDziFwGHAayglkKkx9LHHQqs7VTOzfJcz+nlILwXnITtxcw3R3Y21arTZVxwW4Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWqLYaZILIQ2GXAG+yxgK/edhyJ+JC3kgNkNapSK3+k=;
 b=oGcOswbpocdZHBIboFNiJ6n6drbD0PLt6oeQ42slnW3bn627QfT7vHJo/soCuN9y+b52x6RchTOPDggCPYjHQ43+4g7GdFVUtCP8f/gIOScPvrnK1OztxHveHJOQtERla3XWl7sfpeX1KrKWtZm9Oc1Y/E4PhzNUCxucEdhIYYlnw5qT9VuGHihDf29dZidHy3j1xajxMpicsZ19a9e3TayK3oQomGeaKxEXhadv/azelS5TkTEEE3YrVN3vS0xJz+/Gpp0StYZub8g0Dy90MEKaxtuDqrIhvONF2Gg9elGO2O6YhohPNCFVrtpqwh6lOq4H1RK8Z0StDv9GM+ZRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 23:17:48 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 23:17:47 +0000
Content-Type: multipart/alternative;
 boundary="------------ZeONiJreRLP5MpEUDC8YiVy0"
Message-ID: <5de3537a-90a6-b813-57b2-b745b6349baf@windriver.com>
Date: Fri, 25 Aug 2023 19:17:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
Content-Language: en-CA
To: "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kallapa, Umesh" <Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
References: <20230824143018.3098875-1-Yash.Shinde@windriver.com>
 <20230825152007.50079565@booty>
 <SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 334f39e8-620b-486c-8550-08dba5c17e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+NLZfj51ZwvwXXodUSuiVgGzoAfObHkD152TYcoflPcf7gJyCupNuKB+SWXWg0mtZKG0b57rqnWXJxMT3trG9Oh7Pw8fiZUl7vVRET5MJHjoxJIUxr26iuIe9ATzVnSIuvmtNC+1JzhjdOLmGdGfwtVAzITnvmHwovIemAPImEXzcSXQwrz9sbavaBsbWj7ZfnU9Sym1Rky8mUf5H+caNBMoXc/4djseaLz4vpq40sKdpxGWgm24s5iveUkeTCuLerdKLkwYEzT8qRZvsf2wg7bbX7ltGI2nLsND4tLadVpUXwKPmYZzFmNHSfFEYuX096dqWRD/zIMbzKixNpb7nKaM25NqL77xeJb8rsQCk5j3jzxGcjdCMoFlNWV2hFkoTtAtPBHAA33D3FfaQ5eLRpipC9w6SkhhwCxZL6h4RX+QTX0BXVUBgfCUPKbAv5rjhWwIV2PsAYVI2PFQVk/RU4x/dK9Y7heV2T6C/DGu3URwVTO88bD+0GdhZAFM2Xl0VBPlIYiktfWSicn8TeQRuE/lDGKUlufOTn8y27Bn0PxWysdWQlAeqqbp/nmc53vya+etEPwIupubpXneEaF9v6CwJD87LGQY5gxxRY4rDw8qFuLyuQXZZaMUaLj9r5pCSk6xodeMbVW42bJWOgiRWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39850400004)(376002)(1800799009)(451199024)(186009)(5660300002)(31686004)(8936002)(4326008)(8676002)(66556008)(2616005)(107886003)(316002)(26005)(41300700001)(66476007)(2906002)(110136005)(66946007)(54906003)(966005)(478600001)(6666004)(6486002)(33964004)(6506007)(53546011)(6512007)(36756003)(83380400001)(166002)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXVsbjMxVFU5Uy83UUh2TGllajhvRE9OM3E2Q2d3OHcwa3JQRzNrOFh0SjYv?=
 =?utf-8?B?a2dyc245d05DZ2NCZTZOQTcyS0ZEc2JOMzc3YWoyd0tuaDYrYWdJRlZRaTlI?=
 =?utf-8?B?K3VWeWxuck95VVJPRUcyNHFEVzg1RnpHOEhMVGxFTk1kR0p2cTllbFk2SmlJ?=
 =?utf-8?B?YzdIelFDbGdJbGhzS2NUaWlhUHpvK0RhZll2OVd5cUlZNWR6NGFMTXI4clZ6?=
 =?utf-8?B?cGh4ZkN1WkpXc0k3YVA1Q1NxNzhlN3liZnovblNGMUdiK0drZjNSaCtkbCtM?=
 =?utf-8?B?a01NVkVqQ0ZXNytSWGZFaFhtdEduUVJ2enpQWThLQTROQVBhcVhJWUFaai9Z?=
 =?utf-8?B?SXZzWGZ2NU1rZ0kwMDN1WE80Q1J1MlI0U0ZMVDRFL1JkRXBZZFp6N1dLU01y?=
 =?utf-8?B?VzVvb3I0MTBJZ21GL3M0b2ZKSUpwUElwQWo2Nm5RdjJOc0wxdzhnUnNlUzhi?=
 =?utf-8?B?dUZCbVF1OEZhckNXNnlacWRxWXN4TytYRlVtdFRKWFZGNDFaMXBHNnlsWUd4?=
 =?utf-8?B?Nm5DVU1aSThhMmZvZE5oRTA4RFFQcHVJTWtXdUtNVmRYbDM3UXNVNU8vZVV6?=
 =?utf-8?B?bmhXUGZHbWxMSTh1Q2FHWGpZcndpdGQ3V2Z5U2JmMG1lTmI0WFdFQmVyMDAr?=
 =?utf-8?B?UytwMHRPUzhlc2svNVQ4MWFobXhmcWo0ODlHb0pVdC9XckJvUVB3d0VtQWI0?=
 =?utf-8?B?RzdyMDEyS0Z4eFJJY2FWMWZXTHAzTnA2dU1GUjU3UlV6NS9xZnR6eDVPa2hJ?=
 =?utf-8?B?MWs5UklLZk5yUnUvNnRDdldCWnBZczZpdzczVVIweFVUK2Q2WUorS2NYWjJv?=
 =?utf-8?B?eEF4M2VnUFFCVkswdDBOdmtRK0UvcEU4SmY1TExRRXlKeGJUdFNaVG5vTTh2?=
 =?utf-8?B?SXVEVzlDMFpKL3owTVJUR0lDRjNld2kzVFBvOU1SL2tDOEwrdnZjMDAvaU9t?=
 =?utf-8?B?VFhUeTdMK1hJOStYMTMvaFV4NlRXaDFIK3NaR3JrSkZTV2tFYUlITHZxb2ZB?=
 =?utf-8?B?c3NCMEdhb1J6ZmxZU3ltYWpsNHBNaEJGd3RyVWdOMTJMUzdUTG8xTEZCaEhR?=
 =?utf-8?B?b3VjUUtERlczRkFURE8rdFovS2ZKa1VyMFFHMUo2VEU5aTdUdU1IL1FXMVFo?=
 =?utf-8?B?RTkweFFmUWpMT0ZObUhoWVdvZ2wxYXZQOWJNdFpNOFN1ZGgwd3E0YlpMT3pY?=
 =?utf-8?B?b2lBTDdWQkIrTEdVU09wOG1Kc1BqT0N5dUxNclErUUdSdG5mL1Nua2xGWnZF?=
 =?utf-8?B?MlRrMlk0Z3NYT1RKblhLZjhHQ25XQlo4M2xqYVdTdjJyWk1TRlI0aDJ2SVgy?=
 =?utf-8?B?ZElrOU9FdEo0cWFLTkF5LzlNRFdmZkkvcHFuMWZMbldjejZrV1ZTL1A1eURX?=
 =?utf-8?B?VW9XdXh5L0xYeVgwRFV3cVpGTjdnQ1J1WjNveHlOdVZoelJxVWdFLzlPQXBC?=
 =?utf-8?B?UDlTWk9FWlBLeDJ2MzBkemJaWngvYWJUbE0weUJZS1lhdU9GWVdwUUpubW1C?=
 =?utf-8?B?dnBKeXluY2N6UklSVktuWkdob1FaSVJXZjY5VHBsYWVGeHR4a0xMNmdBRFlO?=
 =?utf-8?B?dlRpY0g2dkllTUVBTW1pNUtLVzc1clRnRVczYUhjcWhLQXE5dGFjZGxqb0U1?=
 =?utf-8?B?dU9NZi9YUHV3NEYxRXgrK3l2SlZXekdzMXdPYXdPS3h4a1QvajBFWGt0ZlVU?=
 =?utf-8?B?L1lkR0dWUmdRckpLV1lITEt4bUF3Z0traStDLzdZOGsxQ0xKbXRwem0wN3dH?=
 =?utf-8?B?WXNUWHBnWlNKM2tYSGFuTDBYRGxQdGFwMTZwM0I2eG9vTXRaMWQ2N2RsaHg4?=
 =?utf-8?B?NUdLekZzdWt6WGR3ZGc4eWZLZzAxK2lWRmN4ZnY4V3pRbXFheFdhWVFLRGY4?=
 =?utf-8?B?RGpKb1NPUldqY0JUSnY0WEpGZmNLVmRkZVNRelQ3SVlBR2ZyYlpxMXF2RlFh?=
 =?utf-8?B?dGY4L3d1OFRQa3JsWTEzM0ZvR2MzS29XeGNIMCt0a2d0NUZhaGVJSXh6TUh6?=
 =?utf-8?B?aTN5SWorUGo3TmlhZ3U1ZXNvR0Nla1pWa2d3L1l1V0U5dlJUYVNOQTZnckNr?=
 =?utf-8?B?WlhaK3Y1TE9zdHU3dU9aa0FaajA0OUJzMHNCWExla0xQMDBKd2pkZ0tvZFVi?=
 =?utf-8?B?K2tLMFhlNTR6amNuc0E0WXZxNnFFc2F1WGdSS1FPSVZrVVJMS0o2WFkwbWh4?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334f39e8-620b-486c-8550-08dba5c17e6f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 23:17:47.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orxr8GD7Wscfyu8Rr4ro1fYhLpWkESooQ0k8ZCCWemyHhdq42yVBLaOuVxrTyavPIQzE20Wevv2K81/DHHCtUYQ5L/VBi6OkF+CerycaR5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
X-Proofpoint-ORIG-GUID: 8Cqi9gv4wMAy4vAuIkcNJq82EFQaQoMh
X-Proofpoint-GUID: BF7r1_ZQ0f1PFLI39cRkmO0q3DDv1CTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_19,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 23:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186741

--------------ZeONiJreRLP5MpEUDC8YiVy0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-25 11:30, Shinde, Yash wrote:
>
> Hi Luca,
>
> The current version of Rust Oe-selftest is based on Rust 1.70 and 
> works well there. It is yet to be updated for Rust 1.71 (eventually 
> 1.72 which is latest). With every new Rust version there are newly 
> test cases added from which some might fail leading to failure of Rust 
> Oe-selftest.
>
> The patch sent here is only for Rust version update and not for Rust 
> Oe-selftest. The Rust Oe-selftest would be updated to recent versions 
> after the Rust update is done.
>
We need to do both steps in on patch series.


>
> The Rust Oe-selftest fails since it is still on Rust 1.70 and the Rust 
> version is updated to 1.71 here. Parallelly will start to rebase Rust 
> Oe-selftest on the latest versions.
>
Thanks.

Send the 1.70 -> 1.71 update along with the Rust Oe-selftest using 1.71 
as one series of commits.

../Randy

> Regards,
> Yash
>
> *From: *Luca Ceresoli <mailto:luca.ceresoli@bootlin.com>
> *Sent: *25 August 2023 18:50
> *To: *Shinde, Yash via lists.openembedded.org 
> <mailto:Yash.Shinde=windriver.com@lists.openembedded.org>
> *Cc: *Shinde, Yash <mailto:Yash.Shinde@windriver.com>; 
> openembedded-core@lists.openembedded.org; MacLeod, Randy 
> <mailto:Randy.MacLeod@windriver.com>; Kallapa, Umesh 
> <mailto:Umesh.Kallapa@windriver.com>; Gowda, Naveen 
> <mailto:Naveen.Gowda@windriver.com>; Kokkonda, Sundeep 
> <mailto:Sundeep.Kokkonda@windriver.com>; Moodalappa, Shivaprasad 
> <mailto:Shivaprasad.Moodalappa@windriver.com>
> *Subject: *Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hello Yash,
>
> On Thu, 24 Aug 2023 07:30:18 -0700
> "Shinde, Yash via lists.openembedded.org"
> <Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
>
> > Switch libstd-rs to use the dummy `sysroot` crate which represents the
> > standard library crates. Target getrandom-open64.patch at 0.2.8 (merged
> > for 0.2.9).
> >
> > Drop bootstrap_fail.patch as it is merged in upstream rust.
> >
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>
> The rust.RustSelfTestSystemEmulated.test_rust test is failing on the
> ABs with this patch applied:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/steps/12/logs/stdio
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

-- 
# Randy MacLeod
# Wind River Linux

--------------ZeONiJreRLP5MpEUDC8YiVy0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-08-25 11:30, Shinde, Yash
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}.MsoChpDefault
	{mso-style-type:export-only;}div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US">Hi Luca,<br>
            <br>
            The current version of Rust Oe-selftest is based on Rust
            1.70 and works well there. It is yet to be updated for Rust
            1.71 (eventually 1.72 which is latest). With every new Rust
            version there are newly test cases added from which some
            might fail leading to failure of Rust Oe-selftest.<br>
            <br>
            The patch sent here is only for Rust version update and not
            for Rust Oe-selftest. The Rust Oe-selftest would be updated
            to recent versions after the Rust update is done.
            <br>
          </span></p>
      </div>
    </blockquote>
    <p>We need to do both steps in on patch series.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US">
            <br>
            The Rust Oe-selftest fails since it is still on Rust 1.70
            and the Rust version is updated to 1.71 here. Parallelly
            will start to rebase Rust Oe-selftest on the latest
            versions.</span></p>
      </div>
    </blockquote>
    <p>Thanks. <br>
    </p>
    <p>Send the 1.70 -&gt; 1.71 update along with the <span lang="EN-US">Rust Oe-selftest using 1.71 as one series of
        commits.</span></p>
    <p><span lang="EN-US">../Randy<br>
      </span></p>
    <blockquote type="cite" cite="mid:SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Regards,<br>
          Yash<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div style="mso-element:para-border-div;border:none;border-top:solid
          #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
          <p class="MsoNormal" style="border:none;padding:0cm"><b>From:
            </b><a href="mailto:luca.ceresoli@bootlin.com" moz-do-not-send="true">Luca Ceresoli</a><br>
            <b>Sent: </b>25 August 2023 18:50<br>
            <b>To: </b><a href="mailto:Yash.Shinde=windriver.com@lists.openembedded.org" moz-do-not-send="true">Shinde, Yash via
              lists.openembedded.org</a><br>
            <b>Cc: </b><a href="mailto:Yash.Shinde@windriver.com" moz-do-not-send="true">Shinde, Yash</a>; <a href="mailto:openembedded-core@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">
              openembedded-core@lists.openembedded.org</a>; <a href="mailto:Randy.MacLeod@windriver.com" moz-do-not-send="true">
              MacLeod, Randy</a>; <a href="mailto:Umesh.Kallapa@windriver.com" moz-do-not-send="true">Kallapa, Umesh</a>;
            <a href="mailto:Naveen.Gowda@windriver.com" moz-do-not-send="true">Gowda, Naveen</a>; <a href="mailto:Sundeep.Kokkonda@windriver.com" moz-do-not-send="true">
              Kokkonda, Sundeep</a>; <a href="mailto:Shivaprasad.Moodalappa@windriver.com" moz-do-not-send="true">Moodalappa, Shivaprasad</a><br>
            <b>Subject: </b>Re: [OE-core] [PATCH v3] rust: Upgrade
            1.70.0 -&gt; 1.71.0</p>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">CAUTION: This email comes from a non Wind
          River email account!<br>
          Do not click links or open attachments unless you recognize
          the sender and know the content is safe.<br>
          <br>
          Hello Yash,<br>
          <br>
          On Thu, 24 Aug 2023 07:30:18 -0700<br>
          &quot;Shinde, Yash via lists.openembedded.org&quot;<br>
          <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde=windriver.com@lists.openembedded.org">&lt;Yash.Shinde=windriver.com@lists.openembedded.org&gt;</a>
          wrote:<br>
          <br>
          &gt; Switch libstd-rs to use the dummy `sysroot` crate which
          represents the<br>
          &gt; standard library crates. Target getrandom-open64.patch at
          0.2.8 (merged<br>
          &gt; for 0.2.9).<br>
          &gt;<br>
          &gt; Drop bootstrap_fail.patch as it is merged in upstream
          rust.<br>
          &gt;<br>
          &gt; Signed-off-by: Yash Shinde
          <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a><br>
          <br>
          The rust.RustSelfTestSystemEmulated.test_rust test is failing
          on the<br>
          ABs with this patch applied:<br>
          <br>
          <a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/steps/12/logs/stdio" moz-do-not-send="true" class="moz-txt-link-freetext">https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/steps/12/logs/stdio</a><br>
          <a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/steps/12/logs/stdio" moz-do-not-send="true" class="moz-txt-link-freetext">https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/steps/12/logs/stdio</a><br>
          <a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/steps/12/logs/stdio" moz-do-not-send="true" class="moz-txt-link-freetext">https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/steps/12/logs/stdio</a><br>
          <br>
          Luca<br>
          <br>
          --<br>
          Luca Ceresoli, Bootlin<br>
          Embedded Linux and Kernel engineering<br>
          <a href="https://bootlin.com" moz-do-not-send="true" class="moz-txt-link-freetext">https://bootlin.com</a><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ZeONiJreRLP5MpEUDC8YiVy0--

