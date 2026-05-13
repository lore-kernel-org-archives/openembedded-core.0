Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F7CCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:41:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.114])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4577.1778668912236674220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kontron.de header.s=selector1 header.b=J2E+BA7f;
 spf=pass (domain: kontron.de, ip: 40.107.162.114, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTXKZTGObtWSXDMRsC/n/rhAVbrGZz4DImMsM53vUWohSD1DMWZkVoE+IsgHtFbYUfeb5oyO46NHV8Dg+Cu3Nj5qu5WcwEEJpXLzT2uuvKhWSTRPyUXnS4wX/8a2v+8mmSWOwvudJy/iwTRvqTAAhFVpva4AsXa1bmbvSoZpQD53nHwWgFCPG5KYg9tyvULYAyqOTJmuqI6TPAuiM8hbTC6YCIXnrHu8eXBEqJHFsIZfxEJcm8KYMCxJbwwCgNtz0S2JbRGyhepxslF/rqABHImWZvqydq26tE2Q7ZB6G32Q1+L1u0IopgsdTVo6f14jhjP4DyCze9vWchzWhnyPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOjfHUBACedqp+jIfzRWWsUSCrq3ZWMuCYavU9rOz+c=;
 b=dhKN32F9kZ5oAfOeedo4du90KjUEhkj6rZNzDoCSMgmyjMCRCmZfx9n5DvWbOZvokwwoYabTi6bkQOta/yY6UyIBKhtC5IotxHk1xn2JHDZ8GpODDY0G60HSc50RC15w7lrhVFMLWZAEpYPjPPL2Y3F/a9GjCQoWLBdNjaLBwhLnQ1VbVv8PzjFa8EvwBUuyH1X3f+zdm2uHWx88WGMo8djzAIT2wZi5C56kR0fnYVILVQ9fKX90F5QOXoPYS76xVPer967uwSrbHntc31uXyPayW88TpT6S6oDLzBR0b5XmWPRSQi7CRFfgAZCgJLki3BjmFpXM4dNA5GSH8xrDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOjfHUBACedqp+jIfzRWWsUSCrq3ZWMuCYavU9rOz+c=;
 b=J2E+BA7fXATyhWbNEpCfA7o4cjZF50OR/DB/xiB77NMLx0ahCde3lKikwBt4crwjhUqfyvq0E0rqCndFL+xJ+6s24uir13w136/2aV9ctT+lCvr+I1TAlqCNX7w92SnqX03rNLQdiIc1JQ9QSKnXJUWdHJGRc1MeRarnLWNg8H2isDFnFKK5Ve0L6aye4gPkLZwm7JNr1pHOq2F7bU0dlyy6XrHXy5epEOSVynkg+TlcykmZkn+ehA2xBCSyxUi1QWIliw94tRuX7nnZB/8yII5v4iWCHgHuSRCY6LHnqdQHMVsb/NR/bARwnrIbyO7UEXJlcK4tdQsVT24L47+YlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GVXPR10MB9163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 10:41:45 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 10:41:45 +0000
Message-ID: <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
Date: Wed, 13 May 2026 12:41:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] devtool: prevent 'devtool modify -n' from
 corrupting kernel Git repos
To: Yoann Congal <yoann.congal@smile.fr>
CC: yocto@pengutronix.de, ejo@pengutronix.de,
 openembedded-core@lists.openembedded.org
References: <20260323232008.3456362-1-ejo@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260323232008.3456362-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GVXPR10MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 780318fb-7912-46be-5c29-08deb0dc3a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	+LG+dFHIL4DYVt4LWLH31N+0a3uh9wnWlCNgofEV358ypGYBoWE0A9WCFEWBBt8J94GBo1guWJJM/uEohOtoNyOMymXdvjNLs3ng5J1l3UJ1nh5nQr7GX+FzHRXXFTlB5TuL4ZGjG4Xm8TFUjq9vf7N1ihR4lgOYWJfjRlHwiiR8ShTep7neEvaIwNhpAoVhvrNv/iQ6/apB2T7COlV/7h0frYojRO4Ol632C/VbpYjlWwgdykkUAKVx3dG/bMqSNto4Z1oPnUzZoARtNe0nTPprRHsan9SIr837gSrFpTp1gkX6a+dQdLXtKVdCg1LAqlymbiSbH9q2m3M9Os1GclhXaKYijqCdvwhjpj/+Fk9McAZL9zmEC8y0pj9M0vqMZUp6LLesWy1f3V8jXIbFiR8zq+IDej/ewpux6ybcZpujUOJWl+qnlyIsGcng4Cgt5CPaUJ2FJKbPAkhzAHUsM4QpQoakyO8App2IBdp7GQbcuMXn1j53uhtQvHt6bPhOE7e+DlG7lUANBWBnWF0XgjzgMGtMq3wFh4N7Z5hyzhGAM8SVr4rzgIkUoH1b1MnB2GiNYyjPxqYOUor61NMcrhwz524jXrQazQatIOag+psLiHS7EOFCoQ1UVo+koZrJDS4EkCKk2Tum8o5abVYDWFG7sT3L8oukES/r+vlV1ps0ExI1DkXRubmYVrBD2nFR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UlX3TGGT/FZsdzWmSPHVamWzP9YBMLsGpqcFSkL1y8zD9QeumJG8vqahW6Pg?=
 =?us-ascii?Q?tbpBY5iq6B3Jw8iDQxdAiXihswy3MoBvBtw2CAIAP+BdHWjAIBH2q6ZzRDpy?=
 =?us-ascii?Q?GwcIGRChDi/czNmPv6ALZkhYlY7r62F8mGIipnZ32q4DfADFhS6nZBIhBpZa?=
 =?us-ascii?Q?iFZQtlw/SMK//naa+4D7qozdzuJfEcjosx6JMo8VvJspH0Ou8RicnHbUtHI9?=
 =?us-ascii?Q?1karYCW/M6okLBx+6+H9egOlEW3NfdfWsEaVdztSMtxYCobHrC3d/xd9SGI4?=
 =?us-ascii?Q?0WZE2bFZUGNV2wmdXrUGsPNTzc3/rk2boDaXaRyjsioG9pJfO2gs+4S0m/PN?=
 =?us-ascii?Q?yno/B3AI1z4xDz0qbiMx5otT2A0UsvUnQbnDAv0l6b1XkXSPWlplhmPFZyrT?=
 =?us-ascii?Q?ECg/m+PSKyXA8JLrHQjvaZUFtOU4vGgY6AeBpLw50zosnUG1bZUFEDiG8J/G?=
 =?us-ascii?Q?03flMBr3Nb9XlxZ36CiYY9RfjV5CIv8eEA8BqObqfnwb1F9IjELwqTqy2Jws?=
 =?us-ascii?Q?ZiSof7QM8wJ3xshgmKsO8Oe5lnFsKsGDJ4wuOyRvpL0xpkXt5/C2Iw9NtQzZ?=
 =?us-ascii?Q?/WZX5ZO+z4qhJ5o2ZhhRd60Ilx6gIIlcn3+MLWFzVOMs2N9bTBbGiHLBVP3V?=
 =?us-ascii?Q?KZyfo5OlN2fST5UJcXhcq3n3mv0WgGWn1qhQUlKzydOPYrZ6NGJFiZyFJBjq?=
 =?us-ascii?Q?CClRBTDJvv+UO40gKGtNbb33g7BV51b1pXoV/f26COyZhXSk2B4ipEubPGTD?=
 =?us-ascii?Q?EbQGUnLQz6JdpO1J2bECYROkNsoUi07/NnyUE1VSkzcwYtY9KNzyJDfhRqph?=
 =?us-ascii?Q?G4w8GqByV1HEfgiDTZ4XoBiMvtYO6ashi71Dz6m1J5UNQ8VT2w3TVu8f6mvt?=
 =?us-ascii?Q?QY5w9Gq5ndqB5yI7dDSBcKCBgT22GajW066ydCd9MoEJlOeUcVQoOOtLOt+K?=
 =?us-ascii?Q?3e/R4DVz5iCx+4FOI+RtO3mupjiJWvHRtaGiV7l+vaNmNjex7Y0JBDxK9ak8?=
 =?us-ascii?Q?pTea8q/au4xVQjlbqbGZ3KZFKCFqyRpt/1AyiBdWRXwbbGvRn8DOiW6SpPVD?=
 =?us-ascii?Q?7p8yMELIeh12JvkOnezHffV9DbZk4+IIyprr3fWg2uU0+wCuVApTeUdjlryl?=
 =?us-ascii?Q?atkhe52CzUNhqbg+dKx+gHNts/yN5D3tyXEygNjkPXBEuCcbdzFdElXpZLAW?=
 =?us-ascii?Q?Dxzbq/FsIDBnt2WARTeWfGnpOMNsrMGaz+sUe5YjpaM/eQlzbzBfynlCGYfq?=
 =?us-ascii?Q?llux+y0dSoPWsGcxSat4bCq3nnuh9/2JSzAz+2Wf/AsBdNp17Mn9dIOSk4K8?=
 =?us-ascii?Q?hBJ97SeM9ceeCXd70stvDUsHZBccuAd6l1lIswmQQzrO9lN8q4UR++Ml3oIh?=
 =?us-ascii?Q?QQv7g9pw+a1CUxgvtkwzd792+1OAJmDUbeQzOlliU+tSocEWFMUkY5zwhwjS?=
 =?us-ascii?Q?CoR7Yyjt2xIG613sPz1RRWK8oQ4sMEesKcdS+FB75lrRit1BGr3MS8c/EnS9?=
 =?us-ascii?Q?Isdb81rXTfCHZZS/Rkbpp1jEfxoEDmBtzeiAcEikRrJ7m91mN+Ys+Bd0ZroA?=
 =?us-ascii?Q?q4I9vzRYWAoFbYPENG6B56Nmu81+WJwuylUKYP1przt97JAnlFoZprlfQPqk?=
 =?us-ascii?Q?7GkhfkOSRdidJYGlmydU1HFept5/pKn3hgxPA6USvvz7BL3ySsOHGPP+nXmK?=
 =?us-ascii?Q?vRDPNZNcLKGs7+9QPtjsWELoO4gslVKTxDlxMPU5KQfPxLTRZtv+yu2ITaES?=
 =?us-ascii?Q?fAxL+0s0j7B15Q3wfC5cduiqddmxYZA=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 780318fb-7912-46be-5c29-08deb0dc3a35
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:41:45.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFJjP86EGuMFvne2DGRPZADBlf6PJo6ro1NhEyDqedZEKaXBczizQ8rFcdzGurMwZBhCbVS/4nopiX8ZuIOpt2NWqkVygYB+DnZAZ0blzAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 10:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236960

Hi Yoann,

On 24.03.26 00:19, Enrico J=C3=B6rns via lists.openembedded.org wrote:
> Running 'devtool modify -n' on a kernel recipe that inherits
> 'kernel-yocto' can unintentionally corrupt an existing Git repo or
> worktree.
>=20
> The work-shared optimization introduced in 3c3a9bae ("devtool/standard.py=
:
> Update devtool modify to copy source from work-shared if its already
> downloaded") is not skipped when '--no-extract' ('args.no_extract') is se=
t.
>=20
> As a result, for kernel builds where STAGING_KERNEL_DIR was already
> populated when running 'devtool modify -n', the existing source tree is
> overwritten (via oe.path.copyhardlinktree()) with the contents of
> STAGING_KERNEL_DIR.
>=20
> Fix by adding 'and not args.no_extract' to the kernel-yocto guard
> condition.
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>

Can you please pick this devtool fix from the following upstream commit
to stable branches scarthgap and kirkstone?

d383ea37e4 ("devtool: prevent 'devtool modify -n' from corrupting kernel
Git repos")

Thanks and best regards!
Frieder

