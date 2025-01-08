Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40588E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 18:18:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.33])
 by mx.groups.io with SMTP id smtpd.web10.27348.1736360315378045757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 10:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/xMcU/c;
 spf=pass (domain: arm.com, ip: 52.101.67.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl4fM3i3kpEL5MaSUysp8iPjO1f7+7HvjdrZXkN8t+ALsc0z9gsnxH3AGFi6UNf/mfe+PkXfZcM4kBYv1c62r50LGUUCmwioOkEh9+n7JZjc0F/UmU72+jmk+rwDLc7Ut07+X0ndIcPcwnqfyHw/K3fn1qxHovPYx4Ti1dGxw+PGUCrGWEYuwwbVg1py9pDmr1kQz5GsAEwDEoPZcVHMlPrCz/UcwSvi9W0HLFRdnRHf8daubeprATlkj/KBqum+Qv5wyO+ykhrkHGoCNGHtJtRku9AiRhAqgn5b7sSKsF+QfM/Ksh/XMRhblqmKpFT9f0qYlLZTI/BrGnApilS/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgCDFWNoJXHKvSKB6xvQS8RwUiXl9xqss7oqkhgxfVs=;
 b=TI0lrCqJFZuw3oK34ge1Y1b9NoPUAABJmLTVbKA25uP2c1sLh9gnhG2K3s195ckg4+dff0c/mZLiQR0j9e7kW51yOuSLkcDXOrUqbJ0mIMMvs1ih42BWystWA34qyo9mv8Xc7HY0GyT08RjGvr9Ol67juxjdgSnvvT7oBxeMGMf12D63PYDWDUI02+GJ3Mbhy021GGdWXwApWYNqC1K69+ocCODKu+h3Kxw3HtElncBAC8BpMae8L2A8scqka5VOV5fUJnNOb9s6M96kNGFJ/RsJBE2rS5Rv6wvlzEU+5rhU8ZACVC2J/Z1QMCZnHwNv3Kwg1Aw5XRbSz7KjzOsecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgCDFWNoJXHKvSKB6xvQS8RwUiXl9xqss7oqkhgxfVs=;
 b=B/xMcU/c6HNHnDy7WyfbTpvGjDGgmxD9MOfLjaqBV0GV7TPxeNzBu2vbT4/q2/QHCBRVk5LP/vBU4DFHGwcI/HP1FMgs/vlHIRxfeIldXFhShTbyleEivxMd8H3Jrsd8QiCF9bbSmW6M+TDVf+F0ypHfNqtYkF+Th3zaCgCCS8w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9287.eurprd08.prod.outlook.com (2603:10a6:10:3f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 18:18:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 18:18:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
Thread-Topic: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for
 building 32bit binary with 64K alignment
Thread-Index: AQHbVnnNBVgYwD30fEmuUzj7sRz5XrMNMS8AgAAVQQA=
Date: Wed, 8 Jan 2025 18:18:30 +0000
Message-ID: <2EC4D86A-7376-43B8-A066-377EAEE49932@arm.com>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
In-Reply-To: <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DB4PR08MB9287:EE_
x-ms-office365-filtering-correlation-id: 118f272c-dbf0-4a7c-0317-08dd3010db12
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?yeLwJfso4taChddUhMjDjhzHAyH2gkRUbqoOts6W4JF4kp4AwCFILnxq88LD?=
 =?us-ascii?Q?ENcTHiRX1p+T1oNw0NyBUwxrt7+l12zBMbi3MGDaW0QLYA9gu8ml9JIb2Yhv?=
 =?us-ascii?Q?wrgwW7oiTjy29Hyadoj5RqNtB4vnIStMReEsLWvZ3wMqCEjkAiuNjgS+GD0e?=
 =?us-ascii?Q?AVfpTLjS3ZlEt/S7ZkQ6O+WOSqAKysD1vU+2Ow8IoLMTG8WW5Qx+AqoPhVki?=
 =?us-ascii?Q?Z4mVKGxHrHWYJTyzOLogcXqsaEIyKKf9Nf7K6ZIqp/wRkCpFIRP9ObwV3oS+?=
 =?us-ascii?Q?A176bxID5di0ia/FIUyrzZRjalil3lGldL/cRRZBPeEsd5ojTpw0oOMy0sUX?=
 =?us-ascii?Q?nFJ7UY1qKbzmRHVY7c+6o/sbsyCaaeTKFcojr+vr1hYVwxogPyrrg3zJn+KC?=
 =?us-ascii?Q?YO11THVebX2y4Dr/S6BUtRRUg1lucgnbiXiXK7CcEjmhAhtnL4/mfYNSFJeR?=
 =?us-ascii?Q?d/LyhNmcfKskQVh+fyFYXsBHQvMBTtQbwYOYMfPmHO5B/hGpYR68nSvVWOpr?=
 =?us-ascii?Q?Z35L0Tfcgz8OGXwFSaDVgIKfC3s8voy69VMa4kPvImjeHaUvLmtTBNQ2J5kx?=
 =?us-ascii?Q?DmROyxf/9Zq0JdgBaWGYcs/iow6WtrH6TKs66yNOvJtPXbiJyIBucKr1jh0G?=
 =?us-ascii?Q?xCXWORuxsCiliBmhZ2Tqqesu+xobluvrrZpY3gDxRH398lz5q/vj14V6BfNj?=
 =?us-ascii?Q?qnUFSF9I7HHyDOMPlRR/JvtHio9p/UyZQNIQqGKuzOGdeguhtX+/gEhMqMHu?=
 =?us-ascii?Q?eFbxO6w1WVXHKW66JkGAYn589Jcp3TYygdsF4NLdTJw+nrlhjk1eWfl95KqB?=
 =?us-ascii?Q?oYFo17S3fIZIC9JIne/eorDjtGTmjMzfXkJnJ99ECjNkkuSTT8IScMMGc5Ie?=
 =?us-ascii?Q?pPV6ZE6o/OwHnugj2bd1UBC/Nn1fd326GBzZ/1uy1bYVcdh6ojZ1vgHyjZJZ?=
 =?us-ascii?Q?0Kb2uT5DKgkMh6i6aybw/AIJB3o3ymJCz3sYzv52pnYibL9Z1W7zTJU33buf?=
 =?us-ascii?Q?mdBPqCU+qS2PCJdO0tI32s5eNJx5xYXIMBirU3GYYgAKiPqMCD8K6lSy9+MD?=
 =?us-ascii?Q?RNtPbxqElo3dZOmyNC+/xBxBjwRUh9vyewZoBo99QpOBIJiNV3q5Z3sTSk1l?=
 =?us-ascii?Q?PJq/MwB+YMfE59FSgDAsFUgtHULETvmUYTFwJz3reFkIddDcSzhy2tWA2pp4?=
 =?us-ascii?Q?7M/T+y6ccn/HMFNveJoMwOpuZS5ifPwBtkUYMCvX2RZdRZBs4PW+i7URGU0I?=
 =?us-ascii?Q?j/HItwcVBNDq7h13gAqxpE60DZmblceqRjPAgjO8/usLKbeg70nWoKrNPqEw?=
 =?us-ascii?Q?5nUKCLWouvTAez/L/dlzN+6utmbcg3yozU9TyJDKSMwsLmqcYqpI/LXVjRfa?=
 =?us-ascii?Q?xzUYgaBXyRhgLxd0UJRhlzoMZIL5e0pyjgG3lhW6mQtfjSbuuA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aio1jPD1J11NYjnxVa06Kq7caczSJ+BRC/6ZoWOoS2vYavsNLTdK7nv3a35l?=
 =?us-ascii?Q?uQyxFrBj/g9aM3CEZZUcfJbz0Zg4PpmtlDXlyqHV9LRByO3/QhuURWGc5Wz+?=
 =?us-ascii?Q?Moh7hXA7G2EAZ4VwlPBW2qLodhHPfOmjJUdEJwl02xfbudrtsfrVIIlKMtPH?=
 =?us-ascii?Q?OzOvKOHXKfB7FWbHFz0dl1HlWmtaAa9lhSygSAplr8ygPKgKVP+6JFCDcU4U?=
 =?us-ascii?Q?JVNiAEjSVpIT2GW2MXX6uqFTCqE22fCS8xJjdQ1T67OdKfFr5cqaa/XCm2Wp?=
 =?us-ascii?Q?c28yU165T0FWjky+vc7SFGoCwAzi9q/2KlzWf5q+zcZ0lZhvDsRBaey8yzKJ?=
 =?us-ascii?Q?bbISZkIC2yfA4Z5J0VqEcRMXNGnYwoUOuwrz+KfLUu2AHSGM8vYkad98QBRi?=
 =?us-ascii?Q?6IDBW+2tgiQ8nWXBHnL2MX+x4CF9jS55w/p6bVZ3dRV6NPdf1yPWDLkTAUzx?=
 =?us-ascii?Q?TbABYjep9RCkbI2XEuq5yhKMmP8cZpj6X6RgIQRiMakLhqn/nmm8YPoR8opx?=
 =?us-ascii?Q?GENNyurqqOxx6z3KwCdJnpMEWbWlL48B1IJz1kZFGgNC/TFe2FinR4yGsCrg?=
 =?us-ascii?Q?8Wc2SNaH+cxslyZXoh2cngDTw0sQ5/DzmF3qHMAVjhHVP7Th2WlFFirbv1ge?=
 =?us-ascii?Q?NsoMjTvlLYxa9E/WTY6XbAfy+DR7IjDK9GVsIfE/4Gr3A8gmtolZnQKzi4SJ?=
 =?us-ascii?Q?0gmTKATnZpCrkFYBVp1V/OUVcZcMI9bOxGOYQYad0QZjKVVaJ9S/PreIehnw?=
 =?us-ascii?Q?FD8Fpy5EMvgJtjqOPrI0cpD2YVELo2E+ftV0arKrfYOPdJzu5KAAEQ4H0Tew?=
 =?us-ascii?Q?w8rxpKIXTFVOM8Y0+pSTZD7t5++qCGt7N5fU3CPLzJj5zTLzVgmlq2Nlw08t?=
 =?us-ascii?Q?Axkr/yW89s9ROLSHm9OtEIXGQHRWjkHs0LQboYnTgi1iulMDDeRO1W2WoYc9?=
 =?us-ascii?Q?vEPLpDdzQ/qyIGWqbr8qgj19NeFRB2Jj/DdOJO6tE7B+NHwzlowtAu3MRYPf?=
 =?us-ascii?Q?uzXTzglmx4LEm9cqFv1W4fGAsQKens3KHI46/UzEkMSi8QHSPcbtpQpC2K4+?=
 =?us-ascii?Q?7NaYcfKujVmCS8XchubFBOZkyosChRr1sYkGkHykEbFyoMtkaBlwjX6S+wZV?=
 =?us-ascii?Q?Dg4RrYFK7FPqRcotuHwWgjOFc7jxiv2EtPI9dTgKwnkxKiIdyAfpyLCf7TgO?=
 =?us-ascii?Q?KzLSQAr8vG1NKe2vthEt2sNV2J8MpWsCUuEzHTeqJ8KO3+2rn5J/DuLlJvXS?=
 =?us-ascii?Q?T7j86/xyOowQ4E6V5UOoL9+h2h+gJhKcJFTCV1JjBmjIjZxbVLnVoz/rk0wj?=
 =?us-ascii?Q?losqUMbQdQh2aYHofs3ymA7uvUXvCpFWtTA977QAZyr2kwGsJStmuCm09R8H?=
 =?us-ascii?Q?mtRQm8A+u4FInlpFBZQvp18JCy3q9sxc1e419Gd1U17msmM0E+oe+q+XqZae?=
 =?us-ascii?Q?YT56J6I1HOjYLb9RfDaiR9wl2P+zfqLdbLJlKps2GeCdQgejIJTYxNxr9UlS?=
 =?us-ascii?Q?3NYW3tKBqQnmI5qhqn9w4mJHF0jMB/ur03as2gVuEr2mkhgOPMWj1UMDKX7G?=
 =?us-ascii?Q?11KDRLfXlZYGoXl9FV4z9DHH17d1xEs6oWlKy2Ky?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55A30E2878632F4683D76D52B2FE029E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118f272c-dbf0-4a7c-0317-08dd3010db12
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 18:18:30.9405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EUJttNhcSrWP79Fla7GDH3IIf0vP0Jky6dQ9vaw/WraGoNGiy8gKi7VWpoeCsgQezZL1/CviK4tf/S2LpZccZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 18:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209588



> On 8 Jan 2025, at 17:02, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
> First, I should point out that changing the page size is an ABI break, an=
d the 32-bit ABI was formalised long before 64kb pages were a thing, so thi=
ngs _will_ break.  That said the loader should work, as a decade ago binuti=
ls 2.25 changed the alignment to 64kb pages by default:
>=20
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dld/emul=
params/armelf_linux.sh;h=3D280db842208e06e3231ec3a8322369193630a07d;hp=3D35=
891f1fc91bddd03677aaefd7146ae5333e6cf0;hb=3D7572ca8989ead4c3425a1500bc241ea=
aeffa2c89;hpb=3D8335d6aa34b88ce31b62e1b578d54ab4aa364435

Which was subsequently effectively reverted:

https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D1a26a53a0de=
e39106ba58fcb15496c5f13074652

Fun times.

Ross=

