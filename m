Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A6C48260
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 00:46:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.848.1707439559083694433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 16:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=plgSeJKQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=276984c5ba=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4188uThD013102
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Feb 2024 00:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=1i61nTnDlL9/6PsO5N2
	cWZcB8oIo1hOCkcQepS+V6tg=; b=plgSeJKQSJWv3eBnHJionZ5n7aOgI7XmYi2
	JTN9dGNKsqba+G/+yJRnZsj4mm+ToJsFwkxM7rFD7CT60z/WLx+/Kd6USGgsJGHe
	M+0Y9ggIbSv3dVMp805pdd1fRU1dUAvXu8WFKxPraowXuNjt5DQO5VhS0Hv4KozS
	1FiC09wjxtM7OXMnIOz+qolu++u7eBtKacRxDkx+Cq6Fj8LP41vNR5Cm5N0f7AC7
	WfQ7a8DuIueWkVGCUFMGmfgQDr8a4cOwgJicVcthKy2h66pCFaoPcSzq3Hg+FHig
	4ULPoVsKQW5m6Yx/fKhMNaGoYB774dfHjWHaCOXLnV/EigiJblQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0nrdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 00:45:57 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4190jvgR002893;
	Fri, 9 Feb 2024 00:45:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0nrdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 00:45:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp9hk+4gPuzsCZGo+rxMxVJDJ+sI7nCVlsmHislqPgOyJhWKGLqjj1xfV4xjU3Nz+2oOWtyGXHBR+kgmm71YH++HT8dcXB5KprHGR7MxJw5WHIpbfs0iLB+vTwtjKHjCLcR+nd59ayo4BFJubFT62OgiScICPT/hb5nA1n7bHnlGLOG+Y3SPXrLhsgnUO5+gbPLk7R672visWdtL5KEz6ev64BJhfxlhNiw523AW4JlcWLIMwGC/Mg8m3BnV7y+br+0H9Fs5jwPFR+vBNkw89SY0L75oM08acu6aE1ySNd3u/+eiPhPY9UZ3kwG6d2m7w5nA26A59fG6okzNXbl2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i61nTnDlL9/6PsO5N2cWZcB8oIo1hOCkcQepS+V6tg=;
 b=gY80H8y2R2ZjR5vPLwL185yub36ZneaVdLjAq4NK8/iHM+Zsw6sF7xkEAvaTwg74SzmaLup4aJLTDz4g8XZghyb/ieUoWlVo4qblJlJe9sMO4f3y/u779DZXwbdhHpThFVIVqqHy8NpIDXx1azfrXvg+UHk7eVOnn3ahs77NntAyOVj+nxgrasOax3qanokrJYF2kY2OcALCq8qSkYc5ero7NBLmFdnh7L5Q+qQ4QgOZvg9DTXCGASZwSY3AICPaUvpGVc25Gnya9aITaC+YSMo3vmuc6SdYalmcA5tYehGF+AlgDov2wye8ftM3fCMhDPXvdjXxmnT/rkoR1RFU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Fri, 9 Feb
 2024 00:45:54 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 00:45:54 +0000
Content-Type: multipart/alternative;
 boundary="------------UaJGb7Nc3ZAjceRl99ShutUf"
Message-ID: <55fa276d-e6e2-4cc1-b4fa-660356889665@windriver.com>
Date: Thu, 8 Feb 2024 19:45:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rng-tools: move to meta-oe
Content-Language: en-CA
To: Scott Murray <scott.murray@konsulko.com>
Cc: alexandre.belloni@bootlin.com, stephane.desneux@iot.bzh,
        jsmoeller@linuxfoundation.org,
        openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
        david.zuhn@sonos.com
References: <20240110202501.1554379-1-Randy.MacLeod@windriver.com>
 <20240115165859d332c9cb@mail.local>
 <cfa90344-0753-4ae1-9979-2c0f12a33d50@windriver.com>
 <b8554634-5da9-9872-660a-5e94a62c765e@konsulko.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <b8554634-5da9-9872-660a-5e94a62c765e@konsulko.com>
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: fd39a8d5-9432-4be1-85bc-08dc290878b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W0BaG7JJ48iGBt1/7gzL7I6p8BZqIKjvkhIJNlgUUF502eOU/RfzpqoXCFLOmDqDsceIz/DiL80Nx+MTimiqeJLooQvIw0QVIdqx7b1Js7v/kDEY4JwewEJe+R8EaiJJxnb3WPgR2Bo2YT9Cy8wMTUuV98jUT5Kl/TrrGWMFz/w6A2MWAaAduS1X0YSsgNCJpB8LY5cUHLLLjN5INmD2oUFVHDVZVOhOO5l2FWA124HkN/84h0WXIzVQvWQ7rQOeVi+jmFb7/mhI2cSncJf+z8r0IpdC0MgRWdRbaD7ZOdLgCY5hF9SZurcX9yzczGhzDb3sZ++1M7vVwJ0oqHAslcspBKLMomiVDKiOo7BzrGFxOl+cZR9l7s5cpRLnhyA8mA1yqtdxEaYi3t4tUzUtf4lCpp4HTcOXmFLl7QAUAxzg0C6jTLDLKReYMz7JlRL5/02Mct7gHCMtGPBVcBEICDX2ARO2BeHlLv0EHmd0YDa0Q8BaAEQc+O+WGiINI4zV3R+jLJLNv4mBAI5MM0UFvhT9NYQYqCYXrJBbUs7PymDCVaj9ChGILrjk6PN6Jj6xNBaMRooPmOBdLIrOtvfkdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(136003)(376002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(5660300002)(31686004)(83380400001)(31696002)(41300700001)(86362001)(2616005)(26005)(38100700002)(66946007)(53546011)(6666004)(8676002)(36756003)(66476007)(166002)(966005)(6506007)(478600001)(6486002)(8936002)(6916009)(66556008)(6512007)(33964004)(4326008)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OE1UQWNnd01EMmZMMzRuVEp1a1JKbWVzVUZ4UktiSHROcS9nL2hIcXlra3Mv?=
 =?utf-8?B?c2U2R2JVSllpVzJsTjE5UWtpOFgyT0VkTFZOalBJNGlNZ2Q4SHlVNHB1UGgw?=
 =?utf-8?B?eDNwdHc2Z3ZrelhDb1cvdGVjeldVQlo4d0xkNWwvVlcrZXduejludUkxNGo1?=
 =?utf-8?B?Ykhhd0cxQ0ZRS1V6d3J4aWNUWWlQMUJhWk5icTVZZEIwcDY0RURubHpLdG5B?=
 =?utf-8?B?ZXQ3Sy9EVVd5M1cxNXd5Y0xtbDMwTG1pV2lQeGxKdzdvVzdhZEluWkt1Tzlx?=
 =?utf-8?B?VG9pbDNseER0TnJoSmc4QS84QzhpUGQwbHIxYzhhMm9jTkZIMDVxYWZQbng5?=
 =?utf-8?B?bHVQRmE4RVhVUVpDaC9iVzloL0NsSVhYeFhuUURPWVlLNnUxemkzUjZteUNB?=
 =?utf-8?B?aXRTRm5XdGM3bGFidUtFZm1vVkhnMEFSaE9KQnhSQmpCYmhFQVRRcUhvS0lE?=
 =?utf-8?B?WmFiUTFlRzc1RHlZM1Z6OG1zcWh4V2EzRHpLUzdLckZWaFJkckxSVEtHNnRU?=
 =?utf-8?B?c0RoQVo0eW9iVGM0VlRxaGNVYVZqZkNEb2xNTWRrK0h6VGZ6eDBncWw2WmVK?=
 =?utf-8?B?SEoyby9qdGJ0OFZaZS9LTjhDNkxSQk9HMGdRZktFTUhLZklBRWNQc2R6Z0dW?=
 =?utf-8?B?WW1PYVRsemtXM1JjcVU5akxFQnQzZ05OV2poYUFVMHA4Qjh4WWgwalM0UTdx?=
 =?utf-8?B?MW9JRm9DMzVQWVU1Q2xmN1RlSHdacDIrSG5qNzBmSGY1dFZQWWZYMlVOS092?=
 =?utf-8?B?YzdJdVkyTkJGb0RRRHNmb051S0Fad3A3ZnNwcm9LWVVTUC9lR3FrWXV5UlpS?=
 =?utf-8?B?TWxWRDYxa1NrRmkwRjU5TXFGU3VodkJBVFB0QmJrUncwZEdjUkFEVlhmWXps?=
 =?utf-8?B?b0RYNGlUcUdOSWNLVkNVQkJUSUlHZWs2ZUQvQ2dIRUJ1cHRmUHU4MGpoOVhR?=
 =?utf-8?B?RXBMYmNRN28yTGRRWnIvZExXdEsxdmd3c0NuUWxEMWYxQU8rdFhJajdCVmdr?=
 =?utf-8?B?SEhLamJkZU50dm5LNGNJQ1haa0JSUmdreDNXYWVxeEZOOUlmeTEwZnJlVjl3?=
 =?utf-8?B?OTI2eXNuWXBuTWdHSTZkODlIVTdNTVcvUHdmbHJEQ01pV25SU0hjWDV5bHQr?=
 =?utf-8?B?VGc4VnRzek01SUZiOFBnVXVPMUYvR1dobUVkNzJXWm1OYzBUSHh5TFFTaXRG?=
 =?utf-8?B?ZDNKaHFER0NTMUNBck9vb2FmSkJYZTZzS1psNzdpVXMwTWlXUkFoejVjYVZ5?=
 =?utf-8?B?TDFXUE5SdDc3KzZBdkhQZnlJdHZ0VmNsdzBteDU3Z1dKVXRKbXZlcFBjTmxY?=
 =?utf-8?B?UkU3dkxxWmhFSTlYUEpwcCsrSlh2KzZ2dDk1QjExdnFhdG14VTlMbkYxL2ti?=
 =?utf-8?B?MXgvOWFZOHNVQWt4WE5vUSs0NUF2NlNmT3MzU2d4VWV5T2dadzl2S0xWbUI4?=
 =?utf-8?B?TDV1bUd4MnJ2WGxzVEl0ZE8vd3Y5OG1oS2JHTkFmUnMzMklDdjdGeFJUSmdZ?=
 =?utf-8?B?bFdmYmlpaW5YWEoybXNqN0hOV1VVRWpsRWJ2c29zbExXeWVxT2lOc28zYnNI?=
 =?utf-8?B?ZG9PUmZzRTJoK0Z1UjVmaVQvTjJJdzEyRlE0T1cvMXgxcStZTnorSTFjek1L?=
 =?utf-8?B?S05tV1V0Qi9uR29NSnFwMjQ2TUZsUEQ5eHJlc2RhNXFOcFlQRFc0MkZYeWFi?=
 =?utf-8?B?a0Y4dmNFbDFsVUNBVjFvaHp1VmRoVFpCeHZDRnF4cGloempIM3VUOGpQM0F5?=
 =?utf-8?B?SG1BZ1lYcnJRZE9RK2daNkh4WFBWY3prSnJONHB5ei9lTnVFY0hubkxUZ0x4?=
 =?utf-8?B?QmNhaFNVTmZ0VTJ6bS9HR3VZSXNWdy96aWhHUlI5MmxmK2xGOFg0Vy82dnpW?=
 =?utf-8?B?U2NIN3h2SDdldVcwaDEySkU1NVo1OXdCemRBYjhuQlVJazFzdFF6THh5dDJT?=
 =?utf-8?B?aW53aVh4VmFXMEd4ZytZQ0k4NGlGZVByaU5rR1JDTU5uWnNldmpTcDVTWjFE?=
 =?utf-8?B?b1VLZjhaOVlnd1Rma2daVFB5VmxBeTlOenJLZXRTRDROWHFGU0x1aGtqL3pr?=
 =?utf-8?B?U0xzTnE2VFlhK3RCZ1pabHROc2xzV3FOQWdTTFBpc3BDRVVraGtKc2YrWXVl?=
 =?utf-8?B?b0hnN3A4L0FIVFNtZ25Zc0w5b0dRengxT2ZwOWx2dWluWGRPTzg3VjRQSnhC?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd39a8d5-9432-4be1-85bc-08dc290878b4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 00:45:54.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 955+iVxDWigeq7XbtyeP4Gwp6NMYAjQaeh0PQhJcQpnhm8rLFVs4gT+x77tjV3QVC7Ha09a6guaUWlxHOKBwR/RvsWXb5kI0d4eBDTjrf7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
X-Proofpoint-ORIG-GUID: NhlA-3pd3K5sZX0EWrWaNqowJz5SqE0J
X-Proofpoint-GUID: TSNw9fZCbR3Rre6SA_4ErYhu9Ib3MtFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_13,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402090003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195181

--------------UaJGb7Nc3ZAjceRl99ShutUf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4188uThD013102

On 2024-01-15 4:50 p.m., Scott Murray wrote:
> On Mon, 15 Jan 2024, Randy MacLeod via lists.openembedded.org wrote:
>
>> On 2024-01-15 11:58 a.m., Alexandre Belloni via lists.openembedded.org=
 wrote:
>>> This is breaking meta-agl-core until this gets into meta-oe:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/38=
49/steps/14/logs/stdio
>> Thanks Alexandre.
>>
>>
>> Stephane, Jan-Simon,
>>
>> Is rng-tools actually still a requirement for meta-agl ?
>> It was added back in 2018 but the kernel algorithm improved as of 5.6:
>> https://lists.openembedded.org/g/openembedded-core/message/178518
> The kernel no longer blocking does mean things won't get stuck on boot,
> but it seems like any distro with an eye towards security still needs
> either rngd or haveged present to feed in entropy on hardware that does
> not have a hardware RNG (and potentially even when there is a hardware
> RNG to improve the quality of the pool).  We definitely support some
> platforms in AGL that do not have a hardware RNG, so we'll have to work
> out whether we're going to need to eat making meta-oe a hard requiremen=
t
> for using meta-agl-core or do something else.

For anyone who missed it...

We restored rng-tools in oe-core as described here:
https://git.openembedded.org/openembedded-core/commit/?id=3D828afafb3bff5=
4079fcba9bdab2ec87ac13e4ce6


Scott,

Any news on a qemu/HW boot test case?

Testing randomness is a little different as described in my notes below.
If anyone has some expertise in this area, please help!


There are a few tests in rng-tools, that could be wrapped in ptest:
=E2=9D=AF ls tests/
Makefile.am=C2=A0 rngtestjitter.sh=C2=A0 rngtesturandom.sh=C2=A0 rngtestz=
ero.sh

I haven't played with rngtest much but I was wondering how we'd even=20
construct a test of randomness that would *always* pass.

The example below shows that if you run runtest with a blockcount of=20
10,000, and do that 10 times, you get failures some of the time:

=E2=9D=AF for i in `seq 10`; do cat /dev/urandom | rngtest -c 10000 --pip=
e 2>&1=20
 >/dev/null |rg failures; done
rngtest: FIPS 140-2 failures: 6
rngtest: FIPS 140-2 failures: 5
rngtest: FIPS 140-2 failures: 9
rngtest: FIPS 140-2 failures: 4
rngtest: FIPS 140-2 failures: 6
rngtest: FIPS 140-2 failures: 8
rngtest: FIPS 140-2 failures: 9
rngtest: FIPS 140-2 failures: 11
rngtest: FIPS 140-2 failures: 9
rngtest: FIPS 140-2 failures: 5


We could say that we accept up to 20 failures but even then, there would=20
be a chance that the YP AB would
occasionally see that fail due the the inherit randomness being tested.

If I run the test 1000 times=C2=A0 you can see that on my laptop (6.6.10)=
, 20=20
failures never happens:
=E2=9D=AF cut -d":" -f3 /tmp/rt.log | sort -n | uniq -c
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0 1
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7=C2=A0 2
 =C2=A0=C2=A0=C2=A0=C2=A0 34=C2=A0 3
 =C2=A0=C2=A0=C2=A0=C2=A0 54=C2=A0 4
 =C2=A0=C2=A0=C2=A0 101=C2=A0 5
 =C2=A0=C2=A0=C2=A0 131=C2=A0 6
 =C2=A0=C2=A0=C2=A0 138=C2=A0 7
 =C2=A0=C2=A0=C2=A0 124=C2=A0 8
 =C2=A0=C2=A0=C2=A0 114=C2=A0 9
 =C2=A0=C2=A0=C2=A0 101=C2=A0 10
 =C2=A0=C2=A0=C2=A0=C2=A0 75=C2=A0 11
 =C2=A0=C2=A0=C2=A0=C2=A0 48=C2=A0 12
 =C2=A0=C2=A0=C2=A0=C2=A0 36=C2=A0 13
 =C2=A0=C2=A0=C2=A0=C2=A0 16=C2=A0 14
 =C2=A0=C2=A0=C2=A0=C2=A0 10=C2=A0 15
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6=C2=A0 16
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0 17
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0 19

and on an older headless server running 5.15 with fewer process and=20
likely less entropy available:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0 1
 =C2=A0=C2=A0=C2=A0=C2=A0 12=C2=A0 2
 =C2=A0=C2=A0=C2=A0=C2=A0 29=C2=A0 3
 =C2=A0=C2=A0=C2=A0=C2=A0 60=C2=A0 4
 =C2=A0=C2=A0=C2=A0=C2=A0 95=C2=A0 5
 =C2=A0=C2=A0=C2=A0 117=C2=A0 6
 =C2=A0=C2=A0=C2=A0 133=C2=A0 7
 =C2=A0=C2=A0=C2=A0 121=C2=A0 8
 =C2=A0=C2=A0=C2=A0 139=C2=A0 9
 =C2=A0=C2=A0=C2=A0=C2=A0 99=C2=A0 10
 =C2=A0=C2=A0=C2=A0=C2=A0 81=C2=A0 11
 =C2=A0=C2=A0=C2=A0=C2=A0 50=C2=A0 12
 =C2=A0=C2=A0=C2=A0=C2=A0 28=C2=A0 13
 =C2=A0=C2=A0=C2=A0=C2=A0 14=C2=A0 14
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9=C2=A0 15
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5=C2=A0 16
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4=C2=A0 17
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0 20


I guess we could raise the limit to ~30 (42!) and failures would be=20
extremely unlikely.

We would have a similar problem with measuring the boot time that is=20
dependent on the entropy pool not being depleted
since we can't completely rule out a boot sequence taking 3x as long as=20
the average time
and it would be worse in qemu given that it's competing with other=20
processes on the YP AB machines!

../Randy "It's a good day because I made some graphs to understand a=20
problem."=C2=A0 MacLeod



>
> Scott
>

--=20
# Randy MacLeod
# Wind River Linux

--------------UaJGb7Nc3ZAjceRl99ShutUf
Content-Type: multipart/related;
 boundary="------------4l6o9X2zhzFKDXhfkuTOcqaq"

--------------4l6o9X2zhzFKDXhfkuTOcqaq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4188uThD013102

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-01-15 4:50 p.m., Scott Murray
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b8554634-5da9-9872-660a-5e94a62=
c765e@konsulko.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 15 Jan 2024, Randy M=
acLeod via lists.openembedded.org wrote:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 2024-01-15 11:58 a.m., =
Alexandre Belloni via lists.openembedded.org wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">This is breaking meta-ag=
l-core until this gets into meta-oe:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/120/builds/3849/steps/14/logs/stdio">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3849/steps/14/lo=
gs/stdio</a>
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Thanks Alexandre.


Stephane, Jan-Simon,

Is rng-tools actually still a requirement for meta-agl ?
It was added back in 2018 but the kernel algorithm improved as of 5.6:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178518">https://lists.openembedded.org/g/ope=
nembedded-core/message/178518</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">The kernel no longer blockin=
g does mean things won't get stuck on boot,
but it seems like any distro with an eye towards security still needs
either rngd or haveged present to feed in entropy on hardware that does
not have a hardware RNG (and potentially even when there is a hardware
RNG to improve the quality of the pool).  We definitely support some
platforms in AGL that do not have a hardware RNG, so we'll have to work
out whether we're going to need to eat making meta-oe a hard requirement
for using meta-agl-core or do something else.</pre>
    </blockquote>
    <p>For anyone who missed it...<br>
    </p>
    <p>We restored rng-tools in oe-core as described here:<br>
      &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/commit/?id=3D828afafb3bff54079fcba9bdab2ec87ac13e4ce6">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3D828afafb3bff54=
079fcba9bdab2ec87ac13e4ce6</a><br>
    </p>
    <p><br>
    </p>
    <p>Scott,</p>
    <p>Any news on a qemu/HW boot test case?</p>
    <p>Testing randomness is a little different as described in my notes
      below.<br>
      If anyone has some expertise in this area, please help!</p>
    <p><br>
    </p>
    <p>There are a few tests in rng-tools, that could be wrapped in
      ptest:<br>
      =E2=9D=AF ls tests/<br>
      Makefile.am&nbsp; rngtestjitter.sh&nbsp; rngtesturandom.sh&nbsp; rn=
gtestzero.sh<br>
      <br>
    </p>
    <p>I haven't played with rngtest much but I was wondering how we'd
      even construct a test of randomness that would *always* pass.</p>
    <p>The example below shows that if you run runtest with a blockcount
      of 10,000, and do that 10 times, you get failures some of the
      time:<br>
      <br>
      =E2=9D=AF for i in `seq 10`; do cat /dev/urandom | rngtest -c 10000=
 --pipe
      2&gt;&amp;1 &gt;/dev/null |rg failures; done<br>
      rngtest: FIPS 140-2 failures: 6<br>
      rngtest: FIPS 140-2 failures: 5<br>
      rngtest: FIPS 140-2 failures: 9<br>
      rngtest: FIPS 140-2 failures: 4<br>
      rngtest: FIPS 140-2 failures: 6<br>
      rngtest: FIPS 140-2 failures: 8<br>
      rngtest: FIPS 140-2 failures: 9<br>
      rngtest: FIPS 140-2 failures: 11<br>
      rngtest: FIPS 140-2 failures: 9<br>
      rngtest: FIPS 140-2 failures: 5</p>
    <p><br>
    </p>
    <p>We could say that we accept up to 20 failures but even then,
      there would be a chance that the YP AB would<br>
      occasionally see that fail due the the inherit randomness being
      tested.<br>
      <br>
      If I run the test 1000 times&nbsp; you can see that on my laptop
      (6.6.10), 20 failures never happens:<br>
      =E2=9D=AF cut -d&quot;:&quot; -f3 /tmp/rt.log | sort -n | uniq -c<b=
r>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; 1<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp; 2<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 34&nbsp; 3<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 54&nbsp; 4<br>
      &nbsp;&nbsp;&nbsp; 101&nbsp; 5<br>
      &nbsp;&nbsp;&nbsp; 131&nbsp; 6<br>
      &nbsp;&nbsp;&nbsp; 138&nbsp; 7<br>
      &nbsp;&nbsp;&nbsp; 124&nbsp; 8<br>
      &nbsp;&nbsp;&nbsp; 114&nbsp; 9<br>
      &nbsp;&nbsp;&nbsp; 101&nbsp; 10<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 75&nbsp; 11<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 48&nbsp; 12<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 36&nbsp; 13<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 16&nbsp; 14<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 10&nbsp; 15<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp; 16<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 17<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 19</p>
    <p>and on an older headless server running 5.15 with fewer process
      and likely less entropy available:<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; 1<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 12&nbsp; 2<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 29&nbsp; 3<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 60&nbsp; 4<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 95&nbsp; 5<br>
      &nbsp;&nbsp;&nbsp; 117&nbsp; 6<br>
      &nbsp;&nbsp;&nbsp; 133&nbsp; 7<br>
      &nbsp;&nbsp;&nbsp; 121&nbsp; 8<br>
      &nbsp;&nbsp;&nbsp; 139&nbsp; 9<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 99&nbsp; 10<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 81&nbsp; 11<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 50&nbsp; 12<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 28&nbsp; 13<br>
      &nbsp;&nbsp;&nbsp;&nbsp; 14&nbsp; 14<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9&nbsp; 15<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; 16<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; 17<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; 20<br>
      <br>
      <br>
    </p>
    <p><img src=3D"cid:part1.bSPnJO0D.bMnYf8Hw@windriver.com" alt=3D""></=
p>
    <p>I guess we could raise the limit to ~30 (42!) and failures would
      be extremely unlikely.<br>
      <br>
      We would have a similar problem with measuring the boot time that
      is dependent on the entropy pool not being depleted<br>
      since we can't completely rule out a boot sequence taking 3x as
      long as the average time<br>
      and it would be worse in qemu given that it's competing with other
      processes on the YP AB machines!<br>
    </p>
    <p>../Randy &quot;It's a good day because I made some graphs to
      understand a problem.&quot;&nbsp; MacLeod<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:b8554634-5da9-9872-660a-5e94a62=
c765e@konsulko.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Scott

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>
--------------4l6o9X2zhzFKDXhfkuTOcqaq
Content-Type: image/png; name="v6jmaP3xqLBLr8JU.png"
Content-Disposition: inline; filename="v6jmaP3xqLBLr8JU.png"
Content-Id: <part1.bSPnJO0D.bMnYf8Hw@windriver.com>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAA+UAAAMNCAYAAAD+1NVlAAAABHNCSVQICAgIfAhkiAAAABl0RVh0
U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AAAApdEVYdENyZWF0aW9uIFRpbWUAVGh1IDA4
IEZlYiAyMDI0IDA3OjM4OjU2IFBNObRUOAAAIABJREFUeJzs3WGSotqWBtDD6xrIfSPBloH0j56H
XhlKzyNtiTeQFz0S+kcWFpKAoCAHWCsioypNVERUPvc+h6QsyzIAAAAAH/ePpVcAAAAA9kooBwAA
gIUI5QAAALAQoRwAAAAWIpQDAADAQoRyAAAAWIhQDgAAAAsRygEAAGAhQjkAAAAsRCgHAACAhQjl
AAAAsBChHAAAABYilAMAAMBChHIAAABYiFAOAAAACxHKAQAAYCFCOQAAACxEKAcAAICFCOUAAACw
EKEcAAAAFiKUAwAAwEKEcgAAAFiIUA4AAAALEcoBAABgIUI5ACwoy7KlV6FVURQhz/PN3veSjw8A
6oRyAFhIURTher0uvRqtlgysn7hvgRyAWAjlALCAoijC4XBYejVaZVm22JcFn7jvJR8fADQJ5QCw
gFgDeZ7niwXWT9z3ko8PANoI5QBsQp7n95bkoihClmUhSZLWMdt5nj9cXl++uk5RFIPvt7pekiQh
z/Pe61b31bbufdet1rm+jkNasLseW9v95Hkezufzw3Xr6/aKtu1T3fa799287frtdy0/5j7GbDsA
eNWvpVcAAF5Vhaqq8nm5XH60hV+v14cg2KySNoNadZ3r9RrKsuy97+p+LpfL/bL6bVWXhxBCmqYh
TdNQFEVI03RwtbY+IVn9Nqp1LIoifH19tV63emyXy+W+TH2964+vCprH43GySnKSJOF4PIbb7RbS
NA0hhHvIvVwu98vG3nf9MdRvu3q8bdtk7H2M2XYA8JYSAFbocrmUl8ulDCHcfy6XS3k8Hu//1i+/
3W4/lj8ej+XxeCxvt1tZlmV5u91+XK9LtUx13fp61e+j67bqf+tyu93u69lUX8+2v1f30fa36nbb
1Ne/7/E/U91Oc/tU695220Pvu2+Zart0XX/MfYzddgDwCp8qAKxaMwTXQ2AV3OuaobypCl19gbl+
n22GBO4hy1QBc8htdH050BU83w3Gz/Q9tq5gO+S+ny3z7LkZcx9jtx0AvMKYcgA243g83luZQwjh
dDqF0+nUuXxb23f9+l2a7e5N9bb1V8diVy3q9dtqOh6PD8t33U6bIY9zCm33/6n7ftfS2w6AfTCm
HIDNiCUsnU6np8H9mfo4+KETurW5Xq8hy7IfX0D0fVkxpcPh8DDuu1K+OCa7vt5zP4altx0A+6BS
DgARGjIZWZqm4XK5PEyaVqkHx+v1GpIk+eis4fUK/+FwaJ0F/1VtHRDVlxfvfhlS3X5liW0HwL6o
lAPASPUZvKvZ1Lu8W71P0/TlyuztdnuYif5wOITj8RhOp9PsXQWn0+lhtvsq3F4ul0krzdVp5KqZ
6S+XyyTBfMltB8C+qJQDwEj1UNnXWt4c4/5paZqG2+32cNn1eg2Hw+Hlse5jfH19PYx7D+F7PP6Y
88B3qc5RXp3+bOqwvPS2A2A/hHIAGKke2KpzhddlWRaOx2Pn+cPHeDe8pmkayrL8MWFcFY7n9vX1
FW6320M4r8Ltq48ty7JwPp8n28Zdlt52AOyDUA4AL6gH88PhEJIkCXmehyzLwul0miwsDhlbHsJ3
eO8LuafTqTUcf2KsdJqm4evr60e4faXinGXZfZt8asK1JbcdANsnlAPAC6qJxW63WyjLMpRleQ/j
U7RR1wPgkPDaXKYaa11XheMhp1J7V1sluQq3laFfONTVrzPX0ICltx0A+yKUA8BIRVGEw+Ew66Rf
9ds9n8+9AbAKwM116brOnC3fla7AXU3GFrsltx0A+yKUA8BIY88h/kw9AFa312zNrk4rVi1b3XeS
JCGE9rA4ZBbyvi8V6uv1rD2+zbNt05wEbux9N6vxXadE61rvvvt4d9sBwGAlAKzY8XgsQwhlCKE8
Ho+9y95ut/uyIYTydru9tEz9Pp/9XC6X1nW5XC4/lmsu31yXtp/j8di6jtXttW2Tav27tlfz9qvl
x+jafvXH1Lbez+67ue3ryxyPx4ftWv2t+Rw8u493th0AjCWUA7BKzVBbD1mXy+VH4Otavr5s3zJ1
t9ttVDBvC3BtgbstwPfdV1fgrx5L/XqXy+Xh8fVdty34tgXoPtX16s9J/feu23t2323bo7nMs23/
7PrvbDsAGCspy7IMAMAobeO4i6LoHEt9u91a25272tXbVMumaTq6dbpqzx563bHLPzPmcQ6572fL
5Hn+1vVfXRYAxhLKAWCEapK3oefIrsZ+p2n6sVN4AQDrYaI3ABhhTMU3hNeq2gDAfvxaegUAYC3y
PL+3p48J2kVROJUWANBKpRwAXtA8HVffctrWAYAuxpQDwAhZlt2r5cfj8V4xr4J3/dzcRVGE0+mk
fR0A6CSUA8BI9WDe5ng8CuMAwCBCOQC8qF4Vr2hVBwDGEMoBAABgISZ6AwAAgIUI5QAAALAQoRwA
AAAWIpQDAADAQoRyAAAAWIhQDgAAAAsRygEAAGAhQjkAAAAsRCgHAACAhQjlAAAAsBChHAAAABby
H3///fffS68EQFEU4a+//nq6XJ7noSiKEEJ4unxRFOF//ud/QlEUIU3TSW97z6rtNHS7xi7P8xDC
8+c8z/OPP95qH97Kdo71cVTbOQSv/dgN+ayY871/zs+gJRRFEf75z3+Gf/3rX+G//uu/ll4d2K8S
iM7tdiuPx2MZQhj0c7lcll7ll10ul/tjHbJcpdpGt9vtx7Jtfzsej53bacxt71m1XcqyvD9na973
yvL7MYUQOp/r5mvx047H48O+uTZLb7+hLpfLJvbnrbrdboOeoznf++f8DFpStV1jfn3CHngFQsSe
he7qgz/GD/pnqoOsIQcEVXBqah4kVbq2SVv4Gnvbe9bcFy+Xy+q/uKj2v2eWOmjdSlCM/aBfKI9X
9Tkx5IvAud775/wMisEW3sth7eL9hAQGVcKrcLtmzw7Y+7ZBW1Dsuq22v4257T2LPbS8+joY+piW
CJVDvzBYA6F8Gp/4ojDWz5Rnz9Gc7/1zfgYBlGVZmugNVi5N03A6nZZejdlU4337nM/n1v8/u82x
t028hjyXTdW40JjHeh6Px6VXg0gURRGu1+vs9/PKaykGc733z/kZBFARymHFqlDRvKz6SZIkZFn2
4+95nj/8tN1OfdkQQsiyLCRJEpIkeVi+6/KpdX3xcLlcBl3WdxtjbrtL23bv2sZDLm9u9+bzWL9O
877GrPOzfaFaprq8fp36Mn3rOOT+kyRpXfeiKO6PL8uykGXZj3XMsixcr9fWdXt2/yH8DOXN+3y2
X1frX22D+vJt27jrb03X6/W+bmP3pfp9dL0fPNu29fWrrlfdTt/r/ZXt17WN2m47hvek5jp0Pc/P
Xr/VY6q/hruWORwO9/tue7779sP6Mn3vF6++lp6p70dD9olXzfneP+dn0BzaXrN9275tH+16vfXt
p0OWA1osXaoHuoUn7evVS7g+CU74PWat+n/9Zd7VlhhCeGiLrN9WNZ6vun61bH3Sr/r9vfM4x/6t
vq718el9rZf12xtz222GbPeucZBtl9evW9/uXetRXV6NBewa99i37k3NfWHItnhloqDm/Ve30ZxI
qf74yvLPdhu6bn3artO2DfseX9tkTmOu3zdWtXn50H1pyH45ZNvWb6Natlp+zON5tv26Hnt93eZ+
TxqyDzXHNdcnsGtuqyGv3/p6Nn9ve+/vezxj9sO+94s52vibz3F9fxpjyHvQHO/9c34GTa25/9Tf
Z5vvCdXybRMxNvftasx5ffm2cfdt798xDoWAGAnlELHqQ7GaNKb+03bQVV++LB+DT98s030Hwc0P
3qEB8ZXHOfZvzfX5dChv3mbbdn+2vbou7zqQfXbZkDGnY/eFvvWt/33oc98VRJuPp+3xta3HK0Gi
axt03U7Xurzz/HXdRlm2z7o+dl/q2y+Hbtv6sm3vD23LDt1+fTPL9733zPGeNHQfags29X1/7PPf
tmz13t62bw7dh9rWY8j7xdShvG3Cs1fvQygfruuLj64vq/reD7omsms+zr73dJPIwXPa12GDvr6+
QgiP4837xs/WW2S7/jbUnC3ssWvb7q8as93r23zI9V7dF/qcTqfB63w4HDpbPutjqOccT922DarH
PPS5axs7Wl23Ofa3erzN7VoURev91VvX39W2X76ybZ+tz9jt1/cYj8fjvY167Ho0zfGedLlc7uvR
tu+PWceu6w5d7zH7YfN255xPIc/zcL1ef+wPaZqG4/EY7VwOW9K3Xw7dv/o+J6rb6Pq8qN739nxc
AEP9WnoFgOe6Ql6SJINvo2/ymeoD9hOTCDGdKrgcDodwu90Gfxmw5L7Qd3DWXPcqTNavO9XB3fl8
/vHFwJjbbo7rrmv7wmFM0Bobbl8xx7Ydc/1nX/qkaXoP5VsPb+fz+eXnesx++Or7xau69oc0TX/s
f3zO5XIJ5/P5rdfW6XQK5/P5/jlRTUrZ9rquf4EFdBPKYcVut9vSq8CCvr6+7hMzHQ6HcDweR1Ws
l/BK8KsO9NI0vYe1KdahuZ3G3G79cQwJNlV1sB408zxvfa4+Oev6lNvWl3qvawtIY7peQni+H87x
ftH2xfDlcgmn08n+8IY8z1u/PC3LMoTQv92XUD3XvmyB1wnlsGKvHEytrfJUfav/THUwMmTZqoI0
9rZj9PX1dT+Au16v4Xq93qtgz8S+L1Qz/9aDwxSV8qVOhVYFlWq7n8/n+0F23fV6HTXz/yvm2rav
rMee3W63cDgc7s9FCN/bZOhreKx33i/a9HWFfFJVuX3m1ff+uT6DuqRp2rtMLNsdmI4x5bATVeWt
7yA45nMid7W7ns/nH+vddVBUrwq+etsxqZ7L0+kUyrK8r2t16qQuMewLfQeuzXGKUx9strWut93/
EH3LNv9WPY6qdbRtHT7Rul6/nzkO5Idsv6HDJLYeNOrjq6shBF9fX5OOm6+fzjCE8e8XfU6n04+f
oe+vc3whM+d7/5yfQU3V0ILmT2XIdn9miveYoUOA9v7lGwwhlMNO1L/Fbzu/bX2ZmPStU/0gs/Is
bNUnGBp727FpHiQObR1ccl+o327bQW6WZbOOa++rkndNxtamPpFW2wFn13mpq/s4HA6Ltq7PsW3H
bL8qjIbQvq2qoLP1UF5VyNuC1xBj9sNX3y9eVe0PbQF1yvkhmvfX5p33/jk/g5YwxZfNzS8X+l77
9XOdAz2Wnfwd6BNq5wkds3yXrvOLtl326qm8XjmVzrP17jq1UdcpldoeT9cpsMbe9tj1r5+Cpu2U
dkO3e9t9DH0u24zZF/rWq/63odurfpqh+un+mudabttuzeu13X/9fNpd992lfvuV5nPYPP1V23P7
7JRIfacC67ru2H2pb78cum27bmfoadja1rt5nuzm66/rNTnne9LYU6J1LTfm9Vtd3nbKy7b9t7mt
mvv/s/1wyOt9zGtpiGq92tZtrKGnG5vjvX/Oz6A5tL0Oy3Lc6fbq+1V9+epxdL3fNPdnUQOG8UqB
CN1ut/uHZ9vB7LPl+0JB/YO2K/Q/Cz/N6/Ud0Pc9xnqgGLre1XboC831v1f303cwNOa22+7n2fo3
n8v6OnWFvPr2bd5HtXzzYHfMFwlt99e2L9TXtWtfHBvKu+6775y61d/rl9Xvr76Nnh209/297bVX
Pwjte610PY62x953jvg+Q/alIfvlkG3bdjvN5Zrbc+z2a1u++eVMczvP8Z40JPANfR0Mff22PZ/N
7dD1nDVvZ8h+OPT9YuhraYiu53eM5pdGfZ+Hc773z/kZNLX6tq7WuW2/6XuvqF+n+rd+e12P+Z3n
GvYsKcuWWWYAIlW1PQ5t86xmuB468dmY2+aP2CeNq4zZH+bSta3sf8uptv2n940sy1rHA9fbu+0P
r5nrvX/Oz6CpVLOzv3OIX00IeFlwVnfYE6EcAODDqvHefWO767Oyw1BCOayPU6IBAHxQnudPJ9vL
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

--------------4l6o9X2zhzFKDXhfkuTOcqaq--

--------------UaJGb7Nc3ZAjceRl99ShutUf--

