Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F377CDD550
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 17:00:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web10.20693.1726678850529329324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=YbeBmzzJ;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.105.44, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ek9NAGpBdGnjgApwPp6FKg6AdGoJjLL2IBlwi1g4Cku0jI6W7GSg03WMdt0pk49aMu5R5YB99szV09gQ+RxVxS0hpHtJaj34DemI3c5QBbEjldpEVdFv/9aj3Uj/DG3Cny5B7x5V3UVy/j90xn4ikGHP2zRFDLC55Qe5zuf/7xMMv+waevEyGRwM3raZUNoJjdaNBFoG0LBVnL8vtE8uO4CIBUjLzVt360/jEjPKmBf8JWL7xsBoEXu4GMBNbmArFa109L4JzAt1A/Ys3zQEI1OqpixxZnar9KU1bFE6XADph4o9rDxUnNqTYIvQrS3LOU3Yz4+YpAxNGY7yEybKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sw8DhYw1rpIRitWQ93RjK3fPGUxlIr2Oos03MQvd/Y=;
 b=eSNGGk+PxsCnoXFNKUKQTawOF8SGvZ3z8b2RlEUPuhonRnZsw0sSramMjReaUGT8NqPSe3iJjvFZFz0RlY9jUYe997F9eaxLTDLLcq9fljAi25YaiD2TlhAYKsG5A1jLg4Nk+osQ7VFB3MoYGtXjZpQYKdFPysSy9qhsMk2IZLvicEl7yzWHLvqxtj+aMGkbKE3SKcCjeX/DLVyfI2UKmUNUkX4q20DSK/VxD3AP43+mQMZ6tYivIUTqs2zvgJMWtbOPbvNwVwRpW7TNt2SvEoEviNtRf8B61VSX6H0xmXGSvn3EqhPLBQxofm+7Mei0jhbZWTngOoOBxmqPqAS3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sw8DhYw1rpIRitWQ93RjK3fPGUxlIr2Oos03MQvd/Y=;
 b=YbeBmzzJD5DyFS9YInXSvWn7lTkBZTwkIQoz5pMbrSxXZOBaF3jYLv384DdSKF9nd1GafI772HTir4xJ04+oKEhIdUrRGdpmS6p8h6WWLzzlDOWsl+w6FKClDuIOw4uQwlzs13Xth/QIMvF5pTAPHzY70sIU0LDG+USbLKDT0pJZWqqHAsNu2mIcP0olH4b7CcvT36iMm5AuiTzLkIaU2mHEZda7cC9zqpEXvOrgQJPPE2W0oY2DXRQq09yzUzJ6pxsd4uQESBictJHSpxWT3JU2yDsYUSyMrVULQRqUCJK2FELpIY0LFm0/AnFl1FT7zCREjAbAKDBRU2hlUDpdVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by PAXP193MB1278.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:156::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:00:45 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 17:00:45 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 1/3] buildhistory: Fix intermittent package file list creation
Date: Mon, 16 Sep 2024 08:16:18 +0100
Message-Id: <20240916071620.2831989-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::10) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|PAXP193MB1278:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f799aa7-5421-4a26-0795-08dcd8036fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PMFAMsJCly8pcA90+/U4stXxlQbg8x6ZmLB4GaGSg1/ByteldF3QUCPaOMni?=
 =?us-ascii?Q?21kN52KhKzqE7L4a65RGZaUhtdfoG8XGjsRLXsk4+zBT58ExQoV4uYlkUbIY?=
 =?us-ascii?Q?MUb2kht2v1JIBtSjNIRgcp64XCJg0ex3q4yOgZCFin4TzEhGfy6e4hKElW2r?=
 =?us-ascii?Q?hb+HjZGU5C4kikKeT4RLUZkopAnBgjyOHhoq9s6GAbyNlEz8B5DKsBs8gm2G?=
 =?us-ascii?Q?W7+CUSjPlmWyKxzeiiLtkfgc/oFVIa1F64ncQfL9+QGijjZYxW8El4OXktd2?=
 =?us-ascii?Q?LSxm6XihhffZkiqrf9Yi1j6yvwZ9DCbaPKtiFspVXlNpXPM2+MHEAFiy1sHF?=
 =?us-ascii?Q?WZAHf2Mw/weTQl1rHGIjLBzcRgC5cmQ9+7T8ZnQpPD2WvREowpf4t2hpcDyZ?=
 =?us-ascii?Q?temQrSKWkp+CiaTXtDD3Se42AtLY8KPZmfyw09Vkzg3d361dazALnu4RcVCC?=
 =?us-ascii?Q?oBFHTkmsKXyU1IQoK0MvTpHSHxZ0sUxj4y8L9AdPEIXldeF8TkV7Nb2HXbRb?=
 =?us-ascii?Q?230zc7j97i7aFMCFZm6WKlB7a7tBQ06ULVFBCn/cJqAAoIUdSPWatIK4TOBU?=
 =?us-ascii?Q?SRaxHLQr9g0Kc8Zh2fsFlVnWbRX01WfKFz5sM3oTtoIAxWsl0my7TRmefLc5?=
 =?us-ascii?Q?IGquu48YTMh7M+nlAy5kE9bsLV9o3OMEoTdiE1K68GX+3RxWi+N5BnjP+D6x?=
 =?us-ascii?Q?1YIYoEF1lHDIX2FSQ3guP7te5VC0k4wDnUiYNJpF0FIEB1cb4eehtdDMefz5?=
 =?us-ascii?Q?O8b8ax3wBcEJxVwVz1pkuDksokBtRFCjoCeB8J1uSflorC9ywhMyxYiBdUBT?=
 =?us-ascii?Q?QfN4b++a48Ac/1InAdzDiR72NBSyreXRM1XmDgvV2bsKUafCXpqE7tYR8h0A?=
 =?us-ascii?Q?66bbOo8My/pMAOJb2dhoKb2IIi4oZQsntmAqVYl+BrPbCm1V/m19fdLodniF?=
 =?us-ascii?Q?IHXaP4SHJZAm6xTCzE+WSZ5hT3TCai3b7MWct4EosV6dagwbFxDn45QH6uy6?=
 =?us-ascii?Q?w+PGwru9TlrMc+OfzBWcjQf5xpvjSsi8GoJc0yzJXkJuve3wGO7XuGMzvRYO?=
 =?us-ascii?Q?uZ2hWqdD+YX95kGE4/VRxF3Y5CNTKBrupKsI/3qDNtPuBoaKhcMB4uDeTRHg?=
 =?us-ascii?Q?1ho28BRazXiNkD4z7Z+iyFmfEHIyTQQ6gNM6nR2b8RdrChU6b/cfnh5j1H1M?=
 =?us-ascii?Q?EKVHCj/3BjAYpkM+G6DGPqc/biQO8LhrzJLqTOWGd83Q40cWbzqVChq2fXKW?=
 =?us-ascii?Q?InEI1x8i3gLokxGFlBFLw90OlYXpMEBB1wiGIZHGGV4LIP3RMOIeYhUYMpBk?=
 =?us-ascii?Q?MvV+rn6O6PROJttiXn3NWu3/dKdIiKlK1Ofxym7myHXry0uuNY8eWY0Cdzg8?=
 =?us-ascii?Q?8M2lPNIVok+eAfwdttODPNbmFVWLJvaEvWLERqni2Eb95kizuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vVO6k9nB0rea6oT+44U8V4pvB5mwQcEsEPB1ppfzQxyT9N8CSuDTcKZXHl0x?=
 =?us-ascii?Q?0r5zIti8oRwyZYEAnYb6sbLOx1ORWtKmrSntM79U3px5wvtZLiPIJxFf4CNd?=
 =?us-ascii?Q?/G1+L9gvk0FgWlyLKKOP8N4seRIg5ArLQ1FCbi65SXehJdW/aPV0PGLucOjn?=
 =?us-ascii?Q?2FU2mVryPxK+o1F+I9+0w6G1Hp5UnKEQ2IPXiidtXp2q1Um9yl5KAkFfrJ+E?=
 =?us-ascii?Q?Ja3cU18Tkg0W/C8RTYytQLbM6YHE2vi7vdTufBoVVqHlKdbZauemXDcQrcTM?=
 =?us-ascii?Q?L7mhjmBkxnnvP1cprJdf1azzqVaWZ1RecHMJi5b+CJZYkexCaJnRwTNc+urg?=
 =?us-ascii?Q?VzMwnuB33ip2Ddx0+SodxtOEBErh0kwrEBFP9j5kKL6ygncmUg74eUOZvAuf?=
 =?us-ascii?Q?i+P4SYNcmVdIfpnBWO6fAQc3y+ZC1dDO2S/a6BxBb1WpLxaqGcBCd8a2e61E?=
 =?us-ascii?Q?S9zMrx/hBG6CXwNYMxo2jTBso8dIhox7gn+modsdvrUKoe5q5kIOSBex6Ps5?=
 =?us-ascii?Q?honKZdEcULh1tQUxG/pkylhfd1rrs7LGKtFO0zFkZAka1b3unJW682fZrBfq?=
 =?us-ascii?Q?cHS1SsOhK71xYtx/E1Y0G+7vvTkrLDqyWG14zMUelwpPQK6fT3UwDzJu/Czd?=
 =?us-ascii?Q?EsNCbjiGmvX6s/PriiMIei0zMqNt0i0/wXa+7D0UxBi6xAIR/5scBYGZ4RVF?=
 =?us-ascii?Q?kE/7TkBu8nUfvhSli5wS2Fmshf4pO81ZDmSBwG6G9TbvIeAba4xRD9Ulb/8m?=
 =?us-ascii?Q?lKdjPq9yEIuna4nGYMqKPY4HiQ62fTOERVUPu/EAa8YqdL5VreUvXTOdNkzr?=
 =?us-ascii?Q?T51ckOALY1NCPJ/AfUkimBzJrEtLq4/zSP1zEOK1tlM8jEMYZIVqRpuZFOI2?=
 =?us-ascii?Q?wwDn78ZshwGe1VJU1rrQeap8GEG64Z5ZaVfPDsCi5KIso/3Hnfn8xq3/jHjk?=
 =?us-ascii?Q?g1xBSctlTQOL4KAHXFZ+AFHlQiqqCLvAAcOOFmuWtnl8uuCAO48A7J7Qf+uP?=
 =?us-ascii?Q?mgARPZRAhZMNSMUkjGOZX8XHc4rX1szBeGEo1UGurzDk+AFzQbXGoZydodSk?=
 =?us-ascii?Q?T/yJwMI7Moi3y/pFmN8Uv/d5WWIrF/D7fENhEwZ3GnbSftektp+5Cx2B+fvP?=
 =?us-ascii?Q?KOUJMtQcD0uJ+GMqG0RX6Pu5yNEQM84VPdO83j/JGVrrk0hMYs0sr4BvPiFl?=
 =?us-ascii?Q?fqEFPyWiEfYrLASCXD7deuukha2A4ejQgCZwTunWjKZvtVU+J8bUk/IEvufF?=
 =?us-ascii?Q?zSfRPWyk6jislyGetageJDkNEVX0NbyUkg15U/GiRbEOLK2LbxQ0LT5OvoiB?=
 =?us-ascii?Q?DMVtn6/qIaaWHctM91S68cbjchwNw+E05t7YrW6yug79mKlvDXMPXbeLlMdf?=
 =?us-ascii?Q?PFAmONV5ZW+fymHQAJUg2+2xCsFfw2Q1u20HV7Yz+3AHLp3mo99vornjIsSH?=
 =?us-ascii?Q?Bh4RJN7uwaSVtwXkls1WADSlE1txMU/APXiBK0I58HEGEriA/UslMIJysOS8?=
 =?us-ascii?Q?QmsHq7XrICWpPimeDx9wuBjXelGjsCM3Jy9wHqV/sSAc5UMUihYDGW018TZr?=
 =?us-ascii?Q?Dzv4Xg2J4W122lzchBzBHvi+PH4Q6/XuuimLGE3OgV/cpR0z2ZgZem4qxz9G?=
 =?us-ascii?Q?dBm8YLwlrRqIQCRhwB2xzo8=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f799aa7-5421-4a26-0795-08dcd8036fd0
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:00:45.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuL0kgfVhzlXYKJ94oXq1cp6IAqKYpu+MDudWh6wMzUSjZvTFQiKstaxNj6rK6Y1HG+yWEX5OlGz+oFFTr4OOptn5l/7PSBGE0S0QuX8SGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 17:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204652

The directory that buildhistory_list_pkg_files writes to during do_package
is created by do_packagedata so a clean buildhistory doesn't have
files-in-package written during the first build since packagedata happens
after do_package.

Ensure the output package folder is created to avoid missing
files-in-package.txt files.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hiding the error on the for loop.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks=
.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de9b8c1e199896b9a7bc5ed64967c6bfbf84bea)
---
 meta/classes/buildhistory.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index fd53e92402..d219519f86 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -599,15 +599,12 @@ buildhistory_list_files_no_owners() {

 buildhistory_list_pkg_files() {
        # Create individual files-in-package for each recipe's package
-       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+       for pkgdir in $pkgdirlist; do
                pkgname=3D$(basename $pkgdir)
                outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
                outfile=3D"$outfolder/files-in-package.txt"
-               # Make sure the output folder exists so we can create the f=
ile
-               if [ ! -d $outfolder ] ; then
-                       bbdebug 2 "Folder $outfolder does not exist, file $=
outfile not created"
-                       continue
-               fi
+               mkdir -p $outfolder
                buildhistory_list_files $pkgdir $outfile fakeroot
        done
 }
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

