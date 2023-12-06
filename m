Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CB4C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 05:33:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25217.1701840827246820500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 21:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=NMn5bpzD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=070488d77e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B65PwFu025363
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 05:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=zA0WSNUrCgwZXGYNQXT
	Igo0nYMm65hwNALtmpRfBz5I=; b=NMn5bpzDqSSANrM0RBri6V15zeAfOgic6tG
	RcRUYq/EZE9ReStfiJ5UcmPy8ncPrHbawXahiFxqLWT1dXLIkKdW/uHQMP8KtYUD
	f9k6ZCb0rb+5udQdadq02PI5hnjdIhwBiolG8P7WiXFwQ4hbOWMrX6mXiqKZEsFg
	Lb6CMWUfJPg45LQ4/iTJAHkIbEAqQXAbhKEjhxq0mGa2R5cyoNSzjzqdhNCrYg8A
	qXekdwfngzImzNIEImRD0W8DbCTKNzqyW6iRgox89zI8wBgTNljl44z76F9qIMI5
	88Oe1SXtSSm9znrh7qPAOYc9jYLvprkMGTnb20Ay81/5Rq8VsaQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53r710-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:33:46 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B65WY0g000745
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 05:33:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53r70x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 05:33:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpHPTojYBzGwryHfZZeH4z0nSQjxfbGI8tIlWirVhVMyEeQuAlWUQfw27I6GtmIH7+yVIiNdnWQEh1P7Py0UnZmLQEzGlX9+MXJ2EYCMOTeWo/IVXbRHRgiyAmw1dg0fVXAWt08bbaN6/2uDmpPwJKGp7lUbpJ51aXuuvteG3EnvVW8QCjNqvKowsEMfvQzKZ2nKQR7qwIywVxCHhw6aVAcwObAfy9BtSN7uy7U/t/kfjizlk4suF82/S75JC84wyWfbTtxa27TtNh8E+EcZ7lkakqh1B00sFomAFq3Br/TNHsgceczpR9ykMxmMCnJT/ERDEtg4XG8DjVBrAClRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA0WSNUrCgwZXGYNQXTIgo0nYMm65hwNALtmpRfBz5I=;
 b=iy7Yoyco7MKasi1xmyKqNfeFuBA6I2h3lrku9gLvYs2rA/HzPpgvm3IkyYWUcbLD5VC776ChyGlsXYg6WbxafxiTv3NQghcfF4DfbGS7UZSdl/6pIsTutMClleDmOu9DMw5z1Cpsk6FARUvMhBlKN/gLkf49cGSE+VGjKT6s5A8g8LWo+ZUqlOr0y69x9Rk9PQ6Gojsv3fn9OQYnGmLPTcLGBzXWjFcA2drH0MZJb5O/b3J1u0DKMBg6OlodVqCAx15tTSUxktVDQryK3JzBTzoLK51Iq0fBARSamYsZNMjmr7+NvVPs+ZffSzNL94fdK4+HtV6WxQ7zBTUEmrHzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 05:33:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 05:33:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Kvx0J55ww9QkQAV0lsjpRRJz"
Message-ID: <4504ad64-800f-43f6-8140-498f64785d9a@windriver.com>
Date: Wed, 6 Dec 2023 13:33:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231205014155.3991250-1-changqing.li@windriver.com>
 <D76589A2-EA11-423F-8C77-283FB96BD89D@arm.com>
 <CAMKF1soNHse-DV2t1caHGci6c=KbPgYd4R6Aw2PW2Ev2CGa2Og@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1soNHse-DV2t1caHGci6c=KbPgYd4R6Aw2PW2Ev2CGa2Og@mail.gmail.com>
X-ClientProxiedBy: SL2P216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM6PR11MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e57af4-d897-4a44-16b8-08dbf61ce7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/V+Ar8C6CTxiioD/s9MWYEEBP+7CWcUmV40GziiNfkE7YkclVaqckoXiEuL2PFkgklBAbymTmyK6bLzsmHUcnstDknnjFIyLEHHHfozcK4GP0KeV+A/cCmUp5EvtDHTCIZ6CVqCTbG79dFBbAdDdxiKKFnUae2x93r9V5tBlydl+5I+QZAOfA831LQ4rnP51slQUU8+ZCkfzCrwHqivwADLEd2yDshtWUbvZ4gmfFTL9ysqrpK7iDAx/RmUPK7ONeGQz6Nx1tH+LBL+n/6G1JrB9y3mWG2mx/vuujY7tcuulttX+0rxbSbLu6DknZU62guPVsmZ9A2tfb0gyzOwkWJPkwYJ6L4TgsHGFFT091BlOOKTs0um8ISSSswIXAN5K5kumGEMb6N4rZMmqF9EaK+O/pxI0eqI8k7ykqoBFJh8rdS6QOOGJGR5rGvwH3IgUb7CaSyEqTb+8gduwN0pjzkY5MQihg1Jw0Vveyp8DtS2Q+j8C4JP9P5beHoEm3goAOBAYQxt+RAsFsEdpNPOq/x5IOvI+g8N0OpwVMYYfA1U9fZ9NflCG4lXaIAZPL8e7V8OybgkC9LNh8198+AB4gcvZzzuwDACcxGw33PqYaqV6hYXpMWersLiL2QsdX8CrlJX6ZlyCo8K3w0BfDR8Z/kbb1emk8wtBXCOvswKcYK3nYp16jpOLSRXG2ONzh7NdoM/iURSbNJGYTX9iN5PBm7JyOlu80MzzWp9yS8ftkyw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39850400004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(83380400001)(478600001)(6512007)(2616005)(33964004)(6506007)(53546011)(26005)(966005)(6666004)(66899024)(316002)(110136005)(66476007)(166002)(54906003)(66556008)(86362001)(36756003)(41300700001)(8936002)(66946007)(8676002)(4326008)(31696002)(2906002)(44832011)(5660300002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bndQZnBteEZ0ZE04eFl4V210bGNEbFZSdzd0ZkN3UWNIU3dRbmNaVXVTbUZl?=
 =?utf-8?B?RFJ3MW1WY1pMUDNIbXRyak9CUVIrcENFdnFLS0lxVno5aW5MK21CQktrZEh0?=
 =?utf-8?B?TFpETEFkMCtjUzlPUGxmTDJDQ3U0b2VnYld1SkFlS3U5U2hGUTBGdTdLQzJ1?=
 =?utf-8?B?WXdSQ2FLQzJFaEhuREdDcmp2VHh2UXVqSWJXUzJPTzlzWVV0RE9iQ2loMmIz?=
 =?utf-8?B?azZzRUdNOXhVWkZ0bjNQTUlWcU1wTlh3QkFTL2krRk5oL0JoYUxuYUpzVCs2?=
 =?utf-8?B?WGhKRnViNDlDTHBYbFE2WmxYUms0MTF5Z0ZnVHRHMTRSMzBrM1BwU2FoK05R?=
 =?utf-8?B?aWgzaGcxZDczcU1HWlBuM3kzL2tWa1RVNnNteVE2Sm9pdDlJcnhhVXNJWC9D?=
 =?utf-8?B?NSs1ZmxMcGlwT245bXNaeUxwcE9Xc28zZkc1aElkWFRrb2RPZHNJdm9Pc3N0?=
 =?utf-8?B?QzdjQWtTYkg0SDdhVFhqaGphd2pCZWt2QTBCZTdJbzJ5a3FLa3l1bkZyckNl?=
 =?utf-8?B?Qi9qeWplNVJvdE1aZERJL0R4cDVEL29ZSitiT0FKY2phYnVjT0RBQ2ZvcllU?=
 =?utf-8?B?RklaSGNDSmNINXNHVUtaZkxrNGl5ZXpKUW1aN1pDZmZXYjU2aDRmQndta1VT?=
 =?utf-8?B?MHBIWnNIelJBVTVXeEhYMFZWcDFJU2czS052TEFCV2t1K2dJa1ZvSmU0RXVM?=
 =?utf-8?B?cE1BY3IwZGlLaVN3dU5PVmxUWUJ2cExqSllpYk1SSHFXWFlpd1p6bjVxTXJD?=
 =?utf-8?B?N3RVTTJseVdkSncrYi9wb2ZVanh2VHR4Wkc0cVk2QjdWUmFHQkttUWlZQkFJ?=
 =?utf-8?B?WGxNTXRhQzBIZ1RabTFUYTRKVUl0NzFnOTE0dmZQZnE1SmNuK0lOb0t5MzND?=
 =?utf-8?B?ODB4K2NSbG9mL05LTlZJNEl5NXJvUklPZTgvdnRoZHk5QUtPNFc0L1ZnSEMw?=
 =?utf-8?B?V0d4dWdOei9PS1JoTVNGbUhHSnZJNll4LzFBc245VVFDbVF0RXV3UEFXWkVD?=
 =?utf-8?B?TTVsNWFlRWhCMWFXdkczYUw3MnU1R3JCMzQ4WmNwL25WTVBZRG90YW1IaXgy?=
 =?utf-8?B?WEVnNlhkZ2hyRG1zK3gxdm5McDM5citsbnVBT0pwUTRMcndOOTdBN1lMWitL?=
 =?utf-8?B?ZUd6ditWblJjME5iMjFwNEd0ci9LeXVNdkFHQXFhd2dJT1BrT2VaNmp6SHBQ?=
 =?utf-8?B?NUxKVXFraGtPcHU1U3B2M1Bmd0hoNFEyTXdpbmRSQVg0SlIyWVNhY1pFZC9M?=
 =?utf-8?B?UU9HVklQNmtyUG5TM1h1blBNVWhjalYyMW9LK0NYUkltK0pxdGoyN05TbTlN?=
 =?utf-8?B?NWtydTByVlFQZTNyVGQvbkxPczZGckZNcUpiSFZRdW9jTk9KK09UUGduK3hL?=
 =?utf-8?B?MUxtNDl5cERUSFVYSnJuMVd1OFp6REsyQ1VBZlNSWlNRNTc4WXZJY1BmU1BI?=
 =?utf-8?B?REtpOVVYNDA5U3kvQ04wbkhKcGFUVSthMWpRM0l2ZW9vd1plSVVVNFBXaU1T?=
 =?utf-8?B?cmFraXVkcFIyR1hIWUVQaXpzMXhMam0wY2V3NlRIWnRBaFdRTWt2Z0d5eDkr?=
 =?utf-8?B?OVdFZE15eXVpSUpKMDF4N3F4UVNUVE5KWDdZVUVNV2lOWEtzbGkxbm0rTHpD?=
 =?utf-8?B?KysxMUtDTkcyb2FwSWtaWGEzaUJLbjdoWmRZZHR5OUxyKzMveldCdGhHZWsw?=
 =?utf-8?B?dFE0QnhYK2hSRm5iQUhQVTR4OUUyTTd0elZ5RXRXQmsvWVBDcjFtOEw3em03?=
 =?utf-8?B?bDUxU2M5K0I5VWNrUFkvVjFTL1FCZUFzaHc2dUMwMlJmbFdqRWVKcUh2T1dM?=
 =?utf-8?B?cWloQ2R1endodHFHYlZKKzJMT2hQaXNwL00wQktyemJ1TkdyZkpyV0g4Ylpz?=
 =?utf-8?B?TERlSGRPSmdubjIwUlNySlRkQjZnTDJUT3IvWXkxNVF5WXJtcEFScTdYakov?=
 =?utf-8?B?ZXBCY2g5VHN3R1JWT3NGeEJqRXhDSjZJUTk2RUtkSUpzTWdLUDZXeXZNWlR5?=
 =?utf-8?B?ZGk2dUJYVWRmS1B5aXpkdWNqSmVnNWhENUdOeEpUZEg0a3EyOW9MaG1RYk1E?=
 =?utf-8?B?eEZWaGhKSFJkYk9FUkdRa3haaTQ2SXlpUm1FLzBhdzFZTGhtQklCVFNPWmla?=
 =?utf-8?B?OENaNjg1azlpT2NuUjNpMHlCQjBOZ2ovMDluWlB2TnNuaEtwL3pKWEo2WUZT?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e57af4-d897-4a44-16b8-08dbf61ce7ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 05:33:41.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JJn8ePdYd7gyoTu3H7iUoFEpaAbd5rMKtyTxOFQX+3piOf8q3BO33fZZNvoFg4IasAgb7gZvQMJxeX/2wJQ6+bp0LGn2bXD/wMOtOMGH+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
X-Proofpoint-GUID: K2AUCWPo0s-pHKBhVsiGDD72qH58Hbq6
X-Proofpoint-ORIG-GUID: 2_NlUBR_egOvgWyq0StpuYNUmX2CvzWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=807 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191867

--------------Kvx0J55ww9QkQAV0lsjpRRJz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B65PwFu025363


On 12/6/23 02:27, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Dec 5, 2023 at 3:48=E2=80=AFAM Ross Burton<ross.burton@arm.com>=
  wrote:
>> On 5 Dec 2023, at 01:41, Changqing Li via lists.openembedded.org<chang=
qing.li=3Deng.windriver.com@lists.openembedded.org>  wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> To fix:
>>>
>>> Error: Transaction test error:
>>>   file /usr/share/man/man3/crypt.3 from install of
>>>   libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
>>>   man-pages-6.04-r0.x86_64
>> This feels like the wrong solution.  It feels like one of these packag=
es has the =E2=80=9Cbetter=E2=80=9D documentation and that should be the =
one that ships the documentation.
> right, I think these should be deleted from man-pages recipe, I think
> there could be more such conflicts with
> man-pages especially from glibc recipe.

In old version of man-pages's README,=C2=A0 it mentioned:

Note that sometimes these pages are duplicates of pages also distributed=20
in other
packages. Be careful not to overwrite more up-to-date versions.

So we set man-pages to lower priority,=C2=A0 so the doc in the related=20
packages are used.


And if we delete them from man-pages recipes, it will make man-pages=20
missing these docs

when eg: libcrypt-doc is not installed.

in man-pages recipe, ALTERNATIVE_PRIORITY set to 100. So I send an V2 to=20
update

ALTERNATIVE_PRIORITY of libcrypt-doc to 200.

Regards

Changqing

>> Ross
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191816):https://lists.openembedded.org/g/openembed=
ded-core/message/191816
>> Mute This Topic:https://lists.openembedded.org/mt/102984309/1997914
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------Kvx0J55ww9QkQAV0lsjpRRJz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B65PwFu025363

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/6/23 02:27, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soNHse-DV2t1caHGci6c=3DKb=
PgYd4R6Aw2PW2Ev2CGa2Og@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Tue, Dec 5, 2023 at 3:48=E2=80=AFAM Ross Burton <a class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&=
gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On 5 Dec 2023, at 01:41, Changqing Li via lists.openembedded.org <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Deng.windriver.co=
m@lists.openembedded.org">&lt;changqing.li=3Deng.windriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

To fix:

Error: Transaction test error:
 file /usr/share/man/man3/crypt.3 from install of
 libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
 man-pages-6.04-r0.x86_64
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
This feels like the wrong solution.  It feels like one of these packages =
has the =E2=80=9Cbetter=E2=80=9D documentation and that should be the one=
 that ships the documentation.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
right, I think these should be deleted from man-pages recipe, I think
there could be more such conflicts with
man-pages especially from glibc recipe.</pre>
    </blockquote>
    <p>In old version of man-pages's README,&nbsp; it mentioned:</p>
    <p>Note that sometimes these pages are duplicates of pages also
      distributed in other<br>
      packages. Be careful not to overwrite more up-to-date versions.</p>
    <p>So we set man-pages to lower priority,&nbsp; so the doc in the rel=
ated
      packages are used.</p>
    <p><br>
    </p>
    <p>And if we delete them from man-pages recipes, it will make
      man-pages missing these docs</p>
    <p>when eg: <span style=3D"white-space: pre-wrap">libcrypt-doc is not=
 installed.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">in man-pages recipe,  ALTERN=
ATIVE_PRIORITY set to 100.  So I send an V2 to update </span></p>
    <p><span style=3D"white-space: pre-wrap"></span> <span style=3D"white=
-space: pre-wrap">ALTERNATIVE_PRIORITY of </span><span style=3D"white-spa=
ce: pre-wrap">libcrypt-doc to 200.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soNHse-DV2t1caHGci6c=3DKb=
PgYd4R6Aw2PW2Ev2CGa2Og@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Ross
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#191816): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/191816">https:/=
/lists.openembedded.org/g/openembedded-core/message/191816</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/102984309/1997914">https://lists.openembedded.org/mt=
/102984309/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Kvx0J55ww9QkQAV0lsjpRRJz--

