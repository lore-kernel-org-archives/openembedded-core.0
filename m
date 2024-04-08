Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7448ACD1292
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 21:39:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.120820.1712612347975957290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iuGDHXq9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4828e94937=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 438JWXS3022903
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Apr 2024 14:39:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=ec612W8mbcSVnFaJ+/K
	M4uwIxWPpvGFnfl+YtC65Pn8=; b=iuGDHXq9LkYy9U1v/IXDHwrHGSnnKFLGHLA
	+mpQ5EHfBFNR17cHvsHGD/O8hxiBSn5seh15y/bcdLnPnfZAFCXZgojg9JGA/Wq+
	jzk8xo0ntZJbfJDInPVb2bUOc21c6eoWEDNpHG6gHAVWsQpxzdx+kxd2yH2UMfQm
	DWy7IkjCUqbOGh1396tJ2g3Hg4i8+h8J5q2wK/mBQPQ5CK6YIaxlDZfTUeVQgsVC
	o9SPZ/aTDv5c8WyePq3R4vUkxvHhqsnXUqATcOl+kaZKqNrnjdSIyJIq9Vl5CnJt
	fyWaBU+P6O4IEF5lzSDwat/OWFaEQbvGwGmeRYJuN31WJPe2+qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wghtsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 14:39:07 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 438Ld6IF027423;
	Mon, 8 Apr 2024 14:39:06 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wghtsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 14:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9myJjv1yALKQYndrNApeDcO/4lQx7JdfV+z5uVmtglZLXSwUJkycwKGOHOEWYFk5hpKhceKL6C31PRwlLK+fXDexoxwSS0Uqkh+QCNqqmqNEL6pD3Ks6GLiVDHYf9FxhUpLpFLIEfQkQF3JTZ54nkR0eHtfc0PtCuW9o4ogVu1Gk+8Dm2G78NHSZslL4nE81UeKirWB4DGHSCOkP/ZzTXZnK2tBskJZ8+WP1uDwYFq1PDz5gwcXmr/6J550zFKDTONgaK/8u9EN7hc0OTmqf/VYCg0Ynd/zbVGjxkW1L6S91QK8ZioG3LwmCVAlO+RsqlHgYU0o6Y9QQWJBU3RZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec612W8mbcSVnFaJ+/KM4uwIxWPpvGFnfl+YtC65Pn8=;
 b=fp59dMLgWAGen+7LjZ12GDWqcSFpAXsok2XXwD5WWv6aDdTaHCOQE0M/0gwcstbu3fdgd41Csk8k+msoaNNPq1cLdpMoEt1jS0I7LE79NLuaXHghXU6CXxFEMiEwH6EkvvtEn2XFUjYdOO7dQUR28PxVqJvcHX7RlNAP9VWwz5i1Wu+ONqOzb6aUxFptep5kTWBrPVrlaweQBQTQt2AzhOTvbYGdBs7iSR1EfwNGKjQM0P7axgLnxxR3SN95KFxlPCs9toHRzYP4MFuBhcTbkGQwWGwro36srExy7fyut219W41mBZjzeoDQNlxEn+XgkQ3+Hgvhz8dvBkPSDA4EKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Mon, 8 Apr
 2024 21:39:04 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 21:39:04 +0000
Content-Type: multipart/alternative;
 boundary="------------K3Q0IKwh0qQBRe0b0pTsQuh8"
Message-ID: <b4aacad7-313d-4fdc-84c1-e1717f32ccc0@windriver.com>
Date: Mon, 8 Apr 2024 17:39:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ninja: build modified version with GNU Make jobserver
 support
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20240403070204.367470-1-martin@geanix.com>
 <20240403070204.367470-4-martin@geanix.com>
 <CANNYZj8x4kEP4GAuaei6Ct3bqcZoBnLk21xArzSgTGRmO71sXQ@mail.gmail.com>
 <af5f84b11560409a0cb7e1657341d91d50beb84d.camel@geanix.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <af5f84b11560409a0cb7e1657341d91d50beb84d.camel@geanix.com>
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SN7PR11MB7567:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CwAtehVHN+ZK9czD611tAydwaH86/uVBuR+reWDDVn/GfJHfWwyGxVAvIyRX+5HP9wiwIjWO0BjN2t4RaKeDFd/2yoPyi1yTpx2Nj2irpvGeWHCbDsbMmoM/B4vDi8ZTp61FM0lOYs4An35nhv/nCbLp7R7AP3QONZZDLN4iNFDhVWSLl8QHSAcE62gD4IJ2njl93Pug5a4N1z7HSJfpGWGMggpC93QSxRB/G0mKZJUucEWAcWzLSKE1Ql3RANbJFbgZ+GKuZ0xLZokd+yLz8ixHEcDicHZi495dxpCN6fNA9Z1RxdAvlAzGYjG10XtW7KU+0cmE9IqEBbjmHSEOtcj6MP0Ry3hs4MDyq6qfVRROIberyUDP+EQFU77Ia8fYu5pj8L8JjnnqF8+xEnxybaGeTw9DdkmoXA68m2Xkf4HqgNWTHRWfFLU5KiC4qw3SrSbjzQcaOSFtIQvxunkq1xLCV6UHZyBTCKY+NewWV+nLPy0ITclojXm/TYkyYJAzmf4hbAW/4XHz05R3QJcUEQ9RyIz8OM1flr5t7IkxQZcty6u6gn2XwoupOzPJE+JkhIKmg0Teo1Ya7as/sZj1Nj5ob4TrsJAcfbflcHHKDt4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlNUd1oyaDduVWx5aWdaTnJvZ1YxRzNFV3gxajJUaEtOMVYvaWV4amt2NXpO?=
 =?utf-8?B?RkNnT1FIYnhJZkZ5VndyMVQ3SXdxUURzclhRRURROEZQc2lXd0gzYm10Z09w?=
 =?utf-8?B?SVhheVE5V2pNSk9tK21IY1MxUEZTSEZxRndDQS9wWDNMN05xeXV6b1JsSnp5?=
 =?utf-8?B?QTFHeUxnc1Y5Nml6aGVXMCszeDRxaTI5cVJreGQ0ck9DelJ0dXJRUlRJTmhD?=
 =?utf-8?B?Z21YVGdrRVZuQ0xpU3pBWGZWZkpjSDFqd1Zlc0pwYTlqZ1l2T3JQZ0hkMXFj?=
 =?utf-8?B?c2RkZ25xR2hNRENVdi94cHAxYmZmYThnWDNscFkyM05jUGpZb2M5TXpIZ3Zv?=
 =?utf-8?B?ZkIvVmtvMEJJUTRGdTJubjNWallYVDlpa0tFeFVTQnNJV0o0Y1RPMmNNRitY?=
 =?utf-8?B?MFJTRnlUWWxseElleUt6S0ttS3BoeTRWL1F6R0pvZ2ljL3F4RVl4UHRGU0s5?=
 =?utf-8?B?aXFob1ZXU0FQbm5pZnFFeUJkV093d2pEZmNPK2xHTkhVaWtNVXVESzkySnVz?=
 =?utf-8?B?Yk9QTWovRW5PdW5sTWlnSE10ZGs1SUNKVG92aEhxNGJmV1I1czh6eTVkMVZm?=
 =?utf-8?B?UFdEb3FPQ1N3TlUwR0NWc0NYVFJqNUZ2b2ZVbi9sSFVkNzlaY2VyT2VuejBp?=
 =?utf-8?B?cjB1ZWY3Tjc1MlMvekdiYzJadk1JNHNXbDRmMmhoSDJsQ2JjcE83eWEyR1Nt?=
 =?utf-8?B?M015V3NVUDBCWVB6NTk4S3VrNEw3UTdNUkFicnQ2YlhqOUZzeEhHcVZVVlYw?=
 =?utf-8?B?U2IxM1plNCtmNFhNa3NpY3hJWjJVbXJXeGJyN3VmUjluVTVvb1J0cVd2R0VR?=
 =?utf-8?B?OGlBeG5wOHcrN25WMjNOdFNJRmxTT2RNYUcvYndrbnEwTjVnSnVHRW11a3VY?=
 =?utf-8?B?b2tpTVNaVG9xSjlKZXM0TkVzRmozb2lHb3gxRU9CZGoyWWgySEZsV2tnWlFK?=
 =?utf-8?B?Qy91VHR1SjJkV3hkeFJWMEVtTWtkN1BpRVhjRUdPYkxFQVE2ZHM4SUJPclhZ?=
 =?utf-8?B?dFhobk1PVmo5NGhySE1RV1htQS92SCtTeE16YWFld0I1a1psUUIrZjlOWS9v?=
 =?utf-8?B?RW50czRJT1QveXlweHlxdzJ3cTZnc0tHbkh5Y0U2d3dYaE1yL21sR1F4cXFL?=
 =?utf-8?B?THJ1Nm1ka2J2RE5JcmlYYjRTdDE5ejczVUZiMU9uWmloK2p5ZThrK1UyQ3lk?=
 =?utf-8?B?TWlFdVFmVGpqUlV6dmUxdTlrTW9SK3FvMVh0RVRzL3dRVEFiNkRvVElLUitQ?=
 =?utf-8?B?SlpLRGsvdkVwU3ArSEFKSWYwUVRuZThLMm9mSnNvYnp2cUJHVzc2WWl3T1VO?=
 =?utf-8?B?MTNidy9NRWhiSlhaYm1IeXgxdm5vdG1uUkxZZkxSeEc2VlVyN2R6bEdVWGNW?=
 =?utf-8?B?dEtueHhuNGFFTmZ2cGRZaENWbkt1dTd4NW9xcFdsNTBPRXVWckJBYk1naXFQ?=
 =?utf-8?B?V3hMREtqT2RSYXdFZXlGU2ZYbS9RQmhjei9qcDJYWHd0d25kQTJnZUVXL25a?=
 =?utf-8?B?ei9BUytDYUk0Wm9hd1R5OThQUTgvNVRFbFEya0puVHpWSDBqa05DQ2kwdWVH?=
 =?utf-8?B?Q2tyTjhPeVFWWEhYWERQd2JpSVZiNnpONVkxVFBMYmw1TGtOQnk0NTMrMWFI?=
 =?utf-8?B?Zm9VTHZXcG50czJKWEI1eVN3dHE0eE9EZzJqYWRaWGpUcTlRNEJIeGpxY3ht?=
 =?utf-8?B?dVhaNER5bkRxSUpUSUFMM0VGeXRhNVVaTzMwK1l5djU5b0pSNVNheHdYY3lM?=
 =?utf-8?B?NmY3VDYwaUdQMFZvZnNaOTZvSEpSK0JGaGRKeERTWWJoUGpLVEJrZUhxSmJx?=
 =?utf-8?B?R2ZSOXNpQTNBNVpkRlNWa1BGYlhNQWNFTFRtOFRxUEVreU9aTzN6QUxZeVRO?=
 =?utf-8?B?aGgvL09HMlh0dlRXR0lKdTZNYWh6dDNxQ1pOU1FqeFRSQWpRMEk1SmNjdmph?=
 =?utf-8?B?cjBnYjg0UU9sNVlJM2RxMW5ydUlMV2VDc1BSdGVubDRaRjAyVXpSbTFQZUlw?=
 =?utf-8?B?NVFyQllMK0ZkcTdINkRNcWJsSmFYSnBpN2o3bC9KeVZqQytFaGo4T1MrbTBX?=
 =?utf-8?B?WnBBL2RJWEZQbW04YmI4VmZhOGVoaGFkbjZhS0Q1akZqb0FEamN0cUJtaFJO?=
 =?utf-8?B?dVJDajdGbHN0M0x1bXlwWDFaMkFYakxVQWMrbGwyNkh1QVZGWWJZRkE2T1dr?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1121ecf-50ee-498c-3189-08dc58144fb0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 21:39:04.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmcaMLgqzDuSk3mo0r4UpGmdaz0erce2hxz2twnr6IzWMv1AhGzXOU4Epq75/53RvFBZys+qV19zmIUMTrx6qugZKTBiEpTvD70MDyeDZVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-Proofpoint-GUID: -I24I_5k6jw6PFRnyANZ3KB_Xmfw37W6
X-Proofpoint-ORIG-GUID: WUKFoycTC09CLPhS5TWTDCtqQ2UHmi_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=946
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404080165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 21:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198018

--------------K3Q0IKwh0qQBRe0b0pTsQuh8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 438JWXS3022903

On 2024-04-03 3:08 p.m., Martin Hundeb=C3=B8ll wrote:
> On Wed, 2024-04-03 at 17:58 +0200, Alexander Kanavin wrote:
>> We can't carry this mass of patches. It has to land upstream first.
> Understandable.
>
>> Are you able/willing to drive the upstream pull request to
>> completion?
> No, I don't think so. I'm not familiar with the ninja codebase, and the
> pull requests has been lingering for too long.
>
> Another option might be to propose adding the fifo feature to the
> kitware fork of ninja:
> https://github.com/Kitware/ninja
>
> They have forked ninja to get the jobserver feature in, but haven't
> taken the fifo part so far.
>
> The kitware fork is also used by buildroot:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/=
ninja.mk
>
> // Martin

I see that v2 has switched to kitware, which is fine in the short run.

I'm just back from vacation. I plan to test this patchset out.

I can spend some time convincing upstream ninja that a solution is=20
needed for our use-case and
that perhaps the jobsever approach and the kitware fork is a good=20
starting point.

Of course, I can't promise to "drive it to completion" but I'll hound=20
the upstream devs for months or even years!

Thanks for re-submitting the patchset Martin!


--=20
# Randy MacLeod
# Wind River Linux

--------------K3Q0IKwh0qQBRe0b0pTsQuh8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 438JWXS3022903

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-04-03 3:08 p.m., Martin
      Hundeb=C3=B8ll wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:af5f84b11560409a0cb7e1657341d91=
d50beb84d.camel@geanix.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 2024-04-03 at 17:58 =
+0200, Alexander Kanavin wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">We can't carry this mass o=
f patches. It has to land upstream first.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Understandable.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Are you able/willing to dr=
ive the upstream pull request to
completion?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">No, I don't think so. I'm no=
t familiar with the ninja codebase, and the
pull requests has been lingering for too long.

Another option might be to propose adding the fifo feature to the
kitware fork of ninja:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/Kitware/nin=
ja">https://github.com/Kitware/ninja</a>

They have forked ninja to get the jobserver feature in, but haven't
taken the fifo part so far.

The kitware fork is also used by buildroot:
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/buildroot.o=
rg/buildroot/-/blob/master/package/ninja/ninja.mk">https://gitlab.com/bui=
ldroot.org/buildroot/-/blob/master/package/ninja/ninja.mk</a>

// Martin
</pre>
    </blockquote>
    <p>I see that v2 has switched to kitware, which is fine in the short
      run.<br>
      <br>
      I'm just back from vacation. I plan to test this patchset out.<br>
      <br>
      I can spend some time convincing upstream ninja that a solution is
      needed for our use-case and <br>
      that perhaps the jobsever approach and the kitware fork is a good
      starting point. <br>
      <br>
      Of course, I can't promise to &quot;drive it to completion&quot; bu=
t I'll
      hound the upstream devs for months or even years!</p>
    <p>Thanks for re-submitting the patchset Martin!<br>
    </p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------K3Q0IKwh0qQBRe0b0pTsQuh8--

