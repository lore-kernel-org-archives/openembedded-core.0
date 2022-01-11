Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52906C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 00:42:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1228.1641861739826624292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 16:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=KRyJPkJ5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20B0CuJd008444
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 00:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ybVLOaTd4+QqgNsBKUa/tcAB6DwjkJawdavyCg3zGjw=;
 b=KRyJPkJ5+IEBSLLAgLgmDAJEJXKrFeqsD8sxdZAThvuPdnSTv8wKabRFCvSyNkEEgeYg
 nCuE/6ekR5+rWiBCLFVIL4lg7b8Bh9TeqE0TN2CLc6S8Igb2iI4wUntlQuWINaC+3AdR
 7SDHgDJUpdLCZcRQTutACjFcdgrLx4oPQtsm8u6Sj+0/jk2yffGPsu6/cgGs3BSP8VmD
 fyHK4wzf7bVrjuMmIDkkynTgFXnvRQjQUgOF6vEpu0LMvIyIT/gPvWaNYrOo9Ad3EHoW
 E8lZDk+F72Q12ziCpt3h7p8wNgwhkHaE9gWbbhX1YIBv3yfxR+tzm98C7JwMZYp9Z1pd sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj0ntc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 00:42:18 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20B0gHXt027384
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 00:42:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj0ntb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 00:42:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1ICFycpxn2BQjyzkqM3GMO+IdgwyH3XJFu0qNjs5I4PWGUrSDqd6y0rMq4TEhS9nJ8W3C/JimL1SmhSnKvqSh8W19q5OAoZlgahg5yrlAgpjd7M8hn/T4j4X1KD2Xze3SlfTgz/JtA5ErQ7LowIFvHfRjAmc97FNDX60PV+aw4/oryOqS+7tykCllyxEuLg4WjMk/EdOZC/Gd8Gk19/a57XgfOX4YQLDXj0YZVnat2hPLYo2ABXe4vmBoI+YSuGVWsjhp6K/xDszZpsROTEk6tHWQZCzlYW62rT/P+ZJV+wnKeEupBWdJJZWWlzq1Mh25K29OHyTjp1bGZMSwXuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybVLOaTd4+QqgNsBKUa/tcAB6DwjkJawdavyCg3zGjw=;
 b=M5E587F2jcAkiBU5y2bTGX86Zcg20ctyyPZGx70hWZgmH/GsccSsCzkPhT3dJPmdMXkzFAz6xpeDkCE927/e2QxokZJAivxHZwr7MpI10Z+nvWqqDxaGm+Hwa0gA/y5td8TZiMWZR2VzLcrSkaxbufQfvw9yjxKJ8NWtgfd5OQdUanfQSKYSCN8TdhKqUARQwfLgRQiLPPm+YqnckWIf1cRAFceCGmMyd1s5tWcjKLZjdd29IcdZGvdnhHO/XEn0QtnMJ/VY5XmsLS7y6pUSJlrX+PxlLjoUp9VUa2eBOtdMF8o53Uh/090icYGbbC0tbNcR0LPgd3SO/fXU6eBLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 00:42:15 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 00:42:14 +0000
Message-ID: <3af9de80-884d-41e0-59a4-ea700c9b6656@windriver.com>
Date: Mon, 10 Jan 2022 16:42:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [RFC PATCH 2/3] kernel.bbclass: remove do_strip()
 method
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Joshua Watt <JPEWhacker@gmail.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
 <20220107212446.132386-3-saul.wold@windriver.com>
 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
 <CADkTA4NYGboThC2b5=R6vw13HeGKOu93raMbgUk9iPUmwPSX+Q@mail.gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <CADkTA4NYGboThC2b5=R6vw13HeGKOu93raMbgUk9iPUmwPSX+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: CO2PR04CA0156.namprd04.prod.outlook.com (2603:10b6:104::34)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f1f5fee-5c1c-41b0-21a0-08d9d49b3664
X-MS-TrafficTypeDiagnostic: MWHPR11MB0048:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0048E65C5462668F5CF7F64AEE519@MWHPR11MB0048.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f/0qi/jWpqUPm9MRtG4i5GUlex8LUjDA9owHdt0O32mylLJ+Iz8tU1Mdn8is4QQjjBcqxnA0XhfwBlRe1rx97++qTEeYjH5GuP+LzEwZRDlStq1gbEfe4zd138zCQDl90dCSJsQksHAhaee3qc8/poNlXhtPm0Jz23TwBnkK0kaGOPsyzFIyIgJ5rXodnLh4wEJXiWlKlimUDUxFjRxRuacLLuHVoy8ezKcripaT1LRxgPCoca+e6rQFGOr53tRZz4KTkc14Ek8PtUQI3CzB4cgjaw8sgDOBcWvh/9mGTPiDbSC0f05vqM9RmyckPmoKBm6h24xaq3Fgs/l+jUKhRGJkX7lzk5UwntDGwoBiVcbgynXrsOiZjD1/AKWsgi4DiBD9xU58Wst7foepjhhTnEBIa3T1yqQ/9C2jHo4rsMqk1WDaRyptPa7UM39ghcy0l6+4J+eudWu2XfbkE44VzHDoEuMRGeLz2Jw6KqkDMQg/fhwGPxthPktSO+DXggDVDtTizlgys1FfEwreF+9/2VE6lskaIiFn8RZC39EbCYPlUS48M2qSXoykXUWFjOJj+ZPRp+atc8MTJLEdiBqCB9sY4hiaTJOKDrKyXMOgHtpWEBGmYuq0ZSurMpgL68+zJLJr0NSfMNkfa8nOTx4Y7GHiXURZA9OmWv/6LVts0hyr3NwzdQmOCbLToyuV9VJqWkEq6n/cc2QX9dz2ajgmwAiYRQdbG3ZwuI406eZw43aq+EHTmt9Lx7lJdkfT4pEbGC4Y1ECEaWQDp6xqew5O7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(36756003)(5660300002)(6512007)(2906002)(31696002)(86362001)(110136005)(316002)(38100700002)(54906003)(4326008)(31686004)(6506007)(26005)(6486002)(66476007)(53546011)(66946007)(186003)(508600001)(66556008)(83380400001)(38350700002)(52116002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGZKc0hQSndweTNEZHFvNlhYQThtM296VVpLVU5DWGlUSXhrOGVYWDdPV2w5?=
 =?utf-8?B?WHNaV1lIcDlETCsxYnZjaXFwaXd0VGw5TWxqdlkzWmtkSUhhc3FVNWNFM1dD?=
 =?utf-8?B?TmsvNk01VnB1WHpFanpnWDdzdFpNeVhZeGFUa2U3UC9vSXdxWkVkMmhQOG95?=
 =?utf-8?B?SitjUDBnblBHUDF5b2RFaEp5N1NMMUdsQmFYUkJsUmNkUCtoS1pURjd0M3kz?=
 =?utf-8?B?Tk5PMVlGUDZRekVmRlpvRjRTQlJqZm5VWDNOVUxncGppRUNDYVQybEtTR1pJ?=
 =?utf-8?B?WWJyc2o2MGcrKzJKQ05vS3poQm16cnd6ZHM0MEJFOHVFMFBFM3NmV1VHNmR4?=
 =?utf-8?B?SFhxdHNUaTRCdW5kNlB3VkpKRGQvbDNFdmo1SlZENWVHcVo5eW13NFh4dExK?=
 =?utf-8?B?WTJzNlVWVmFxcFd5Wjh5ZVl4TFNnMzJwOGlHMHZGUThld2ZnL2MxckxKalJD?=
 =?utf-8?B?YWRiV1o0Vm15TUJxM2s5d3lwTFp1NDZMUXJYUGt3d3JFb1lWZi82eXFGaFpa?=
 =?utf-8?B?aUxQOXVTNFNmd3R6WU9GR0R0TjlaTCs4djQ2Y3U4NGlPTVpWanJEd1ErbU9n?=
 =?utf-8?B?dlVRVmcvNW1wbDh1UnlGdmhYVjA3NWxNYmtyNGs4bG4zbjJWWnc2T3JoUFV6?=
 =?utf-8?B?UnZnMHJrQzdsME4vcEd3enhuYmFKSjV4RFhQVEhWMWsreWlNbEdnZHpGL0ZS?=
 =?utf-8?B?TWd2WVE2S3ZrcXk0UkNRcTNRdVE4eldULy8zUW4zbXdJam14MG1MN0lkakdm?=
 =?utf-8?B?cm1PSkpuYks5Q0gxSmpNT1dxcVg3VkpLcnRjbVpNNzhvTFNHekxaUmhnajZ2?=
 =?utf-8?B?cjI2UW5CaStyRm9SYXRZNUUxMjNHSGw1d1JYSGJBVjliOStoZGVQbHpRa1RI?=
 =?utf-8?B?aDRoOTcxUTI0T0Qra3lFYmNoNzdGN0tSU1RIME4wcXllNDhXME1NQnlHZ2l2?=
 =?utf-8?B?RG81ZGRhYkprZ1FkN3hKakFpVHhrMTdIZ3lIZlpjS2NHbHhRMGtoV05UMnF0?=
 =?utf-8?B?Z3pNOWd0MGxOcm5yQWs0ckFXZ3VmNkk5UWZZSWNXWjZaTEswak1YTmxjdTBh?=
 =?utf-8?B?L09LWDIxcmVaTTdPOFZaa0hJTk1lUllNNlcvWExacnRBRUU1a0dLNVFLQmZu?=
 =?utf-8?B?ek5oZHBHenZpUVd4UVdTLzN4NnM1MXZEcnVwTGk0Z2puNzM1RW9iS0xMRUQx?=
 =?utf-8?B?UHdleGxGb3FRWEZ4V25DcXRFYTFmcEhUWUFuTkM2VVNMOWQzRFN0V1BnaHYy?=
 =?utf-8?B?R3poY0dIOVBwVmZHT010NTlXTUE0d1VxRWEyTHY5NjBSbC9aQWVLZXJ1UVFD?=
 =?utf-8?B?VWZCbWJMRmJGb2JWOHBKZWRBYjhoNDV5WDFXczFyODFZZWNjUEs3UTE0cTdN?=
 =?utf-8?B?UE1PVVJIVFo0bitvR0Y5Y0hZejRONWNuQVVrQU5JUnFwYkpqWUNHaVJuMHdq?=
 =?utf-8?B?aDlOSVMvWUNxUlN4WXlsTDdJZzF1SzlUUGh2andHbVhUYnhRdThwVVBLUFdv?=
 =?utf-8?B?ZEc4Ykd3bEYzQTlIOXhiYWR4NXdqZnM3eUoweUJDTjdaZ2VtR2QwMTNHbms5?=
 =?utf-8?B?SlZseE5ScUZveHRFNG8wYy9LOTZPQVJOTXg3bmxYTnlEb21iNXV3REtBdHN2?=
 =?utf-8?B?MVFRRVNodUJ2UXBxSFZ5YXRuT1dnbjRQTWoxbm1uQ2dQVnIycktRMWpKS1NF?=
 =?utf-8?B?ZnJERkY4Uk13eHFnV0IxSGhhb0hzWWorT1JGRWdYQytFZDNsRlVvbWQwdGtV?=
 =?utf-8?B?dXhSSHpoT0VHTnhKMGEvQkFRY0J2b1pISWZtakk2eDZNZkpRTGVTdEpUc2Zp?=
 =?utf-8?B?cFkwaHlFZi9BZWVFOEdSUEhLSUx6M09EWFk5QitNRjdDeEFpemlLUzRhNjF4?=
 =?utf-8?B?dk5qRGxFZUxnb01ieGtCOTNtYVU1WE5sZ2d0ZzVPRFFmWjU2MUFMb2JpQU9o?=
 =?utf-8?B?U01JSzhNeS9CTnozRUpzdFZPS0J4cDMwU2dpWjRzSmtHejhZdnVDRXpUMGFV?=
 =?utf-8?B?K1kyTmpydlJ6dTBkaEhUT1k4NWVIdWdjZVpiV3BhTGxsd3UydnhTS3FxRkQ3?=
 =?utf-8?B?YmF6UXp5NjhHaEplcHpuRWQ0L3ZWUnlIdW9lMEhZWC83QzduaGpUMzRjTzgr?=
 =?utf-8?B?TXc0QlI4QkJaT1ZRKzZrNjJnN3ZQbEpyT2szZ1NhcmJpak1rNTdKUzhUaXBY?=
 =?utf-8?Q?24pz0c2wl6RKm2m4s2BQ7Uw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f1f5fee-5c1c-41b0-21a0-08d9d49b3664
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 00:42:14.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eHnnkTu+r7Mre0qerJB4Fr0qVNM2PEdbLuLA6dT5dKzKyd4GF+nuw+E7lvJIZAWidFuPC5ZQZ7KGw2W+lBt2rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-Proofpoint-ORIG-GUID: 9mFCR1VGaHiQFPbj714PslVpxudDv4ip
X-Proofpoint-GUID: nDejXmlZIWAxbpl3bTxxpYIThxrF24tO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_10,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110000
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20B0CuJd008444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 00:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160382



On 1/8/22 11:27, Bruce Ashfield wrote:
>=20
>=20
> On Fri, Jan 7, 2022 at 6:19 PM Richard Purdie=20
> <richard.purdie@linuxfoundation.org=20
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>=20
>     On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:
>      > Move the do_strip() functionality to a more common location in t=
he
>      > package split_and_strip_files() flow. This makes it possible for=
 the
>      > extended packaging data to be generated correctly for the kernel=
 and
>      > kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused =
in
>      > the runstrip() part of package stripping.
>      >
>      > Signed-off-by: Saul Wold <saul.wold@windriver.com
>     <mailto:saul.wold@windriver.com>>
>      > ---
>      >=C2=A0 meta/classes/kernel.bbclass | 35 +++----------------------=
----------
>      >=C2=A0 1 file changed, 3 insertions(+), 32 deletions(-)
>=20
>     As I mentioned in previous mails, I think this will mean the
>     do_deploy output
>     will change and become unstripped which may cause a problem for som=
e
>     platforms.
>=20
>     We likely need to keep a strip task but call the new strip function
>     from it?
>=20
>     I personally think this is a reasonable direction apart from that
>     though, at
>     least in principle.
>=20
>=20
> Agreed. It looks ok to me as well, with us making sure that do_deploy=20
> can remain as it was.
>=20
I have been looking into this and realized it's maybe a little more=20
complex since the do_sizecheck() needs to run also before do_deploy.

Currently, I believe the ordering is:

do_compile()
do_compile_kernelmodules()
do_kernel_linux_images()
do_strip()
do_sizecheck()
do_install
do_package()
do_packagedata()
do_deploy()

If I move the strip() process to package, I also have to move when=20
do_sizecheck() runs. As you mention we need to keep what gets deployed=20
to be the same with and without the package split_and_strip_files().

I understand what your talking about having the vmlinux image (which is=20
the one getting stripped) is the same before and after this changeset, I=20
don't think it's an issue of the deployed vmlinux being un-stripped but=20
the vmlinux being stripped in the deploy dir.

We can't really call the package.bbclass strip from the kernel bbclass=20
since it's part of the package process and called in a multiprocess() way.

One thought is to have a copy of the vmlinux that gets packaged and=20
stripped via the package process vs the vmlinux binary that gets=20
deployed and optionally stripped when KERNEL_IMAGE_STRIP_EXTRA_SECTIONS=20
is set.

Maybe we can talk though this during the Tech call Tuesday.

Sau!



> Bruce
>=20
>=20
>     Cheers,
>=20
>     Richard
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

--=20
Sau!

