Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AF1C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:55:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web10.6061.1633679744419747616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=wjbBYHsq;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.65,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azn3C3UiF1GZRcMChtynkhmaqgMLESeiz/xvZ/8dKvwL/XJ9PvVd14Z+Q+EyJxvYHmyJk+Xf+aNGORiL/ZqgsGVEkuvBu6GqwIIVtaCmC5wwvbTt17rBXwz10nvYQZpp8G/QCyrYGd8Lry5k8nZ3TFCcMVOhtWfW53uNrOBom4u5R3QR6qP/brg4FDEvakULBfHPRfS5ZkYnpNX3EEWZGcXjSqNmM8L7Th5QJGzhl9SqJ0UgESkxQXRX/GYJYx2v8Tr9dEz9UDwxCJGUfLbbq1jGHZKsF+gCTTQSzpBBHAKRIR561bimPbDn8a0Mr746XKGLNzxZ2QNshj0fmrq1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1xqiPWow4yA4O0yy1Fgi+w/50EJmJsYLz2p6TptItE=;
 b=CYWZcgcNPxD7True+TgaLvf3rvzxxFSmp3LeUgzcr+E8THUmfwqgVNJYcddttsURwAhxl0VejnyTxzgmP8nygFHmCU6g4ovpU+y9ymsrRqmDfcOrwg1IZfB1cHL+rZMFuovBq8Aru5t7i3wIEMCcOpuBTs8j1pYIOttf/bI1ZZwOjmbW6YAq6MzpN88vo/YIm/KeJ9154/sfcZtcrNXEVUAuReU3MmWm7pqjf+yQWkOpI5i9rdXOlowCqQMRBjWBr3IaQkrWGf6ly6T7ot88Suu7vOQnlk7rVT8Wp5a+uIBjNp5Qx5SZAI3FNzwb4E0oyut7D1/ulWSUb31jIqUl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1xqiPWow4yA4O0yy1Fgi+w/50EJmJsYLz2p6TptItE=;
 b=wjbBYHsqZ6pkUrXNdblNvZnkAshUYSh2VJ/7zoDn3q1vOqii/ZAZgcMOL7nvC4vjsB13Hj2UZhwipXwYRQ2T63H1jO/LsI/elU/Nwzh3iAyYaFGz/ARgK+2EO7i7VpkEDcSdbnIHoWFJmFYfzrirw7jxBx4fqhACMN8Nz0wdFX0=
Authentication-Results: weidmueller.com; dkim=none (message not signed)
 header.d=none;weidmueller.com; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5738.eurprd08.prod.outlook.com (2603:10a6:102:81::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 07:55:41 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:55:41 +0000
Subject: Re: [OE-core] [PATCH 03/12] recipetool: Skip common source files in
 guess_license
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <6807ebcb-5b8f-5657-277b-0a9aee2e5af6@weidmueller.com>
Date: Fri, 8 Oct 2021 09:55:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::16) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.155) by
 AS8PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:20b:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 8 Oct 2021 07:55:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc99f0c-74ed-4a90-6521-08d98a310651
X-MS-TrafficTypeDiagnostic: PR3PR08MB5738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5738000960A7971A10EDE4F5D7B29@PR3PR08MB5738.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KHOp+JCccumwp92F91pvpLgEPHeBf9CTKDeOVdHVxqJ3eI9r7uEeV8U+xW7ZdXy5PyFryj3MapTWjMru9EXFCdBfgs0X8LJ5krYYNERbq9H80DxVhoV+jvvodf1NyBMokaKOExoKFS1LDG3rd/o6VDbkpA7aYAc8LWcQlgqnvujQp5rOsVBvbZQZ0tFFthvkO8+fu+fe4eXmYlfnKYD1Y6csS4llZNDCd4PiO+tezXPWMGf6SNLBKzGe+f4AgIDitvARQ692zTlAD0lWJ+APSjSC/qljYaWHODatuqV0CY/gDe4HZ2aCsdhJCYGJ6rMivTMmEs8Y/OiGl0nxAgj67gRpWv4T5U594V0N8T7hBoG+BnBCEI3VcPIWVLm2tpyfF70+4TeXyiBMIlQdNwhNKOGlP8zVwAbkFQol6KjpK458aSL3cMJOH0x91E8MOLdPoGMWaHbaPIzIFVC+nOnuLZid9s5Aw4iLbWCtwPn2wg2hshsG0lg42XHcIw16fL7/dhGPv4BE3Uuxbd9CQQ4rnjeBognEo7XpYfaIg71qLxmfGagtwXNknXFH4l68RjTlLAztBkftDD4LEp9u460IBLfl++SBq2DMmxCMsjz02BQ/LEdxBersgI+m7NAj3WGHk+tuS0W3BSDt5Ia2XAkdKUBnwdUCe3S7i58cj68yQbQCE6qAxlAfqvWiX5Nf/vPdXCdxqUFcX/ifGCRk5kwG+4ZBzM9bbngis1GGskFLGdJyr4gozh3nEHCe2AKJUuC6uPa/JhzId7JaL8axlrsTxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(38350700002)(38100700002)(86362001)(66946007)(31696002)(52116002)(53546011)(186003)(26005)(508600001)(316002)(4326008)(5660300002)(2616005)(956004)(2906002)(66556008)(6486002)(16576012)(107886003)(8936002)(8676002)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOHTgUOv/l+pmMcfGkOn/jh0CK4El/09uqvkMGvHIyFSUaM5+MuvCg+ArVBB?=
 =?us-ascii?Q?YEp+kvR0Xfw6u9yKhLfbeKRpjggAJUZ0a9TOSyuTIuhEfG6/KDfAMHNpu9og?=
 =?us-ascii?Q?CgiuP7DlvlADfYvfc6+6/k75n9PsanscSd9gqnZdqyw1O4crDh2X+tb8UpRz?=
 =?us-ascii?Q?ie+RTew65dBD4rE5N/IuwkfvFV/TR+fZnjhbgBg1MjTRKCN1KRW0Wcdh/xf7?=
 =?us-ascii?Q?a0aYDb7vS+bUCdZSaWeSSxavUWp6U1wj7Js9+OmyxGL6okw3GtVv2+74I36W?=
 =?us-ascii?Q?xaNv7MWM/KDflb0TqiqHS6BZjLFWCr3rwUO+H7TTjfo8PJVgud8nyFMES3lb?=
 =?us-ascii?Q?kPBjXJYVB8p3hTh+m8OGnE6nDFlbF7u0TZD9CCfYWSE4YaJHAql6RGEVNxee?=
 =?us-ascii?Q?jEjLiniKqjvDDKE2e0pxN09wFY/aJ/CEczxtfTgfOaXrIuUoVC2oB7iIF9cJ?=
 =?us-ascii?Q?67kSW70fWFK+6hiLrOjth1Ik9toH2fsLrBTsMBYLxpMMh+sH3zGS6IOS5fnl?=
 =?us-ascii?Q?bkRtC/59+ENHyGG7f+dc7SXND9bFZ00X/9WMMF/dJbrghKTp4oo7A1WXS2yh?=
 =?us-ascii?Q?+xGc+Pan4JkWURUHimAfFvFSWiFOI6N0S1P8ANNck6t/8xXH8xJ9JD0b6oEz?=
 =?us-ascii?Q?LQKDTscVmpK1jnHn49rLGzv4NVMCamdtIh02RJwOAEvVxLzTAhaIwF2vBDGE?=
 =?us-ascii?Q?WSSlR0JriutT8OVOSCiIbwFX8uubxZbm+InnJK/aignCfG0yobtEQZuQiznh?=
 =?us-ascii?Q?Xn1MgjT2rKPK7mhXZzoKtN0EzinVIlPMDU66XeqBad8H0lvMtsxkDz7kDCM2?=
 =?us-ascii?Q?f4jGHWHah057rfzVpHGHRqfUJZ/binsWoixPFKc7WxzLzNrJXSCC9m5cItvn?=
 =?us-ascii?Q?sGuxa2o+3bi7PCXQUnhAtHxaD+3zeoAPXueIJjhPJiSlv0XfZMS6ZdiLylEs?=
 =?us-ascii?Q?fIIIOHV3+/G6DEYqvoC2YXPkLv1Ra2rANZYaE5FHK6ZSvHLJ28pyTEV0hn1a?=
 =?us-ascii?Q?pEl970vVUH4HS/LGyqRqsRjnWV5g34A6UrdqQmkHCA/gsxvD/FMeJDWmCNan?=
 =?us-ascii?Q?TwN1dtEvhLeZX+6HtJOx7rV3c7ySkgEZOgUoVpsi8RmfWFG+952i6CfUwp44?=
 =?us-ascii?Q?iiyZuAwsKMliaCn4ovWzX+Mm3bCNRAPO8Uf/XzgZYDvGy2sKhCWQPXxMIagD?=
 =?us-ascii?Q?Boh8tTo4pWfPykN5aWiexgIhlZzID4epOHaU0y8xwQRF5cOF4dfMStNqV/es?=
 =?us-ascii?Q?Gi5iEQkIhJ2RyyOZIF0plY46ptTX/ndhP0Ztd7xIp9VyJ53WXt8Cny2CkudQ?=
 =?us-ascii?Q?uLpfuI49GOHJPL/61q//cDJ+?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fc99f0c-74ed-4a90-6521-08d98a310651
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:55:41.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kBofqKfp6GrhoHFLHeN2QKVZOc1FNPk3CPtlVTmMf4SPXQ25kT0G6TVw8mi3Jb3uiuADoX9ps+u1+sjQ3KLAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5738
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:55:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156770

Am 08.10.2021 um 09:45 schrieb Konrad Weihmann:
>=20
>=20
> On 08.10.21 09:42, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>> (no changes since v1)
>>
>> =C2=A0 scripts/lib/recipetool/create.py | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/lib/recipetool/create.py=20
>> b/scripts/lib/recipetool/create.py
>> index e88a4253da..83cf25d9b7 100644
>> --- a/scripts/lib/recipetool/create.py
>> +++ b/scripts/lib/recipetool/create.py
>> @@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 licfiles =3D []
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for root, dirs, files in os.walk(srctree)=
:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for fn in files:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if f=
n.endswith(".html") or fn.endswith(".js") or=20
>> fn.endswith(".json") or fn.endswith(".svg") or fn.endswith(".ts"):
>=20
> Why not
>=20
> _, _ext =3D os.path.splitext(fn)
> if _ext in [".html", ".js", ".json", ".svg", ".ts"]:
>=20
> ?
>=20
> to me that would be easier to read and maintain than this ever growing=20
> or clause construction

Will be changed in the next version.

