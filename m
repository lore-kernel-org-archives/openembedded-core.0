Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079D6C3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 11:59:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web10.34516.1721908791747403888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 04:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=i2sPOITF;
 spf=pass (domain: oss.nxp.com, ip: 52.101.66.50, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1TWO4V1JEAaI0EQOmnBEfweAVmsUnncNxKjFIpAKpC53cKPJ5NtanW288aWHMgZt/zo5DaGkHYSADaKNIK3Lufw3rj00YsffdkSlS5/0kL9PzVBv4byv+jJww3Sio5xWRglKjhhpJFh5eSAPj6HF1miKWjXrjvRJss7WjjM6UPVZ+7GpR+0TgRmNBDHh+aImiRdFPKHQXCzbpBHo3HzgsSMEoNWQn5+UVH4Vxz7WKpuXqhB9Mzv1n1IjkqzyuM7zRZszkvNFtyDQhsolP8wDbvJmKAjhBcjBwf4EQ0oB9/30r+pP1rfoON8E84yYlQJ/lWugaF9SNQQtITt+//4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FwrDiRcmwhiqboB7dD2xC8MJxeyWqUvcYgQIsU6J4g=;
 b=Ry360XbNKDfiFvh54oY2lGZKX1J/YcnvcKnERjN6mUUnbdM+HTqd0VyxPy/kuEr77jc3lw6Z+sbRybFlMQCB734vy8RG+S2maoEGctRvo36DjVdD9Xes0mcbthKM/Wliasv6yBhSKhT75+4G6Cbr5wtt7a7obpft6xjsW5z4wqxkVnSsqzCV38+zDC8qDevGKCb3wrZia6fS0eTKxbfgf073kFuGQ2AEKX7ZBiMwLFXPAt8/jBvR5712BNZeIW9NzpVdviTEjL2lmg5JV8Y+7mN131+0aephyzmN2yTvZ9Ga3aSYittQwh7YViVNbPm/Yz4Yc+30tc4JHp6Aebdjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FwrDiRcmwhiqboB7dD2xC8MJxeyWqUvcYgQIsU6J4g=;
 b=i2sPOITFDmKaMSZJKd/ZlcSpD2u7bUB51dk5UGRBR2Ut9woPl40Z548oX2Szn7zWlfn3kPEO5gbCJvAe59XyYZR+X1piDbLwjaSs41lJXttfs3RiqBFHhD+9ZEc2F1JHpPhujri6euKw4I0cXuFKltxiHQfZtOchqJIhCXGleW6n/QrVGHH3/ePDeamvOjdilIEi8zDFrtr4tzgyVPdzmbqPEjlp+zzOd7c9DxtG5lJUNvqtmlh7wQJD81qB54+hr/ygbKggbOOcGpR6g434LQWV6E/N/QktpueejbjPebKGhHxTVDCRRhCjYcgYHSiGvcD7J4jSIF3bWMPInciqzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU4PR04MB10499.eurprd04.prod.outlook.com (2603:10a6:10:568::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 11:59:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 11:59:47 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [OE-core] [PATCH v3] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS usage
Date: Thu, 25 Jul 2024 06:59:32 -0500
Message-ID: <20240725115932.3459266-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU4PR04MB10499:EE_
X-MS-Office365-Filtering-Correlation-Id: 8715d843-7b05-4d6a-4187-08dcaca1479f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jceQu79WTZBA5+4wJFhV5GlCvzO6vIs1fEvoEd4yiN8LtiSsmAaPpX7dEAxr?=
 =?us-ascii?Q?Q9ECZ7mvZ6xssAr4q1HISFWfEYExX0LceUDMUlQNEzKVtzikb4cG9367H36v?=
 =?us-ascii?Q?bBWvZxkXQ31EPwKmqLhTK91X6f5TXbL3/VyvOmOjo+ZMq4W66vgUXX+IVnrI?=
 =?us-ascii?Q?YsWUf04gRHgu6SKl1ukMLdw0AmrA3MltFLcjk7NEP+qNAJSTi1EsbJzgRLSx?=
 =?us-ascii?Q?kerHoNQbWWk7QXq7eMPhffVL6XcECP3yPLtDW0YlCUadYE3j0QJoRmfzYeK/?=
 =?us-ascii?Q?Hn6ftIqSMV5V85+hSaXUK5l1TCMHiqJFJvf0FfllZzaWG1TTrT3ET5XsYPYq?=
 =?us-ascii?Q?4KPWZ03Q8dgxOfx9d0qgBKzev3FNd+I4lYzHTGTA1ALShxkL3DUW4fSSAu97?=
 =?us-ascii?Q?WJ4Te0xLXMWDtp6UuYSYYM60Oyq1I8I+zW0fPlwCI3Cgpo5DyyRBA8RWXF6U?=
 =?us-ascii?Q?IDdSMlmQWfKn3PzTibG5aju8aJjk43Sf9mBJXkjSLBMcQF8wjhLH11Fn+2/2?=
 =?us-ascii?Q?icaQNFLRCmrixu/1IkiY5/sIyREmxFMwZZuOoVDMFMgNPnJlB2qD7oQvyJvb?=
 =?us-ascii?Q?wIb+jzdDUz+qdu6lF8AY5IIj6MetITEU6KMnu4uZuEXUtpJPeMMcCEcF5Sip?=
 =?us-ascii?Q?/mp+dk6jWQXzQbPls8q+7gcCAGg6Bsg8t+cIAq1EihKpq1iFgmp8ar0eGMgP?=
 =?us-ascii?Q?O5x0CE0BduOfywpUMK9+c0t5nbap+gEdwDNRRoKOamuCiiMlyBFwiSjSuCRF?=
 =?us-ascii?Q?HBMX1n+dZICpCDtLFlnnPP2Uyjk55FwqsCLvEIMt9h5wERbIGLto0YM3HMmq?=
 =?us-ascii?Q?wItpAL+9RSVyOqSTqnZVezMgn/b8IS2Lypn4sGDE6wQlitD+r3HwJLTC2iTq?=
 =?us-ascii?Q?7rqDU2ikUYL7YvvIyR6f/J5FWRf76mvrzs1eaI0MkVN8C6nv9gNHeCvo/u7I?=
 =?us-ascii?Q?ARLegVb6pN+gptY4WiDUfSqJlnZVanH7KSjLlCEVpCsCpWqFKwsVX4qw9bTd?=
 =?us-ascii?Q?uAujARWpGBAD8S/UOF15k3Uxt0saV0eAvIg6GnqDBcQ+CSw9irB2PWT4dZ0B?=
 =?us-ascii?Q?D4/3ijECn35EzL574JLbSwGVZD6oBYeWFQj85VzRSHZEKmfkS1Tar0Fue+3q?=
 =?us-ascii?Q?SuNMjntDmv0suROAaJHGXvaYWjK+jJkqHWyuB2MSzbeF1TmelTZfesjrvXyq?=
 =?us-ascii?Q?0vd4NVVDv2U3N24vRTW8T1fpyo2TU7J/FTnmnPx/VJG0gJ4Yht1PO9cenjfd?=
 =?us-ascii?Q?XOfShXxXWzBPx3M/gUhfb9UV+qa7QVmHHTo+3KkuMyyNgh0nSTk2UpfaqJzF?=
 =?us-ascii?Q?jMilGFmnHirCC8hlGPDSDZPcsd6i0cDZdJ96fTRWbH4imyAr6cHczg3jSBct?=
 =?us-ascii?Q?1Ak4ZdwG7AfbHf0HSEwIS4urhVFG2CQ0WNXgjszIBCAnw3QT5A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jSGGVL9FiuEyt8t2RZrzUB3ho9oflQLwvqBs1xvkqyq0SaDGf/iBSEp9bta?=
 =?us-ascii?Q?Twen+IaCB5zsI48l75I2Ere1F0ZK10oIXeeWS0ynchOKP3gYF3sfRvmb6SJQ?=
 =?us-ascii?Q?KbHi8JVFaS6HgeId91hd9MM/HlFT9gjAdb2TZSC/ZUBDf6B25Ogr+NPtqAlw?=
 =?us-ascii?Q?Rn/tKqunHadmfqrnrdy2fF7MsNXTOsAARvP7NGv/zolncJdjTjGyLzXTNUSG?=
 =?us-ascii?Q?8uc0dyyNIlELpJ+aiqviO/o87OKkTrwLiz+eOo76f+LlYS01Zq0wK5dX5kwO?=
 =?us-ascii?Q?2sejefliye5cAoP7a8gw1BoypnHEo5DOMWyGvl6wIO1fbitW5kHqbES8QJjf?=
 =?us-ascii?Q?WXalhsUpI5YNLt+/Ff85Y26UTv5Cs0CFjrot+TXPZyX3M8pgSOlwYalhMoXr?=
 =?us-ascii?Q?yplA/0kx8ye48672ArbdH074JsjgZSfjbEdA9Jt6rIsrO+gT8JxLVtAEpJLf?=
 =?us-ascii?Q?5yYy/Za8ZV8URT2clkN/0G/qWf1f/zY3zmJSq6iOj+FEsKtxezHWqAIfeEly?=
 =?us-ascii?Q?bvXvrefOpuMiNnzyVMkxPPYcu9vqQZfCHDQVKMPPmTAMS2+3OBWUaLitit3f?=
 =?us-ascii?Q?SIRBltvzCoV3csk0zbV93HZbUUb+b6zR1QTvYEuKvUmNnEvrObqYVx2siJL6?=
 =?us-ascii?Q?MY21UmILVUmXBNDr06BY8gG6vtBo2kM5TcQ0cbTwKEv9zRiPnPeEyD1Ajpx6?=
 =?us-ascii?Q?Czaq7+vnDyqIZdlJv7ucrFMa0wwyKMIrSRHbK/nEfLSPfBE3IBavbi3erBXJ?=
 =?us-ascii?Q?FOic9xx1hLs78wxFxMot40lwlqs8hIbpuy9IpAG3tzC+9AENhWnGEasL/DUL?=
 =?us-ascii?Q?nmGeFs8uHQBEVIGdhODTWguLvuRELvdacSz6famkEhs2Ccvms7T0mJ91K7Hj?=
 =?us-ascii?Q?mBQVo6tCKdxw7hAVsNvlpPnvGisvKNtSB0hPt5WR/LFu9iDcE1C+UmF9tO6L?=
 =?us-ascii?Q?yiBCaHCfvKA9u4hIZr0Yca6YHa90MqKg61iCabSUKmzHb19f7fAFLB55WI73?=
 =?us-ascii?Q?L/S5UqrZH6Ze/VkV4C7EGG/59ftdhoDqvvdVwpPKF7cLPT+vuKWljBY8YAI7?=
 =?us-ascii?Q?duEQkDfknqC8saeKON/PxzOlZuPrfmkk4S9nJ2gPOBBL/AVCLqRBG9oz2WAN?=
 =?us-ascii?Q?8G0nnRZvf7dPonF6CENxwxXyBIf7zV+2znHqfFOYc/IHBbavowypb9cUOswf?=
 =?us-ascii?Q?vozgPVDZpzs+9GiCQDgMO37rMtXBW4OzFH50HfDfYazV5ZCq1+VSX0ZVqPOo?=
 =?us-ascii?Q?lIUoLXp89oMUdrwPwqG4nLZ1ZYQ/FA+Zm7rhtG3msgu2oZt6/KSK05uY6jhZ?=
 =?us-ascii?Q?1X5qisHhgGYmpT/D9B75CjRMbXuMWJEhJq06ZYSwMsoBKt5KNUX7R8GugJ5b?=
 =?us-ascii?Q?vDmonMlDCL4xqVF2ODe844b9C6xtPisbO7/Hw0ohC0ctNsVaVusAKBlDY72U?=
 =?us-ascii?Q?oxKtB4hX/GRm2EI+GbSxu+xDPJgU9VoKU+2Ljm/yoatyLt/nzMl+RT1m0Zjb?=
 =?us-ascii?Q?kvKQecQ4YXHh61uFMRKsn94pW7embjnejk4UyWU7LpnwRPwwiK5Wf2OgWxC+?=
 =?us-ascii?Q?MyT/ST9n5d+gEG/j0jQmrq/jokFcR7HZF8qyU/ja?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8715d843-7b05-4d6a-4187-08dcaca1479f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 11:59:47.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a06WbQGj7iLwkAyU7rcE9yI6Y5L4n9Cw6Afo+19o7OCpgc7BfH4JEk8wd/bskptoZk6k+IZYzvSei9LRq5Mb2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 11:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202497

The implementation uses the append operator to include
GLIBC_64BIT_TIME_FLAGS in TARGET_CC_ARCH, but it places the space in
the GLIBC_64BIT_TIME_FLAGS assignment in order to avoid a 'spurious
space' when the value is empty.

68b50d3 time64: Remove leading whitespace from GLIBC_64BIT_TIME_FLAGS

The problem with this is it requires anyone wishing to assign a value
to GLIBC_64BIT_TIME_FLAGS to add the leading space, otherwise this is
the error:

cc1: error: '-Werror=3Dformat-security-D_TIME_BITS=3D64': no option '-Wform=
at-security-D_TIME_BITS=3D64'

Add a new constant variable to capture the value needed for the 32-bit
special case, including the space.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/conf/distro/include/time64.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include=
/time64.inc
index 510da11039..9d556bac16 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -8,10 +8,11 @@
 #
 # Working to address those (before Y2038 rolls in) will be appreciated.
=20
-GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"
+GLIBC_64BIT_TIME_FLAGS =3D "${GLIBC_64BIT_TIME_FLAGS_WHEN_NEEDED}"
=20
 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
+GLIBC_64BIT_TIME_FLAGS_WHEN_NEEDED =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_=
BITS=3D64"
 TARGET_CC_ARCH:append:arm =3D "${GLIBC_64BIT_TIME_FLAGS}"
 TARGET_CC_ARCH:append:armeb =3D "${GLIBC_64BIT_TIME_FLAGS}"
 TARGET_CC_ARCH:append:mipsarcho32 =3D "${GLIBC_64BIT_TIME_FLAGS}"
--=20
2.25.1


