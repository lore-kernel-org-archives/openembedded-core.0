Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0278C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 11:56:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80796.1703591793110242243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 03:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QPE0i6m3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0724684726=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BQBp2Px021935
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 03:56:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4eenMgVHHfwBLxO8nUhcwZCckmBhVLHcUv9ALMhzqAs=; b=
	QPE0i6m3RF0susWKd+cebRHZx9xCrk1Y92YP2JxDz5udJ+mkLWP6N2Q8QccUnYng
	zFsIGEj9sB6ib6ng3FqqoCzqtUcptmbwThjVvOaAu6bva1KCdvtUhqpCWP0sBCuX
	7PlG3EggPpqxUr5Bc28/xf9xJoZZJafN5SSdUqImChNHkNZ4hquA+5iHz03db2Im
	DKY99RXqBprlCW6hrPqSleH/cRkKJqWPWHL2MyzO5OYujUBWJGbPeYnzd49B5FoQ
	rwLB6MMLIXjOkQK76bFqB+jSDvQW0jUGbx3kPd3Zrc8vGRUkt+7Io0xhOlm8Qqh1
	HuCK/LNCnf1UKMIPx623tA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4j44p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 03:56:31 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BQBuVhW027515;
	Tue, 26 Dec 2023 03:56:31 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4j44n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Dec 2023 03:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdWbuqQnxp4bf17auoiQuNb3FRwXVnG4Tbunt0NJF1jk3rX3UPaPbRp3vnsI2I6U8ES0LsR7EBCScAWNS75it0Ewa4Ld7dH7iS7AWFgYuwGI6WajjBk9mwsP9gO5QSWmlxwfhYl5Ke2Igm+NI5um17JX5CfzXqpaHocTTpu/xa7B+j7kyKJ4HkpjU5EQuTDpi3G5pTNMmT2HHyHwV0/+YL3xBV5B57/vyzzYLqG29U2fnhKmzYSaAZWtQzjLFy7ETDWQ2vbraNbrIJNp8ZjrTxIhUzFd+drucYtf6GAzqgMkGIxqRI61SISb5Jl00M/TUAGOimonqJSGbBKKDqUthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eenMgVHHfwBLxO8nUhcwZCckmBhVLHcUv9ALMhzqAs=;
 b=OJ5dFwVYEAOZ20M6ZRwLy36382oaLdl05ga5oV5qJmToKLGuVeGBAwE0TbqhhBSC1ZzxLiSmmoxGKd4p2MMU0/Btw/c//pm519SzxqPAhPdtb5Hb670t3oVBlLQqhF2g0sUDRC2cktnQAG7grsbnMFfYsmFTIHb1qS/qZP/r9emOouNYy92GSqBeGOtjS3Bf6/dFgOnM8rXRsMjDMKs3iKBa8NMbOViFQh0Byi9E6usB/oUv6nfTPY1FTGpeuoIiF7vk2amDqaboCDsGkqXFKlgw4LE4IHqIN62ThqTrGM0BupVsFte15/ZfIyeyZuwyQ+Kv7MSaEURBanS0Fv/9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 11:56:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 11:56:26 +0000
Message-ID: <83d21687-5cdc-438c-8a48-6504f9552d7c@windriver.com>
Date: Tue, 26 Dec 2023 19:56:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] rxvt-unicode: set correct outdir for tic
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231222083848.241593-1-changqing.li@windriver.com>
 <A718DD2B-DD41-42C0-81FF-E4002E8BF8B6@arm.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <A718DD2B-DD41-42C0-81FF-E4002E8BF8B6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fa8766-ea80-43c2-2b38-08dc0609afbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USFyxHLRIO/7qWquYxyT5yeOs3uVlJXgzhxbPbJdtP60ogFOxg2eOrqe6jOEy5067mK1ELoJcAHFK4oFEe7TxFKbNkBEgnzoT4aU9IjbS43vpxZuOtJsWVvY7Wk5zUemowU527CdUrGRcNQusbw9twg1K63cfXJMZrm9Bd7Wd4zx/MU1bhTFz3qo+iK/hn1r0XNecRDicsTV8puqeD0jqk9iQ/2Oz8D/61WGx+9bpjaU7DWT6RWSKbMMvBIAAUEtlQeS+4Uv5H7sqHz/BOEofF9f98EVbM/0qto0kHp6xOjYGHzhKzKnpgm+nMq1O8G7UAH9pS3eJ4wPC4sRMStjDj7wwgclIdOC2faogPVAAjp7vcBPDxmHSVbulZFGAbDy81OOP7SZ1vk9dcTUZaeoRqB2I3/5ETtSe5sjmxbrd6KeTwEKfQM01dkZBlpxZGINmL6zIx0U1eyA6ZZbGGy4en8d87Z1lLuyvSO5WGtG0HHglJjUsdgqxe+8km6XgJoqJWL+1ILwSEx+ftyIW1B5EwalSZEfmCeqMctsRhTSCTARuq1Y1XOw82tVQRFCMG7QW2wpRP7jPHPO3JFrp8KK4HiddtKBhGBoOWYAeqJkjL3Ed1bRYZ/8+zvu1in+kU99iy+O3qjeUrYnn/8yc64myFdzh9KcQBb2DgldcuvTCYke8C+JL2EmangQtJh2oGS+IL7a1CcLXdCoiuutMEhddg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39850400004)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(451199024)(64100799003)(66899024)(31696002)(41300700001)(36756003)(86362001)(83380400001)(2616005)(26005)(38100700002)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(2906002)(478600001)(53546011)(6666004)(6512007)(6506007)(110136005)(316002)(66476007)(66946007)(6486002)(966005)(31686004)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGsrQTZhcUNOVGMvVlIwRktoZDB4eTJKRUh3c0pjMUtuVVRkeTBydHpwdUFl?=
 =?utf-8?B?T29oK3RQUEx1MHl5Z052cVMzQmlNMHBTS3NFczY5Vk9iNG9LcFRDUGRUeTc0?=
 =?utf-8?B?aTJqRWxkM1hld0R6TDVwQWQvUmlXMGVmYUg3N1hkV1NvZDgyYmwwbEF1YzF3?=
 =?utf-8?B?d2xHMG9tVCtKYUxFMExmU0YwSDZGa3BpWjF4V0hNbllsdEczVytxZHV6WnRr?=
 =?utf-8?B?d1Eyelp6c1BhNnVGZ0Q4dVNRQ0ZreXdVK1pFN2xuNEJyR1QxajlwUDFPZW43?=
 =?utf-8?B?MjhNekFHcHE3UmZmNi9jYVlYRzNKWDZJaTNlT1hTemhML3dRTVRSbXB1WUdk?=
 =?utf-8?B?RXllNHhnOHhvL1hJWHJLbFd1dXZ3eDhjQVBac0ZCTGxnMnNqNmpIdkROSDVD?=
 =?utf-8?B?TTB5SWNIeEV3bDlqWVNkanBDS21jalluRVUyM3ltR2h5SmQyMmUzVnNrSVls?=
 =?utf-8?B?Tm9uYVIvaDg4ZDBPWEpLeUt0SXV3T2lFSFQrWW5CL1JJRXExV1BENzc0WHRj?=
 =?utf-8?B?d1NrMEQxWk8rV0VJNjB2MWt5MUh2SE5kT09tWmkrS0IzZUduYnVuSlp1eHFm?=
 =?utf-8?B?eWVoOTFtUEFId1NFY1FGQkhVZGhYVjUrQlZoaDZqK0ZRSHFLcGFDNElWS0gz?=
 =?utf-8?B?dEQ5bG5aQnROODdGZk1QR1J1eDdZYTNmQmpjdGpCYzlhTmlIZGw4b0p1QWt1?=
 =?utf-8?B?Z21qNksvMzFGaVFITFJaVVNiUTgvdVhLcjdITW5oMWxaRGJzMUhMVi85SENY?=
 =?utf-8?B?ZkpuZmNKUE1zaUFTYnRBWWwvT1YzQ3pCaWdxVDZMSFpabzUzMUMvMW9uYWc0?=
 =?utf-8?B?RllWaXdCVkgrOXluVkxTcGlUSGhQcXJMSXQwUDZWUHR0ZERPdlVQUVV1Y3lG?=
 =?utf-8?B?bkVvTXAzWG1ySWJHMDZQKzhIdnRXUHNQQkt5Zng2N0wyTDUwdk5IZWJERkFl?=
 =?utf-8?B?Y3NmdGhJVnJPbnNvKzlNSVBMTFVLN3g4LzladDg3djRjdGV3OGlVYU9HWnZS?=
 =?utf-8?B?aUYvbHhsdWdFZ1hLL0dQdEZmSEw4aEEyWkE3YXJmYVlZQ3dCNGxzR2RNeHNX?=
 =?utf-8?B?VUVUTTZxMHRUcmJsTzVmemUwUUkwSGZhVGRxcGNKb2JjL24rL1oydWdsZUZO?=
 =?utf-8?B?d0VMd1RnbGZ0UERjalk0S0tJVUZNc0pEZDc5STFHdSt0SFhyN3lhRWlHQWJu?=
 =?utf-8?B?SVBJRmFDNUdhWmdncis0UjJqVWs5UnZnUmhlR2lBVDZUT2xCeXJRRkF0S0dZ?=
 =?utf-8?B?Z3RLMmtoRHpsdUo4Szk5SldsR1I1ZkZOVjg0VEo3QVp4VEFsZURhZUlnR0xL?=
 =?utf-8?B?blhNYm5iaVdLUS9XRlFDM2V5UjVmeDdNdTVIeGt4T21nUEd5TlF4eTRJRUJ6?=
 =?utf-8?B?Ym9aYWNOZi80d0tHZVluKzcyYlo2Sk4zU1Bta1NOSjhBM056Rmlsak1Jd0xp?=
 =?utf-8?B?bmJYNytOc0tkMWdwN1ZyN1dvaGphT2Y2WXc3M0c3Vm1WbkVlQjA3alBEMFFX?=
 =?utf-8?B?LyttYTg0bjFpeDhTU1o1TkFKWWd2UFhablNBTDh4SVI2RWFvZTNwdDVVWUpE?=
 =?utf-8?B?VnYzK2JrejQvRmlOR1ZmYlZ6WStldmp2V3BLd3AvZkQ1LzFwVUs1OU1TLzlp?=
 =?utf-8?B?WDI2RnBjREpJcUFqemUyelhib3U5TW85N1g3WEVZWkt6Y3orRU9sV05peHo2?=
 =?utf-8?B?SWVZV0JlWUR1U210Q1JUd2FTS21KMnZWeFZWUnFtYTRDTmhENWQ4TDZrZnMv?=
 =?utf-8?B?bFVaOUN4UjQ1ajJmQ1REMzVrY2d5VHZWZkxybE96eGxQOUtLWjkvb0dUWlRp?=
 =?utf-8?B?bEJ0cDBoQ3B0RkhpNDBxZ1hIS1ppVFBqSnJFVWlNeVJuMHp3MXg4cXhsZHhs?=
 =?utf-8?B?ZmxHQVE4OXplWDYvakZ4Rzl5aVRjc3BkaHZCREg3VUVaT0tBRk9RZE9mT2pv?=
 =?utf-8?B?bFFWeUtBQTZDc25zNU9kSHFSNDBtVjFHNm94dHJZRVdqYllJNGVWMjVXQzEr?=
 =?utf-8?B?THlyLy96R2lRWTFVLy8rUjRBODA0Z01tcml2ZzdCY0t4cmJONkYyeGdyRjVo?=
 =?utf-8?B?YUFYalk1MDRLTmNKT2t0R3pjN3ZKb0JyK3JVMVRGcHRCdUdDeEF5b0tQbzcz?=
 =?utf-8?B?M21VZWYyZTNabzBMdUZFMml5Z0tHQ1ZDc3NWeVl2WWYzZTZpUmhRS1BIdFRZ?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fa8766-ea80-43c2-2b38-08dc0609afbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 11:56:25.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBx+o36dXT2VaR720fIJ3r685yDqlpcDZIkwSWojf4EPeN387zXHBsl0ebugaoyrWIdtD2I8N+k9Qp5Num4RhFw/ERaPoW7xARZZANBLsuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
X-Proofpoint-GUID: gAUfMI9sy5NIV94uUznyW3bFu5pdclDC
X-Proofpoint-ORIG-GUID: 6cmLlzenVkowQNRIFjq3ZlB2kjqWjdGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BQBp2Px021935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 11:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192909


On 12/22/23 22:25, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> These patches were rejected by upstream:
>
> http://lists.schmorp.de/pipermail/rxvt-unicode/2023q4/002673.html
>
> Will you be sending a revised iteration?
What upstream said make sense, the patch is not proper for upstream,=20
maybe this patch can be an oe specific patch.


Ideally, maybe we should use pkg_postinst_ontarget, use target tic to=20
gennerate the terminfo, but then we need to install

source dir $(srcdir)/etc/rxvt-unicode.terminfo in pkg rxvt-unicode, but=20
actually these source should not be there. and another

issue maybe met with this solution is if the rootfs is read-only,=C2=A0 t=
he=20
terminfo maybe cannot be installed successfully.



For this patch, it should works well, since we set the native tic output=20
to $(DESTDIR)$(datadir)/terminfo,
and target tic also set terminfo to $(datadir)/terminfo, refer [1]. But=20
it will have a small risk that if

ncurse changed the --with-terminfo-dir, but we don't update this patch's=20
output path, it maybe have problem.


Any suggestion about=C2=A0 which solution is better?

[1]=20
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/ncu=
rses/ncurses.inc#n81

Thanks
Changqing
>
> Ross
>
>> On 22 Dec 2023, at 08:38, Changqing Li via lists.openembedded.org <cha=
ngqing.li=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * tic is from ncurses-native, and set TERMINFO as
>> ${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
>> rxvt-unicode terminfo will be wrongly installed in there.  set the
>> outdir explicitly to install them to correct dir.
>>
>> * Add ncurses-native as DEPENDS to fix reproducible build issue
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> .../rxvt-unicode/rxvt-unicode.inc             |  9 ++--
>> ...ile.in-set-outdir-for-TIC-explicitly.patch | 44 +++++++++++++++++++
>> 2 files changed, 49 insertions(+), 4 deletions(-)
>> create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Ma=
kefile.in-set-outdir-for-TIC-explicitly.patch
>>
>> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/re=
cipes-sato/rxvt-unicode/rxvt-unicode.inc
>> index e7d520ebef..b8ef0d75e5 100644
>> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> @@ -6,13 +6,14 @@ terminal emulator rxvt, modified to store text in Un=
icode \
>> output. It also supports mixing multiple fonts at the \
>> same time, including Xft fonts."
>> HOMEPAGE =3D "https://rxvt.org/"
>> -DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
>> +DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty =
ncurses-native"
>>
>> SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${=
PV}.tar.bz2 \
>>    file://xwc.patch \
>>    file://rxvt.desktop \
>> -   file://rxvt.png"
>> -
>> +   file://rxvt.png \
>> +   file://0001-Makefile.in-set-outdir-for-TIC-explicitly.patch \
>> +"
>> inherit autotools pkgconfig update-alternatives
>>
>> PROVIDES =3D "virtual/x-terminal-emulator"
>> @@ -55,4 +56,4 @@ do_install:append () {
>> install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
>> }
>>
>> -FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pix=
maps/rxvt.png"
>> +FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pix=
maps/rxvt.png ${datadir}/terminfo"
>> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile=
.in-set-outdir-for-TIC-explicitly.patch b/meta/recipes-sato/rxvt-unicode/=
rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
>> new file mode 100644
>> index 0000000000..50d8d2d9e0
>> --- /dev/null
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set=
-outdir-for-TIC-explicitly.patch
>> @@ -0,0 +1,44 @@
>> +From c88c94e629b6aad1609d13f355c52e5a3acc8d2a Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 14 Dec 2023 17:33:15 +0800
>> +Subject: [PATCH] Makefile.in: set outdir for TIC explicitly
>> +
>> +When doing cross-compile, native tic's TERMINFO usually
>> +set as a native dir, which could not the target install dir,
>> +which will cause rxvt-unicode terminfo will be wrongly installed.
>> +set the outdir explicitly to install them to correct dir.
>> +
>> +Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull=
/4 ]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + doc/Makefile.in | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/doc/Makefile.in b/doc/Makefile.in
>> +index e3d1fe8b..3477551a 100644
>> +--- a/doc/Makefile.in
>> ++++ b/doc/Makefile.in
>> +@@ -69,7 +69,7 @@ all:
>> + sed $(SEDREPLACE) <$< | podselect -section "RXVT-UNICODE\/URXVT FREQ=
UENTLY ASKED QUESTIONS" | pod2text >$@
>> +
>> + $(srcdir)/etc/rxvt-unicode.termcap: $(srcdir)/etc/rxvt-unicode.termi=
nfo
>> +- tic -C $< >$@
>> ++ @TIC@ -C $< >$@
>> +
>> + tags allbin:
>> +
>> +@@ -100,8 +100,8 @@ install: all
>> + $(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(ma=
n1ext)
>> + $(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man=
7ext)
>> + $(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext=
)
>> +- @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
>> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
>> ++ @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir=
)/terminfo || \
>> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(=
datadir)/terminfo
>> +
>> + distdepend: alldoc
>> +
>> +--
>> +2.25.1
>> +
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192865): https://lists.openembedded.org/g/openembe=
dded-core/message/192865
>> Mute This Topic: https://lists.openembedded.org/mt/103315499/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

