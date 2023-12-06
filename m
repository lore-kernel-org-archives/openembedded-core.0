Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3085C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 02:39:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22510.1701830389908563861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 18:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=D86JUN/q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=070488d77e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B602WhR028146
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 02:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=2EZ37Q5GANyeETz493V
	NoRO7oL76t2Suz/+ydJeM02o=; b=D86JUN/q2LO+vFJI9rkybeZK/PEPFBA4Cuf
	PrpjswNLJ4qG9qYpHSVhbg7sUmjRBf/TzA7dG4aJ3Lk/dkN2+/SoTt1osmge09Z3
	oLiEvvLR3zWYiVWSC7RMXeNt4Uj6nvWxvMNgA67RnCwXudg+zbEZTJ6+PE6lyxfy
	mt5Ud7AHORxdSz1bZUQDuAmlak/vYzoikwf8Xf0b5REFWmXJVxnPHPK2QrnJBWIj
	TjmnVYVd+0CWlurkTUhkZn1RAlWStU37C1JbqcrBvumAiHwLSNSxM+c/EEnSKWe6
	or6USbbMCnzZzxRiRKaW+FQ3HhvuDZoHTUQ2ruWWsADzm0ReT4A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53g4a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 02:39:48 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B62dmmK009130;
	Wed, 6 Dec 2023 02:39:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53g4a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 02:39:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIkzD9fByBnr6sKREPopNH8W4Up51LUq3pWemgURhe8G3qsWVnWDss1PReeJW7cOXQXcaRkfU34MHNFPpbNoyHBecbopFeRHD1DMFSSAq+pHV9rZHUdSMYIoI7qL28uJiiDDZcsiG8pHLsGJRvt5OOn5CzKzn6Ycf/Iei1DUZAIul0Je8uuSxT6P13PD5PVI9Rq2lep9ljsOKd+orkOHAQEquQQuzcQIaLLBI89hBxgUQ0JoCjuTiVBcNOoauX8KFI3aMqLuPJJFM7f6+CRBMVfNXGMzP+sWvmNI5aq7tdNWBrPs6W9rQ+3xILGReu2sOAw254w51KqZdsvRwEL9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EZ37Q5GANyeETz493VNoRO7oL76t2Suz/+ydJeM02o=;
 b=Awjr5qJLozy8T8qCjf8bX6xamIhRfWPr3E/xMkXbm5TJ/3D/pzVavQQyibkqOQSCz4KpTETIl7phcyrLkMsUzljc5FQ1Vu0/etGdrcplMrrNUdGUoMcMmyEQEJwV7lYYKNeil0I5PxEZsP7FQuR36uLG0Lbay3j9J9BbHGpCDpA17HjbY1iBGIxS8t7BAF8Tj9oAhmweQzvZli630tRVgsPBNudTCQ8kze9KkF5DgEUSm0Ca7CnwYoVfcQ0FpUSQJe0vRRbZdlXjjvrfSwXm5Q8QCQvmHHRmUEtBrSccslkNMgVb5XzUL05hUHd88Npo36vWRKmsYxl/WThnPmWgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 02:39:30 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 02:39:30 +0000
Content-Type: multipart/alternative;
 boundary="------------p0iDTdLMLdeXT1bv4iDm9dV2"
Message-ID: <f997b989-a4f5-4691-a94b-625afdcf0936@windriver.com>
Date: Wed, 6 Dec 2023 10:39:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ross Burton <ross.burton@arm.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com>
 <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com>
 <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
 <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com>
 <07dd26ce-3ffc-4799-9d6e-0d910477622e@windriver.com>
 <CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: f28dbcd3-3c9b-40cd-1ce6-08dbf604921e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	voq2sdEH8u1noJ4fXUrXNOjzaVwCnSh62fyTC7r23cr6Nv0qN5Cd+VbemS9GpqwLW0OjeJaEAPGIsle15QHej9bTL6GJBDMl6WOPPiOdv4ggyYIyBo4CTVpC3Ts62lKuyadn336wK1MVty/KzBkvHxG6rKSkMETwttsUhfKlpH1NHF0CCpyL6f5GQMEkbCt75znjf04wSMGJdO6eE3U4JdolI3qScCOJrLebr81UYLkqAEnSCSLD686xL+5FNY74WcUTC4kf1wUtqC6yjGitNoVo2N3E7Ts2SmNvnYK4SfHL0n/Zljx+WBVA0b9v9FKKpQiHnI/j9s5LDwSc9XVoK3JDxecOgItcUMO70+Gt1WYXeZ3GfAnjH985j300V1ZxjdjjcSLpIHjnDZ1vp9E3MOFwEilR26Bgqc24xpn+ZLsvRuenju/5yo7toTwOO7IlPmEToQAZa29ERjWE15v0hdmHE6QZSLghnSYhPK1jBLk7kdid0DSS7DsyOgFlqRj4dOoQKGeKYLH14bsL9/SnAyXo8eniTfQf28O6LXZvoPyxtVR28qJ8afX9dpR3FqK1cBg1Bsc9Fs48etz5OtChcdeYwNl929nxZuXDUujuN02gyTmnpf09NnsoHpwbt+/I4kiNNF0AFJUMTaC2T6DvG8QX4WvU5oCQYPuKcclp3kxVHgOr2Wcyn3sDY+x6PTNkcbhxeT3Idcl9J9Su+uqdEDrnx8s3rwVjR589dPfqBL4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39850400004)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(54906003)(66476007)(66946007)(66556008)(4326008)(8936002)(110136005)(316002)(8676002)(966005)(478600001)(6486002)(6666004)(5660300002)(36756003)(41300700001)(2906002)(44832011)(86362001)(31696002)(6512007)(83380400001)(26005)(38100700002)(2616005)(53546011)(166002)(33964004)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmU0dVhkdm54dUpHejZ3UTdaSVV4bHpoSGE4alY0QVFmQS9oalM3OXZQNXVw?=
 =?utf-8?B?b08vekFITjduWjBVdHg3QzloZ0h2NVdGRFVpaVlhalI3eS9kMzFIR3Q0Z3Jh?=
 =?utf-8?B?bmg5YmszK2YvYVVqSlhBQVVwYWo2bDZBbGJEaVJSSWZEZkEyNG9KTkt1SVN3?=
 =?utf-8?B?VjBON3V1UHc0NmkyamRnSmtmeHlXdTdQVyszMWZsajhZR25qVWVTTTNZVm1T?=
 =?utf-8?B?eFdlWXJlVkJIS2xYdzdwa0tTdGdmTDV4OElXeTMyTXJzWUEweHhodDBsV3V6?=
 =?utf-8?B?eElubUw0dUtlYjB5dUduRy9Qb2JBeUh3d2Y3VDNtZXpJRERJZW40RjBSZ1lB?=
 =?utf-8?B?ckQ5aytXeEFZOTA2eWJzbnhXdWRrVlBLZWw4QXFlTXR1OVJuREkxeGFlSHNy?=
 =?utf-8?B?RW8wN0ZxSDlYL0dCTGwxSkdZTStBemVCRFBNN2dYa1cwa3pMbktTbEdSSncx?=
 =?utf-8?B?Qk0rYUdiREI3blBTVS9lTWV0SU5vRkRReDFVOWZGRDlSV2NGRTFjdWVBTTBD?=
 =?utf-8?B?WlpVdytibEx1NTl5c3ZUaXVGTjIxRHdmQmRVMTJOeHlOaUlCTmJReUxldXFW?=
 =?utf-8?B?dXBFUnlCRGZHTmdRTUQwaHRXY3hYTzVENWEwcFhxbytYdWgzSlRLa1dUUmN3?=
 =?utf-8?B?YTA1YUhXZEk1MEhScG93TTVGU3NXVi8vTXBieWw0M1FkaGJyWHRCelYxandx?=
 =?utf-8?B?Y3dmbE5qL1c3UFoxTW9pMU1lOXlLSm5HSTZ5NUVRaENpeWttUGdQWit6WUV6?=
 =?utf-8?B?T2xVMVJyYnh6bTRWRW5Qc29MbjBVY2dHci9jWitSV2pWamgweUFYejBFcVJn?=
 =?utf-8?B?bjJkVjZOMk00eWhkQTRPeThaQ2VaeUlWOHg1TTFxOTZ4d3prdk1UdHViTXFO?=
 =?utf-8?B?TEtaQW8vTDhYRU1NRVNJZGU5dGp2WE1XUU1tMU1WaVRvazVVbjd0WXI3UjFH?=
 =?utf-8?B?cVgySnRFZmtLZjJqVDVyOEVxMlhzOTF0SGRnWSswR0QxS2drMG9vUUVVK0xm?=
 =?utf-8?B?d1dZUU1DOHRVMTUzNU9lbDdkejNnM0VMRHZraDB2ZnNkWWk3RGJhc3pkT0tY?=
 =?utf-8?B?YW1KVnpRUXFHRG1wbzloN0E0eG4xL1ZuTGlYNEJOWU4ySmg5NG5SSUtDZFZ4?=
 =?utf-8?B?QmNRYWxTTENtL1JqSDVYVU9wYUJyVFlWLy9mR0Z2OGV0ZkZIbU42OSt5b0Fu?=
 =?utf-8?B?ZmNWMjJnZkV3VVYyamNKMHU4alBQT0FiUzdzdVRUL0Q1bFJHK3paYlhNdFhi?=
 =?utf-8?B?T0xxR3FEYzA1NnAxbHZha21yR1V0Q2JuQ3Fiei9OOElRWEZoSnk4TGU1b2Qy?=
 =?utf-8?B?UjFNYnZjaW1IblFhTS9CWEFIcitOWW1NVGhraS8wbEtyNU5BM25KeXpKK2wx?=
 =?utf-8?B?QzFubnZhL0xJMTNEL2NqOU5SMFQrUnQrdSszMkNuS2hCblpJc2Zxa2tFUUtt?=
 =?utf-8?B?K2ZKbVViWkExZlBpaHF0dGVxQUZiL096ZUt4cmFFaXREU3NYV28vR1hvWTVx?=
 =?utf-8?B?b2xYS2NVQ0pycENOTmFsVjhISXc5MDVxSmEwVGtkU0IwZmVObGhqUitFOE9i?=
 =?utf-8?B?aXVCaUw2NUlqS0JDazRNdW5TT3pGTjUxbHprcDhvdXpzcDJEMGpRODlIcVEy?=
 =?utf-8?B?QUt6SUNtbGp1RzhQSVpZTU1WaEd0Q281MTkyTmppQ2dxNllUbTdQQm4zb2hz?=
 =?utf-8?B?WkUvMk5SUEdlR0ZVRThMUkgzNGdFdGpPRTg4U3ZDUU1jb2NQM1FBdUZZTEUr?=
 =?utf-8?B?R1dzUVpPVi9HbVM5ZFU1YlYwelZsVGk1NWFkUFUzUUJiT3VESzRaeWVNUFQ0?=
 =?utf-8?B?NG1ITkQ2N00wazNqOC9yVWgxamU3cDdYbXJSZ05hNHU5NlphNk5MS2g5NFl5?=
 =?utf-8?B?a3o2eE44VEZ1VkUvcGFZSFQybmZiY0dYMzJvNHQwTC9lOEhJZXdOOTNwU3hL?=
 =?utf-8?B?eUVhZUNnek52UlRsV0Z6SGRpbnp6UWZ5M1ZEK3RIWWoyMytEUWFoSEtsUjZP?=
 =?utf-8?B?R2puQVlrT29JOGxhVkpETjhzOGw5Zk82OXp0eTRES1NiM3EvM2FkQkJWdjlR?=
 =?utf-8?B?dkMrbitpUG4xdlVBMVZMbmRBaWc4V0Q2VFM1OW5DakIzUHk2SmlFdGY3T2V5?=
 =?utf-8?B?VXgzWi91WjJCTi9qcm1Ea2Zvc0dDU25qTnQ4REYyUFR5OCsxSGZDNGhLNXNM?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28dbcd3-3c9b-40cd-1ce6-08dbf604921e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 02:39:30.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViJPKKyunN/d6pTs3ZnqB4pMLowHKFHFsFYJXEuTyt+WGovNqABJJlNcaJJbIhhCwXy4oy+zUblwQIF/sx7puh3oEUpJaEBHSc6cBenMWKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
X-Proofpoint-ORIG-GUID: VXxBJ0OK6MJQi_d6DGJ5FV31QvOAE9JF
X-Proofpoint-GUID: KQlZqcIoAQq7nrx137OfQFGhRoh7178D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 02:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191866

--------------p0iDTdLMLdeXT1bv4iDm9dV2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B602WhR028146


On 12/5/23 17:55, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 5 Dec 2023 at 06:46, Changqing Li
> <changqing.li@eng.windriver.com>  wrote:
>
>> So  I add this patch
>> https://git.openembedded.org/openembedded-core/commit/?id=3D406a72a9a4=
7c2735b7e18cefc682b1df00d5a9aa
>> to remove the lock file in rootfs.
>>
>> Since for dnf-native,  it will not have reboot process,  so it is bett=
er
>> to remove it at post process of rootfs, to  make an clean rootfs.
> The review comments that led to the revert are still valid, and this
> message does not address them. The concern was that the removal via
> rootfs postprocess is too late. If dnf leaves lock files around, they
> should be removed just after the dnf execution.

Hi, Alex

Thanks.=C2=A0 Agree that the lock file should be removed after dnf execut=
ion.=20
This is a bug of dnf. I had raise a bug upstream in Jul:

https://github.com/rpm-software-management/dnf/issues/1963.

This patch more like an workaround before dnf fix this issue, and this=20
log_lock.pid in rootfs

has no function impact, just a dirty file in rootfs.

Regards

Sandy

> Alex
--------------p0iDTdLMLdeXT1bv4iDm9dV2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/5/23 17:55, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 5 Dec 2023 at 06:46, Changqing Li
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@eng.windriver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So  I add this patch
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=406a72a9a47c2735b7e18cefc682b1df00d5a9aa">https://git.openembedded.org/openembedded-core/commit/?id=406a72a9a47c2735b7e18cefc682b1df00d5a9aa</a>
to remove the lock file in rootfs.

Since for dnf-native,  it will not have reboot process,  so it is better
to remove it at post process of rootfs, to  make an clean rootfs.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The review comments that led to the revert are still valid, and this
message does not address them. The concern was that the removal via
rootfs postprocess is too late. If dnf leaves lock files around, they
should be removed just after the dnf execution.</pre>
    </blockquote>
    <p>Hi, Alex</p>
    <p>Thanks.&nbsp; Agree that the lock file should be removed after dnf
      execution.&nbsp;&nbsp;<span style="white-space: pre-wrap">
This is a bug of dnf.  I had raise a bug upstream in Jul:</span></p>
    <p><span style="white-space: pre-wrap"><a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/dnf/issues/1963">https://github.com/rpm-software-management/dnf/issues/1963</a>.</span></p>
    <p><span style="white-space: pre-wrap">This patch more like an workaround before dnf fix this issue,  and this log_lock.pid in rootfs </span></p>
    <p><span style="white-space: pre-wrap">has no function impact,  just a dirty file in rootfs.  </span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">Sandy 
</span></p>
    <blockquote type="cite" cite="mid:CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
Alex
</pre>
    </blockquote>
  </body>
</html>

--------------p0iDTdLMLdeXT1bv4iDm9dV2--

