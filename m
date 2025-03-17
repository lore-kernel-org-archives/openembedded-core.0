Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482ADC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:05:59 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.130])
 by mx.groups.io with SMTP id smtpd.web10.49556.1742209556295276925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=DJaZTEGj;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLaZnXL3/SDAImg+Res5fCy5KlVdRn6cxhqVs3VU3pdjP25OFbAMMqkOzyMHjYlmJHc6hpZI0JWGrwFFsVz4lUB3jLSb2wd4Uo9NvvYay4TcC8618JG8bNyxCSP+j4suLtHkNYGlmpoG10CcAoqqzURkTctirJMnh1JkELSNRWczqG7N9Q9kVmnL8ayoBh7Y+4nYY9TkDfmKhPrF2zH8GtRXwGl9URGd+piF64Sq11lFISValJCAXPJZuIyxx5ES+iBDana16blh4sHNa+N5fe8C1DTU1ex4qXnmxbe4Oh/ysMNEn8DricSNZ1NA8D6GLB52UAXnnN0RyisOlc+i9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb2Ux+FT6YAOzRzJSyfHOJdiS7yp/e0F+8QPSYS0Vdk=;
 b=QIcZvmZDf/u1tUneeFYaYFIuygUQF2uM4c8JerhBv7F/X+uNNdBm9GDvdztq8PxrleQAQPbx5B3aDIBtkmbdhnp2i/NAoqKb6/Y1mZq1V9fWKok5Dm/i80QTAi85QH1dMICQMpesulc3HUwhsaVy+UuQYKLsTQpNNU4xz0HVDQ+gQ+eiKeLW1s0NV3+LSApWUbNh/RBd0OhQO7Xpvyf4Qto79NCHUVOfl2zT2Oy82oyJD8qNdr2sSOia8ljWOvsOm7LNIDXbAeS6itUTmBKvGdAIJ0lLaXAMSdha8vxdcHgPiOh4qtJShjP/4Wm/JIARJXSUAa2V9DlaiYZ1c2JmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb2Ux+FT6YAOzRzJSyfHOJdiS7yp/e0F+8QPSYS0Vdk=;
 b=DJaZTEGj98D9Hbx73Bb4AXo4X9g15gx+w7PMiKfuwP6+9JDjrawBggfLRVvRQ2ZjQicM3xLn95G7LcwP/gH93rL4I0xhKsa5BbKdkRPeHYOWK3Klum5dozbXyyIQg28TZkbDpW1uDqcHmZLxyaOIdSFbiPs5h4qRWq+5EZ8c59KkmgSadtPrHi5sLMILVD3tT5n5JxBZHtmpBfLRDYxjzFtibDJHy06cpt0ghanvu2W2iwWTOWymwOluBXWZNECWt7k30Ft3m/NXBXy8Hv7FBQVSGm38EZOMCw4OSvjL3+Kw05wShKQE+2uGznQnITFfe3L6BScWloIDSdBS5AKKZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8485.eurprd06.prod.outlook.com (2603:10a6:10:36f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:05:53 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:05:53 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Qi.Chen@windriver.com,
	raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 0/2] Support using alternative runtime D-Bus implementation
Date: Mon, 17 Mar 2025 11:05:17 +0000
Message-ID: <20250317110519.1562513-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00007A87.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::614) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc8a7a6-5cdd-4566-02b5-08dd6543af18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nl9dgWkkMMcEnmWCxr2uz8X+mV0OVqCxy2NvL+8kQ3dwEQRIzGbhwX5Tjj1D?=
 =?us-ascii?Q?FZI1TnSiAAGSPDH7uh/vZDsJ5u9B1cJWmU06uKwfRr0v1AAByOYIkZ+SQdjo?=
 =?us-ascii?Q?SVjvUh8tQkbIAoeoVE//kwMsVnoT3aNmdEboaT+c9NqCPjeYy8/hpgbHTlGn?=
 =?us-ascii?Q?K7tBviuVbQFDjqOAQYMAoDIagq28SyjgNTgsbIbFQkmf9t2s8r3HESJgntNH?=
 =?us-ascii?Q?SDBzvg/9UBlqNlS0atStmytwZC1EitUZM2gzcB9nr5txgWnRvqLs557gXRO4?=
 =?us-ascii?Q?cc7OL3ipcvmW0c2wCRrf8XBrP7r/9q8GbArJ23/cAPbPohKrnDqQv1s3siLK?=
 =?us-ascii?Q?oOjrGQ5ZidzIBUHrprmaTawO/UYZmPWAVBVz3DgAyXejJ92eyulwDUFtCyop?=
 =?us-ascii?Q?NIN40uPfC9i5nQ5nfKFbt/FuYrMkoH0jBK1gPze20gVgPwcmjLaZJKUTJacE?=
 =?us-ascii?Q?2KKVKEqSHTL714AM8JQzN1Ow5IWwIPZN9b3vnKubrra/TxM63qmXAoTttl0n?=
 =?us-ascii?Q?OmuDX1Zv8urasT+9TABvFphoI7+avZ04RetPN7GcAgIKLHaIYt4Mqqe9cPGn?=
 =?us-ascii?Q?22CWXi38DbqWeIi36meQ3i8frfxrPTxXXzseNS+KP4TNhN01yMEfmsx5jW82?=
 =?us-ascii?Q?ePhtDhK1hsDMTg5e3b2vTulqd189+yIMnkBCEEsg9k58Co8Sp45dqvnagovE?=
 =?us-ascii?Q?IlyfWeveveBW6vWGZzJMRIq+trpxnhNCSpOkg8O41ekkgGJGbtBSOUNYAdTi?=
 =?us-ascii?Q?Qi9yOA77r8kz6/+JbvROlHYN0l7pRyO9493pmE1AIJvsfZmVsqQhYVnleCOY?=
 =?us-ascii?Q?HkOJitsElgOhjcglWpqu2Gw3nCwlPOonn061pq8fJkJ6fnLLZY73dgzVqL5o?=
 =?us-ascii?Q?23U8bamhwElHJYXmk02T/UgMdeTW9DmxqmllAodtZcxqa9JIczHLrReNzefr?=
 =?us-ascii?Q?/K4JA7cydiBiP/HoFSsF0F+hYmuwIWsb/QSrekBFvk2txJO9s4tPQL0r4koA?=
 =?us-ascii?Q?gFKtz5fN0NM5Jyo2o227+BAMV1f1gqsS+TwPzHv3/RTDH4KKk7g0BpZ53sdG?=
 =?us-ascii?Q?V3rLh73vQkzk4so84aaQJbjq54QsbTNbqn7/8P/3YaztF7kM5ZN9PGAzisRL?=
 =?us-ascii?Q?ZRhKJYhLLxhwMQmmjqHUdBzknmabqe8kYnuUgVcn/VY3AUfa5+cKYqVCQmeB?=
 =?us-ascii?Q?g2OfKlI6z733+efWMRsUxsdxfW4OblhKCvSnKKOr4MqwImg0sZiLKw5W/tWq?=
 =?us-ascii?Q?nKShIRFf9VnLhm7xONkmAuyy/SbLlEf9gKFawGYYiYQOnq9ecRiae7Qwkcjh?=
 =?us-ascii?Q?pahySQOgBbB+olsJ+DpBImRsNIK4fdyfy4A01SWCN60xsTJIYbYQ9LP4Dj9F?=
 =?us-ascii?Q?UwcgqhSf1QT4c9NG3tHGKs4m/eikbWMTVkdwv85Gdk20Xcv/5Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mvLinKQp6V+7kaSZImPN9/htYNae8UfrLEl4VIBCNJKzN2klG/9Iw/xoHc6Z?=
 =?us-ascii?Q?kcz9NLCjx6wnQnple35UAcuHgmM8iyAH3ABb2VNbqSzGb2smNqJvOXXyjjj/?=
 =?us-ascii?Q?SPES1x73VZarvx/GMgYt7YgBHVlhJGBCGdqYiq8lsUNrUszvMcfkZMGiIK9s?=
 =?us-ascii?Q?jc1f7jdQWz63jCzeIGPAGicy6ywKT3YwgBYO7eY5sLqEtblCNw2lwVwJN07j?=
 =?us-ascii?Q?VtTvwzmbFCstEjxeFtyPH/fzI2PXZ7hoMX68GZDtN8zEeuDoVLs0P28MzVIW?=
 =?us-ascii?Q?h/Qt4tXvIdtMJBODmma5dvsxzMFLDkuwnAD2AOI7KJHxtXQw81QJvAPHBChl?=
 =?us-ascii?Q?aKXBqgcDKSmNEnxxhmCXZRgFRadtzTVpOMxbCpc8gvtiL/XRz1mW8Lp1Bl+s?=
 =?us-ascii?Q?VlI1nh0y4rz9rUNUeEvFdLuQ996ksmjEBklSA0lTHI6pTTWCRe+oM30MPwYZ?=
 =?us-ascii?Q?kjDeCR5EjPTr4d5ZjzNXp0d5osKdX58Kw+WneKW0Om+h3BGOY2qHTyoLRCft?=
 =?us-ascii?Q?mVxv2TzjiVi+T1PsmsHUl+FCLFbIAatB23Y1jsvZOKkNlWD5UXqYKBYVRqN3?=
 =?us-ascii?Q?pmsi1lpk0HAGUoPogd1yDyo4VSpV3ThB1Sz9JdLq5CXflLWq9/8X6Wr595Sl?=
 =?us-ascii?Q?kkee/F7ZRddB5+fKJ9/CHBGMTSSrU2qgtXBbdnHj9jcP52nxPvD6kmPshO8p?=
 =?us-ascii?Q?k3ZX8HVDQbLOpBBWy3KHC0mQbn8c02jhCEx0IAmezeVBpCQcL8kdixX3YXMR?=
 =?us-ascii?Q?X7UFrfgNeFmw6ilwq46/dEoYrIldJtVTBH/1mBtHdrADvucMaa3VBwb2Gd23?=
 =?us-ascii?Q?7SILJpTsv5toRkUPqmWG0ORHS2kJjtxV+GxS16NJGGxdPUg3sKAKlcurXJ+i?=
 =?us-ascii?Q?4e07W+asVf/zUhI4BY0qRZ/URJElsVUMPoFtCCro4WGVO45/d78TlOtFlR+W?=
 =?us-ascii?Q?9eye/PvYDvKnLstveFHYSl03mjcujp7UARgpB5LucVQfssW7QlmKv7UgH0Z3?=
 =?us-ascii?Q?VQAD9stU/4SY2HqwpJF3Krx3eZmsNExejzyNMMOUS3BmnMWuB1Ph9cshTEqr?=
 =?us-ascii?Q?OaEsZpQeCJloOB9FLUPc/4C1PA7nGF/swjoAnsPpO/G4bLZlMm12U6kX/WB/?=
 =?us-ascii?Q?wbqONWabw1K9Bir6dFJoi4KGV4w/jZkSx9e44cjrf3RIc8wmeJgTjYDKq5e3?=
 =?us-ascii?Q?IgF7/+PdVGAkmv1wGEszKIwKdeMiinPo3kajalWdpbM5QDB1hue8W7cgVkyr?=
 =?us-ascii?Q?rMq432t7VxTCSM4ylsz5bf6kcLffUsc/xNPub1GUZKMJHGaZ9IwnPrcaZvc0?=
 =?us-ascii?Q?z4oBLgCFRmvxzgI9dEvByM3Jv9mgo5LSrTXUjiqZUedf7Z7E3qtNzKKWYljt?=
 =?us-ascii?Q?XxffaJYN5jliWPjmK2Pb8cL2w4Atw67MF8zNpttxcGGW8cWWgu7jXPLPo99o?=
 =?us-ascii?Q?0v/AgUagmJLF75jopZ149CRIms5A5l36IxYqpt03OEFMCCoFbVpotOOjR881?=
 =?us-ascii?Q?XIoBNUHFPUqiii/7BSoXc1gmMX009iInbWDBXgrOWPN//m9GXa/Ryfx/ZXo6?=
 =?us-ascii?Q?BOU0eIklouzzQw7am7RMBGXEDGiEf+uz1SCDPvComCqN0K/w/49r2jZOFnFv?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc8a7a6-5cdd-4566-02b5-08dd6543af18
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:05:53.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K21OmSkPsqV6C0LJKt0Szgs9ab9MXsUtyYMEEdMt8eEDqfLMtW3jXctro6RR5aviRfiuwnCNG+geMMgCvzdYHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213070

For example the Fedora distribution uses dbus-broker instead of
Freedesktop.org's D-Bus implementation. The following excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementa=
tion
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

In the following patches two new global variables, namely
VIRTUAL-RUNTIME_dbus and PREFERRED_RPROVIDER_dbus-x11 are introduced in
order to allow Yocto users to use an alternative runtime D-Bus
implementation such as dbus-broker, a recipe for which is currently
available under meta-openembedded/meta-oe/recipes-core/dbus/

This change aims to preserve the prevalent functionality, while
allowing the user to optionally select an alternative runtime D-Bus
implementation by adding the following line e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

Overriding the aforementioned variable will also adjust the default
value of PREFERRED_RPROVIDER_dbus-x11 variable which is used to
determine the runtime dbus-x11 provider (the value shouldn't need to
be directly modified by user).

Should these changes be considered acceptable by poky maintainers I
will then intend to propose corresponding alignments also in the
meta-openembedded recipes, which includes also adding the following
two lines to the dbus-broker recipe:

  RPROVIDES:${PN} =3D "dbus-x11"
  RREPLACES:${PN} +=3D "dbus-x11"

Niko Mauno (2):
  Add VIRTUAL-RUNTIME_dbus variable
  Add PREFERRED_RPROVIDER_dbus-x11 variable

 meta/conf/distro/include/default-providers.inc      |  2 ++
 meta/recipes-connectivity/bluez5/bluez5.inc         |  2 +-
 meta/recipes-connectivity/connman/connman.inc       |  2 +-
 meta/recipes-connectivity/neard/neard_0.19.bb       |  2 +-
 meta/recipes-connectivity/ofono/ofono_2.14.bb       |  2 +-
 meta/recipes-core/dbus/dbus-glib_0.112.bb           |  3 ++-
 meta/recipes-core/dbus/dbus_1.16.2.bb               | 13 +++++++------
 meta/recipes-core/glib-2.0/glib.inc                 |  2 +-
 meta/recipes-core/systemd/systemd_257.3.bb          |  2 +-
 .../packagegroups/packagegroup-core-x11.bb          |  2 +-
 10 files changed, 18 insertions(+), 14 deletions(-)

--=20
2.39.5


