Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46BBC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:00:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.93593.1722607219789261476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=gBPgsCML;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.21.41, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qozCiKoQD+sfBAhwLdGW33uafHz2Bd/2YTorcA5c8iqMXBRv+d+tmbb4GpwacF3V/hGlDDDNnRq1yENIsefuLoO/BZi9pfKuSIlQneWFBTUbUb6+7obh8DT2sspQOVtc+PDUjfwr0DZcA+4dfc+KB6SJY6+6WgyBXtNIOUuocc2VktAQT+CLIBw19MdOs+3FWpXsQkMe476dqkuYBbiFM3cY525Zz3TmDqTGza61SvTRDSF2T9qVRX6m3Bn7vEvTvRGWTYhBFDW3kon4qDxiuFixe8gXnb825RzdtwNJardaDqB0iE3aWysPPz4T9TBo7xAhR2WT72sg5aQZYOVsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0jo4ksduLReK69GIwnF6G+JMb8lRX9SI71RdU7JfVQ=;
 b=U7fyNR+yYysZv/C5X50IMThZDiVnn0wmmRrSaI2XR3awxVeV/Hldz4rOF330D7Po6iichSO4xe9Ws3NCKsVGmp9OsE4OM/SWfA84cPqygI7/hY8MkoRFSPF14jtsA95sP0gFc0UwNzoy4TyjeMUSdX2MCW6LocYRh9z8L8Ymy14gvbAE0FrudwMbCct/X7IANBHVPw8kDeSAVXGiyR2PDyVUvE5EKQ25e/yscF5/G+Ggk8asfxyjeXMsyXcXForohXO5uDa+sqDySK1Kkujk/6fF7DyKBzr6CEHphUAAPDux7EWC9YNFPRhMKbHQMgTg3OxJuHsma1YzPNIywfQXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0jo4ksduLReK69GIwnF6G+JMb8lRX9SI71RdU7JfVQ=;
 b=gBPgsCML4v5sCNUnBBFBoKn+3GColTb0fRG07ENmA8myXKQN1fbb+MyIibq4gYm8GNNeQGAIo4J21GbSHnB0vDxPitlccnOWR/Lb2OrP+YyiBSORwPB/vG/PdZ8UgpU0SD3FjiR4HOUwAueH9xVRHen1WfvnC8pZ6CwbmZtGbufeqBonQ1mNMSFaiyy05P6dCOzay5jO7Bb6UhBEKKxbyYINsGibklawq4PDNbEm1mPJWhc5KVqnB2t4haNzUr8p+x0tj2z4Zlh15+o0F3kwGLGbO9/+iwuPAtVNWh0aSm9E/chRaq6VhwdUlUnzk0thR5hU1g7FdOSJvoXrR9QIvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DU4P193MB2518.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:563::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 14:00:16 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 14:00:16 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <pmi183@gmail.com>
Subject: [PATCH 1/2] buildhistory: fix package output folder creation
Date: Fri,  2 Aug 2024 15:00:07 +0100
Message-Id: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|DU4P193MB2518:EE_
X-MS-Office365-Filtering-Correlation-Id: e430429d-0b3c-4bd6-0eda-08dcb2fb6fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hoREN2Uc9VSfs4gy5FDpPc59rE7T1Wa4MdmI6B6LUICQTBZqker91+V/yCvy?=
 =?us-ascii?Q?isjvI4fadnBBRaydF5U0h1EwjRJumsefbL213PhPhD9CmEjCMqBMTKZ/VMYT?=
 =?us-ascii?Q?jn9498zsINRf9Pek+A4EZIVVvqs4v0qKrQSYJB6T0SX/7R+aqlI8tSfyzuqb?=
 =?us-ascii?Q?W/MIpCF4NWi5vbTN+Byg3yLMB0o+VR2thmiqXpeILxItWTDTCOQPAkw5X50h?=
 =?us-ascii?Q?npLoe1rIiPh8ttJvTOTFT+UNUcUtcjEE9ikKyRxxSakJRTcEpdedSvZo3xQk?=
 =?us-ascii?Q?Q0eB0VvOId/FAMb04OLyWvTaS1/UpZjufTziPdd6uAD1UHZbEVi0faKb26hN?=
 =?us-ascii?Q?tgcmc9+Io1tWJrVGIYeH6zFYfqIFifbNxZzEDhrtXduj4Jl1YkvNIL9A1CNY?=
 =?us-ascii?Q?O+x6kYZDd4NTFHkMlg/Lr47V/wr/PiT0q12oMzoTLamT0OkTQP/ZGgwi4eQ9?=
 =?us-ascii?Q?l4OwSH28MLeKK3gCI136BYO91npgX/y0YzZBz60jYRvWgPGh8BDOOAYE5hWU?=
 =?us-ascii?Q?UlQbs8ESs/+kSyoFlbDL5gt+XPxMUhRNAkCt19R0x5jGa5wzzgEKXKMlTlGF?=
 =?us-ascii?Q?NPSC1gkIMKNDcAF4fzl+UtT1UNcKY0T8XwY5/PfBpnFIXsTDcVm8biSQwWRl?=
 =?us-ascii?Q?9Z4x8KAf30yWXm4KNxGLhWQTjIQaNk5+8xQUn4pf3jDtmidOuBFzyLdre1r8?=
 =?us-ascii?Q?uV6pDkFZWbEULv9KANpKupHPmurMhC7XI7YpI6KygJ3e/6ju3XI3a2COH9/B?=
 =?us-ascii?Q?yCPalgih2jaKY7gBU2gxPJe0mbo7sOVi8AEl3ru6zsV7sEHIwZkY4ijjMuI0?=
 =?us-ascii?Q?b796MNQDdH9bOyDOtpcgQaj0Xmw7kveQB2chU0x9CAnk5UN9FV8buEhE7XC2?=
 =?us-ascii?Q?XA4D/cajMU5Ua9R/PdgLOJQyCOt9TXnrJV8M4fZAMGpNUs1QJ/bDpdN3zKjt?=
 =?us-ascii?Q?ciqeHpcLaWXPIinYP3iX0wLSWjNw8FtT98hK37VMRyHeUr834KpB40l2pela?=
 =?us-ascii?Q?su7DmMy9Zn9+50UjKrDrT4pWFviIp+jBtAfYGoYXv4JPpHGNxK2FPXyi9D1C?=
 =?us-ascii?Q?aLUH79EN0x/wQR8HQHSnxbmNbzH8Z0UiRtUv5k2KfVvY6sNdaBXvoUopJ3SK?=
 =?us-ascii?Q?Fimo34mAS3RwGW8no6WQgMZ8hlAcGLQHHQzuSIBXi9464t6eILpcplwvKFz/?=
 =?us-ascii?Q?EbgX1mOhzA0W2dv4Gq6QGsUjt9MQYeIa1AoYWifncjzlOpm57XwWGHrj/P43?=
 =?us-ascii?Q?Hqe9KZ9FDXwe5rGMrBbbRzmasO2cN1e0I+Jz4hCVPh0XmeLhgQLQODt72OxO?=
 =?us-ascii?Q?jWEWoZc/daqR+nrnSumyE8sbHBYI28bRICv1AcIPA2tBfu4jAInxH5V2UaWU?=
 =?us-ascii?Q?hl6rMxXFgD6ni7rkuFAxi5RDModmbuCODpftUd8/3PsWfieGnQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gYKKFcHL0YIk0x3lysCiLtQh0ZpSYjqbELl+nR2h4ZqghEVYF+In+/KL8nI6?=
 =?us-ascii?Q?5p0ZKXMpp9fnOoEIKx8KV18ej2Mu9RkplgoTULtbDOvrxJ7A7Ad1KPjwZ36v?=
 =?us-ascii?Q?ySJmY6VxOhvLVNd/xSH9rc/UwK/lhqEIQmiWkXgtW78k9XvXXvfv9Tem1hlt?=
 =?us-ascii?Q?mvw/b3eBeR/BwqsAYhzLvA7j+U0JxBwEQlH82kYva/8nPzKMCclyMTS6Cd4x?=
 =?us-ascii?Q?rX8vHY8H6CBViw2U0R7r2i8drqETjiY0I5PJ1lR9VPSRCu6ghnreLVyqk/ks?=
 =?us-ascii?Q?guLtqnHWfL/9Sxr4A4LKk8ojRZ2Xjyk2NllLOHuQR5M43ND/S/SGSsJ88CqL?=
 =?us-ascii?Q?J/oLNNqYJ5Icwn9RYcpahNVK8WmfHJ9uRXIpZwit4vV729Q/+48T1Wa92kf5?=
 =?us-ascii?Q?lr77rII7eqM36sAtUEQVHZyLtnW/Vbk/HrgXBvuzAodzG6jI/njId047NcTi?=
 =?us-ascii?Q?PYvdro4+UlI2V0LTiiLmGtwmparGSH/mN3TPHxNgsofG73Xi6DM8Ksqd4vp3?=
 =?us-ascii?Q?xg0mN3kAFe2MI2jfGGXA7DlYVgYZVoVWT84XNMWPKNhWfEt5wFlSgQ2ivAGV?=
 =?us-ascii?Q?AUeq3jFzXbJ3UigvXJge+Aw0GztQ2L9Irk/HA6gePaY6mpFgcxal4Xu5CFw6?=
 =?us-ascii?Q?FWZPwrQeZhTdvmFaQAm/zItcsD/N1kAra7zXalRVPGsoGBiDZXWdHiCavVN/?=
 =?us-ascii?Q?X5IGL7IPL4g4ZD5k7hz6RygNONPsJ1tcf/QhuY4Na6PnrZojguoHMq1hbX+i?=
 =?us-ascii?Q?1VHlW2TL/P/W8zEeETyKV/tk1FsDyhkMuDaonyq5U8VQLfnQQh1qwm176QDO?=
 =?us-ascii?Q?7SutxygjKbOHqCmKUNLmIEzIavjLMxbbFrureoJjISdmXnfFRqhiWBl9eydr?=
 =?us-ascii?Q?SPHeh0qhyOUOfS9H//vvS/Nv0Y++ABgWRMoWuxdrZoiK6drKgIpCvleh57/6?=
 =?us-ascii?Q?yL/MDtYtkM2caOGBwxJoAT6UCLtKM5PItbFL96e444hthIIqf7iT1F/NvNic?=
 =?us-ascii?Q?wM4b/+/sb+ezFnsn+uzN7n7Y6R2OAksLwLQdwssNJBheVpYn1GnHObE3EPeb?=
 =?us-ascii?Q?HiTNK785hX+qUlmqiUJR6idGO+57vsUorDxedN3JPHVmraw73lyyIJThEkUy?=
 =?us-ascii?Q?l7cQ1a+2HYKwnuotw5l+QSp6kElB/W+6t5i9R2CBefth/R6EU0jQn6dzEwg0?=
 =?us-ascii?Q?BSezcIv+HT9iIfpHmp+kMVA7y4e/VE04DiVj0bNSHy5HRNOO58o7KucVahGr?=
 =?us-ascii?Q?i8sqFVVtd79KHB0xWtG5lLHiqm87KBUj0bxJrqQP7Msc6Ijjj965ZcgJOBbE?=
 =?us-ascii?Q?QB06fioe7ssw8BuCoiGLHbYwvj8NhdbHjkE9ji4yTzLDTtQBTgL7+q4WBI2z?=
 =?us-ascii?Q?UpVVY4XCZ/UYgIPgvP2+6Yd6sBDOdnlxMtRXsygBJq7DiY6EC1HiCymtTycF?=
 =?us-ascii?Q?MPA9vkYbUyy8OoRqhpBc/Br8JCHVezCbcs+UeI0asvyUmPL0laOANK5O8h9j?=
 =?us-ascii?Q?T5isaA0bXonzLRsBsWIKTHkDFf6/uaMuTvDWIokRJtx+xq2UC88JNHIOFJr4?=
 =?us-ascii?Q?7Rnif7G0ijXmJz6kMoipQxLSCCt9ADYv82rJVnKBeOWtf6YInjEhfhPkQ8Ch?=
 =?us-ascii?Q?+qEm0e85tTjUGF+rqfFdImI=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e430429d-0b3c-4bd6-0eda-08dcb2fb6fa5
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 14:00:16.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 774+/554FpZ4GEInPHIT0LYWrAPhVD1D8ahwmrn1cjht4K2dwNsm4EXqTi237Swcl1QTDRNbxlawsxJ/ycwOTQPzHnz1YOInfZO86MzLUsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P193MB2518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202911

This fix garantees that output package folder exists on
buildhistory folder to avoid missing files-in-package.txt
creation during task `package` execution.

This issue happens because the output folder is being
created on task `packagedata` before generating `latest` file.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hidding the error on the for loop.

Signed-off-by: Pedro Ferreira <pmi183@gmail.com>
---
 meta/classes/buildhistory.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index c3d049aea3..ad151092c9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -599,15 +599,13 @@ buildhistory_list_files_no_owners() {

 buildhistory_list_pkg_files() {
        # Create individual files-in-package for each recipe's package
-       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+       for pkgdir in $pkgdirlist; do
                pkgname=3D$(basename $pkgdir)
                outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
                outfile=3D"$outfolder/files-in-package.txt"
                # Make sure the output folder exists so we can create the f=
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

