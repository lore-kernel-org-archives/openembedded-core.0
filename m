Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B48C001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:51:57 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.61])
 by mx.groups.io with SMTP id smtpd.web10.81792.1697903516082409865
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uHqvdv7w;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.247.61, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWNam35Xae7dKsyNFyH/x8y09o7KIq+/XGhJUcDeRMiX5+xoRH4Avfw2+keVaFu6qhJG7z1m5Y1eEhCnUvLnWa/r8z2pgVnaLDEkudgwblzQdPIkTmKuaYsGBcWMDZKm58EXI7bHZr5C0aMxZRR4gxHRDyHO5m7d4XSQvAKq/T6vqWyul4JurwGGdX5CsjV0rnWTo2xyhhdfuqgILE5CDJ7YkCIMxKgvuxgrswrMpmicHiG3bunvfm0w+dny4W7Fh7t236/WaUdAnIhQLA4nbX49senR8z+ZFP+zY693BeEvHIa9Ei9x67o2TeuuY5D2ql+9/wwxfdREZCDGgW6wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJByWmyqH8jRsXIaeY07l1jELxY6HwQcX36wiF0XwfM=;
 b=FbcMNnpDiBouqMXAyTZPhK3txK0h8IuM8+Kxd67P/G6buUPlEKprJx0GUvdeYLm+ixsz3S95alAWo36AU0thz+tLgxvHu8uIDq/BRilfVfa2rUrsbtgWk13AhckiDC2wN91/XMPuhpdyZlWCbVaYnrGopQTby5YKO1lZtIvhG84nLSRZcvjjb6tUyaEgdCK7XSzOlooTmPMfSFF78U9nIUQhCodWZd61xcdReefSVazUz4VyIRfV/CeAedK0aO6vlhuQ6fsk4OW58CsnNWDs7MP/1eA98kzJb6ZZQacmuUOjZIuReNka8NtI7nSpRTZfPnYmwlT/0mRb94gJyK5IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJByWmyqH8jRsXIaeY07l1jELxY6HwQcX36wiF0XwfM=;
 b=uHqvdv7w+QfdezMe99s+RK7D8abIjLNfikLpyNL8ZR32OkdAQY0vd+IM5s1G0prg42mrxnhS3j5gzLMQrSsXZeVB1QY2fgtwkY/xlTqF7UeLLYDWtDfM2OOMlccVdyV2iyRyF1+erzkYjZSPSpmUoxlkIdBSQwQATKd9+RTniREw/wOxEGR1TEQFWMYPYni4lXiDcl9a1sHNDXUh5CniXBEFFSKBtY07ByeCE4wiEfa4oNVMnis0e4EfDmhuoVrUHe7ckaXIZVyhY0q8XPlFZRwH5LTB7AS6nBb9sfTgfLfHf3t/jEkJFKMKIUSYB0/y4JWP4WVHxFzcTTsxkZvWLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6892.eurprd06.prod.outlook.com (2603:10a6:102:8a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 15:51:54 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 15:51:54 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv2 3/4] package_rpm.bbclass: Remove unused definitions
Date: Sat, 21 Oct 2023 15:51:13 +0000
Message-ID: <20231021155114.3979864-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021155114.3979864-1-niko.mauno@vaisala.com>
References: <20231021155114.3979864-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6891a3-7176-4e42-eb54-08dbd24da5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uaPQH0jadatQ8yla9Sa4aQzVuUBR99XFmiM5w5Krf+zGNEBgkHgvTea0zqdhqbWXdswsIo4mwqfK04xAPqmKr/ju/jRWhikEOnkWiYuRg+BInKBcBY3rDEI7qr+f3AzMUnesJtTzXG2vod973HtWyd8ljcczLCs8P1P3h+b52JGVjIT4oRBH27W5q6+e5Za4Sn0YsSCID05tloEqxnlWQhswbKn1XEzsLdwnvV9/j7+Ds9oEMW7+U545/nQDvuBHm4BjA02Pb1nGqsRaGCawGepsf0o9VJT8oMWZ42M1xPA/EM3xOEgzWprPMinxow5t27QNGJlQkrxbmLdQy1yd+XP/mi7moxTRZBsQ7FI8cGMqS1Io+h/TNblBM70bl0Uux+MBdaZ2xyYBNLdIiaKVvvGAZ7x3wI8n6HIYUJyjJRRbL1UDxxZBrem9ovrMhaCsUiG8QVe6DU5s2bLF0K9/ZkMrBi/A+lgw8O3yJ527jLy2Z5t9PFMFkR+SDkCiHoY30n+cZnbKB+QQTcragbJeCxTa35aiXRuD0EKEk0yOAwgXXk3GtYri0gDOBk0QN6hoLtpVcsVQ03j8/JOsIsuL2DOG9KsPQE3ahkK6U03IOYVHm0RYvGB3BHVvel4dgQpv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39850400004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(1076003)(107886003)(9686003)(6506007)(6666004)(6512007)(52116002)(26005)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(8676002)(4326008)(2906002)(478600001)(6486002)(66946007)(6916009)(66556008)(316002)(66476007)(86362001)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X7owSCcUaPbpdXaL0tSIvsP/fXZfT9oVJ5EcqmVWHE7zb63D3DL0ieQ7sYPN?=
 =?us-ascii?Q?vrFIYRHt7ZWkn4uDC5r8qKe8uFNMJbsEhTEmBZXyrCPI/LMMyy7Z8urkg/Wy?=
 =?us-ascii?Q?GHZyU/N2J+jlZMA9MP6Vxsl40s7oauOTX0Oh+vPqcRArNK6eDoJ9RWD0eqI3?=
 =?us-ascii?Q?UQRfiVxPVeiFFUd5ByM60gWKTZFJdn9zT90DgSZdMjoPaeB+CZf6k3fyLVii?=
 =?us-ascii?Q?eRFisvyVWgwS+qDG5klCz0DVi4fJrhIAJXYnSUd2v/HXNOfKfD4OIAFfqk0Z?=
 =?us-ascii?Q?+Rnf3DnPKPj0/WRYhx5PqpbSNPtYtAGpM7VFl74N1qxCRMGClDlEiqJwvz4C?=
 =?us-ascii?Q?GUdYZ6A7GJBT9DLYA0tkmGWdd7Wn/SaLozZjtaJ67XS1JIyiHGdEQ2Pe/7Jz?=
 =?us-ascii?Q?pKYDnBugsFnKmz6CMtHT+eUbdXL8ZsIqr5V5mOrQ4X4B2J6Wf1DXLBd9DD7I?=
 =?us-ascii?Q?0Zu+BKHTJL6jJEA0ILY3+3BxxyKQopXeL9S0z7vIYQoTSTFB5pQV+QZjQqw1?=
 =?us-ascii?Q?Ap+m8TjyZIc8v1Dib8hsM9/1N4z5M2kR20hhNBxt15MzZgzCFSFRvEgcIJNs?=
 =?us-ascii?Q?60kADj9DrcbHG8TomoFSqZ1FrDxnBHIDEiLzucA70fB51b9lC8YKHpX+GuLV?=
 =?us-ascii?Q?Zs4Jejhw/0PTrc4kO1iDRwp1/ku/6XvDlpt2HY2R3MB58rH8zZVea0yyW+mC?=
 =?us-ascii?Q?DCJyzU320PLrU2P/HE0XS5SGrHwYqneTrA4mrUI+6wRFvYs5KZPwInL6gSLw?=
 =?us-ascii?Q?iC3TC2NFn/a12LM8LkgdFuxJrTrn5qoTURSgTOtqVijZqomMf/v9ZX/jPBHf?=
 =?us-ascii?Q?lPpYfFfpQbOg26tBo96lKK9ykyfVTL+pA5UAlBIlfDKIsP5Xihtef5s3JoyG?=
 =?us-ascii?Q?msd5E7w0UBTL9S8bGStVcTos85Vf/uanslL99QF81CQHJ1HM8F/pctJmorpB?=
 =?us-ascii?Q?YJe8iZUAGi9ycFtEKQJcylja8r90lqLlGy2x/lJ8K6E0+LBnNsEkZOyTXCbl?=
 =?us-ascii?Q?oIErSLasfw6U6TJUV8YqVU9YXQMPsNXAtmqa0nu/Hll4Rdesrpyez+y6PmgY?=
 =?us-ascii?Q?1OSx9/lK4Km4tBInakdPeOu44KYOGM6oZCFlwjcqGYNZYnUYU5oLifjERu1q?=
 =?us-ascii?Q?Dusc5OblxrwqUDly0H9+O3bQmuHSWfxQoRbKRbJ9EjcpC93RsoLiPLKsY1IJ?=
 =?us-ascii?Q?KR6nIJNb+lLvJrchpFb4eSjxIb40gU2NFTVm/WPiGtbg9SzXOzUsxASs7+2e?=
 =?us-ascii?Q?8jfFOViuNhCtd1UNG74c/5ZRUmPdFm0lP04TuTki0HcLz3JdHdP2DUEtCRc/?=
 =?us-ascii?Q?+7Bhop+PEe5keqcmF6jp/8T0KpNfY1dQcce2cg8WEega6QrznMk9T4etnd7b?=
 =?us-ascii?Q?lXMkKTR74JS3Xhtp903VLBkYRuz5tLO+3BDph6YW5ZEebX0OWXG7P9nRcYlJ?=
 =?us-ascii?Q?jUsWrlKD3rL4UEkRILUSX3Fm+9ch7ErQIQOHBylmVzURBIl1UkXQvRCrqeZt?=
 =?us-ascii?Q?4gJJZNHH60AoJDk4shjV7cFOHsKyMrtEXTTv3oDfkNS4H/eK6Dy6m/zisMOS?=
 =?us-ascii?Q?B1psWPuUKhwix5DqZtut2KrV4dtaLA5GHkJrehTIubMkofOCDxOkC5yHujSL?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6891a3-7176-4e42-eb54-08dbd24da5d9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 15:51:54.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/oI7CWXN/u8mGUha3CwtpWC6u6aSudry7jT1a4WtgjoPNDALpKVIkXNsTgDNbYMJAhKKANHoKCyOY01l3yHkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189596

From: Niko Mauno <niko.mauno@vaisala.com>

Some local variables defined in do_package_rpm() are not referenced, so
remove such dead code lines.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 402fa5c4e8..246106ea4f 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -633,7 +633,6 @@ python do_package_rpm () {
     workdir =3D d.getVar('WORKDIR')
     tmpdir =3D d.getVar('TMPDIR')
     pkgd =3D d.getVar('PKGD')
-    pkgdest =3D d.getVar('PKGDEST')
     if not workdir or not pkgd or not tmpdir:
         bb.error("Variables incorrectly set, unable to package")
         return
@@ -660,8 +659,6 @@ python do_package_rpm () {
=20
     # Setup the rpmbuild arguments...
     rpmbuild =3D d.getVar('RPMBUILD')
-    targetsys =3D d.getVar('TARGET_SYS')
-    targetvendor =3D d.getVar('HOST_VENDOR')
=20
     # Too many places in dnf stack assume that arch-independent packages a=
re "noarch".
     # Let's not fight against this.
@@ -669,7 +666,6 @@ python do_package_rpm () {
     if package_arch =3D=3D "all":
         package_arch =3D "noarch"
=20
-    sdkpkgsuffix =3D (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-"=
, "_")
     d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir =3D d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
--=20
2.39.2


