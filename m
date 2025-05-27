Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64FC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 17:35:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.web11.1546.1748367325870680023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 10:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=nwtdr9Jq;
 spf=pass (domain: oss.nxp.com, ip: 52.101.72.2, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6RjelnlrMXLHAsI+GcQx7s30z1nQHR8+E3qwQHbyka9vkZG+IDGgDAPvhf18mm5XYR3MiKot8SsW4t5ZNBrJfx6jx+wkNjvg8uqdluq+QSfLNfVNvP0ew0KDzMblKYAJarTqwuIeLP0VGCuSOq7AdpX/iQYlxKs37g7OaiVR69fXn1bYvNHjRgPtBiIB4DKm+/Jck1CjfVZiupUtPUk6IxhJ7I5FuJs6j1Z7JoQQdoXfH+5HRBTalQcd3VIQbhii9f0c9NUF2vSOy93a3DmOjSL7me1p2uyeTgPaot9oos/oWh8pS/+HJLLiJQhHfTuuYATi7xS5sN/atjUZtidXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5icsRtYXZrEzfYYdPpxEF5MupqBjArlWC+Q7tIHUVZU=;
 b=coZ3kEdDegMJPzDJa9hbtdAGfvTwAPdtuzjSXMiDeViVqK8pts2903p+03oZZkJRtMOtmzVQsnjRvHVkA6ChI/sKtJdQjfrpFU1LuXRvF/rHmDNjBYNKv//EqUnZ78yo6CcTPecbZz2fGDKJrdhYwefmFCuL4BtMX7Xb+OWFpVliXO5N2Gz04Vo/tdVB/nqmfwtJv3PvLkbXL4FuPLHgo/kC5riQNd9UtyqtcQesjoY75l7REHr3mFijfrI5t12xC+X73B0kTnIKSXoGEfDG0+o5tTqPw9CQk5j+9OIr1B8IFGWF7Ar3Cc34vY48CHZcCDnKdvplZGsBU78zLqfqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5icsRtYXZrEzfYYdPpxEF5MupqBjArlWC+Q7tIHUVZU=;
 b=nwtdr9JqHWNy1pj1Pi3BSbIUYg39LNU3c+jkP8Lyr6wvrbzUQRB6oFKNfHXKWwi6c5m1UAIVRbrKxq0ZzLDSu7xG7XWTUH7x+9b916y4e1B3UcBgj/v7tU1QtrVZ5y06SoWuZEJ6KLAxh/89RYANRLlXbQtu8TNEVtcRD16LfFXgbPA3KMYiQnvDrj9N9l5rdSy5MEuKBkiKmidRHX9LVW4sihdG9QpmU6xGRsdjZGD+Rh1ab43Rx/O8ybrwNK51a++dqnmecTwQyy9swlCxs7PA+fse83MPwUg22UqfkcNoZJYMSjCHIUOdfwFL5hDd3ckDT2nefRq66mH/giQiVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GV1PR04MB10456.eurprd04.prod.outlook.com (2603:10a6:150:1cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 17:35:22 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 17:35:22 +0000
Message-ID: <5019da94-791c-459a-87e5-3f94422bb079@oss.nxp.com>
Date: Tue, 27 May 2025 12:34:39 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: SDK magic file issue
CC: neenareddy.busireddy@nxp.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH7PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:510:323::27) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GV1PR04MB10456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3444e51e-c7c7-4b15-3bb5-08dd9d44db0b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R5nwSGICLakZFEQhxxnYgyQr0Spcnk5rhnOiFh3w1sNxBsVLLhU+8EcV+AAQ?=
 =?us-ascii?Q?AVGiXlgfmwclC6jyYA0iKe4Zs/LB6EvGyBmbMI215GAVENazyalIh/7/DZa2?=
 =?us-ascii?Q?WgDCL3diYZMmKl8lzK9Z6DX/otF8zDOrmmiYS3FjOUOJ8XYqdJc8C5iCnWQO?=
 =?us-ascii?Q?a8jqRKrrkdDrFHz22h/2mKwU8C2lttit+xSxPGLbbZ3oeu9Ahw7RYznRcZ+c?=
 =?us-ascii?Q?d6lg2MyzSnLWHlNP7FIQhn9q9xJhCblg7PH+CU9MGO6RCEOpKdnWI/8ySf7N?=
 =?us-ascii?Q?0Rz5Y5X99eBv1M8IoW8rHfaPbxkYraMozia1tQ8DVUlgSU4k6NHPi+FWMrrC?=
 =?us-ascii?Q?GQmAztr3gkrHTlRaFkNVbUvKJGHNVxG/HlgHozXjRwU7CBMgxi0hyp9CgJ6u?=
 =?us-ascii?Q?ZrzjB9TD1GsfCn1i8Fdeb1N+IsxVbboizKKR+xEgnCE54wtGr5m1EcK7b+x5?=
 =?us-ascii?Q?G2k+xcWHS0pMX1/+jVEMyHxaEKtOFDfleYLg9G+U49JTuHpcu5Co1ryUpVJ/?=
 =?us-ascii?Q?fmfo4dPRtgH8xWVv08FBhD0eouoVo7rShVlfB+nvFVmdGcOkTRM8/cfBLgUC?=
 =?us-ascii?Q?oEYqWwp+WBv2KH19P+aRmSNoFKfuQDB8AihUJDO5FYFJHom5+PXxIuy5zIYG?=
 =?us-ascii?Q?MXAdrio9eD95kdtCN3PzVnlJjoVxFe0iMu5A0HTtdmfqUf3RDHRT4Llnp+xS?=
 =?us-ascii?Q?hfc52VZmWM/ZL5xRnvHYVoIUDW8ZSHi2hh1T+pnFeYfztBnwk35SCdVPk9D3?=
 =?us-ascii?Q?hu2LW8gcV/5gYzCA7gf4pswaKbxL/P07uODXGyTdeqW4YPA1hDpDZxCkYNtP?=
 =?us-ascii?Q?n0F4KMT+qTyG9MlMVZ1W4tIU/ksqbtl9dLL381wg18BcE0EGzF/TspZBqcZg?=
 =?us-ascii?Q?E1USfnaM1Lvo5zuNQnsKP6JyvopPEPRJ03ryU1SluyBUbKxV6Z7UgHfexCLu?=
 =?us-ascii?Q?9YP1ud1FlqtI6/XckJMnStXAQMjHHkF5BJBQ4eLO3KkziBFGnex/cliw0cgs?=
 =?us-ascii?Q?gPMZYqAG/hIDUy3FJBdD3/LO9qIN1+8mXUQXtOuzwf527qhJ2UDqDTuK7d6E?=
 =?us-ascii?Q?/HycxXmSMWyp38DUM0w0PXGd7Xk3OK3Cv1kZra9vFTQjVAIQCj1RaDLRyU2D?=
 =?us-ascii?Q?inelICwV30jTAe1ai5rUKpWd5NAdlc0BQv+xBUOUjI68Jf4ncYT2VFcIQbUE?=
 =?us-ascii?Q?xj+aIfkYZ3vyQmAn9NMr94cMnv3k8Efz4TTtF21lhx2naNWbDurPVWIPHGTK?=
 =?us-ascii?Q?snnz2ojFHECkNooPXdqnSdeK2LqjzbfdU7DF5fbG7gXQAu3LMZ9Y+A+/GXkd?=
 =?us-ascii?Q?V5fTtSKU8tApzY1f96DPxUqqCXvckLzbIXNOwiao7FRCtkCrZVQX2FOkr4bY?=
 =?us-ascii?Q?Y4mf3nE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o9HlorqPwCbfc5A9DK0ksM4j3ZTkAsYI26esnS27VKR5aA6fRxsnkQEX6ORD?=
 =?us-ascii?Q?Qzn4KitPJ5CRMeTdtBvEmoyPUXb7TZ/fkhIm2PR51/MLP4O771oNQ/N7+7Zv?=
 =?us-ascii?Q?f8WsUz4Ek6R//uNmmclrIEs7VhBdmRwaLfJRH2THtaMIz4WtRajkgKbNnSY7?=
 =?us-ascii?Q?1J/fan8iUNBvwqzzt3QaGJsTdNVUP98QOcblBSd19qfYiAEL1afdGlwJa61A?=
 =?us-ascii?Q?8ZEqA0F37JynRtHWRu3+0w6/AblKIPBczH13jldz1ZmL+wvgRDET56vjl5bp?=
 =?us-ascii?Q?mY8jTdmEEorTxmk+/H6N+zqQkRxVXGMuZ5oyiJCdxeZUWF73yqcXjrjfempV?=
 =?us-ascii?Q?5wiOrCQzU6PYzioHzF0lq3vUBnRh74C5hHwMWmwdXcH3CyQw41agDpNpWJe2?=
 =?us-ascii?Q?APbBHR08COFBpq3v91G0flftt50Y9FXAy3PBqwFAmPDmcwMOC1GfFJjOBF1E?=
 =?us-ascii?Q?nJQCBkkJSWzbZqevj/O2A+OxRKDQIzQjr7RhRfLXmxplN9YG5ILGZqL7Pqsl?=
 =?us-ascii?Q?jjsmy63/0ibsNF6AQYIr/+nLjyLrYHL7l1+2RNuUM+mwyl11w6scIQ+iqBT9?=
 =?us-ascii?Q?xHS81nlQ5WPbpmUdKtsg/BtWvNRbXJ/nXkr+R6UZzR0RYKZmhDZNKmp7K7dZ?=
 =?us-ascii?Q?8+7Nuabec7KxLC0faW4fw83549ZejhYjmbfpICnkTywCaQBLfStVVGpJMVU3?=
 =?us-ascii?Q?f+FxTauBHYAyBrtZ/72P2ZXLUYzrOoiiZw3mIyZZVyF1n43erFn4/MLfMIIX?=
 =?us-ascii?Q?+rnA1gmue8Eglbg6ghpGJw1ybeiRz/wkbWkF2pXQkpuv7l83naSJzgyJxeIR?=
 =?us-ascii?Q?WEhRnhH8lOMh5iauXg2KLBynTau/ZmJzLhg2h+f5QN3N8l8oU/Pk7sL870CL?=
 =?us-ascii?Q?AV9GOUHki9+y9l4um9HHZ5OCTqBUrNPu/fiEa9roUL4dkreI7JwhENie/bSl?=
 =?us-ascii?Q?zjIwk2yDxbHkk2fezyisBu59I0KmH85RiGaxpS+qU7AgbDYCYZaU9G0jkoqu?=
 =?us-ascii?Q?+nE1IricptHcuCAUX1WWFNN3yFf4i80qDqgfof2OPP8rs7QU4HqjeQ/U4dG1?=
 =?us-ascii?Q?9brVUQDRyt2wAaLSyNGT3jQFvz8sHX9hEOKeRYMYlg4b/CskBcjkujXbyH/T?=
 =?us-ascii?Q?GW9Wfys+agXanyenw4kOE3YtZSBS2vrmP5tAVMmPa5DeQenW75l169kRnYsR?=
 =?us-ascii?Q?+17sQ5ONQahuCzN42dvUXBuXUO8lvgqfaG+tRlTZeHRVQGkh3Gi4xpSknxMx?=
 =?us-ascii?Q?LA9WYlhp1cLzuLbLinrjl1OiS8kAhRMmVvj+3vUilHn5Hl9FyOJ8aE3gqwcY?=
 =?us-ascii?Q?l4HH+2+c1a5GTR0oqg080gEJlEm6M3xIqeIDqsMuo6K6bBbcixIE5bw+DZpr?=
 =?us-ascii?Q?frFKGaOvwoWLac5K0cC+ij79gSWP6rX3N9wG/Z3DVUbeFm/umFwFAIFr29Pk?=
 =?us-ascii?Q?QiD4bV7RGFW13ueGPVAF4SnnsRJZJMJPQawm+Vj8krCRIvO2UEstv4Tbl4If?=
 =?us-ascii?Q?Jreys6j8NQjhB3ZxdHV3Ig+oHJXxWNoLM9cvRBuG6IGNgykjHxK4UpfF1n7Z?=
 =?us-ascii?Q?ckuUkpG4GPEuqY2CKifpi5323OM0qflOYS8xTiO+wMRTSMfKglDSLoP25OfW?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3444e51e-c7c7-4b15-3bb5-08dd9d44db0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:35:21.9856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjNVYwPXwGV+ZskxZcUHL2puzhbIX2nDjeIvMY0jNbbvrUijvX+oKNTKnC2qbcAK4HYmryTUGVYViDUnS4r/Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 17:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217318

Hi All,

We're having an issue doing an SDK build based on Walnascar. The log is
filled with thousands of magic file warnings like the following:

```
Building libteec.so
   CC      src/tee_client_api.c
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
1: Warning: offset `=1C=04=1E=EF=BF=BD=13' invalid
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
2: Warning: offset `Version=3D' invalid
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
3: Warning: offset `http://www.difstream.com' invalid
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
7: Warning: offset `=11' invalid
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
8: Warning: offset `Firmware v' invalid
     %<--- S N I P ---%<
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
4765: Warning: offset `' invalid
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linux=
/usr/share/misc/magic.mgc,=20
4766: Warning: offset `' invalid
file: File 5.45 supports only version 18 magic files.=20
`/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-linu=
x/usr/share/misc/magic.mgc'=20
is version 19 (No such file or directory)
```

This seems to show the root of the problem is the build is using the
file program 5.45 from the build machine, which does not match the 5.46
magic file specified by the SDK. Indeed, we've worked around the problem
by downgrading the file recipe to 5.45.

So, why is the build using the file program from the build machine? I
tested the basics and can see that sourcing the SDK setup script does
make the SDK file program the selected one.

This is not easy to debug since I don't know where the file command
invocation comes from. Perhaps 'strace' will help?

I'm hoping someone might have an idea to help narrow this down. Thanks
in advance.

Tom


