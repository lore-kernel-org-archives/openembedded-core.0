Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07363C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 05:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18253.1709186182086290714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 21:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mKKEMwc9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37893041e6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5pugA004085
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 21:56:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=slCDOCrr7LgczDKuLHf
	WQcD78bApBFtaPDQcrJm4lUc=; b=mKKEMwc9p1WGr4j3Yl66l/AjB+LESNf35Y/
	PPLvvtE9x/j8Lfs4MsGTbDE+O5c7wbmSehSbPOfxO02LpOVmqerD3kAmE+nS2RHZ
	yK9MGsENuqhUukK4qF9UdokXbKy7bdE+yR/c93Yk2ATkSIxw5z0k0lfyoevaId6Q
	U3bvM6FTkCKy5KJwC5qoEjBmZ4jJ89NPcLfY9OS4TIYLX6obYsWgdoCTJkajsHaA
	vD3+V6YUXPheKkF7e0+uSS13N2YN1BxghfgchKfJciKtqn3YMwzvuHgiW67S6H9B
	ZtmELtr953HzGIY8o4Nj+/07w/h4BMl/DEA4lqH0c1AYzdQIV6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm44wja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 21:56:21 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41T5uKwH010336;
	Wed, 28 Feb 2024 21:56:20 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm44wj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 21:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik9u7+FlDtsGV/Ub5X0wnitS7aXoE6MeNg+ILI60ZB+YBGEIhKmTNyPXBlVF7sxmMFmLQ4fpF1uUqWs8tjtheu9MkaLCMW0YKASSAcPaqoPhMEklUUTo6KpLNixHJAf/yF+mvQilh3ENeAwdWNy4bc6WjjTd0FCfj+l412qHpUm9v+RhyjrEVShXC4JQAfUuAqhGDw4SV/4HzGLzP9pIyI4vYS6tXtz/4STfNDpEBPrq4i9KhTf9WMznSrj7vtv66Qj9o9PQoKnmlwk4Vjl3IDQlqAQwaeXAKdsufvCBjrE7blcqO026seBZCf2oUA/GkzV5nz6JrQvq5dYTRSeaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slCDOCrr7LgczDKuLHfWQcD78bApBFtaPDQcrJm4lUc=;
 b=IJCPBJKOFxmii/Bp6w/6GUKnU3VS6kA+K6OMZyno7B+YPHVBuzqcjKyjQ3NNWMJetIvf655Qq3dwWu0dGlt9LZ8P/QIiszHFx1S7FIMaZ2W1uKjQGXZqiTl1esPuCLEkIaKltMdWMEWADV4J7NfPRm5DQ+cXXEl0ulMTnjeY1opofbvk1bdwRccKfZ5NNKqZL3Aq4mm1zYcT6sHUDC6iahAAL9LS5ZC3KE3ohtpk/3+umE+BQEoY5WnAmpGqnzd4PWL+XLwieun6z4dihRxwVrRIr3R1J+Vsg96CziCh+E9zYu1G50/stP1rByQwlt5Xi6IfZvJXFU7lkQWDxVreUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Thu, 29 Feb
 2024 05:56:17 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 05:56:17 +0000
Content-Type: multipart/alternative;
 boundary="------------T2f8dZCjbXijdV71mHGFkSzv"
Message-ID: <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
Date: Thu, 29 Feb 2024 13:56:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
 <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e251a94-76d0-4f1c-f5ed-08dc38eb24ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JfQXnwF36P3fV1b84Lq+nTXt0BjwUkZ0mVAcHmqQhFnsA/j0N7M7429Wz7fohVF0Lr/JlKm5EofSuzosk0taQ0saoghtbC/vjRLbQ0QWUQcAMnTqEGtob8/9QCopdsKWtiV1emKe3cyMKawUAKVN8N40CDTxMN7zxOem5seeSt04fuSRUTniPWe0fcPsWrVH7D8kTqJd6KjTspga9vu2MHdeTKkZKyEIwc/dPR+WhqUwo23i+VPlSKbyP7hUUCZRRicC8KFx7cOFGyKMYGv7Cj0n2iIWpIK9U7+VwO7jM5uR0kWR/MMEakQT0e+SwNhZdgLyYlc8l5Io8tEQbK4vg4u4ua4rJfHHxqW6lXc4G51lNr4r5+yRMO0fhr+leFW/+rru3LT13J4+GCaRA1ACENKP/C7Vh7ecodlpcAeD4V2PQIanU678ABBATxMq62q0gYJRIGzcchFN2TpGW0Ave0jhBEv7DnDvL5RTKlBmrqhE01TVXj8KxodGwQu7BM2Xe3QJCdJPB0VJc2FRzKGN0JH5zJ7DmS733zShDXPvSPrsZFrUQUKASj+CoQEM2WwjQyx2T2KGAkWqFB/5mRJGxKlT6qlM/l0yH0OyNA/zlb8kEjbOmT9ejTiXUlzCwlHjIJxcS4mGsw1SPzL2tA7F3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RndVNmVJYWZLUmM1VHJqOW05OXNURnNZK3JhOE1hZC9YdStNOXlyWDFzN0wx?=
 =?utf-8?B?c241ay9JRTNmNW0raXh6R0wyRkRka0UxTXVBQWFwYS91T3FEQ3JMZ2tsRkd3?=
 =?utf-8?B?bTdPZWpKTExVdHluTXowNTFNOHNKRUJ2a0RpeHZYRUhnWm5SQk01eHJhU2RF?=
 =?utf-8?B?ZkpiOUI4KzN2Y1ZaZjNZTWhrUmZHWHhLYjhhNU9leUt0bnZjQ3lVUEVpQU5J?=
 =?utf-8?B?cW9KTFlsVkNHN3pESHhETDhZS2h0SWk3UXd0ZC9ZMlZOWnpRZGhNOGV6VlJW?=
 =?utf-8?B?c0NzUkdnMm9wK04xRzlVYXNQZndnbTB5SGhNaFZtaGNkZ01oaEFUOUVTcHlq?=
 =?utf-8?B?ZUU0cHh1Q0NVOFlDQUgzV3I5VFRrb0RKQ1RPY0FLQmRXRTdoaXVyR0hYRGE0?=
 =?utf-8?B?SnRzcVZKZGh2UFp1SlFDRHduYU5TNEpWbTh5aWxmV2xHSE5Lc25ldjY4UTZC?=
 =?utf-8?B?ZU94WTFWbVlLaXF5LzZJQnoza1B1VDRMREJEZUliRFY0cGw0c0F1ZlliL3dL?=
 =?utf-8?B?aU02RHdUaEVpeGs5QUhLYWhrZnBaaUtwSHQ0OHZRTVJHamQ3c3dlTk5MUXdS?=
 =?utf-8?B?V3Zac0UyWVdzNTNkS2NtdjJ2VGFFNitZMVU3NW0vd20rUmk5TkdWVHBJd0VR?=
 =?utf-8?B?V3RSWnp1UktqMTFvaTc3citlMHZxSUNEemU0dS9obkZJT2s0MWhTOU5NRWR6?=
 =?utf-8?B?YVE2ZGpGZENLR00yOEJwWURtWkwyQkcxd2VPME9nUzVZWUp0WFAyVnpqMDJS?=
 =?utf-8?B?bTgxendiZWtpZHhiL0VqM1kybkRnTTBFS2JCNms1bUp1RzNXNlVORFlwNFlZ?=
 =?utf-8?B?YVppeEZxMnV5N1VTd0N6ZzRDODBndXlFNnR1QzUwYnN5L0NJcHRLanM1cllM?=
 =?utf-8?B?akdUQzJKUnU2V2pqR20rN0xUV1BZSGhMMUdzQ1JzU0tQTFNFZk5oM0dqcTJk?=
 =?utf-8?B?Q3dXK05OU2lQL2c2aWsyRzlNcndSaDE1YUtuTlJoMDJJdHY3ZWVOUWRTRXdJ?=
 =?utf-8?B?WllJZHhNZndXWmFyK29xOGttaWF4OUNyZ1Y0YWdCZmxPMXIxemVsN0txZ0k4?=
 =?utf-8?B?SERSRlMyZ29UL0dBMkUwOFhEdTJ4dHAwVDJmVkZMOFRZK2wrYUt2a1daUndm?=
 =?utf-8?B?TnRrTENZdjQ2cW9HdUNKaENYVmd5dHJDSjhTQ001L3hRbnAzYmV3b1Y0eDNQ?=
 =?utf-8?B?ZWdRUTVOc1ptMXBEYUlpRWlaanZpUzhpWnhpa1czT0xLQjA2SHF6OFNCZkxD?=
 =?utf-8?B?djBsajVsc3drRmR6dVNQQVpqZWVSdzQ2ZC9NZFZsZ3RiZWI3cGs0N0lYUksr?=
 =?utf-8?B?SEdCZ1k4UTE4K0hhbnBhbUtoaHN4OXRWM09Pek4vZTFHcEJqeklFdGRKVEV2?=
 =?utf-8?B?czZhcm1GTkFxelR3VkQwZ2pKczE1Q2RUUEFEeHhxTUFIaEhwbXFmM1VjNFFU?=
 =?utf-8?B?QkgzQU94Z3dCa3FqeS92VHYrcDYzS0Jwd0x4Vys5WnFDS2NyN3JpNE52VGQr?=
 =?utf-8?B?VTdNTlJSUFIxSXM1N0paNUNpc08xcmJleXdnb1QvSU5obHcyTnpuR1UyNms2?=
 =?utf-8?B?MUdDSkhIUHVyc3puSk82Y2JhazVNWFVRU1Bjc3NQckRnU052VjBxc2lWWHR1?=
 =?utf-8?B?MS9OWXBJQUg5MDJNUGFaL0NUdWczZ3hoajZXZ3pvNERLTm0wSkJKUlJEK2cr?=
 =?utf-8?B?RUVNcmgyMDZPQmJiclo5NHlGd2JUWkNJc09JNDNTeGlScUNKclozY0VpdktB?=
 =?utf-8?B?RSt1cTJmTEJyZCtESXJIaDd4bUZmK0QxK2hZeUcxZVFtSVZNUTBwSWQ5dGxO?=
 =?utf-8?B?cDdoY3Y0NzZBUy9nT2tYZGhNK3BtMWhwYncvVjIwMVh4RERlNGo2Yndzb2lD?=
 =?utf-8?B?NVhhVDE5ZURCaWd4ZXg3OEVFYlRMM2R6cDhmSVZmMU5Zb0orSDkzcmVKQUcv?=
 =?utf-8?B?RjNTOWNjSUI3UGRYT0tKT0c5aE1VVUgxV0tJeWk0RGt0YzJOUTlrb3VocCs5?=
 =?utf-8?B?dXRJL2E5cldZNjZDRU13TmlrUWtiaHZITzVCSjJ1RWczUnJYZVFFQlkrWk5H?=
 =?utf-8?B?RWtZa28rTHMvTWtxazl2Z1lyYUpDM3FBaGtpemFSRHVRUWRod2RER1VCV25S?=
 =?utf-8?B?TjFQVGN1dXBWYjVsNFc5TG4vQTcxc3RuaitNbi92MTE1TnRtM0dmTllFTzhw?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e251a94-76d0-4f1c-f5ed-08dc38eb24ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 05:56:17.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0zejYPihSPXCRKFVkWmP2KOZXsuw4Fpw0n1IZAK+TgI8maAeHM0BMvK+axZivB8N+AR3p2SZM8QPm60k/kc7E5bpNDtJgcdvdyddaXMA9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
X-Proofpoint-ORIG-GUID: QYYdmIPeIjWuBoNTrAqgDYJsWD_Q0Lq8
X-Proofpoint-GUID: ZTYDspzqJDn4UvudfR-4xEx4mbRl9I_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402290045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 05:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196414

--------------T2f8dZCjbXijdV71mHGFkSzv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41T5pugA004085


On 2/28/24 17:45, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 28 Feb 2024 at 04:19, Changqing Li<changqing.li@windriver.com> =
 wrote:
>> 1.
>>
>> Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this i=
s in package systemd),
>>
>> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
>>
>> This line will create an link to "${datadir}/doc/systemd/README.logs" =
during boot,
>>
>> and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So t=
here will be dead link when systemd-doc is not installed.
>>
>> So that's why I create another legacy-doc.conf packaged into systemd-d=
oc
> Then legacy.conf and README.logs should be placed into the same
> package. I would suggest that README.logs just goes into main systemd
> package. (the other option is placing legacy.conf into systemd-doc,
> but that file is not doc-specific, and should stay in systemd package,
> especially if more entries are added to it).

The solution is also good. But package "${docdir}/systemd/README.logs"=20
in package systemd may make things more complicated.

since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and=C2=A0=20
FILES:${PN}-doc =3D "${docdir}=C2=A0 ...". we need to adjust the sequence=
,

and may have influences to current list of files and directories that=20
are placed in a package.

So maybe this patch is more simple and reasonable, and will not have=20
other impact.

>
>> 2.
>>
>> The symlink in legacy.conf use relative path.  but for oe, when VOLATI=
LE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so
>>
>> /var/log/README need link to ../../../usr/share/doc/systemd/README.log=
s,
>>
>> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
>>
>> need link to ../../usr/share/doc/systemd/README.logs.
>>
>> After change it to absolute path, checking of VOLATILE_LOG_DIR is not =
needed.
> That's ok, but can you make fixing the path to an absolute one a
> separate, second commit then?

if=C2=A0 use solution in this patch,=C2=A0 it is better they are in one c=
ommit.=C2=A0 I=20
can update description more detail.

Thanks

Changqing

> Thanks,
> Alex
--------------T2f8dZCjbXijdV71mHGFkSzv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/28/24 17:45, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Wed, 28 Feb 2024 at 04:19, Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">1.

Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this is in package systemd),

&quot;L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs&quot;

This line will create an link to &quot;${datadir}/doc/systemd/README.logs&quot; during boot,

and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So there will be dead link when systemd-doc is not installed.

So that's why I create another legacy-doc.conf packaged into systemd-doc
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Then legacy.conf and README.logs should be placed into the same
package. I would suggest that README.logs just goes into main systemd
package. (the other option is placing legacy.conf into systemd-doc,
but that file is not doc-specific, and should stay in systemd package,
especially if more entries are added to it).</pre>
    </blockquote>
    <p>The solution is also good. But package <span style="white-space: pre-wrap">&quot;${docdir}/systemd/README.logs&quot; in package systemd may make things more complicated.</span></p>
    <p>since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES,
      and&nbsp; FILES:${PN}-doc = &quot;${docdir}&nbsp; ...&quot;. we need to adjust the
      sequence,</p>
    <p>and may have influences to current list of files and directories
      that are placed in a package.</p>
    <p>So maybe this patch is more simple and reasonable, and will not
      have other impact. <br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2.

The symlink in legacy.conf use relative path.  but for oe, when VOLATILE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so

/var/log/README need link to ../../../usr/share/doc/systemd/README.logs,

while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README

need link to ../../usr/share/doc/systemd/README.logs.

After change it to absolute path, checking of VOLATILE_LOG_DIR is not needed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's ok, but can you make fixing the path to an absolute one a
separate, second commit then?</pre>
    </blockquote>
    <p>if&nbsp; use solution in this patch,&nbsp; it is better they are in one
      commit.&nbsp; I can update description more detail.</p>
    <p>Thanks<span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Changqing</span></p>
    <blockquote type="cite" cite="mid:CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
Thanks,
Alex
</pre>
    </blockquote>
  </body>
</html>

--------------T2f8dZCjbXijdV71mHGFkSzv--

