Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734CFC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 17:18:58 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.119])
 by mx.groups.io with SMTP id smtpd.web11.1217.1751649531343068910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 10:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=QQdHT4uQ;
 spf=pass (domain: navimatix.de, ip: 52.101.65.119, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzsBYfomIgnNEZHCUA3nMx1Lwyn5I3zbkb/mMax3H6iJXnImhEK9j2Fpty+XymO7Vqc1mJzx6EyVHIn9FHadNj3IN+G39Z4OpuqwOzRxliqNnTJoE6bLAVW4WnUQUU0rOPSYIXzwvSzm34G0TcNrHNKqeLTwoS3ikgE5jQxeE7COh+nRJDB2cwzA+flLPLGeaGaaZ/2ijohM9X+87DmN/DsPU9GTE9JXK3PAWuxzYDXIiHFEZQqbmCeOPfgNzcESAsuQ7ezT7Qs1PHSJb5krzZhFDNJTJ/0R5FwtP9yDskqqEpyok4U4KVLA9LsPJfclwSA+HSqnQX8zpyfawYct+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgf/YSt+oZ0fMKLCdY3R7KFlEjdj6TA5fwCAjcLSsVs=;
 b=boBau2e18KKvQ3KSm62U9BdHgX1N5vv/Numu8I1+l42iPWRTXo3LScdtmLDzDsqKVSMXZau1z6F7SXJWWiJDW6XrimOx8+W66wpWdEqGeHTZ5xnflaUoOlGhPckdpgpho7wlLvlTyrV72Sknw31g2UAgKaaiXXZRWKJy8KdEzd3Uu+P5xouOmvMteaCPOWRkj/JbatjK93GdG7dpsRnaD8fUX74yJ5M2BAW3jH680c+bnOfYU9ctAXIdGBfFcum5O7F0HwhQCh9e95Dg+d3sqF3DnVfWHQioObd1tLlHEqDmo0uHhmynu6XXiX0tIKQbs2q8VAUEFy+KKOFby3Sf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgf/YSt+oZ0fMKLCdY3R7KFlEjdj6TA5fwCAjcLSsVs=;
 b=QQdHT4uQtx3h6LWVD4gZWay0N7yL1GPeTueelWJrn54HDmBrbQNIz7TA9REUZrYP8mFzA3IqDRwl2zXaUgjGc7E29VXG26LHpab2BV5kv9NZH76IXT1tU7Xl7LlrVE1IM4EhJGZ0cgA2OybHG5KxoFA7puWGCEQlAUoCqveb/44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18) by DU0PR01MB9047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 17:18:47 +0000
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07]) by PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 17:18:47 +0000
Date: Fri, 4 Jul 2025 19:18:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com
Subject: Re: [kirkstone][PATCH] classes: Move package RDEPENDS processing out
 of debian.bbclass
Message-ID: <svuo7jc42bsg7uf5c2xwerb4zto6sgfdu6ecfwajfltn5sjaow@njyiye2vfbln>
References: <4f53825c14f9940ea8d379dcd35a5ae02bcb92e2.1751631411.git.joerg.sommer@navimatix.de>
 <6f97d5b509d2d2319ad93f46658b3f0ea93288ec.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="v6m6ik2rvnmjvui2"
Content-Disposition: inline
In-Reply-To: <6f97d5b509d2d2319ad93f46658b3f0ea93288ec.camel@linuxfoundation.org>
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7726:EE_|DU0PR01MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 002879ae-fcf1-4fff-ca82-08ddbb1ed5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?rl8XV4zSQgKD4PHzXT/Xlm0BMQYRjzuJSF8z2hvSZCrWh0Ysb3BWFZvMTQ?=
 =?iso-8859-1?Q?JUdO5dhyJ+PB6CAl39zly+ZYJHjOBbg8wjubcje4iPSwxp+PBXrWNKmMCt?=
 =?iso-8859-1?Q?Jk7xBkZZHd1f83Lr0tRi6Zf9BbzlS6IJklvKMvSeybHe2uSQbCmQOg/bxS?=
 =?iso-8859-1?Q?Z6p2hxf/acWvUQZT5R7mYslTz9omxKAZrzY0f5DznUu37fyusbJKOzXk4A?=
 =?iso-8859-1?Q?qNaJUeqNYlF2nBB74VuK8mj1XFBId+UAE/GYE/67CElmSDA+JCXsYsTZPb?=
 =?iso-8859-1?Q?cnMVJvjxBxlzGpybJ0RqicA5+y6x3+TAi0FDn8q5Jk8Vf8YvdRQyyPGqhX?=
 =?iso-8859-1?Q?XoOmsPNJJ/TZGdjTb9lfF+xpNJa1KCm4tX8AH5aN0/irmrfnCKilL07h4f?=
 =?iso-8859-1?Q?uCMChdLfjHy/leas9j62CD/7lyvd+he1XyqSK6OVqBZ8ZdGWhYJQx0lYzR?=
 =?iso-8859-1?Q?v7dma7RxxitnnNybvvIhWpFySps2cP4J4Pbbv5U29ji+IlGc5e+YGEhwU+?=
 =?iso-8859-1?Q?T4gYzeHIgG5A3dO6ViaeH4ofYtRsgHC6ywrK27GQxOFRPsrZ+ISixSvc9z?=
 =?iso-8859-1?Q?KPhUF7oPIrMfR1e0ACYsrR+lexOLVOd99ZedIRz0KXD2cY6fP0cxxbRQL7?=
 =?iso-8859-1?Q?BCJ8HLcdm8616UIL7r8H4EYPI1ytJjEVJk0iLEQi4vF25KfgveGYhQY27n?=
 =?iso-8859-1?Q?xCeQsdyAamB5rad1ZT6GYrzCwgrGbxTcLOridFxc0FlDGz306/g7rLX9XF?=
 =?iso-8859-1?Q?VG0JlvNaPo/1X5Zwfjh1BDOypug9JN0BP4ZVurAjqzPfzaWD9drwV3kDYw?=
 =?iso-8859-1?Q?kG7EciOmtqSWgszopG33g0kyNh+2kU7KFKcjGtIBo7JrHK7/KShwiHyteq?=
 =?iso-8859-1?Q?rqC926RbMlqE2HkI1o+OZBKUDxu+9Z/X8EG1Fvlu2iJ/3yUiWUoj0kCmRS?=
 =?iso-8859-1?Q?jHF5zQLhhQ6YLObjspCB6AK+VfLqU47rXpu8SPuEBaeuoiXcGL5nOD0R6F?=
 =?iso-8859-1?Q?45/dmAmJE3gN24dwGS6sLa/m3xXTMSMhDUOn7YKGi0CkmO2y3++eo38cHE?=
 =?iso-8859-1?Q?YGMQvVSaUwk8ExoWkOVZLFTZ7BFR9O5HMYz+8YXTu+afsi4Bl0SjFw/WYU?=
 =?iso-8859-1?Q?CvRq/nYzaZjuK1r1T4GD4TmPz7cWo4rzId2MA/tRTzV/UZ06odgff90mfi?=
 =?iso-8859-1?Q?vLyat+DvdQqx1qzBc3GXxHlDOx6zuj/hZ+xa5sq9S6FUS6VVgh9SecHWiy?=
 =?iso-8859-1?Q?M109uprUQ8MZZVLOa1bh0uWIoVKZPJA1SWcvoxnq8hEABE0uDCUZTC6TpI?=
 =?iso-8859-1?Q?XIVHHtjttYlNxOkxL3mnKELl5A7NsUGKR4YjqhKdLHb351HoT5mCa2jF0w?=
 =?iso-8859-1?Q?ZqeVN9Q+QjHvQs66SgAU37QNXcrq1BQZ8shLp5C4m1X9XKSORQmRo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7726.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?BhhsYABGYWwsJsqujicXuhmu/9dqRnzD8FVGH78ZrQZAqfAmRro+hU1Crw?=
 =?iso-8859-1?Q?IwnjjfsAG8NZGRolA8ETcSvD6X3gx96MJHG/RkmIJNfmynZ5a4t3qkE3WD?=
 =?iso-8859-1?Q?NY9VFDWbr954d2ZK3yGv1J6Z6uJ5P2zurrNeCYcFZhh1O7OWOtH4cunobG?=
 =?iso-8859-1?Q?c2EDy4waCDMQivhXW2ebq8A3FFxW/J8CqNO52TKOXmlDPm4yzDx+F77fCx?=
 =?iso-8859-1?Q?t01sbfRXmF3KtxsLdK77auohVjiNinXApjt6gafcHwLjaDAo4Xgzinhbns?=
 =?iso-8859-1?Q?DwiBgK2+p0Nn1CmfXOHg9a5gHUjOA4SM2+CN/WMs9i0gc3skqo04JqNtCX?=
 =?iso-8859-1?Q?zULu63XbU2p8PJkR1B6lUuKqJRwZTlnAtv/mRRFV37XzpnDnG0GwWeV//n?=
 =?iso-8859-1?Q?jLabQl+L51paZhrz4zyNjH+uHEYq45wEjCs1jWbAIkoE06ptWiFOOaQT8P?=
 =?iso-8859-1?Q?bSMKDbqvaPCvR2oW7XqpP7Buu8ctXnXSrf3Dugyi0zuAhuoS4lCI4K2yry?=
 =?iso-8859-1?Q?AGsZQP0q7E4OfEK9kdu2M70KgdOjSIZCuOsXheIK9mk78hKkGhGkQuxfjM?=
 =?iso-8859-1?Q?70oQIJgU1A2SnZRe97gACv/oArXoWvbUVdKMiy0xaFVzV4vyagRpWC9Xi8?=
 =?iso-8859-1?Q?/IQ32zIufHBgia49Iw7tSsaIr9CroG3ZHnKejPYhUdEQsp6/mJyvJpC+mC?=
 =?iso-8859-1?Q?rTkTmw0Ng9ZbD9Io6wxHmqWQxD6P38w89dVM+r8hFvoTtgfIVePsc6cEKd?=
 =?iso-8859-1?Q?UNwi4Rn81p0AJq5LmH0HD9EYoazODDkVdTvu4Dbj5ikORKa7a5JfAEejyt?=
 =?iso-8859-1?Q?bqM03cgBxCFEP/WKmzC2BByaeHl5z0LY2ngHwrxttucQllyXe0d8/XW9MD?=
 =?iso-8859-1?Q?vFqf8Qz2IzXvHOuRRMTcJCqKH9DGACbMhIXxWE3S7vLBHs7pNqww2O2Bur?=
 =?iso-8859-1?Q?/e7HYcEcvCuTcKR8HOhX68PeuoURvDy0CW6IKr38vlqpFtzn6vFuG6SHb/?=
 =?iso-8859-1?Q?YQq0voIqacR+uI+o0h7VPdT67EwuTHRrtb7g9xzw7ScrxwGw8DtNYL4sef?=
 =?iso-8859-1?Q?JpNotE9e+rRj0/hW174JhIrMPdjdUOHvx2youAXNFi+eGk7xac7fZJMVOw?=
 =?iso-8859-1?Q?H1S9BeuxDSYaINuGSEIhpAbqUI1YbLYrYb9u5RULn+7uhN1b7ykNnJlBem?=
 =?iso-8859-1?Q?vzcjfOvwpYygHTiGPlgK2Jv73Yb3DH/5v+kQRTjuVsLVpOZaTV8KAf4PfW?=
 =?iso-8859-1?Q?7htQXJK6q5hGGUPzA+q7r1wN80HgFx8R/rNwrRWFN/UUcD/C1BQrxrruYD?=
 =?iso-8859-1?Q?Eeufto6+2Wr4S3a83k2ldf1Vkly1lG2M6VdjxeIeY9LH72gxY6OTZme5aJ?=
 =?iso-8859-1?Q?NDa4yaWaJav8L1F7uqCRq3nDTfpfIf6T1ojAZcO0mrN1ccfUoI1NO7IJuE?=
 =?iso-8859-1?Q?UPhuYPAvxpraNehLchDIr4JvdNER+S3bfqaD4D1YthQqB6YRbFSc5/G2LW?=
 =?iso-8859-1?Q?tO3KjILKrPyjNIYCRNSZ4ddgw/RNPAZ7kXDQ60v7pGvfqaED+MdGWvw0gY?=
 =?iso-8859-1?Q?y3P44yXaTy/xZ2AoWuEIi0oNKQ3UAjHVpmHCJpdacWLTTON39KMqEqFNzo?=
 =?iso-8859-1?Q?0oN4TdvvVXhe4FTWRMKFcOPbPDkUIyHABB10iiUQk0xVbMvy2NuWG3iA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 002879ae-fcf1-4fff-ca82-08ddbb1ed5fa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7726.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 17:18:47.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mdDNrcvlxP84Z07flLORN1cm209ayLmIrRYUXiZtfbpZP9VHg3WokQTa3mAoyP0lAGm2lM+4C8nZpRQ1fuQtZoRDXPzdx1zbK5p9bylqPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 17:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219950

--v6m6ik2rvnmjvui2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [kirkstone][PATCH] classes: Move package RDEPENDS processing out
 of debian.bbclass
MIME-Version: 1.0

Richard Purdie schrieb am Fr 04. Jul, 14:38 (+0100):
> On Fri, 2025-07-04 at 14:16 +0200, J=F6rg Sommer wrote:
> > From: Sergei Zhmylev <s.zhmylev@yadro.com>
> >=20
> > INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
> > establishes dependencies between package management tasks and build
> > process. Debian class also unconditionally renames several packages in a
> > Debian way. In order to allow disabling of such renaming rules, the log=
ic
> > of RDEPENDS handling is moved to a package.bbclass.
> > This commit also solves the SDK building issue without debian.bbclass.
> >=20
> > (From OE-Core rev: 8313a4201cde39c444aa6fbe82e46a767fc31f6b)
> >=20
> > Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 251a5c88f6bcf347d637b39b8a86e8a083774986)
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > =A0meta/classes/debian.bbclass=A0 | 18 +++---------------
> > =A0meta/classes/package.bbclass | 21 ++++++++++++++++++++-
> > =A02 files changed, 23 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
> > index 8367be9f37..ade0e6dd8c 100644
> > --- a/meta/classes/debian.bbclass
> > +++ b/meta/classes/debian.bbclass
> > @@ -8,26 +8,14 @@
> > =A0#
> > =A0# Better expressed as ensure all RDEPENDS package before we package
> > =A0# This means we can't have circular RDEPENDS/RRECOMMENDS
> > +#
> > +# Logic of processing dependencies moved to a package.bbclass to
> > +# allow removing inheritance on debian.bbclass
> > =A0
> > =A0AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
> > =A0
> > =A0inherit package
> > =A0
> > -DEBIANRDEP =3D "do_packagedata"
> > -do_package_write_ipk[deptask] =3D "${DEBIANRDEP}"
> > -do_package_write_deb[deptask] =3D "${DEBIANRDEP}"
> > -do_package_write_tar[deptask] =3D "${DEBIANRDEP}"
> > -do_package_write_rpm[deptask] =3D "${DEBIANRDEP}"
> > -do_package_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
> > -do_package_write_deb[rdeptask] =3D "${DEBIANRDEP}"
> > -do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
> > -do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
> > -
> > -python () {
> > -=A0=A0=A0 if not d.getVar("PACKAGES"):
> > -=A0=A0=A0=A0=A0=A0=A0 d.setVar("DEBIANRDEP", "")
> > -}
> > -
> > =A0python debian_package_name_hook () {
> > =A0=A0=A0=A0 import glob, copy, stat, errno, re, pathlib, subprocess
> > =A0
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index e6ba79346c..5cc3c779c0 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -54,7 +54,6 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_=
values(d, 'PACKAGE_ARCHS')}"
> > =A0# dwarfsrcfiles is used to determine the list of debug source files
> > =A0PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
> > =A0
> > -
> > =A0# If your postinstall can execute at rootfs creation time rather tha=
n on
> > =A0# target but depends on a native/cross tool in order to execute, you=
 need to
> > =A0# list that tool in PACKAGE_WRITE_DEPS. Target package dependencies =
belong
> > @@ -2547,6 +2546,26 @@ python do_packagedata_setscene () {
> > =A0}
> > =A0addtask do_packagedata_setscene
> > =A0
> > +# This part ensures all the runtime packages built by the time
> > +# dynamic renaming occures, if any.
> > +# This part moved here from debian.bbclass (see for reference) in
> > +# order to allow disabling default inheritance on debian package renam=
ing.
> > +
> > +PKGRDEP =3D "do_packagedata"
> > +do_package_write_ipk[deptask] =3D "${PKGRDEP}"
> > +do_package_write_deb[deptask] =3D "${PKGRDEP}"
> > +do_package_write_tar[deptask] =3D "${PKGRDEP}"
> > +do_package_write_rpm[deptask] =3D "${PKGRDEP}"
> > +do_package_write_ipk[rdeptask] =3D "${PKGRDEP}"
> > +do_package_write_deb[rdeptask] =3D "${PKGRDEP}"
> > +do_package_write_tar[rdeptask] =3D "${PKGRDEP}"
> > +do_package_write_rpm[rdeptask] =3D "${PKGRDEP}"
> > +
> > +python () {
> > +=A0=A0=A0 if not d.getVar("PACKAGES"):
> > +=A0=A0=A0=A0=A0=A0=A0 d.setVar("PKGRDEP", "")
> > +}
> > +
> > =A0#
> > =A0# Helper functions for the package writing classes
> > =A0#
>=20
> This was followed quickly by:
>=20
> https://git.yoctoproject.org/poky/commit/?id=3Db177f377285746364354ab26d9=
5b9f2f09f08dcf
>=20
> which means this change wasn't well tested in isolation during developmen=
t.

Okay. I didn't saw this. A backport of this one would also be required.

> I'd guess you're trying to avoid debian.bbclass in kirkstone, I have to
> wonder why now though as if we were going to change behaviour like this
> in kirkstone, wouldn't we have done it long before now?

Yes, I'm trying to avoid the debian renaming, but dropping debian.bbclass
causes the SDK build to fail.

I can pick the relevant lines from this change into our project patches, but
I thought it might help someone else having the fixes in kirkstone. As far
as I've tried the master branch works fine without debian.bbclass.


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--v6m6ik2rvnmjvui2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUwNzA0MTcxODQ0WjAvBgkqhkiG9w0BCQQxIgQglAvvBSKf
8EJNn9gVYRjSnT17CzJJK/uzTyBdVnUZKnQwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAHPLdwvTWmR8
5Fl3zQXfudUbalyn/cPEBnKId4TH9sQeprcVOLePLNN7U88/GReOuahiGn9h3GRMngEIs8Mz
A7WHN5uLc7A9aAkRVhTlJTXDPQFf3y0CLyQzSA24aO2zLUv+t3QbEWzrlPoGbnAf89wjvbmm
O9X5WWXsL1ey2dvvSHlP8kpLhWSCJtYeuXLQBL2Q0pW15PUY+aEP7EiGdDPo2RK3VTOsCt0D
2kz1r26/XpgggVD4HUZHadXTX1pDw8BVT/yBd824smnouTiVT+a6xr3Mukh4i/IPfbcLrdWI
+IHTdkiwHWM6vGV/JIMOyunPxkajvTCNfaXI9hMdjk8=

--v6m6ik2rvnmjvui2--

