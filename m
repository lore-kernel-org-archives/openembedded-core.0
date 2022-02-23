Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD11C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:19:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.9875.1645633142290908820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=3uSrpIHI;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.86,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf7kANl5xH8yVCu90kfHO99hkJC1eOfmG/OxdXV6xQPTcUowKpJJTGtAO0vwvGwYN0heQaohw0sXje8IcLub01CO9+s0DXOJQzvZ53X8QhMXmtuLqGHkWujgfM0J/f5JWrtXkywdL+7rsdFiKiJiwo0oYGTSoz5iaLhLwS1mtCc+wlpf8mGMVGrDpuhDnSr7eAthYk4knf7K8Z7EGv97pEwbDH4p4wjBlbGKW5d/EnE3vG1z0QwwEfLg4gCVhJxK61m/REv9m7GyQHfFvfakOriLkg32L9ayecoaDVLi4hhk+IBkL9HDe8ljaU6F9J6K3FhIOj/2KWGwszGRI349pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVjT4xXBZx73QjyCO6rkLPwy+vMcSCd49HMVorY5mfg=;
 b=Rsp5fmCwo/5pivA0muGQoAxfTiZYW0ls5ub1YJPELts/epRzWwtVz1+naBQyqaQfOrJUX2ziZREIj1KBxvUv04VcSh9/7WC8DgUJSMkH7K3Fzt3NYEqJhJTmQup6BEzahNdhqEblPF5U2r8ictevXJt0t1iHZwLp9VsJ4os2SuG1H8fHNg8tYOVFqHydwofcdTgLHOo3oGkahFxosdNvbwC0Sr3iOXXYMvboPxIIWrO6AuYDyeXxwMRRvC5ctlcPAH3RCPpS2np+EcJStuULUUgquJSs292d+svy2xl+GCgspYlCCS+zhTka/MhEcjtEBXN45CeBOC1pGUubouUTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVjT4xXBZx73QjyCO6rkLPwy+vMcSCd49HMVorY5mfg=;
 b=3uSrpIHIm4+H9RP3e1W2bTJ2lee0CSGJKfWni0K2beqJgi0on5OCok65gqOs6bsTYFPJP/J9K3gvoAm58arPltLYRusZWZ03iYhnWvagI1bKI20u2pnAGb0CwWFKCCEjBo9H+KqciK4qSCdcBNbTP60YMOBlbw/FBQRjpXuAyZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB4046.eurprd08.prod.outlook.com (2603:10a6:803:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Wed, 23 Feb
 2022 16:18:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 16:18:57 +0000
Message-ID: <53dc1887-a542-3c56-9508-1ee2e036e561@weidmueller.com>
Date: Wed, 23 Feb 2022 17:18:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH] systemd: move systemd shared library into its
 own package
Content-Language: en-US
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org, mingli.yu@windriver.com
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220223155954.11408-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <AM9PR09MB4642B6942BDDAC17F60A142FA83C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <AM9PR09MB4642B6942BDDAC17F60A142FA83C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0103.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::44) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 755b7f0e-07fe-4831-94b7-08d9f6e831b4
X-MS-TrafficTypeDiagnostic: VI1PR08MB4046:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB404658B0149A66F6DB6E8FE4D73C9@VI1PR08MB4046.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mNcnn2Gxwj+xtA/uSxf5gL7sIVh3k51mHKotQNME7gBICKxMiAiGpG5VZh+YQQi2ZM94djx23TVJNXZ3NimlK99cIyprrOU9nyrlrU6umQCWSklv65Hzsgjza9LdW4Mlsntgqi4VHmjxtm9z1WqTbJDz/o80pDvvRjdxQmPbwVsK1+fTn6X94diGb+d6lhX00rjq0uLqkgg3nJ2VYpZkNZat2IYttm6yQTlG9AO8SkTM1WzHkFuqGyOKDY9xiAI4lwrsMka0gEa98BtG2YGKu7b0vUfevO+6rUtxBmZNyekIe63TfywzYqDRc96odnlysuDycDwPb4VFTQet38yQ62rb6ysvWAiIFAxHWBBuOelw7ZQ3w0Sx6noju5+W9cLagQgBQNGRa1wKV03lmSN2eY6psARpTxZVHQ2tR7ZSzxdZz6XcqaGg7PjgOkQTosEDIljEIPkiCYWoIQ3Q1/1WWHszJeubBsv2NcLEkalIi3j/i8b9LhPJPCESmmyYEocULHdMhQbceQO12Elyv/CbA413FocKWG4Uql5UhVQJQ2seuLe+b6b25ayPkOpzu7s92sCnZzjYitKx3yewXSBL92ID1e5+q8fpJEam9WmxRT7Q7bRm0F3zw0h3eU3BTk4YbKhWo5m2hsgV65BUVEC7IzzLzVLbJigPZ6ARp5O+B4yc2gTDiiHqs+UTpS62/CoKH9tVcXcBDOmvt/hvDl25Z0bRcVzRm9japdF3R/dlzVOUhu/7yYq0P3wvAWcHitthZlkDAfDF4oqD2APuXOIC4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(2616005)(6506007)(508600001)(8936002)(2906002)(8676002)(186003)(52116002)(66476007)(36756003)(6512007)(6486002)(66946007)(38350700002)(38100700002)(5660300002)(53546011)(31696002)(26005)(107886003)(66556008)(31686004)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eBRsTGZjMGplmg9rnqNgYxz9zfsLPddWulBxD9cTH2DW+Xh7oLC1COwUk+Rl?=
 =?us-ascii?Q?usF0XnM+Fx0L0xd9HUD4PY2J/jd6nwdyh1ecxlqNBvtr9N5c2ZtPe/wmJz2f?=
 =?us-ascii?Q?3+54LP7lfBAyBi4QDzEGbWeHf+2+/RUKDZ8QgLb5S2Yl9HYIdJINimPFeMqg?=
 =?us-ascii?Q?itCV6ZrES44jz6b5Tpgp1QQZlcRE6HXaSuty0VSqTch1wnM0JpwjX52VySJX?=
 =?us-ascii?Q?8mu1lazMxTXtaiHQQny7AWuGknd2W6+LS7/sOjiUqxUHjus99+LNgiM/wiJ/?=
 =?us-ascii?Q?QEib9Mk5SSoSUuZ1aqT6XiBLFlGp3L5V+iyv117zZT6WegnxgiyVQt6naggU?=
 =?us-ascii?Q?VKsf4lDmmmCs3T+/JB0jawQBaEQQRlj4AMeXN/GfNPEoTEtu9WF/bHhRjnfO?=
 =?us-ascii?Q?BGKz10niZ5XgANc/d1rCB1xrkWQhNd369H7bIf1CkhhwEJyayk7Sht5W9zIo?=
 =?us-ascii?Q?33cxzY+K/4pN0ITi392XQ6R14rr75q54OldLiJi4kl95KmcqJyBo2fZneAhd?=
 =?us-ascii?Q?B4OkZCj2LAMqgrEJXsjywwxb7mT1O7Ie09G96wPKr2WcyzN1qMn1tEoGnpGa?=
 =?us-ascii?Q?h6h1WtvVoWveT1R58uTU28KD/A1sxhPmv5S8pdDcWAcJhiuSG5pE48uoBkIe?=
 =?us-ascii?Q?Ug0hwBvcQq6F+rRj/EnKjl8h1QfBctTgoB+jr1S5c+Hid/W2a8xxW1Ku+/Zi?=
 =?us-ascii?Q?DzV0fakkLTe9tMa9vTg3PliwGpDkqBG4fNqtdUXR6ht0ZDZUfKX9GVUOKnHY?=
 =?us-ascii?Q?qNBK9GGnD6kS2ZLSvHdovSwvPl9lrBo2UTX1zA+rQs4HmaHefTPNH1gS1y1b?=
 =?us-ascii?Q?HVXYPlrfPwHodHu+wkrwXaLao1Du6vta3UrimxReok02r3weZ5eFulKG4UNk?=
 =?us-ascii?Q?jt3c0I8U+UZpnV2lyg29cYAkRHP6fZ1CtjaEZydqdrAnMuZpl/48i+/a38I5?=
 =?us-ascii?Q?Y/D8+lH84HJ+O/lqaIbyUygHJfsvjixM0KR+hDzQkggCj5HT1vz8qd1BhFS+?=
 =?us-ascii?Q?ICwtZIQPglopZYxqRoaX7etC+IBueIGswm/EzbBUFDxMLKb4U7/suqZC2nYu?=
 =?us-ascii?Q?tjOf5hgVNly4HnEG3RcaNT/wHFW2R3asHsMQ07j2HxRnqWLRsNNUQqcSuT8f?=
 =?us-ascii?Q?pjYKygscGW6c9QQbARAJs4KAFw0Q2Iq8sXftZdKFEOYIllDtcjt/h3PhqpB8?=
 =?us-ascii?Q?/xuQt6h1PJSXk/uu7Cfq6IuOw7qCbXRrydsX3sWMrnZ8mN2JdkAMF02nzdxF?=
 =?us-ascii?Q?QCzq9EbAHpaj/VvHvrwIeIfsXFhRY3OG1ig7M+vYGAZ/RBYslAVqq/Gjpa8v?=
 =?us-ascii?Q?Vhpi3xjzdja3r3o6KTfAyBWtEnjT/ioSl0V9/Nz4lrot1LcN63WmEYZWMN8h?=
 =?us-ascii?Q?y+B3WSFGHX5IZ8QBjnjSrpDUzHxd872sYLQ3ypBq7CSvIceYE9xyAAB7PZZv?=
 =?us-ascii?Q?zEM3UyfSeADqYHXBPJ28nMRMIajq3KWlc4eQzobH3sIa7+PffuJU3Lxk8w3p?=
 =?us-ascii?Q?4KBZI6kT2QMQMWkrgcV1rc9Ts1je2VEefRi9DBibf5O2phrR5whObF32t+T4?=
 =?us-ascii?Q?98TvkTQG9RQl5crBDAH9k52WDdSBNju0jCv2mQJCvbC4/FuOkpkk/I6zHA4X?=
 =?us-ascii?Q?5FPnkBm6eWfoN5PWZIlarFY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 755b7f0e-07fe-4831-94b7-08d9f6e831b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:18:57.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vViBJReFkWx0NY8tHko6RaB5Wf8CF0L+JwF2My8U79dlQBkEML64/btsNdgE4d7JxQGW/hVI+07ywJQzB4l/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 16:19:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162271

Am 23.02.2022 um 17:04 schrieb Konrad Weihmann:
> On 23.02.22 16:59, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Move the systemd shared library (libsystemd-shared.so) into its own
>> package to prevent a runtime dependency from udev package to systemd
>> package and thereby to a second init manager.
>>
>> Signed-off-by: Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>> =C2=A0 meta/recipes-core/systemd/systemd_250.3.bb | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_250.3.bb=20
>> b/meta/recipes-core/systemd/systemd_250.3.bb
>> index 9121333f56..43ac66da62 100644
>> --- a/meta/recipes-core/systemd/systemd_250.3.bb
>> +++ b/meta/recipes-core/systemd/systemd_250.3.bb
>> @@ -371,6 +371,7 @@ PACKAGE_BEFORE_PN =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PN}-journal-remote \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PN}-extra-utils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PN}-udev-rules \
>> +=C2=A0=C2=A0=C2=A0 libsystemd-shared \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udev-hwdb \
>> =C2=A0 "
>> @@ -387,6 +388,8 @@ DESCRIPTION:${PN}-journal-upload =3D=20
>> "systemd-journal-upload uploads journal entri
>> =C2=A0 SUMMARY:${PN}-journal-remote =3D "Receive journal messages over t=
he=20
>> network"
>> =C2=A0 DESCRIPTION:${PN}-journal-remote =3D "systemd-journal-remote is a=
=20
>> command to receive serialized journal events and store them to journal=20
>> files."
>> +SUMMARY:${PN}-container =3D "Systemd shared library"
>=20
> That doesn't look right to me - shouldn't that be=20
> SUMMARY:libsystemd-shared?

Thanks. I have fix the copy paste error and send a new version.

