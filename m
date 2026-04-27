Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0E2FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:21:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46096.1777299695973408486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Zcp4fz7W;
 spf=pass (domain: cherry.de, ip: 52.101.70.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1Miwwhr4oIQaR7qpdHbgYJQzMJVUFWaMQ7koHASFM0oBUb0wW/jc0J2L9YIwx/9J/GZ2C/ilGBeHztNbUvAJ6+WtEg8PC/VAYOdcWB/y6lLk+VhljuPIOoDh8rBCuA7EmJSOjiegJGiF8559t05dRui44ai10Ur8UOIGMEeSJQqTBeAKlRECK7PHkr7jSRtWrlQGeQDWaKwcU58e5mBVnQoDsLZhfyRJJ9IzkZEvmFdqW3sKljK4gB40t5SzOGHkt3BDoRYn14HUGbMLhoEsJu+xJ/7HuobDp3lYaLxwyTiUxyMiaVfzzeFFmEPVeLOh8AfSGjuRhodTg1D9UY4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65i7soipS9MCSi9MMNqObFX6tYmgxXESHIlf5Kb6VDU=;
 b=p+0YJq0JpWdUhWBNiyJWHvYbVB5gxEiJFAID+XiwtdbZMNMuYHLAnGV7w2h3QYaRaRruUAvZeaRGUjxGtTGFMdGG1AybQ6RxnVjXdP64s7P/MTp0Uk6ikGcPRfbzpBeFT60xqOmdumd2TVKd2TjYNCXcz8GrBxxPwy81d5tgoGfvcUB/dZbiY/pqj2F/n1Z/832fyiy83OTl9Et78TC2lJD2w6rJ1GPgxnJXatuUr8k6r/DGId1FuXNoh6BpJ0ZKcB15SKffrVA8fM5I857kwQ52e2NoXz9i941s0TZ0dNZGGuZiV+Neo9QPx7r9BVpmeACv+7Y0+zTObji+UXYa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65i7soipS9MCSi9MMNqObFX6tYmgxXESHIlf5Kb6VDU=;
 b=Zcp4fz7Wg8Cy6/g3EhFBehXcGdEt1UTWm/fnTcWDRtdz/zqYyHnn28idxOAtlUp+Pd1iHr3qH87CmCv8iBQFI3pkUjLZfmppn7uJGj6Um1neN8ATM5Bd7l8d/oYu4A9JvRtB6qxBhzYmwYI7kZzqdgdnwf2RDID+4Z3DL8pX1rE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:21:31 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 14:21:31 +0000
Message-ID: <17be66c8-363a-4010-818b-67c42d51a825@cherry.de>
Date: Mon, 27 Apr 2026 16:21:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] machine: include: arm: simplify conditional
 operations with bb.utils.filter
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, qi.chen@windriver.com
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
 <20260427130846.96013-4-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260427130846.96013-4-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0150.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::34) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a75456-1109-4e27-ed14-08dea4684755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vnWeqAcva7RLrdO4IXr+ly297zzWpVRQH+Ukxn7rtoEDetCPitqMBcdc4DNQAKF5zg8r62xtsiTdgl4dNN80ZyhfcdkDZahzwIPQV3gROrN2410gaRsCTFLptClvP1A0ttBKqNOzqELyrFx4vWu9m3TWzguTm+F2WDguNDepwH39E5w7nOfWwvj4NCfK3aPoEACKr+XdDbv4mIEwvehQFg+r3ekkHfefUU6q9yOb2lywFPrPGV7K1ZJLEkj87m6lo9KSCdA47c5QxjAcO9Wz5P7v8dGSmrJp9MlwNJ/b31R2xinrET302OaeB2g7OP3LhiSSFLXRI73DljB6dqBU+q+aq0PKs4akpaglDzCuawhuUwgXQhBwOiAzR5O3e6mZvi41mrglPIM72KZywqVW7QDUd5inN03YRQJpjxLQjaA1Aa3T6wyRAQEJAhKIR0NI3xqCLW3wS5/gMF1uevERT/wct6XJ4x9pVEvJrX2MyGm+NoaWhMmyNJN4Wc67ieIwtZ9oNX+z2K2LUWlmCkgIn+1FOgU0u89RNIj7Lb8Wnmn8iOf865q4+3BuG0x5jvojdR4oNbmxIuq78sCrD9C4ZXMzuwPJu6qjTAlZHDRqJLZAaeWbeIsHCnA1bIuP7OuloZlLHHcI7Ce2/icd+lYudZQUqP8PvpsArT0h/fyHRtToSOYzH3bJX+XzAbdL9fH8QTYFZ+4Q8Wz/lZIPxFz12vN7B3Y9gt7y4kYabyH8cgY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o41HNJYbC4+JpekzjkmCcJJSjYeJU2hM6kz/2jMI0zS6e/1Paymq6WeB60z4?=
 =?us-ascii?Q?qcSmNMfTo2aEK5vxdlxiV15OOZ4Xa0tjkWRMTYGs/p1Jz5JeQclngFjtOiiQ?=
 =?us-ascii?Q?N5mooI5UZdMf+L/1i2bp7Fz22Qg7mi/y5aYqlt0zbz9hJffcFIdeexGwXHhR?=
 =?us-ascii?Q?peKrbVf6kSLLs28KP/qm0Vh9vAyDAEb3+UQUcWB3zdGArbDNWHrHEVeOCk0m?=
 =?us-ascii?Q?5BilGEsoG4bBYrEtfRyX2k92VrNWLqX3bZrpBJVhlGewDOv9LnUKI6oNYJtP?=
 =?us-ascii?Q?7y++PxpDP4wMiMw/+8pFHkKRckN1bqa4jzmMUsrYkWH/jEUv+4q5fgI9eLDE?=
 =?us-ascii?Q?y2umBTXbOEq5X+zSB+q/zvxtoay8vfgHVnHxdQujjJTGgo+O0E5TWU1sFGWz?=
 =?us-ascii?Q?3wyjqp7/Q1YK2KbIAGRQi4nAj1ExWFXSLA6d5vMoBkT10SStuhjwbCGGN6Pz?=
 =?us-ascii?Q?jmpm8BJFsqmn+D/syoq3kifTG1ba9V9H33fh+8my05wkVxJs5bjIg7/a3V3V?=
 =?us-ascii?Q?QS8ZtTA1zsXcmbq4EzsPGAtB+BLHS7pKXxHxdR5/4SgwIJjMobxlXK+5cc2v?=
 =?us-ascii?Q?CopLV4VsqyvzJ4pWU6kXnf1vTPztApEDQLupL69Q/ChZQyjtdgkHhUcqGSjo?=
 =?us-ascii?Q?Og3ASGObpnASmdnq+OjzqVYrnVMbJXxrmQn/U5ZhNEiuEK2Q9xJ+u3bF81aT?=
 =?us-ascii?Q?ivHnR3XAfj8X26uL5HsyTfbBoSQO78X+AK1GF8OOQAw2MNbjkipSi6WBbn6H?=
 =?us-ascii?Q?vesAE2XrCp7GgMaIZNwrbQc/ylLjdq27pxE6Vq4VxEH1QOvV9EE8y7GE/thw?=
 =?us-ascii?Q?FqyH1PUYjpJTZcipBHUoM5HIizLENemuQ4/pyLuA0FQRgwtBc1WKVLllcc79?=
 =?us-ascii?Q?jwPJpf58Z7ro5h2oiDR7ejubplZ/Bbil1vRessCWKetr0p/cA0PH0jlLPhiU?=
 =?us-ascii?Q?/PkI/o3Kp+aMHSfk9rsP+iHp1PSH09bPG5eY33iC93LzZ6WJ4V4MXkPS37t+?=
 =?us-ascii?Q?35JE5vvG6oKB4Z5BqD8WvU+0P5+dEEDhoCllczQ4obVzlPMH+ZFr4ZaH8Y12?=
 =?us-ascii?Q?lHr/d4kfbXztrEukh2z6G9M1yyIXcmjKklu1I2GJXUcPu/0H++ovGFNuFXcm?=
 =?us-ascii?Q?zjEzsAssmZNkh337qDinWvbcoDBWl8QL9FdXxgK3J60CpI0e5BmGtNJ9UKjE?=
 =?us-ascii?Q?xuKReWRGbR2Wjg/tswEliuOhzw8X7ukQMvD2Ez7/jyE+kJacxfM9eidDhznf?=
 =?us-ascii?Q?pG72PSQJrICIsYYSeOZJ0sFVkGOFqB+3eKHjr/ARmnGEmlTFQRmdyfmOJo4p?=
 =?us-ascii?Q?d/PauDbliAIKuHEopx1rVdLOmdAUJtUDkph2Sj6VhpgDWhf/K8Gz2m+htsMG?=
 =?us-ascii?Q?7ey9Bbv0ht04CQo85nTyvDZm/VIz9LRNea1n/PEeWKZZnGhCbEeOPCmQal7/?=
 =?us-ascii?Q?ginIhY3aEvnmoAeXfCTVfeC0kK7AQ9R6cXczoUszctuJDzPo0oIERxo8CmR1?=
 =?us-ascii?Q?/m4otOY1q/zyXnCYCpgpRuDtuXuAwKTlKBf/dkypq317VNwmpBK78rqgIDAP?=
 =?us-ascii?Q?a2AegIELkePg+ILGYxzWhOg8DdQa/SBb3Ss3rn5Qi5TK7QjOMgFlfV6Ip9XL?=
 =?us-ascii?Q?76SayZ4okFTgExjEwhreSj0azT4V/ysmGRDIEK3i7q1lVy5vADQs3+nT0ZMY?=
 =?us-ascii?Q?IVnv7IyfCNbxLtK80zDuxHUKiRLrf+R8rBf6+6pufrcg8DGiwF3c56NUXBOQ?=
 =?us-ascii?Q?d0meTsNJ2p8Qi9Pr/9gw1rLO9GKG6L/1Q7xOcTyDJtWhwRqm6jdc?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a75456-1109-4e27-ed14-08dea4684755
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:21:31.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxWaZL9mzjhT+YK+Ev0rw5zOCDebxpOVqKhYaANFk3qVCrhBhKbgX0ldq81Q1Fg+YZCz8BG6biEWoph76VCNSEQoyywYhpcJ2i0ypywDkk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236016

Hi Jo=C3=A3o,

On 4/27/26 3:08 PM, Jo=C3=A3o Marcos Costa wrote:
> Some configuration files use bb.utils.contains to check for a string
> inside a variable, and return the exact same string if true.
>=20
> This can be simplified by a call to bb.utils.filter, since the result is
> the same, and the inline is shorter.
>=20
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".
>=20
> bb.utils.filter() does not return the string with a leading space, and
> this is handled by a leading space outside of the helper. This
> workaround, however, has its limitations: the leading space is always
> added. To avoid any potential issues, use .strip() when dereferencing
> TUNE_CCARGS_MFPU in the if statements.
>=20

I'm not sure this is worth it as this pattern means next time we add a=20
new tunefeatures we'll likely follow the same pattern. This means that=20
even though the existing machines won't set this new tunefeature,=20
they'll likely rebuild a few things because TUNE_CCARGS_MFPU will have=20
an additional space in it (but maybe BitBake parsing is smart enough to=20
realize that only

TUNE_CCARGS, ARMPKGSFX_FPU and TUNE_CCARGS_MFLOAT use it and they won't=20
change if there's only one space difference, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

