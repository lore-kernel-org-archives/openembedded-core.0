Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C5DC47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:44:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19600.1705599865381080570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 09:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dE8i4b2u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174791ccb8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IBTSht018282
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 09:44:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=FW0Ub8W75Ebhb+OQuN0
	JZS6iM16iJsdyocnYEyGu5/c=; b=dE8i4b2u1GWIoscdTOnO3AOU17Lo2Ajk04F
	+vVM3Xj/PpYOQURpUoEBvqt0Yc77+l5TSq/pA20Qf0bN8i7uK/ReJRVMgAqhI0Cp
	yUgEqjuKXpTwUkcT3Qh/dSbI7s8knjYEDyY0N1oEoK1N3+pb0mB/cecjfnkutQGm
	GkPoR95Wr5xOeRWNF5G9D417fPNz8Boa8g6YA1KUnjYjl4bwE/bU6NakOt1tHmzT
	N4UKe46kDKgOQFMwGi46Y7nzKkDN9qHNP79fRJ1G+pmGJFYAieezbHcdkCZU17az
	APSsbTnYaoiUGpH9eWoJ2ToXk/wYS0ghzEwUzrPjLAZRL6EXLFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp45ufv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 09:44:24 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40IHiOZr010717
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 09:44:24 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp45ufn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 09:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA4UkP4w8OFoz3hlp0jxhn1jVzO50AwBTKGYFQ1yEylxKj0BvmqAG5IJ3mnDq6oIFChqbT2Mf28JapNXDB8arDYXmJQ2k2wSCb6BdUcHWDx4Wf8AF9vdYx57R2b53JWJ2NdVmeihB3IO4cg/i7pvZelFQ26jLgWveukFUNFqNoX+y7sne8uUa69JtgC2/Q4mZ5ksK97yDpUHJ0+QCwNFteFmpKFbkxSlLdP7lq8WTkX3Y5BpWbHc4DrxmfN4U3Bgp8DGMSOgHVkzV5v2y3gUiN/Cu2VJ8rE+A6/oPWFPno4q8bPVPiFthVsMiDtP8nWzNjXmD79q1SadPxGta+LsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW0Ub8W75Ebhb+OQuN0JZS6iM16iJsdyocnYEyGu5/c=;
 b=DXaJxFM4bn8BymLe1LeiVXuJIO2nmUO9GP0oUSLq+yzliiXQ+/5N0Xehq/MbB3meUqYhg1CFna9WsdgVWZwLKXbM2k4tSWBxlvCKlbnozfCLtdCt7kD7WFZRJsSF6Rcm5Xh3Z14f0oM0oBGKUOXMF9MroJrfXVMMjOmyXF3b5flVqVtPGViHkBzJGhElBM1LJTiIkLdXgyRQmraZTaiU9nCJEO1iUbY/sffzafqYDM/xk73OODBXXSu4GMr5TdnoOLNvFpgq00DA2qoE/weJVV/WAvAmDL6CTnHZICG8LDmsAh0/il426fjnOda1qCrMrkV6zoEGwDeJbd2Q6OWYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 17:44:03 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7181.026; Thu, 18 Jan 2024
 17:44:03 +0000
Content-Type: multipart/alternative;
 boundary="------------Cbk1pxOYQdrlVdN0vtEl4ju7"
Message-ID: <efec0d97-cab1-43a9-96e3-1cf6627109a5@windriver.com>
Date: Thu, 18 Jan 2024 12:44:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rng-tools: Revert "rng-tools: move to meta-oe"
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
        scott.murray@konsulko.com,
        Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
        jsmoeller@linuxfoundation.org, stephane.desneux@iot.bzh,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: david.zuhn@sonos.com
References: <17AB7F9C512EBC5E.27523@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17AB7F9C512EBC5E.27523@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f8eb43-9a83-40bd-66f8-08dc184d0f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5TXpSL6cf8vk7wxw53lU7HJ26Jh++nlzwqYKQZ2qGKnVfO1ctcnnfw32j8cRrZABvIfeG1PG9Mi/ubS74qvI60CXmDXUyGJkTI6VwmsMl6YXC913VpQv8EZObF7uMCgopKPqdnakVWE5KiGJss1KZa8XVg3pAO3C6JWTZL/f5KnncsSef6kOTeQgR1v5EJa2hGuAsCGFRtoi0OBXngiReIRwSpKKXoLC4msh7WbTyZUCRhLUy1yfPcAxUzaOGqjtOEph8zchnnTzeM1smSTvYFQm+zqqychimd8699GWJ1ts1rFWUxdFPhG6d2/yI92wM/OvMuIoAFrNa5hZguvDXB8CRszo85035fOLdwJpLSSYvei14sZw8ZK96BarMJEhy0DmALsA4ABQV4lYhGUZiw9sbojRgu0LOoSkxVXIn9WzILpWB7QwnrEfQiwjfogLMaDQy6FYFx09nqaajNftyOk/Be0IcM9haO559VUh2HkurBBgjGbBYUV96xrAfBg8AkI9xcew5V/zRbz50RrAxoI6akUbRo5WjnaFGNcFBo2uTS36LXPNPjqAf1ksXsniOG+NBN1KOjmRrB/h39+r6fW+rhFw+a971OYnBidEEbR7E4mE6KsQAP1kUqDZ/WgKXQeuZup10C8Dpw9nhPdRrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(83380400001)(966005)(478600001)(8936002)(4326008)(5660300002)(66556008)(316002)(110136005)(6506007)(8676002)(66476007)(33964004)(53546011)(6512007)(6486002)(66946007)(26005)(2616005)(2906002)(38100700002)(166002)(36756003)(41300700001)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1dmbkUyeUluTExpVkhHVHhHM3dMUWRod1JuMExBaGZiaHNaVzZiV1QwaHla?=
 =?utf-8?B?TWxQekFFM3lLWjVrRXZJTitPVnVQVkcwejhHYjBSb0ZqVHdhUk1HcUZSZmJk?=
 =?utf-8?B?N0RsdEROdXN5MmxGekkxQll0WHJYRTViZ2UvMW9Yb1MvbXdZaFYrL3NsZWgy?=
 =?utf-8?B?OUVyaEdPcWZ5aC9EMUFHVnZWbVJBQVlHSndLOFFsYnowY3hsOUhZOGlSbldl?=
 =?utf-8?B?QXRCQ2I2VGpRRjhDK2JqNHZYVW9LVTlJK3MzcHlncitENGovSlpqWHJqdm1j?=
 =?utf-8?B?OWVneWFxeUNPYXllU3NaaklsSTQycEhmOUhhelF6OFVjcHQyZk45NTErV1Bm?=
 =?utf-8?B?SEhBTGtDU1pLbyt1TUt3SGN5QVNOT0FqTENEcWJkYUpIbGliUlpPUFFtdllT?=
 =?utf-8?B?R3k2b0RGcWcyb3FrRHQ4alczcGVnclM0czMrbXNLMHphbDdzSDltZS9xQW52?=
 =?utf-8?B?WDV4NzVjS2VxbFNEOWlEVUhzMGxUNXVEb3NFV0NQSmFqSmw5NWZBT0JwZGxN?=
 =?utf-8?B?dWZXZzJtWFVBelpkQ1dwM2RUQ0RkRE9rTHNLSFkzWEt2RnVRR2lGWkcyZll0?=
 =?utf-8?B?cDdKTUoxUy84LzBoY1hlOGQrR2hML01DamJQMFZ5Ym05Q2NHR0JlanhOMVVS?=
 =?utf-8?B?QlNkVXp1MVFqZk1ObGxzQWwwaEFzUXdlZDJjdTR2SlhMdnQrdTg4YVQ5UnZQ?=
 =?utf-8?B?c20rSVVOazkvRTRjSkhCaVJrcitDbmlBVHh6c1Q1dnhDYnFYcWpkYWpTZlIz?=
 =?utf-8?B?dEJZQ1J1dGVyU1k1NkFRSVd6OFRDZmlaZDBjSlIwVEp0eUJkTFUxZFlhZm1i?=
 =?utf-8?B?UzlCVTI0TkU3NHUvd3d3bUtZV1BXQjhqRnRoa1NxcVh1NlZLTk9DODNCMENm?=
 =?utf-8?B?MmYxR2ZKSjZ5MlZNK2tyN1p3WWV4VzhBYmtQTXRxdnluSkRCSXRlTEpGd1Zm?=
 =?utf-8?B?emMwYmxyU0MwZjZTZTlpMW9VSUs0TGg0b1A2Qklud1FXQU5ZSTdPY3MrUDdm?=
 =?utf-8?B?NEpKcjg2TVBXT0ZhMXlEdWhua0NaZTF2R0FmNzZyNUNQSmtGRjRUa3lkVDVi?=
 =?utf-8?B?YmhQMU1kQmpiWGNLaGlHdXZYQml3UzRQOEY1WHZpbFdoelBZR3JzSjRNMFFH?=
 =?utf-8?B?YUo1eXBtblFEV3RBVXV0THNvY0VPZzN6Uy80NjB5RXl2ckViM3BLbXE0NDBZ?=
 =?utf-8?B?TmVxSEQ3cU54MjZOTFV0OVhNc3J4Qnk0ZDVBT256NzhLSWN4ZnJTMVpJQnRR?=
 =?utf-8?B?V0RnR0dJSFU1SmR2dTVpdmI4VzVsZXNaT1dDSUtHSXdiWXMycDR6L0ZWMEVP?=
 =?utf-8?B?WnFoZzZPelpTNmpSd0ZtMkJZREVrOWFCOVVnS0UvQzB5cmMyTU5CWUF0TTFp?=
 =?utf-8?B?MDFQVXVPRHpHVkphbE1DVGE5OHlnblVFcUlqZnhyMFE1WjVOWm5lR29ERmpy?=
 =?utf-8?B?R3ViZE1hVFlWMFUxNGxPS011TmJWaHlpdzJBNi9MRDA5WkhLakxrR2xlOFRV?=
 =?utf-8?B?aW5CNGxoU0ptc3U0SDIxQWlWTFRjb0tkNVRvcVFCT1hZMXE5WDdONGZNVTd1?=
 =?utf-8?B?ZHRseGUyQnpEd3JMMmdGL2pYZ3V4dUNMWE1iRjBLR0JheTFwZmJkSkJXY1lL?=
 =?utf-8?B?VUpRNWFNUGY2UmFYdnp5SWhncDN1cXlLZFJSZzJ0OW5aaUZCQzdzUXpZNW9Y?=
 =?utf-8?B?dEhRS2tlKzZ5akxXSkRIQmx3RUdmd2ZqY05vWDZLSWVOeGZYdHRWa1oyYjN0?=
 =?utf-8?B?N214d0RuNjVJemhsRWpKM1ZhWXRHMXVkbEd2VkVQb2dDS3NRZnB2MXVzWTJP?=
 =?utf-8?B?Q1AxeE9xMExqM3RDdENybkpVZHUwaTVjRUJiQWJYUmQ4RVNwRjQyRjVhUUVi?=
 =?utf-8?B?bkhxQ2lhMU5hdVBrdUpheFhvREhuVmNzaDRGTUt1ZEkxeFlOSzVHYy9zMk5z?=
 =?utf-8?B?aEwrQkc5VGFBR2VsMFFDT3JEMWYySmUrMXFNMk4yTGpiR240TXdxamdOMy9W?=
 =?utf-8?B?bzE4d05tNURvVy9SclM2UGV2d3dSVGhDWHZQSm5MajZDa0I1N3RoR1ZFUWly?=
 =?utf-8?B?d1ZZMmhvK1lxdHl4K29iTXloQVQybXdWa3lKTmZaK2d1VVBIVk1ZRlQyNXFE?=
 =?utf-8?B?NjFYNU1vcEVOMDUzZzJKZ01hbWZCL1dWVytGdldrL1NlWG1YUUR0SnE0TEtl?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f8eb43-9a83-40bd-66f8-08dc184d0f84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 17:44:03.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/logaqZvOpEaGKBy3b+5pTw2EaYQnkGHJNldThpEUknj1n5ziyaXcwEPGWFVAaed7A2UBfQj7R6JRRy0/tyHKWTPcU1Vew9S/NrEPnGXYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-Proofpoint-GUID: A3-aL8JVevBFqHEW2Y2p_7bMiFAyZexQ
X-Proofpoint-ORIG-GUID: EwEx8JwrkFWhRu0KljNYEqWeHqjZ-dl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=991 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 17:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193996

--------------Cbk1pxOYQdrlVdN0vtEl4ju7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40IBTSht018282

Sorry for the noise and back and forth on rng-tools removal.
I'll avoid hastily cleaning up things for a while! ;-)


On 2024-01-18 11:59 a.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> This reverts commit d2b445384da3f3e6dab8577b6c56648b5244a788.
>
> Revert this commit since:
>
>   - some systems using oe-core master may still be using kernels from
>     before 5.6 pulled in the rng-tools algorithm, and
>
>   - some hardware platforms may not have a hardware random number gener=
ator
>     and could therefore need to run rngd to avoid long boot-time initia=
lization
>     due to a depleted entropy pool.


The additional context that doesn't belong in the commit log
is that we talked about this change in the YP bug review meeting
and decided that we would keep rng-tools in oe-core for 5.0-M2
for the two reasons given above. If we end up adding a test, as=20
described below,
we may never move the recipe to meta-oe.


It seems to me that we need a test that checks if the entropy pool size
ever falls below a critical threshold for "too long" in the first N=20
seconds of boot time.

Getting that test written so that:
 =C2=A0- qemu VMs and
 =C2=A0- real HW with and without /dev/hwrng

all pass without the test being too permissive may take some time.

I've created a bug to track adding such a test:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15360


Scott,
Do you have any info on the need for rngd on HW without /dev/hwrng but=20
with a kernel >=3D 5.6 ?

../Randy




--------------Cbk1pxOYQdrlVdN0vtEl4ju7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <p>Sorry for the noise and back and forth on rng-tools removal.<br>
        I'll avoid hastily cleaning up things for a while! ;-)</p>
      <p><br>
      </p>
    </div>
    <div class="moz-cite-prefix">On 2024-01-18 11:59 a.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17AB7F9C512EBC5E.27523@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

This reverts commit d2b445384da3f3e6dab8577b6c56648b5244a788.

Revert this commit since:

 - some systems using oe-core master may still be using kernels from
   before 5.6 pulled in the rng-tools algorithm, and

 - some hardware platforms may not have a hardware random number generator
   and could therefore need to run rngd to avoid long boot-time initialization
   due to a depleted entropy pool.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>The additional context that doesn't belong in the commit log <br>
      is that we talked about this change in the YP bug review meeting<br>
      and decided that we would keep rng-tools in oe-core for 5.0-M2 <br>
      for the two reasons given above. If we end up adding a test, as
      described below,<br>
      we may never move the recipe to meta-oe.<br>
    </p>
    <p><br>
    </p>
    <p>It seems to me that we need a test that checks if the entropy
      pool size <br>
      ever falls below a critical threshold for &quot;too long&quot; in the first
      N seconds of boot time. <br>
    </p>
    <p>Getting that test written so that:&nbsp;<br>
      &nbsp;- qemu VMs and <br>
      &nbsp;- real HW with and without /dev/hwrng&nbsp;</p>
    <p>all pass without the test being too permissive may take some
      time.<br>
    </p>
    <p>I've created a bug to track adding such a test:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15360">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15360</a></p>
    <p><br>
    </p>
    <p>Scott, <br>
      Do you have any info on the need for rngd on HW without /dev/hwrng
      but with a kernel &gt;= 5.6 ?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------Cbk1pxOYQdrlVdN0vtEl4ju7--

