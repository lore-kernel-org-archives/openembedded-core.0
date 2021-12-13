Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA91DC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:01:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web09.10808.1639400470384505531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=oyT54STt;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.83,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEU10UWU0bWB2nYRpSK2bnJfMhQiZN55sFMH6oZ+dHz3yV4Gb8d3rBUGIxD7Imzibazfb/TiodEuINO8zaEcZsLGGpyBrGfpM4a1CJh5pgpWb8NibSK1P3OjJmlFfOe3/U2DHYio+QNhmqHrN4KKZGMQTrZ34khRf0rCnCYea/BKc8hSikW62y9BiXTxLwB4/aDibUeoyQxD+GHwB05UaSCNs7lqWTg+qDrnVAwN+Tj9tPCD9/zlGsdrDpzfzGTeuS5rXu5ZsmXVwf1jVIwDqAu0CiD4rGPq7WmY0wr9HvrOlKIGW7ud9ZewWndQE1tW8hJCiM+/iHLWWZECYGOxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1RyInaih/MNWRnNbOMgJao0+8AbuAp8W2QfiICH1b8=;
 b=OAitCxYm8UGGwH3ynYMJ3SU0JdijJOg6szpCfmyLpA3LUYGe9LdiGk+2O65lECVj8ftfSN9qj4Uw5Js7Gj0m8ex2l3gypsILNLfrqHYJBYbiNidFcmqDbtLjGNQ7FVquc19hL+ywNFIXtHBf4nYI2CVHscQKmY/zmombjc7avhYJoM9RFIeXm+clM58tes8IXvkziFjGmTyY7VkfHJAopiKInTFT6K49a0rj1lea/mkeInXjEuEPvUw0q5KuvZV81P7952qZSPkGY3/8e+3Iu2GDJN14PCcRJ0wFPnMYThp/jOqB77Hhxx9e+xUG07CdMhtZwr6oxO1U8RcYZpk2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1RyInaih/MNWRnNbOMgJao0+8AbuAp8W2QfiICH1b8=;
 b=oyT54STtXPDkUzagDCtArTd85+WoOz/g6y5GR2rsLAnILet7UX4jZSSobtBwNloV9/HV6U1QbfUnhW2Xa1yXH7NR1qYCZex+huIp/0eU76qe9sCqfNUz21cLJb9W/T9J0t7IiihvaS5eQQdTHx0XFshUzVOJGcUVrSMVODN8OgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5984.eurprd08.prod.outlook.com (2603:10a6:102:ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 13:01:08 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 13:01:07 +0000
Message-ID: <f8505299-9e6b-8579-858a-906f00fe0b10@weidmueller.com>
Date: Mon, 13 Dec 2021 14:01:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [RFC PATCH 1/3] recipetool: Separate licenses with &
 operator
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_Kr9ziC4TLcgTZ_cGzaFy1-6uDD_V0geAEJnt1p7cEWg@mail.gmail.com>
 <16C0520074644916.18377@lists.openembedded.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <16C0520074644916.18377@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0021.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::31) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (89.247.126.92) by
 AM5PR0201CA0021.eurprd02.prod.outlook.com (2603:10a6:203:3d::31) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 13:01:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d2b327c-1985-4642-81b3-08d9be38a0e9
X-MS-TrafficTypeDiagnostic: PA4PR08MB5984:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB59849E160756B838FA0B3C77D7749@PA4PR08MB5984.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Q1lN/YTcdoLSrGRV1w4fOsT8fTZj8yxc5Tj8gYYbfTTWinvXXTgR7hzmfWEbS0Yo9TSBlLuzhWk2N131Gwhi0Y0GfZ2at+QjSD3insGYLRMY8bH27aCLIDAPWZKZyabrrxJtjEJNrr9Iar3GxqBWL/64DPec9srNtr/O+YL3mPXAZ+cu5q9FETmWW9rNENQyiKXu654OvxXnM++TW+c+SpNtbIBEIZ7T97KB6jepW/ZmWfskBE4xq9XCKwmuc7zK+3yavIs561O9SKVT2ePCj2/kG3LKF5/3ALCZ3QlgZA5g8fZJBvFsDtl4OhqM+LjRe1T16kngOCjd/lEEmd+TUGRSTuVsf9q2sVRgaHnDtK0CV2Z+UAzoWNLsY3rLZEecvlytx82hlv547sxLbFzQITNiPITZcOib8DkL+VRUWjpnfK/CWw1+HbHfJLdRB+1NZ9SF/cIAnNGlDgxdRj1ug6vme6oEfGdSF9DmSKNKOFWhLtVLkUKzVPbNAj8CUV28goS20d1uAIKl9jqOdonhGvovXp3dBPFZA4xLKz+lrDM+JkgDvgVzT973PKv9byC1Z9xIe2gQ0Kcap90uTrnTK7w+8tEIaC/N6qmy9Fm0yOAYnCEerPgurXfJPeY3LFbEdn2sFH3ecLJwNfexmk7BMr+n02AzzFeEDxexvl4He3lrApGAyk1/5S1jQkO6IojyARze4Bapi8+l2sPhG5tL1U+Tk64+BJkZFP7u98jrmGAuk10D5cicMWd+lpMJ5vtMDO87DYqwZidPMhBd9KpKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4744005)(26005)(956004)(31686004)(107886003)(5660300002)(38100700002)(38350700002)(31696002)(8676002)(2906002)(4326008)(508600001)(16576012)(316002)(54906003)(186003)(52116002)(66476007)(8936002)(6486002)(86362001)(66556008)(6916009)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TWrcfaHubgFjhdA1wKs5p8i+NpGvtrVSCSm1p3D2vbkUZm2l2BXp6L7oSXc4?=
 =?us-ascii?Q?0CUb+bTTvhE7a2J/UqQMz6PmCZiPOec5xsu0vvyHeNpILpC90w1vYrtN1Kej?=
 =?us-ascii?Q?P6sng9h8OYkVz7TndkZbxGlwH/wBOyRugjCHyMnpSJXJaASS54az7vONoKa6?=
 =?us-ascii?Q?lgOUATt2NJrn/9ciRQkp2gjgsgkEJ8uIiKWMFDpDvkln20pRjUGCxpmkHmjy?=
 =?us-ascii?Q?ABh450hwy+xBPCl8UdeZAzImr+19T9IJDiUsRbe890fduVopnedO5oqAW5NN?=
 =?us-ascii?Q?crAcWtv2dCSZDu5Zqmx2BMJCbVwSMPE7mdkdJvX12/upS6clUVpQax9KJgPn?=
 =?us-ascii?Q?X3+UDk/8M7ef/uEqQ+uu5Y5VYSuZgis6mivNmvsgn4qfoYhYkgp8/tC/iDJw?=
 =?us-ascii?Q?aIYmuOB3Z0NxfZFYttylRADvU4CW3/R7iOgOstINqHdsiVEuLp5p7C9UmU3e?=
 =?us-ascii?Q?keHVNQHQA9zJKzyafQHDxeepQA8UYLdCHYqeG281s+oa868I5jZrm7+j0e5h?=
 =?us-ascii?Q?bonVkIKTtoGDeOWimohzg12UlSzIR0tEnyhoeUCB+hfoBrnCGtzBcpxQ9wWW?=
 =?us-ascii?Q?aUwrq/hDgWlWCHADI2G0JHWrb9noXd/GWDRltnXfIWM3TzCRyM+GVdW6USQ4?=
 =?us-ascii?Q?9VBafj/y2N9m67EEDzxqlmgbRTSVJFbT/Uy/zLZlqGgcSVCQMSWpkpoY3FLF?=
 =?us-ascii?Q?+a54eD7/fRLonVYMVrGwMRqo/n3arGRSxBsripcJkU2ASvwtKk9QD1V/gV7A?=
 =?us-ascii?Q?KJuv6VU6cTn9ZOQFCHvOrMNdr4GCTFTAArfOq9wvjP2yRR9FakHd7EDrXCrO?=
 =?us-ascii?Q?lkWhIzMiIH1xyhqpJR3h26ka9Xxc9i+q+Dnz78PvM5WPr+UB+HUADTMrdwMB?=
 =?us-ascii?Q?XscgCMMJSa4U2UvpKWIAsXoEvdZwYFR1hbq0jVMzhVhwcrbmNdfpQLS0t8BE?=
 =?us-ascii?Q?lDlTriv3yLfhdEsvMGmGFNBP/7juIJYbXL/U11PkruA9zRqA8jUipNaRwe/X?=
 =?us-ascii?Q?29dI1+miHQz+Uh5F6K3vf/wbbLZe9KbXjyX12J9Tm9hx7sHUeupSayPO7a5Q?=
 =?us-ascii?Q?xL79ttpdhQGzlD/GrgShfNjQc09C5YEU+0hNdx/5gbrqBCIpgXxzRZkW5S8R?=
 =?us-ascii?Q?/gPCo7eG/dscqEubw71vv8/PnZG3hGUIByu7ZOvRzFfEtXNMSmioNxJdZaB6?=
 =?us-ascii?Q?2QJHRn7HtJv10la8Im8K5PudRaaw0ZT+4TOyxnDol/DOp2lhp4p3XrVM90b5?=
 =?us-ascii?Q?FnTEiBkSBFFw6zl/eS15bK+wTQQFXPKJwD9nRPxZyngr8cwubaQ5nJ5fbwaR?=
 =?us-ascii?Q?oPfMsRF6OnOsSVjsLBi+jK28ExlLmWUJ/lfCgxlRYqtfFyqVxvPEefWJKjBa?=
 =?us-ascii?Q?Pjm2LH7lsb3Q2Jxw/3eHxmwfO+xzWXiTcEj/lXzDgoNyH8LqMUyCUBKPM7l9?=
 =?us-ascii?Q?4Y2cAZdAZFOs6nMxxlRad5ABRQ7YoMcY9XSUO4JTIj0FXUWevHX+ekZ6aJNq?=
 =?us-ascii?Q?TNUKcSFbw3ehbUlw0CMyljACb9IUHwRPy4FikKw0yH7YO9Ho86ed5BgW0JW6?=
 =?us-ascii?Q?xgB0xNBDrUcvlJCIv8dNt+cbRC8LB7I4/6iTLX+06Jg98B6Qc3z+5kTJNwWt?=
 =?us-ascii?Q?pCx24cf7kuVirQocPP2NcMg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d2b327c-1985-4642-81b3-08d9be38a0e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:01:07.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UgHyv7fHgpf1ffqt7TxhN2sAZlrDHyCqtrTlXvWItcJnz/Hbbq/Cd2HA/XoHnVbZ/5eg5hEK9M8elFwDAR4HNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159624

Am 13.12.2021 um 14:00 schrieb Stefan Herbrechtsmeier via=20
lists.openembedded.org:
>=20
>=20
> Am 13.12.2021 um 13:57 schrieb Alexander Kanavin:
>> On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier-oss@weidmueller.com=20
>> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@=
weidmueller.com
>> =C2=A0=C2=A0=C2=A0 <mailto:stefan.herbrechtsmeier@weidmueller.com>>
>>
>> =C2=A0=C2=A0=C2=A0 Separate licenses with & operator since it should be =
satisfied=20
>> most use
>> =C2=A0=C2=A0=C2=A0 cases and it is a reasonable assumption that all the =
licenses apply.
>> =C2=A0=C2=A0=C2=A0 Furthermore flat, split and sort the licenses to mini=
mize license=20
>> string
>> =C2=A0=C2=A0=C2=A0 changes.
>>
>>
>> I think this is better explained with an example. What did not work=20
>> before, and what works with this change?
>=20
> Do you mean something like:
>=20
> -LICENSE =3D "MIT ISC Unknown"
> +LICENSE =3D "BSD-3-Clause & ISC & MIT & Unknown"

Sorry I mean:

-LICENSE =3D "MIT ISC Unknown"
+LICENSE =3D "ISC & MIT & Unknown"

