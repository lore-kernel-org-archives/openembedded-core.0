Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7214AC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 16:43:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.249.1700239409728797753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 08:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oFwEnvZZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96858e386d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AHCTidl031588
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 16:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=PIAX0LdCo+H21uK1xUy
	QjLlpeCijkFF9I7ZgFrz6Ufc=; b=oFwEnvZZF1iHRyfyrj269cvXQVbvxzyitkx
	FiZuJJqboGl7LqLKSDSX1BQZrMuQew0jBgszwizpkyU0rELHbm8VaEUoc830HedV
	AwsoLruGZtbYBM3/oy3k/WLKO/P7hPAOK0h2T0lxsCTm2RQHzOXsUIVSqqi2EZaB
	nCGGqLU592dmaHevAsynJCMaLv4zrEleaDFUq1SxLwFnMYMu4CE8y4Yv4QF2Z/H1
	wCmy2ugWAcPEvy+9hPYnyjXHRAUanUoAWAVefRrVHrCzdAF3suc5q4eaI/4EVBsr
	NM/ldxKQZW3Rx6ullaXtmuIDsaPAJmEUMnfLH6UHfRBrlZQd+IQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udy8c8kr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 16:43:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AHGgYdY019555
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 16:43:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udy8c8kr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 16:43:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzdGEldJHbgzWsXfyTZ6dmFNlJnPz8D+TunmWIlTq7MlBz3vS4PtKSy/ko6CbAG7bEGpWzBvLhcYSbyuVk4DfZm3/LVJ0DuSDUbzBvpLq8fNFGmD/HaAbDh3K7Gjfp23U25HyhLQ2jMvEXeNsc1zLKrWznTVzx8q6OgEtw+YbRaRclw8s8dcoywYW/+U7YHLgQfDH+CNBNV8oFDx8D4fhrC45vZvWUrocfjhIqzOXFyBy3wA74a2bO7iMh0y8JDVTTk0GRmcGqFd2KGrmCtxECo11lKI6JYTiTuDxzMmIt+P7sIx12uq5w6pWt4IdVjQ+MTKL4sPFGoqqJiePAB2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIAX0LdCo+H21uK1xUyQjLlpeCijkFF9I7ZgFrz6Ufc=;
 b=f5m2tBP5A7xTq6zwDP6BV1y7jzH47oIhsX33nva3DrJRHsf4QTYjgJ6yEKzPv8WCLkKOvviMu8J9RGj2pGB90A8WJtphV05MZoDbsS7eKb80gJkpsrBlrZkObm8ilLxMHUU+CGeG/eTD6R7qI4Fe9rzK50TtdLCdYppmlpcqk/IL0coUNXhANCyPipAujbHY7PJO2hGKLgpUtMfjLN7jAQemVx/jttTNfk45XlA7RK8flpGnT4Jbo2WNrCCC4hAp1hDzo1tCr8a7jXvGK/6Gn7zpupaw0s0KIaEAtJhaMzHziOyLQGMLH+1whM1582JpdlQkoeZmHPnyTmVNZ9S1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 16:43:21 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::9a34:6f20:2f8d:79ed]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::9a34:6f20:2f8d:79ed%6]) with mapi id 15.20.7002.025; Fri, 17 Nov 2023
 16:43:21 +0000
Content-Type: multipart/alternative;
 boundary="------------TKx2T107ytvgYjb9PLTjKca4"
Message-ID: <0836df76-219c-4d82-92fd-0b7152d7cc7f@windriver.com>
Date: Fri, 17 Nov 2023 11:42:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
Content-Language: en-CA
To: Marta Rybczynska <rybczynska@gmail.com>,
        "G Pillai, Hari" <hari.gpillai@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "jpuhlman@mvista.com" <jpuhlman@mvista.com>,
        Ross Burton <Ross.Burton@arm.com>, Vijay Anusuri <vanusuri@mvista.com>,
        meenali.gupta@windriver.com
References: <20231116040549.11447-1-vanusuri@mvista.com>
 <93710C32-2A78-417E-970F-E4B010262326@arm.com>
 <57008fe2-36a9-4a7e-909b-4cab0a86f351@mvista.com>
 <CANQUz1_qynUTH-3KOq11e+CO+xUGoZbxpu1qLRGEee4ddCK4cQ@mail.gmail.com>
 <PH7PR11MB798653248FA1F75F94D91844E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <PH7PR11MB798653248FA1F75F94D91844E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3998:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 8021feb9-181f-4638-bcf1-08dbe78c4bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5yAgJN6maYw1jfnmXGqEo112u1QfJeTzsmGO5krbtoTxftfy2YHsBoqKqGoQRJ8qftZGiXbSOcxbRYE8TywNXlr0k2sBnNEUp1LKkmwmeMCRy+0swQ1dz9+kt8i43WgU7PpvijSkKappwZYlaY8K3WC4T5oHvkP+wvkWcspgqpEaOfP5BDamC1fSaSIfBNng4vIg4SLRGd4BevaKgr8nuxUBP7SeT3pl3zdxw7ypX6H9eEJrQJnyulUlTvJVyuGb/uZ9Q+klR/vLlucHjkSeTR3pNtCZqX82v1xmhJONsvHoobQwlbp3FdunlO87r99ro3/T3R8D4CRuC3dHAn0UkSFBjOE/c0mXG1pXrl3q482GINotrrSlFJfGDJLBb5oiRrZ+/328AbRhh0LaOaSglJ3MB8SisXX3Q84HeLlQQInQecN5HPP0y9zH/cWi7yv1vXR1zpBpvlyhsaw0kBpw+fdWupCapbZCcBmBWWgIDp4CIWdk+FLsPyl5lTOqwqaD6hIbVzee1mxFE74dyPcb26RH0FmVRfrdObmFOjVNW7SLfGlO2rDORuQFPB0PcIbisYGiKuNqsPcroGVFE0vk9vzVofgIiYnNh0SlgcHcNseDv24Jm5BwgTp0RPcw+GrAktQCUM+q7kR9XmxhiY8QoLW1oDdidrVrpsJ9AxGi4cJIp2dG+LRt7TyMyp9ErcLNlc+JHJD7/Atir3/11DdynQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(396003)(376002)(136003)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(166002)(110136005)(83380400001)(38100700002)(66946007)(54906003)(8676002)(8936002)(66556008)(66476007)(4326008)(30864003)(107886003)(31686004)(36756003)(66574015)(41300700001)(19627405001)(26005)(31696002)(6512007)(2616005)(6506007)(53546011)(33964004)(4001150100001)(6666004)(478600001)(66899024)(6486002)(966005)(2906002)(6636002)(316002)(5660300002)(86362001)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGkrclByRytjMUU0UWluRVppMnUvZkJQRlpvd2IwMmNFbVVJMjA5aG1QOVF0?=
 =?utf-8?B?cGFZQTJTTmhRN25qb05nZzBqY2NaR254am82LzJoaGhSelovUlZxUjMrMFVm?=
 =?utf-8?B?S0poS04rdUVGbHJLV3hFdDhnSlZtQWV3NlNpaVJYVE91aUo2d2phSDZpczlt?=
 =?utf-8?B?azRDT1liT0t6QWJxZkQzYlVVMGNWR2R1VG1jQW85M2xMQXBVRjVSM0JFT3M0?=
 =?utf-8?B?WFlqaDY5UHR1bGQvTjdLVmI0NVZndUNsTkluL3R0VzFGOHVadjR3eGZBOFFj?=
 =?utf-8?B?SVhpNjFWbSt5bFluY3JLc1g2MTZzVldXU0JVakIyQlRUUk1KSzArTExMS1B2?=
 =?utf-8?B?a2JpYTYxdVpYZWNBeFpJekw4V0RHZkpzZkJCamQwOFNpcEVjM3ExTFRjTFJB?=
 =?utf-8?B?VjNYOFVOT012UzlFc2Jad3NRdUtjSmYwMVQ3SmFtMG85RjRORW1jWHhYOGM2?=
 =?utf-8?B?MXZ5MGhqNjNnSXdWWFZKLzU0RjVQZ0N6aExCUVFrM3RjMnhTRXB0VkpjcEth?=
 =?utf-8?B?T0tqd1hSNzlKSVAwMCt6blBMUFo3dENteXZUVXFDMEZ5QUY3WWM3WEtlMFp5?=
 =?utf-8?B?UkxKb05ZZlRHcHpiR0lybXBxeDl6UHVwRXNOZGlvc3c3cmU0VXNvYjNkd2dl?=
 =?utf-8?B?VUdtclNEcGpnNHNvQ2gvYmZrTW5LdG83R3RYY0lLV09BalVPdnF5bXFydm5F?=
 =?utf-8?B?N0dmTVM4V1hFZzJvUklRc2NFcTBUNzZOMERZNDYxOUVzWXYxSVR6UHVBQ001?=
 =?utf-8?B?Z08yaEw0VTEyQVFUQTFXd1hzYXBrZjlPRHhOZkZ1NEJqc2FiMGNIbU9wa3p5?=
 =?utf-8?B?WUZtVFJ4OC9uTVJHN0o5Y1hTbDRCZHhITDZkdkZnOFRydTVtMkFsNmFwS29I?=
 =?utf-8?B?SVVwK0RycHhFL3MyMHhYYkQxd2ZNekxCN1J6SzRKa2ZyR01yNG14Y3ZwTE9W?=
 =?utf-8?B?b1NzMklyLzNqOXVhMlJmdkVjOEhTZFB5akpQTTl1b0U1YVljcnBDWDJTWVpL?=
 =?utf-8?B?K05oeUZSeHJ3QjhwQnNGN0M0RjFQVmxYNzZOd2pxOTcyZDhacEl2bUZ0R3RJ?=
 =?utf-8?B?emxEVWVoNkpYNFpIZEVUV3hTb01lZXNvK3lwL3krQ0FaMThaN1RyTU4wWk5r?=
 =?utf-8?B?SUo1bjJEWXRoMU1DMFU0WGJWNVFOZzZ0OVBLQ0lXMkxqUjhtUkl6MVUxYjgz?=
 =?utf-8?B?bW1SM2ZGZGQzdzJEVEV1bTBKM1FTY1Z3bzlXVHhJRmhaRnp5SFQ1OXpDRGVr?=
 =?utf-8?B?ZFgzMWJOVUN2T3RFRkl1alBxSFNYUkFScFAwbzFJMXBaazA2ZHc2MC9yY0Fk?=
 =?utf-8?B?anVwc3pTZGdud0cvR2RhanZORS8ra3hYZFlqMzV4YVd1dHdSSDl2UmkzU0Jo?=
 =?utf-8?B?NEgzOVhJa3YxR0U0SWtPWXJ6TUFpd3NFTFJaa3U1MVF2aGRSZlpqRkV3TEwy?=
 =?utf-8?B?RUlNYkJvbHNEdDVYWVM2RXdVS0FzaHBBSEJWN25DU2QybTJEMjIvYVdEclRp?=
 =?utf-8?B?VmhxWjA5Mk5HOXNXUlRHbzRaZ0VtQm9lRnd5Y1Y3QkJHTk5Jd1FFaHNOTWxv?=
 =?utf-8?B?OHd6S3RRR0g0VE9sbmswUzVRUjFhMmEvMm1GMUlVTUxUKytpZ3NFRXpiNUpo?=
 =?utf-8?B?d1Rtb0wrNDUzSjcxTUJObXkxMCtvTUN0MHhsQUtIdnY2TDBiNEZHVVl3WENa?=
 =?utf-8?B?MUNOMWdlL2wvQkl1OVgrcEVoUVBidlplMy90d1o5NmhqeU1vMDM3aC9OWVBG?=
 =?utf-8?B?QzBoLzF6VDU0ZGhVQ1BpS0FFVmVjcU9LTVlPVFlzMDI1emt2Tlh5bDBSa1oz?=
 =?utf-8?B?eXB5ejlobGNRVlU4d09POWhnN0sxeVdmanY2RzU3aDZkeWQzZUVCRmlWbkJ6?=
 =?utf-8?B?bVUvRk5SQ3NhYi9CT3cxTC80VHdzeVBrb3VEUjlzTytTdG9yMUxvSmluYTlV?=
 =?utf-8?B?MTlWZC8wckgza1RoRVpkYnM0bTJJYlkxd0FZS0thc0tNc0RYMWY4V01xWjF5?=
 =?utf-8?B?TG9zbTVhdmdpUGNWRWxOZDFDUFZDaTN3YWs2OVcwYUJ5WDBjMndybTl4YTJr?=
 =?utf-8?B?dlJqZm55dDFCZVJoeDZ5OVZVRUxrcWpqcmlOM2pvMC9uY0hYVFVvdUpPd2hS?=
 =?utf-8?B?TWdhcHlqYUhzNGJ5SUIwd2dRSkNIbFhscVgzcEVwL3NCekVUQit3c0Q3eVJK?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8021feb9-181f-4638-bcf1-08dbe78c4bd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 16:43:21.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYl8jHgQe2/FbJ1Xa34oPLCpaqGREM2EtpMqwzOtognD1KvJ8ERrqq/lq3ZGdziob7UpOQfEi4WqHrTeA+Cic9dOt4twXO4zBEk9OtV6XuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
X-Proofpoint-ORIG-GUID: 7L2RORztp46goL_XByraXOUL_YEV7UDU
X-Proofpoint-GUID: v1o9xW3GuNywDu-HhT6onHpsc0bIPori
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311170125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 16:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190855

--------------TKx2T107ytvgYjb9PLTjKca4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AHCTidl031588

Add Hari who will inform WR developers on his team once the CVE=20
co-ordination scheme is available.
Add Marta.

On 2023-11-17 9:11 a.m., Meenali Gupta via lists.openembedded.org wrote:
> Hi Ross,
>
> As discussed with Vijay,=C2=A0 we'll cooperate on this CVE fixes.

Marta,


Do you have a wiki page set-up?


I see:

https://wiki.yoctoproject.org/wiki/Synchronization_CVEs

and it mentions, but does not point to, "A synchronization wiki page".



../Randy


>
> Regards
> Meenali
> -----------------------------------------------------------------------=
-
> *From:* Vijay Anusuri <vanusuri@mvista.com>
> *Sent:* 16 November 2023 21:31
> *To:* jpuhlman@mvista.com <jpuhlman@mvista.com>; Ross Burton=20
> <Ross.Burton@arm.com>; Gupta, Meenali <Meenali.Gupta@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE'=
s
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hi Ross,
>
> As discussed with Meenali, I agreed she was going to do this work.
> She has already submitted patches for multiple branches ( master,=20
> mickledore and kirkstone ).
>
> For CVE-2023-38469, we need to include 2 commits to fix the CVE.=20
> Meenali will send the v2 patch for CVE-2023-38469 which will include 2=20
> patches for all the branches.
>
> Thank you Meenali for your timely response.
>
> Thanks & Regards,
> Vijay
>
> On Thu, Nov 16, 2023 at 7:56=E2=80=AFPM Jeremy Puhlman via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-=
9H_LG6OXVHPwKv5R-0$>=20
> <jpuhlman=3Dmvista.com@lists.openembedded.org> wrote:
>
>
>
>     On 11/16/2023 3:22 AM, Ross Burton wrote:
>     > Hi Vijay and Meenali,
>     >
>     > Hopefully this will show everyone - especially WR and Montavista
>     - that we need to communicate better when working on CVEs.=C2=A0 In=
 the
>     short term at least, Marta proposed a wiki page which can be
>     updated via a tool and when someone is working on an issue that
>     can be marked to avoid duplication of effort.=C2=A0 Would that be
>     acceptable to both of your companies?
>
>     Yeah, I think something like that would be great on our end, provid=
ed
>     its automated and the data can be extracted, so it can be
>     consolidated
>     in internal CVE tracking that we are currently required to.
>
>     >
>     > I=E2=80=99ve not checked that the fixes are identical, but appare=
ntly I
>     need to remind everyone that we take fixes in *master first* and
>     then backport to the releases in order.
>     There should also be an agree upon change decoration to indicate
>     non-applicability/differently addressed in earlier releases.
>
>     With 4 year LTS releases many issues are just not going to be
>     applicable
>     to master. Also there may well be very good reasons to fix a given
>     set
>     of CVEs in
>     completely different ways, but making sure they are addressed in
>     both is
>     important. Setting aside this example, in almost all cases on maste=
r
>     moving to the fixed version, is almost always the right answer,
>     where as
>     on say dunfell, moving to the new version may have too many knock o=
n
>     effects to make sense.
>     In this instance, Khem has already indicated moving to the new
>     release
>     may make sense for both kirkstone and master.
>
>     >
>     > Luckily the avahi recipe is fairly untouched so this should be
>     trivial.=C2=A0 Can you both discuss and agree who is going to do th=
is?
>     Vijay can you work with Meenali to consolidate this patch.
>     >
>     > Ross
>     >
>     >> On 16 Nov 2023, at 04:05, Vijay Anusuri via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8=
fbQ-9H_LG6OXVHPwKv5R-0$>
>     <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>     >>
>     >> From: Vijay Anusuri <vanusuri@mvista.com>
>     >>
>     >> Patches to fix:
>     >> CVE-2023-38469
>     >> CVE-2023-38470
>     >> CVE-2023-38471
>     >> CVE-2023-38472
>     >> CVE-2023-38473
>     >>
>     >> Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f4=
64529af6e3a1cf
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/a337a1ba7d15853fb56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo=
$>
>     >> &
>     >>
>     https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca75=
9baa516166237
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/c6cab87df290448a63323c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU=
$>
>     >> &
>     >>
>     https://github.com/lathiat/avahi/commit/94cb6489114636940ac68351541=
7990b55b5d66c
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/94cb6489114636940ac683515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8=
$>
>     >> &
>     >>
>     https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d=
117bd88d93b09
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/894f085f402e023a98cbb6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo=
$>
>     >> &
>     >>
>     https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e63916=
87c3c9c8dee40
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/b024ae5749f4aeba03478e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo=
$>
>     >> &
>     >>
>     https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695=
a9729f8646797
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/b448c9f771bada14ae8de175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg=
$>]
>     >>
>     >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> ---
>     >> meta/recipes-connectivity/avahi/avahi_0.8.bb
>     <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YP=
O7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHPSo_Ck9E$>
>     |=C2=A0 =C2=A06 +
>     >> .../avahi/files/CVE-2023-38469-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 47 ++++++++
>     >> .../avahi/files/CVE-2023-38469-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 65 +++++++++++
>     >> .../avahi/files/CVE-2023-38470.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 56 +++++++++
>     >> .../avahi/files/CVE-2023-38471.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 72 ++++++++++++
>     >> .../avahi/files/CVE-2023-38472.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 47 ++++++++
>     >> .../avahi/files/CVE-2023-38473.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 108
>     ++++++++++++++++++
>     >> 7 files changed, 401 insertions(+)
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>     >> create mode 100644
>     meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>     >>
>     >> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb
>     <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YP=
O7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHPSo_Ck9E$>
>     b/meta/recipes-connectivity/avahi/avahi_0.8.bb
>     <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YP=
O7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHPSo_Ck9E$>
>     >> index b5c966c102..772fb43939 100644
>     >> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
>     <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YP=
O7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHPSo_Ck9E$>
>     >> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
>     <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YP=
O7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHPSo_Ck9E$>
>     >> @@ -26,6 +26,12 @@ SRC_URI =3D
>     "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${=
PV}
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/relea=
ses/download/v$*7BPV*7D/avahi-$*7BPV*7D__;JSUlJQ!!AjveYdw8EvQ!YPO7NIVZeFh=
isahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP0Am2=
ovI$>
>     >> file://0001-Fix-opening-etc-resolv.conf-error.patch \
>     >> file://handle-hup.patch \
>     >> file://local-ping.patch \
>     >> + file://CVE-2023-38469-1.patch \
>     >> + file://CVE-2023-38469-2.patch \
>     >> + file://CVE-2023-38470.patch \
>     >> + file://CVE-2023-38471.patch \
>     >> + file://CVE-2023-38472.patch \
>     >> + file://CVE-2023-38473.patch \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     >>
>     >> UPSTREAM_CHECK_URI =3D
>     "https://github.com/lathiat/avahi/releases/
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/relea=
ses/__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4=
FsGlVur74kFZ8fbQ-9H_LG6OXVHP0Xuk60k$>"
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>     >> new file mode 100644
>     >> index 0000000000..99c717daf3
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.pat=
ch
>     >> @@ -0,0 +1,47 @@
>     >> +From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17
>     00:00:00 2001
>     >> +From: Evgeny Vereshchagin <evvers@ya.ru>
>     >> +Date: Mon, 23 Oct 2023 20:29:31 +0000
>     >> +Subject: [PATCH] core: reject overly long TXT resource records
>     >> +
>     >> +Closes https://github.com/lathiat/avahi/issues/455
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/issue=
s/455__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa=
4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9siEVs$>
>     >> +
>     >> +CVE-2023-38469
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f4=
64529af6e3a1cf
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/a337a1ba7d15853fb56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo=
$>]
>     >> +CVE: CVE-2023-38469
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-core/rr.c | 9 ++++++++-
>     >> + 1 file changed, 8 insertions(+), 1 deletion(-)
>     >> +
>     >> +diff --git a/avahi-core/rr.c b/avahi-core/rr.c
>     >> +index 2bb89244..9c04ebbd 100644
>     >> +--- a/avahi-core/rr.c
>     >> ++++ b/avahi-core/rr.c
>     >> +@@ -32,6 +32,7 @@
>     >> + #include <avahi-common/malloc.h>
>     >> + #include <avahi-common/defs.h>
>     >> +
>     >> ++#include "dns.h"
>     >> + #include "rr.h"
>     >> + #include "log.h"
>     >> + #include "util.h"
>     >> +@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r)=
 {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AVAHI_DNS_TYPE_TXT: {
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AvahiStringList=
 *strlst;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t used =3D 0;
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r->d=
ata.txt.string_list; strlst;
>     strlst =3D strlst->next)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r->d=
ata.txt.string_list; strlst;
>     strlst =3D strlst->next) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (strlst->size > 255 || strlst->size <=3D 0)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>     >> +
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 used +=
=3D 1+strlst->size;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (us=
ed > AVAHI_DNS_RDATA_MAX)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return 0;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>     >> new file mode 100644
>     >> index 0000000000..b83a70e29b
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.pat=
ch
>     >> @@ -0,0 +1,65 @@
>     >> +From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17
>     00:00:00 2001
>     >> +From: Evgeny Vereshchagin <evvers@ya.ru>
>     >> +Date: Wed, 25 Oct 2023 18:15:42 +0000
>     >> +Subject: [PATCH] tests: pass overly long TXT resource records
>     >> +
>     >> +to make sure they don't crash avahi any more.
>     >> +
>     >> +It reproduces https://github.com/lathiat/avahi/issues/455
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/issue=
s/455__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa=
4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9siEVs$>
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca7=
59baa516166237
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/c6cab87df290448a63323c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU=
$>]
>     >> +CVE: CVE-2023-38469
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-client/client-test.c | 14 ++++++++++++++
>     >> + 1 file changed, 14 insertions(+)
>     >> +
>     >> +diff --git a/avahi-client/client-test.c
>     b/avahi-client/client-test.c
>     >> +index 7d04a6a..66e3574 100644
>     >> +--- a/avahi-client/client-test.c
>     >> ++++ b/avahi-client/client-test.c
>     >> +@@ -22,6 +22,7 @@
>     >> + #endif
>     >> +
>     >> + #include <stdio.h>
>     >> ++#include <string.h>
>     >> + #include <assert.h>
>     >> +
>     >> + #include <avahi-client/client.h>
>     >> +@@ -33,6 +34,8 @@
>     >> + #include <avahi-common/malloc.h>
>     >> + #include <avahi-common/timeval.h>
>     >> +
>     >> ++#include <avahi-core/dns.h>
>     >> ++
>     >> + static const AvahiPoll *poll_api =3D NULL;
>     >> + static AvahiSimplePoll *simple_poll =3D NULL;
>     >> +
>     >> +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc,
>     AVAHI_GCC_UNUSED char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0uint32_t cookie;
>     >> +=C2=A0 =C2=A0 =C2=A0struct timeval tv;
>     >> +=C2=A0 =C2=A0 =C2=A0AvahiAddress a;
>     >> ++=C2=A0 =C2=A0 uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
>     >> ++=C2=A0 =C2=A0 AvahiStringList *txt =3D NULL;
>     >> ++=C2=A0 =C2=A0 int r;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0simple_poll =3D avahi_simple_poll_new();
>     >> +=C2=A0 =C2=A0 =C2=A0poll_api =3D avahi_simple_poll_get(simple_p=
oll);
>     >> +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc,
>     AVAHI_GCC_UNUSED char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0printf("%s\n",
>     avahi_strerror(avahi_entry_group_add_service (group,
>     AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site",
>     "_http._tcp", NULL, NULL, 80, "foo=3Dbar", NULL)));
>     >> +=C2=A0 =C2=A0 =C2=A0printf("add_record: %d\n", avahi_entry_grou=
p_add_record
>     (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01,
>     0x10, 120, "\5booya", 6));
>     >> +
>     >> ++=C2=A0 =C2=A0 memset(rdata, 1, sizeof(rdata));
>     >> ++=C2=A0 =C2=A0 r =3D avahi_string_list_parse(rdata, sizeof(rdat=
a), &txt);
>     >> ++=C2=A0 =C2=A0 assert(r >=3D 0);
>     >> ++=C2=A0 =C2=A0 assert(avahi_string_list_serialize(txt, NULL, 0)=
 =3D=3D
>     sizeof(rdata));
>     >> ++=C2=A0 =C2=A0 error =3D avahi_entry_group_add_service_strlst(g=
roup,
>     AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp",
>     NULL, NULL, 123, txt);
>     >> ++=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
>     >> ++=C2=A0 =C2=A0 avahi_string_list_free(txt);
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi,
>     AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
>     AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback,
>     (char*) "omghai3u");
>     >> +--
>     >> +2.25.1
>     >> +
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>     >> new file mode 100644
>     >> index 0000000000..1cbb00dcab
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>     >> @@ -0,0 +1,56 @@
>     >> +From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17
>     00:00:00 2001
>     >> +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemens=
ik@redhat.com>
>     >> +Date: Tue, 11 Apr 2023 15:29:59 +0200
>     >> +Subject: [PATCH] Ensure each label is at least one byte long
>     >> +
>     >> +The only allowed exception is single dot, where it should
>     return empty
>     >> +string.
>     >> +
>     >> +Fixes #454.
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/94cb6489114636940ac6835154=
17990b55b5d66c
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/94cb6489114636940ac683515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8=
$>]
>     >> +CVE: CVE-2023-38470
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-common/domain-test.c | 14 ++++++++++++++
>     >> + avahi-common/domain.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-
>     >> + 2 files changed, 15 insertions(+), 1 deletion(-)
>     >> +
>     >> +diff --git a/avahi-common/domain-test.c
>     b/avahi-common/domain-test.c
>     >> +index cf763eca6..3acc1c1e4 100644
>     >> +--- a/avahi-common/domain-test.c
>     >> ++++ b/avahi-common/domain-test.c
>     >> +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc,
>     AVAHI_GCC_UNUSED char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0printf("%s\n", s =3D
>     avahi_normalize_name_strdup("fo\\\\o\\..f oo."));
>     >> +=C2=A0 =C2=A0 =C2=A0avahi_free(s);
>     >> +
>     >> ++=C2=A0 =C2=A0 printf("%s\n", s =3D avahi_normalize_name_strdup=
("."));
>     >> ++=C2=A0 =C2=A0 avahi_free(s);
>     >> ++
>     >> ++=C2=A0 =C2=A0 s =3D
>     avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}.?.?.?.z.?=
.?.}.}."
>     >> ++ "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.=
}.}.}"
>     >> ++ ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?=
.zM.?`"
>     >> ++ "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.=
?."
>     >> ++ "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.=
}."
>     >> ++ "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.=
}?"
>     >> ++ "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.z=
M."
>     >> ++ "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.=
?.?."
>     >> ++=C2=A0 =C2=A0 "}.?.?.?.}.=3D.?.?.}");
>     >> ++=C2=A0 =C2=A0 assert(s =3D=3D NULL);
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0printf("%i\n", avahi_domain_equal("\\065aa
>     bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
>     >> +=C2=A0 =C2=A0 =C2=A0printf("%i\n", avahi_domain_equal("A", "a")=
);
>     >> +
>     >> +diff --git a/avahi-common/domain.c b/avahi-common/domain.c
>     >> +index 3b1ab6834..e66d2416c 100644
>     >> +--- a/avahi-common/domain.c
>     >> ++++ b/avahi-common/domain.c
>     >> +@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s,
>     char *ret_s, size_t size) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!empty) {
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size < 1)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size < 2)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn NULL;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(r++) =3D '.';
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>     >> new file mode 100644
>     >> index 0000000000..8242646da1
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>     >> @@ -0,0 +1,72 @@
>     >> +From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17
>     00:00:00 2001
>     >> +From: Michal Sekletar <msekleta@redhat.com>
>     >> +Date: Mon, 23 Oct 2023 13:38:35 +0200
>     >> +Subject: [PATCH] core: extract host name using
>     avahi_unescape_label()
>     >> +
>     >> +Previously we could create invalid escape sequence when we
>     split the
>     >> +string on dot. For example, from valid host name "foo\\.bar"
>     we have
>     >> +created invalid name "foo\\" and tried to set that as the host
>     name
>     >> +which crashed the daemon.
>     >> +
>     >> +Fixes #453
>     >> +
>     >> +CVE-2023-38471
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3=
d117bd88d93b09
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/894f085f402e023a98cbb6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo=
$>]
>     >> +CVE: CVE-2023-38471
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-core/server.c | 27 +++++++++++++++++++++------
>     >> + 1 file changed, 21 insertions(+), 6 deletions(-)
>     >> +
>     >> +diff --git a/avahi-core/server.c b/avahi-core/server.c
>     >> +index c32637af8..f6a21bb77 100644
>     >> +--- a/avahi-core/server.c
>     >> ++++ b/avahi-core/server.c
>     >> +@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) =
{
>     >> + }
>     >> +
>     >> + int avahi_server_set_host_name(AvahiServer *s, const char
>     *host_name) {
>     >> +-=C2=A0 =C2=A0 char *hn =3D NULL;
>     >> ++=C2=A0 =C2=A0 char label_escaped[AVAHI_LABEL_MAX*4+1];
>     >> ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX];
>     >> ++=C2=A0 =C2=A0 char *hn =3D NULL, *h;
>     >> ++=C2=A0 =C2=A0 size_t len;
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0assert(s);
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !host_name ||
>     avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
>     >> +@@ -1305,17 +1309,28 @@ int
>     avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
>     >> +=C2=A0 =C2=A0 =C2=A0else
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hn =3D avahi_normalize_name_s=
trdup(host_name);
>     >> +
>     >> +-=C2=A0 =C2=A0 hn[strcspn(hn, ".")] =3D 0;
>     >> ++=C2=A0 =C2=A0 h =3D hn;
>     >> ++=C2=A0 =C2=A0 if (!avahi_unescape_label((const char **)&hn, la=
bel,
>     sizeof(label))) {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(h);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME=
;
>     >> ++=C2=A0 =C2=A0 }
>     >> ++
>     >> ++=C2=A0 =C2=A0 avahi_free(h);
>     >> ++
>     >> ++=C2=A0 =C2=A0 h =3D label_escaped;
>     >> ++=C2=A0 =C2=A0 len =3D sizeof(label_escaped);
>     >> ++=C2=A0 =C2=A0 if (!avahi_escape_label(label, strlen(label), &h=
, &len))
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME=
;
>     >> +
>     >> +-=C2=A0 =C2=A0 if (avahi_domain_equal(s->host_name, hn) && s->s=
tate !=3D
>     AVAHI_SERVER_COLLISION) {
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(hn);
>     >> ++=C2=A0 =C2=A0 if (avahi_domain_equal(s->host_name, label_escap=
ed) &&
>     s->state !=3D AVAHI_SERVER_COLLISION)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_server_set_errno=
(s, AVAHI_ERR_NO_CHANGE);
>     >> +-=C2=A0 =C2=A0 }
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0withdraw_host_rrs(s);
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0avahi_free(s->host_name);
>     >> +-=C2=A0 =C2=A0 s->host_name =3D hn;
>     >> ++=C2=A0 =C2=A0 s->host_name =3D avahi_strdup(label_escaped);
>     >> ++=C2=A0 =C2=A0 if (!s->host_name)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_NO_MEMORY;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0update_fqdn(s);
>     >> +
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>     >> new file mode 100644
>     >> index 0000000000..43b26c1132
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>     >> @@ -0,0 +1,47 @@
>     >> +From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17
>     00:00:00 2001
>     >> +From: Michal Sekletar <msekleta@redhat.com>
>     >> +Date: Thu, 19 Oct 2023 17:36:44 +0200
>     >> +Subject: [PATCH] core: make sure there is rdata to process
>     before parsing it
>     >> +
>     >> +Fixes #452
>     >> +
>     >> +CVE-2023-38472
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391=
687c3c9c8dee40
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/b024ae5749f4aeba03478e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo=
$>]
>     >> +CVE: CVE-2023-38472
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-client/client-test.c=C2=A0 =C2=A0 =C2=A0 | 3 +++
>     >> + avahi-daemon/dbus-entry-group.c | 2 +-
>     >> + 2 files changed, 4 insertions(+), 1 deletion(-)
>     >> +
>     >> +diff --git a/avahi-client/client-test.c
>     b/avahi-client/client-test.c
>     >> +index 66e3574..9a015d7 100644
>     >> +--- a/avahi-client/client-test.c
>     >> ++++ b/avahi-client/client-test.c
>     >> +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc,
>     AVAHI_GCC_UNUSED char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0assert(error =3D=3D AVAHI_ERR_INVALID_RECOR=
D);
>     >> +=C2=A0 =C2=A0 =C2=A0avahi_string_list_free(txt);
>     >> +
>     >> ++=C2=A0 =C2=A0 error =3D avahi_entry_group_add_record (group,
>     AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120,
>     "", 0);
>     >> ++=C2=A0 =C2=A0 assert(error !=3D AVAHI_OK);
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi,
>     AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
>     AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback,
>     (char*) "omghai3u");
>     >> +diff --git a/avahi-daemon/dbus-entry-group.c
>     b/avahi-daemon/dbus-entry-group.c
>     >> +index 4e879a5..aa23d4b 100644
>     >> +--- a/avahi-daemon/dbus-entry-group.c
>     >> ++++ b/avahi-daemon/dbus-entry-group.c
>     >> +@@ -340,7 +340,7 @@ DBusHandlerResult
>     avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(r =3D avahi_record_new_=
full (name, clazz, type,
>     ttl)))
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_db=
us_respond_error(c, m,
>     AVAHI_ERR_NO_MEMORY, NULL);
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avahi_rdata_parse (r, rdata, s=
ize) < 0) {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdata || avahi_rdata_parse (r=
, rdata, size) < 0) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_record_un=
ref (r);
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_db=
us_respond_error(c, m,
>     AVAHI_ERR_INVALID_RDATA, NULL);
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +--
>     >> +2.25.1
>     >> +
>     >> diff --git
>     a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>     b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>     >> new file mode 100644
>     >> index 0000000000..7b33d564f8
>     >> --- /dev/null
>     >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>     >> @@ -0,0 +1,108 @@
>     >> +From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17
>     00:00:00 2001
>     >> +From: Michal Sekletar <msekleta@redhat.com>
>     >> +Date: Wed, 11 Oct 2023 17:45:44 +0200
>     >> +Subject: [PATCH] common: derive alternative host name from its
>     unescaped
>     >> + version
>     >> +
>     >> +Normalization of input makes sure we don't have to deal with
>     special
>     >> +cases like unescaped dot at the end of label.
>     >> +
>     >> +Fixes #451 #487
>     >> +CVE-2023-38473
>     >> +
>     >> +Upstream-Status: Backport
>     [https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de17569=
5a9729f8646797
>     <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commi=
t/b448c9f771bada14ae8de175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg=
$>]
>     >> +CVE: CVE-2023-38473
>     >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >> +---
>     >> + avahi-common/alternative-test.c |=C2=A0 3 +++
>     >> + avahi-common/alternative.c=C2=A0 =C2=A0 =C2=A0 | 27 ++++++++++=
+++++++++--------
>     >> + 2 files changed, 22 insertions(+), 8 deletions(-)
>     >> +
>     >> +diff --git a/avahi-common/alternative-test.c
>     b/avahi-common/alternative-test.c
>     >> +index 9255435ec..681fc15b8 100644
>     >> +--- a/avahi-common/alternative-test.c
>     >> ++++ b/avahi-common/alternative-test.c
>     >> +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc,
>     AVAHI_GCC_UNUSED char *argv[]) {
>     >> +=C2=A0 =C2=A0 =C2=A0const char* const test_strings[] =3D {
>     >> +
>     =C2=A0"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXX",
>     >> + =C2=A0"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=
=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC",
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ").",
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 "\\.",
>     >> ++
>     "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"gurke",
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"-",
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" #",
>     >> +diff --git a/avahi-common/alternative.c
>     b/avahi-common/alternative.c
>     >> +index b3d39f0ed..a094e6d76 100644
>     >> +--- a/avahi-common/alternative.c
>     >> ++++ b/avahi-common/alternative.c
>     >> +@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
>     >> + }
>     >> +
>     >> + char *avahi_alternative_host_name(const char *s) {
>     >> ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX],
>     alternative[AVAHI_LABEL_MAX*4+1];
>     >> ++=C2=A0 =C2=A0 char *alt, *r, *ret;
>     >> +=C2=A0 =C2=A0 =C2=A0const char *e;
>     >> +-=C2=A0 =C2=A0 char *r;
>     >> ++=C2=A0 =C2=A0 size_t len;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0assert(s);
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0if (!avahi_is_valid_host_name(s))
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +
>     >> +-=C2=A0 =C2=A0 if ((e =3D strrchr(s, '-'))) {
>     >> ++=C2=A0 =C2=A0 if (!avahi_unescape_label(&s, label, sizeof(labe=
l)))
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>     >> ++
>     >> ++=C2=A0 =C2=A0 if ((e =3D strrchr(label, '-'))) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e++;
>     >> +@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const
>     char *s) {
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0if (e) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c, *m;
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t l;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int n;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D atoi(e)+1;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(m =3D avahi_strdup_prin=
tf("%i", n)))
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D e-s-1;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D e-label-1;
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l >=3D AVAHI_LABEL_MAX-1-strle=
n(m)-1)
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D AVAHI_LABEL_MA=
X-1-strlen(m)-1;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len >=3D AVAHI_LABEL_MAX-1-str=
len(m)-1)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D AVAHI_LABEL_=
MAX-1-strlen(m)-1;
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, l))) =
{
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, l=
en))) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(m);
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const
>     char *s) {
>     >> +=C2=A0 =C2=A0 =C2=A0} else {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c;
>     >> +
>     >> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, AVAHI=
_LABEL_MAX-1-2)))
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, A=
VAHI_LABEL_MAX-1-2)))
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop_incomplete_utf8(c);
>     >> +@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const
>     char *s) {
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(c);
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> +
>     >> ++=C2=A0 =C2=A0 alt =3D alternative;
>     >> ++=C2=A0 =C2=A0 len =3D sizeof(alternative);
>     >> ++=C2=A0 =C2=A0 ret =3D avahi_escape_label(r, strlen(r), &alt, &=
len);
>     >> ++
>     >> ++=C2=A0 =C2=A0 avahi_free(r);
>     >> ++=C2=A0 =C2=A0 r =3D avahi_strdup(ret);
>     >> ++
>     >> +=C2=A0 =C2=A0 =C2=A0assert(avahi_is_valid_host_name(r));
>     >> +
>     >> +=C2=A0 =C2=A0 =C2=A0return r;
>     >> --
>     >> 2.25.1
>     >>
>     >>
>     >>
>     >>
>     >
>     >
>     >
>
>     --=20
>     Jeremy Puhlman
>     jpuhlman@mvista.com
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190851):https://lists.openembedded.org/g/openembedd=
ed-core/message/190851
> Mute This Topic:https://lists.openembedded.org/mt/102621335/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------TKx2T107ytvgYjb9PLTjKca4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3AHCTidl031588

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Hari who will inform WR developers
      on his team once the CVE co-ordination scheme is available.</div>
    <div class=3D"moz-cite-prefix">Add Marta.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-11-17 9:11 a.m., Meenali Gupta
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:PH7PR11MB798653248FA1F75F94D918=
44E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com">
     =20
      <style type=3D"text/css" style=3D"display:none;">P {margin-top:0;ma=
rgin-bottom:0;}</style>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        Hi Ross,</div>
      <div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class=3D"elementToProof"><span style=3D"font-family: Aptos, Ap=
tos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">As
          discussed with Vijay,&nbsp; we'll cooperate on this CVE fixes.<=
/span></div>
    </blockquote>
    <p>Marta, <br>
    </p>
    <p><br>
    </p>
    <p>Do you have a wiki page set-up?<br>
    </p>
    <p><br>
    </p>
    <p>I see: <br>
    </p>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://wi=
ki.yoctoproject.org/wiki/Synchronization_CVEs">https://wiki.yoctoproject.=
org/wiki/Synchronization_CVEs</a></p>
    <p>and it mentions, but does not point to, &quot;A synchronization wi=
ki
      page&quot;.</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:PH7PR11MB798653248FA1F75F94D918=
44E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com">
      <div class=3D"elementToProof"><span style=3D"font-family: Aptos, Ap=
tos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);"><br>
        </span></div>
      <div class=3D"elementToProof"><span style=3D"font-family: Aptos, Ap=
tos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">Regards</span></div>
      <div class=3D"elementToProof"><span style=3D"font-family: Aptos, Ap=
tos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">Meenali</span></div>
      <hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
      <div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt=
" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Vijay
          Anusuri <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:vanus=
uri@mvista.com">&lt;vanusuri@mvista.com&gt;</a><br>
          <b>Sent:</b> 16 November 2023 21:31<br>
          <b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:jpuhlman@mvista.com">jpuhlman@mvista.com</a> <a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:jpuhlman@mvista.com">&lt;jpuhlman@mvista.com&gt;</=
a>;
          Ross Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:R=
oss.Burton@arm.com">&lt;Ross.Burton@arm.com&gt;</a>; Gupta, Meenali
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Meenali.Gupta=
@windriver.com">&lt;Meenali.Gupta@windriver.com&gt;</a><br>
          <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:openembedded-core@lists.openembedded.org">openembedded-core@lists.openem=
bedded.org</a>
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-=
core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org=
&gt;</a><br>
          <b>Subject:</b> Re: [OE-core][kirkstone][PATCH] avahi: Fix for
          multiple CVE's</font>
        <div>&nbsp;</div>
      </div>
      <div><strong>
        </strong>
        <div style=3D"border:solid #9c6500 1pt; padding:2pt; background:#=
fcfc03"><strong><span style=3D"font-size:11pt; color:#000">CAUTION: This =
email
              comes from a non Wind River email account!</span></strong><=
br>
          <span style=3D"font-size:10pt; color:#000">Do not click links o=
r
            open attachments unless you recognize the sender and know
            the content is safe.</span><br>
        </div>
        <div>
          <div dir=3D"ltr">
            <div>Hi Ross,</div>
            <div><br>
            </div>
            <div>As discussed with Meenali, I agreed she was going to do
              this work. <br>
              She has already submitted patches for multiple branches (
              master, mickledore and kirkstone ).
              <br>
            </div>
            <div><br>
            </div>
            <div>For CVE-2023-38469, we need to include 2 commits to fix
              the CVE. Meenali will send the v2 patch for CVE-2023-38469
              which will include 2 patches for all the branches.<br>
            </div>
            <div><br>
            </div>
            <div>Thank you Meenali for your timely response.<br>
            </div>
            <div>&nbsp;<br>
            </div>
            <div>Thanks &amp; Regards,<br>
            </div>
            <div>Vijay<br>
            </div>
          </div>
          <br>
          <div class=3D"x_gmail_quote">
            <div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Nov 16, 2023 =
at
              7:56=E2=80=AFPM Jeremy Puhlman via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt0=
4VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwKv5R-0$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;jpuhlman=3D<a href=3D"mail=
to:mvista.com@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">mvista.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex; border-left:1px solid rgb(204,204,204); padding-left:1ex">
              <br>
              <br>
              On 11/16/2023 3:22 AM, Ross Burton wrote:<br>
              &gt; Hi Vijay and Meenali,<br>
              &gt;<br>
              &gt; Hopefully this will show everyone - especially WR and
              Montavista - that we need to communicate better when
              working on CVEs.&nbsp; In the short term at least, Marta
              proposed a wiki page which can be updated via a tool and
              when someone is working on an issue that can be marked to
              avoid duplication of effort.&nbsp; Would that be acceptable=
 to
              both of your companies?<br>
              <br>
              Yeah, I think something like that would be great on our
              end, provided <br>
              its automated and the data can be extracted, so it can be
              consolidated <br>
              in internal CVE tracking that we are currently required
              to.<br>
              <br>
              &gt;<br>
              &gt; I=E2=80=99ve not checked that the fixes are identical,=
 but
              apparently I need to remind everyone that we take fixes in
              *master first* and then backport to the releases in order.<=
br>
              There should also be an agree upon change decoration to
              indicate <br>
              non-applicability/differently addressed in earlier
              releases.<br>
              <br>
              With 4 year LTS releases many issues are just not going to
              be applicable <br>
              to master. Also there may well be very good reasons to fix
              a given set <br>
              of CVEs in<br>
              completely different ways, but making sure they are
              addressed in both is <br>
              important. Setting aside this example, in almost all cases
              on master<br>
              moving to the fixed version, is almost always the right
              answer, where as <br>
              on say dunfell, moving to the new version may have too
              many knock on <br>
              effects to make sense.<br>
              In this instance, Khem has already indicated moving to the
              new release <br>
              may make sense for both kirkstone and master.<br>
              <br>
              &gt;<br>
              &gt; Luckily the avahi recipe is fairly untouched so this
              should be trivial.&nbsp; Can you both discuss and agree who=
 is
              going to do this?<br>
              Vijay can you work with Meenali to consolidate this patch.<=
br>
              &gt;<br>
              &gt; Ross<br>
              &gt;<br>
              &gt;&gt; On 16 Nov 2023, at 04:05, Vijay Anusuri via <a hre=
f=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fb=
Q-9H_LG6OXVHPwKv5R-0$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">
                lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mail=
to:mvista.com@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">mvista.com@lists.openembedded.org<=
/a>&gt;
              wrote:<br>
              &gt;&gt;<br>
              &gt;&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri=
@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; Patches to fix:<br>
              &gt;&gt; CVE-2023-38469<br>
              &gt;&gt; CVE-2023-38470<br>
              &gt;&gt; CVE-2023-38471<br>
              &gt;&gt; CVE-2023-38472<br>
              &gt;&gt; CVE-2023-38473<br>
              &gt;&gt;<br>
              &gt;&gt; Upstream-Status: Backport [<a href=3D"https://urld=
efense.com/v3/__https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb=
56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZ=
y2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat/=
avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://git=
hub.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237__;!=
!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHPlqjXgoU$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://git=
hub.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c__;!=
!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHPRzxTKP8$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://git=
hub.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09__;!=
!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHPwzmpbVo$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://git=
hub.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40__;!=
!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHPOROFOvo$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://git=
hub.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797__;!=
!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHPLLeXBTg$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797</a>]<br>
              &gt;&gt;<br>
              &gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto=
:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt; meta/recipes-connectivity/avahi/<a href=3D"https:/=
/urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisahL=
wBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">avahi_0.8.=
bb</a>&nbsp;
              |&nbsp; &nbsp;6 +<br>
              &gt;&gt; .../avahi/files/CVE-2023-38469-1.patch&nbsp; &nbsp=
; &nbsp; &nbsp; |&nbsp;
              47 ++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38469-2.patch&nbsp; &nbsp=
; &nbsp; &nbsp; |&nbsp;
              65 +++++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38470.patch&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp;
              56 +++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38471.patch&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp;
              72 ++++++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38472.patch&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp;
              47 ++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38473.patch&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |
              108 ++++++++++++++++++<br>
              &gt;&gt; 7 files changed, 401 insertions(+)<br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patc=
h<br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patc=
h<br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<=
br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<=
br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<=
br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<=
br>
              &gt;&gt;<br>
              &gt;&gt; diff --git a/meta/recipes-connectivity/avahi/<a hr=
ef=3D"https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO=
7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6O=
XVHPSo_Ck9E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">avahi_0.8.bb</a>
              b/meta/recipes-connectivity/avahi/<a href=3D"https://urldef=
ense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe7=
9g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">avahi_0.8.bb</a><=
br>
              &gt;&gt; index b5c966c102..772fb43939 100644<br>
              &gt;&gt; --- a/meta/recipes-connectivity/avahi/<a href=3D"h=
ttps://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeF=
hisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">avah=
i_0.8.bb</a><br>
              &gt;&gt; +++ b/meta/recipes-connectivity/avahi/<a href=3D"h=
ttps://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeF=
hisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">avah=
i_0.8.bb</a><br>
              &gt;&gt; @@ -26,6 +26,12 @@ SRC_URI =3D &quot;<a href=3D"ht=
tps://urldefense.com/v3/__https://github.com/lathiat/avahi/releases/downl=
oad/v$*7BPV*7D/avahi-$*7BPV*7D__;JSUlJQ!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZh=
Ge79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP0Am2ovI$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github=
.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}</a><br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-Fix-opening-etc-resolv.conf-error.patch">file://0001-Fix-opening-etc-re=
solv.conf-error.patch</a> \<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
class=3D"moz-txt-link-freetext" href=3D"file://handle-hup.patch">file://h=
andle-hup.patch</a> \<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
class=3D"moz-txt-link-freetext" href=3D"file://local-ping.patch">file://l=
ocal-ping.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38469-1.patch">file://=
CVE-2023-38469-1.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38469-2.patch">file://=
CVE-2023-38469-2.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38470.patch">file://CV=
E-2023-38470.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38471.patch">file://CV=
E-2023-38471.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38472.patch">file://CV=
E-2023-38472.patch</a> \<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=
=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-38473.patch">file://CV=
E-2023-38473.patch</a> \<br>
              &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&qu=
ot;<br>
              &gt;&gt;<br>
              &gt;&gt; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ur=
ldefense.com/v3/__https://github.com/lathiat/avahi/releases/__;!!AjveYdw8=
EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-=
9H_LG6OXVHP0Xuk60k$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">https://github.com/lathiat/avahi/releases/</a>&quot;<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.pa=
tch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..99c717daf3<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.pa=
tch<br>
              &gt;&gt; @@ -0,0 +1,47 @@<br>
              &gt;&gt; +From a337a1ba7d15853fb56deef1f464529af6e3a1cf
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:e=
vvers@ya.ru" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">evvers@ya.ru</a>&gt;<br>
              &gt;&gt; +Date: Mon, 23 Oct 2023 20:29:31 +0000<br>
              &gt;&gt; +Subject: [PATCH] core: reject overly long TXT
              resource records<br>
              &gt;&gt; +<br>
              &gt;&gt; +Closes <a href=3D"https://urldefense.com/v3/__htt=
ps://github.com/lathiat/avahi/issues/455__;!!AjveYdw8EvQ!YPO7NIVZeFhisahL=
wBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9siEVs$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://github.com/lathiat/avahi/issues/455</a><br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38469<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/a337a1ba7d15853f=
b56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38469<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-core/rr.c | 9 ++++++++-<br>
              &gt;&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<b=
r>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-core/rr.c b/avahi-core/rr.c<br=
>
              &gt;&gt; +index 2bb89244..9c04ebbd 100644<br>
              &gt;&gt; +--- a/avahi-core/rr.c<br>
              &gt;&gt; ++++ b/avahi-core/rr.c<br>
              &gt;&gt; +@@ -32,6 +32,7 @@<br>
              &gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
              &gt;&gt; + #include &lt;avahi-common/defs.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++#include &quot;dns.h&quot;<br>
              &gt;&gt; + #include &quot;rr.h&quot;<br>
              &gt;&gt; + #include &quot;log.h&quot;<br>
              &gt;&gt; + #include &quot;util.h&quot;<br>
              &gt;&gt; +@@ -689,11 +690,17 @@ int
              avahi_record_is_valid(AvahiRecord *r) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case AVAHI_DNS_=
TYPE_TXT: {<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;A=
vahiStringList *strlst;<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t=
 used =3D 0;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (s=
trlst =3D
              r-&gt;data.txt.string_list; strlst; strlst =3D
              strlst-&gt;next)<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (s=
trlst =3D
              r-&gt;data.txt.string_list; strlst; strlst =3D
              strlst-&gt;next) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;if (strlst-&gt;size &gt; 255 ||
              strlst-&gt;size &lt;=3D 0)<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; used +=3D 1+strlst-&gt;size;<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; if (used &gt;
              AVAHI_DNS_RDATA_MAX)<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; return 0;<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn 1;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.pa=
tch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..b83a70e29b<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.pa=
tch<br>
              &gt;&gt; @@ -0,0 +1,65 @@<br>
              &gt;&gt; +From c6cab87df290448a63323c8ca759baa516166237
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:e=
vvers@ya.ru" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">evvers@ya.ru</a>&gt;<br>
              &gt;&gt; +Date: Wed, 25 Oct 2023 18:15:42 +0000<br>
              &gt;&gt; +Subject: [PATCH] tests: pass overly long TXT
              resource records<br>
              &gt;&gt; +<br>
              &gt;&gt; +to make sure they don't crash avahi any more.<br>
              &gt;&gt; +<br>
              &gt;&gt; +It reproduces <a href=3D"https://urldefense.com/v=
3/__https://github.com/lathiat/avahi/issues/455__;!!AjveYdw8EvQ!YPO7NIVZe=
FhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9=
siEVs$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://github.com/lathiat/avahi/issues/455</a><br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/c6cab87df290448a=
63323c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/c6cab87df290448a63323c8ca759baa516166237</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38469<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-client/client-test.c | 14 ++++++++++++++<b=
r>
              &gt;&gt; + 1 file changed, 14 insertions(+)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-client/client-test.c
              b/avahi-client/client-test.c<br>
              &gt;&gt; +index 7d04a6a..66e3574 100644<br>
              &gt;&gt; +--- a/avahi-client/client-test.c<br>
              &gt;&gt; ++++ b/avahi-client/client-test.c<br>
              &gt;&gt; +@@ -22,6 +22,7 @@<br>
              &gt;&gt; + #endif<br>
              &gt;&gt; +<br>
              &gt;&gt; + #include &lt;stdio.h&gt;<br>
              &gt;&gt; ++#include &lt;string.h&gt;<br>
              &gt;&gt; + #include &lt;assert.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; + #include &lt;avahi-client/client.h&gt;<br>
              &gt;&gt; +@@ -33,6 +34,8 @@<br>
              &gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
              &gt;&gt; + #include &lt;avahi-common/timeval.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++#include &lt;avahi-core/dns.h&gt;<br>
              &gt;&gt; ++<br>
              &gt;&gt; + static const AvahiPoll *poll_api =3D NULL;<br>
              &gt;&gt; + static AvahiSimplePoll *simple_poll =3D NULL;<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;uint32_t cookie;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;struct timeval tv;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;AvahiAddress a;<br>
              &gt;&gt; ++&nbsp; &nbsp; uint8_t rdata[AVAHI_DNS_RDATA_MAX+=
1];<br>
              &gt;&gt; ++&nbsp; &nbsp; AvahiStringList *txt =3D NULL;<br>
              &gt;&gt; ++&nbsp; &nbsp; int r;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;simple_poll =3D avahi_simple_=
poll_new();<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;poll_api =3D
              avahi_simple_poll_get(simple_poll);<br>
              &gt;&gt; +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;printf(&quot;%s\n&quot;,
              avahi_strerror(avahi_entry_group_add_service (group,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;Lathiat's Sit=
e&quot;,
              &quot;_http._tcp&quot;, NULL, NULL, 80, &quot;foo=3Dbar&quo=
t;, NULL)));<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;printf(&quot;add_record: %d\n=
&quot;,
              avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
              AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120,
              &quot;\5booya&quot;, 6));<br>
              &gt;&gt; +<br>
              &gt;&gt; ++&nbsp; &nbsp; memset(rdata, 1, sizeof(rdata));<b=
r>
              &gt;&gt; ++&nbsp; &nbsp; r =3D avahi_string_list_parse(rdat=
a,
              sizeof(rdata), &amp;txt);<br>
              &gt;&gt; ++&nbsp; &nbsp; assert(r &gt;=3D 0);<br>
              &gt;&gt; ++&nbsp; &nbsp; assert(avahi_string_list_serialize=
(txt,
              NULL, 0) =3D=3D sizeof(rdata));<br>
              &gt;&gt; ++&nbsp; &nbsp; error =3D
              avahi_entry_group_add_service_strlst(group,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;,
              &quot;_qotd._tcp&quot;, NULL, NULL, 123, txt);<br>
              &gt;&gt; ++&nbsp; &nbsp; assert(error =3D=3D AVAHI_ERR_INVA=
LID_RECORD);<br>
              &gt;&gt; ++&nbsp; &nbsp; avahi_string_list_free(txt);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;avahi_entry_group_commit (gro=
up);<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;domain =3D avahi_domain_brows=
er_new (avahi,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
              AVAHI_DOMAIN_BROWSER_BROWSE, 0,
              avahi_domain_browser_callback, (char*) &quot;omghai3u&quot;=
);<br>
              &gt;&gt; +--<br>
              &gt;&gt; +2.25.1<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..1cbb00dcab<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,56 @@<br>
              &gt;&gt; +From 94cb6489114636940ac683515417990b55b5d66c
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DA=
Dk?=3D &lt;<a href=3D"mailto:pemensik@redhat.com" target=3D"_blank" moz-d=
o-not-send=3D"true" class=3D"moz-txt-link-freetext">pemensik@redhat.com</=
a>&gt;<br>
              &gt;&gt; +Date: Tue, 11 Apr 2023 15:29:59 +0200<br>
              &gt;&gt; +Subject: [PATCH] Ensure each label is at least
              one byte long<br>
              &gt;&gt; +<br>
              &gt;&gt; +The only allowed exception is single dot, where
              it should return empty<br>
              &gt;&gt; +string.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #454.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/94cb648911463694=
0ac683515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/94cb6489114636940ac683515417990b55b5d66c</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38470<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-common/domain-test.c | 14 ++++++++++++++<b=
r>
              &gt;&gt; + avahi-common/domain.c&nbsp; &nbsp; &nbsp; |&nbsp=
; 2 +-<br>
              &gt;&gt; + 2 files changed, 15 insertions(+), 1
              deletion(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/domain-test.c
              b/avahi-common/domain-test.c<br>
              &gt;&gt; +index cf763eca6..3acc1c1e4 100644<br>
              &gt;&gt; +--- a/avahi-common/domain-test.c<br>
              &gt;&gt; ++++ b/avahi-common/domain-test.c<br>
              &gt;&gt; +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int
              argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;printf(&quot;%s\n&quot;, s =3D
              avahi_normalize_name_strdup(&quot;fo\\\\o\\..f oo.&quot;));=
<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;avahi_free(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; ++&nbsp; &nbsp; printf(&quot;%s\n&quot;, s =3D
              avahi_normalize_name_strdup(&quot;.&quot;));<br>
              &gt;&gt; ++&nbsp; &nbsp; avahi_free(s);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++&nbsp; &nbsp; s =3D
              avahi_normalize_name_strdup(&quot;,.=3D.}.=3D.?-.}.=3D.?.?.=
}.}.?.?.?.z.?.?.}.}.&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}=
.}.?.?.}.}.}&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.=
}.?.?.?.zM.?`&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??=
.}.}.?.?.&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?=
`?.}.}.}.&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D=
.?.?.}?&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.=
?.?.?.zM.&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp;
              &quot;?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?=
.}.=3D.?.?.&quot;<br>
              &gt;&gt; ++&nbsp; &nbsp; &quot;}.?.?.?.}.=3D.?.?.}&quot;);<=
br>
              &gt;&gt; ++&nbsp; &nbsp; assert(s =3D=3D NULL);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;printf(&quot;%i\n&quot;, avah=
i_domain_equal(&quot;\\065aa
              bbb\\.\\046cc.cc\\\\.dee.fff.&quot;, &quot;Aaa
              BBB\\.\\.cc.cc\\\\.dee.fff&quot;));<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;printf(&quot;%i\n&quot;, avah=
i_domain_equal(&quot;A&quot;,
              &quot;a&quot;));<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/domain.c
              b/avahi-common/domain.c<br>
              &gt;&gt; +index 3b1ab6834..e66d2416c 100644<br>
              &gt;&gt; +--- a/avahi-common/domain.c<br>
              &gt;&gt; ++++ b/avahi-common/domain.c<br>
              &gt;&gt; +@@ -201,7 +201,7 @@ char
              *avahi_normalize_name(const char *s, char *ret_s, size_t
              size) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!empty) {<b=
r>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (si=
ze &lt; 1)<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (si=
ze &lt; 2)<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*=
(r++) =3D '.';<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..8242646da1<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,72 @@<br>
              &gt;&gt; +From 894f085f402e023a98cbb6f5a3d117bd88d93b09
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekl=
eta@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Mon, 23 Oct 2023 13:38:35 +0200<br>
              &gt;&gt; +Subject: [PATCH] core: extract host name using
              avahi_unescape_label()<br>
              &gt;&gt; +<br>
              &gt;&gt; +Previously we could create invalid escape
              sequence when we split the<br>
              &gt;&gt; +string on dot. For example, from valid host name
              &quot;foo\\.bar&quot; we have<br>
              &gt;&gt; +created invalid name &quot;foo\\&quot; and tried =
to set
              that as the host name<br>
              &gt;&gt; +which crashed the daemon.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #453<br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38471<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/894f085f402e023a=
98cbb6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38471<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-core/server.c | 27
              +++++++++++++++++++++------<br>
              &gt;&gt; + 1 file changed, 21 insertions(+), 6
              deletions(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-core/server.c
              b/avahi-core/server.c<br>
              &gt;&gt; +index c32637af8..f6a21bb77 100644<br>
              &gt;&gt; +--- a/avahi-core/server.c<br>
              &gt;&gt; ++++ b/avahi-core/server.c<br>
              &gt;&gt; +@@ -1295,7 +1295,11 @@ static void
              update_fqdn(AvahiServer *s) {<br>
              &gt;&gt; + }<br>
              &gt;&gt; +<br>
              &gt;&gt; + int avahi_server_set_host_name(AvahiServer *s,
              const char *host_name) {<br>
              &gt;&gt; +-&nbsp; &nbsp; char *hn =3D NULL;<br>
              &gt;&gt; ++&nbsp; &nbsp; char label_escaped[AVAHI_LABEL_MAX=
*4+1];<br>
              &gt;&gt; ++&nbsp; &nbsp; char label[AVAHI_LABEL_MAX];<br>
              &gt;&gt; ++&nbsp; &nbsp; char *hn =3D NULL, *h;<br>
              &gt;&gt; ++&nbsp; &nbsp; size_t len;<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;assert(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;AVAHI_CHECK_VALIDITY(s, !host=
_name ||
              avahi_is_valid_host_name(host_name),
              AVAHI_ERR_INVALID_HOST_NAME);<br>
              &gt;&gt; +@@ -1305,17 +1309,28 @@ int
              avahi_server_set_host_name(AvahiServer *s, const char
              *host_name) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;else<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hn =3D
              avahi_normalize_name_strdup(host_name);<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; hn[strcspn(hn, &quot;.&quot;)] =3D=
 0;<br>
              &gt;&gt; ++&nbsp; &nbsp; h =3D hn;<br>
              &gt;&gt; ++&nbsp; &nbsp; if (!avahi_unescape_label((const c=
har
              **)&amp;hn, label, sizeof(label))) {<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; avahi_free(h);<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; return AVAHI_ERR_INV=
ALID_HOST_NAME;<br>
              &gt;&gt; ++&nbsp; &nbsp; }<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++&nbsp; &nbsp; avahi_free(h);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++&nbsp; &nbsp; h =3D label_escaped;<br>
              &gt;&gt; ++&nbsp; &nbsp; len =3D sizeof(label_escaped);<br>
              &gt;&gt; ++&nbsp; &nbsp; if (!avahi_escape_label(label,
              strlen(label), &amp;h, &amp;len))<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; return AVAHI_ERR_INV=
ALID_HOST_NAME;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; if (avahi_domain_equal(s-&gt;host_=
name, hn)
              &amp;&amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION) {<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; avahi_free(hn);<br>
              &gt;&gt; ++&nbsp; &nbsp; if (avahi_domain_equal(s-&gt;host_=
name,
              label_escaped) &amp;&amp; s-&gt;state !=3D
              AVAHI_SERVER_COLLISION)<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return avahi_se=
rver_set_errno(s,
              AVAHI_ERR_NO_CHANGE);<br>
              &gt;&gt; +-&nbsp; &nbsp; }<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;withdraw_host_rrs(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;avahi_free(s-&gt;host_name);<=
br>
              &gt;&gt; +-&nbsp; &nbsp; s-&gt;host_name =3D hn;<br>
              &gt;&gt; ++&nbsp; &nbsp; s-&gt;host_name =3D
              avahi_strdup(label_escaped);<br>
              &gt;&gt; ++&nbsp; &nbsp; if (!s-&gt;host_name)<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; return AVAHI_ERR_NO_=
MEMORY;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;update_fqdn(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..43b26c1132<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,47 @@<br>
              &gt;&gt; +From b024ae5749f4aeba03478e6391687c3c9c8dee40
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekl=
eta@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Thu, 19 Oct 2023 17:36:44 +0200<br>
              &gt;&gt; +Subject: [PATCH] core: make sure there is rdata
              to process before parsing it<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #452<br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38472<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/b024ae5749f4aeba=
03478e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38472<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-client/client-test.c&nbsp; &nbsp; &nbsp; |=
 3 +++<br>
              &gt;&gt; + avahi-daemon/dbus-entry-group.c | 2 +-<br>
              &gt;&gt; + 2 files changed, 4 insertions(+), 1 deletion(-)<=
br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-client/client-test.c
              b/avahi-client/client-test.c<br>
              &gt;&gt; +index 66e3574..9a015d7 100644<br>
              &gt;&gt; +--- a/avahi-client/client-test.c<br>
              &gt;&gt; ++++ b/avahi-client/client-test.c<br>
              &gt;&gt; +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;assert(error =3D=3D AVAHI_ERR=
_INVALID_RECORD);<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;avahi_string_list_free(txt);<=
br>
              &gt;&gt; +<br>
              &gt;&gt; ++&nbsp; &nbsp; error =3D avahi_entry_group_add_re=
cord
              (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX=
&quot;,
              0x01, 0x10, 120, &quot;&quot;, 0);<br>
              &gt;&gt; ++&nbsp; &nbsp; assert(error !=3D AVAHI_OK);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;avahi_entry_group_commit (gro=
up);<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;domain =3D avahi_domain_brows=
er_new (avahi,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
              AVAHI_DOMAIN_BROWSER_BROWSE, 0,
              avahi_domain_browser_callback, (char*) &quot;omghai3u&quot;=
);<br>
              &gt;&gt; +diff --git a/avahi-daemon/dbus-entry-group.c
              b/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; +index 4e879a5..aa23d4b 100644<br>
              &gt;&gt; +--- a/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; ++++ b/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; +@@ -340,7 +340,7 @@ DBusHandlerResult
              avahi_dbus_msg_entry_group_impl(DBusConnection *c,
              DBusMessage<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!(r =3D ava=
hi_record_new_full (name,
              clazz, type, ttl)))<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn avahi_dbus_respond_error(c,
              m, AVAHI_ERR_NO_MEMORY, NULL);<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; if (avahi_rdata_pars=
e (r, rdata, size)
              &lt; 0) {<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (!rdata || avahi_=
rdata_parse (r,
              rdata, size) &lt; 0) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a=
vahi_record_unref (r);<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn avahi_dbus_respond_error(c,
              m, AVAHI_ERR_INVALID_RDATA, NULL);<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; +--<br>
              &gt;&gt; +2.25.1<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..7b33d564f8<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,108 @@<br>
              &gt;&gt; +From b448c9f771bada14ae8de175695a9729f8646797
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekl=
eta@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Wed, 11 Oct 2023 17:45:44 +0200<br>
              &gt;&gt; +Subject: [PATCH] common: derive alternative host
              name from its unescaped<br>
              &gt;&gt; + version<br>
              &gt;&gt; +<br>
              &gt;&gt; +Normalization of input makes sure we don't have
              to deal with special<br>
              &gt;&gt; +cases like unescaped dot at the end of label.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #451 #487<br>
              &gt;&gt; +CVE-2023-38473<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://url=
defense.com/v3/__https://github.com/lathiat/avahi/commit/b448c9f771bada14=
ae8de175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1x=
Zy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/lathiat=
/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38473<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-common/alternative-test.c |&nbsp; 3 +++<br=
>
              &gt;&gt; + avahi-common/alternative.c&nbsp; &nbsp; &nbsp; |=
 27
              +++++++++++++++++++--------<br>
              &gt;&gt; + 2 files changed, 22 insertions(+), 8
              deletions(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/alternative-test.c
              b/avahi-common/alternative-test.c<br>
              &gt;&gt; +index 9255435ec..681fc15b8 100644<br>
              &gt;&gt; +--- a/avahi-common/alternative-test.c<br>
              &gt;&gt; ++++ b/avahi-common/alternative-test.c<br>
              &gt;&gt; +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int
              argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;const char* const test_string=
s[] =3D {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXX&quot;,<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XX=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC&quot;,<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;).&quot;,<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;\\.&quot;,<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp;
              &quot;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAA\\\\&quot;,<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;gurke&quo=
t;,<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;-&quot;,<=
br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot; #&quot;,=
<br>
              &gt;&gt; +diff --git a/avahi-common/alternative.c
              b/avahi-common/alternative.c<br>
              &gt;&gt; +index b3d39f0ed..a094e6d76 100644<br>
              &gt;&gt; +--- a/avahi-common/alternative.c<br>
              &gt;&gt; ++++ b/avahi-common/alternative.c<br>
              &gt;&gt; +@@ -49,15 +49,20 @@ static void
              drop_incomplete_utf8(char *c) {<br>
              &gt;&gt; + }<br>
              &gt;&gt; +<br>
              &gt;&gt; + char *avahi_alternative_host_name(const char
              *s) {<br>
              &gt;&gt; ++&nbsp; &nbsp; char label[AVAHI_LABEL_MAX],
              alternative[AVAHI_LABEL_MAX*4+1];<br>
              &gt;&gt; ++&nbsp; &nbsp; char *alt, *r, *ret;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;const char *e;<br>
              &gt;&gt; +-&nbsp; &nbsp; char *r;<br>
              &gt;&gt; ++&nbsp; &nbsp; size_t len;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;assert(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;if (!avahi_is_valid_host_name=
(s))<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return NULL;<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; if ((e =3D strrchr(s, '-'))) {<br>
              &gt;&gt; ++&nbsp; &nbsp; if (!avahi_unescape_label(&amp;s, =
label,
              sizeof(label)))<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; return NULL;<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++&nbsp; &nbsp; if ((e =3D strrchr(label, '-'))) {=
<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const char *p;<=
br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e++;<br>
              &gt;&gt; +@@ -74,19 +79,18 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;if (e) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *c, *m;<br=
>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; size_t l;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int n;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;n =3D atoi(e)+1=
;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!(m =3D ava=
hi_strdup_printf(&quot;%i&quot;,
              n)))<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; l =3D e-s-1;<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; len =3D e-label-1;<b=
r>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; if (l &gt;=3D
              AVAHI_LABEL_MAX-1-strlen(m)-1)<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; l =3D =
AVAHI_LABEL_MAX-1-strlen(m)-1;<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (len &gt;=3D
              AVAHI_LABEL_MAX-1-strlen(m)-1)<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; len =3D
              AVAHI_LABEL_MAX-1-strlen(m)-1;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; if (!(c =3D avahi_st=
rndup(s, l))) {<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (!(c =3D avahi_st=
rndup(label, len))) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a=
vahi_free(m);<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn NULL;<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; +@@ -100,7 +104,7 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;} else {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *c;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-&nbsp; &nbsp; &nbsp; &nbsp; if (!(c =3D avahi_st=
rndup(s,
              AVAHI_LABEL_MAX-1-2)))<br>
              &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (!(c =3D avahi_st=
rndup(label,
              AVAHI_LABEL_MAX-1-2)))<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drop_incomplete=
_utf8(c);<br>
              &gt;&gt; +@@ -109,6 +113,13 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;avahi_free(c);<=
br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
              &gt;&gt; +<br>
              &gt;&gt; ++&nbsp; &nbsp; alt =3D alternative;<br>
              &gt;&gt; ++&nbsp; &nbsp; len =3D sizeof(alternative);<br>
              &gt;&gt; ++&nbsp; &nbsp; ret =3D avahi_escape_label(r, strl=
en(r),
              &amp;alt, &amp;len);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++&nbsp; &nbsp; avahi_free(r);<br>
              &gt;&gt; ++&nbsp; &nbsp; r =3D avahi_strdup(ret);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;assert(avahi_is_valid_host_na=
me(r));<br>
              &gt;&gt; +<br>
              &gt;&gt; +&nbsp; &nbsp; &nbsp;return r;<br>
              &gt;&gt; -- <br>
              &gt;&gt; 2.25.1<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;<br>
              &gt; <br>
              &gt;<br>
              <br>
              -- <br>
              Jeremy Puhlman<br>
              <a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">jpuhlman@mvista.co=
m</a><br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#190851): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/190851">https:/=
/lists.openembedded.org/g/openembedded-core/message/190851</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/102621335/3616765">https://lists.openembedded.org/mt=
/102621335/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------TKx2T107ytvgYjb9PLTjKca4--

