Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E6DC4707F
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.76])
 by mx.groups.io with SMTP id smtpd.web10.3541.1649833761987342526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 00:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=hLGZZgX3;
 spf=pass (domain: outlook.com, ip: 40.92.91.76,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc2e/mOJiNxC8FGMz4cADvRH1q/Z+EY6i6piPlaGyPCKOPG1wn+juZQfSDgEX3dc1gtHXBApkEtnPh/bSww5AT/hCW3WC/drpKhjpUpnfAcL/gUMheFFIk8cCRQv7Evcw5fDpCWxviPakh4VqqzFPfJmAtIcxs2F4ARgn9hpTfm2ywOzicPuwQfTokkpQHqjAzp7BXr2mYY8H7ojWypBi0cPyuEIuesWRzNedeX1LCASoKXIXyZ5HxdH7CqMo3OHZFkKI+IEu6CIY7bAttdpXEzvvpHZki3ntgZwL2xezkV5zqU0OXW47Yh6i+B3m4AmmOmRR6yETtf4BfnVjb0FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iWLtBkC4bzuA9CGF6RYtMQ9YljWi1W8gDrT/zXvI1s=;
 b=MQL4Cv0sFT0idU3EJTq5D3EYIOGV39GRnPAM9HZcrrnu8WEQb6N8nNKGcYoSQZ5YpctLLi160aYhynIw14JnfdiiT24O7Ef3p+2z3MRS6efmWgII9qssnIyx4Zq5avYOaCBL+kD1+rNhYghEzvyytzZfrfb2OxCMHnrJvlzxgq2MFD+3fhTNTGgALepCYPPWuKS4clDLc9d73QTYONmSmjSvjB9Wtzxl4E1QPKsj6aD4PNSI9g+W9dPrY+fc8Ou3YY4WdAmgnBclDNO6sMhyazH4G8M8MkMozySfebllLKvJodsmLQBQhiJ9B9ecpt/a/umvAxr106HhK+h90hvpwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iWLtBkC4bzuA9CGF6RYtMQ9YljWi1W8gDrT/zXvI1s=;
 b=hLGZZgX3BeV62f2X2zgLE2PqEC4CWEe73eQOLqlAy6FwKzNeklKIb1dJbYSl7Bd4HJvbRgTOclmd6RpZYAx9eF5tVjVXqGOU9p93NLVAKFOsM/AHiXjSIlrgUspxo0W5vfbj5BmuPgJoiMktMqAL01wnT4bEr7AErvkSn3ehLzUoBcWKTqH1H0W89SUX9Ud6wGyUtqmT76vzZ7EnLphthH4nHixUMjrNf5yIbQSJ4jh2asBUXbdPYrs0vmgj3fqVfImp3RAPwUAhp56rjuplsFBiHak3VFBOmR6lHyZBp2y2p72h1RdFYL153EB2BPJJRU7xgXy1/LHtafUbrGRFFg==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by PR3PR09MB4362.eurprd09.prod.outlook.com (2603:10a6:102:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:09:19 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 07:09:19 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] libcap: add pam_cap license
Date: Wed, 13 Apr 2022 09:08:51 +0200
Message-ID: 
 <HE1PR0902MB1801780F69FA94EF0C8B432CA8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [dfOXfsHOhyu/0cdN/pIxwVa+sWeBGbQ7ZLiZv6Cd2MDC5PLMHZCxyyhIarYhRMGl]
X-ClientProxiedBy: AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::33) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413070851.1189859-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f08d649-bd79-413c-ed40-08da1d1c86c2
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJM65arKHekxG7r5qUbEYC6fo3QfX0B6LyLwNyKP9cel3R982CoiswPF+OV7XGfX/otGJb4wljpstYJD3jS8S3yVhqvDZ71VH3vVjnxdwst0njIEkMrXRALPnb82GFOaQehPhQSSAePv5L2tEMh6aT3YzEIguXCSp7HgLrdKGKtctrQQbIS3oWemGelPYAY55Gb9KlNyKCmIR+O/97j70BIj0tTuh0myWdE+zXNl/OOkKHWR1Dd+fNxeNs8efyE8OuVpVVcqkePEXp8j5evHLljHSOmXmR0rVbYFPPip0+BJkg5XjIehy+MCF40+U+IQbkel8J5BD+Q/Scg7HgytBndcNo5sGigwwC0P8EWQwJq1/SZR75mCsZICZW52GB1F7riPBBHtoLsvdJB8JydRcAc7B1H/E+xMUl+VsZH5eQlQhmahOcpuvAKW5lIvrQxn26IDxJT2ZjM3jR8z8E58uCZrXFjJw58LHIXAD+4pGjDUS2qt0QADnX+NMCZDz/2c3Cy3HwCjMuo+PgtqFnOAJBv9ds3WywFAIY0Cv1CiooOgkLc3YXYEct7SmHjGx7K0nz3pfRJ2PYQds+oqeL0sBYUnOtFS/3HwJW3jDhAXDHGzk4wr82CAEjm26XrDM8Q+9528I0cdiZva3IJ4m+k2vbOqEXP1nOAi31WwWeS4oddPNT4CQEwL6zuQBbjBx4U/MWvBmdQzOqtw+bT7pbaNHq57z5C9VNAa1vcvXplmTlnoYQ==
X-MS-TrafficTypeDiagnostic: PR3PR09MB4362:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kWw/ioFFKjh6gVDNxHqAovuTWRxTD+u6X23gNE0iGMii1Y241FY0d/1o0WgxWmmvAbNI2Gfn/64kumtZBTDhLScynyxabIZKmwfGA8oR2dW/+A9xN1AywrxTYRG1Fl0dl1pjmxz+NX7tKtMlc/P84JiRBYk7pQ1QkW5Yt1DmzYIpOY/HPLnTCBHfYUDi6+/d5rfBYnS8+NXLkKWYIRPlhDE+52v2zAPYhv5pCpN0T7evKVsPiEHty9lRwDwcJaxKiQnO8PO9nzWfF+kN/W8/HOpPyMAyVmUV6xwl50rvbm9e1MiHrdRGqJv5EERk+eMg8w/gDKBqQQHwabrBW70pg9WFf92slKsf7c21OLyJ6W7FbtWEjg4OXw7wz5HxajSt0Dx5/MsQqUdtYMEKKxTKQkeQ/p3EtNIUcdSsxW9ZQmKiNY3NN4dncicgL1Y23ib0z9JUJaVRc3Q1DtVeg+sAepGDpFnB4puZFASsCIqZkF5VYYegTBE5fYLsAzvQ7YR9cWssfF11yCybscNweAKFKYy7psIGDy3xJxQIbIJGqW+ty89fxqtWVwDv7dA97Y3fxS5r8SaDXonnSvzashf+NF3qDW1Wr+D5/rkeOZVcqOneaQWzMc17lbsjJbbP8XYL
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PEVTCbRlJ3RZJtBT0h//6NA1+wd8bSJTKsVHOeqkjI5TcFdSPoOaahSyyoQy?=
 =?us-ascii?Q?IzNIJfOxz8SR+lxjEDvvyz2yDCMiFoOR04WposrAeC1HeWhZNT9Kmx6C1lIT?=
 =?us-ascii?Q?PJRCGi+/z1TCD+hQIurrYzACIMXjOg422LinR4YmJTCkrMbc+MHE9+KX5B7K?=
 =?us-ascii?Q?V3vyJZ57GLJgMX8yJzHDesyZAAfeNIF/EyT1a0xBXnuvkHPivUeN2uXTBLA+?=
 =?us-ascii?Q?tiRysEXgDNpKB41LRoPeKuRAnTVIPDUReofcDyg41Q5+8AkzP2UnqMiJ/CNS?=
 =?us-ascii?Q?79EtyRvB7MqOQvNA8TzezI2+X/gq/EE7lKB2IIqh0z7KIuMkal/18A54uzrH?=
 =?us-ascii?Q?b7ge/pODzX+DoN0Ns4IAurdzMyESpSzPOmUdf08GmNGDX4pj4vRKturkkKbx?=
 =?us-ascii?Q?4zL0RgLMju8/KiUYOepQQdVNXlFs31qclVYFkda7WKIHVASK7nI2BBLHQATZ?=
 =?us-ascii?Q?9A3d3u9/7c8jQ1zUI//oDZUBHXSPH2MRIzBw076dpNYavuE4E0qHT+lVksPd?=
 =?us-ascii?Q?V7Ab72n/yHo5Vija2HdAoX8cu0XcPIAbeMqXXOElbqao/5rIsXSePipI0Uax?=
 =?us-ascii?Q?mier40moph2kvNvFNUY1Do4JzeO5xACgB7i61VVQsgaSQBw5bGqDKynOZ1Lp?=
 =?us-ascii?Q?ec0WrE/vvGlmkeJNpfDru4gi5dRa8mcLg++forwOwVeWW1S1yCUK+eUHXsOe?=
 =?us-ascii?Q?UGOAnd4F8d5aaJvwK8ZvPnF0YOgPxcsgrHlbLRi33zcdUNzYzRDH0r4A/Rzb?=
 =?us-ascii?Q?H4xGnFwmOJfb9/Zssz1ZHKCnY6PsOac2e1vNgOd61yXnso0jlOQrUpCBwgtd?=
 =?us-ascii?Q?ATnUAVeRdigavTdLaLT4uU5IGuxMrnoTxmH3MrU9zEzhX6t0xlkp3R8ZRJPF?=
 =?us-ascii?Q?8Xq12lQAU2hB0nSRKX6DWMPrS0qAt/Uc4In5QJ72BlXc3dIq8UYzQgwciUn3?=
 =?us-ascii?Q?BdN55SuaWXvpHMwGuzYEMlIi2RtxX9FVzQ3t4sn6xTyG5aS8/CqT3EqyFJ6e?=
 =?us-ascii?Q?99iz9O45Y+B+jmHhX/I2uACs0j4Fay0hklrKbbAEp753phbiGCgtIHalwVhV?=
 =?us-ascii?Q?4PUAVtJoedJeo07SyQIkgJsYj6kZfkycVXdVWzpobxQvClpARiVn2CnMW/Y5?=
 =?us-ascii?Q?2j9UpKKfQpYKQPlKOUvePiGlpV+OoAvNCKH+NUZmO7pRUw+bdsYM/isyYYom?=
 =?us-ascii?Q?WWocuS9Z2H0nYuQVGKtLQbTcwlKxxfiBjNb3yztLk0zdJcKIphIlZu2AMZCk?=
 =?us-ascii?Q?mGsvpa4kZI3bNifyoa1uaVmVgaMJamVT3IWCOQA2/WDKrvgmgnIEdg9nE7b5?=
 =?us-ascii?Q?Ho2yoLVFw3YV11k7pUU0XXZPTVJOdVxmoNQjX/7E4RENMuD7swlH3a5KfqNX?=
 =?us-ascii?Q?JCxD2zmvAZuk18qHcLExAXHflkOoF2avpd0JqzCEc1KuzWwDGeWaB7IXUKkM?=
 =?us-ascii?Q?Jo3/y68sM+SdsYxUth4PCp6WiSHivY8fKdGxRBUTGe/wSoFlDQmMfgDrC9Im?=
 =?us-ascii?Q?wh2y2OYlO06Zkg4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f08d649-bd79-413c-ed40-08da1d1c86c2
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 07:09:18.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB4362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164304

If libcap is compiled with pam in PACKAGECONFIG
one additional license text becomes effective,
add that as a conditional

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2:
- use spaces instead of tabs
- simplify by using bb.utils.contains

 meta/recipes-support/libcap/libcap_2.63.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-supp=
ort/libcap/libcap_2.63.bb
index f3133f9ded..9e341c4bd0 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.63.bb
@@ -5,7 +5,11 @@ users, without giving them full root permissions."
 HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
 LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://License;md5=3De2370ba375efe9e1a095c26d37e483b=
8"
+LIC_FILES_CHKSUM_PAM =3D "file://pam_cap/License;md5=3D0ad4c9c052b9719ee4f=
ce1bfc7c7dee4"
+LIC_FILES_CHKSUM =3D "\
+    file://License;md5=3De2370ba375efe9e1a095c26d37e483b8 \
+    ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}'=
, '', d)} \
+"
=20
 DEPENDS =3D "hostperl-runtime-native gperf-native"
=20
--=20
2.25.1


