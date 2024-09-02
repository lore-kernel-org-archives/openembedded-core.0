Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6216ACA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:32:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.35607.1725273122732170815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=ANaVP9hZ;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.84, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS6ZGPjAarg4LjoVtmTQPo2McLesIq38vqwXxCsTiu4jJaz+ziH22ADlgpC3G61VxbLUiWdTL209g/NrRd3JKB9bF0muyTUOXfvpiJVxbh88Yjv43+zSTXE86k7RSHlo1or9s/f3zaAt4wMzEPhU8Yz+7CkZ9d4AoFv+4rc4nZJO+V94Z6KRgdrYHRdwORQv4ure/qAZW/343UUZDddst+H5zH81YkIchBc970UyS6AnYV9OKZ2ZqjAwqRDWRIBZ6tHQSNZM66BZRFyezchxefsxfHEDoKD+MQVqsAZ9OVf8I2jxn04HjeIWRespSQY7bbYkqMmY8faRgLHK9oSxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLnII5IsY1lZXJLQn+C8rhgwjVC8LF9iz3DVNMDMcbk=;
 b=jfxSJOyQgLWRg/iBf1ybEj1bjqJSiUpm6AGUSqUc4kQMzVCigLgbKT9KnsKvAvzBbpMU6u394haaUAq+f6SKFd51v7rMkD7/F/26JJqcafjPUvqOhTODhyqnol2HYeWJdAPU/pC31UKBHIExRSTyiZwt+ndak84tZDDh15HbOwHpTIIXNE/PPV1HBsIiGsNPNAfXh4q9CRxnBc/1cQ9yoD8l2JHBeQCo4gN13cz39o1/0Sb9FDG8Sotx7ECbFhaSmRyByL/ExhyCtQ3cNPW7D8+Rd6PzN8K3zrsOedtA2PixbTKjQKladDO6qQdKSwbUQT3BiJHeusXDnMi2OXf9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLnII5IsY1lZXJLQn+C8rhgwjVC8LF9iz3DVNMDMcbk=;
 b=ANaVP9hZ8MJg5zEv7ddzKNYAUZehOqcU8Sm7yNksyGEk9/PirWG6di8lfazRaELQhBLxMzg/2ZXvg44W2fgzXJEc0GavE38RL8rMzna2089TO8K5ToiY85J5FOyWXIXTm/3v7cqhMRgmjryY5QxxkrWQhuRWy/EgqsC6vxa2p4NpNvoM4fqi35O+sRqNh3AmEjsUI/OYuKSnFqYslYMu4q3M4DB331llmQE3UP0fff0MteHGQKCtcsTJyk2Lc8zjeSBTTJaiuYB6GbhekYMg++A7X4jGnwJVIvKau7UqReAKF8ouWDY6KRZ/qfFZFalAdjw7WymaecAhDFCYGJBXDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by DBAP193MB0890.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:31:56 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:31:56 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/4] buildhistory: Fix intermittent package file list creation
Date: Mon,  2 Sep 2024 11:31:45 +0100
Message-Id: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0502.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::27) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|DBAP193MB0890:EE_
X-MS-Office365-Filtering-Correlation-Id: 449eb939-f422-4216-47a1-08dccb3a7807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NZAgf+nmQvZDn/dZkpGA0ujckt/79LRG7IQWRX3Pq52P3x02A8yv4v6EijVT?=
 =?us-ascii?Q?tZqJEE0xNY/jDl4AR2JW/nxAXt7ZFXC39aCWU67r1qctMUyV8y/KHuD10nee?=
 =?us-ascii?Q?RPSNJebWHsyTRgOMrLzhDQpce/O5/zJUWA1O4XIX/v71a06+LYcS4AZls5py?=
 =?us-ascii?Q?OZWcLCYGO6/nSwINF6vQ7NSZuTMxWGylnNMtBMJaBd372ScVjl0OhBdFAGGp?=
 =?us-ascii?Q?rwfhk4eH3DlAAjCl8b2M5J+UzhscNSSjlr/K39Hmc4SoyRaooWqDd9AQEKxU?=
 =?us-ascii?Q?ufPNdEDklHRuo38hifcweonFsh/q+9pzEWkHKwndgwsg5Cz/tcBC0w4rwIks?=
 =?us-ascii?Q?9WgLBz002xWWVDq6sija8DLaC7jtL4hRnt7CjaKs2jRg1YK6OPcQWXT/PNg/?=
 =?us-ascii?Q?81MHzb12gIrve1VRVGAF86YqrPHbAbvyEMHiEDnvU0WvmcVQ9VPPlrsQCsHQ?=
 =?us-ascii?Q?GO3PNvXmsqyqJ1VGRihhPkWPD7dajUvQk76AyNcC+HmfBaHwfBm0FmXu37OX?=
 =?us-ascii?Q?RO5ukEbjC17jaG41IBBK25pkm3C2Mub/FZIz2ZhuvwN3+1fPhH/y+P4ghP32?=
 =?us-ascii?Q?UAxyQCqRvAfPA24PdNZZrLtzjd7D0XxZjExIPRv6z+tTvLHo3jgoK+qoFRer?=
 =?us-ascii?Q?KDscYWVh4yn31aa9hkn0VzYXw2N0wR2pXoW3ZdWtaDgYNkl0ttYt2najTeSV?=
 =?us-ascii?Q?WGBozNFeK6NC5+VZm1wRegu8LyfNCyZsFH37V86QW+G0cbjQdajZAZUWdarf?=
 =?us-ascii?Q?pXP8fONJ65tj9IgHwd18XwgE5VkS9pgowtiHSXpTjrP+zbkDRO0LMWqH2P/C?=
 =?us-ascii?Q?GxD5z5bewYcrsJkiW9pbT4z6dn7WTC7jWXOhP4Zi27niYb3gp/o82tQ1OFt4?=
 =?us-ascii?Q?ypU146GCbLjC51qiQKJVHMfmXmpMvluHS6ahsEv8dEhnj8/CFDDzTIiQALIx?=
 =?us-ascii?Q?fGnszEj6vy6fMbonP7n+OH2KxQKYGRNeGmMSsHPR4V8yrIoMspRF68fU8/2/?=
 =?us-ascii?Q?H8KFkOZ2m+56AOE8ZMGU+IJGEumTEGQpHcuNUSSKM2J5jLdV542AeyTXS5k+?=
 =?us-ascii?Q?xRE9NNrcklM7XQuwPn2JR6KHQdtS59cT3/DrsQGyXcRRXHuw0q8ANGWoPe1H?=
 =?us-ascii?Q?4dV/tjJdiGoT0R9zPjIEVqdZAHXRJdhv7Z04Ssvli6qKNHrD9Y+ntAEVS2Pr?=
 =?us-ascii?Q?lwYpyw29Ai1b5EjrIVOLwuGUAvtx+PDBRrbEy3U1GN7xvIGYhIkcBagYcnka?=
 =?us-ascii?Q?1U/LsZrKGBO3P9WkIGOsvyV1ybbxLB/BcjtYWhmCZcJ4kJ4sAkq2nGc+hUU1?=
 =?us-ascii?Q?F5TxfTynyXg1zqMXO6QJNiQwFGupR8z6MqpIOb7JQxMO1m2zI7tzucrTYTa9?=
 =?us-ascii?Q?RZEtXigmEH8bAzqNHx5kY3uRUVUOd7YyrSsZRaGHS7fe4o1Tdg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OWPDj4pwDj7zzWJlgD3idETtAZyk+uPO3QmP5USJ1BTG1wpTlFz68MCZmiep?=
 =?us-ascii?Q?3mSnwi8Mf3M0C8kypmqIdU92Yqe17rU1OPDdujeZ1IdCL6LIKYsUaxlqPobm?=
 =?us-ascii?Q?Rg4/nqQEXpmTEPK7kL++PmPX+BOO2ae0KMJc4mXx4at7vZBpYQ+DzqBGUFoz?=
 =?us-ascii?Q?r4lX4ejpmOkLGccvJQuts1SYr07zMeFKNzIzSdx4seRGmsVlWDyNpN14E4hx?=
 =?us-ascii?Q?ieQxkUzkOd1rluEH6G2pQpQOfra6cmdA7wUqGQ/IZ41kErnTTMabjRNdOToO?=
 =?us-ascii?Q?+fKU5XXrzjkq/gbEnEXelG7vO8kpqaTCJO9FmXLhQhL6VSpJyWbcpm9NIxyB?=
 =?us-ascii?Q?4GJi7vyaH6J8rGUNPR0XdE1BhvvvnILzi68jD0sUhzfRtcwVJWmoqYrwejET?=
 =?us-ascii?Q?AibWk/p72uZbNcQ6MeL9mR9Lh6yM+FL6eBW8vhlRSrE7eTqbUzDudweYSlL3?=
 =?us-ascii?Q?y+E6hxlOLuvJz6SeW/4la5ziDEng+M/k/Th9dYGw5pwRyi6fyG94155LLRVD?=
 =?us-ascii?Q?Oh/0mzFER5j5uo2ia1A8mAx8mA5mwppWU6J7dZCUM4FNe5900dHMVmUcA6Zg?=
 =?us-ascii?Q?4RoQp31vA9TLJJVPg8W8azfH3XA6rCORnR6/0zxmXM5YzosEguyycC9bOOBw?=
 =?us-ascii?Q?VTW/qL9DJtycocQbrpZTYCCoRDm1khwFLOHtrGtFFOTVg3Jktd5Lum3oAoPs?=
 =?us-ascii?Q?oM0pRezmwzgmQTk2bjF5qJMOTLXfBNTUI4qI35ZlbQd8pmDQbhDSs8Xg/L7l?=
 =?us-ascii?Q?f4DKI4bRr3oDncRyyBkiN1AAbQX1CfibBGEp2NYM1rf7/uXfWsaKUgoyzSO1?=
 =?us-ascii?Q?SazxFc/cYyFD+szXHJcqW5mCER5+jDPCjrEDV7QoeLxN4I4oSYiaQsqeUUUF?=
 =?us-ascii?Q?HmHV5dPRsMeXoWpJNLsecHVMeCNqcZGElirUlJjibbJ35muCQcRw0fDXYNkv?=
 =?us-ascii?Q?6Qi7aW5mINo5ViA+XQ4uwK7YYm3k2y8V1zVWeDWZLN1WkELIBXYsDlfVyYZ3?=
 =?us-ascii?Q?3WyW6q8ioM8+l8cPiZ9OiX0vimJh8gDmSs1QiqzPj4Z21DRh8bYcHzxJH1fx?=
 =?us-ascii?Q?CXAK/Mu5E7OQD7fnlE50K3A/lF04ROUpsn6y+YRpp+FKfQz8k3lhIIJGXAE2?=
 =?us-ascii?Q?f24xUYOUh1INnMzs3mAzR/xABJC6b7/cTDPALiYo+Tj+Ok4IuJdy9GiBRYeP?=
 =?us-ascii?Q?6pt3hezDXSf+G4GAxgqG67lHQLySAIfmtmUDioQgQZbfaclV2gaLnG/cKJmF?=
 =?us-ascii?Q?ww/7869Chr16mOUfS4n5ZCsjNGYc+CEeLd/FESL/qohdPAiUEP2TZytv2Fzz?=
 =?us-ascii?Q?Wq/2oQ8JXIYgpHLhuoZ2PSxWV7rBxdOX0Bat3pmkiH35B0/vprsUXS38K3sm?=
 =?us-ascii?Q?lj+MD8ShBj0Q0lvM06uYNC1oXmmB0GTB72nD2IgKK1u0KELGV90FKH+zgGTy?=
 =?us-ascii?Q?Mxq0eBvczoJMccw7C2xT8uAkdus9G3sR5X0YB0VTS1DxBg25nJe9jh+mhSG3?=
 =?us-ascii?Q?L4rBl+bjIgUEW9/6f5MmIxCwuW+4mNHA1PCRjE0wZZO9VmlDf7Hq4dAq/pk5?=
 =?us-ascii?Q?SlbQ6vAw8QsM2EEKDuzqIjPnDFK0UKvRzRjcJVBtn9QWmRl9Z73PFdC0s/ZB?=
 =?us-ascii?Q?y2RmOuSNLzNxO6MKxTlpj+w=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449eb939-f422-4216-47a1-08dccb3a7807
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:31:56.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU5Ep4Vmh20iI68jEoVrfg2wh5dxcww0Cz8nVVgvZm3uWbvWPzxUZfphub6QSw4w5MHUH53D4hCCsc/Rcuq/kKe6GlY3v2+4Yyughc2Lv6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204080

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

