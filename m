Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9F7D48995
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 12:07:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4670.1768565271540012638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 04:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=fRpNt6mx;
 spf=pass (domain: prevas.dk, ip: 52.101.83.44, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZYuEil+s0qH8dE953FukKTkGMOYYlYIJZLeOWqfKVeFXfwByGRLMPYa+AAjYen/M2vclvxQxMYdhFkp5calQofsUkczCkc8hQWXG56YEMVOOOsiNx/zYjVYSAVIyfe/6QThkSunmsozOkA3EJjbcnOT4ZYzcJ+UG1EyN4UFNhO55i1ECrNs+H9I9Y4rn9hrTeyOt2viHe8m4oVultPq9Y1+0jgCyak0vCMBmVcgwsekXoXmmiU9uZSIF28oxUZpgF7fWk1Y+aJYoumusWH2pRnGTESc1tMXxzjHrERCyuYzOCsoEsUcrYTJeGZbe7xajbdQXu6tHBPml9S+q7qYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f757Fk0O5X78thXtQmXoB9tYR17svvQQCYNX3ixLP0=;
 b=nr8pcl+Ug9CaxqNl4tvG+e4ER/Os+MCX5yr0gGHI4DFtlLUEsZb3VPvEenvZN89veif++YhUNslDPeRVUuF3euqnxVx439S1TOSJwqLhAKf/Ue3AluW9x5BepqAOZjop7wfthaK+9ZVWfGQeQFJNmeIrfyBGoFVH+CrOhEHMq0HRdykcSvd5hyPzsxtbByMgzE5646z90IUOpwx8sHc/oMibpRVXIAzpi42LVD3VtBM45Mvvi57n23fXCA7WPDssgcWIMmYXbZfLU87BY7Oxdc3Z9JWuXVrzhWzRa0juK393K9fa+MqBpz0Jy/FZlnroXX53GQK+R0hCWqrmP0Hmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f757Fk0O5X78thXtQmXoB9tYR17svvQQCYNX3ixLP0=;
 b=fRpNt6mxe3TZoooEMVkSF/CfcyK4xHA/aYv6CZQQQluUPHxyiv11MXasuOT0hhIJWgloB2DBoRjbtWCNph+zecc2OyCbGLXzcbUlo9xLxpGsceE98iwlOxXNRt6ZIXhP/7EdRslaIC/1bpoElUQK8lyFDzyCs6m2/VNEnaI6oO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS4PR10MB5694.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 12:07:46 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 12:07:46 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, emkan@prevas.dk
Subject: TMPDIR, bitbake v posix
Date: Fri, 16 Jan 2026 13:07:44 +0100
Message-ID: <87qzrprca7.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::24) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS4PR10MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 212c53b8-7274-41cd-2bef-08de54f7dc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bI+7cAszdq0zdh1hvceqX9i0SG4nLimyyS3e3zlhRErsEOELvNz53X9B75eG?=
 =?us-ascii?Q?MSiK9tUdizb6vMAosTyzgL/7LbXFOvw0T7JBrweNyXOGDZCG6UVYIbdUA/kE?=
 =?us-ascii?Q?9HUU835qk/Svd8Q/BCMgikle88nEEAcly1HxAvr7srlUfbQrsDfKmUId+0Nv?=
 =?us-ascii?Q?hbKwF29NPjtSQXuFYRkLZ+UNWcY8Pa9TitYLR+uviU/zAmOkuloM7zrQ7dAh?=
 =?us-ascii?Q?YjZl9k2IozfA3EeWRU1iEH3vsMgA4M1+WLNUFQYHSO9/ni28E12+0O2vkZPn?=
 =?us-ascii?Q?N9OAHdAjs1cElaT1lmIW1Cj52X8fe56+hx5LlnIOUZdHAHSoV4ppmos9JmoT?=
 =?us-ascii?Q?L75bziMIlgwA42UBZr/WV/Ahydd3cveDuSUUJwqNx2a9T/36LUIRwju82Tfs?=
 =?us-ascii?Q?ierW9F6i/U1JAC/eknqWRfXN/RST6WFGLk0StuxklH5zMOnvO0cjYYeOT01A?=
 =?us-ascii?Q?DQ17aNt5Eqf2FkYtqGuo0kBX7d2Ytzf4V5OgloApd1Aau6SAL1zqzQLXs5Ik?=
 =?us-ascii?Q?zPMHBEKWFf3vJaY0qQ5Vfbk+1vER/i3mY6CGYDoJnV62HOha3SlcP8J/bbC1?=
 =?us-ascii?Q?p2D1a6ofJbqgAJueRoEP/L0KiVN//IzgdMEoQzdpTiD+BvIjhnpPtjXqQiEg?=
 =?us-ascii?Q?HTNGJwaflbnRW5HUJEL8TZeS0cYUfdoJ0XxIgVldxBmBmYdFoQ9+HoUTBKu2?=
 =?us-ascii?Q?V85If6LlzIa7OETiUEG4qRwnXWCrnBMGEemWpenPJDD75bX6nLK0svaogH7y?=
 =?us-ascii?Q?Erbs0RUxS5KoPb/uzGZZVHH8k3ezEOCdwEiy2rLgk26ocdbzr/HjZS0NdRyu?=
 =?us-ascii?Q?w1jqTYyH/8SLQEhsHpwI28o8wKaER/kb/du9UdHCiA2BCVPaiKvxdiOihElC?=
 =?us-ascii?Q?hxyZutlV08vLyrSgCvn3d2BZXHCOSr4wW6KAh0Sy/dV8sKi8Wv1c1WhS73eM?=
 =?us-ascii?Q?nfg4QzEqZIA1KVrwY0fLCaKCerqQNkT4yohoQYsA2M5bzpbzml6w3Q395P+d?=
 =?us-ascii?Q?SPJUdz2hkgSDe5wAFGWYsiwCkxg6gOv1mpqgSKbpYRMG618a94B8UfOFwDc3?=
 =?us-ascii?Q?215m8+Al255BPvauQWJ8jdDrgwtRoxgNUdVoKMTB4tOdLxRZ3zRFdlWgOJI9?=
 =?us-ascii?Q?dDtAU5dharf3g6pUV2F/0T5dGE6mcWcxIS5Mm6LjEzjxNSi54AJUYug8+Kmm?=
 =?us-ascii?Q?aKUZdfHgjo9/J6Da3ATAwratWAZ9kAJLRmBAa+/OjFcY+A3lY29YerrguCqk?=
 =?us-ascii?Q?Rh2vYHeMXUvX+pPyHvl8RFKEFwKkyCFmX/9FKtUAAe3lFuX6xNjHNQyoU6Qi?=
 =?us-ascii?Q?tiDytYpR3/SPddgflzz1JllzhgP69k2VkiBi1GcbyzJYJSC3uwJjqCX/M36u?=
 =?us-ascii?Q?8wbC58kZYpVtXajEeToIJuQlyh6ta1Kz47zNgsbQf54fadVYKODC5FSv25+x?=
 =?us-ascii?Q?NrX+SEeBFGgmI2GJ0IXX2aBxrAT4DnFTFdekyU01qJN88lDOWFUmGnwADVRx?=
 =?us-ascii?Q?ZMH6WCCsw4LhWKnbhI5s6FrHy7ouOjAXQF23aYevAujJmoCHzZe44WGH7vHP?=
 =?us-ascii?Q?OCnPhn/eDgbq5Al+4BaeLGVXVmwFlW9brpJm6gny6dPNuE6KNKh+CqqOiylx?=
 =?us-ascii?Q?wysvQhGdRtMzDzE8yAofgWw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WzB4MfUNsFFxG9/n8EHAQqpVlzRAINy8Lm+dmq5QuphlXulR7Mvcbpn/L13w?=
 =?us-ascii?Q?L17pTpmLTq7TurfOMIZ47NBlU7sWsoz77q40mz2XvYLrR7I7iUsPToX152ay?=
 =?us-ascii?Q?hSJaw4lBLCIx0w6cZBetQ9JvQzgXjoGtPrOTwkI5vgjoiyNqqntUadCFY83Q?=
 =?us-ascii?Q?FTYjelF6JZSgCnHJMo5eU02QvOOd5a2ZFkb99DT+KkdeI/WdmevNBoU2L8mS?=
 =?us-ascii?Q?jo2NkQQBzMjrKq1kS4cHkJK8HITePUFzrdcjCDRnfPMEBG22VpsuCGExH+iL?=
 =?us-ascii?Q?q6lt9jU7fB1rlpPFKI4/lPDrFYrktdv57wkXXEugzbyZbUlYxc1ia6oHCKx3?=
 =?us-ascii?Q?TjVTmhUAWS7pzTROOY2T1GfCabNqfmFNnUcEGIgrS/gvNeqBEJ+Nf6UholCS?=
 =?us-ascii?Q?IlTqbWT2H5XgqTGV7XMRxxAdopgpncnLx2mZkVk3YqXiYPuFstlGPJdI465v?=
 =?us-ascii?Q?Nd6l7GIMrwfezjyzahUIIl5HR8dfgMU8D9CPPSKAsnLFDXYsbul0o7J4PwLV?=
 =?us-ascii?Q?geReRw63bKb4DEqGZARdgNOUXetP4bpmVkPJpa6BH4+WzRDe20Z3Kok7S5y4?=
 =?us-ascii?Q?9QI9xCOIRG3EK31M1oG/ZgWhyYxPFpngzeGm8IRZm+wuxRLhWyAJAWQ3Sr/Z?=
 =?us-ascii?Q?x5ZpQWek7/hnAAhe9x09aTNWX4F7R6lpV0UOfupUMHybvPGIm4+XU9nmtgCr?=
 =?us-ascii?Q?XojsRSVMx2JO+dCu9C9VsDXFHLxaPdUjmEjW43JoINySRdsEQkf7LjVqoArZ?=
 =?us-ascii?Q?E5qkDD1BLtfgIEanm6HlTTa6K3vrQi02u+lYJyRy1mDeYEorTwKd6s55xIDW?=
 =?us-ascii?Q?XhxGkgX/AnusZYcO1i+zYRaBZaBQp2ffYnF83pSxDthfqxqeSChU5W3H6a9m?=
 =?us-ascii?Q?MBWwpOXu+gR4TrVMu4qwPJRr2Cd4ukaGRg61zURa0zgtXPQvCIjSz+zwxdTo?=
 =?us-ascii?Q?T/OZm1VwX431Qi47nDos02KV/cOFEcuKpdHKzMIKZ9NJW3Tf0p4Oi8u2YHI8?=
 =?us-ascii?Q?8Zp4zuuMYXe+yHd5Ai20dFRbiyari7qXYP2rum1Dzt3i4c/22ywU+2iQVA3t?=
 =?us-ascii?Q?4t8N/iL+8eVCvW9vPc5si2cvldAZp9uqjVRtMgBtkBdQ98YR4pTWECKnPu6t?=
 =?us-ascii?Q?lpW1KyG4WAhHcRPLFC1jtG69PORKEEJGF9Q8rH0eCZ5/eWevGsdg1K4RpTxO?=
 =?us-ascii?Q?PmlPa+a8uZZzFtp5iH/Oj7nS/thUZyfqsqW1inCtnjhV2PaQra5Bd+sUJflp?=
 =?us-ascii?Q?NyX1fq38fnURf+XQjaoQYgSAZbwFnQbPoATYEvuMVGZNa5hF3x137rrSJo1S?=
 =?us-ascii?Q?Gch6W32kFBGGaAD8SXlLp4pxHxjR7dtdPKsWDPdKVU5uQ0YmX5v+v8ikTxcT?=
 =?us-ascii?Q?2vGhLlmSrW0/nPa8TTGPlJe2b8Evk7wEZV40L8yvb4NQtob8t9xNqda+GsnH?=
 =?us-ascii?Q?/yd5OS6OevwkWANj9zA91LO0NqcpFE1FCn/2TZgi11t7z+BK8+eUh+FvIr2+?=
 =?us-ascii?Q?WfUZaXQszezDoTFSo0fpsDPrV+aRDiDUFRvbUVrvgbVQ7xn2lec025HXfdBM?=
 =?us-ascii?Q?PaStJDf2mhjc2N5tRvuGp1fhoyMpcHDjh+uboirQBxotWLUrGzXEnZPscwKo?=
 =?us-ascii?Q?p833jTNBOUYKHyuBPm7YG5OkBdkexLwucbodUS3XdT82FZRZtDnNi/m5Hd//?=
 =?us-ascii?Q?+FghqBUmCsUZeroEVsa4VUgnFiO0aFVQqwKMjvUrnvvT1qmffBc2w78lxtOL?=
 =?us-ascii?Q?6akVwCmCTwQi5SRj5rt9wpPbnkfZugA=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 212c53b8-7274-41cd-2bef-08de54f7dc50
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 12:07:46.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfuXwU6oVOCsHAaMewmXsLjNQ4YUOHIQBttzSfZELEc6wBEEztkOrhHaUu8VzuG52FutKQlDhc6FRZhEQDG/ZizUsiQBKDqPe3p5fbpP2JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 12:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229546

Hi

When some task uses mktemp(1) or similar functionality (e.g. the
python tempfile module) to create a temporary file or dir, those end up
being created in the global /tmp directory. That's obviously not ideal,
as those might be left behind in case of an unclean shutdown or if the
script is not properly written, and won't be cleaned by do_clean or
RM_WORK. Also, /tmp is often a tmpfs instance, while some tasks might
want to create rather large temporary files.

Most such utilities/interfaces respect the TMPDIR environment variable,
if set. However, since that name is used by bitbake for a rather central
concept, one cannot simply 'export TMPDIR', as one doesn't want that
top-level build dir polluted by random build files, and it still
wouldn't be removed by do_clean or RM_WORK. Ideally, all tasks would
have a TMPDIR _environment_ variable set to something below ${WORKDIR},
maybe even something unique per task (say ${T}/${taskname}.d). But
there's no simple way to do that that doesn't conflict with bitbake's
use of the TMPDIR name.

Can we do anything about this?

(1) Do nothing, live with this limitation.

(2) Special-case TMPDIR, so that all tasks are created with a proper
value of TMPDIR in the environment, not derived from the bitbake
variable of the same name. Could be settable with some new TASK_TMPDIR
or do_foo[tmpdir] flag. Somewhat hacky, though.

(3) Bite the bullet and plan for renaming TMPDIR -> BBTMPDIR, so that
the TMPDIR name becomes available for use with its standard POSIX
meaning. Obviously a huge thing to do, but hopefully most direct TMPDIR
references are in core or bitbake and used for deriving other standard
variables.

Something like meta-oe's references to ${TMPDIR}/hosttools could/should
just be replaced by ${HOSTTOOLS_DIR}. Grepping around, there are also a
few places that reference ${TMPDIR}/work-shared, and core could expose a
name for that location as well that other meta-layers could use, again
isolating them from an eventual TMPDIR->BBTMPDIR rename.

(4) ??

Rasmus


