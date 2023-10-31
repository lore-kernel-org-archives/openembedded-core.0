Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047C5C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 00:03:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.175261.1698710579371768724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 17:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ShjAlWJ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9668d672bb=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39V01C1T001273
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 00:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Y8/tkE3LxW//hMvZjQM
	t2/F0ZXnaJy7SGbFPDcbizZM=; b=ShjAlWJ75Nk++1cRZN79rpNypbHKxIYuZtH
	bjk1o5IrcbaxmGHynPZkh6MkYZ4F6ZW68SpQdc42fGA1iCmK3lmbmDmGTfGkl0va
	URsB+e8ioQEFSfdRkpg5dTO7zYVZyUpWR7+h2D5hxt26CI0Qh0dRockTl1cuwA9J
	b4iOJ8DkerAr5A+UW5kPEZMd6g7Hjn5MAhMhiq4aV+LVmNIqOdBreVd4KO2hW7TD
	FgCogADpTTQIG6ynA3D7zxr6CBN5gsmKaz6Rt1NMyqWdP6BZiU7hMkXh1TaUPoKW
	6ANCO/MOs8OQaet02By+3aguUa4+ttOc61qESIQkafxsyd3XsGA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxtx9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 00:02:58 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39V02vRe003828;
	Tue, 31 Oct 2023 00:02:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0qgxtx9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 00:02:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzzixQlmfnByXdR/cLJa0BD2OVwOvGrFMnk0GO1bW/BxFo8ecy3azrZonM5F0Jo2BVW9jrGltYZEc/ewMOoR7B7K5i+pB3R10x8Gm74ZvgHgHDP3m2SM2JfTMEpH1TP/eh+QfF0UUYwytz6YlPfWYjJmGjX4qmzSVzyfhtvYonNdV5YR6ZtlDWXXpxA4tqZnIGOyT/tgVzVJ3gOccez51ea/1ocEptdqdPyzBnUhzRU441HOKqDzRFBjBOdU5AGrJIcJfSxmIDm3V2I4tn8tAN7/wcfqPV/AuHgToUTwbAUBp+Tj3An/7M/WpoXouPLlOu0yCF9W91NaWiWIAKKbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8/tkE3LxW//hMvZjQMt2/F0ZXnaJy7SGbFPDcbizZM=;
 b=n4j5GoD55ZAogTYlUXt5s06oXkHbJK4I+/iKL5kJp86ff0WeE6g4EvhbqShmAGCNPLp5q9C3/+rMPU0g5QoCuFILOSuuQAb2ZF2ZoNT3HoA+ABgWRuKo+GiQQj/G83F1q0m8eLIRdacyOBDfhSLiWb5rvxJmBnptiJaChv8akAJi6uA4PIkEsUIB9/k0uzbXUSjcYILcioedWZl0cCZvUuuJ2V7kTwR2pQO7IYUiXsnpF/erlda9ktxQI38+04AtLc1lnX3ovvnCIAY6E7fdDDYHuNjMJRz0waDUSuptdS6ALkbEaFxSGFNtDv/aRbZt6xQ275quVoZp6SvwHRgsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 00:02:55 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 00:02:55 +0000
Content-Type: multipart/alternative;
 boundary="------------umdYtzkrksdhYI0FJ0dUBmDg"
Message-ID: <91152d8d-4c80-49c5-8945-90bc9be0aa3b@windriver.com>
Date: Mon, 30 Oct 2023 20:02:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][PATCH v2] volatile-binds: Calculate the name
 of the /var/lib service
Content-Language: en-CA
To: sveyret@gmail.com, openembedded-core@lists.openembedded.org
References: <20230828175255.18811-2-sveyret@gmail.com>
 <22939.1698481072274961112@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <22939.1698481072274961112@lists.openembedded.org>
X-ClientProxiedBy: PH8PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d47306-813a-4b5b-865c-08dbd9a4bbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kz6qnEDL4UAopH9LwEtXA1Nny3qw+5lpfcNU/GNAOKGDIMevkp5+vTVSmzfcT0sRbIdkf7jz4npg0fySBCfxXNVoPL0x08h0Cyy4+5f8uCgqfVz8quVpi1Gq4VXVDn2fkzREK3/rA4rpTqlWJ75sFNugLARnQq8AEKbTYfaGmDQ5u1JoiEhiDEdxjj7XNrBsuVGqDSg88nT7gdsySFsCmtliXN6eQsougZDmeBUlSrdTQDI5HGqcIKHOpT/94qQ2bRMK1t65k63CdagQQ9k5oF1cfyhqGZnERdaS8VLnw8d1SslR3kE1JI5n7QjlxfJQVUozB9Ya8BDk9WhvpB+PPSmf+k4F6qaRgdHBj8S6q2I/LQVh8O+dBp20mwchlyFoGcbLvPq43NbLEhgQCcbedpVudoVHSlgx2yLNYZoRmNsCvuzBFb+rnKYh5GeNJ72YmmMpg3Oi3IIBUxzfMJ2zH1tZSu0F30sCXajZyWWlMunDg+nkUEfw4k5xZjLlFiW7SA+BwOcYI51OkV3g1caFIIqdbHKyHSe1znqQkdj1BOSyAWhJ+c+KZUmOEZS4wsBRS0xVbXd2Fv0EEeD9JBEHiRFeQctH8UyzQobQp+zAZC8I34trPMQDcQ6Tbbogp5rEkEg+KJ1mfFXVw3AHRpI2gXLiHnWZHYOsMwdxe9ZbR2DY2iyx651nSuLmPgLGhNOk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(66899024)(26005)(6512007)(38100700002)(86362001)(31696002)(36756003)(166002)(4001150100001)(2906002)(83380400001)(478600001)(6506007)(33964004)(53546011)(6666004)(8936002)(8676002)(66476007)(6486002)(966005)(5660300002)(316002)(66556008)(41300700001)(2616005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUV2VTJBWnBZTENrcGhYOUoySzl3OWZaUXBGeDJON05sNlRiMGFjUk5QYUp0?=
 =?utf-8?B?UHlKNXIwTGN6cU9ITXd0enhTeXpZSlo2SVYwbGxydnNFendLRlZSeW1JbTVK?=
 =?utf-8?B?SVhWejRCMEo4NTdDcDFQN3VpMTF0OTZJMjJXYlRQaHQvWEMwbmxzR3JrOXJD?=
 =?utf-8?B?bE9VWUZ3OXhLWHNtMURJY3VKL0VtNEpRSUpVNFozcldCdXNPWE9UVGRNd0VT?=
 =?utf-8?B?T3E0azVYU25Yd2dOQ0Z2WXZUOVEyNjVObVQ2dDIxUzVUWnhoS2JUbkpHMGlN?=
 =?utf-8?B?eS9MamRzejJtRGFZTUE3ekN6bDJwRk5yTHRBMS80bzdjc0JyWE5nam85dkRw?=
 =?utf-8?B?bkdOTytxdjc3bW5sbEdGc3pHMmo3d1JST1pOREZvb3ZpZ3FXajRGTHpyZVpR?=
 =?utf-8?B?K3lOUktUNUhENU5Zc0xxeTU5blRrWjV0NnA3elg2d2NkejFtVWEybXpkN00r?=
 =?utf-8?B?a0lDc1lKK29uVzJVR3J5elRzdWVIZUhQSGFrOVhEMStLSzFqN0pZU1NLV29p?=
 =?utf-8?B?NkpSZENadDlJK0RkVVpQTWtxZTh5a2dWVFF5SDRkenJHZTV3K0dCWUVuckhP?=
 =?utf-8?B?My9yY005M1hFT1RuWnk0ZnVpc29ISTRLZURxTGwrWCtiWmVUZ0xBcWxIT3RR?=
 =?utf-8?B?VFZXTmwvNlRiV09UZ0tnOU81RFlyR3l3Q2MrNjYwNUs5enhPNWRjd2VQczMy?=
 =?utf-8?B?YmtaY253SjExNWNEbnhvMWtKN1hGLy9Mb0dEbFo5OVd2ajcvbmNLckVaajBP?=
 =?utf-8?B?ZVJUWE1uVno0ZzdJKzBEOGprMkVvaEhMeFhxN2J4c2VQY2NrNGNpcnlJbGJC?=
 =?utf-8?B?SnpVSERmc0FyZFI0VmltelZwcE9QS3JvZTVMdi9WSVg1R1pOUDhodVJsTVhL?=
 =?utf-8?B?dmNzekVmTVJQTnZNWlJjT0lucEdiTFlqMzl4KzA1VU9hSE1LZkRzQjArbmZ6?=
 =?utf-8?B?VmphakZUaFNTSnROdVpPVUxDRzRUVUZPbHJRTFVTSEpUcEFteW9mTEw5ME5E?=
 =?utf-8?B?d2hVUnVkM1dDMWZaTFNaREhHVDFIV2tnMy9CYm1VTWZMUzQvbnR6cEhpekNY?=
 =?utf-8?B?MHRsRVlxN0FYWDVyRmlLWSttckRTSzVFcll4Q3BDdSthSFlEU0dRdElhRlRU?=
 =?utf-8?B?WDRFSzZlWUdYWklGTDVHaktZdFV2Zi9TdmtLVkF5TWxvbDFhMXNwL1F4STVQ?=
 =?utf-8?B?N2t5bXo1TUhqb0x3NFhaVmlIb0ZiM05tRWJGQUY3ai81Wk5JT0llL2FtZ3hE?=
 =?utf-8?B?V1M1bFRHd2ZYaVdFSFVTbGlGdXd1NU1pWHNLbU81REFBU3hxSFdFYXZpK01X?=
 =?utf-8?B?YUdjWUM5S1hDZzB3bDdBS2tiR3hZeWVPeVg1ZEQ3L1hiYlVuaGdTNXJGYVRw?=
 =?utf-8?B?L2xDZXV1Sm43S1dVU3JXdTVqZWxLVnZUUDIrQzlnTFUwbXpkejYwbThaUUFk?=
 =?utf-8?B?QlVRczZ4U2hYMXRlTHB6UEFsakJjNlp5amNzV1MvT3lJc2Rkbi8vU2V0ejFa?=
 =?utf-8?B?dVJiSHptMEFQcUEzMXdOL3ZJeGlOS05tWFRQbnFQSmRoRy8yVHREdkRVdEI0?=
 =?utf-8?B?SDVOVUxSeXRMY2FpcXlWQnpNNm9Pa3Z4VWdGK3RDT3NDdDlrNXpNN1NHYmZJ?=
 =?utf-8?B?Zy9JdGNONFZXZ0luUTExVkVxQm51REJmY2d0ZGRyeklUc21MWVhMaWtrRmcx?=
 =?utf-8?B?aDVldlN0Yjl5T3Jxam9xMzRuMjU1T2pDZFJvZ1VpTFVTQ0pDRWVwZlhwWkQz?=
 =?utf-8?B?ZVVBVW90UlN2cFkwL1ZVbDd1TjBrVFlLaHNPUllqSkl2ZHd3THZFcC9vbnZ5?=
 =?utf-8?B?Q2xIQmFUWnZSc0tGVkFWZUp6cUszYVBFNTkzOXRDMStXME4yb1VUajEvZFEy?=
 =?utf-8?B?MHlGNHhtdnZDYlFUY29zZEdHRlZJNWlDTlZwVWZUbkludkhkVndWeFhiOUxi?=
 =?utf-8?B?WjBFK2UrTWpUaXRTdEdhWmhBTFpGK3pMQ29MK2ErUU5DWDk3UDJsNC9rV25z?=
 =?utf-8?B?a0FmWkpkQ0FxQjdCQ3pjMEhaK01RaWozM3JWem5adkRBRzRDd1hNdnlkTSsv?=
 =?utf-8?B?MnQvUXhUNDNHM3JkUEFudWFCenUrdEI5U3R0akZvTjZDbDJZUUpxdHB3Z0kx?=
 =?utf-8?B?RXZYRkdLS2IvZjZUMS9EQ296cXBmZ0VzWVROTSsyQ0tnTlJBWSthbHo5OTJM?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d47306-813a-4b5b-865c-08dbd9a4bbe0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 00:02:55.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJpxDkkkNAL9gG3QbbvbYs4wn8dXfBNvVrOz0PV21/FXgZ1YIoRYEVsCV3EYHXatLJiZzH9pxPIOYGwI9W0YsWYp4cNYb4fDfUBMUX/sdLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
X-Proofpoint-GUID: 2eNOI0eD7mS6j3k2Wb7TWGan0rI3gMLN
X-Proofpoint-ORIG-GUID: 4pLmKNCLb3QE7bwBKA48zRBu5TKtp7Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=426 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310300188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 00:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189822

--------------umdYtzkrksdhYI0FJ0dUBmDg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 39V01C1T001273

On 2023-10-28 4:17 a.m., St=C3=A9phane Veyret via lists.openembedded.org =
wrote:
> Hello,
>
> This patch and the previous one=20
> (https://lists.openembedded.org/g/openembedded-core/message/186778)=20
> have not been integrated yet. Have they been forgotten, should I do=20
> some modifications, or have they been definitly rejected=E2=80=AF?

Hi Stephane,

The [meta-oe] prefix may have confused people anyway,
the two commits were merged this morning:

https://git.openembedded.org/openembedded-core/log/

https://git.openembedded.org/openembedded-core/commit/?id=3D66f0c2a1678cb=
69cf8d50372b0592c55e2dc3e3c

https://git.openembedded.org/openembedded-core/commit/?id=3D1ca031b775460=
56ca1994469b0f2e93ea2018edf

Thanks,

../Randy

>
> Thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189760):https://lists.openembedded.org/g/openembedd=
ed-core/message/189760
> Mute This Topic:https://lists.openembedded.org/mt/101015300/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------umdYtzkrksdhYI0FJ0dUBmDg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 39V01C1T001273

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-10-28 4:17 a.m., St=C3=A9phane
      Veyret via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:22939.1698481072274961112@lists=
.openembedded.org">
     =20
      Hello,<br>
      <br>
      This patch and the previous one
      (<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/186778">https://lists.openembedded.or=
g/g/openembedded-core/message/186778</a>)
      have not been integrated yet. Have they been forgotten, should I
      do some modifications, or have they been definitly rejected=E2=80=AF=
?<br>
    </blockquote>
    <p>Hi Stephane,&nbsp;</p>
    <p>The [meta-oe] prefix may have confused people anyway, <br>
      the two commits were merged this morning:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/log/">https://git.openembedded.org/openembedded-c=
ore/log/</a></p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?id=3D66f0c2a1678cb69cf8d50372b0592c55e2dc=
3e3c">https://git.openembedded.org/openembedded-core/commit/?id=3D66f0c2a=
1678cb69cf8d50372b0592c55e2dc3e3c</a></p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?id=3D1ca031b77546056ca1994469b0f2e93ea201=
8edf">https://git.openembedded.org/openembedded-core/commit/?id=3D1ca031b=
77546056ca1994469b0f2e93ea2018edf</a></p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:22939.1698481072274961112@lists=
.openembedded.org"><br>
      Thanks.
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#189760): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/189760">https:/=
/lists.openembedded.org/g/openembedded-core/message/189760</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/101015300/3616765">https://lists.openembedded.org/mt=
/101015300/3616765</a>
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

--------------umdYtzkrksdhYI0FJ0dUBmDg--

