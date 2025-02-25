Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D756C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 05:33:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.101])
 by mx.groups.io with SMTP id smtpd.web11.1828.1740461632711071409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 21:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Ca1I/CEc;
 spf=pass (domain: navimatix.de, ip: 40.107.241.101, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s05zI8cHVj/1HoIY1qHKXuU0KPEBzRbQ7Nzlw/OqeAtUS5iJfrSdhfmfJ9s0AkG9zhXEFtMOmScJz67Mgom5W1duvfBmR+Tq4uno5Ce5Ox4mBENtwjh8S5arIVZpAAyzEa5QHkSdUQKIOwSpnyzbTZZeV0kyMwiRPi5MWndFQw8C1IrC0SemGsFCP9iXFH6wUfzHzw6ivA0jQOy982OoYQNpBN0sqRlBsCU/VoM2dtEbUJcKO/CxxDHwnJJ13hgQ6UxdBneuhij9fUnzgk0OEmMUlTj0kHZT8gyho/gBSolfajd6zEUuaKmj7tbK/dP/JTOtmqqjhZyEmWpG2JYIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQEl1lJISyVg+hPo0qSZOyNTSyN75sAcNmcjqAwDEjQ=;
 b=HP55AkavlFCzhl518y3h5dtNnPfKyvEimvWpRYfEpMuQO8hSZPnOjtTrJ9RlXgVkyCEUqsCy2nrCI5nTCGws0KGjVuKLDH7q7hZoYCa1vKMkfYDDoIshGjxTHRZBNf850xq0oXlrOAqfexseH9t2cmMTLjZiarxY2u1Vyji8YtQoyqaMq2ozp0jDKfy9DtoiJ7Z1LMx5UIUwZiVn9Ru089RkCN0AzNIkp3a99KGfPXA4jibMuLPYFRm4VzzKJKGtyWrGit35IgsHArA4bVgoJ7uL5aRfcj4vbO1UJ57vRRgFKeie8OJqTFPp6W1hp8Tiy5CSRvOqZ0Gky/emeZJfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQEl1lJISyVg+hPo0qSZOyNTSyN75sAcNmcjqAwDEjQ=;
 b=Ca1I/CEcsHjyxON3HiopG1q7zoZWSl1AlONUIIWoDqWw0SO1wPKQlYPsd8IZmZ/8rybGkvnIYDr6J/qFukj+m9qllL5xGWPMZyd38jjdsUULSQ+kR8UBybPBHasaLLnEWwsdjETnDmXZzYXZVO8X9cfjQKDDKJdae+JZHL6iHX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB10450.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:14d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 05:33:47 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:33:46 +0000
Date: Tue, 25 Feb 2025 06:33:43 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Changqing Li <changqing.li@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
Message-ID: <lpacml4bz6ntzee4s2iqixjlomyfvcmxein2c7orblqrbf5fyb@eb7rqqjoa6dr>
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
X-ClientProxiedBy: BE1P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: fa429ee7-5fe7-4ad3-a3f4-08dd555df92f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BDhqu9ZY2M2o6Icf/FZrKaK4fyaZzeppD9Lp3V5H113FK4IjgDiUpsZSz5A9?=
 =?us-ascii?Q?FfXpJvaxyq66tiRIG9hz4vqDLPsZXUSR3Z/yrUNpzi29H0hsiUNyDs1gOuCN?=
 =?us-ascii?Q?amlPqD3wzWnR2BlDVX5BWg5m8nH/giE+xRnpY3tfg6WWMpu6QsFRx9QxkDgJ?=
 =?us-ascii?Q?e8fgOGKmgxyviiotR0qX1xmwIr6B7hL60KWuGh7AsrhEcFOoAziHV7O7x2rY?=
 =?us-ascii?Q?+VoT0i1cSUJ92WA1wpjaNerMLt0kmYLrl9LQpfPSAQ0RgSUmIuMs2c5cVm9e?=
 =?us-ascii?Q?vFbdHjRORQJzrY+HhcNApVcgGwuCAVGNSfDMlzFQRlK2MDEhBRKeYvcmNI7O?=
 =?us-ascii?Q?lSgYtqHhgUAyn/VPniNvjvkznm/soxrW1lkGKKtvuY/vvzUvs9ioKzYkYpqk?=
 =?us-ascii?Q?LBiYG9zHRiaQcRyklpZyuhEZW0eW1iMattciVFrKyNHRvqchTJqUnMFhMtIp?=
 =?us-ascii?Q?BXYuyWOdVQVMwrqch+fS+ZrPFqFej+WfxYUL/1wnzTAkeZFiqZINTM//PWen?=
 =?us-ascii?Q?4JMbLtH1OX7MVwZqdCsCE1OsQARUB9UtUmdl7dAkGdZCaK4zHy/hZpEi66JA?=
 =?us-ascii?Q?OiMlm4/aTnJOds+yif5eguU6JI5c0eVVouD+hbQXSidAPYk1MMx/jcWcC6Dr?=
 =?us-ascii?Q?iVCvioaiqAItfHFrxeTslFWxUJXDrRNC9U8sIQxjd8uLB2b6ueAQF6qHxjPc?=
 =?us-ascii?Q?pdHj2tyWSEcN4rVK5FpnAccmhNoMVPhVnchlILeAIDcDlbyPHMUQ+Rcaw+7X?=
 =?us-ascii?Q?mFAdp7BpU3iy9E3aWnA+RjDat+nbBuqyOJVccZa+YKQb5RWArND9Ey8ew0JC?=
 =?us-ascii?Q?3ERStc5VbuHZg2JKDHJq9urFCjtRgzVinfXbj4r9b9e19X9/jc6t2S/LYBnc?=
 =?us-ascii?Q?nHfryFDP61dJcpBqfn2OElgdK4Je9OPhG7MkUvpn5u+KBf/lEu9Ly0RQKO/g?=
 =?us-ascii?Q?9j1I24j4ycrHRmF1Io5qxacM6asSaM4i1IK3qZcpbmn5mLZkBBiWP0ClJUax?=
 =?us-ascii?Q?R6+CaRbFFexJTv532w79iLZwAWzNn6saexK3xsbR8qO58Wi+vG7Y60jz+g7F?=
 =?us-ascii?Q?1iNlgSns0ZUiqoZFKAdoEnupQyLk3nitjFjI3xXtFIYTZl8noql+5yy0C4bl?=
 =?us-ascii?Q?gUwWeqWdjzfLW+eeKfdheViBUGMhx5IRgpis0EJcCFBc9yO2AdmkcqD0E3U+?=
 =?us-ascii?Q?OOxF+dSw5KhP8Q16UFUgcvUe+eNzDyknXS1ZMFFq0gzIrSLwniOjyTrG6zsC?=
 =?us-ascii?Q?uGeYc3zZ87Pga3pYQAraw9xysgDdxYdu+6mzd6dwpbuxowBem3oBBRpsIx9P?=
 =?us-ascii?Q?Kg+KLtIVYl97AUJyOjJBnD8F?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Va9rg89OkvtDBqnOkg2kIfMOfLJiNhiz/5vMt54/FSXlhFSqhvgaBO5QgYYe?=
 =?us-ascii?Q?M33VfiFS+ZjGm9HG5xvuTzn5hk0obmUJYSgK3cVaGndtyv6Q+5QqsOxadIk7?=
 =?us-ascii?Q?BEqIWmepaIBBG5iEkJaFFCxSsL1552jOPFNpI9gv7hUKcjMc/fWJUyJMHa/t?=
 =?us-ascii?Q?cZMLYpuke6YfGV0V8c/C04uk6kiAg5Z5kee2ox2CIEvBKGeO4fE2I/Il6LG/?=
 =?us-ascii?Q?RqqCkiGWbfpiQVcDSSlvYS8MkJdlNinOy/EwopAbt/CBHzoQ9M2ICUrDr/wx?=
 =?us-ascii?Q?Pm4JDMH8Pmxcpc3E4GIApbggBkNCZx17Z8C+4H5mz1mHQ84ng8wIVAIBo0/8?=
 =?us-ascii?Q?mnlS46kKRhLps6kE42UCJWFbiTDOhhSoiYsJnPfOqPjiX5DHdf/IbrER/38R?=
 =?us-ascii?Q?7DqvKR94AZcwxrOdcxdVXoJV+wITxVuOgtgcO+2cGmd6Gw60NkuPZbu8Kx/r?=
 =?us-ascii?Q?c7CzyBBXNye951v0hqdP/DPmTGozUwJsalVrZzm2HYVNJkMU6tWBo4xchSEg?=
 =?us-ascii?Q?+C/f9Up00DiClklkWm5/03OmhiZ19g9uvA3bAtGZe8ajDHF4sVxBXItLFDRj?=
 =?us-ascii?Q?wjlLcs3UMRJdKbUFELrImFcsGXN5GjbvKhK6sp7dXUX8MFnH/lxHwiddbCfU?=
 =?us-ascii?Q?h7zv19INrvTW8QVA+qsKy4GUlYvVNxuC2wSJc2OYnLF7+UOgL39GE09o9rAu?=
 =?us-ascii?Q?BFLZobHPHgJqyjBIBccQ8alPNruPW9SVA8b+haR0s0mCOx0Zj8R71WlLubPW?=
 =?us-ascii?Q?PTzyq+XKFBLvI+MtVgz4ZaxTBcTiblPE50AkbApsf+bpavO+Wsi2sxNW9B+C?=
 =?us-ascii?Q?rGOvrhM6ZSZy4xby71uXCnCcUy9sx8jYgwXg8wFSwxpisbXU5p4iuhWfHI3q?=
 =?us-ascii?Q?/GF8B1mfu/aauDfV6uMUMBbvVULKSkh59NICaVeiytXfLp0wMzIVdgduQPtC?=
 =?us-ascii?Q?Owt2bOiVYCYA/AaXNTuI33MG001wI6Z5sVODcCQaBeG4m5uPyzt9y976ch7W?=
 =?us-ascii?Q?schGIPzTQ65tc6VIPS2GzmnwFLptFah52/PFLwZxMqTLs4KHu5BZIAS327lY?=
 =?us-ascii?Q?ZtHajxoOwWmNXGcZ6T8YVSp0MyMOqxM7ProBGg3/k7SpnwNGI3UVVxYqOu0Y?=
 =?us-ascii?Q?+w0XnA8k06G3P7DukmjY3ti4aM9RlvZWaKrkJxaKMclRmQxZ9MqnzLzXMAt6?=
 =?us-ascii?Q?vHG/1p4y5BfS+/ssDXniJdyLloUmV2S8FkBgadwaxXX6Fs9J7GjPLQCw1sEC?=
 =?us-ascii?Q?Vuw/44vAOmzulHKG5jK0+tYTLBYAJN18Z8vVVo6F4ytQH1+iQpFLy4h5M7aC?=
 =?us-ascii?Q?9VNgVvUhqGS7XWOUlyp5Y9TluEqYeLgXs7ieibi3DXCLOo7NDFHktGB5uwZC?=
 =?us-ascii?Q?vwMb5IJIlxLm1h7otdmLdnoxUERQh+IS/djjmfZPxi3vCbM7rpxLzInfThgk?=
 =?us-ascii?Q?C61F6dVHkjQr5Oy74Wy5uQ5N4wzhtN23GEeCAywAj1N6iXkXnhWHUay0zAY8?=
 =?us-ascii?Q?ZeyNwJOLpFiIDwr0ptNMSJfnF9PrY0kBzfEU1aD1XTd8mhwilay1qykYqmEe?=
 =?us-ascii?Q?rgKPE3HVLYz/fgbXhPxMjnLswzasVEWAl5++RSrS1smWDCVIK+20aL8xvB0R?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa429ee7-5fe7-4ad3-a3f4-08dd555df92f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:33:46.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2xRcJRQb1Sy/ZWlqVMevYv2gIxnJaf76RxfBTIp7yRdfz7RQ+JDKd5L1M7st0qyjnycH9sHuARxpbWDs3PRemVY0peV6+CHjJFf5fJ6qTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 05:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211863

Changqing Li schrieb am Di 25. Feb, 10:02 (+0800):
> On 2/25/25 07:36, J=F6rg Sommer wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+=
0800):
> > > The reverted commit causes regression when ldconfig not in
> > > DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
> > > ctypes.util.find_library(name) can find the lib if it is installed,
> > Hello Changqing Li,
> >=20
> > Did I understand correctly that gtk+3 was found before, indent of ldcon=
fig
> > was in der DISTRO_FEATURES? But after the change, if fails.
> >=20
> > Where is libgdk installed? In /usr/lib or somewhere else?

> libgtk is under /usr/lib. See:
>=20
> root@qemux86-64:~# ldconfig -p | grep gtk-3
>=20
> libgtk-3.so.0 (libc6,x86-64) =3D> /usr/lib/libgtk-3.so.0

Interesting. I expected a subdirectory of lib.

> root@qemux86-64:~# python3
>=20
> >>> from ctypes.util import find_library
> >>> find_library('gtk-3')
>=20
> =A0'libgtk-3.so.0'

Thanks. That is a nice test case.

> For the case that ldconfig is NOT in DISTRO_FEATURES, gtk+3 can be found.
> After commit "python3-ctypes: depend on ldconfig only if distro-feature s=
et"
> is merged,
>=20
> ldconfig is not installed, so ctypes.util.find_library cannot found gtk+3=
.

Yes, this was the contradiction: Even through you removed ldconfig from
DISTRO_FEATURES, it got pulled in. I could not remove ldconfig (even throug=
h
our system with python works fine without it).


Kind regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

