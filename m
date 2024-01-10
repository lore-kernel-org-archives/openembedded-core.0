Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A1DC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:54:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6569.1704923638447494272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ArYY5lZ+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1739e1d70f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A4w6Or011894
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=R3+JoJUTat3zL2XaDdN
	VcINVFbrFdIFHndWCHrhU39I=; b=ArYY5lZ+2l15pqH5Wh/AizEOw+E38B56Bx0
	12xXGYhqKI/TohBvT0h3hSpWqBMIaVmfH6WlrXmGg5U4P1qWqTUJMaFQ3QwBoLdR
	FMJbZrg1g7UIQzcPGGPrsmbjtBCBBwPuyFPgVX0B9c9eIQyXoKy6VNdutpGP4WwC
	49FV2kXTZbzZqf/OesU7Nr4QtXUEZA4RsUu7JWnZkLMoMklSNLiDhtEhho23zdEX
	h3q7HRrZ98J+azHXaHnKt0O8KEB8ZzZsgO7v5Xub37oznPk6vgdfVVkqHqTZjpgl
	z8+OtcqteUo1wfYR6Kve7JM57wMk8fR1+eRKaBOp5XRljEOwsGg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewekd3xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:53:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGndo4TNt+RVAP7yeBPjeRPpjXt3q/5Hb67X1k+jnfAJkiuS/zidkIx7an3OkXE4Cqa3bPmuvuO+TGEQt/6Nof48oAt+dZAWf+6a2KqOQRtRFe2T6Tq9vCbvo07aseKxbwoRRtFL82ONmAH16XRKT/16oAywOUkDPfR/q0FHD9MIjJMDcxoAogc4WXUowisiroYczPZWGOL/5BknDuiJq8o9DBIuUFglaU2Hm5vwEld/A0xYYhY5qLFKqybawXvZuf3DLpJkNzcSRLdKk71va4ITOHAUrl/x5Qo3+vcGtRR9p0DaS6tfBa+NEgWU/ZPqT7lOWZKPyzJGjGRGX5fumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3+JoJUTat3zL2XaDdNVcINVFbrFdIFHndWCHrhU39I=;
 b=k4/Vi+lrG6N18u6U/wF6m0Aw2J/qoSEyijxxx9f3+dcpsi6eC1f7aElcgKzVpBfcTQXQZvsF+6UhS7vff1YGIYVaFx8s0NawcXgOHwIRLrg7b9N28t3/42TsGEcs0o1QiH5SopTLRW3m5ZKOe+fa+1BZi9wA0DBdSyBVQqja1oXyguwP75ZAqs2A/IQubybSuvCI5dWyLMMOc6Y+zKNmeVYgWuRiwyKQuFNN8GwASwpm7ZEe6kBUpKJ9nyM1ShtTip4onnUmILBbbwfPupzvyooKnNrl1v0Mz45T4kvtI/Jvu2RG+2QwYlgVLY3XvmOjEQZyu7YG8Hr81eVDMsh3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Wed, 10 Jan
 2024 21:53:52 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 21:53:52 +0000
Content-Type: multipart/alternative;
 boundary="------------v1WOVtpyE6SFfRooxQab7N2i"
Message-ID: <9de219cb-2f81-41ff-899b-9b65543e9502@windriver.com>
Date: Wed, 10 Jan 2024 16:53:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 1/1] eudev: modify predictable network if name
 search
Content-Language: en-CA
To: joe.slater@windriver.com, openembedded-core@lists.openembedded.org
References: <20240110211203.1471586-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240110211203.1471586-1-joe.slater@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: f641a0eb-a3e9-40df-f998-08dc1226a27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Lx4VTBLgXwkYdA7qZeyq3Zn4t+vUUDlGbhTq/iWcWPFsSGPLkYhVI0M/RLtbYuaS8ATXVjCVNhnnemgU2rZINB3/XUjQluiX/ABojo7oBLs4h7v7HmSj5Qx4KoQrwwcHRTk2DoOWWb7d4w+kEO6ZZRT9T10tWqDOdZvbHWKxVj834x17AqTRiizFzIVHN+1GM0xRQjZGxO7KfpPaUCCD3tNoRDSQlAPnYqFx86XDWAzw4bTbFMPbqyMDYXU68exbWIirvrBUgTXO2bEP/7zMfNuXR6H0vZf7rq0qea/6/8zSIISo+p1LtvjiUfsHLleFFVhoa5O6/YaxPSsECd11/x2STL2QlG3LeVyAFGMi8kIZD5U7lHB+DS6MwxgZNKBQ+LAheHZ+N05pVfI79ZBd7l5cMOdkdUXaume3gykG56XEIMJ6EOiZNtL0eJ+J0QHWq4OlMdlgkhY6ZEpxsk+x9R5ZtZlzo6lb4B5ERKnNeC8tnTBYA39iPZ86sSM3w7pVd0ee1bGkQ9E6rQT5frr2J8w0lwrlzVBp/kKCfauQC/R2DjorOLkqDyFHP0XZNZeK5nfm804bdQEMwvNNwjqjeST6TuUax2/I8Ru/IbHmugC2jS86/EJBODmoxMO5bOI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(5660300002)(966005)(6486002)(31696002)(6512007)(86362001)(6506007)(8676002)(33964004)(2616005)(53546011)(66556008)(66946007)(316002)(66476007)(8936002)(41300700001)(36756003)(38100700002)(26005)(166002)(83380400001)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHAvN0RWWGZVN3RLQXRWU2tqMFl6bStlL0N0dVNPRXVMbXZDYWZsc29ZOEoz?=
 =?utf-8?B?dklXZGZyN3laRkU4OTJ6Rlh0elNLdTZ0c1BqemtOSzBRdWdvRlJlejdmRFU0?=
 =?utf-8?B?ZlZzRWpDN04zaHB2ZXIxVXcwWDRBZ21uQlVSNXFVVElNNXNXbkE3aW0xeDNW?=
 =?utf-8?B?YUhZQ3Vpc1ZpeDB3c0NOMk9hTVpTdnFIS3BhL2JDSVVVY0NtMFdlaEg2dGlD?=
 =?utf-8?B?c3F4RVZXeFYxWHlaOUJPamtVSmtwY3pzWFhLSjBFdzNweFV6dXR4bTdvN3c5?=
 =?utf-8?B?N0NiNDZDeHpCeDNWZWh2Q1VrQkZUbjB1RWV0UmJvTk53VGhOSnFRTWNhclFX?=
 =?utf-8?B?TTVqMmVJZGhlTmFMNER4aHhieHp6b0hGNFN0S3N1TlhNY09RSG4yWFBoUWxx?=
 =?utf-8?B?TXpTamJuTDBoZGRKdzFWY25mTUEzVjIxYkh0Z0wxWldsL3NkbkRCV3JKU2ZK?=
 =?utf-8?B?d01idGw2RjZmNy90bk5hN2o4U2VGL0tpWGNzSVNjR1FEdlhhc1djL2ZlMVFX?=
 =?utf-8?B?MStHK0lrTjgxd2lXVUxJdFFKZ0V1R29sMXQ0MUZCSHk0RXV1Z2h6cFJ0Wkti?=
 =?utf-8?B?M0R2SEtGSjBSOTF0alhLOHZBY1JoMXZGSzNKYzRBSXpNZXUwZ3Rqdml3L3My?=
 =?utf-8?B?RHV5Q0lRaXN6aExGUlJMSXM2RjFSeXBGZS9JWSs1YmtBdDdJRzQ1L013dWxh?=
 =?utf-8?B?dUZXQlYxTGFuOHJWYWYydXYvTFpIU3Mvb2dDNWV0cHF4Q0ZBZ1locXFLMTJr?=
 =?utf-8?B?NFJ5VWVWZ3BQQlZWNlFNWnBvUVZnRVB2RW9XUWdCVWdsZmxIU0dKQUJnQm02?=
 =?utf-8?B?OUR6Ni9oM3JSRVJjU0x0WlMxQ0VnZWkrUERBaHVOdHRJbERMN0ZwS2NOV09h?=
 =?utf-8?B?bklQbDMyWndtdm84VDRTd0JYRUhtOUEzSE5XVzVSYmhxK252cmdodERKeEZi?=
 =?utf-8?B?eTFLRWtiUjJ0MnBqRUVJR3RtUFN6eGlWSnJ0c1IxRkt6Vy80YUcxTVIvQjZi?=
 =?utf-8?B?K0VhRHdka2ZJZ2xnK2t4Ny9UNy9BRy80NVpvVEpYVEZFa0l5RFUzQTRXeXVi?=
 =?utf-8?B?NlZYQ25UTU5GOGxkNXJXYXMxQlUyeS80em9OdEJIVmQ2cXpSbGVEZ0hDaEYz?=
 =?utf-8?B?c1hOYmVCN0pSUXcvZlM4VUtpcEhBR1h2OHk3ZmlhY0Rkc284TVBDRERFNFRy?=
 =?utf-8?B?WFhiTXZEd3kvSllHWTh5L3BLZkNBRlJIN3RTa01XNHJTekJqcXc1bllIbUJ2?=
 =?utf-8?B?eUZ6bjdVaGwzRHlGRGE5Y2YxSUhOelh1czZCemxxZjZYUDVhaUpBVUhWWldS?=
 =?utf-8?B?aWlEOEdBeGsvbmhOUXIrVytEdnBCL3ZFVWUyZlB6WVRQR0NkZW1oWDhIRi9X?=
 =?utf-8?B?bGg4cmw1TW5TL0NXaW1FL1JyTS9yNThyR2lVaUlzU1NQNUo4d3h1S3RXRnUz?=
 =?utf-8?B?SCt5OGJpbWx3MlQ4VDhXeTRDTGtBNDBodDV6QVBxdWdHWVNtVFhZck1oYUE2?=
 =?utf-8?B?VDFWVG9VVmdsa1kxTHhIMFhMbk5GY1ZOZ016cVliTTNKcFk4MDA4anlPZlF3?=
 =?utf-8?B?d3B0ZldDNks0NzV0YnJ4d083RnlqazN0Zk9aWHlLYnVvU0lmVldpNmFKbE9o?=
 =?utf-8?B?VEpsS2dwTEV4T0xjdmhRZGkyaTFiUHRJRHg3Y2lQaVk2MENETkdYVkRtSytx?=
 =?utf-8?B?ZXVJT0Z0aGMxRTV1LzV2QzNFR2hSTU9ubjhOYVVNL3ljN1dHTlZjYVd5R0d1?=
 =?utf-8?B?bG1qcHJtdTFnVlBWNldGTVhjTkY4NzgyZWVTbVhGSzQ4Rmx4WW5INzJRS0Rv?=
 =?utf-8?B?TWJFVkwyK0Jvemw2M0JReE85RzdjMlpQV29sMGZldlpTRCt6NEtXTGJZK3Zv?=
 =?utf-8?B?SkU0UmNTbjg0VlJ1d1dCVkg2ekZOWUlPenpuTGR3WGVvam9MZEFhTlRVRmRa?=
 =?utf-8?B?WFRmTE4yV3I0bUhOZG10N3pvNnJoTmszS3RPMTgwSEJGWTlLM2FmVVpkZTRv?=
 =?utf-8?B?MlRISGNNSmc3akZTS3dPMzQrUUd1dFFGekJJVThvbnlaVnQzbXVMU0hkZUVi?=
 =?utf-8?B?Z0ZYM002T2N5bmd0NW4yWFJIV01HM3ZmNmJST2hBRzlYRWZYUmRmWEpDVWM5?=
 =?utf-8?B?VGhITFFBcEYvMW45THExUWhTSlNSaWY2UXkwK3dISlJFZjJaQ1JIN1VQeSs2?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f641a0eb-a3e9-40df-f998-08dc1226a27e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 21:53:52.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acVC7ml0MQC1+ZhaWbYCFxQMKBDjb3mYIJOQxOFDqOK1sVxHDfFXZAUHBNrgTHEskw25vsLpx2Ci6zo2c9A2ZXlg6QnCejqkXt+uME/XBP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-Proofpoint-GUID: OJY8rbVbmRfYazULz4tpbPLPMfFu_qr6
X-Proofpoint-ORIG-GUID: OJY8rbVbmRfYazULz4tpbPLPMfFu_qr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 mlxlogscore=786 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193531

--------------v1WOVtpyE6SFfRooxQab7N2i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40A4w6Or011894

On 2024-01-10 4:12 p.m., joe.slater@windriver.com wrote:
> From: Joe Slater<joe.slater@windriver.com>
>
> Consider a name based on mac address in addition to
> those based on slot or path.
>
> Note that as of this commit predictable naming is
> suppressed by eudev, but can be enabled by removing
> /etc/udev/rules.d/80-net-name-slot.rules from the
> root filesystem.

Thanks Joe.

For anyone wondering, this commit and:

 =C2=A0=C2=A0 [oe-core][PATCH 1/1] init-ifupdown: add predictable interfa=
ce names

are working on enabling predictable network interface names.

https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInter=
faceNames/


Is there anyone else in favour of or opposed to=C2=A0 making PNI be the=20
default for Yocto
for both sysvinit and systemd images?

I think we'd need to modify runqemu and probably fix several other=20
tests, right Joe?

../Randy



>
> Signed-off-by: Joe Slater<joe.slater@windriver.com>
> ---
>   meta/recipes-core/udev/eudev/netifnames.patch | 17 +++++++++++++++++
>   meta/recipes-core/udev/eudev_3.2.14.bb        |  2 ++
>   2 files changed, 19 insertions(+)
>   create mode 100644 meta/recipes-core/udev/eudev/netifnames.patch
>
> diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recip=
es-core/udev/eudev/netifnames.patch
> new file mode 100644
> index 0000000000..a45b80118f
> --- /dev/null
> +++ b/meta/recipes-core/udev/eudev/netifnames.patch
> @@ -0,0 +1,17 @@
> +eudev: consider ID_NET_NAME_MAC as an interface name
> +
> +eudev might not create names based on slot or path.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater<joe.slater@windriver.com>
> +
> +--- a/rules/80-net-name-slot.rules
> ++++ b/rules/80-net-name-slot.rules
> +@@ -10,5 +10,6 @@ ENV{net.ifnames}=3D=3D"0", GOTO=3D"net_name_sl
> + NAME=3D=3D"", ENV{ID_NET_NAME_ONBOARD}!=3D"", NAME=3D"$env{ID_NET_NAM=
E_ONBOARD}"
> + NAME=3D=3D"", ENV{ID_NET_NAME_SLOT}!=3D"", NAME=3D"$env{ID_NET_NAME_S=
LOT}"
> + NAME=3D=3D"", ENV{ID_NET_NAME_PATH}!=3D"", NAME=3D"$env{ID_NET_NAME_P=
ATH}"
> ++NAME=3D=3D"", ENV{ID_NET_NAME_MAC}!=3D"", NAME=3D"$env{ID_NET_NAME_MA=
C}"
> +
> + LABEL=3D"net_name_slot_end"
> diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core=
/udev/eudev_3.2.14.bb
> index d0758691bd..ddb3c3340f 100644
> --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.14.bb
> @@ -10,6 +10,7 @@ DEPENDS =3D "gperf-native"
>   PROVIDES =3D "udev"
>  =20
>   SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
> +file://netifnames.patch  \
>              file://init  \
>              file://local.rules  \
>              "
> @@ -50,6 +51,7 @@ do_install:append() {
>  =20
>   	# Use classic network interface naming scheme
>   	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
> +
>   }
>  =20
>   do_install:prepend:class-target () {


--=20
# Randy MacLeod
# Wind River Linux

--------------v1WOVtpyE6SFfRooxQab7N2i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-01-10 4:12 p.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:joe.slater@windriver.com">joe.slater@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240110211203.1471586-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>

Consider a name based on mac address in addition to
those based on slot or path.

Note that as of this commit predictable naming is
suppressed by eudev, but can be enabled by removing
/etc/udev/rules.d/80-net-name-slot.rules from the
root filesystem.</pre>
    </blockquote>
    <p>Thanks Joe.<br>
      <br>
      For anyone wondering, this commit and:<br>
    </p>
    <p>&nbsp;&nbsp; [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
      names</p>
    <p>are working on enabling predictable network interface names.<br>
      <br>
      &nbsp;
<a class="moz-txt-link-freetext" href="https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/">https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/</a></p>
    <p><br>
    </p>
    <p>Is there anyone else in favour of or opposed to&nbsp; making PNI be
      the default for Yocto <br>
      for both sysvinit and systemd images?</p>
    <p>I think we'd need to modify runqemu and probably fix several
      other tests, right Joe?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240110211203.1471586-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 meta/recipes-core/udev/eudev/netifnames.patch | 17 +++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.14.bb        |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/udev/eudev/netifnames.patch

diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recipes-core/udev/eudev/netifnames.patch
new file mode 100644
index 0000000000..a45b80118f
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/netifnames.patch
@@ -0,0 +1,17 @@
+eudev: consider ID_NET_NAME_MAC as an interface name
+
+eudev might not create names based on slot or path.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
+
+--- a/rules/80-net-name-slot.rules
++++ b/rules/80-net-name-slot.rules
+@@ -10,5 +10,6 @@ ENV{net.ifnames}==&quot;0&quot;, GOTO=&quot;net_name_sl
+ NAME==&quot;&quot;, ENV{ID_NET_NAME_ONBOARD}!=&quot;&quot;, NAME=&quot;$env{ID_NET_NAME_ONBOARD}&quot;
+ NAME==&quot;&quot;, ENV{ID_NET_NAME_SLOT}!=&quot;&quot;, NAME=&quot;$env{ID_NET_NAME_SLOT}&quot;
+ NAME==&quot;&quot;, ENV{ID_NET_NAME_PATH}!=&quot;&quot;, NAME=&quot;$env{ID_NET_NAME_PATH}&quot;
++NAME==&quot;&quot;, ENV{ID_NET_NAME_MAC}!=&quot;&quot;, NAME=&quot;$env{ID_NET_NAME_MAC}&quot;
+ 
+ LABEL=&quot;net_name_slot_end&quot;
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index d0758691bd..ddb3c3340f 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -10,6 +10,7 @@ DEPENDS = &quot;gperf-native&quot;
 PROVIDES = &quot;udev&quot;
 
 SRC_URI = &quot;${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           <a class="moz-txt-link-freetext" href="file://netifnames.patch">file://netifnames.patch</a> \
            <a class="moz-txt-link-freetext" href="file://init">file://init</a> \
            <a class="moz-txt-link-freetext" href="file://local.rules">file://local.rules</a> \
            &quot;
@@ -50,6 +51,7 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
+
 }
 
 do_install:prepend:class-target () {
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------v1WOVtpyE6SFfRooxQab7N2i--

